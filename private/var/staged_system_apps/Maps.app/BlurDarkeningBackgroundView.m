@implementation BlurDarkeningBackgroundView

+ (id)_topFilterLayerBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.313725501, 0.0299999993);
}

- (BlurDarkeningBackgroundView)initWithFrame:(CGRect)a3
{
  BlurDarkeningBackgroundView *v3;
  BlurDarkeningBackgroundView *v4;
  id v5;
  double y;
  double width;
  double height;
  UIImageView *v9;
  UIImageView *bottomFilterView;
  UIImageView *v11;
  UIImageView *topFilterView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _QWORD v28[3];
  _BYTE v29[128];

  v27.receiver = self;
  v27.super_class = (Class)BlurDarkeningBackgroundView;
  v3 = -[BlurDarkeningBackgroundView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[BlurDarkeningBackgroundView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bottomFilterView = v4->_bottomFilterView;
    v4->_bottomFilterView = v9;

    -[UIImageView setOpaque:](v4->_bottomFilterView, "setOpaque:", 0);
    -[BlurDarkeningBackgroundView addSubview:](v4, "addSubview:", v4->_bottomFilterView);
    v11 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    topFilterView = v4->_topFilterView;
    v4->_topFilterView = v11;

    -[UIImageView setOpaque:](v4->_topFilterView, "setOpaque:", 0);
    -[BlurDarkeningBackgroundView addSubview:](v4, "addSubview:", v4->_topFilterView);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BlurDarkeningBackgroundView layer](v4, "layer", 0));
    v28[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_bottomFilterView, "layer"));
    v28[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v4->_topFilterView, "layer"));
    v28[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v21, "setAllowsGroupOpacity:", 0);
          objc_msgSend(v21, "setAllowsGroupBlending:", 0);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v18);
    }

    -[BlurDarkeningBackgroundView _applyAppearance](v4, "_applyAppearance");
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BlurDarkeningBackgroundView;
  -[BlurDarkeningBackgroundView layoutSubviews](&v3, "layoutSubviews");
  if (!-[BlurDarkeningBackgroundView animatingLayers](self, "animatingLayers"))
  {
    -[BlurDarkeningBackgroundView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_bottomFilterView, "setFrame:");
    -[BlurDarkeningBackgroundView bounds](self, "bounds");
    -[UIImageView setFrame:](self->_topFilterView, "setFrame:");
  }
}

- (void)setRoundedCornersStyle:(int64_t)a3
{
  void *v4;

  if (self->_roundedCornersStyle != a3)
  {
    self->_roundedCornersStyle = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BlurDarkeningBackgroundView window](self, "window"));

    if (v4)
      -[BlurDarkeningBackgroundView _maps_setNeedsUpdateWithSelector:](self, "_maps_setNeedsUpdateWithSelector:", "_applyAppearance");
  }
}

- (void)setAppearance:(int64_t)a3
{
  void *v4;

  if (self->_appearance != a3)
  {
    self->_appearance = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BlurDarkeningBackgroundView window](self, "window"));

    if (v4)
      -[BlurDarkeningBackgroundView _applyAppearance](self, "_applyAppearance");
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BlurDarkeningBackgroundView;
  -[BlurDarkeningBackgroundView didMoveToWindow](&v3, "didMoveToWindow");
  -[BlurDarkeningBackgroundView _applyAppearance](self, "_applyAppearance");
}

- (void)_applyAppearance
{
  _QWORD *v3;
  _QWORD v4[5];

  -[BlurDarkeningBackgroundView _maps_setNeedsUpdate:withSelector:](self, "_maps_setNeedsUpdate:withSelector:", 0, a2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006FD724;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  if (+[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters"))
  {
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 0, v3, 0, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
  }

}

- (id)_roundedCornersResizableImageWithColor:(id)a3
{
  double scale;
  id v4;
  void *v5;
  UIImage *ImageFromCurrentImageContext;
  void *v7;
  void *v8;
  CGSize v10;

  scale = self->_scale;
  v4 = a3;
  v10.width = 13.0;
  v10.height = 13.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, scale);
  objc_msgSend(v4, "setFill");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, 13.0, 13.0, 5.0));
  objc_msgSend(v5, "fill");

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resizableImageWithCapInsets:", 6.0, 6.0, 6.0, 6.0));

  return v8;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (int64_t)roundedCornersStyle
{
  return self->_roundedCornersStyle;
}

- (BOOL)animatingLayers
{
  return self->_animatingLayers;
}

- (void)setAnimatingLayers:(BOOL)a3
{
  self->_animatingLayers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomFilterView, 0);
  objc_storeStrong((id *)&self->_topFilterView, 0);
}

@end
