@implementation STSResultDetailView

- (STSResultDetailView)initWithFrame:(CGRect)a3
{
  STSResultDetailView *v3;
  void *v4;
  void *v5;
  STSResultDetailFooter *v6;
  uint64_t v7;
  STSResultDetailFooter *footer;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STSResultDetailView;
  v3 = -[STSResultDetailView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "sts_detailViewBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSResultDetailView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSResultDetailView setTintColor:](v3, "setTintColor:", v5);

    v6 = [STSResultDetailFooter alloc];
    v7 = -[STSResultDetailFooter initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    footer = v3->_footer;
    v3->_footer = (STSResultDetailFooter *)v7;

    -[STSResultDetailFooter providerButton](v3->_footer, "providerButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", v3, sel__didTapProvider_, 64);

    -[STSResultDetailFooter sendButton](v3->_footer, "sendButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v3, sel__didTapSend_, 64);

    -[STSResultDetailView addSubview:](v3, "addSubview:", v3->_footer);
  }
  return v3;
}

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
  id v11;

  -[STSResultDetailView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[STSResultDetailView traitCollection](self, "traitCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[STSResultDetailView _calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:](self, "_calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:", v11, 1, 0, v4, v6, v8, v10);

}

- (void)_calculateFramesForBounds:(CGRect)a3 traitCollection:(id)a4 andSetFrames:(BOOL)a5 contentFrame:(CGRect *)a6
{
  _BOOL4 v7;
  double height;
  double width;
  CGFloat y;
  double x;
  id v13;
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
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGSize v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGSize size;
  double v48;
  CGFloat rect;
  double v50;
  CGRect slice;
  CGRect remainder;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  -[STSResultDetailView layoutMargins](self, "layoutMargins");
  v50 = y;
  v16 = width - (v14 + v15);
  v19 = height - (v17 + v18);
  if (objc_msgSend(v13, "horizontalSizeClass") == 1 || objc_msgSend(v13, "verticalSizeClass") == 1)
  {
    v48 = dbl_2218147B0[v16 < v19];
  }
  else
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    v20 = CGRectGetWidth(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    v21 = CGRectGetHeight(v54);
    if (v20 < v21)
      v21 = v20;
    if (v21 >= 1024.0)
      v48 = dbl_221814790[v16 < v19];
    else
      v48 = dbl_2218147A0[v16 < v19];
  }
  if (v16 >= v19)
    v22 = v19;
  else
    v22 = v16;
  UICeilToViewScale();
  v24 = v23;
  -[STSResultDetailView contentSize](self, "contentSize");
  UISizeAspectFitSizeInSizeScale(v25, v26, v22, v24, 0.0);
  UIRectCenteredIntegralRectScale();
  v30 = v29;
  v32 = v31;
  remainder.origin.x = v29;
  remainder.origin.y = v31;
  remainder.size.width = v27;
  remainder.size.height = v28;
  if (self->_isFullscreen)
  {
    v55.origin.x = x;
    v55.origin.y = y;
    rect = v27;
    v55.size.width = width;
    v33 = v28;
    v55.size.height = height;
    v34 = v30;
    v35 = CGRectGetHeight(v55);
    v56.origin.x = v34;
    v56.origin.y = v32;
    v56.size.width = rect;
    v56.size.height = v33;
    v36 = v35 - CGRectGetMaxY(v56);
    v57.origin.x = x;
    v57.origin.y = v50;
    v57.size.width = width;
    v57.size.height = height;
    v37 = CGRectGetHeight(v57);
    v28 = v33;
    v27 = rect;
    v30 = v34;
    if (v36 < v48 * v37)
    {
      v58.origin.x = x;
      v58.origin.y = v50;
      v58.size.width = width;
      v58.size.height = height;
      CGRectGetHeight(v58);
      UICeilToViewScale();
      v28 = v33;
      v27 = rect;
      v30 = v34;
      v32 = v32 - v38;
      remainder.origin.y = v32;
    }
  }
  v39 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  slice.origin = (CGPoint)*MEMORY[0x24BDBF090];
  slice.size = v39;
  v40 = v30;
  v39.width = v32;
  CGRectDivide(*(CGRect *)(&v27 - 2), &slice, &remainder, 52.0, CGRectMaxYEdge);
  slice.origin.x = slice.origin.x + -10.0;
  slice.size.width = slice.size.width + 20.0;
  if (self->_showReportConcern)
  {
    -[UIButton sizeToFit](self->_reportConcernButton, "sizeToFit", 0);
    -[UIButton frame](self->_reportConcernButton, "frame");
    v42 = width - v41 + -16.0;
    -[UIButton frame](self->_reportConcernButton, "frame");
    v44 = height - v43 + -24.0;
    -[UIButton frame](self->_reportConcernButton, "frame");
    v46 = v45;
    -[UIButton frame](self->_reportConcernButton, "frame");
    -[UIButton setFrame:](self->_reportConcernButton, "setFrame:", v42, v44, v46);
  }
  if (a6)
  {
    size = remainder.size;
    a6->origin = remainder.origin;
    a6->size = size;
  }
  if (v7)
  {
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", x, v50, width, height);
    -[UIView setFrame:](self->_customContentView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    -[UIImageView setFrame:](self->_thumbnailView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    -[STSResultDetailFooter setFrame:](self->_footer, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }

}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 6.0;
  v4 = 0.0;
  v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_didTapProvider:(id)a3
{
  id v4;

  -[STSResultDetailView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewDidTapProvider:", self);

}

- (void)_didTapSend:(id)a3
{
  id v4;

  -[STSResultDetailView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewDidTapSend:", self);

}

- (void)_didTapReportConcern:(id)a3
{
  id v4;

  -[STSResultDetailView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewDidTapReportConcern:", self);

}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
  -[STSResultDetailView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCustomContentView:(id)a3
{
  UIView *v5;
  UIView **p_customContentView;
  UIView *customContentView;
  id *p_thumbnailView;
  void *v9;
  id v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  v11 = v5;
  if (customContentView != v5)
  {
    -[UIView removeFromSuperview](customContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customContentView, a3);
    if (*p_customContentView)
    {
      p_thumbnailView = (id *)&self->_thumbnailView;
      -[UIImageView superview](self->_thumbnailView, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        p_thumbnailView = (id *)&self->_footer;
      v10 = *p_thumbnailView;

      -[STSResultDetailView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", *p_customContentView, v10);
      -[STSResultDetailView setNeedsLayout](self, "setNeedsLayout");
      -[STSResultDetailView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }

}

- (void)updateWithThumbnail:(id)a3 orThumbnailInfo:(id)a4
{
  id v7;
  UIImage **p_thumbnail;
  STSAnimatedImageInfo **p_thumbnailInfo;
  UIImageView *thumbnailView;
  id v11;
  UIImageView *v12;
  UIImageView *v13;
  UIImageView *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  p_thumbnail = &self->_thumbnail;
  if (*(_OWORD *)&self->_thumbnail != __PAIR128__((unint64_t)v7, (unint64_t)v19))
  {
    objc_storeStrong((id *)&self->_thumbnail, a3);
    p_thumbnailInfo = &self->_thumbnailInfo;
    objc_storeStrong((id *)&self->_thumbnailInfo, a4);
    if (*p_thumbnail || *p_thumbnailInfo)
    {
      thumbnailView = self->_thumbnailView;
      if (!thumbnailView)
      {
        v11 = objc_alloc(MEMORY[0x24BEBD668]);
        v12 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v13 = self->_thumbnailView;
        self->_thumbnailView = v12;

        v14 = self->_thumbnailView;
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v14, "setBackgroundColor:", v15);

        -[UIImageView setContentMode:](self->_thumbnailView, "setContentMode:", 1);
        -[STSResultDetailView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_thumbnailView, self->_footer);
        -[STSResultDetailView setNeedsLayout](self, "setNeedsLayout");
        -[STSResultDetailView layoutIfNeeded](self, "layoutIfNeeded");
        thumbnailView = self->_thumbnailView;
      }
      -[UIImageView layer](thumbnailView, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeAllAnimations");

      v17 = self->_thumbnailView;
      if (*p_thumbnailInfo)
      {
        -[UIImageView setImage:](v17, "setImage:", 0);
        -[UIImageView sts_addAnimationsForSTSAnimatedImageInfo:](self->_thumbnailView, "sts_addAnimationsForSTSAnimatedImageInfo:", *p_thumbnailInfo);
      }
      else
      {
        -[UIImageView setImage:](v17, "setImage:", *p_thumbnail);
      }
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_thumbnailView, "removeFromSuperview");
      v18 = self->_thumbnailView;
      self->_thumbnailView = 0;

    }
  }

}

- (CGRect)contentFrameForBounds:(CGRect)a3 traitCollection:(id)a4
{
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGRect result;

  v4 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v9 = *MEMORY[0x24BDBF090];
  v10 = v4;
  -[STSResultDetailView _calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:](self, "_calculateFramesForBounds:traitCollection:andSetFrames:contentFrame:", a4, 0, &v9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = *((double *)&v9 + 1);
  v5 = *(double *)&v9;
  v8 = *((double *)&v10 + 1);
  v7 = *(double *)&v10;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)providerIconSize
{
  double v2;
  double v3;
  CGSize result;

  -[STSResultDetailFooter providerIconSize](self->_footer, "providerIconSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setProviderIconSize:(CGSize)a3
{
  -[STSResultDetailFooter setProviderIconSize:](self->_footer, "setProviderIconSize:", a3.width, a3.height);
}

- (UIImage)providerIcon
{
  return -[STSResultDetailFooter providerIcon](self->_footer, "providerIcon");
}

- (void)setProviderIcon:(id)a3
{
  -[STSResultDetailFooter setProviderIcon:](self->_footer, "setProviderIcon:", a3);
}

- (NSString)providerName
{
  void *v2;
  void *v3;

  -[STSResultDetailFooter providerButton](self->_footer, "providerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
  STSResultDetailFooter *footer;
  id v4;
  id v5;

  footer = self->_footer;
  v4 = a3;
  -[STSResultDetailFooter providerButton](footer, "providerButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (void)setIsFullscreen:(BOOL)a3
{
  if (self->_isFullscreen != a3)
  {
    self->_isFullscreen = a3;
    -[STSResultDetailView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseBackgroundBlur:(BOOL)a3
{
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backgroundView;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  id v9;

  if (self->_useBackgroundBlur != a3)
  {
    self->_useBackgroundBlur = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSResultDetailView setBackgroundColor:](self, "setBackgroundColor:", v4);

      objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v9);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      v7 = self->_backgroundView;
      -[STSResultDetailView bounds](self, "bounds");
      -[UIVisualEffectView setFrame:](v7, "setFrame:");
      -[STSResultDetailView addSubview:](self, "addSubview:", self->_backgroundView);
      -[STSResultDetailView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
    }
    else
    {
      -[UIVisualEffectView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      v8 = self->_backgroundView;
      self->_backgroundView = 0;

      objc_msgSend(MEMORY[0x24BEBD4B8], "sts_detailViewBackgroundColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[STSResultDetailView setBackgroundColor:](self, "setBackgroundColor:");
    }

  }
}

- (void)setShowReportConcern:(BOOL)a3
{
  UIButton *reportConcernButton;
  UIButton *v5;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;

  if (self->_showReportConcern != a3)
  {
    self->_showReportConcern = a3;
    reportConcernButton = self->_reportConcernButton;
    if (a3)
    {
      if (!reportConcernButton)
      {
        objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
        v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
        v6 = self->_reportConcernButton;
        self->_reportConcernButton = v5;

        v7 = self->_reportConcernButton;
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitleColor:forState:](v7, "setTitleColor:forState:", v8, 0);

        -[UIButton setContentEdgeInsets:](self->_reportConcernButton, "setContentEdgeInsets:", 10.0, 0.0, 10.0, 0.0);
        -[UIButton titleLabel](self->_reportConcernButton, "titleLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setFont:", v10);

        -[UIButton addTarget:action:forControlEvents:](self->_reportConcernButton, "addTarget:action:forControlEvents:", self, sel__didTapReportConcern_, 64);
        -[STSResultDetailView addSubview:](self, "addSubview:", self->_reportConcernButton);
      }
    }
    else if (reportConcernButton)
    {
      -[UIButton removeFromSuperview](reportConcernButton, "removeFromSuperview");
      v11 = self->_reportConcernButton;
      self->_reportConcernButton = 0;

    }
    -[STSResultDetailView setNeedsLayout](self, "setNeedsLayout");
    -[STSResultDetailView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)updateReportConcernButtonTitle
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke(uint64_t a1)
{
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setEnabled:", 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_2;
  v4[3] = &unk_24E7457A8;
  v5 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_3;
  v3[3] = &unk_24E745B78;
  v3[4] = v5;
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, v3, 0.25);
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 0.0);
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_3(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setTitle:forState:", CFSTR("Feedback submitted"), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_4;
  v3[3] = &unk_24E7457A8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v3, 0.25);
}

uint64_t __53__STSResultDetailView_updateReportConcernButtonTitle__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", 1.0);
}

- (STSResultDetailViewDelegate)delegate
{
  return (STSResultDetailViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (STSAnimatedImageInfo)thumbnailInfo
{
  return self->_thumbnailInfo;
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (BOOL)useBackgroundBlur
{
  return self->_useBackgroundBlur;
}

- (UIButton)reportConcernButton
{
  return self->_reportConcernButton;
}

- (void)setReportConcernButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportConcernButton, a3);
}

- (BOOL)showReportConcern
{
  return self->_showReportConcern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernButton, 0);
  objc_storeStrong((id *)&self->_thumbnailInfo, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
