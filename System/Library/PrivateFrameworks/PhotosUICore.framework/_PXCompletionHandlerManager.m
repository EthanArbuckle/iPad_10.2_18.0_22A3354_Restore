@implementation _PXCompletionHandlerManager

- (_PXCompletionHandlerManager)init
{
  _PXCompletionHandlerManager *v2;
  NSMutableArray *v3;
  NSMutableArray *completionHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXCompletionHandlerManager;
  v2 = -[_PXCompletionHandlerManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

  }
  return v2;
}

- (void)_handleTimeoutOfCompletionHandler:(id)a3
{
  void (*v4)(void);
  id v5;
  NSMutableArray *completionHandlers;
  void *v7;
  id v8;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  completionHandlers = self->_completionHandlers;
  v7 = _Block_copy(v5);

  -[NSMutableArray removeObject:](completionHandlers, "removeObject:", v7);
  if (!-[NSMutableArray count](self->_completionHandlers, "count"))
  {
    -[_PXCompletionHandlerManager delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didCallLastCompletionHandlerForCompletionHandlerManager:", self);

  }
}

- (void)addCompletionHandler:(id)a3
{
  void *v4;
  NSMutableArray *completionHandlers;
  void *v6;
  void *aBlock;

  aBlock = (void *)objc_msgSend(a3, "copy");
  v4 = _Block_copy(aBlock);
  -[_PXCompletionHandlerManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleTimeoutOfCompletionHandler_, v4, 10.0);

  completionHandlers = self->_completionHandlers;
  v6 = _Block_copy(aBlock);
  -[NSMutableArray addObject:](completionHandlers, "addObject:", v6);

}

- (void)callCompletionHandlers
{
  NSMutableArray *completionHandlers;
  void *v4;
  _QWORD v5[5];

  completionHandlers = self->_completionHandlers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___PXCompletionHandlerManager_callCompletionHandlers__block_invoke;
  v5[3] = &unk_1E511AA88;
  v5[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](completionHandlers, "enumerateObjectsUsingBlock:", v5);
  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
  -[_PXCompletionHandlerManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didCallLastCompletionHandlerForCompletionHandlerManager:", self);

}

- (_PXCompletionHandlerManagerDelegate)delegate
{
  return (_PXCompletionHandlerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
