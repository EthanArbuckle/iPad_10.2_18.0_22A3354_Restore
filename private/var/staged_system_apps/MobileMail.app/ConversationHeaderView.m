@implementation ConversationHeaderView

- (ConversationHeaderView)initWithFrame:(CGRect)a3
{
  ConversationHeaderView *v3;
  ConversationHeaderView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ConversationHeaderView;
  v3 = -[ConversationHeaderView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ConversationHeaderView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[ConversationHeaderView setHideStandardTitle:](v4, "setHideStandardTitle:", 1);
    -[ConversationHeaderView setInitialScrollPosition:](v4, "setInitialScrollPosition:", 1.79769313e308);
    sub_1000525FC(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

    -[ConversationHeaderView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (_UIUpdateCycleEnabled(self, a2) && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostScrollViewForConversationHeaderView:", self));
  -[ConversationHeaderView setHostScrollView:](self, "setHostScrollView:", v4);

}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  sub_100052924(self);
  -[ConversationHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSuperTitle:(id)a3
{
  NSString *v4;
  NSString *superTitle;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", self->_superTitle) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v10, "copy");
    superTitle = self->_superTitle;
    self->_superTitle = v4;

    -[ConversationHeaderView bounds](self, "bounds");
    sub_100052DC0(self, v6, v7, v8, v9);
  }

}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView setBounds:](&v14, "setBounds:");
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v8 = CGRectGetWidth(v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
  objc_msgSend(v9, "bounds");
  v10 = v8 - CGRectGetWidth(v16);
  if (v10 >= 0.0)
    v11 = v10;
  else
    v11 = -v10;

  if (v11 >= 2.22044605e-16)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
    objc_msgSend(v12, "setContentWidth:", v8);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
    objc_msgSend(v13, "invalidateIntrinsicContentSize");

    sub_100052DC0(self, x, y, width, height);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView layoutSubviews](&v3, "layoutSubviews");
  sub_100053758(self);
  -[ConversationHeaderView currentProgress](self, "currentProgress");
  -[ConversationHeaderView _layoutLabelsForProgress:](self, "_layoutLabelsForProgress:");
}

- (void)_layoutLabelsForProgress:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSComparisonResult v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
  objc_msgSend(v5, "setAlpha:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
  objc_msgSend(v6, "topToFirstBaseline");
  v8 = v7;
  -[ConversationHeaderView contentViewTopToFirstBaseline](self, "contentViewTopToFirstBaseline");
  v9 = 1.0 - a3;
  v11 = v8 - v10;

  *(_QWORD *)&v12 = -1;
  *((_QWORD *)&v12 + 1) = -1;
  *(_OWORD *)&v37.c = v12;
  *(_OWORD *)&v37.tx = v12;
  *(_OWORD *)&v37.a = v12;
  CGAffineTransformMakeTranslation(&v37, v9 * 0.0, -(v11 * v9));
  *(_QWORD *)&v13 = -1;
  *((_QWORD *)&v13 + 1) = -1;
  *(_OWORD *)&v35.c = v13;
  *(_OWORD *)&v35.tx = v13;
  *(_OWORD *)&v35.a = v13;
  v36 = v37;
  CGAffineTransformScale(&v35, &v36, v9 * -0.0 + 1.0, v9 * -0.0 + 1.0);
  v34 = v35;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
  v33 = v34;
  objc_msgSend(v14, "setTransform:", &v33);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
  v17 = UIContentSizeCategoryCompareToCategory(v16, UIContentSizeCategoryLarge);

  if (v17 == NSOrderedDescending)
    v18 = 14.0;
  else
    v18 = 11.0;
  if (v17 == NSOrderedDescending)
    v19 = 21.0;
  else
    v19 = 17.0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView displayMetrics](self, "displayMetrics"));
  objc_msgSend(v20, "conversationHeaderViewCollapsedSuperTitleTopToFirstBaseline");
  v22 = v21;
  objc_msgSend(v20, "conversationHeaderViewCollapsedTitleTopToFirstBaseline");
  *(_QWORD *)&v24 = -1;
  *((_QWORD *)&v24 + 1) = -1;
  *(_OWORD *)&v37.c = v24;
  *(_OWORD *)&v37.tx = v24;
  *(_OWORD *)&v37.a = v24;
  CGAffineTransformMakeTranslation(&v37, 0.0, (v22 - v23 + 3.0) * a3);
  v36 = v37;
  CGAffineTransformScale(&v32, &v36, 1.0 - (1.0 - v18 / v19) * a3, 1.0 - (1.0 - v18 / v19) * a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
  v31 = v32;
  objc_msgSend(v25, "setTransform:", &v31);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  *(float *)&v28 = a3;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mf_colorFromColor:toColor:progress:](UIColor, "mf_colorFromColor:toColor:progress:", v26, v27, v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
  objc_msgSend(v30, "setColor:", v29);

}

- (void)setTargetProgress:(double)a3
{
  self->_targetProgress = fmax(fmin(a3, 1.0), 0.0);
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  double v7;
  _QWORD v8[5];

  v5 = a3;
  kdebug_trace(730731748, 0, 0, 0, 0);
  v7 = 0.0;
  if (v5)
    v7 = 1.0;
  -[ConversationHeaderView setTargetProgress:](self, "setTargetProgress:", v7);
  -[ConversationHeaderView setCollapsed:](self, "setCollapsed:", v5);
  if (!a4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100053D78;
    v8[3] = &unk_10051AA98;
    v8[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
  }
}

- (void)resetStateBasedOnCurrentStickySubjectPosition
{
  void *v3;
  double v4;
  double v5;
  _BOOL8 v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView delegate](self, "delegate"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostScrollViewForConversationHeaderView:", self));

  objc_msgSend(v7, "contentOffset");
  v5 = v4;
  v6 = v4 + sub_100053E80(self, v7) >= 0.0 || v5 < sub_100053F30(self);
  -[ConversationHeaderView setCollapsed:animated:](self, "setCollapsed:animated:", v6, 1);

}

- (void)hostScrollViewWillBeginDragging:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "contentOffset");
  -[ConversationHeaderView setInitialScrollPosition:](self, "setInitialScrollPosition:", v4);
  -[ConversationHeaderView targetProgress](self, "targetProgress");
  v6 = v5;
  -[ConversationHeaderView setCurrentProgress:](self, "setCurrentProgress:");
  -[ConversationHeaderView setPreviousProgress:](self, "setPreviousProgress:", v6);

}

- (void)hostScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7;
  double v8;
  double y;
  double v10;
  double v11;
  uint64_t v13;
  double v14;
  id v15;

  v15 = a3;
  v7 = sub_100053E80(self, v15);
  v8 = sub_100053C30(self);
  y = a5->y;
  v10 = sub_100053F30(self);
  -[ConversationHeaderView isCollapsed](self, "isCollapsed");
  v11 = v7 + y;
  if (v7 + y < 0.0 || v11 > v8)
  {
    if (v11 >= 0.0 || a5->y < v10)
      goto LABEL_11;
    v13 = 0;
LABEL_13:
    v14 = 0.0;
    goto LABEL_14;
  }
  a5->x = 0.0;
  if (v11 / v8 <= 0.5)
  {
    v13 = 0;
    a5->y = -v7;
    goto LABEL_13;
  }
  a5->y = v8 - v7;
LABEL_11:
  v14 = 1.0;
  v13 = 1;
LABEL_14:
  -[ConversationHeaderView setTargetProgress:](self, "setTargetProgress:", v14);
  -[ConversationHeaderView setInitialScrollPosition:](self, "setInitialScrollPosition:", 1.79769313e308);
  -[ConversationHeaderView setCollapsed:](self, "setCollapsed:", v13);

}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  float minimum;
  float maximum;
  float preferred;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  CAFrameRateRange v26;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView willMoveToSuperview:](&v25, "willMoveToSuperview:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView displayLink](self, "displayLink"));
  objc_msgSend(v5, "invalidate");

  v6 = -[ConversationHeaderView setDisplayLink:](self, "setDisplayLink:", 0);
  if (_UIUpdateCycleEnabled(v6, v7) && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
  }
  if (v4)
  {
    -[ConversationHeaderView setLastUpdateTimeInterval:](self, "setLastUpdateTimeInterval:", CACurrentMediaTime());
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "_displayLinkDidFire:"));
    -[ConversationHeaderView setDisplayLink:](self, "setDisplayLink:", v8);

    v26 = CAFrameRateRangeMake(48.0, 120.0, 0.0);
    minimum = v26.minimum;
    maximum = v26.maximum;
    preferred = v26.preferred;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView displayLink](self, "displayLink"));
    *(float *)&v13 = minimum;
    *(float *)&v14 = maximum;
    *(float *)&v15 = preferred;
    objc_msgSend(v12, "setPreferredFrameRateRange:", v13, v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView displayLink](self, "displayLink"));
    objc_msgSend(v16, "setHighFrameRateReason:", 1245185);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView displayLink](self, "displayLink"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v17, "addToRunLoop:forMode:", v18, NSRunLoopCommonModes);

    if (_UIUpdateCycleEnabled(v19, v20))
    {
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v21 = _UIUpdateSequenceCADisplayLinksItem;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000543D4;
      v22[3] = &unk_10051AAC0;
      objc_copyWeak(&v23, &location);
      self->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem(v21, 1, "ConversationViewHeader", 0, 0, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_displayLinkDidFire:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if ((_UIUpdateCycleEnabled(v5, v4) & 1) == 0)
  {
    objc_msgSend(v5, "targetTimestamp");
    -[ConversationHeaderView _processProgressUpdatesWithTargetTimestamp:](self, "_processProgressUpdatesWithTargetTimestamp:");
  }

}

- (void)_processProgressUpdatesWithTargetTimestamp:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;

  v5 = sub_100053C30(self);
  v45 = (id)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView hostScrollView](self, "hostScrollView"));
  -[ConversationHeaderView targetProgress](self, "targetProgress");
  v7 = v6;
  -[ConversationHeaderView currentProgress](self, "currentProgress");
  v9 = v8;
  -[ConversationHeaderView previousProgress](self, "previousProgress");
  v44 = v10;
  v11 = objc_msgSend(v45, "isTracking");
  objc_msgSend(v45, "contentOffset");
  v13 = v12;
  v15 = v14;
  -[ConversationHeaderView previousScrollViewContentOffset](self, "previousScrollViewContentOffset");
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v45, "isDecelerating");
  v21 = v15 != v19 || v13 != v17;
  if (v9 - v7 >= 0.0)
    v22 = v9 - v7;
  else
    v22 = -(v9 - v7);
  -[ConversationHeaderView lastUpdateTimeInterval](self, "lastUpdateTimeInterval");
  v24 = v23;
  -[ConversationHeaderView setLastUpdateTimeInterval:](self, "setLastUpdateTimeInterval:", a3);
  v25 = (v11 | ~v20) & v21;
  if (v5 <= 0.00000011920929)
    v25 = 0;
  if (v25 != 1)
  {
    if (v22 < 2.22044605e-16)
      goto LABEL_44;
    v35 = v7 - v9;
    goto LABEL_35;
  }
  objc_msgSend(v45, "contentOffset");
  -[ConversationHeaderView setPreviousScrollViewContentOffset:](self, "setPreviousScrollViewContentOffset:");
  objc_msgSend(v45, "contentOffset");
  v27 = v26 + sub_100053E80(self, v45);
  if (v27 >= v5)
  {
    v28 = v7;
    if (-[ConversationHeaderView isCollapsed](self, "isCollapsed"))
      goto LABEL_14;
    objc_msgSend(v45, "contentOffset");
    v30 = v29;
    -[ConversationHeaderView initialScrollPosition](self, "initialScrollPosition");
    v27 = v30 - v31;
  }
  v28 = fmax(fmin(v27 / v5, 1.0), 0.0);
LABEL_14:
  if (v11)
  {
    objc_msgSend(v45, "_verticalVelocity");
    if (v7 >= v28)
      v33 = v7;
    else
      v33 = v28;
    if (v7 >= v28)
      v34 = v28;
    else
      v34 = v7;
    if (v32 < 0.0)
      v7 = v34;
    else
      v7 = v33;
  }
  else
  {
    -[ConversationHeaderView targetProgress](self, "targetProgress");
    if (v36 >= v28)
      v7 = v28;
    else
      v7 = v36;
  }
  v35 = v7 - v9;
  v37 = -(v7 - v9);
  if (v7 - v9 >= 0.0)
    v37 = v7 - v9;
  if (v37 >= 2.22044605e-16 || v22 >= 2.22044605e-16)
  {
LABEL_35:
    v39 = (a3 - v24)
        * ((v44 - v9) / (a3 - v24)
         + ((v44 - v9) / (a3 - v24) * (1.0 / (a3 - v24) * -0.833333313) + 1.0 / (a3 - v24) * 15.0 * v35) * (a3 - v24));
    v40 = -v39;
    if (v39 >= 0.0)
      v40 = v39;
    v41 = v7;
    if (v40 >= 0.00000011920929)
    {
      if (!objc_msgSend(v45, "isTracking"))
        goto LABEL_42;
      v42 = v9 - v7;
      if (v9 - v7 < 0.0)
        v42 = -(v9 - v7);
      v41 = v7;
      if (v42 >= 0.05)
LABEL_42:
        v41 = v9 + v39;
    }
    sub_100053864(self);
    -[ConversationHeaderView setPreviousProgress:](self, "setPreviousProgress:", v9);
    v43 = fmax(fmin(v41, 1.0), 0.0);
    -[ConversationHeaderView setCurrentProgress:](self, "setCurrentProgress:", v43);
    -[ConversationHeaderView setTargetProgress:](self, "setTargetProgress:", v7);
    -[ConversationHeaderView _layoutLabelsForProgress:](self, "_layoutLabelsForProgress:", v43);
  }
LABEL_44:

}

- (double)contentHeight
{
  double result;

  -[ConversationHeaderView contentBaseHeight](self, "contentBaseHeight");
  return result;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_title) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView contentView](self, "contentView"));
    objc_msgSend(v6, "setText:", self->_title);

  }
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  sub_100053758(self);
}

- (void)contentDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView contentDidChange](&v4, "contentDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView window](self, "window"));

  if (v3)
    sub_100053758(self);
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[ConversationHeaderView setDisplayMetrics:](self, "setDisplayMetrics:", 0);
  sub_100052924(self);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ConversationHeaderView;
  -[ConversationHeaderView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  -[ConversationHeaderView setDisplayMetrics:](self, "setDisplayMetrics:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  objc_msgSend(v5, "ensureCacheIsValid");

  sub_100052924(self);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  MFMessageDisplayMetrics *displayMetrics;
  void *v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  MFMessageDisplayMetrics *v23;
  MFMessageDisplayMetrics *v24;

  displayMetrics = self->_displayMetrics;
  if (!displayMetrics)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView traitCollection](self, "traitCollection"));
    -[ConversationHeaderView layoutMargins](self, "layoutMargins");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[ConversationHeaderView safeAreaInsets](self, "safeAreaInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView window](self, "window"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "windowScene"));
    v23 = (MFMessageDisplayMetrics *)objc_claimAutoreleasedReturnValue(+[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v4, objc_msgSend(v22, "interfaceOrientation"), v6, v8, v10, v12, v14, v16, v18, v20));
    v24 = self->_displayMetrics;
    self->_displayMetrics = v23;

    displayMetrics = self->_displayMetrics;
  }
  return displayMetrics;
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[6];

  v5 = 1.0;
  v6 = 1;
  v7 = 2;
  if (a3)
    v7 = 0;
  if (a3 != 1)
    v6 = v7;
  if (a4)
  {
    v5 = 0.0;
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }
  -[ConversationHeaderView setAlpha:](self, "setAlpha:", v5, 0.0);
  -[ConversationHeaderView _transformForLocation:](self, "_transformForLocation:", v8);
  v9[0] = v9[3];
  v9[1] = v9[4];
  v9[2] = v9[5];
  -[ConversationHeaderView setTransform:](self, "setTransform:", v9);
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[6];

  v5 = 1.0;
  v6 = 2;
  if (a3 != 1)
    v6 = a3 == 0;
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    v5 = 0.0;
    v7 = v6;
  }
  -[ConversationHeaderView setAlpha:](self, "setAlpha:", v5, 0.0);
  -[ConversationHeaderView _transformForLocation:](self, "_transformForLocation:", v7);
  v8[0] = v8[3];
  v8[1] = v8[4];
  v8[2] = v8[5];
  -[ConversationHeaderView setTransform:](self, "setTransform:", v8);
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  __int128 v5;
  _OWORD v6[3];

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[ConversationHeaderView setTransform:](self, "setTransform:", v6, a4);
  -[ConversationHeaderView setAlpha:](self, "setAlpha:", 1.0);
}

- (CGAffineTransform)_transformForLocation:(SEL)a3
{
  double v6;
  double Width;
  double v8;
  double v9;
  void *v10;
  double MinX;
  double v12;
  double v13;
  double MaxX;
  double v15;
  double v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a4 == 2)
  {
    if (!-[ConversationHeaderView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
    {
      -[ConversationHeaderView bounds](self, "bounds");
      Width = CGRectGetWidth(v22);
      -[ConversationHeaderView layoutMargins](self, "layoutMargins");
      v9 = v16;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
      objc_msgSend(v10, "frame");
      MinX = CGRectGetMinX(v23);
      goto LABEL_10;
    }
    -[ConversationHeaderView layoutMargins](self, "layoutMargins");
    v13 = v12;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
    objc_msgSend(v10, "frame");
    MaxX = CGRectGetMaxX(v20);
LABEL_8:
    v6 = v13 - MaxX;
LABEL_11:

    return CGAffineTransformMakeTranslation(retstr, v6, 0.0);
  }
  v6 = 0.0;
  if (a4 == 1)
  {
    if (-[ConversationHeaderView mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
    {
      -[ConversationHeaderView bounds](self, "bounds");
      Width = CGRectGetWidth(v18);
      -[ConversationHeaderView layoutMargins](self, "layoutMargins");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
      objc_msgSend(v10, "frame");
      MinX = CGRectGetMaxX(v19);
LABEL_10:
      v6 = Width - v9 - MinX;
      goto LABEL_11;
    }
    -[ConversationHeaderView layoutMargins](self, "layoutMargins");
    v13 = v15;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationHeaderView superTitleLabel](self, "superTitleLabel"));
    objc_msgSend(v10, "frame");
    MaxX = CGRectGetMinX(v21);
    goto LABEL_8;
  }
  return CGAffineTransformMakeTranslation(retstr, v6, 0.0);
}

- (ConversationHeaderViewDelegate)delegate
{
  return (ConversationHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)superTitle
{
  return self->_superTitle;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (ConversationHeaderContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIScrollView)hostScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_hostScrollView);
}

- (void)setHostScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_hostScrollView, a3);
}

- (UILabel)superTitleLabel
{
  return self->_superTitleLabel;
}

- (void)setSuperTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_superTitleLabel, a3);
}

- (double)initialScrollPosition
{
  return self->_initialScrollPosition;
}

- (void)setInitialScrollPosition:(double)a3
{
  self->_initialScrollPosition = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(double)a3
{
  self->_currentProgress = a3;
}

- (double)targetProgress
{
  return self->_targetProgress;
}

- (double)lastUpdateTimeInterval
{
  return self->_lastUpdateTimeInterval;
}

- (void)setLastUpdateTimeInterval:(double)a3
{
  self->_lastUpdateTimeInterval = a3;
}

- (CGPoint)previousScrollViewContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousScrollViewContentOffset.x;
  y = self->_previousScrollViewContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousScrollViewContentOffset:(CGPoint)a3
{
  self->_previousScrollViewContentOffset = a3;
}

- (double)contentViewTopToFirstBaseline
{
  return self->_contentViewTopToFirstBaseline;
}

- (void)setContentViewTopToFirstBaseline:(double)a3
{
  self->_contentViewTopToFirstBaseline = a3;
}

- (void)setDisplayMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_superTitleLabel, 0);
  objc_destroyWeak((id *)&self->_hostScrollView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_superTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
