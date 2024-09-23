@implementation PUReviewScreenControlBarButton

- (CGSize)intrinsicContentSize
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[PUReviewScreenControlBarButton useCompactSize](self, "useCompactSize");
  v3 = 42.0;
  if (v2)
    v3 = 30.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_padding
{
  _BOOL4 v2;
  double result;

  v2 = -[PUReviewScreenControlBarButton useCompactSize](self, "useCompactSize");
  result = 6.0;
  if (v2)
    return 4.0;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[PUReviewScreenControlBarButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[PUReviewScreenControlBarButton intrinsicContentSize](self, "intrinsicContentSize");
  v9 = v5 - v8;
  if (v9 >= 0.0)
    v10 = v9 * 0.5;
  else
    v10 = 0.0;
  -[PUReviewScreenControlBarButton intrinsicContentSize](self, "intrinsicContentSize");
  v12 = (50.0 - v11) * 0.5;
  if (v10 >= v12)
    v13 = v10;
  else
    v13 = v12;
  -[PUReviewScreenControlBarButton _padding](self, "_padding");
  v15 = v7 + v14;
  v16 = 0.0;
  v17 = v13;
  v18 = v13;
  result.right = v18;
  result.bottom = v15;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat MidX;
  double v26;
  double v27;
  CGFloat v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29.receiver = self;
  v29.super_class = (Class)PUReviewScreenControlBarButton;
  -[PUReviewScreenControlBarButton layoutSubviews](&v29, sel_layoutSubviews);
  -[PUReviewScreenControlBarButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUReviewScreenControlBarButton _padding](self, "_padding");
  v12 = v11;
  v26 = v11;
  -[PUReviewScreenControlBarButton imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenControlBarButton titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[PUReviewScreenControlBarButton intrinsicContentSize](self, "intrinsicContentSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v14, "intrinsicContentSize");
  v27 = v19;
  v28 = v20;
  v21 = v12 + v20;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v22 = CGRectGetMidY(v30) - v18 * 0.5 - v21 * 0.5;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v23 = CGRectGetMidX(v31) - v16 * 0.5;
  objc_msgSend(v13, "setFrame:", PURoundRectToPixel(v23, v22, v16, v18));
  v32.origin.x = v23;
  v32.origin.y = v22;
  v32.size.width = v16;
  v32.size.height = v18;
  v24 = v26 + CGRectGetMaxY(v32);
  v33.origin.x = v23;
  v33.origin.y = v22;
  v33.size.width = v16;
  v33.size.height = v18;
  MidX = CGRectGetMidX(v33);
  objc_msgSend(v14, "setFrame:", PUExtendRectToPixel(MidX - v27 * 0.5, v24, v27, v28));

}

- (double)_selectedIndicatorAlpha
{
  return 0.0;
}

- (BOOL)useCompactSize
{
  return self->_useCompactSize;
}

- (void)setUseCompactSize:(BOOL)a3
{
  self->_useCompactSize = a3;
}

@end
