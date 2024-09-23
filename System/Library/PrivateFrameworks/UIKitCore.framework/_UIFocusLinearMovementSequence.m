@implementation _UIFocusLinearMovementSequence

+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  _UIFocusLinearMovementSequence *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[_UIFocusLinearMovementSequence initWithItems:loops:restrictEnteringSequence:]([_UIFocusLinearMovementSequence alloc], "initWithItems:loops:restrictEnteringSequence:", v7, v6, v5);

  return v8;
}

+ (id)sequenceWithItems:(id)a3 loops:(BOOL)a4
{
  return (id)objc_msgSend(a1, "sequenceWithItems:loops:restrictEnteringSequence:", a3, a4, 0);
}

- (_UIFocusLinearMovementSequence)init
{
  return -[_UIFocusLinearMovementSequence initWithItems:loops:restrictEnteringSequence:](self, "initWithItems:loops:restrictEnteringSequence:", MEMORY[0x1E0C9AA60], 0, 0);
}

- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4
{
  return -[_UIFocusLinearMovementSequence initWithItems:loops:restrictEnteringSequence:](self, "initWithItems:loops:restrictEnteringSequence:", a3, a4, 0);
}

- (_UIFocusLinearMovementSequence)initWithItems:(id)a3 loops:(BOOL)a4 restrictEnteringSequence:(BOOL)a5
{
  id v9;
  _UIFocusLinearMovementSequence *v10;
  uint64_t v11;
  NSArray *items;
  void *v14;
  objc_super v15;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusLinearMovementSequence.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusLinearMovementSequence;
  v10 = -[_UIFocusLinearMovementSequence init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    items = v10->_items;
    v10->_items = (NSArray *)v11;

    v10->_looping = a4;
    v10->_restrictEnteringSequence = a5;
  }

  return v10;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (BOOL)restrictsEnteringSequence
{
  return self->_restrictEnteringSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
