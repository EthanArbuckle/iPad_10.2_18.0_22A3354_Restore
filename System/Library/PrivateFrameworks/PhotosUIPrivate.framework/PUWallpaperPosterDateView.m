@implementation PUWallpaperPosterDateView

- (PUWallpaperPosterDateView)initWithFrame:(CGRect)a3
{
  PUWallpaperPosterDateView *v3;
  uint64_t v4;
  UIFont *timeFont;
  uint64_t v6;
  UIColor *timeColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUWallpaperPosterDateView;
  v3 = -[PUWallpaperPosterDateView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 100.0, *MEMORY[0x1E0DC1448]);
    v4 = objc_claimAutoreleasedReturnValue();
    timeFont = v3->_timeFont;
    v3->_timeFont = (UIFont *)v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = objc_claimAutoreleasedReturnValue();
    timeColor = v3->_timeColor;
    v3->_timeColor = (UIColor *)v6;

    -[PUWallpaperPosterDateView _initViews](v3, "_initViews");
  }
  return v3;
}

- (void)_initViews
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  objc_class *v6;
  UIFont *v7;
  id v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UILabel *timeLabel;
  UILabel *v18;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v20;
  id v21;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("h:mm"));
  objc_msgSend(v3, "stringFromDate:", v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
  -[PUWallpaperPosterDateView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](v5, "setFrame:");
  -[UIVisualEffectView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[PUWallpaperPosterDateView addSubview:](self, "addSubview:", v5);
  v6 = (objc_class *)MEMORY[0x1E0DC3990];
  v7 = self->_timeFont;
  v8 = [v6 alloc];
  v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UILabel setTextColor:](v9, "setTextColor:", self->_timeColor);
  -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1);
  -[UILabel setFont:](v9, "setFont:", v7);
  -[UILabel setText:](v9, "setText:", v4);
  -[UIVisualEffectView contentView](v5, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  -[UILabel layer](v9, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowRadius:", 2.0);

  -[UILabel layer](v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 0.125;
  objc_msgSend(v12, "setShadowOpacity:", v13);

  v14 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UILabel layer](v9, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowOffset:", v14, v15);

  timeLabel = self->_timeLabel;
  self->_timeLabel = v9;
  v18 = v9;

  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v5;
  v20 = v5;

}

- (void)layoutWithLayout:(id)a3 inContainerFrame:(CGRect)a4
{
  double height;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double x;
  double width;
  double y;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v6 = a3;
  objc_msgSend(v6, "visibleFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "timeFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v36 = v21;

  v22 = v16 - v8;
  v23 = 0.0;
  v24 = 0.0;
  if (v12 != 0.0)
  {
    v22 = v22 / v12;
    v24 = v20 / v12;
  }
  v25 = v18 - v10;
  if (v14 != 0.0)
  {
    v25 = v25 / v14;
    v23 = v36 / v14;
  }
  v26 = x + v22 * width;
  v27 = width * v24;
  v28 = height * v23;
  v29 = y + height - (height * v23 + y + v25 * height);
  -[PUWallpaperPosterDateView setFrame:](self, "setFrame:", v26, v29, width * v24, v28, *(_QWORD *)&v36);
  v41.origin.x = v26;
  v41.origin.y = v29;
  v41.size.width = v27;
  v41.size.height = v28;
  v30 = -CGRectGetMinX(v41);
  v42.origin.x = v26;
  v42.origin.y = v29;
  v42.size.width = v27;
  v42.size.height = v28;
  v31 = -CGRectGetMinY(v42);
  v43.origin.x = v26;
  v43.origin.y = v29;
  v43.size.width = v27;
  v43.size.height = v28;
  v44 = CGRectOffset(v43, v30, v31);
  v32 = v44.origin.x;
  v33 = v44.origin.y;
  v34 = v44.size.width;
  v35 = v44.size.height;
  -[PUWallpaperPosterDateView timeLabel](self, "timeLabel");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v32, v33, v34, v35);

}

- (void)setUseThinnerFontWeightForTime:(BOOL)a3
{
  if (self->_useThinnerFontWeightForTime != a3)
  {
    self->_useThinnerFontWeightForTime = a3;
    -[PUWallpaperPosterDateView _updateTimeLabel](self, "_updateTimeLabel");
  }
}

- (void)setUseVibrantAppearance:(BOOL)a3
{
  if (self->_useVibrantAppearance != a3)
  {
    self->_useVibrantAppearance = a3;
    -[PUWallpaperPosterDateView _updateTimeLabel](self, "_updateTimeLabel");
  }
}

- (void)setTimeFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;
  char v7;
  UIFont *v8;

  v8 = (UIFont *)a3;
  v5 = self->_timeFont;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIFont isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeFont, a3);
      -[PUWallpaperPosterDateView _updateTimeLabel](self, "_updateTimeLabel");
    }
  }

}

- (void)setTimeColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;

  v8 = (UIColor *)a3;
  v5 = self->_timeColor;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_timeColor, a3);
      -[PUWallpaperPosterDateView _updateTimeLabel](self, "_updateTimeLabel");
    }
  }

}

- (void)_updateTimeLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterDateView timeLabel](self, "timeLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterDateView timeFont](self, "timeFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 100.0, *MEMORY[0x1E0DC1448]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC13C0];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC13C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0DC1458];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = -[PUWallpaperPosterDateView useThinnerFontWeightForTime](self, "useThinnerFontWeightForTime");
  v16 = fmax(v14 + -0.2, 0.0);
  if (v15)
    v14 = v16;
  v17 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, v11);

  objc_msgSend(v7, "fontDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9;
  v32[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v21, 100.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v22);
  -[PUWallpaperPosterDateView timeColor](self, "timeColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  if (-[PUWallpaperPosterDateView useVibrantAppearance](self, "useVibrantAppearance"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setTextColor:", v27);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterDateView visualEffectView](self, "visualEffectView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEffect:", v29);

    v26 = (void *)v27;
  }
  else
  {
    objc_msgSend(v3, "setTextColor:", v26);
    -[PUWallpaperPosterDateView visualEffectView](self, "visualEffectView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEffect:", 0);
  }

}

- (BOOL)useVibrantAppearance
{
  return self->_useVibrantAppearance;
}

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (BOOL)useThinnerFontWeightForTime
{
  return self->_useThinnerFontWeightForTime;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (UIFont)effectiveTimeFont
{
  return self->_effectiveTimeFont;
}

- (void)setEffectiveTimeFont:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveTimeFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTimeFont, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

@end
