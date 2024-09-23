@implementation _TVAnimatedLabel

- (_TVAnimatedLabel)initWithFrame:(CGRect)a3
{
  _TVAnimatedLabel *v3;
  _TVAnimatedLabel *v4;
  __TVAnimatedImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __TVAnimatedImageView *v10;
  __TVAnimatedImageView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_TVAnimatedLabel;
  v3 = -[_TVLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_marqueeing = 0;
    v3->_animating = 0;
    v3->_crossfading = 0;
    v3->_marqueeDelay = 2.0;
    v3->_replicationPadding = 40.0;
    v3->_maskCapWidth = 20.0;
    v3->_scrollRate = 45.0;
    v3->_crossfadeDuration = 1.5;
    v5 = [__TVAnimatedImageView alloc];
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = -[__TVAnimatedImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    -[_TVAnimatedLabel addSubview:](v4, "addSubview:", v10);
    objc_storeWeak((id *)&v4->_currentMarqueeView, v10);
    -[__TVAnimatedImageView setHidden:](v10, "setHidden:", 1);
    v11 = -[__TVAnimatedImageView initWithFrame:]([__TVAnimatedImageView alloc], "initWithFrame:", v6, v7, v8, v9);
    -[_TVAnimatedLabel addSubview:](v4, "addSubview:", v11);
    objc_storeWeak((id *)&v4->_nextMarqueeView, v11);
    -[__TVAnimatedImageView setHidden:](v11, "setHidden:", 1);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_TVAnimatedLabel _clearAnimations](self, "_clearAnimations");
  v3.receiver = self;
  v3.super_class = (Class)_TVAnimatedLabel;
  -[_TVAnimatedLabel dealloc](&v3, sel_dealloc);
}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1458];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[_TVAnimatedLabel setAttributedText:](self, "setAttributedText:", v6);

}

- (void)setAttributedText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[_TVAnimatedLabel setAttributedStrings:](self, "setAttributedStrings:", v6, v7, v8);

}

- (void)_clearAttributedStrings
{
  NSArray *attributedStrings;
  objc_super v4;

  attributedStrings = self->_attributedStrings;
  self->_attributedStrings = 0;

  self->_currentAttributedStringIndex = 0;
  v4.receiver = self;
  v4.super_class = (Class)_TVAnimatedLabel;
  -[_TVLabel setAttributedText:](&v4, sel_setAttributedText_, 0);
  -[_TVAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setAttributedStrings:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *attributedStrings;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSArray *obj;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[NSArray isEqual:](self->_attributedStrings, "isEqual:", v4) & 1) == 0)
  {
    v17 = v4;
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    attributedStrings = self->_attributedStrings;
    self->_attributedStrings = v5;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_attributedStrings;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      v9 = *MEMORY[0x24BDF65C0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_initWeak(&location, self);
          v12 = objc_msgSend(v11, "length");
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __41___TVAnimatedLabel_setAttributedStrings___block_invoke;
          v20[3] = &unk_24EB860B8;
          v20[4] = self;
          objc_copyWeak(&v21, &location);
          objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v12, 0, v20);
          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v7);
    }

    -[_TVAnimatedLabel _clearAnimations](self, "_clearAnimations");
    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    -[_TVAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    self->_currentAttributedStringIndex = 0;
    -[NSArray firstObject](self->_attributedStrings, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    v19.receiver = self;
    v19.super_class = (Class)_TVAnimatedLabel;
    -[_TVLabel setAttributedText:](&v19, sel_setAttributedText_, v16);

    -[_TVLabel setLineBreakMode:](self, "setLineBreakMode:", 2);
    -[_TVAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v17;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAnimatedLabel;
  -[_TVLabel setHighlighted:](&v6, sel_setHighlighted_, a3);
  -[_TVAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
  if (self->_animating && self->_marqueeing)
  {
    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", self->_marqueeNeeded);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v5);

  }
}

- (void)setNeedsDisplay
{
  objc_super v2;

  if (!self->_marqueeing)
  {
    v2.receiver = self;
    v2.super_class = (Class)_TVAnimatedLabel;
    -[_TVAnimatedLabel setNeedsDisplay](&v2, sel_setNeedsDisplay);
  }
}

- (void)_clearAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[_TVAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
  -[_TVAnimatedLabel layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMask:", 0);

  self->_marqueeing = 0;
  self->_crossfading = 0;
}

- (void)setAnimating:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id location;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (self->_marqueeNeeded)
    {
      -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      -[_TVAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      if (self->_stopping && self->_animating)
      {
        self->_stopping = 0;
        return;
      }
      if (self->_starting)
      {
        if (!self->_animating)
        {
          self->_starting = 0;
          return;
        }
      }
      else if (!self->_animating)
      {
        -[_TVAnimatedLabel _clearAnimations](self, "_clearAnimations");
        self->_stopping = 0;
        self->_starting = 0;
        self->_currentAttributedStringIndex = 0;
        -[NSArray firstObject](self->_attributedStrings, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");
        -[_TVAnimatedLabel setAttributedText:](self, "setAttributedText:", v10);

        -[_TVAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
        return;
      }
      -[_TVAnimatedLabel layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOpaque:", 0);

      v7 = (void *)TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
        -[_TVAnimatedLabel setAnimating:].cold.1(v7);
      self->_starting = 1;
      objc_initWeak(&location, self);
      v8 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __33___TVAnimatedLabel_setAnimating___block_invoke;
      block[3] = &unk_24EB85398;
      objc_copyWeak(&v12, &location);
      block[4] = self;
      dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (void)stopAnimating
{
  -[_TVAnimatedLabel setAnimating:](self, "setAnimating:", 0);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!a3)
      -[_TVAnimatedLabel _startMarqueeIfNeeded](self, "_startMarqueeIfNeeded");
  }
}

- (void)stopAnimatingWithoutResetWithDuration:(double)a3
{
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  id v8;
  id location;

  if (-[_TVAnimatedLabel isAnimating](self, "isAnimating"))
  {
    if (self->_marqueeNeeded)
    {
      v5 = (void *)TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
        -[_TVAnimatedLabel stopAnimatingWithoutResetWithDuration:].cold.1(v5);
      self->_stopping = 1;
      objc_initWeak(&location, self);
      v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke;
      block[3] = &unk_24EB85398;
      objc_copyWeak(&v8, &location);
      block[4] = self;
      dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[_TVAnimatedLabel stopAnimating](self, "stopAnimating");
    }
  }
}

- (void)stopAndResetScrollWithDuration:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  dispatch_time_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD block[9];
  _QWORD v55[5];
  _QWORD v56[8];

  if (a3 > 0.0 && self->_marqueeNeeded)
  {
    -[_TVAnimatedLabel bounds](self, "bounds");
    v52 = v6;
    v53 = v5;
    v8 = v7;
    v50 = v9;
    -[_TVAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    v48 = v10;
    v49 = v11;
    v51 = v8;
    v12 = v10 + v8;
    -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
    v47 = v13 + v12;
    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentationLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentsRect");
    v18 = v17;
    v45 = v20;
    v46 = v19;
    v44 = v21;

    -[CALayer presentationLayer](self->_maskLayer, "presentationLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    -[CALayer presentationLayer](self->_maskLayer, "presentationLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "position");
    v33 = v32;
    v35 = v34;

    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeAllAnimations");

    -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setContentsRect:", v18, v46, v45, v44);

    -[CALayer setBounds:](self->_maskLayer, "setBounds:", v24, v26, v28, v30);
    -[CALayer setPosition:](self->_maskLayer, "setPosition:", v33, v35);
    v40 = MEMORY[0x24BDAC760];
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke;
    v56[3] = &unk_24EB860E0;
    v56[4] = self;
    *(double *)&v56[5] = v48;
    v56[6] = v49;
    *(double *)&v56[7] = v47;
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2;
    v55[3] = &unk_24EB85A38;
    v55[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 327686, v56, v55, a3, 0.0);
    v41 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      -[_TVAnimatedLabel stopAndResetScrollWithDuration:].cold.1(v41);
    v42 = 100000000.0;
    if (a3 + -0.2 >= 0.1)
      v42 = (a3 + -0.2) * 1000000000.0;
    v43 = dispatch_time(0, (uint64_t)v42);
    block[0] = v40;
    block[1] = 3221225472;
    block[2] = __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_29;
    block[3] = &unk_24EB857E0;
    block[4] = self;
    block[5] = v53;
    block[6] = v52;
    *(double *)&block[7] = v51;
    block[8] = v50;
    dispatch_after(v43, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[_TVAnimatedLabel setAnimating:](self, "setAnimating:", 0);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAnimatedLabel;
  -[_TVAnimatedLabel didMoveToWindow](&v4, sel_didMoveToWindow);
  -[_TVAnimatedLabel window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_TVAnimatedLabel stopAnimating](self, "stopAnimating");
}

- (BOOL)_isRTL
{
  void *v2;
  char v3;

  -[_TVAnimatedLabel text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNaturallyRTL");

  return v3;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  _BOOL4 v9;
  CGContext *CurrentContext;
  id v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;

  if (!self->_crossfading)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[_TVAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    self->_marqueeNeeded = v8 > width + self->_underPosterOutset * -2.0;
    v9 = -[_TVAnimatedLabel _isRTL](self, "_isRTL");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    CGContextClipToRect(CurrentContext, v16);
    if (self->_marqueeNeeded && -[_TVAnimatedLabel isAnimating](self, "isAnimating"))
    {
      CGContextClear();
      if (self->_starting || self->_marqueeNeeded && -[_TVAnimatedLabel isAnimating](self, "isAnimating"))
      {
        self->_starting = 0;
        -[_TVAnimatedLabel _startMarqueeIfNeeded](self, "_startMarqueeIfNeeded");
      }
    }
    else
    {
      -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:");
    }
    CGContextRestoreGState(CurrentContext);
    if (self->_marqueeNeeded)
    {
      if (drawTextInRect____once != -1)
        dispatch_once(&drawTextInRect____once, &__block_literal_global_19);
      if (v9)
      {
        objc_msgSend((id)drawTextInRect____maskImage, "imageWithHorizontallyFlippedOrientation");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (id)drawTextInRect____maskImage;
      }
      v15 = v11;
      objc_msgSend(v11, "size");
      v13 = v12;
      v14 = x + width - v12;
      if (v9)
        v14 = 0.0;
      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 22, v14, y, v13, height, 1.0);

    }
  }
}

- (id)_rasterizedTextWithMarquee:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
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
  void *v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  double underPosterOutset;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  double v29;
  BOOL animating;
  double MaxX;
  double v32;
  CGSize v34;
  CGRect v35;

  v3 = a3;
  -[_TVAnimatedLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_TVAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
  v14 = v13;
  v15 = 0.0;
  if (v3)
  {
    -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
    v15 = v14 + v16;
  }
  -[_TVAnimatedLabel backgroundColor](self, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_TVAnimatedLabel _isRTL](self, "_isRTL");
  v19 = 0;
  if (v12 != 0.0)
  {
    v20 = v10 + v15;
    if (v20 != 0.0)
    {
      v21 = v18;
      v34.width = v20;
      v34.height = v12;
      UIGraphicsBeginImageContextWithOptions(v34, 0, 0.0);
      if (v17)
      {
        objc_msgSend(v17, "set");
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.width = v20;
        v35.size.height = v12;
        UIRectFill(v35);
      }
      if (v3)
      {
        if (v21)
          underPosterOutset = v20 - self->_underPosterOutset - v14;
        else
          underPosterOutset = self->_underPosterOutset;
        -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", underPosterOutset, 0.0, v14, v12);
        v23 = 0;
        v24 = underPosterOutset;
        v25 = v14;
        v26 = v12;
        if (v21)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v24);
          -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
          v29 = MinX - v28 - v14;
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v24);
          -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
          v29 = MaxX + v32;
        }
        -[_TVAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v29, 0.0, v14, v12);
      }
      else
      {
        animating = self->_animating;
        self->_animating = 0;
        -[_TVAnimatedLabel drawTextInRect:](self, "drawTextInRect:", v6, v8, v10, v12);
        self->_animating = animating;
      }
      UIGraphicsGetImageFromCurrentImageContext();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }

  return v19;
}

- (void)_prepareNextMarqueeWithDelay:(double)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _TVAnimatedLabel *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  objc_super v32;

  -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_TVAnimatedLabel currentAttributedStringIndex](self, "currentAttributedStringIndex") + 1;
  -[_TVAnimatedLabel attributedStrings](self, "attributedStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 % objc_msgSend(v8, "count");

  self->_currentAttributedStringIndex = v9;
  -[_TVAnimatedLabel attributedStrings](self, "attributedStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", self->_currentAttributedStringIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  self->_animating = 0;
  v32.receiver = self;
  v32.super_class = (Class)_TVAnimatedLabel;
  -[_TVLabel setAttributedText:](&v32, sel_setAttributedText_, v12);
  -[_TVLabel setLineBreakMode:](self, "setLineBreakMode:", 2);
  self->_animating = 1;
  -[_TVAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v13);

  objc_msgSend(v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  objc_msgSend(v6, "sizeToFit");
  -[_TVAnimatedLabel bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(v6, "setAlpha:", 0.0);
  self->_crossfading = 1;
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x24BDF6F90];
  -[_TVAnimatedLabel crossfadeDuration](self, "crossfadeDuration");
  v17 = v16;
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke;
  v28[3] = &unk_24EB848C0;
  v19 = v5;
  v29 = v19;
  v20 = v6;
  v30 = v20;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2;
  v23[3] = &unk_24EB86128;
  objc_copyWeak(&v27, &location);
  v21 = v20;
  v24 = v21;
  v22 = v19;
  v25 = v22;
  v26 = self;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 0, v28, v23, v17, a3);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (BOOL)_shouldCycle
{
  void *v2;
  BOOL v3;

  -[_TVAnimatedLabel attributedStrings](self, "attributedStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)_startMarqueeIfNeeded
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
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
  float v17;
  double v18;
  double v19;
  double v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CALayer *v29;
  CALayer *maskLayer;
  double v31;
  CALayer *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  double underPosterOutset;
  double v43;
  void *v44;
  void *v45;
  float v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  float v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  float v58;
  void *v59;
  double v60;
  void *v61;
  float v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  float v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  float v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  _BOOL4 v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void (**v93)(_QWORD);
  double v94;
  double v95;
  void *v96;
  _QWORD v97[7];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[7];

  v100[5] = *MEMORY[0x24BDAC8D0];
  if (!self->_marqueeing && (self->_marqueeNeeded || -[_TVAnimatedLabel _shouldCycle](self, "_shouldCycle")))
  {
    v3 = -[_TVAnimatedLabel _isRTL](self, "_isRTL");
    self->_marqueeing = 1;
    -[_TVAnimatedLabel bounds](self, "bounds");
    v95 = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[_TVAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    v12 = v11;
    v13 = v8;
    if (self->_marqueeNeeded)
    {
      -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
      v13 = v12 + v8 + v14;
    }
    -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
    v16 = v12 + v15;
    -[_TVAnimatedLabel scrollRate](self, "scrollRate");
    v18 = v16 / v17;
    -[_TVAnimatedLabel marqueeDelay](self, "marqueeDelay");
    v20 = v19;
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3221225472;
    v97[2] = __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke;
    v97[3] = &unk_24EB86150;
    v97[4] = self;
    *(double *)&v97[5] = v19;
    *(double *)&v97[6] = v18;
    v21 = (void (**)(_QWORD))MEMORY[0x22767F470](v97);
    -[_TVAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", self->_marqueeNeeded);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setImage:", v23);

    objc_msgSend(v22, "setFrame:", v95, v6, v8, v10);
    objc_msgSend(v22, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8 / v13;
    objc_msgSend(v24, "setContentsRect:", 0.0, 0.0, v8 / v13, 1.0);

    objc_msgSend(v22, "setHidden:", 0);
    objc_msgSend(v22, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeAllAnimations");

    -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
    if (self->_marqueeNeeded)
    {
      v92 = v12;
      v94 = v20 + v18;
      v90 = v13;
      if (_startMarqueeIfNeeded___once != -1)
        dispatch_once(&_startMarqueeIfNeeded___once, &__block_literal_global_37_0);
      objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "size");
      v28 = 1.0 / v27;
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v29 = (CALayer *)objc_claimAutoreleasedReturnValue();
      maskLayer = self->_maskLayer;
      self->_maskLayer = v29;

      -[CALayer setContents:](self->_maskLayer, "setContents:", objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "CGImage"));
      v31 = 0.0;
      -[CALayer setContentsCenter:](self->_maskLayer, "setContentsCenter:", 0.5 - v28 * 0.5, 0.0, v28, 1.0);
      objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "scale");
      -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v95, v6, v8, v10);
      v32 = self->_maskLayer;
      -[_TVAnimatedLabel layer](self, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setMask:", v32);

      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v21);
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("contentsRect.origin.x"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDuration:", v94);
      v35 = *MEMORY[0x24BDE5970];
      objc_msgSend(v34, "setFillMode:", *MEMORY[0x24BDE5970]);
      objc_msgSend(v34, "setBeginTime:", v20 + CACurrentMediaTime());
      objc_msgSend(v34, "setDuration:", v18);
      v36 = 1.0 - v25;
      if (!v3)
        v36 = 0.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFromValue:", v37);

      v38 = (void *)MEMORY[0x24BDD16E0];
      if (!v3)
      {
        -[_TVAnimatedLabel replicationPadding](self, "replicationPadding");
        v31 = (v92 + v39) / v90;
      }
      objc_msgSend(v38, "numberWithDouble:", v31);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setToValue:", v40);

      objc_msgSend(v22, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addAnimation:forKey:", v34, CFSTR("TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"));

      underPosterOutset = self->_underPosterOutset;
      if (underPosterOutset == 0.0)
      {
        LODWORD(underPosterOutset) = 0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", underPosterOutset);
        v93 = v21;
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = v88;
        v43 = v20 / v94;
        *(float *)&v43 = v20 / v94;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
        v87 = v3;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v100[1] = v44;
        v45 = (void *)MEMORY[0x24BDD16E0];
        -[_TVAnimatedLabel scrollRate](self, "scrollRate");
        v47 = (v20 + 20.0 / v46) / v94;
        *(float *)&v47 = v47;
        objc_msgSend(v45, "numberWithFloat:", v47);
        v48 = v35;
        v86 = v35;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v100[2] = v49;
        v50 = (void *)MEMORY[0x24BDD16E0];
        -[_TVAnimatedLabel scrollRate](self, "scrollRate");
        v52 = -20.0 / v51 / v94 + 1.0;
        *(float *)&v52 = v52;
        objc_msgSend(v50, "numberWithFloat:", v52);
        v91 = v22;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v100[3] = v53;
        LODWORD(v54) = 1.0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v100[4] = v55;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 5);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("bounds.size.width"));
        v89 = v34;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setDuration:", v94);
        objc_msgSend(v56, "setFillMode:", v48);
        objc_msgSend(v56, "setRemovedOnCompletion:", 0);
        v57 = v8 + 20.0;
        v58 = v8 + 20.0;
        *(float *)&v57 = v58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v99[0] = v59;
        *(float *)&v60 = v58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v99[1] = v61;
        v62 = v8;
        *(float *)&v63 = v62;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v99[2] = v64;
        *(float *)&v65 = v8;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v99[3] = v66;
        *(float *)&v67 = v58;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v99[4] = v68;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 5);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setValues:", v69);

        objc_msgSend(v56, "setKeyTimes:", v96);
        -[CALayer addAnimation:forKey:](self->_maskLayer, "addAnimation:forKey:", v56, CFSTR("TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey"));
        objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("position.x"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setDuration:", v94);
        objc_msgSend(v70, "setFillMode:", v86);
        objc_msgSend(v70, "setRemovedOnCompletion:", 0);
        if (v87)
          v71 = 20.0;
        else
          v71 = -20.0;
        v72 = (v71 + v8) * 0.5;
        v73 = v72;
        *(float *)&v72 = v73;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v74;
        *(float *)&v75 = v73;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v98[1] = v76;
        v77 = v8 * 0.5;
        v78 = v8 * 0.5;
        *(float *)&v77 = v78;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v98[2] = v79;
        *(float *)&v80 = v78;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v98[3] = v81;
        *(float *)&v82 = v73;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v98[4] = v83;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 5);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setValues:", v84);

        v21 = v93;
        v22 = v91;
        objc_msgSend(v70, "setKeyTimes:", v96);
        -[CALayer addAnimation:forKey:](self->_maskLayer, "addAnimation:forKey:", v70, CFSTR("TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey"));

        v34 = v89;
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    }
    else
    {
      -[_TVAnimatedLabel layer](self, "layer");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setMask:", 0);

      v21[2](v21);
    }

  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (void)setMarqueeDelay:(double)a3
{
  self->_marqueeDelay = a3;
}

- (double)replicationPadding
{
  return self->_replicationPadding;
}

- (void)setReplicationPadding:(double)a3
{
  self->_replicationPadding = a3;
}

- (double)maskCapWidth
{
  return self->_maskCapWidth;
}

- (void)setMaskCapWidth:(double)a3
{
  self->_maskCapWidth = a3;
}

- (float)scrollRate
{
  return self->_scrollRate;
}

- (void)setScrollRate:(float)a3
{
  self->_scrollRate = a3;
}

- (double)crossfadeDuration
{
  return self->_crossfadeDuration;
}

- (void)setCrossfadeDuration:(double)a3
{
  self->_crossfadeDuration = a3;
}

- (NSArray)attributedStrings
{
  return self->_attributedStrings;
}

- (unint64_t)currentAttributedStringIndex
{
  return self->_currentAttributedStringIndex;
}

- (double)underPosterOutset
{
  return self->_underPosterOutset;
}

- (void)setUnderPosterOutset:(double)a3
{
  self->_underPosterOutset = a3;
}

- (__TVAnimatedImageView)currentMarqueeView
{
  return (__TVAnimatedImageView *)objc_loadWeakRetained((id *)&self->_currentMarqueeView);
}

- (__TVAnimatedImageView)nextMarqueeView
{
  return (__TVAnimatedImageView *)objc_loadWeakRetained((id *)&self->_nextMarqueeView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextMarqueeView);
  objc_destroyWeak((id *)&self->_currentMarqueeView);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

- (void)setAnimating:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v3, v4, "AL(%@): starting timeout begin", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)stopAnimatingWithoutResetWithDuration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v3, v4, "AL(%@): stopping timeout begin", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)stopAndResetScrollWithDuration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_2_0(), "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_222D98000, v3, v4, "AL(%@): stop-and-reset timeout begin", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
