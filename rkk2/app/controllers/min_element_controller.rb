# frozen_string_literal: true

class MinElementController < ApplicationController
    def index
      @arr_q = (params[:arr_q] || '3, -5, 1, 8, -12, 9, -6, 4, 0, -7').split(',').map(&:to_i)
      last_negative_index = nil
  
      @arr_q.reverse_each.with_index do |x, index|
        if x.negative? && (x % 3).zero?
          last_negative_index = @arr_q.length - 1 - index
          break
        end
      end
  
      if last_negative_index.nil?
        @result = 'No negative element divisible by 3 found.'
      else
        @min_element = @arr_q.min
        @arr_q[last_negative_index] = @min_element
        @result = "Minimum element #{@min_element} placed at index #{last_negative_index}."
      end
    end
  end