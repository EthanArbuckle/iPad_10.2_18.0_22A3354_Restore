@implementation PUImportOneUpViewControllerSpec

- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PUImportOneUpViewControllerSpec initWithExtendedTraitCollection:options:style:](self, "initWithExtendedTraitCollection:options:style:", a3, a4, 0);
}

- (PUImportOneUpViewControllerSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  PUImportOneUpViewControllerSpec *v6;
  PUImportOneUpViewControllerSpec *v7;
  double v8;
  int v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PUImportOneUpViewControllerSpec;
  v6 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v19, sel_initWithExtendedTraitCollection_options_, a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_style = a5;
    v8 = 0.0;
    if (!a5)
    {
      v9 = PLIsTallScreen();
      v8 = 15.0;
      if (v9)
        v8 = 10.0;
    }
    v7->_interItemSpacing = v8;
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v7->_selectionBadgeSize.width = v11;
    v7->_selectionBadgeSize.height = v12;
    __asm { FMOV            V0.2D, #6.0 }
    v7->_selectionBadgeOffset = _Q0;
    v7->_selectionBadgeCorner = 8;
    v7->_allowsInterfaceRotation = 0;

  }
  return v7;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (CGSize)selectionBadgeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_selectionBadgeSize.width;
  height = self->_selectionBadgeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIOffset)selectionBadgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_selectionBadgeOffset.horizontal;
  vertical = self->_selectionBadgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (unint64_t)selectionBadgeCorner
{
  return self->_selectionBadgeCorner;
}

- (BOOL)allowsInterfaceRotation
{
  return self->_allowsInterfaceRotation;
}

- (unint64_t)style
{
  return self->_style;
}

@end
