@implementation VKKeyboardCameraReticleView

- (VKKeyboardCameraReticleView)initWithFrame:(CGRect)a3
{
  VKKeyboardCameraReticleView *v3;
  CEKSubjectIndicatorView *v4;
  CEKSubjectIndicatorView *reticleView;
  UIView *v6;
  UIView *spotlightView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKKeyboardCameraReticleView;
  v3 = -[VKKeyboardCameraReticleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CEKSubjectIndicatorView *)objc_alloc_init(MEMORY[0x1E0D0D0A0]);
    reticleView = v3->_reticleView;
    v3->_reticleView = v4;

    -[CEKSubjectIndicatorView setShape:](v3->_reticleView, "setShape:", 1);
    -[CEKSubjectIndicatorView setHidden:](v3->_reticleView, "setHidden:", 1);
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    spotlightView = v3->_spotlightView;
    v3->_spotlightView = v6;

    -[UIView setHidden:](v3->_spotlightView, "setHidden:", 1);
    -[VKKeyboardCameraReticleView addSubview:](v3, "addSubview:", v3->_reticleView);
    -[VKKeyboardCameraReticleView addSubview:](v3, "addSubview:", v3->_spotlightView);
  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)VKKeyboardCameraReticleView;
  -[VKKeyboardCameraReticleView layoutSubviews](&v9, sel_layoutSubviews);
  if (!self->_hasSetReticleRect)
  {
    -[VKKeyboardCameraReticleView bounds](self, "bounds");
    x = v10.origin.x;
    y = v10.origin.y;
    width = v10.size.width;
    height = v10.size.height;
    MidX = CGRectGetMidX(v10);
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    v8 = CGRectGetMidX(v11);
    -[CEKSubjectIndicatorView setFrame:](self->_reticleView, "setFrame:", MidX, v8, 0.0, 0.0);
    -[UIView setFrame:](self->_spotlightView, "setFrame:", MidX, v8, 0.0, 0.0);
  }
}

- (double)spotlightBlurRadius
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self->_spotlightView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setSpotlightBlurRadius:(double)a3
{
  id v4;

  -[UIView layer](self->_spotlightView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowRadius:", a3);

}

- (double)invertedShadowAlpha
{
  double result;

  -[UIView alpha](self->_spotlightView, "alpha");
  return result;
}

- (void)setInvertedShadowAlpha:(double)a3
{
  -[UIView setAlpha:](self->_spotlightView, "setAlpha:", a3);
}

- (void)setReticleRect:(CGRect)a3 angle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  double v12;
  CEKSubjectIndicatorView *reticleView;
  UIView *spotlightView;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  CGFloat v24;
  __int128 v25;
  CGFloat v26;
  __int128 v27;
  CGFloat v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _OWORD v32[3];
  _OWORD v33[2];
  __int128 v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_hasSetReticleRect)
  {
    -[CEKSubjectIndicatorView setHidden:](self->_reticleView, "setHidden:", 0);
    -[UIView setHidden:](self->_spotlightView, "setHidden:", 0);
    -[UIView layer](self->_spotlightView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _setContinuousCornerRadius:](self->_spotlightView, "_setContinuousCornerRadius:", 20.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v11, "CGColor"));

    LODWORD(v12) = 1.0;
    objc_msgSend(v10, "setShadowOpacity:", v12);
    objc_msgSend(v10, "setShadowPathIsBounds:", 1);
    objc_msgSend(v10, "setInvertsShadow:", 1);
    self->_hasSetReticleRect = 1;

  }
  reticleView = self->_reticleView;
  v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33[0] = *MEMORY[0x1E0C9BAA8];
  v25 = v33[0];
  v33[1] = v27;
  v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *((_QWORD *)&v23 + 1) = *((_QWORD *)&v34 + 1);
  -[CEKSubjectIndicatorView setTransform:](reticleView, "setTransform:", v33, (_QWORD)v34);
  spotlightView = self->_spotlightView;
  v32[0] = v25;
  v32[1] = v27;
  v32[2] = v23;
  -[UIView setTransform:](spotlightView, "setTransform:", v32);
  if (width * height <= 0.0)
  {
    v22 = height;
    v21 = width;
    v20 = y;
    v15 = x;
  }
  else
  {
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v36 = CGRectInset(v35, -10.0, -10.0);
    v15 = v36.origin.x;
    v24 = v36.origin.y;
    v26 = v36.size.width;
    v28 = v36.size.height;
    -[VKKeyboardCameraReticleView spotlightBlurRadius](self, "spotlightBlurRadius");
    v17 = -10.0 - v16;
    -[VKKeyboardCameraReticleView spotlightBlurRadius](self, "spotlightBlurRadius");
    v19 = -10.0 - v18;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectInset(v37, v17, v19);
    x = v38.origin.x;
    y = v38.origin.y;
    v20 = v24;
    width = v38.size.width;
    v21 = v26;
    height = v38.size.height;
    v22 = v28;
  }
  -[CEKSubjectIndicatorView setFrame:](self->_reticleView, "setFrame:", v15, v20, v21, v22);
  -[UIView setFrame:](self->_spotlightView, "setFrame:", x, y, width, height);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeRotation(&v31, a4);
  v30 = v31;
  -[CEKSubjectIndicatorView setTransform:](self->_reticleView, "setTransform:", &v30);
  v29 = v31;
  -[UIView setTransform:](self->_spotlightView, "setTransform:", &v29);
}

- (void)collapseReticleRect
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v6;
  CGRect v7;

  if (self->_hasSetReticleRect && (-[CEKSubjectIndicatorView isHidden](self->_reticleView, "isHidden") & 1) == 0)
  {
    -[CEKSubjectIndicatorView frame](self->_reticleView, "frame");
    y = v6.origin.y;
    width = v6.size.width;
    height = v6.size.height;
    v7.origin.x = CGRectGetMidX(v6);
    v7.origin.y = y;
    v7.size.width = width;
    v7.size.height = height;
    -[VKKeyboardCameraReticleView setReticleRect:angle:](self, "setReticleRect:angle:", v7.origin.x, CGRectGetMidY(v7), 0.0, 0.0, 0.0);
  }
}

- (double)reticleAlpha
{
  double result;

  -[CEKSubjectIndicatorView alpha](self->_reticleView, "alpha");
  return result;
}

- (void)setReticleAlpha:(double)a3
{
  -[CEKSubjectIndicatorView setAlpha:](self->_reticleView, "setAlpha:", a3);
}

+ (void)animate:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, a3, 0, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightView, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
}

@end
