@implementation PXUISnappingController

- (PXUISnappingController)initWithSnappingTarget:(double)a3
{
  PXUISnappingController *v3;
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *selectionBehavior;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXUISnappingController;
  v3 = -[PXSnappingController initWithSnappingTarget:](&v7, sel_initWithSnappingTarget_, a3);
  if (v3)
  {
    v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    selectionBehavior = v3->__selectionBehavior;
    v3->__selectionBehavior = v4;

  }
  return v3;
}

- (void)interactionBegan
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUISnappingController;
  -[PXSnappingController interactionBegan](&v4, sel_interactionBegan);
  -[PXUISnappingController _selectionBehavior](self, "_selectionBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

}

- (void)didSnapByAttraction
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUISnappingController;
  -[PXSnappingController didSnapByAttraction](&v4, sel_didSnapByAttraction);
  -[PXUISnappingController _selectionBehavior](self, "_selectionBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionChanged");

}

- (UISelectionFeedbackGenerator)_selectionBehavior
{
  return self->__selectionBehavior;
}

- (void)_setSelectionBehavior:(id)a3
{
  objc_storeStrong((id *)&self->__selectionBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionBehavior, 0);
}

@end
