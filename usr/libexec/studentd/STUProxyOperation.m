@implementation STUProxyOperation

- (STUProxyOperation)initWithTarget:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  STUProxyOperation *v9;
  STUProxyOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUProxyOperation;
  v9 = -[STUProxyOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_target, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUProxyOperation;
  -[STUProxyOperation cancel](&v4, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUProxyOperation target](self, "target"));
  objc_msgSend(v3, "cancel");

}

- (void)main
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUProxyOperation target](self, "target"));
  objc_msgSend(v3, "addTarget:selector:forOperationEvents:", self, "targetDidFinish:", 6);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[STUProxyOperation queue](self, "queue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUProxyOperation target](self, "target"));
  objc_msgSend(v5, "addOperation:", v4);

}

- (void)targetDidFinish:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "error"));
  v5 = (id)v4;
  if (v4)
    -[STUProxyOperation endOperationWithError:](self, "endOperationWithError:", v4);
  else
    -[STUProxyOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUProxyOperation target](self, "target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { target = %@ }>"), v3, self, v4));

  return v5;
}

- (CATOperation)target
{
  return self->_target;
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
