@implementation PXExtendedTraitCollectionSnapshot

- (id)_initWithExtendedTraitCollection:(id)a3
{
  id v4;
  PXExtendedTraitCollectionSnapshot *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;

  v4 = a3;
  v5 = -[PXExtendedTraitCollectionSnapshot init](self, "init");
  if (v5)
  {
    v5->_layoutSizeClass = objc_msgSend(v4, "layoutSizeClass");
    v5->_layoutSizeSubclass = objc_msgSend(v4, "layoutSizeSubclass");
    v5->_layoutOrientation = objc_msgSend(v4, "layoutOrientation");
    v5->_layoutDirection = objc_msgSend(v4, "layoutDirection");
    v5->_contentSizeCategory = objc_msgSend(v4, "contentSizeCategory");
    v5->_userInterfaceIdiom = objc_msgSend(v4, "userInterfaceIdiom");
    v5->_userInterfaceFeature = objc_msgSend(v4, "userInterfaceFeature");
    objc_msgSend(v4, "layoutReferenceSize");
    v5->_layoutReferenceSize.width = v6;
    v5->_layoutReferenceSize.height = v7;
    objc_msgSend(v4, "displayScale");
    v5->_displayScale = v8;
    objc_msgSend(v4, "safeAreaInsets");
    v5->_safeAreaInsets.top = v9;
    v5->_safeAreaInsets.left = v10;
    v5->_safeAreaInsets.bottom = v11;
    v5->_safeAreaInsets.right = v12;
    objc_msgSend(v4, "peripheryInsets");
    v5->_peripheryInsets.top = v13;
    v5->_peripheryInsets.left = v14;
    v5->_peripheryInsets.bottom = v15;
    v5->_peripheryInsets.right = v16;
    objc_msgSend(v4, "layoutMargins");
    v5->_layoutMargins.top = v17;
    v5->_layoutMargins.left = v18;
    v5->_layoutMargins.bottom = v19;
    v5->_layoutMargins.right = v20;
    v5->_userInterfaceStyle = objc_msgSend(v4, "userInterfaceStyle");
    v5->_userInterfaceLevel = objc_msgSend(v4, "userInterfaceLevel");
    objc_msgSend(v4, "windowReferenceSize");
    v5->_windowReferenceSize.width = v21;
    v5->_windowReferenceSize.height = v22;
    v5->_windowOrientation = objc_msgSend(v4, "windowOrientation");
    objc_msgSend(v4, "fullScreenReferenceRect");
    v5->_fullScreenReferenceRect.origin.x = v23;
    v5->_fullScreenReferenceRect.origin.y = v24;
    v5->_fullScreenReferenceRect.size.width = v25;
    v5->_fullScreenReferenceRect.size.height = v26;
  }

  return v5;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)peripheryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_peripheryInsets.top;
  left = self->_peripheryInsets.left;
  bottom = self->_peripheryInsets.bottom;
  right = self->_peripheryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (CGSize)windowReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowReferenceSize.width;
  height = self->_windowReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (CGRect)fullScreenReferenceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fullScreenReferenceRect.origin.x;
  y = self->_fullScreenReferenceRect.origin.y;
  width = self->_fullScreenReferenceRect.size.width;
  height = self->_fullScreenReferenceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
