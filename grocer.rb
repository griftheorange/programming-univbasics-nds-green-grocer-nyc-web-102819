def find_item_by_name_in_collection(name, collection)
  collection.each{ |item|
    if item[:item] == name
      return item
    end
  }
  nil
end

def consolidate_cart(cart)
  item_names = {}
  cart.length.times { |i|
    if item_names[cart[i][:item]]
      item_names[cart[i][:item]] += 1
    else
      item_names[cart[i][:item]] = {
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
    end
  }
  puts item_names
  item_names
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
