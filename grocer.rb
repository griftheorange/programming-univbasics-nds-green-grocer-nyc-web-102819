def find_item_by_name_in_collection(name, collection)
  collection.each{ |item|
    if item[:item] == name
      return item
    end
  }
  nil
end

def consolidate_cart(cart)
  item_names = []
  item_count_hash = {}
  cart.each{ |item|
    item_names.append(item[:item])
  }
  item_names_uniq = item_names.uniq
  item_names_uniq.length.times { |i|
    item_count_hash[item_names_uniq[i]] = item_names.count(item_names_uniq[i])
  }
  
  consolidated_cart = []
  item_names_uniq.length.times { |i|
    hash = find_item_by_name_in_collection(item_names_uniq[i], cart)
    hash[:count] = item_count_hash[item_names_uniq[i]]
    consolidated_cart.append(hash)
  }
  
  consolidated_cart
end

def apply_coupons(cart, coupons)
  coupon_applied_cart = cart
  cart.length.times { |i|
    coupons.length.times { |j|
      if cart[i][:item] == coupon[j][:item] && coupon[j][:num] >= cart[i][:count]
        coupon_applied_cart[i][:count] -= coupon[j][:num]
        coupon_applied_cart.append({
          :item => "#{cart[i][:item]} W/ COUPON",
          :price => (coupon[j][:cost])/(coupon[j][:num]),
          :clearance => cart[i][:clearance]
        })
      end
    }
  }
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
