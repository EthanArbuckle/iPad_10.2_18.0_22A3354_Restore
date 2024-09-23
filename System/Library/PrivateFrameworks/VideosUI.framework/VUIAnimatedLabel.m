@implementation VUIAnimatedLabel

- (VUIAnimatedLabel)initWithFrame:(CGRect)a3
{
  VUIAnimatedLabel *v3;
  VUIAnimatedLabel *v4;
  __TVAnimatedImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __TVAnimatedImageView *v10;
  __TVAnimatedImageView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VUIAnimatedLabel;
  v3 = -[VUILabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[__TVAnimatedImageView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[VUIAnimatedLabel addSubview:](v4, "addSubview:", v10);
    objc_storeWeak((id *)&v4->_currentMarqueeView, v10);
    -[__TVAnimatedImageView setHidden:](v10, "setHidden:", 1);
    v11 = -[__TVAnimatedImageView initWithFrame:]([__TVAnimatedImageView alloc], "initWithFrame:", v6, v7, v8, v9);
    -[VUIAnimatedLabel addSubview:](v4, "addSubview:", v11);
    objc_storeWeak((id *)&v4->_nextMarqueeView, v11);
    -[__TVAnimatedImageView setHidden:](v11, "setHidden:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUIAnimatedLabel _clearAnimations](self, "_clearAnimations");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  -[VUILabel dealloc](&v4, sel_dealloc);
}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  }
  else
  {
    v6 = 0;
  }
  -[VUIAnimatedLabel setAttributedText:](self, "setAttributedText:", v6);

}

- (void)setAttributedText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[VUIAnimatedLabel setAttributedStrings:](self, "setAttributedStrings:", v6, v7, v8);

}

- (void)_clearAttributedStrings
{
  NSArray *attributedStrings;
  objc_super v4;

  attributedStrings = self->_attributedStrings;
  self->_attributedStrings = 0;

  self->_currentAttributedStringIndex = 0;
  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  -[VUILabel setAttributedText:](&v4, sel_setAttributedText_, 0);
  -[VUIAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
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

  v28 = *MEMORY[0x1E0C80C00];
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
      v9 = *MEMORY[0x1E0DC10F8];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_initWeak(&location, self);
          v12 = objc_msgSend(v11, "length");
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __41__VUIAnimatedLabel_setAttributedStrings___block_invoke;
          v20[3] = &unk_1E9FA1690;
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

    -[VUIAnimatedLabel _clearAnimations](self, "_clearAnimations");
    -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    -[VUIAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", 1);

    self->_currentAttributedStringIndex = 0;
    -[NSArray firstObject](self->_attributedStrings, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    v19.receiver = self;
    v19.super_class = (Class)VUIAnimatedLabel;
    -[VUILabel setAttributedText:](&v19, sel_setAttributedText_, v16);

    -[VUILabel setLineBreakMode:](self, "setLineBreakMode:", 2);
    -[VUIAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v17;
  }

}

void __41__VUIAnimatedLabel_setAttributedStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection") == 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__VUIAnimatedLabel_setAttributedStrings___block_invoke_2;
    v6[3] = &unk_1E9F99C98;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v6);
    objc_destroyWeak(&v7);

  }
}

void __41__VUIAnimatedLabel_setAttributedStrings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsDisplay");

}

- (void)setHighlighted:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIAnimatedLabel;
  -[VUILabel setHighlighted:](&v6, sel_setHighlighted_, a3);
  -[VUIAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
  if (self->_animating && self->_marqueeing)
  {
    -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", self->_marqueeNeeded);
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
    v2.super_class = (Class)VUIAnimatedLabel;
    -[VUIAnimatedLabel setNeedsDisplay](&v2, sel_setNeedsDisplay);
  }
}

- (void)_clearAnimations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[VUIAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

  -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
  -[VUIAnimatedLabel layer](self, "layer");
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
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_animating == a3)
  {
    if (a3 && self->_stopping)
      self->_stopping = 0;
  }
  else
  {
    self->_animating = a3;
    if (self->_marqueeNeeded)
    {
      -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      -[VUIAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
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
        -[VUIAnimatedLabel _clearAnimations](self, "_clearAnimations");
        self->_stopping = 0;
        self->_starting = 0;
        self->_currentAttributedStringIndex = 0;
        -[NSArray firstObject](self->_attributedStrings, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");
        -[VUIAnimatedLabel setAttributedText:](self, "setAttributedText:", v11);

        -[VUIAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
        return;
      }
      -[VUIAnimatedLabel layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOpaque:", 0);

      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[VUIAnimatedLabel text](self, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "AL(%@): starting timeout begin", buf, 0xCu);

      }
      self->_starting = 1;
      objc_initWeak((id *)buf, self);
      v9 = dispatch_time(0, 100000000);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __33__VUIAnimatedLabel_setAnimating___block_invoke;
      v12[3] = &unk_1E9F9A938;
      objc_copyWeak(&v13, (id *)buf);
      v12[4] = self;
      dispatch_after(v9, MEMORY[0x1E0C80D38], v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __33__VUIAnimatedLabel_setAnimating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 1019))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "AL(%@): starting timeout end", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(v3, "setNeedsDisplay");
  }

}

- (void)stopAnimating
{
  -[VUIAnimatedLabel setAnimating:](self, "setAnimating:", 0);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!a3)
      -[VUIAnimatedLabel _startMarqueeIfNeeded](self, "_startMarqueeIfNeeded");
  }
}

- (void)stopAnimatingWithoutResetWithDuration:(double)a3
{
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[VUIAnimatedLabel isAnimating](self, "isAnimating"))
  {
    if (self->_marqueeNeeded)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[VUIAnimatedLabel text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_INFO, "AL(%@): stopping timeout begin", buf, 0xCu);

      }
      self->_stopping = 1;
      objc_initWeak((id *)buf, self);
      v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__VUIAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke;
      v8[3] = &unk_1E9F9A938;
      objc_copyWeak(&v9, (id *)buf);
      v8[4] = self;
      dispatch_after(v7, MEMORY[0x1E0C80D38], v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[VUIAnimatedLabel stopAnimating](self, "stopAnimating");
    }
  }
}

void __58__VUIAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[1020])
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "AL(%@): stopping timeout end", (uint8_t *)&v6, 0xCu);

    }
    v3[1020] = 0;
    objc_msgSend(v3, "stopAnimating");
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
  uint64_t v39;
  id v40;
  NSObject *v41;
  void *v42;
  double v43;
  dispatch_time_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD block[9];
  _QWORD v56[5];
  _QWORD v57[4];
  id v58;
  VUIAnimatedLabel *v59;
  double v60;
  uint64_t v61;
  double v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0 && self->_marqueeNeeded)
  {
    -[VUIAnimatedLabel bounds](self, "bounds");
    v53 = v6;
    v54 = v5;
    v8 = v7;
    v51 = v9;
    -[VUIAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    v49 = v10;
    v50 = v11;
    v52 = v8;
    v12 = v10 + v8;
    -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
    v48 = v13 + v12;
    -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentationLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentsRect");
    v18 = v17;
    v46 = v20;
    v47 = v19;
    v45 = v21;

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

    objc_msgSend(v14, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeAllAnimations");

    -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
    objc_msgSend(v14, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setContentsRect:", v18, v47, v46, v45);

    -[CALayer setBounds:](self->_maskLayer, "setBounds:", v24, v26, v28, v30);
    -[CALayer setPosition:](self->_maskLayer, "setPosition:", v33, v35);
    v38 = (void *)MEMORY[0x1E0DC3F10];
    v39 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke;
    v57[3] = &unk_1E9FA16B8;
    v60 = v49;
    v61 = v50;
    v62 = v48;
    v58 = v14;
    v59 = self;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2;
    v56[3] = &unk_1E9F9B4F8;
    v56[4] = self;
    v40 = v14;
    objc_msgSend(v38, "animateWithDuration:delay:options:animations:completion:", 327686, v57, v56, a3, 0.0);
    VUIDefaultLogObject();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      -[VUIAnimatedLabel text](self, "text");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = v42;
      _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_INFO, "AL(%@): stop-and-reset timeout begin", buf, 0xCu);

    }
    v43 = 100000000.0;
    if (a3 + -0.2 >= 0.1)
      v43 = (a3 + -0.2) * 1000000000.0;
    v44 = dispatch_time(0, (uint64_t)v43);
    block[0] = v39;
    block[1] = 3221225472;
    block[2] = __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_30;
    block[3] = &unk_1E9F9D420;
    block[4] = self;
    block[5] = v54;
    block[6] = v53;
    *(double *)&block[7] = v52;
    block[8] = v51;
    dispatch_after(v44, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[VUIAnimatedLabel setAnimating:](self, "setAnimating:", 0);
  }
}

void __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
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
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = *(double *)(a1 + 48);
  v12 = 0.0;
  if (v4 > v11 / *(double *)(a1 + 64) - v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "replicationPadding");
    v12 = (v11 + v13) / *(double *)(a1 + 64);
  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", v12, v6, v8, v10);

}

uint64_t __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
}

uint64_t __51__VUIAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "AL(%@): stop-and-reset timeout end", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.2);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  v5 = *(double *)(a1 + 56) + 20.0;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  v7 = (*(double *)(a1 + 56) + -20.0) * 0.5;
  objc_msgSend(v6, "position");
  objc_msgSend(v6, "setPosition:", v7);
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAnimatedLabel;
  -[VUIAnimatedLabel didMoveToWindow](&v4, sel_didMoveToWindow);
  -[VUIAnimatedLabel window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[VUIAnimatedLabel stopAnimating](self, "stopAnimating");
}

- (BOOL)_isRTL
{
  void *v2;
  char v3;

  -[VUIAnimatedLabel text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isNaturallyRTL");

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
    -[VUIAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    self->_marqueeNeeded = v8 > width + self->_underPosterOutset * -2.0;
    v9 = -[VUIAnimatedLabel _isRTL](self, "_isRTL");
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    CGContextClipToRect(CurrentContext, v16);
    if (self->_marqueeNeeded && -[VUIAnimatedLabel isAnimating](self, "isAnimating"))
    {
      CGContextClear();
      if (self->_starting || self->_marqueeNeeded && -[VUIAnimatedLabel isAnimating](self, "isAnimating"))
      {
        self->_starting = 0;
        -[VUIAnimatedLabel setMarqueeContentImage:](self, "setMarqueeContentImage:", 0);
        -[VUIAnimatedLabel _startMarqueeIfNeeded](self, "_startMarqueeIfNeeded");
      }
    }
    else
    {
      -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:");
    }
    CGContextRestoreGState(CurrentContext);
    if (self->_marqueeNeeded)
    {
      if (drawTextInRect____once != -1)
        dispatch_once(&drawTextInRect____once, &__block_literal_global_115);
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

void __35__VUIAnimatedLabel_drawTextInRect___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  +[VUIUtilities VideosUIBundle](VUIUtilities, "VideosUIBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("UILabelMarqueeRightFade.png"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)drawTextInRect____maskImage;
  drawTextInRect____maskImage = v1;

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
  -[VUIAnimatedLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[VUIAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
  v14 = v13;
  v15 = 0.0;
  if (v3)
  {
    -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
    v15 = v14 + v16;
  }
  -[VUIAnimatedLabel backgroundColor](self, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VUIAnimatedLabel _isRTL](self, "_isRTL");
  v19 = 0;
  if (v12 > 0.0)
  {
    v20 = v10 + v15;
    if (v20 > 0.0)
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
        -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", underPosterOutset, 0.0, v14, v12);
        v23 = 0;
        v24 = underPosterOutset;
        v25 = v14;
        v26 = v12;
        if (v21)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v24);
          -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
          v29 = MinX - v28 - v14;
        }
        else
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v24);
          -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
          v29 = MaxX + v32;
        }
        -[VUIAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v29, 0.0, v14, v12);
      }
      else
      {
        animating = self->_animating;
        self->_animating = 0;
        -[VUIAnimatedLabel drawTextInRect:](self, "drawTextInRect:", v6, v8, v10, v12);
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
  VUIAnimatedLabel *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  objc_super v32;

  -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAnimatedLabel nextMarqueeView](self, "nextMarqueeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIAnimatedLabel currentAttributedStringIndex](self, "currentAttributedStringIndex") + 1;
  -[VUIAnimatedLabel attributedStrings](self, "attributedStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 % objc_msgSend(v8, "count");

  self->_currentAttributedStringIndex = v9;
  -[VUIAnimatedLabel attributedStrings](self, "attributedStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", self->_currentAttributedStringIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  self->_animating = 0;
  v32.receiver = self;
  v32.super_class = (Class)VUIAnimatedLabel;
  -[VUILabel setAttributedText:](&v32, sel_setAttributedText_, v12);
  -[VUILabel setLineBreakMode:](self, "setLineBreakMode:", 2);
  self->_animating = 1;
  -[VUIAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v13);

  objc_msgSend(v6, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  objc_msgSend(v6, "sizeToFit");
  -[VUIAnimatedLabel bounds](self, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(v6, "setAlpha:", 0.0);
  self->_crossfading = 1;
  objc_initWeak(&location, self);
  v15 = (void *)MEMORY[0x1E0DC3F10];
  -[VUIAnimatedLabel crossfadeDuration](self, "crossfadeDuration");
  v17 = v16;
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke;
  v28[3] = &unk_1E9F98FD8;
  v19 = v5;
  v29 = v19;
  v20 = v6;
  v30 = v20;
  v23[0] = v18;
  v23[1] = 3221225472;
  v23[2] = __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2;
  v23[3] = &unk_1E9FA1700;
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

uint64_t __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void __49__VUIAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2(id *a1, int a2)
{
  _BYTE *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    WeakRetained[1016] = 0;
    v8 = WeakRetained;
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_storeWeak(v5 + 137, a1[4]);
    objc_storeWeak(v5 + 138, a1[5]);
    objc_sync_exit(v5);

    objc_msgSend(v5, "nextMarqueeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);
    objc_msgSend(v6, "setHidden:", 1);
    objc_msgSend(a1[6], "currentMarqueeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bringSubviewToFront:", v7);

    if (a2)
      objc_msgSend(a1[6], "_startMarqueeIfNeeded");

    WeakRetained = v8;
  }

}

- (BOOL)_shouldCycle
{
  void *v2;
  BOOL v3;

  -[VUIAnimatedLabel attributedStrings](self, "attributedStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (double)animationDuration
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;

  if (!self->_marqueeNeeded)
    return 0.0;
  -[VUIAnimatedLabel bounds](self, "bounds");
  -[VUIAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
  v4 = v3;
  -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
  v6 = v4 + v5;
  -[VUIAnimatedLabel scrollRate](self, "scrollRate");
  v8 = v6 / v7;
  -[VUIAnimatedLabel marqueeDelay](self, "marqueeDelay");
  return v9 + v8;
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
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  CALayer *v31;
  CALayer *maskLayer;
  double v33;
  CALayer *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double underPosterOutset;
  double v45;
  void *v46;
  void *v47;
  float v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  float v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  float v60;
  void *v61;
  double v62;
  void *v63;
  float v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  float v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  float v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  void (**v95)(_QWORD);
  double v96;
  double v97;
  void *v98;
  _QWORD aBlock[7];
  _QWORD v100[5];
  _QWORD v101[5];
  _QWORD v102[7];

  v102[5] = *MEMORY[0x1E0C80C00];
  if (!self->_marqueeing && (self->_marqueeNeeded || -[VUIAnimatedLabel _shouldCycle](self, "_shouldCycle")))
  {
    v3 = -[VUIAnimatedLabel _isRTL](self, "_isRTL");
    self->_marqueeing = 1;
    -[VUIAnimatedLabel bounds](self, "bounds");
    v97 = v4;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[VUIAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    v12 = v11;
    v13 = v8;
    if (self->_marqueeNeeded)
    {
      -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
      v13 = v12 + v8 + v14;
    }
    -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
    v16 = v12 + v15;
    -[VUIAnimatedLabel scrollRate](self, "scrollRate");
    v18 = v16 / v17;
    -[VUIAnimatedLabel marqueeDelay](self, "marqueeDelay");
    v20 = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke;
    aBlock[3] = &unk_1E9FA1728;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v19;
    *(double *)&aBlock[6] = v18;
    v21 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[VUIAnimatedLabel currentMarqueeView](self, "currentMarqueeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAnimatedLabel marqueeContentImage](self, "marqueeContentImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[VUIAnimatedLabel _rasterizedTextWithMarquee:](self, "_rasterizedTextWithMarquee:", self->_marqueeNeeded);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAnimatedLabel setMarqueeContentImage:](self, "setMarqueeContentImage:", v24);

    }
    -[VUIAnimatedLabel marqueeContentImage](self, "marqueeContentImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setImage:", v25);

    objc_msgSend(v22, "setFrame:", v97, v6, v8, v10);
    objc_msgSend(v22, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8 / v13;
    objc_msgSend(v26, "setContentsRect:", 0.0, 0.0, v8 / v13, 1.0);

    objc_msgSend(v22, "setHidden:", 0);
    objc_msgSend(v22, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeAllAnimations");

    -[CALayer removeAllAnimations](self->_maskLayer, "removeAllAnimations");
    if (self->_marqueeNeeded)
    {
      v94 = v12;
      v96 = v20 + v18;
      v92 = v13;
      if (_startMarqueeIfNeeded___once != -1)
        dispatch_once(&_startMarqueeIfNeeded___once, &__block_literal_global_38);
      objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "size");
      v30 = 1.0 / v29;
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v31 = (CALayer *)objc_claimAutoreleasedReturnValue();
      maskLayer = self->_maskLayer;
      self->_maskLayer = v31;

      -[CALayer setContents:](self->_maskLayer, "setContents:", objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "CGImage"));
      v33 = 0.0;
      -[CALayer setContentsCenter:](self->_maskLayer, "setContentsCenter:", 0.5 - v30 * 0.5, 0.0, v30, 1.0);
      objc_msgSend((id)_startMarqueeIfNeeded___maskImage, "scale");
      -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v97, v6, v8, v10);
      v34 = self->_maskLayer;
      -[VUIAnimatedLabel layer](self, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setMask:", v34);

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v21);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contentsRect.origin.x"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDuration:", v96);
      v37 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v36, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v36, "setBeginTime:", v20 + CACurrentMediaTime());
      objc_msgSend(v36, "setDuration:", v18);
      v38 = 1.0 - v27;
      if (!v3)
        v38 = 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFromValue:", v39);

      v40 = (void *)MEMORY[0x1E0CB37E8];
      if (!v3)
      {
        -[VUIAnimatedLabel replicationPadding](self, "replicationPadding");
        v33 = (v94 + v41) / v92;
      }
      objc_msgSend(v40, "numberWithDouble:", v33);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setToValue:", v42);

      objc_msgSend(v22, "layer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addAnimation:forKey:", v36, CFSTR("VUIAnimatedLabelMarqueeLayerContentOriginXAnimationKey"));

      underPosterOutset = self->_underPosterOutset;
      if (underPosterOutset == 0.0)
      {
        LODWORD(underPosterOutset) = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", underPosterOutset);
        v95 = v21;
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v102[0] = v90;
        v45 = v20 / v96;
        *(float *)&v45 = v20 / v96;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
        v89 = v3;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v102[1] = v46;
        v47 = (void *)MEMORY[0x1E0CB37E8];
        -[VUIAnimatedLabel scrollRate](self, "scrollRate");
        v49 = (v20 + 20.0 / v48) / v96;
        *(float *)&v49 = v49;
        objc_msgSend(v47, "numberWithFloat:", v49);
        v50 = v37;
        v88 = v37;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v102[2] = v51;
        v52 = (void *)MEMORY[0x1E0CB37E8];
        -[VUIAnimatedLabel scrollRate](self, "scrollRate");
        v54 = -20.0 / v53 / v96 + 1.0;
        *(float *)&v54 = v54;
        objc_msgSend(v52, "numberWithFloat:", v54);
        v93 = v22;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v102[3] = v55;
        LODWORD(v56) = 1.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v102[4] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 5);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
        v91 = v36;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setDuration:", v96);
        objc_msgSend(v58, "setFillMode:", v50);
        objc_msgSend(v58, "setRemovedOnCompletion:", 0);
        v59 = v8 + 20.0;
        v60 = v8 + 20.0;
        *(float *)&v59 = v60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v101[0] = v61;
        *(float *)&v62 = v60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v63;
        v64 = v8;
        *(float *)&v65 = v64;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v101[2] = v66;
        *(float *)&v67 = v8;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v101[3] = v68;
        *(float *)&v69 = v60;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v101[4] = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 5);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setValues:", v71);

        objc_msgSend(v58, "setKeyTimes:", v98);
        -[CALayer addAnimation:forKey:](self->_maskLayer, "addAnimation:forKey:", v58, CFSTR("VUIAnimatedLabelMarqueeMaskLayerWidthAnimationKey"));
        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setDuration:", v96);
        objc_msgSend(v72, "setFillMode:", v88);
        objc_msgSend(v72, "setRemovedOnCompletion:", 0);
        if (v89)
          v73 = 20.0;
        else
          v73 = -20.0;
        v74 = (v73 + v8) * 0.5;
        v75 = v74;
        *(float *)&v74 = v75;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = v76;
        *(float *)&v77 = v75;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v100[1] = v78;
        v79 = v8 * 0.5;
        v80 = v8 * 0.5;
        *(float *)&v79 = v80;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v100[2] = v81;
        *(float *)&v82 = v80;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v100[3] = v83;
        *(float *)&v84 = v75;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v100[4] = v85;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 5);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setValues:", v86);

        v21 = v95;
        v22 = v93;
        objc_msgSend(v72, "setKeyTimes:", v98);
        -[CALayer addAnimation:forKey:](self->_maskLayer, "addAnimation:forKey:", v72, CFSTR("VUIAnimatedLabelMarqueeMaskLayerPositionXAnimationKey"));

        v36 = v91;
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    }
    else
    {
      -[VUIAnimatedLabel layer](self, "layer");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setMask:", 0);

      v21[2](v21);
    }

  }
}

uint64_t __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  _BYTE *v4;
  uint64_t v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1018) = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "isAnimating");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_shouldCycle");
    v4 = *(_BYTE **)(a1 + 32);
    if (v3)
    {
      v5 = 40;
      if (!v4[1017])
        v5 = 48;
      return objc_msgSend(v4, "_prepareNextMarqueeWithDelay:", *(double *)(a1 + v5));
    }
    else
    {
      result = objc_msgSend(v4, "isPaused");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "_startMarqueeIfNeeded");
    }
  }
  return result;
}

void __41__VUIAnimatedLabel__startMarqueeIfNeeded__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3870];
  +[VUIUtilities VideosUIBundle](VUIUtilities, "VideosUIBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("UILabelMarqueeMask.png"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_startMarqueeIfNeeded___maskImage;
  _startMarqueeIfNeeded___maskImage = v1;

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

- (UIImage)marqueeContentImage
{
  return self->_marqueeContentImage;
}

- (void)setMarqueeContentImage:(id)a3
{
  objc_storeStrong((id *)&self->_marqueeContentImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeContentImage, 0);
  objc_destroyWeak((id *)&self->_nextMarqueeView);
  objc_destroyWeak((id *)&self->_currentMarqueeView);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end
