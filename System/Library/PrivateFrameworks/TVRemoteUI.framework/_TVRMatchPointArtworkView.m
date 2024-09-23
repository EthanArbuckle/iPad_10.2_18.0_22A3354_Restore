@implementation _TVRMatchPointArtworkView

- (_TVRMatchPointArtworkView)initWithFrame:(CGRect)a3
{
  _TVRMatchPointArtworkView *v3;
  _TVRMatchPointArtworkView *v4;
  void *v5;
  uint64_t v6;
  UIImageView *upImageView;
  uint64_t v8;
  UIImageView *rightImageView;
  uint64_t v10;
  UIImageView *downImageView;
  uint64_t v12;
  UIImageView *leftImageView;
  UIView *v14;
  UIView *selectIndicator;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_TVRMatchPointArtworkView;
  v3 = -[_TVRMatchPointArtworkView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_TVRMatchPointArtworkView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[_TVRMatchPointArtworkView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    _TVRMakeDirectionalImageView(CFSTR("DirectionalControlArrowUp"));
    v6 = objc_claimAutoreleasedReturnValue();
    upImageView = v4->_upImageView;
    v4->_upImageView = (UIImageView *)v6;

    _TVRMakeDirectionalImageView(CFSTR("DirectionalControlArrowRight"));
    v8 = objc_claimAutoreleasedReturnValue();
    rightImageView = v4->_rightImageView;
    v4->_rightImageView = (UIImageView *)v8;

    _TVRMakeDirectionalImageView(CFSTR("DirectionalControlArrowDown"));
    v10 = objc_claimAutoreleasedReturnValue();
    downImageView = v4->_downImageView;
    v4->_downImageView = (UIImageView *)v10;

    _TVRMakeDirectionalImageView(CFSTR("DirectionalControlArrowLeft"));
    v12 = objc_claimAutoreleasedReturnValue();
    leftImageView = v4->_leftImageView;
    v4->_leftImageView = (UIImageView *)v12;

    -[_TVRMatchPointArtworkView addSubview:](v4, "addSubview:", v4->_upImageView);
    -[_TVRMatchPointArtworkView addSubview:](v4, "addSubview:", v4->_rightImageView);
    -[_TVRMatchPointArtworkView addSubview:](v4, "addSubview:", v4->_downImageView);
    -[_TVRMatchPointArtworkView addSubview:](v4, "addSubview:", v4->_leftImageView);
    v14 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    selectIndicator = v4->_selectIndicator;
    v4->_selectIndicator = v14;

    -[UIView _setContinuousCornerRadius:](v4->_selectIndicator, "_setContinuousCornerRadius:", 24.0);
    v16 = v4->_selectIndicator;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UIView setAlpha:](v4->_selectIndicator, "setAlpha:", 0.24);
    -[UIView layer](v4->_selectIndicator, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompositingFilter:", v19);

    -[_TVRMatchPointArtworkView addSubview:](v4, "addSubview:", v4->_selectIndicator);
  }
  return v4;
}

- (void)highlightForButtonType:(int64_t)a3 enabled:(BOOL)a4
{
  int *v4;
  void *v5;
  double v6;

  switch(a3)
  {
    case 12:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__upImageView;
      goto LABEL_8;
    case 13:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__downImageView;
      goto LABEL_8;
    case 14:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__leftImageView;
      goto LABEL_8;
    case 15:
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__rightImageView;
      goto LABEL_8;
    default:
      if (a3 != 1)
        return;
      v4 = &OBJC_IVAR____TVRMatchPointArtworkView__selectIndicator;
LABEL_8:
      v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
      v6 = 0.24;
      if (a4)
        v6 = 0.65;
      objc_msgSend(v5, "setAlpha:", v6);
      return;
  }
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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *selectIndicator;
  objc_super v17;

  -[_TVRMatchPointArtworkView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVRMatchPointArtworkView superview](self, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "contentInsets");
    v4 = v4 + v12;
    v6 = v6 + v13;
    v8 = v8 - (v12 + v14);
    v10 = v10 - (v13 + v15);
  }
  selectIndicator = self->_selectIndicator;
  UIRectCenteredIntegralRect();
  -[UIView setFrame:](selectIndicator, "setFrame:");
  -[UIImageView setFrame:](self->_upImageView, "setFrame:", _TVRImageFrameForDirectionalImage(self->_upImageView, 1, v4, v6, v8, v10));
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", _TVRImageFrameForDirectionalImage(self->_rightImageView, 8, v4, v6, v8, v10));
  -[UIImageView setFrame:](self->_downImageView, "setFrame:", _TVRImageFrameForDirectionalImage(self->_downImageView, 4, v4, v6, v8, v10));
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", _TVRImageFrameForDirectionalImage(self->_leftImageView, 2, v4, v6, v8, v10));
  v17.receiver = self;
  v17.super_class = (Class)_TVRMatchPointArtworkView;
  -[_TVRMatchPointArtworkView layoutSubviews](&v17, sel_layoutSubviews);

}

- (BOOL)touchLocationIsConsideredCenter:(CGPoint)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  -[_TVRMatchPointArtworkView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self->_selectIndicator, "bounds");
  v12 = CGRectGetWidth(v17) + 20.0;
  -[UIView bounds](self->_selectIndicator, "bounds");
  v13 = CGRectGetHeight(v18) + 20.0;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v14 = (CGRectGetWidth(v19) - v12) * 0.5;
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  v21.origin.y = (CGRectGetHeight(v20) - v13) * 0.5;
  v21.origin.x = v14;
  v21.size.width = v12;
  v21.size.height = v13;
  return CGRectContainsPoint(v21, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_downImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_upImageView, 0);
  objc_storeStrong((id *)&self->_selectIndicator, 0);
}

@end
