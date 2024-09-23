@implementation _TUIRunLoopWaiter

+ (id)sharedInstance
{
  if (qword_2CB740 != -1)
    dispatch_once(&qword_2CB740, &stru_241940);
  return (id)qword_2CB738;
}

- (_TUIRunLoopWaiter)init
{
  _TUIRunLoopWaiter *v2;
  _TUIRunLoopWaiter *v3;
  dispatch_group_t v4;
  OS_dispatch_group *group;
  NSMutableArray *v6;
  NSMutableArray *preCommitBlocks;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TUIRunLoopWaiter;
  v2 = -[_TUIRunLoopWaiter init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_group_create();
    group = v3->_group;
    v3->_group = (OS_dispatch_group *)v4;

    v6 = objc_opt_new(NSMutableArray);
    preCommitBlocks = v3->_preCommitBlocks;
    v3->_preCommitBlocks = v6;

  }
  return v3;
}

- (void)addPreCommitBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *preCommitBlocks;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  preCommitBlocks = self->_preCommitBlocks;
  v7 = objc_msgSend(v5, "copy");

  v8 = objc_retainBlock(v7);
  -[NSMutableArray addObject:](preCommitBlocks, "addObject:", v8);

  -[_TUIRunLoopWaiter _schedule](self, "_schedule");
  os_unfair_lock_unlock(p_lock);
}

- (void)_schedule
{
  char v3;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = *((_BYTE *)self + 8);
  if ((v3 & 1) == 0)
  {
    if (!self->_notReadyCount)
    {
      if (!-[NSMutableArray count](self->_preCommitBlocks, "count"))
        return;
      v3 = *((_BYTE *)self + 8);
    }
    *((_BYTE *)self + 8) = v3 | 1;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10AD8C;
    v4[3] = &unk_23D938;
    v4[4] = self;
    +[CATransaction addCommitHandler:forPhase:](CATransaction, "addCommitHandler:forPhase:", v4, 1);
  }
}

- (id)notReadyAssertionWithTimeout:(double)a3 queue:(id)a4
{
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  _TUIRunLoopAssertion *v8;
  dispatch_time_t v9;
  _TUIRunLoopAssertion *v10;
  _QWORD v12[4];
  _TUIRunLoopAssertion *v13;
  _QWORD v14[5];

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(p_lock);
  ++self->_notReadyCount;
  -[_TUIRunLoopWaiter _schedule](self, "_schedule");
  os_unfair_lock_unlock(p_lock);
  dispatch_group_enter((dispatch_group_t)self->_group);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10B0B8;
  v14[3] = &unk_23D938;
  v14[4] = self;
  v8 = -[_TUIRunLoopAssertion initWithCompletion:]([_TUIRunLoopAssertion alloc], "initWithCompletion:", v14);
  v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10B104;
  v12[3] = &unk_23D938;
  v10 = v8;
  v13 = v10;
  dispatch_after(v9, v7, v12);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preCommitBlocks, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
