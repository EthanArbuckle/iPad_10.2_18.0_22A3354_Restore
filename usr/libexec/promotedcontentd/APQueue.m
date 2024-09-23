@implementation APQueue

- (APQueue)init
{
  APQueue *v2;
  APUnfairLock *v3;
  APUnfairLock *lock;
  uint64_t v5;
  NSMutableArray *container;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APQueue;
  v2 = -[APQueue init](&v8, "init");
  if (v2)
  {
    v3 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    container = v2->_container;
    v2->_container = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)enqueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue container](self, "container"));
  objc_msgSend(v6, "addObject:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[APQueue lock](self, "lock"));
  objc_msgSend(v7, "unlock");

}

- (id)dequeue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue lock](self, "lock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue container](self, "container"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue container](self, "container"));
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APQueue lock](self, "lock"));
  objc_msgSend(v7, "unlock");

  return v5;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableArray)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
