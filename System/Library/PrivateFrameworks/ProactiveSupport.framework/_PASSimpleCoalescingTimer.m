@implementation _PASSimpleCoalescingTimer

- (void)runAfterDelaySeconds:(double)a3 coalescingBehavior:(unsigned __int8)a4
{
  -[_PASCoalescingTimer processData:afterDelaySeconds:coalescingBehavior:](self->_timer, "processData:afterDelaySeconds:coalescingBehavior:", 0, a4, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 operation:(id)a5
{
  id v8;
  id v9;
  _PASSimpleCoalescingTimer *v10;
  _PASCoalescingTimer *v11;
  uint64_t v12;
  _PASCoalescingTimer *timer;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PASSimpleCoalescingTimer;
  v10 = -[_PASSimpleCoalescingTimer init](&v17, sel_init);
  if (v10)
  {
    v11 = [_PASCoalescingTimer alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke_2;
    v15[3] = &unk_1E4430120;
    v16 = v9;
    v12 = -[_PASCoalescingTimer initWithQueue:leewaySeconds:coalesceData:operation:](v11, "initWithQueue:leewaySeconds:coalesceData:operation:", v8, &__block_literal_global_52, v15, a4);
    timer = v10->_timer;
    v10->_timer = (_PASCoalescingTimer *)v12;

  }
  return v10;
}

- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 operation:(id)a4
{
  return -[_PASSimpleCoalescingTimer initWithQueue:leewaySeconds:operation:](self, "initWithQueue:leewaySeconds:operation:", a3, a4, 0.02);
}

- (void)runImmediately
{
  -[_PASCoalescingTimer immediatelyProcessData:](self->_timer, "immediatelyProcessData:", 0);
}

- (void)runAfterStrictDelaySeconds:(double)a3
{
  -[_PASCoalescingTimer processData:afterStrictDelaySeconds:](self->_timer, "processData:afterStrictDelaySeconds:", 0, a3);
}

- (void)cancelPendingOperations
{
  -[_PASCoalescingTimer cancelPendingOperations](self->_timer, "cancelPendingOperations");
}

@end
