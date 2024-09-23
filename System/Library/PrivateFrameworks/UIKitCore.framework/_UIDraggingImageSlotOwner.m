@implementation _UIDraggingImageSlotOwner

- (_UIDraggingImageSlotOwner)initWithDragManager:(id)a3
{
  id v4;
  _UIDraggingImageSlotOwner *v5;
  _UIDraggingImageSlotOwner *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("dragManager must be non-nil"));
  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageSlotOwner;
  v5 = -[_UIDraggingImageSlotOwner init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dragManager, v4);

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  NSMutableArray *usedSlotIDs;
  NSMutableArray *v5;
  dispatch_time_t v6;
  NSMutableArray *v7;
  objc_super v8;
  _QWORD block[4];
  id v10;
  NSMutableArray *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dragManager);
  usedSlotIDs = self->_usedSlotIDs;
  if (usedSlotIDs)
  {
    v5 = usedSlotIDs;
    v6 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36___UIDraggingImageSlotOwner_dealloc__block_invoke;
    block[3] = &unk_1E16B1B50;
    v10 = WeakRetained;
    v11 = v5;
    v7 = v5;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

    usedSlotIDs = self->_usedSlotIDs;
  }
  self->_usedSlotIDs = 0;

  v8.receiver = self;
  v8.super_class = (Class)_UIDraggingImageSlotOwner;
  -[_UIDraggingImageSlotOwner dealloc](&v8, sel_dealloc);
}

- (void)addUsedSlotID:(unsigned int)a3
{
  uint64_t v3;
  NSMutableArray *usedSlotIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    usedSlotIDs = self->_usedSlotIDs;
    if (!usedSlotIDs)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_usedSlotIDs;
      self->_usedSlotIDs = v6;

      usedSlotIDs = self->_usedSlotIDs;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](usedSlotIDs, "addObject:", v8);

  }
}

- (unsigned)uploadImage:(CGImage *)a3
{
  void *v5;
  uint64_t v6;

  -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "uploadImage:", a3);

  -[_UIDraggingImageSlotOwner addUsedSlotID:](self, "addUsedSlotID:", v6);
  return v6;
}

- (_UIDragManager)dragManager
{
  return (_UIDragManager *)objc_loadWeakRetained((id *)&self->_dragManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragManager);
  objc_storeStrong((id *)&self->_usedSlotIDs, 0);
}

@end
