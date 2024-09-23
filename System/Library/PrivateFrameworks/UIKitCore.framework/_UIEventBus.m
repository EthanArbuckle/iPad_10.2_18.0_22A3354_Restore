@implementation _UIEventBus

+ (id)instance
{
  objc_opt_self();
  if (qword_1ECD802B0 != -1)
    dispatch_once(&qword_1ECD802B0, &__block_literal_global_482);
  return (id)qword_1ECD802B8;
}

- (uint64_t)drainEvents:(uint64_t)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __27___UIEventBus_drainEvents___block_invoke;
    v2[3] = &unk_1E16B1B50;
    v2[4] = result;
    v2[5] = a2;
    return _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v2);
  }
  return result;
}

- (uint64_t)addEvents:(uint64_t)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __25___UIEventBus_addEvents___block_invoke;
    v2[3] = &unk_1E16B1B50;
    v2[4] = a2;
    v2[5] = result;
    return _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v2);
  }
  return result;
}

- (_UIEventBus)init
{
  _UIEventBus *v3;
  uint64_t v4;
  NSMutableArray *events;
  _QWORD v7[4];
  _UIEventBus *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIEventBus;
  -[_UIEventBus self](&v9, sel_self);
  v3 = (_UIEventBus *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_opt_new();
    events = v3->_events;
    v3->_events = (NSMutableArray *)v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __19___UIEventBus_init__block_invoke;
    v7[3] = &unk_1E16B1B28;
    v8 = v3;
    _UIUpdateInputGroupBatchChanges((uint64_t)&mainGroup, (uint64_t)v7);

  }
  return v3;
}

- (_QWORD)inputForEvent:(_QWORD *)a1
{
  _QWORD *v3;
  const void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v3 = a1;
    if (IOHIDEventGetType() == 11)
    {
      v4 = _UIEventHIDGetChildStylusEvent(a2);
      v5 = 1;
      if (v4)
        v5 = 2;
    }
    else
    {
      v5 = 0;
    }
    v6 = (void *)v3[v5 + 2];
    if (!v6)
      v6 = (void *)v3[2];
    a1 = v6;
  }
  return a1;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 32; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end
