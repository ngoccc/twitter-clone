class Element
	attr_reader :x, :y, :dist
	attr_accessor :prev

	def initialize(x, y, dist, prev)
		@x = x
		@y = y
		@dist = dist
		@prev = prev
	end

	def get_x
		x
	end

	def get_y
		y
	end

	def get_dist
		dist
	end

	def isInside(x, y)
		x < 8 and y < 8
	end
end

def put_result(ele)
	puts "You made it in #{ele.get_dist} moves! Here's your path: "
	result_list = []
	loop do
		result_list << [ele.get_x, ele.get_y]
		ele = ele.prev
		break if ele.nil?
	end
	print result_list.reverse
end

def knight_moves(from, to)
	queue = Queue.new
	
	dx = [-1, 1, -2, 2, -2, 2, -1, 1]
	dy = [-2, -2, -1, -1, 1, 1, 2, 2]

	visited = Array.new(8) { Array.new(8) { false } } 
	visited[from[0]][from[1]] = true
	queue.push(Element.new(from[0], from[1], 0, nil))
	while (!queue.empty?)
		ele = queue.pop
		if ele.get_x == to[0] and ele.get_y == to[1]
			return put_result(ele)
		end
		# check all the reachables
		(0..7).each do |i|
			x = ele.get_x + dx[i]
			y = ele.get_y + dy[i]
			dist = ele.get_dist + 1
			curr = Element.new(x, y, dist, ele)
			if curr.isInside(x, y) and !(visited[x][y])
				visited[x][y] = true
				queue.push(curr)
			end
		end
	end
end

knight_moves([3,3],[4,3])