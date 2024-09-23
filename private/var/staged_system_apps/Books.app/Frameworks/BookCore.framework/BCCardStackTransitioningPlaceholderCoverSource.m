@implementation BCCardStackTransitioningPlaceholderCoverSource

- (BCCardStackTransitioningPlaceholderCoverSource)initWithCoverFrame:(CGRect)a3 referenceView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  BCCardStackTransitioningPlaceholderCoverSource *v11;
  BCCardStackTransitioningPlaceholderCoverSource *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCCardStackTransitioningPlaceholderCoverSource;
  v11 = -[BCCardStackTransitioningPlaceholderCoverSource init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_frame.origin.x = x;
    v11->_frame.origin.y = y;
    v11->_frame.size.width = width;
    v11->_frame.size.height = height;
    objc_storeStrong((id *)&v11->_referenceView, a4);
  }

  return v12;
}

- (UIImage)cardStackTransitioningCoverSourceImage
{
  return 0;
}

- (id)cardStackTransitioningCoverSourceHide
{
  return &stru_28BA98;
}

- (BOOL)isInNonHorizontalLayout
{
  return 0;
}

- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  -[BCCardStackTransitioningPlaceholderCoverSource frame](self, "frame");
  if (!CGRectIsEmpty(v14))
  {
    -[BCCardStackTransitioningPlaceholderCoverSource frame](self, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitioningPlaceholderCoverSource referenceView](self, "referenceView"));
    objc_msgSend(v13, "convertRect:fromView:", v12, v5, v7, v9, v11);
    -[BCCardStackTransitioningPlaceholderCoverSource setFrame:](self, "setFrame:");

    -[BCCardStackTransitioningPlaceholderCoverSource setReferenceView:](self, "setReferenceView:", v13);
  }

}

- (double)cardStackTransitioningCoverSourceExtraXOffset
{
  return self->cardStackTransitioningCoverSourceExtraXOffset;
}

- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3
{
  self->cardStackTransitioningCoverSourceExtraXOffset = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceView, 0);
}

@end
