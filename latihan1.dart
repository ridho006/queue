class CircularQueue {
  late List<int> array;
  late int front;
  late int rear;
  late int size;
  late int capacity;

  CircularQueue(int capacity) {
    this.capacity = capacity;
    array = List<int>.filled(capacity, 0);
    front = rear = -1;
    size = 0;
  }

  bool isEmpty() {
    return size == 0;
  }

  bool isFull() {
    return size == capacity;
  }

  void enqueue(int item) {
    if (isFull()) {
      print('Queue is full, cannot enqueue $item');
      return;
    }
    if (isEmpty()) {
      front = rear = 0;
    } else {
      rear = (rear + 1) % capacity;
    }
    array[rear] = item;
    size++;
    print('$item enqueued to queue');
  }

  int dequeue() {
    if (isEmpty()) {
      print('Queue is empty, cannot dequeue');
      return -1;
    }
    int item = array[front];
    if (front == rear) {
      front = rear = -1;
    } else {
      front = (front + 1) % capacity;
    }
    size--;
    return item;
  }

  int frontElement() {
    if (isEmpty()) {
      print('Queue is empty');
      return -1;
    }
    return array[front];
  }
  
  int rearElement() {
    if (isEmpty()) {
      print('Queue is empty');
      return -1;
    }
    return array[rear];
  }
}
void main() {
  CircularQueue q = CircularQueue(5);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40); 
  print('Front item is ${q.frontElement()}');
  print('Rear item is ${q.rearElement()}');
  print('${q.dequeue()} dequeued from queue');
  print('${q.dequeue()} dequeued from queue');
  print('Front item is ${q.frontElement()}');
}