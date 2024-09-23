@implementation SBApplicationBlurSnapshotGenerationContainerView

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
  void *v12;
  id v13;

  -[SBApplicationBlurSnapshotGenerationContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBApplicationBlurSnapshotGenerationContainerView wallpaperView](self, "wallpaperView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBApplicationBlurSnapshotGenerationContainerView realSnapshotView](self, "realSnapshotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationBlurSnapshotGenerationContainerView liveBlurView](self, "liveBlurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (UIView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperView, a3);
}

- (UIView)realSnapshotView
{
  return self->_realSnapshotView;
}

- (void)setRealSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_realSnapshotView, a3);
}

- (UIView)liveBlurView
{
  return self->_liveBlurView;
}

- (void)setLiveBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_liveBlurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveBlurView, 0);
  objc_storeStrong((id *)&self->_realSnapshotView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
