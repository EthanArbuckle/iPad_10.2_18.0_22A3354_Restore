@implementation _TUIVideoPlayButton

- (_TUIVideoPlayButton)init
{
  _TUIVideoPlayButton *v2;
  _TUIVideoPlayButton *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UIImageView *v9;
  UIImageView *glyphView;
  void *v11;
  AVBackgroundView *v12;
  AVBackgroundView *backgroundView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_TUIVideoPlayButton;
  v2 = -[_TUIVideoPlayButton initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tui_imageNamed:inBundle:](UIImage, "tui_imageNamed:inBundle:", CFSTR("play_glyph.png"), v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));

    v8 = objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    glyphView = v3->_glyphView;
    v3->_glyphView = v9;

    -[UIImageView setImage:](v3->_glyphView, "setImage:", v7);
    -[UIImageView setUserInteractionEnabled:](v3->_glyphView, "setUserInteractionEnabled:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIImageView setTintColor:](v3->_glyphView, "setTintColor:", v11);

    v12 = (AVBackgroundView *)objc_alloc_init((Class)AVBackgroundView);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v12;

    -[AVBackgroundView addSubview:applyingMaterialStyle:tintEffectStyle:](v3->_backgroundView, "addSubview:applyingMaterialStyle:tintEffectStyle:", v3->_glyphView, 0, 0);
    -[AVBackgroundView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[AVBackgroundView setCircular:](v3->_backgroundView, "setCircular:", 1);
    -[_TUIVideoPlayButton addSubview:](v3, "addSubview:", v3->_backgroundView);

  }
  return v3;
}

+ (CGSize)computeSizeFittingVideoSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width >= a3.height)
    a3.width = a3.height;
  v3 = fmin(a3.width, 31.0);
  if (v3 < 60.0)
    v3 = 60.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  AVBackgroundView *backgroundView;
  UIImageView *glyphView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *v11;
  CGFloat v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)_TUIVideoPlayButton;
  -[_TUIVideoPlayButton layoutSubviews](&v13, "layoutSubviews");
  backgroundView = self->_backgroundView;
  -[_TUIVideoPlayButton bounds](self, "bounds");
  -[AVBackgroundView setFrame:](backgroundView, "setFrame:");
  glyphView = self->_glyphView;
  -[_TUIVideoPlayButton bounds](self, "bounds");
  -[UIImageView sizeThatFits:](glyphView, "sizeThatFits:", v5, v6);
  v8 = v7;
  v10 = v9;
  v11 = self->_glyphView;
  -[_TUIVideoPlayButton bounds](self, "bounds");
  v12 = CGRectGetMidX(v14) - v8 * 0.5;
  -[_TUIVideoPlayButton bounds](self, "bounds");
  -[UIImageView setFrame:](v11, "setFrame:", v12, CGRectGetMidY(v15) - v10 * 0.5, v8, v10);
}

- (UIImageView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
