@implementation PXZoomableInlineHeadersLayoutSpec

- (PXZoomableInlineHeadersLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL4 v10;
  BOOL v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXZoomableInlineHeadersLayoutSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v19, sel_initWithExtendedTraitCollection_options_, v6, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "layoutSizeClass");
    v9 = (unint64_t)(objc_msgSend(v6, "contentSizeCategory") - 8) < 5;
    *((_QWORD *)v7 + 37) = v9;
    objc_msgSend(v7, "safeAreaInsets");
    v10 = v8 == 1;
    v11 = v9 && v10;
    if (v9 && v10)
      v12 = 50.0;
    else
      v12 = 2.0;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      objc_msgSend(v6, "layoutReferenceSize");
      objc_msgSend(v6, "userInterfaceIdiom");
      if (v11)
        v12 = 50.0;
      else
        v12 = 10.0;
    }
    PXEdgeInsetsMake();
    *((_QWORD *)v7 + 33) = v13;
    *((_QWORD *)v7 + 34) = v14;
    *((_QWORD *)v7 + 35) = v15;
    *((_QWORD *)v7 + 36) = v16;
    v17 = *(_OWORD *)(v7 + 280);
    *(_OWORD *)(v7 + 232) = *(_OWORD *)(v7 + 264);
    *(_OWORD *)(v7 + 248) = v17;
    *((double *)v7 + 33) = v12;
    *((_QWORD *)v7 + 38) = 0x4020000000000000;
  }

  return (PXZoomableInlineHeadersLayoutSpec *)v7;
}

- (UIEdgeInsets)headerFloatMarginsForSafeAreaInsets:(UIEdgeInsets)a3
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v3 = &OBJC_IVAR___PXZoomableInlineHeadersLayoutSpec__headerFloatMargins;
  if (a3.top > 44.0)
    v3 = &OBJC_IVAR___PXZoomableInlineHeadersLayoutSpec__headerFloatMarginsWithTallSafeAreaInsets;
  v4 = (double *)((char *)self + *v3);
  v5 = v4[2];
  v6 = v4[3];
  v7 = *v4;
  v8 = v4[1];
  result.right = v6;
  result.bottom = v5;
  result.left = v8;
  result.top = v7;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (double)headerOffsetY
{
  return self->_headerOffsetY;
}

@end
