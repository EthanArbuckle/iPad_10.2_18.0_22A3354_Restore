@implementation MBSCacheEnumerator

+ (id)enumeratorWithStmt:(id)a3 block:(id)a4
{
  return -[MBSCacheEnumerator initWithStmt:block:]([MBSCacheEnumerator alloc], "initWithStmt:block:", a3, a4);
}

- (MBSCacheEnumerator)initWithStmt:(id)a3 block:(id)a4
{
  MBSCacheEnumerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBSCacheEnumerator;
  v6 = -[MBSCacheEnumerator init](&v8, "init");
  if (v6)
  {
    v6->_stmt = (MBSCacheStmt *)a3;
    v6->_block = objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MBSCacheEnumerator close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MBSCacheEnumerator;
  -[MBSCacheEnumerator dealloc](&v3, "dealloc");
}

- (id)nextObject
{
  void *v3;

  if (self->_closed)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBSCacheEnumerator.m"), 36, CFSTR("Cache enumerator is closed"));
  v3 = (void *)(*((uint64_t (**)(void))self->_block + 2))();
  if (!v3)
    -[MBSCacheEnumerator close](self, "close");
  return v3;
}

- (void)close
{
  if (!self->_closed)
  {
    -[MBSCacheStmt reset](self->_stmt, "reset");

    self->_stmt = 0;
    self->_block = 0;
    self->_closed = 1;
  }
}

@end
