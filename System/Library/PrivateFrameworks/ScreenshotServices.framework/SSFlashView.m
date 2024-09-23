@implementation SSFlashView

+ (Class)_flashViewClass
{
  UIAccessibilityIsReduceTransparencyEnabled();
  return (Class)(id)objc_opt_class();
}

+ (id)flashViewForStyle:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_msgSend(a1, "_flashViewClass"));
  objc_msgSend(v4, "setStyle:", a3);
  return v4;
}

- (SSFlashView)initWithFrame:(CGRect)a3
{
  SSFlashView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSFlashView;
  v3 = -[SSFlashView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSFlashView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v3;
}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  double result;

  objc_msgSend((id)objc_msgSend(a1, "_flashViewClass"), "expectedAnimationDurationForStyle:", a3);
  return result;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[SSFlashView setNeedsLayout](self, "setNeedsLayout");
}

- (void)flashWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (unint64_t)style
{
  return self->_style;
}

@end
