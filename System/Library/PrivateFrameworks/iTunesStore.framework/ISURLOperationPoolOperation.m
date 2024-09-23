@implementation ISURLOperationPoolOperation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISURLOperationPoolOperation;
  -[ISURLOperationPoolOperation dealloc](&v3, sel_dealloc);
}

- (void)addOperation:(id)a3
{
  NSMutableArray *operations;
  uint64_t v6;
  id v7;

  -[ISOperation lock](self, "lock");
  operations = self->_operations;
  if (!operations)
  {
    operations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_operations = operations;
  }
  if (self->_forwardImmediately
    && (v6 = -[NSMutableArray count](operations, "count"), operations = self->_operations, v6))
  {
    v7 = (id)-[NSMutableArray objectAtIndex:](operations, "objectAtIndex:", 0);
    operations = self->_operations;
  }
  else
  {
    v7 = 0;
  }
  -[NSMutableArray addObject:](operations, "addObject:", a3);
  -[ISOperation unlock](self, "unlock");
  if (v7)
  {
    -[ISURLOperationPoolOperation _forwardResponseFromOperation:toOperation:](self, "_forwardResponseFromOperation:toOperation:", v7, a3);

  }
}

- (void)cancelOperation:(id)a3
{
  unint64_t v4;
  unint64_t v5;

  -[ISOperation lock](self, "lock", a3);
  v4 = self->_cancelCount + 1;
  self->_cancelCount = v4;
  v5 = -[NSMutableArray count](self->_operations, "count");
  -[ISOperation unlock](self, "unlock");
  if (v4 >= v5)
    -[ISOperation cancel](self, "cancel");
}

- (BOOL)containsOperation:(id)a3
{
  -[ISOperation lock](self, "lock");
  LOBYTE(a3) = -[NSMutableArray indexOfObjectIdenticalTo:](self->_operations, "indexOfObjectIdenticalTo:", a3) != 0x7FFFFFFFFFFFFFFFLL;
  -[ISOperation unlock](self, "unlock");
  return (char)a3;
}

- (ISURLOperation)mainOperation
{
  ISURLOperation *v3;

  -[ISOperation lock](self, "lock");
  if (-[NSMutableArray count](self->_operations, "count"))
    v3 = (ISURLOperation *)-[NSMutableArray objectAtIndex:](self->_operations, "objectAtIndex:", 0);
  else
    v3 = 0;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  ISURLOperation *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;

  v3 = -[ISURLOperationPoolOperation mainOperation](self, "mainOperation");
  v9 = 0;
  v4 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v9);
  -[ISOperation setError:](self, "setError:", v9);
  -[ISOperation setSuccess:](self, "setSuccess:", v4);
  -[ISOperation lock](self, "lock");
  self->_forwardImmediately = 1;
  v5 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  -[ISOperation unlock](self, "unlock");
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 2)
  {
    v7 = v6;
    for (i = 1; i != v7; ++i)
      -[ISURLOperationPoolOperation _forwardResponseFromOperation:toOperation:](self, "_forwardResponseFromOperation:toOperation:", v3, objc_msgSend(v5, "objectAtIndex:", i));
  }

}

- (void)_forwardResponseFromOperation:(id)a3 toOperation:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[7];

  v6 = objc_msgSend(a3, "error");
  v7 = objc_msgSend(a3, "success");
  objc_msgSend(a4, "setError:", v6);
  objc_msgSend(a4, "setResponse:", objc_msgSend(a3, "response"));
  objc_msgSend(a4, "setSuccess:", v7);
  v8 = (void *)objc_msgSend(a4, "delegate");
  if ((v7 & 1) != 0)
  {
    v9 = objc_msgSend((id)objc_msgSend(a3, "dataProvider"), "output");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "operation:finishedWithOutput:", a4, v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "operationFinished:", a4);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__ISURLOperationPoolOperation__forwardResponseFromOperation_toOperation___block_invoke;
    v10[3] = &unk_24C43CD38;
    v10[4] = v8;
    v10[5] = a4;
    v10[6] = v6;
    objc_msgSend(a4, "delegateDispatch:", v10);
  }
}

uint64_t __73__ISURLOperationPoolOperation__forwardResponseFromOperation_toOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "operation:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
