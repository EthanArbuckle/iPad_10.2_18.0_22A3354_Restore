@implementation _TVLoadingImageView

- (_TVLoadingImageView)initWithFrame:(CGRect)a3
{
  _TVLoadingImageView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVLoadingImageView;
  v3 = -[_TVLoadingImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVLoadingImageView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_TVLoadingImageView setAlpha:](v3, "setAlpha:", 0.0);
    -[_TVLoadingImageView _fadeInFadeOut](v3, "_fadeInFadeOut");
  }
  return v3;
}

- (void)_fadeInFadeOut
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke;
  v6[3] = &unk_24EB854F8;
  objc_copyWeak(&v7, &location);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_2;
  v4[3] = &unk_24EB86C20;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "animateWithDuration:delay:options:animations:completion:", 0, v6, v4, 0.5, 0.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x24BDF7718];
  v4 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v6 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end
