class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


class LinkedList
  attr_accessor :head#, :tail

  def initialize
    @head = nil
#    @tail = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      curr = @head
      curr = curr.next_node while curr.next_node != nil
      curr.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0
    if @head != nil
      curr = @head
      count = 1
      while curr.next_node != nil
        count += 1
        curr = curr.next_node
      end
    end
    count
  end

  def tail
    if @head == nil
      nil
    else
      curr = @head
      curr = curr.next_node while curr.next_node != nil
      curr
      #Or just self.at(self.size - 1)
    end
  end

  def at(index)
    i = 0
    curr = @head
    until i == index
      curr = curr.next_node
      i += 1
    end
    curr
  end

  def pop
    if self.size > 1
      self.at(self.size - 2).next_node = nil
    elsif self.size == 1
      self.head = nil
    end
  end

  def contains?(i)
    curr = @head
    response = false
    while curr != nil
      if curr.value == i
        response = true
        break
      else
        curr = curr.next_node
      end
    end
    response
  end

  def find(data)
  curr = @head
  i = 0
  response = nil
  while curr != nil
   if curr.value == data
     response = i
     break
   else
     curr = curr.next_node
     i += 1
   end
  end
  response
  end

  def to_s
    str, curr = "", @head
    while curr != nil
      str += "( #{curr.value} ) -> "
      curr = curr.next_node
    end
    return str += "nil"
  end

  def insert_at(i, data)
    if i == 0
      self.prepend(data)
    else
      self.at(i - 1).next_node = Node.new(data, self.at(i))
    end
  end

  def remove_at(i)
    if i == self.size - 1
      self.pop
    elsif i == 0
      @head = self.at(1)
    else
      self.at(i - 1).next_node = self.at(i + 1)
    end
  end
  

end
