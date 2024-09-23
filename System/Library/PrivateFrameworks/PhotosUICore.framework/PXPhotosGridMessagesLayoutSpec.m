@implementation PXPhotosGridMessagesLayoutSpec

- (PXPhotosGridMessagesLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXPhotosGridMessagesLayoutSpec *v7;
  PXPhotosGridMessagesLayoutSpec *v8;
  CGSize *p_referenceSize;
  objc_class *v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t *p_itemInternalSquareMargin;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  __int128 v32;
  objc_super v33;

  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PXPhotosGridMessagesLayoutSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v33, sel_initWithExtendedTraitCollection_options_, v6, a4);
  v8 = v7;
  if (v7)
  {
    p_referenceSize = &v7->_referenceSize;
    -[PXFeatureSpec layoutReferenceSize](v7, "layoutReferenceSize");
    *(_QWORD *)&p_referenceSize->width = v10;
    v8->_referenceSize.height = v11;
    v12 = -[PXFeatureSpec layoutOrientation](v8, "layoutOrientation");
    if (-[PXFeatureSpec sizeClass](v8, "sizeClass") == 2)
    {
      if (-[PXFeatureSpec userInterfaceIdiom](v8, "userInterfaceIdiom") == 4)
      {
        v8->_numberOfColumns = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
        v32 = xmmword_1A7C0C660;
        goto LABEL_16;
      }
      v8->_numberOfColumns = 4;
      if (v12 != 2)
        goto LABEL_15;
      v15 = xmmword_1A7C0C670;
    }
    else
    {
      v13 = -[PXFeatureSpec sizeSubclass](v8, "sizeSubclass");
      switch(v13)
      {
        case 1:
          v18 = 2;
          v8->_interItemSpacing.width = 2.0;
          if (v12 == 2)
            v18 = 4;
          v8->_numberOfColumns = v18;
          if (v12 == 2)
          {
            v8->_interItemSpacing.height = 6.0;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            v8->_itemInternalSquareMargin.width = 26.0;
            v20 = 15.0;
            v21 = 26.0;
          }
          else
          {
            v8->_interItemSpacing.height = 4.0;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            v8->_itemInternalSquareMargin.width = 33.0;
            v20 = 15.0;
            v21 = 33.0;
          }
          goto LABEL_29;
        case 2:
          v19 = 2;
          if (v12 == 2)
            v19 = 4;
          v8->_numberOfColumns = v19;
          if (v12 == 2)
          {
            v8->_interItemSpacing = (CGSize)xmmword_1A7C0C650;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            *(double *)&v17 = 32.0;
            goto LABEL_28;
          }
          v15 = xmmword_1A7C0C640;
          break;
        case 3:
          v14 = 2;
          if (v12 == 2)
            v14 = 3;
          v8->_numberOfColumns = v14;
          if (v12 != 2)
          {
            v32 = xmmword_1A7C0C640;
LABEL_16:
            v8->_interItemSpacing = (CGSize)v32;
            p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
            *(double *)&v17 = 38.0;
LABEL_28:
            *p_itemInternalSquareMargin = v17;
            v20 = 20.0;
            v21 = *(double *)&v17;
LABEL_29:
            *((double *)p_itemInternalSquareMargin + 1) = v21;
            __asm { FMOV            V1.2D, #8.0 }
            v8->_itemInternalMargin = _Q1;
            v8->_itemCornerRadius = v20;
            goto LABEL_30;
          }
          v15 = xmmword_1A7C0C650;
          break;
        default:
LABEL_30:
          PXEdgeInsetsMake();
          objc_msgSend(v6, "safeAreaInsets");
          PXEdgeInsetsAdd();
          v8->_padding.top = v27;
          v8->_padding.left = v28;
          v8->_padding.bottom = v29;
          v8->_padding.right = v30;
          goto LABEL_31;
      }
    }
    v8->_interItemSpacing = (CGSize)v15;
    p_itemInternalSquareMargin = (uint64_t *)&v8->_itemInternalSquareMargin;
    *(double *)&v17 = 34.0;
    goto LABEL_28;
  }
LABEL_31:

  return v8;
}

- (int64_t)numberOfColumnsForNumberOfItems:(int64_t)a3
{
  unint64_t numberOfColumns;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double width;
  int64_t v12;
  double height;
  double v15;
  double v17;
  uint64_t v18;
  double v19;

  numberOfColumns = self->_numberOfColumns;
  if (numberOfColumns == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[PXMessagesUISettings sharedInstance](PXMessagesUISettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minItemSize");
    v8 = v7;
    v9 = objc_msgSend(v6, "minColumns");
    objc_msgSend(v6, "maxColumns");
    objc_msgSend(v6, "comfortableFitPercentage");
    width = self->_referenceSize.width;
    v12 = llround(width / v8);
    if (width > 0.0 && a3 >= 1)
    {
      height = self->_referenceSize.height;
      if (height > 0.0)
      {
        v15 = height - self->_padding.top - self->_padding.bottom;
        if (v15 > 0.0 && v9 < v12)
        {
          v17 = v10 * v15;
          v18 = v9;
          do
          {
            if (width / (double)v18 * (double)(uint64_t)ceil((double)a3 / (double)v18) < v17)
              break;
            ++v18;
          }
          while (v12 != v18);
        }
      }
    }
    PXClamp();
    numberOfColumns = (uint64_t)v19;

  }
  return numberOfColumns;
}

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (CGSize)itemInternalMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_itemInternalMargin.width;
  height = self->_itemInternalMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)itemInternalSquareMargin
{
  double width;
  double height;
  CGSize result;

  width = self->_itemInternalSquareMargin.width;
  height = self->_itemInternalSquareMargin.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

@end
