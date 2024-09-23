@implementation SUScriptObjectBatchProxy

- (void)forwardInvocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUScriptObjectBatchProxy invocationBatch](self, "invocationBatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptObjectBatchProxy target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTarget:", v5);

  if (v4)
  {
    objc_msgSend(v4, "enqueueInvocation:", v6);
  }
  else
  {
    objc_msgSend(v6, "retainArguments");
    objc_msgSend(v6, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_invoke, 0, 0);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptObjectBatchProxy;
  -[SUScriptObjectBatchProxy methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SUScriptObjectBatchProxy target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (SUScriptObjectInvocationBatch)invocationBatch
{
  return self->_invocationBatch;
}

- (void)setInvocationBatch:(id)a3
{
  self->_invocationBatch = (SUScriptObjectInvocationBatch *)a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

@end
