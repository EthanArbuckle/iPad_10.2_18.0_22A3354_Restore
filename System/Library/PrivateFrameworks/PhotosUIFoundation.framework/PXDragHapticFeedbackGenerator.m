@implementation PXDragHapticFeedbackGenerator

- (PXDragHapticFeedbackGenerator)init
{
  PXDragHapticFeedbackGenerator *v2;
  _UIDragSnappingFeedbackGenerator *v3;
  _UIDragSnappingFeedbackGenerator *reorderFeedbackGenerator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDragHapticFeedbackGenerator;
  v2 = -[PXDragHapticFeedbackGenerator init](&v6, sel_init);
  if (v2)
  {
    v3 = (_UIDragSnappingFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBDC00]);
    reorderFeedbackGenerator = v2->_reorderFeedbackGenerator;
    v2->_reorderFeedbackGenerator = v3;

  }
  return v2;
}

- (void)setReorderFeedbackEnabled:(BOOL)a3
{
  _UIDragSnappingFeedbackGenerator *reorderFeedbackGenerator;

  if (self->_reorderFeedbackEnabled != a3)
  {
    self->_reorderFeedbackEnabled = a3;
    reorderFeedbackGenerator = self->_reorderFeedbackGenerator;
    if (a3)
      -[_UIDragSnappingFeedbackGenerator userInteractionStarted](reorderFeedbackGenerator, "userInteractionStarted");
    else
      -[_UIDragSnappingFeedbackGenerator userInteractionEnded](reorderFeedbackGenerator, "userInteractionEnded");
  }
}

- (void)performFeedback
{
  void *v3;
  _QWORD v4[5];

  -[PXDragHapticFeedbackGenerator reorderFeedbackGenerator](self, "reorderFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__PXDragHapticFeedbackGenerator_performFeedback__block_invoke;
  v4[3] = &unk_2514D11A8;
  v4[4] = self;
  objc_msgSend(v3, "performFeedbackWithDelay:insideBlock:", v4, 0.05);

}

- (void)draggedObjectLifted
{
  id v3;

  if (-[PXDragHapticFeedbackGenerator reorderFeedbackEnabled](self, "reorderFeedbackEnabled"))
  {
    -[PXDragHapticFeedbackGenerator reorderFeedbackGenerator](self, "reorderFeedbackGenerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "draggedObjectLifted");

  }
}

- (void)draggedObjectLanded
{
  id v3;

  if (-[PXDragHapticFeedbackGenerator reorderFeedbackEnabled](self, "reorderFeedbackEnabled"))
  {
    -[PXDragHapticFeedbackGenerator reorderFeedbackGenerator](self, "reorderFeedbackGenerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "draggedObjectLanded");

  }
}

- (BOOL)reorderFeedbackEnabled
{
  return self->_reorderFeedbackEnabled;
}

- (_UIDragSnappingFeedbackGenerator)reorderFeedbackGenerator
{
  return self->_reorderFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderFeedbackGenerator, 0);
}

void __48__PXDragHapticFeedbackGenerator_performFeedback__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reorderFeedbackGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectSnapped");

}

@end
