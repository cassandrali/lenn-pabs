jQuery(document).ready(function($) {
    var cartWrapper = $('.cd-cart-container');
    //product id - you don't need a counter in your real project but you can use your real product id
    var productId = 0;
    var puppy1 = "https://i.pinimg.com/736x/c6/4c/e0/c64ce05bf01ccb3ea8af44de5980cbe4--teacup-maltipoo-maltipoo-puppies.jpg"
    var puppy2 = "https://i.ytimg.com/vi/VRiWE1l8KqI/maxresdefault.jpg"
    var puppy3 = "https://www.9to5animations.com/wp-content/uploads/2017/03/cute-white-puppy-hd-images.jpg"
    var puppy4 = "http://www.petguide.com/wp-content/uploads/2017/04/cute-puppy-breeds-lab.jpg"
    var puppy5 = "https://i1.wp.com/dogbreedidentifier.com/wp-content/uploads/2014/09/corgi-puppy.jpg?resize=640%2C512&ssl=1"
    var puppy6 = "http://www.lifewithdogs.tv/wp-content/uploads/2014/03/3.21.14-National-Puppy-Day25.jpg"
    var puppy7 = "https://i.pinimg.com/originals/cb/52/0c/cb520c3cd0ce68c0fcc6e30302dd7ea0.jpg"
    var puppy8 = "http://i4.mirror.co.uk/incoming/article2946980.ece/ALTERNATES/s810/Cutest-puppy-ever.jpg"
    var puppy9 = "https://scontent-iad3-1.cdninstagram.com/t51.2885-15/e35/20969260_872650246222531_2062321077949825024_n.jpg"
    var puppies = new Array(puppy1, puppy2, puppy3, puppy4, puppy5, puppy6, puppy7, puppy8, puppy9);

    if (cartWrapper.length > 0) {
        //store jQuery objects
        var cartBody = cartWrapper.find('.body')
        var cartList = cartBody.find('ul').eq(0);
        var cartTotal = cartWrapper.find('.checkout').find('span');
        var cartTrigger = cartWrapper.children('.cd-cart-trigger');
        var cartCount = cartTrigger.children('.count')
        var addToCartBtn = $('.cd-add-to-cart');
        var undo = cartWrapper.find('.undo');
        var undoTimeoutId;

        //add product to cart
        addToCartBtn.on('click', function(event) {
            event.preventDefault();
            addToCart($(this));
        });

        //open/close cart
        cartTrigger.on('click', function(event) {
            event.preventDefault();
            toggleCart();
        });

        //close cart when clicking on the .cd-cart-container::before (bg layer)
        cartWrapper.on('click', function(event) {
            if ($(event.target).is($(this))) toggleCart(true);
        });

        //delete an item from the cart
        cartList.on('click', '.delete-item', function(event) {
            event.preventDefault();
            removeProduct($(event.target).parents('.product'));
        });

        //update item quantity
        cartList.on('change', 'select', function(event) {
            quickUpdateCart();
        });

        //reinsert item deleted from the cart
        undo.on('click', 'a', function(event) {
            clearInterval(undoTimeoutId);
            event.preventDefault();
            cartList.find('.deleted').addClass('undo-deleted').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function() {
                $(this).off('webkitAnimationEnd oanimationend msAnimationEnd animationend').removeClass('deleted undo-deleted').removeAttr('style');
                quickUpdateCart();
            });
            undo.removeClass('visible');
        });
    }

    function toggleCart(bool) {
        var cartIsOpen = (typeof bool === 'undefined') ? cartWrapper.hasClass('cart-open') : bool;

        if (cartIsOpen) {
            cartWrapper.removeClass('cart-open');
            //reset undo
            clearInterval(undoTimeoutId);
            undo.removeClass('visible');
            cartList.find('.deleted').remove();

            setTimeout(function() {
                cartBody.scrollTop(0);
                //check if cart empty to hide it
                if (Number(cartCount.find('li').eq(0).text()) == 0) cartWrapper.addClass('empty');
            }, 500);
        } else {
            cartWrapper.addClass('cart-open');
        }
    }

    function addToCart(trigger) {
        var cartIsEmpty = cartWrapper.hasClass('empty');
        //update cart product list
        addProduct();
        //update number of items 
        updateCartCount(cartIsEmpty);
        //update total price
        updateCartTotal(trigger.data('price'), true);
        //show cart
        cartWrapper.removeClass('empty');
    }

    function addProduct() {
    	var random = Math.floor(Math.random() * puppies.length);
    	var url = puppies[random];
        //this is just a product placeholder
        //you should insert an item with the selected product info
        //replace productId, productName, price and url with your real product info
        ///productId = productId + 1;
        /*$("#dog").attr("src",url);*/
        var productAdded = $('<li class="product"><div class="product-image"><a href="#0"><img id="dog" src="https://i.pinimg.com/736x/c6/4c/e0/c64ce05bf01ccb3ea8af44de5980cbe4--teacup-maltipoo-maltipoo-puppies.jpg" alt="placeholder"></a></div><div class="product-details"><h3><a href="#0">one smol boy</a></h3><span class="price">$25.99</span><div class="actions"><a href="#0" class="delete-item">Delete</a><div class="quantity"><label for="cd-product-' + productId + '">Qty</label><span class="select"><select id="cd-product-' + productId + '" name="quantity"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select></span></div></div></div></li>');
        $("#dog").attr("src",url);
        cartList.prepend(productAdded);
    }

    function removeProduct(product) {
        clearInterval(undoTimeoutId);
        cartList.find('.deleted').remove();

        var topPosition = product.offset().top - cartBody.children('ul').offset().top,
            productQuantity = Number(product.find('.quantity').find('select').val()),
            productTotPrice = Number(product.find('.price').text().replace('$', '')) * productQuantity;

        product.css('top', topPosition + 'px').addClass('deleted');

        //update items count + total price
        updateCartTotal(productTotPrice, false);
        updateCartCount(true, -productQuantity);
        undo.addClass('visible');

        //wait 8sec before completely remove the item
        undoTimeoutId = setTimeout(function() {
            undo.removeClass('visible');
            cartList.find('.deleted').remove();
        }, 8000);
    }

    function quickUpdateCart() {
        var quantity = 0;
        var price = 0;

        cartList.children('li:not(.deleted)').each(function() {
            var singleQuantity = Number($(this).find('select').val());
            quantity = quantity + singleQuantity;
            price = price + singleQuantity * Number($(this).find('.price').text().replace('$', ''));
        });

        cartTotal.text(price.toFixed(2));
        cartCount.find('li').eq(0).text(quantity);
        cartCount.find('li').eq(1).text(quantity + 1);
    }

    function updateCartCount(emptyCart, quantity) {
        if (typeof quantity === 'undefined') {
            var actual = Number(cartCount.find('li').eq(0).text()) + 1;
            var next = actual + 1;

            if (emptyCart) {
                cartCount.find('li').eq(0).text(actual);
                cartCount.find('li').eq(1).text(next);
            } else {
                cartCount.addClass('update-count');

                setTimeout(function() {
                    cartCount.find('li').eq(0).text(actual);
                }, 150);

                setTimeout(function() {
                    cartCount.removeClass('update-count');
                }, 200);

                setTimeout(function() {
                    cartCount.find('li').eq(1).text(next);
                }, 230);
            }
        } else {
            var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
            var next = actual + 1;

            cartCount.find('li').eq(0).text(actual);
            cartCount.find('li').eq(1).text(next);
        }
    }

    function updateCartTotal(price, bool) {
        bool ? cartTotal.text((Number(cartTotal.text()) + Number(price)).toFixed(2)) : cartTotal.text((Number(cartTotal.text()) - Number(price)).toFixed(2));
    }
});