@implementation _UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;

  +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](_UICollectionTableIndexOverlaySelectionViewCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("ExternalDoneKind"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", self->_frameForDoneButton.origin.x, self->_frameForDoneButton.origin.y, self->_frameForDoneButton.size.width, self->_frameForDoneButton.size.height);
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout rightMarginForDoneButton](self, "rightMarginForDoneButton");
  objc_msgSend(v5, "setRightMargin:");
  return v5;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (CGRect)frameForDoneButton
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameForDoneButton.origin.x;
  y = self->_frameForDoneButton.origin.y;
  width = self->_frameForDoneButton.size.width;
  height = self->_frameForDoneButton.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameForDoneButton:(CGRect)a3
{
  self->_frameForDoneButton = a3;
  -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (double)rightMarginForDoneButton
{
  return self->_rightMarginForDoneButton;
}

- (void)setRightMarginForDoneButton:(double)a3
{
  self->_rightMarginForDoneButton = a3;
  -[UICollectionViewLayout invalidateLayout](self, "invalidateLayout");
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  _QWORD v15[2];
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (CGRectIntersectsRect(v16, self->_frameForDoneButton))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", CFSTR("ExternalDoneKind"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  return v8;
}

@end
