@implementation _UIAsyncDragInteraction

- (_UIAsyncDragInteraction)initWithDelegate:(id)a3
{
  id v4;
  _UIAsyncDragInteraction *v5;
  char v6;
  char delegateImplements;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIAsyncDragInteraction;
  v5 = -[UIDragInteraction initWithDelegate:](&v10, sel_initWithDelegate_, v4);
  if (v5)
  {
    *(_BYTE *)&v5->_delegateImplements = *(_BYTE *)&v5->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    v6 = objc_opt_respondsToSelector();
    delegateImplements = (char)v5->_delegateImplements;
    if ((v6 & 1) != 0)
      v8 = 2;
    else
      v8 = 0;
    *(_BYTE *)&v5->_delegateImplements = delegateImplements & 0xFD | v8;
    if ((delegateImplements & 1) != 0)
    {
      -[UIDragInteraction _setLiftDelay:](v5, "_setLiftDelay:", 0.65);
      -[UIDragInteraction _setAllowsPointerDragBeforeLiftDelay:](v5, "_setAllowsPointerDragBeforeLiftDelay:", 0);
    }
  }

  return v5;
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _UIBurnableBlock *v9;
  uint64_t v10;
  _UIBurnableBlock *v11;
  void *v12;
  _UIBurnableBlock *v13;
  objc_super v14;
  _QWORD v15[4];
  _UIBurnableBlock *v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  if ((*(_BYTE *)&self->_delegateImplements & 1) != 0)
  {
    v8 = a3;
    v9 = [_UIBurnableBlock alloc];
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke;
    v17[3] = &unk_1E16D4C28;
    v18 = v6;
    v11 = -[_UIBurnableBlock initWithTimeout:block:defaultInputProvider:](v9, "initWithTimeout:block:defaultInputProvider:", v17, &__block_literal_global_343, 0.5);
    -[UIDragInteraction delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __57___UIAsyncDragInteraction__prepareForSession_completion___block_invoke_3;
    v15[3] = &unk_1E16B2268;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v12, "_asyncDragInteraction:prepareDragSession:completion:", self, v8, v15);

    v7 = v18;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIAsyncDragInteraction;
    v7 = a3;
    -[UIDragInteraction _prepareForSession:completion:](&v14, sel__prepareForSession_completion_, v7, v6);
  }

}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double z;
  double y;
  double x;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  _UIBurnableBlock *v14;
  uint64_t v15;
  _UIBurnableBlock *v16;
  void *v17;
  _UIBurnableBlock *v18;
  objc_super v20;
  _QWORD v21[4];
  _UIBurnableBlock *v22;
  _QWORD v23[4];
  id v24;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v10 = a5;
  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    v13 = a3;
    v14 = [_UIBurnableBlock alloc];
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke;
    v23[3] = &unk_1E16BB9F0;
    v24 = v10;
    v16 = -[_UIBurnableBlock initWithTimeout:block:defaultInputProvider:](v14, "initWithTimeout:block:defaultInputProvider:", v23, &__block_literal_global_11_3, 0.5);
    -[UIDragInteraction delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __71___UIAsyncDragInteraction__itemsForAddingToSession_atPoint_completion___block_invoke_3;
    v21[3] = &unk_1E16D5BD0;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "_asyncDragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:", self, v13, v21, x, y);

    v12 = 1;
    v11 = v24;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_UIAsyncDragInteraction;
    v11 = a3;
    v12 = -[UIDragInteraction _itemsForAddingToSession:atPoint:completion:](&v20, sel__itemsForAddingToSession_atPoint_completion_, v11, v10, x, y, z);
  }

  return v12;
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return (*(_BYTE *)&self->_delegateImplements >> 1) & 1;
}

@end
