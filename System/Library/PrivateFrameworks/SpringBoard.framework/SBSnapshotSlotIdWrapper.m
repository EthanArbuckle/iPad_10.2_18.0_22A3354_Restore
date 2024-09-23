@implementation SBSnapshotSlotIdWrapper

- (SBSnapshotSlotIdWrapper)initWithContext:(id)a3 slotId:(unsigned int)a4
{
  id v7;
  SBSnapshotSlotIdWrapper *v8;
  SBSnapshotSlotIdWrapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSnapshotSlotIdWrapper;
  v8 = -[SBSnapshotSlotIdWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a3);
    v9->_slotId = a4;
  }

  return v9;
}

- (SBSnapshotSlotIdWrapper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSnapshotUtilities.m"), 56, CFSTR("use initWithContext:"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_slotId)
    -[CAContext deleteSlot:](self->_context, "deleteSlot:");
  v3.receiver = self;
  v3.super_class = (Class)SBSnapshotSlotIdWrapper;
  -[SBSnapshotSlotIdWrapper dealloc](&v3, sel_dealloc);
}

- (unsigned)slotId
{
  return self->_slotId;
}

- (CAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
