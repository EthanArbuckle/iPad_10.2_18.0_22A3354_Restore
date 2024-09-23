@implementation MTNowPlayingIndicatorView

- (MTNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  MTNowPlayingIndicatorView *v3;
  MTNowPlayingIndicatorView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTNowPlayingIndicatorView;
  v3 = -[MTNowPlayingIndicatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTNowPlayingIndicatorView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTNowPlayingIndicatorView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    v4->_interLevelSpacing = 1.0 / v8 + 1.0;
    v4->_levelCornerRadius = 1.0 / v8;
    v4->_levelWidth = 3.0;
    v4->_maximumLevelHeight = 13.0;
    v4->_minimumLevelHeight = 3.0;
    v4->_numberOfLevels = 3;
    -[MTNowPlayingIndicatorView _reloadLevelViews](v4, "_reloadLevelViews");
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)MTNowPlayingIndicatorView;
  -[MTNowPlayingIndicatorView layoutSubviews](&v24, sel_layoutSubviews);
  -[MTNowPlayingIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_levelViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (_QWORD)v20);
        v19 = v18;
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        objc_msgSend(v17, "setFrame:", (self->_levelWidth + self->_interLevelSpacing) * (double)(v14 + i), CGRectGetMaxY(v27), self->_levelWidth, v19);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 += i;
    }
    while (v13);
  }

}

- (void)drawRect:(CGRect)a3
{
  UIColor *levelGuttersColor;
  UIColor *v5;
  void *v6;
  double levelWidth;
  double MaxY;
  CGFloat v9;
  int64_t v10;
  UIColor *v11;
  UIColor *v12;
  CGRect v13;
  CGRect v14;

  if (self->_showsLevelGutters)
  {
    levelGuttersColor = self->_levelGuttersColor;
    if (levelGuttersColor)
    {
      v5 = levelGuttersColor;
    }
    else
    {
      -[MTNowPlayingIndicatorView tintColor](self, "tintColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "colorWithAlphaComponent:", 0.2);
      v11 = (UIColor *)objc_claimAutoreleasedReturnValue();

      v5 = v11;
    }
    v12 = v5;
    -[UIColor setFill](v5, "setFill");
    -[MTNowPlayingIndicatorView bounds](self, "bounds");
    levelWidth = self->_levelWidth;
    MaxY = CGRectGetMaxY(v13);
    if (self->_numberOfLevels >= 1)
    {
      v9 = MaxY;
      v10 = 0;
      do
      {
        v14.origin.x = (self->_levelWidth + self->_interLevelSpacing) * (double)v10;
        v14.origin.y = 0.0;
        v14.size.width = levelWidth;
        v14.size.height = v9;
        UIRectFillUsingBlendMode(v14, kCGBlendModeNormal);
        ++v10;
      }
      while (v10 < self->_numberOfLevels);
    }

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfLevels;
  double v4;
  double *p_maximumLevelHeight;
  double v6;
  CGSize result;

  numberOfLevels = self->_numberOfLevels;
  if (numberOfLevels)
  {
    v4 = self->_interLevelSpacing * (double)(numberOfLevels - 1) + (double)numberOfLevels * self->_levelWidth;
    p_maximumLevelHeight = &self->_maximumLevelHeight;
  }
  else
  {
    p_maximumLevelHeight = (double *)(MEMORY[0x1E0C9D820] + 8);
    v4 = *MEMORY[0x1E0C9D820];
  }
  v6 = *p_maximumLevelHeight;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)tintColorDidChange
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MTNowPlayingIndicatorView;
  -[MTNowPlayingIndicatorView tintColorDidChange](&v14, sel_tintColorDidChange);
  if (self->_showsLevelGutters)
    -[MTNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_levelViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[MTNowPlayingIndicatorView tintColor](self, "tintColor", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v9);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

- (void)setLevelCornerRadius:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_levelCornerRadius != a3)
  {
    self->_levelCornerRadius = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_levelViews;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "layer", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCornerRadius:", self->_levelCornerRadius);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setLevelWidth:(double)a3
{
  if (self->_levelWidth != a3)
  {
    self->_levelWidth = a3;
    -[MTNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumLevelHeight:(double)a3
{
  if (self->_maximumLevelHeight != a3)
  {
    self->_maximumLevelHeight = a3;
    -[MTNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setMinimumLevelHeight:(double)a3
{
  if (self->_minimumLevelHeight != a3)
  {
    self->_minimumLevelHeight = a3;
    -[MTNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setNumberOfLevels:(int64_t)a3
{
  if (self->_numberOfLevels != a3)
  {
    self->_numberOfLevels = a3;
    -[MTNowPlayingIndicatorView _reloadLevelViews](self, "_reloadLevelViews");
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    if (a3 == 3)
    {
      self->bufferingShouldDisplayAsPaused = 1;
      -[MTNowPlayingIndicatorView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__bufferTimerFired, 0, 1.0);
    }
    -[MTNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)_bufferTimerFired
{
  if (self->_playbackState == 3)
  {
    self->bufferingShouldDisplayAsPaused = 0;
    -[MTNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  if (self->_showsLevelGutters != a3)
  {
    self->_showsLevelGutters = a3;
    -[MTNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLevelGuttersColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_levelGuttersColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_levelGuttersColor, a3);
    -[MTNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)_reloadLevelViews
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *levelViews;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;

  if (self->_numberOfLevels < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      if (v3 >= -[NSMutableArray count](self->_levelViews, "count")
        || (-[NSMutableArray objectAtIndex:](self->_levelViews, "objectAtIndex:", v3),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
        objc_msgSend(v8, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCornerRadius:", self->_levelCornerRadius);
        objc_msgSend(v9, "setAnchorPoint:", 0.5, 1.0);
        -[MTNowPlayingIndicatorView tintColor](self, "tintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v10);

        levelViews = self->_levelViews;
        if (!levelViews)
        {
          v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_numberOfLevels);
          v13 = self->_levelViews;
          self->_levelViews = v12;

          levelViews = self->_levelViews;
        }
        -[NSMutableArray addObject:](levelViews, "addObject:", v8);
        -[MTNowPlayingIndicatorView addSubview:](self, "addSubview:", v8);

      }
      ++v3;
    }
    while ((int64_t)v3 < self->_numberOfLevels);
  }
  while (v3 < -[NSMutableArray count](self->_levelViews, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_levelViews, "objectAtIndex:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");
    -[NSMutableArray removeObjectAtIndex:](self->_levelViews, "removeObjectAtIndex:", v3);

  }
  -[MTNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  -[MTNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLevelAnimations
{
  NSMutableArray *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double maximumLevelHeight;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSMutableArray *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[4];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;

  v75 = *MEMORY[0x1E0C80C00];
  v61 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v3 = self->_levelViews;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v65)
  {
    v4 = 0;
    v62 = *MEMORY[0x1E0CD3048];
    v63 = *MEMORY[0x1E0CD2B58];
    v64 = *(_QWORD *)v67;
    v56 = *MEMORY[0x1E0CD2920];
    v5 = 0x1E0CB3000uLL;
    v54 = *MEMORY[0x1E0CD2948];
    v55 = *MEMORY[0x1E0CD2930];
    v57 = v3;
LABEL_3:
    v6 = 0;
    v60 = v4;
    while (2)
    {
      if (*(_QWORD *)v67 != v64)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v6);
      objc_msgSend(v7, "setAlpha:", 1.0);
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      switch(self->_playbackState)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDuration:", 0.45);
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v62);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTimingFunction:", v10);

          objc_msgSend(v9, "setRemovedOnCompletion:", 0);
          objc_msgSend(v9, "setFillMode:", v63);
          v11 = *(void **)(v5 + 2024);
          objc_msgSend(v8, "presentationLayer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (!v12)
            v12 = v8;
          objc_msgSend(v12, "bounds");
          objc_msgSend(v11, "numberWithDouble:", CGRectGetHeight(v76));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setFromValue:", v14);

          objc_msgSend(v9, "setToValue:", &unk_1EA0F6590);
          goto LABEL_19;
        case 1:
          objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v62);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTimingFunction:", v15);

          objc_msgSend(v9, "setRemovedOnCompletion:", 0);
          objc_msgSend(v9, "setFillMode:", v63);
          -[MTNowPlayingIndicatorView _seedValueForBarIndex:](self, "_seedValueForBarIndex:", v4 + v6);
          maximumLevelHeight = self->_maximumLevelHeight;
          v18 = maximumLevelHeight * 0.5 + v17 * (maximumLevelHeight * 0.5);
          objc_msgSend(v9, "setDuration:", maximumLevelHeight / v18 * 0.65);
          objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", self->_minimumLevelHeight);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v19;
          objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v20;
          objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", self->_minimumLevelHeight);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v70[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValues:", v22);

          v4 = v60;
          LODWORD(v23) = 2139095040;
          objc_msgSend(v9, "setRepeatCount:", v23);
          goto LABEL_19;
        case 2:
          goto LABEL_13;
        case 3:
          if (self->bufferingShouldDisplayAsPaused)
          {
            objc_msgSend(v7, "setAlpha:", 0.300000012);
LABEL_13:
            objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds.size.height"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setDuration:", 0.45);
            objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v62);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTimingFunction:", v24);

            objc_msgSend(v9, "setRemovedOnCompletion:", 0);
            objc_msgSend(v9, "setFillMode:", v63);
            v25 = *(void **)(v5 + 2024);
            if ((v61 & 1) != 0)
            {
              objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", self->_minimumLevelHeight);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setFromValue:", v26);

            }
            else
            {
              objc_msgSend(v8, "presentationLayer");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (!v27)
                v27 = v8;
              objc_msgSend(v27, "bounds");
              objc_msgSend(v25, "numberWithDouble:", CGRectGetHeight(v77));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setFromValue:", v29);

            }
            objc_msgSend(*(id *)(v5 + 2024), "numberWithDouble:", self->_minimumLevelHeight);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setToValue:", v30);

LABEL_19:
            objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("nowPlayingIndicatorAnimation"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.height"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setRemovedOnCompletion:", 0);
            objc_msgSend(v9, "setFillMode:", v63);
            v31 = self->_minimumLevelHeight * 1.7;
            objc_msgSend(v9, "setDuration:", 0.5);
            objc_msgSend(v9, "setBeginTime:", (double)(unint64_t)(v4 + v6) * 0.175);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumLevelHeight);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v73[0] = v32;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v73[1] = v33;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v73[2] = v34;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumLevelHeight);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v73[3] = v35;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setValues:", v36);

            LODWORD(v37) = 0;
            LODWORD(v38) = 0;
            LODWORD(v39) = 1.0;
            LODWORD(v40) = 1055622431;
            objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v37, v38, v40, v39);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setTimingFunction:", v59);
            objc_msgSend(v9, "setCalculationMode:", v56);
            objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("hidden"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setFillMode:", v63);
            objc_msgSend(v41, "setValues:", &unk_1EA0F6520);
            objc_msgSend(v41, "setKeyTimes:", &unk_1EA0F6538);
            objc_msgSend(v41, "setCalculationMode:", v55);
            objc_msgSend(v9, "duration");
            objc_msgSend(v41, "setDuration:");
            objc_msgSend(v9, "beginTime");
            objc_msgSend(v41, "setBeginTime:");
            objc_msgSend(v41, "setRemovedOnCompletion:", 1);
            objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "timingFunction");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setTimingFunction:", v43);

            objc_msgSend(v42, "setRemovedOnCompletion:", 0);
            objc_msgSend(v42, "setFillMode:", v63);
            objc_msgSend(v9, "duration");
            objc_msgSend(v42, "setDuration:");
            objc_msgSend(v9, "beginTime");
            objc_msgSend(v42, "setBeginTime:");
            LODWORD(v44) = 1050253722;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v72[0] = v58;
            LODWORD(v45) = *(_DWORD *)"333?";
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v72[1] = v46;
            LODWORD(v47) = 1050253722;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v72[2] = v48;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setValues:", v49);

            v5 = 0x1E0CB3000;
            v4 = v60;

            objc_msgSend(v42, "setCalculationMode:", v54);
            objc_msgSend(MEMORY[0x1E0CD2700], "animation");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setDuration:", 1.05);
            v71[0] = v9;
            v71[1] = v41;
            v71[2] = v42;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setAnimations:", v51);

            LODWORD(v52) = 2139095040;
            objc_msgSend(v50, "setRepeatCount:", v52);
            objc_msgSend(v8, "addAnimation:forKey:", v50, CFSTR("nowPlayingIndicatorAnimation"));

            v3 = v57;
          }

LABEL_21:
          if (v65 != ++v6)
            continue;
          v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
          v4 += v6;
          v65 = v53;
          if (!v53)
            goto LABEL_25;
          goto LABEL_3;
        default:
          goto LABEL_21;
      }
    }
  }
LABEL_25:

}

- (double)_seedValueForBarIndex:(unint64_t)a3
{
  double result;

  if (-[MTNowPlayingIndicatorView bounceStyle](self, "bounceStyle") == 1)
    -[MTNowPlayingIndicatorView _fixedSeedValueForBarIndex:](self, "_fixedSeedValueForBarIndex:", a3);
  else
    -[MTNowPlayingIndicatorView _randomSeedValueForBar](self, "_randomSeedValueForBar");
  return result;
}

- (double)_randomSeedValueForBar
{
  return (double)(arc4random() % 0xB) / 10.0;
}

- (double)_fixedSeedValueForBarIndex:(unint64_t)a3
{
  double result;

  if (a3 < 4)
    return dbl_1DA6772E0[a3];
  -[MTNowPlayingIndicatorView _randomSeedValueForBar](self, "_randomSeedValueForBar");
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (double)interLevelSpacing
{
  return self->_interLevelSpacing;
}

- (void)setInterLevelSpacing:(double)a3
{
  self->_interLevelSpacing = a3;
}

- (double)levelCornerRadius
{
  return self->_levelCornerRadius;
}

- (double)levelWidth
{
  return self->_levelWidth;
}

- (double)maximumLevelHeight
{
  return self->_maximumLevelHeight;
}

- (double)minimumLevelHeight
{
  return self->_minimumLevelHeight;
}

- (int64_t)numberOfLevels
{
  return self->_numberOfLevels;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (int64_t)bounceStyle
{
  return self->_bounceStyle;
}

- (void)setBounceStyle:(int64_t)a3
{
  self->_bounceStyle = a3;
}

- (BOOL)showsLevelGutters
{
  return self->_showsLevelGutters;
}

- (UIColor)levelGuttersColor
{
  return self->_levelGuttersColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelGuttersColor, 0);
  objc_storeStrong((id *)&self->_levelViews, 0);
}

@end
