@implementation _UISheetPresentationController

- (NSArray)_passthroughViews
{
  return self->__passthroughViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__passthroughViews, 0);
}

- (void)_invalidateDetents
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UISheetPresentationController;
  -[UISheetPresentationController _invalidateDetents](&v2, sel__invalidateDetents);
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISheetPresentationController;
  -[UISheetPresentationController _sendDidChangeSelectedDetentIdentifier](&v4, sel__sendDidChangeSelectedDetentIdentifier);
  -[UIPresentationController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_sheetPresentationController:didChangeIndexOfCurrentDetent:", self, -[UISheetPresentationController _indexOfCurrentDetent](self, "_indexOfCurrentDetent"));

}

- (double)_preferredRecessedCornerRadius
{
  return self->__preferredRecessedCornerRadius;
}

- (void)_setPreferredRecessedCornerRadius:(double)a3
{
  self->__preferredRecessedCornerRadius = a3;
}

- (void)_setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

@end
