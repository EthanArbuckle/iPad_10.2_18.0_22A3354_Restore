@implementation SBFloatyFolderBackgroundClipView

- (SBFolderBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  -[SBFolderBackgroundView setEffect:](self->_backgroundView, "setEffect:", a3);
}

- (SBFloatyFolderBackgroundClipView)initWithFrame:(CGRect)a3
{
  SBFloatyFolderBackgroundClipView *v3;
  SBFolderBackgroundView *v4;
  SBFolderBackgroundView *backgroundView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFloatyFolderBackgroundClipView;
  v3 = -[SBFloatyFolderBackgroundClipView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SBFolderBackgroundView);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    -[SBFloatyFolderBackgroundClipView addSubview:](v3, "addSubview:", v3->_backgroundView);
    -[SBFloatyFolderBackgroundClipView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    +[SBFolderBackgroundView cornerRadiusToInsetContent](SBFolderBackgroundView, "cornerRadiusToInsetContent");
    -[SBFloatyFolderBackgroundClipView setCornerRadius:](v3, "setCornerRadius:");
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
  -[SBFolderBackgroundView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
}

- (void)layoutSubviews
{
  int IsZero;
  SBFolderBackgroundView *backgroundView;
  CGRect v5;

  -[SBFolderBackgroundView frame](self->_backgroundView, "frame");
  CGRectGetWidth(v5);
  IsZero = BSFloatIsZero();
  backgroundView = self->_backgroundView;
  -[SBFloatyFolderBackgroundClipView bounds](self, "bounds");
  -[SBFolderBackgroundView setFrame:](backgroundView, "setFrame:");
  if (IsZero)
    -[SBFolderBackgroundView updateTintEffectColor](self->_backgroundView, "updateTintEffectColor");
}

- (unint64_t)backgroundEffect
{
  return -[SBFolderBackgroundView effect](self->_backgroundView, "effect");
}

- (double)cornerRadius
{
  double result;

  -[SBFolderBackgroundView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
