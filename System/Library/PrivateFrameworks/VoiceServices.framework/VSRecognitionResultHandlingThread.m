@implementation VSRecognitionResultHandlingThread

- (VSRecognitionResultHandlingThread)init
{
  VSRecognitionResultHandlingThread *v2;
  VSRecognitionResultHandlingThread *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionResultHandlingThread;
  v2 = -[VSRecognitionResultHandlingThread init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_BYTE *)&v2->_resultHandlingFlags |= 4u;
    v2->_lock = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 1);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionResultHandlingThread;
  -[VSRecognitionResultHandlingThread dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  char v4;

  if (self->_delegate != a3)
  {
    self->_delegate = (VSRecognitionResultHandlingThreadDelegate *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_resultHandlingFlags = *(_BYTE *)&self->_resultHandlingFlags & 0xFD | v4;
  }
}

- (void)handleResults:(id)a3 withHandler:(id)a4
{
  NSMutableArray *requests;
  VSRecognitionResultHandlingRequest *v6;

  if ((*(_BYTE *)&self->_resultHandlingFlags & 4) != 0)
  {
    v6 = -[VSRecognitionResultHandlingRequest initWithHandler:results:]([VSRecognitionResultHandlingRequest alloc], "initWithHandler:results:", a4, a3);
    -[NSConditionLock lock](self->_lock, "lock");
    requests = self->_requests;
    if (!requests)
    {
      requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_requests = requests;
    }
    -[NSMutableArray addObject:](requests, "addObject:", v6);
    if ((*(_BYTE *)&self->_resultHandlingFlags & 1) == 0)
    {
      *(_BYTE *)&self->_resultHandlingFlags |= 1u;
      objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel__handleRequests, self, 0);
    }
    -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2);

  }
}

- (void)invalidate
{
  if ((*(_BYTE *)&self->_resultHandlingFlags & 4) != 0)
  {
    -[NSConditionLock lock](self->_lock, "lock");
    *(_BYTE *)&self->_resultHandlingFlags &= ~4u;
    -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", 2);
  }
}

- (void)_notifyRequestHandled:(id)a3
{
  if ((~*(_BYTE *)&self->_resultHandlingFlags & 6) == 0)
    -[VSRecognitionResultHandlingThreadDelegate recognitionResultHandlingThread:didHandleResults:nextAction:](self->_delegate, "recognitionResultHandlingThread:didHandleResults:nextAction:", self, objc_msgSend(a3, "results"), objc_msgSend(a3, "nextAction"));
}

- (void)_handleRequests
{
  id v3;
  char resultHandlingFlags;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

  do
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[NSConditionLock lockWhenCondition:](self->_lock, "lockWhenCondition:", 2);
    resultHandlingFlags = (char)self->_resultHandlingFlags;
    if ((resultHandlingFlags & 4) != 0 && -[NSMutableArray count](self->_requests, "count"))
    {
      v5 = (void *)-[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", 0);
      v6 = v5;
      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
    }
    else
    {
      v5 = 0;
    }
    if (v5)
      v7 = 2;
    else
      v7 = 1;
    -[NSConditionLock unlockWithCondition:](self->_lock, "unlockWithCondition:", v7);
    if (v5)
    {
      v8 = (void *)objc_msgSend(v5, "handler");
      v9 = objc_opt_respondsToSelector();
      v10 = (void *)objc_msgSend(v5, "results");
      if ((v9 & 1) != 0)
        v11 = objc_msgSend(v8, "actionForRecognitionResults:", v10);
      else
        v11 = objc_msgSend(v8, "actionForRecognitionResult:", objc_msgSend(v10, "lastObject"));
      objc_msgSend(v5, "setNextAction:", v11);
      -[VSRecognitionResultHandlingThread performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__notifyRequestHandled_, v5, 0);

    }
  }
  while ((resultHandlingFlags & 4) != 0);
}

@end
