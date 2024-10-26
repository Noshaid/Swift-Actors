# Swift-Actors


Swift actors are a new concurrency feature introduced in Swift 5.5 that provide a safe and efficient way to manage shared mutable state. Actors are a type of object that can be accessed concurrently from multiple threads, but ensure that access to their mutable state is serialized and thread-safe.

Concurrent programming in Swift has been achieved using locks, semaphores etc. While these mechanisms can be effective, they are prone to problems such as deadlocks and race conditions.

## Some of the key benefits of actors include:

### Safe and predictable concurrency: 
Actors provide a thread-safe and predictable way to manage shared mutable state. By using actors, developers can avoid many of the common concurrency pitfalls such as race conditions and deadlocks.

### Performance: 
Actors are designed to be highly efficient and can provide excellent performance in multi-threaded applications. They are optimized for low-overhead communication between threads, making them ideal for high-performance applications.

### Code clarity: 
By encapsulating shared mutable state within actors, the code becomes easier to understand and maintain. Actors provide a clear separation of concerns between threads, making it easier to reason about concurrent behavior.


## Example:
In this example, we define a `BankAccount` actor that has a mutable balance property. The actor provides two methods: `deposit` and `withdraw`, which modify the balance property in a thread-safe manner. We then define a `transfer` function that transfers money from one account to another using the withdraw and deposit methods. Finally, we create two tasks that transfer money between the two accounts and print a message when the transfer is complete.

Note that the transfer function uses the `await` keyword to suspend execution until the withdraw method returns. This ensures that the deposit method is not called until the withdrawal is complete, even if the tasks executing the two methods are running concurrently on different threads.


