```ASCII
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   _  _   __   ___  ___       _____
  ||\/|| //_  //_  //_   __  //  //    messQ v0.0.1
  ||  || \\_  __// __//     //__//\\_  simplistic socket mess Queue

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ~=ABK=~ http://github.com/abhishekkr
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
```
*  a very simplistic socket-based message enQueue/deQueue facility

***

### HOW TO USE

```SHELL
  messQ --start
  messQ --stop
  messQ -enq element || messq --enqueue element || MessQ::Agent.enqueue(elelemnt)
  messQ -deq || messq --dequeue || MessQ::Agent.dequeue
```

* To enqueue a message
  >  open a connection to it (default at port 5566)
  >  and send as 'enq MESSAGE'
  >  it will return the enqueued message, if wanna check back

* To dequeue a message
  >  open a connection to it (default at port 5566)
  >  and send as 'deq'
  >  it will return the dequeued message

***
