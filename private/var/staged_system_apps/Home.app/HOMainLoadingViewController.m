@implementation HOMainLoadingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HOMainLoadingViewController;
  -[HOMainLoadingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainLoadingViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (HUWallpaperView)wallpaperView
{
  HUWallpaperView *wallpaperView;
  id v4;
  void *v5;
  HUWallpaperView *v6;
  HUWallpaperView *v7;
  void *v8;

  wallpaperView = self->_wallpaperView;
  if (!wallpaperView)
  {
    v4 = objc_alloc((Class)HUWallpaperView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainLoadingViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v6 = (HUWallpaperView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_wallpaperView;
    self->_wallpaperView = v6;

    -[HUWallpaperView setAutoresizingMask:](self->_wallpaperView, "setAutoresizingMask:", 18);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainLoadingViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", self->_wallpaperView);

    wallpaperView = self->_wallpaperView;
  }
  return wallpaperView;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)setWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
