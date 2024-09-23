@implementation VideosExtrasNavigationBar

- (VideosExtrasNavigationBar)initWithFrame:(CGRect)a3
{
  VideosExtrasNavigationBar *v3;
  VideosExtrasNavigationBar *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];
  CGSize v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasNavigationBar;
  v3 = -[VideosExtrasNavigationBar initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VideosExtrasNavigationBar setTranslucent:](v3, "setTranslucent:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationBar _backgroundView](v4, "_backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[VideosExtrasNavigationBar _setHidesShadow:](v4, "_setHidesShadow:", 1);
    v12 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasNavigationBar setTitleTextAttributes:](v4, "setTitleTextAttributes:", v8);

    v14.width = 1.0;
    v14.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[VideosExtrasNavigationBar setBackgroundImage:forBarMetrics:](v4, "setBackgroundImage:forBarMetrics:", v9, 0);
    -[VideosExtrasNavigationBar setBackgroundImage:forBarMetrics:](v4, "setBackgroundImage:forBarMetrics:", v9, 101);
    -[VideosExtrasNavigationBar setBackgroundImage:forBarMetrics:](v4, "setBackgroundImage:forBarMetrics:", v9, 1);
    -[VideosExtrasNavigationBar setBackgroundImage:forBarMetrics:](v4, "setBackgroundImage:forBarMetrics:", v9, 102);

  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  VideosExtrasNavigationBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasNavigationBar;
  -[VideosExtrasNavigationBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (VideosExtrasNavigationBar *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dodgeColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
