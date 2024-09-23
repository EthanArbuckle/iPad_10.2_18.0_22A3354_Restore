@implementation UIKBTutorialConversationBubble

- (UIKBTutorialConversationBubble)initWithText:(id)a3 originationDirection:(int64_t)a4
{
  id v6;
  UIKBTutorialConversationBubble *v7;
  UIKBTutorialConversationBubble *v8;
  UILabel *v9;
  UILabel *summaryLabel;
  void *v11;
  UIKBTutorialConversationBubbleShadowLayer *v12;
  UIKBTutorialConversationBubbleShadowLayer *broadShadowLayer;
  UIKBTutorialConversationBubbleShadowLayer *v14;
  UIKBTutorialConversationBubbleShadowLayer *tightShadowLayer;
  UIKBTutorialConversationBubbleBackdropLayer *v16;
  UIKBTutorialConversationBubbleBackdropLayer *backdropLayer;
  CAShapeLayer *v18;
  CAShapeLayer *backdropMaskShapeLayer;
  void *v20;
  void *v21;
  UIKBTutorialConversationBubbleBackdropLayer *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIKBTutorialConversationBubble;
  v7 = -[UIView init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_originationDirection = a4;
    v9 = objc_alloc_init(UILabel);
    summaryLabel = v8->_summaryLabel;
    v8->_summaryLabel = v9;

    -[UILabel setTextAlignment:](v8->_summaryLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v8->_summaryLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v8->_summaryLabel, "setNumberOfLines:", 2);
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 12.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_summaryLabel, "setFont:", v11);

    -[UILabel setText:](v8->_summaryLabel, "setText:", v6);
    -[UIView addSubview:](v8, "addSubview:", v8->_summaryLabel);
    objc_storeStrong((id *)&v8->_contentView, v8->_summaryLabel);
    v12 = -[UIKBTutorialConversationBubbleShadowLayer initWithShadowType:]([UIKBTutorialConversationBubbleShadowLayer alloc], "initWithShadowType:", 0);
    broadShadowLayer = v8->_broadShadowLayer;
    v8->_broadShadowLayer = v12;

    v14 = -[UIKBTutorialConversationBubbleShadowLayer initWithShadowType:]([UIKBTutorialConversationBubbleShadowLayer alloc], "initWithShadowType:", 1);
    tightShadowLayer = v8->_tightShadowLayer;
    v8->_tightShadowLayer = v14;

    v16 = objc_alloc_init(UIKBTutorialConversationBubbleBackdropLayer);
    backdropLayer = v8->_backdropLayer;
    v8->_backdropLayer = v16;

    v18 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backdropMaskShapeLayer = v8->_backdropMaskShapeLayer;
    v8->_backdropMaskShapeLayer = v18;

    -[UIKBTutorialConversationBubbleBackdropLayer setMask:](v8->_backdropLayer, "setMask:", v8->_backdropMaskShapeLayer);
    -[UIKBTutorialConversationBubble _updateUserInterfaceStyles](v8, "_updateUserInterfaceStyles");
    -[UIView layer](v8, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v8->_broadShadowLayer);

    -[UIView layer](v8, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v8->_tightShadowLayer);

    v22 = v8->_backdropLayer;
    -[UIView layer](v8->_contentView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBTutorialConversationBubbleBackdropLayer addSublayer:](v22, "addSublayer:", v23);

    -[UIView layer](v8, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v8->_backdropLayer);

  }
  return v8;
}

- (void)layoutSubviews
{
  double v3;
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
  int64_t originationDirection;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double Width;
  void *v29;
  double MaxX;
  double MinY;
  double v32;
  UIBezierPath *v33;
  void *v34;
  void *v35;
  UIBezierPath *v36;
  uint64_t v37;
  double v38;
  double v39;
  double MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MinX;
  double v47;
  double v48;
  _QWORD v49[9];
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v50.receiver = self;
  v50.super_class = (Class)UIKBTutorialConversationBubble;
  -[UIView layoutSubviews](&v50, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKBTutorialConversationBubbleShadowLayer setFrame:](self->_broadShadowLayer, "setFrame:");
  -[UIKBTutorialConversationBubbleShadowLayer setFrame:](self->_tightShadowLayer, "setFrame:", v4, v6, v8, v10);
  -[CAShapeLayer setFrame:](self->_backdropMaskShapeLayer, "setFrame:", v4, v6, v8, v10);
  -[UIKBTutorialConversationBubbleBackdropLayer setFrame:](self->_backdropLayer, "setFrame:", v4, v6, v8, v10);
  -[UIKBTutorialConversationBubble contentViewPadding](self, "contentViewPadding");
  v41 = v12;
  v43 = v11;
  v39 = v13;
  v47 = v14;
  -[UIKBTutorialConversationBubble balloonTailHeight](self, "balloonTailHeight");
  -[UIKBTutorialConversationBubble pillCornerRadius](self, "pillCornerRadius");
  v38 = v15;
  originationDirection = self->_originationDirection;
  -[UIKBTutorialConversationBubble pillRect](self, "pillRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UIKBTutorialConversationBubble tailAnchorPoint](self, "tailAnchorPoint");
  v51.origin.x = v4 + v39;
  v45 = v4 + v39;
  v25 = v6 + v43;
  v26 = v8 - v39 - v41;
  v27 = v10 - v43 - v47;
  v51.origin.y = v25;
  v51.size.width = v26;
  v51.size.height = v27;
  Width = CGRectGetWidth(v51);
  -[UIKBTutorialConversationBubble summaryLabel](self, "summaryLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPreferredMaxLayoutWidth:", Width);

  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __48__UIKBTutorialConversationBubble_layoutSubviews__block_invoke;
  v49[3] = &unk_1E16B20D8;
  v49[4] = self;
  *(double *)&v49[5] = v45;
  *(CGFloat *)&v49[6] = v25;
  *(CGFloat *)&v49[7] = v26;
  *(CGFloat *)&v49[8] = v27;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v49);
  v52.origin.x = v18;
  v52.origin.y = v20;
  v52.size.width = v22;
  v52.size.height = v24;
  CGRectGetMaxX(v52);
  v53.origin.x = v18;
  v53.origin.y = v20;
  v53.size.width = v22;
  v53.size.height = v24;
  CGRectGetMaxX(v53);
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v24;
  CGRectGetMaxY(v54);
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  MaxX = CGRectGetMaxX(v55);
  v56.origin.x = v18;
  v56.origin.y = v20;
  v56.size.width = v22;
  v56.size.height = v24;
  MinY = CGRectGetMinY(v56);
  v57.origin.x = v18;
  v57.origin.y = v20;
  v57.size.width = v22;
  v57.size.height = v24;
  v44 = CGRectGetMaxX(v57);
  v58.origin.x = v18;
  v58.origin.y = v20;
  v58.size.width = v22;
  v58.size.height = v24;
  MaxY = CGRectGetMaxY(v58);
  v59.origin.x = v18;
  v59.origin.y = v20;
  v59.size.width = v22;
  v59.size.height = v24;
  MinX = CGRectGetMinX(v59);
  v60.origin.x = v18;
  v60.origin.y = v20;
  v60.size.width = v22;
  v60.size.height = v24;
  v42 = CGRectGetMaxY(v60);
  v61.origin.x = v18;
  v61.origin.y = v20;
  v61.size.width = v22;
  v61.size.height = v24;
  v48 = CGRectGetMinX(v61);
  v62.origin.x = v18;
  v62.origin.y = v20;
  v62.size.width = v22;
  v62.size.height = v24;
  v32 = CGRectGetMinY(v62);
  v33 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v33, "moveToPoint:", v38 + v18, v20);
  -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, MinY, v38, v38);
  if (originationDirection == 1)
  {
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v44, MaxY, v38, v38);
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v42, v38, v38);
    -[UIBezierPath currentPoint](v33, "currentPoint");
    -[UIKBTutorialConversationBubble _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:", self->_originationDirection);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBezierPath appendPath:](v33, "appendPath:", v34);

  }
  else
  {
    -[UIBezierPath currentPoint](v33, "currentPoint");
    -[UIKBTutorialConversationBubble _pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:](self, "_pathForTailedBalloonSegmentWithStartPoint:endPoint:anchorPoint:originationDirection:", self->_originationDirection);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBezierPath appendPath:](v33, "appendPath:", v35);

    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v44, MaxY, v38, v38);
    -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v42, v38, v38);
  }
  -[UIBezierPath _addRoundedCornerWithTrueCorner:radius:corner:clockwise:](v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v48, v32, v38, v38);
  -[UIBezierPath addLineToPoint:](v33, "addLineToPoint:", v38 + v18, v20);
  v36 = objc_retainAutorelease(v33);
  v37 = -[UIBezierPath CGPath](v36, "CGPath");
  -[CAShapeLayer setPath:](self->_backdropMaskShapeLayer, "setPath:", v37);
  -[UIKBTutorialConversationBubbleShadowLayer setShadowPath:](self->_broadShadowLayer, "setShadowPath:", v37);
  -[UIKBTutorialConversationBubbleShadowLayer setShadowPath:](self->_tightShadowLayer, "setShadowPath:", v37);

}

void __48__UIKBTutorialConversationBubble_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double width;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIKBTutorialConversationBubble contentViewPadding](self, "contentViewPadding");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIKBTutorialConversationBubble balloonTailWidth](self, "balloonTailWidth");
  -[UIKBTutorialConversationBubble balloonTailHeight](self, "balloonTailHeight");
  v14 = v13;
  -[UIKBTutorialConversationBubble pillCornerRadius](self, "pillCornerRadius");
  -[UIKBTutorialConversationBubble contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", width - v8 - v12 - v14, height - v6 - v10);

  -[UIKBTutorialConversationBubble summaryLabel](self, "summaryLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberOfLines");

  UICeilToViewScale(self);
  v18 = v17;
  UICeilToViewScale(self);
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self, "bounds");
  -[UIKBTutorialConversationBubble sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateUserInterfaceStyles
{
  void *v3;
  uint64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[UIKBTutorialConversationBubbleBackdropLayer setUserInterfaceStyle:](self->_backdropLayer, "setUserInterfaceStyle:", v4);
  -[UIKBTutorialConversationBubbleShadowLayer setUserInterfaceStyle:](self->_broadShadowLayer, "setUserInterfaceStyle:", v4);
  -[UIKBTutorialConversationBubbleShadowLayer setUserInterfaceStyle:](self->_tightShadowLayer, "setUserInterfaceStyle:", v4);
}

- (CGPoint)tailAnchorPoint
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int64_t originationDirection;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinY;
  double MaxY;
  double MinX;
  double v23;
  CGRect v24;
  CGPoint result;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[UIView bounds](self, "bounds");
  v24.origin.x = v3;
  v24.origin.y = v4;
  v24.size.width = v5;
  v24.size.height = v6;
  -[UIKBTutorialConversationBubble pillRect](self, "pillRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  originationDirection = self->_originationDirection;
  -[UIKBTutorialConversationBubble balloonTailWidth](self, "balloonTailWidth");
  v17 = v16;
  -[UIKBTutorialConversationBubble pillCornerRadius](self, "pillCornerRadius");
  v19 = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  MinY = CGRectGetMinY(v26);
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  CGRectGetMinY(v27);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  MaxY = CGRectGetMaxY(v28);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  CGRectGetMaxY(v29);
  if (originationDirection == 1)
    MinX = CGRectGetMinX(v24);
  else
    MinX = CGRectGetMaxX(v24);
  v23 = v17 * 0.354320161 + v19 + MinY;
  if (v23 < MaxY - v19 + v17 * -0.645679839)
    v23 = MaxY - v19 + v17 * -0.645679839;
  result.y = v23;
  result.x = MinX;
  return result;
}

- (id)_pathForTailedBalloonSegmentWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 anchorPoint:(CGPoint)a5 originationDirection:(int64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  UIBezierPath *v13;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v13 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v13, "moveToPoint:", v12, v11);
  if (a6 == 1)
  {
    -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", x, y);
    y = v9 + (y - v9) * 0.5;
    x = v10;
  }
  else
  {
    -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", v12, v11 + (y - v11) * 0.5);
  }
  -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", x, y);
  -[UIBezierPath addLineToPoint:](v13, "addLineToPoint:", v10, v9);
  return v13;
}

- (CGRect)pillRect
{
  double v3;
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
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKBTutorialConversationBubble balloonTailWidth](self, "balloonTailWidth");
  v12 = 0.0;
  if (self->_originationDirection == 1)
    v12 = v11;
  v13 = v8 - v11;
  v14 = v4 + v12;
  v15 = v6;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)pillCornerRadius
{
  return 10.0;
}

- (UIEdgeInsets)contentViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 21.0;
  if (self->_originationDirection == 1)
  {
    v3 = 7.0;
  }
  else
  {
    v2 = 7.0;
    v3 = 14.0;
  }
  v4 = 5.0;
  v5 = 5.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (double)balloonTailHeight
{
  double v2;

  -[UIKBTutorialConversationBubble balloonTailWidth](self, "balloonTailWidth");
  return v2 * 2.41;
}

- (double)balloonTailWidth
{
  double result;

  -[UIKBTutorialConversationBubble pillCornerRadius](self, "pillCornerRadius");
  UIRoundToViewScale(self);
  return result;
}

- (double)balloonTailRadius
{
  return 3.0;
}

- (double)balloonCornerRadius
{
  return 10.0;
}

- (double)activityItemToContactItemVerticalOverlap
{
  return 3.0;
}

- (CAShapeLayer)backdropMaskShapeLayer
{
  return self->_backdropMaskShapeLayer;
}

- (void)setBackdropMaskShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, a3);
}

- (UIKBTutorialConversationBubbleShadowLayer)broadShadowLayer
{
  return self->_broadShadowLayer;
}

- (void)setBroadShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_broadShadowLayer, a3);
}

- (UIKBTutorialConversationBubbleShadowLayer)tightShadowLayer
{
  return self->_tightShadowLayer;
}

- (void)setTightShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_tightShadowLayer, a3);
}

- (UIKBTutorialConversationBubbleBackdropLayer)backdropLayer
{
  return self->_backdropLayer;
}

- (void)setBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayer, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)originationDirection
{
  return self->_originationDirection;
}

- (void)setOriginationDirection:(int64_t)a3
{
  self->_originationDirection = a3;
}

- (CGPoint)originationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originationPoint.x;
  y = self->_originationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginationPoint:(CGPoint)a3
{
  self->_originationPoint = a3;
}

- (double)preferredTailAttachmentPointXCoordinate
{
  return self->_preferredTailAttachmentPointXCoordinate;
}

- (void)setPreferredTailAttachmentPointXCoordinate:(double)a3
{
  self->_preferredTailAttachmentPointXCoordinate = a3;
}

- (CGPoint)tailAttachmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_tailAttachmentPoint.x;
  y = self->_tailAttachmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)parentAvatarViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_parentAvatarViewSize.width;
  height = self->_parentAvatarViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setParentAvatarViewSize:(CGSize)a3
{
  self->_parentAvatarViewSize = a3;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_tightShadowLayer, 0);
  objc_storeStrong((id *)&self->_broadShadowLayer, 0);
  objc_storeStrong((id *)&self->_backdropMaskShapeLayer, 0);
}

@end
