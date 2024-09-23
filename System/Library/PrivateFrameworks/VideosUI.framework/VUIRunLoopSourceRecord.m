@implementation VUIRunLoopSourceRecord

- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  VUIRunLoopSourceRecord *v11;
  uint64_t v12;
  id evaluateBlock;
  uint64_t v14;
  id completionBlock;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIRunLoopSourceRecord;
  v11 = -[VUIRunLoopSourceRecord init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    evaluateBlock = v11->_evaluateBlock;
    v11->_evaluateBlock = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    completionBlock = v11->_completionBlock;
    v11->_completionBlock = (id)v14;

    objc_storeStrong((id *)&v11->_completionQueue, a5);
  }

  return v11;
}

- (id)evaluateBlock
{
  return self->_evaluateBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_evaluateBlock, 0);
}

- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4
{
  return -[VUIRunLoopSourceRecord initWithEvaluateBlock:completionBlock:completionQueue:](self, "initWithEvaluateBlock:completionBlock:completionQueue:", a3, a4, 0);
}

- (void)setEvaluateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

@end
