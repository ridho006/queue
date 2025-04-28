class Queue {
  Map<int, int> elements = {};
  int front = 0;
  int rear = 0;
  int maxQueue = 0;

  void QueueOperation(int max) {
    front = 0;
    rear = -1;
    elements = {};
    maxQueue = max - 1;
  }

  bool isEmpty() {
    return rear == -1 && front == 0;
  }

  bool isFull() {
    return rear == maxQueue - 1;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      rear += 1;
      elements[rear] = data;
    }
  }

  int dequeue2() {
    int data = 0;
    if (isEmpty()) {
      print('queue underflow atau data kosong');
    } else {
      data = elements[front]!;
      for (int i = front; i < rear; i++) {
        elements[i] = elements[i + 1]!;
      }
      elements.remove(rear); // Hapus elemen terakhir yang sudah dipindahkan
      rear--;
      if (rear < 0) {
        front = -1;
        rear = -1;
      }
    }
    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
      print("Menampilkan urutan dari posisi tertinggi");
      for (int i = rear; i > -1; i--) {
        print("Elemen ke-$i = ${elements[i]}");
      }
    } else {
      print("Queue masih kosong");
    }
  }
}

void main() {
  Queue q = Queue();
  q.QueueOperation(100);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.printQueue();
  q.dequeue2();
  q.printQueue();
}