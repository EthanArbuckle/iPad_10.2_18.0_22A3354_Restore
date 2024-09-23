@implementation IMVideoView

- (void)dealloc
{
  objc_super v3;

  -[IMVideoView setVideoLayer:](self, "setVideoLayer:", 0);
  -[IMVideoView setAirplayActive:](self, "setAirplayActive:", 0);
  -[IMVideoView setAirplayRouteName:](self, "setAirplayRouteName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMVideoView;
  -[IMVideoView dealloc](&v3, "dealloc");
}

- (void)setAirplayActive:(BOOL)a3
{
  if (self->_airplayActive != a3)
  {
    self->_airplayActive = a3;
    -[IMVideoView updateAirplayNoContentView](self, "updateAirplayNoContentView");
  }
}

- (void)setVideoLayer:(id)a3
{
  AVPlayerLayer *v5;
  AVPlayerLayer **p_videoLayer;
  AVPlayerLayer *videoLayer;
  void *v8;
  AVPlayerLayer *v9;

  v5 = (AVPlayerLayer *)a3;
  p_videoLayer = &self->_videoLayer;
  videoLayer = self->_videoLayer;
  if (videoLayer != v5)
  {
    v9 = v5;
    -[AVPlayerLayer removeFromSuperlayer](videoLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_videoLayer, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView layer](self, "layer"));
    objc_msgSend(v8, "addSublayer:", *p_videoLayer);

    v5 = v9;
  }

}

- (void)setAirplayRouteName:(id)a3
{
  id WeakRetained;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *obj;

  obj = (NSString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  v5 = objc_msgSend(WeakRetained, "airplayVideoActive");

  if (v5)
  {
    v6 = IMCommonCoreBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AirPlay"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  }
  else
  {
    if (!-[IMVideoView externalDisplay](self, "externalDisplay"))
      goto LABEL_6;
    v9 = IMCommonCoreBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TV"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v12 = IMCommonCoreBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TV Connected"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    obj = (NSString *)v11;
  }
  -[UILabel setText:](self->_airplayLabel, "setText:", v8);

LABEL_6:
  v13 = obj;
  if (self->_airplayRouteName != obj)
  {
    objc_storeStrong((id *)&self->_airplayRouteName, obj);
    v14 = IMCommonCoreBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("The video is playing on \\U201C%@\\U201D."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, obj));
    -[UILabel setText:](self->_airplayRouteLabel, "setText:", v17);

    v13 = obj;
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMVideoView;
  -[IMVideoView layoutSubviews](&v3, "layoutSubviews");
  -[IMVideoView layout:](self, "layout:", isPortrait());
}

- (BOOL)smallAirplayBackground
{
  BOOL v3;
  double v4;

  v3 = isPhone();
  -[IMVideoView frame](self, "frame");
  return v4 < 768.0 || v3;
}

- (void)layout:(BOOL)a3
{
  UILabel *airplayLabel;
  unsigned int v6;
  double v7;
  void *v8;
  UILabel *airplayRouteLabel;
  unsigned int v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double MaxY;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;

  if (self->_airplayBackground)
  {
    -[IMVideoView bounds](self, "bounds");
    -[UIView setFrame:](self->_airplayBackground, "setFrame:");
    airplayLabel = self->_airplayLabel;
    v6 = -[IMVideoView smallAirplayBackground](self, "smallAirplayBackground");
    v7 = 24.0;
    if (v6)
      v7 = 17.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v7));
    -[UILabel setFont:](airplayLabel, "setFont:", v8);

    airplayRouteLabel = self->_airplayRouteLabel;
    v10 = -[IMVideoView smallAirplayBackground](self, "smallAirplayBackground");
    v11 = 12.0;
    if (!v10)
      v11 = 17.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v11));
    -[UILabel setFont:](airplayRouteLabel, "setFont:", v12);

    -[UIView frame](self->_airplayBackground, "frame");
    v14 = v13;
    if (a3)
    {
      v15 = 0.8;
    }
    else if (-[IMVideoView smallAirplayBackground](self, "smallAirplayBackground"))
    {
      v15 = 0.5;
    }
    else
    {
      v15 = 0.8;
    }
    -[UIView frame](self->_airplayBackground, "frame");
    v17 = v15 * (v16 + -44.0) * 0.5;
    if (-[IMVideoView smallAirplayBackground](self, "smallAirplayBackground"))
      v18 = 0.5;
    else
      v18 = 1.0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_airplayTVImage, "image"));
    objc_msgSend(v19, "size");
    v21 = v18 * v20;

    v22 = 0.0;
    -[UIImageView setFrame:](self->_airplayTVImage, "setFrame:", 0.0, v17 + 44.0 - v21 * 0.5, v14, v21);
    LODWORD(v19) = -[IMVideoView smallAirplayBackground](self, "smallAirplayBackground");
    -[UIImageView frame](self->_airplayTVImage, "frame");
    MaxY = CGRectGetMaxY(v30);
    if (!(_DWORD)v19)
      v22 = 15.0;
    v24 = v22 + MaxY;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_airplayLabel, "font"));
    objc_msgSend(v25, "lineHeight");
    -[UILabel setFrame:](self->_airplayLabel, "setFrame:", 0.0, v24, v14, v26);

    -[UILabel frame](self->_airplayLabel, "frame");
    v27 = v22 + CGRectGetMaxY(v31);
    v29 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_airplayRouteLabel, "font"));
    objc_msgSend(v29, "lineHeight");
    -[UILabel setFrame:](self->_airplayRouteLabel, "setFrame:", 0.0, v27, v14, v28);

  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 IsEmpty;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;
  CGRect v18;

  v17.receiver = self;
  v17.super_class = (Class)IMVideoView;
  v4 = a3;
  -[IMVideoView layoutSublayersOfLayer:](&v17, "layoutSublayersOfLayer:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMVideoView layer](self, "layer", v17.receiver, v17.super_class));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self, "videoLayer"));
    objc_msgSend(v6, "bounds");
    IsEmpty = CGRectIsEmpty(v18);

    if (IsEmpty)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    }
    -[IMVideoView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMVideoView videoLayer](self, "videoLayer"));
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    if (IsEmpty)
      +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)willMoveToWindow:(id)a3
{
  id WeakRetained;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_player);
    objc_msgSend(WeakRetained, "updateVideoLayer");

  }
}

- (void)updateAirplayNoContentView
{
  UIView *airplayBackground;
  id v4;
  double y;
  double width;
  double height;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UIImageView *v14;
  UIImageView *airplayTVImage;
  UILabel *v16;
  UILabel *airplayLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  UILabel *airplayRouteLabel;
  UILabel *v22;
  void *v23;
  UIImageView *v24;
  UILabel *v25;
  UILabel *v26;
  UIView *v27;

  if (-[IMVideoView airplayActive](self, "airplayActive") || -[IMVideoView externalDisplay](self, "externalDisplay"))
  {
    airplayBackground = self->_airplayBackground;
    if (!airplayBackground)
    {
      v4 = objc_alloc((Class)UIView);
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      v9 = self->_airplayBackground;
      self->_airplayBackground = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UIStockImageNoContentDarkGradientBackgroundColor.jpg")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v10));
      -[UIView setBackgroundColor:](self->_airplayBackground, "setBackgroundColor:", v11);

      v12 = objc_alloc((Class)UIImageView);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("NoContentVideosOverlay")));
      v14 = (UIImageView *)objc_msgSend(v12, "initWithImage:", v13);
      airplayTVImage = self->_airplayTVImage;
      self->_airplayTVImage = v14;

      -[UIImageView setFrame:](self->_airplayTVImage, "setFrame:", CGRectZero.origin.x, y, width, height);
      -[UIImageView setContentMode:](self->_airplayTVImage, "setContentMode:", 1);
      -[UIView addSubview:](self->_airplayBackground, "addSubview:", self->_airplayTVImage);
      v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      airplayLabel = self->_airplayLabel;
      self->_airplayLabel = v16;

      -[UILabel setBackgroundColor:](self->_airplayLabel, "setBackgroundColor:", 0);
      -[UILabel setContentMode:](self->_airplayLabel, "setContentMode:", 4);
      -[UILabel setOpaque:](self->_airplayLabel, "setOpaque:", 0);
      v18 = self->_airplayLabel;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25));
      -[UILabel setTextColor:](v18, "setTextColor:", v19);

      -[UILabel setTextAlignment:](self->_airplayLabel, "setTextAlignment:", 1);
      -[UIView addSubview:](self->_airplayBackground, "addSubview:", self->_airplayLabel);
      v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      airplayRouteLabel = self->_airplayRouteLabel;
      self->_airplayRouteLabel = v20;

      -[IMVideoView setAirplayRouteName:](self, "setAirplayRouteName:", self->_airplayRouteName);
      -[UILabel setBackgroundColor:](self->_airplayRouteLabel, "setBackgroundColor:", 0);
      -[UILabel setOpaque:](self->_airplayRouteLabel, "setOpaque:", 0);
      -[UILabel setContentMode:](self->_airplayRouteLabel, "setContentMode:", 4);
      v22 = self->_airplayRouteLabel;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.45));
      -[UILabel setTextColor:](v22, "setTextColor:", v23);

      -[UILabel setTextAlignment:](self->_airplayRouteLabel, "setTextAlignment:", 1);
      -[UIView addSubview:](self->_airplayBackground, "addSubview:", self->_airplayRouteLabel);
      airplayBackground = self->_airplayBackground;
    }
    -[IMVideoView addSubview:](self, "addSubview:", airplayBackground);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_airplayTVImage, "removeFromSuperview");
    v24 = self->_airplayTVImage;
    self->_airplayTVImage = 0;

    -[UILabel removeFromSuperview](self->_airplayLabel, "removeFromSuperview");
    v25 = self->_airplayLabel;
    self->_airplayLabel = 0;

    -[UILabel removeFromSuperview](self->_airplayRouteLabel, "removeFromSuperview");
    v26 = self->_airplayRouteLabel;
    self->_airplayRouteLabel = 0;

    -[UIView removeFromSuperview](self->_airplayBackground, "removeFromSuperview");
    v27 = self->_airplayBackground;
    self->_airplayBackground = 0;

  }
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (BOOL)airplayActive
{
  return self->_airplayActive;
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (void)setExternalDisplay:(BOOL)a3
{
  self->_externalDisplay = a3;
}

- (NSString)airplayRouteName
{
  return self->_airplayRouteName;
}

- (IMAVPlayer)player
{
  return (IMAVPlayer *)objc_loadWeakRetained((id *)&self->_player);
}

- (void)setPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_airplayRouteName, 0);
  objc_storeStrong((id *)&self->_airplayRouteLabel, 0);
  objc_storeStrong((id *)&self->_airplayLabel, 0);
  objc_storeStrong((id *)&self->_airplayTVImage, 0);
  objc_storeStrong((id *)&self->_airplayBackground, 0);
  objc_storeStrong((id *)&self->_videoLayer, 0);
}

@end
