@implementation SiriUITemplatedStackSnippetView

- (SiriUITemplatedStackSnippetView)initWithFrame:(CGRect)a3
{
  CGFloat width;
  double y;
  double x;
  double Height;
  double v8;
  double v9;
  double v10;
  SiriUITemplatedStackSnippetView *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UIView *sashOverlayView;
  UIView *v19;
  void *v20;
  uint64_t v21;
  UIImageView *sashImageView;
  uint64_t v23;
  UILabel *sashTitleLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  UILabel *navigationTitleLabel;
  UILabel *v31;
  void *v32;
  UILabel *v33;
  void *v34;
  NSMutableSet *v35;
  NSMutableSet *templateSubviews;
  NSMutableArray *v37;
  NSMutableArray *stackedSubviews;
  NSMutableArray *v39;
  NSMutableArray *keylines;
  objc_super v42;
  CGRect v43;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Height = CGRectGetHeight(a3);
  if (Height >= 44.0)
    v8 = Height;
  else
    v8 = 44.0;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = v8;
  v9 = CGRectGetWidth(v43);
  if (v9 >= 100.0)
    v10 = v9;
  else
    v10 = 100.0;
  v42.receiver = self;
  v42.super_class = (Class)SiriUITemplatedStackSnippetView;
  v11 = -[SiriUITemplatedStackSnippetView initWithFrame:](&v42, sel_initWithFrame_, x, y, v10, v8);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDF6F90]);
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], v14, v15, v16);
    sashOverlayView = v11->_sashOverlayView;
    v11->_sashOverlayView = (UIView *)v17;

    v19 = v11->_sashOverlayView;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[UIView setAlpha:](v11->_sashOverlayView, "setAlpha:", 0.4);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v13, v14, v15, v16);
    sashImageView = v11->_sashImageView;
    v11->_sashImageView = (UIImageView *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v13, v14, v15, v16);
    sashTitleLabel = v11->_sashTitleLabel;
    v11->_sashTitleLabel = (UILabel *)v23;

    v25 = v11->_sashTitleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    v27 = v11->_sashTitleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v27, "setFont:", v28);

    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v13, v14, v15, v16);
    navigationTitleLabel = v11->_navigationTitleLabel;
    v11->_navigationTitleLabel = (UILabel *)v29;

    v31 = v11->_navigationTitleLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v31, "setTextColor:", v32);

    v33 = v11->_navigationTitleLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v33, "setFont:", v34);

    v35 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    templateSubviews = v11->_templateSubviews;
    v11->_templateSubviews = v35;

    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    stackedSubviews = v11->_stackedSubviews;
    v11->_stackedSubviews = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    keylines = v11->_keylines;
    v11->_keylines = v39;

    v11->_auxiliaryViewHeight = 0.0;
    -[SiriUITemplatedStackSnippetView addSubview:](v11, "addSubview:", v11->_sashOverlayView);
    -[SiriUITemplatedStackSnippetView addSubview:](v11, "addSubview:", v11->_sashImageView);
    -[SiriUITemplatedStackSnippetView addSubview:](v11, "addSubview:", v11->_sashTitleLabel);
    -[SiriUITemplatedStackSnippetView addSubview:](v11, "addSubview:", v11->_navigationTitleLabel);
  }
  return v11;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *stackedSubviews;
  UIView *touchInterceptView;
  _QWORD v19[7];
  id v20[3];
  id location;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34.receiver = self;
  v34.super_class = (Class)SiriUITemplatedStackSnippetView;
  -[SiriUITemplatedStackSnippetView layoutSubviews](&v34, sel_layoutSubviews);
  -[SiriUITemplatedStackSnippetView bounds](self, "bounds");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  v8 = CGRectGetWidth(v35);
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x2020000000;
  v33 = 0;
  -[UILabel text](self->_navigationTitleLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v31[3] = 24.0;
    -[UILabel sizeThatFits:](self->_navigationTitleLabel, "sizeThatFits:", width, height);
    UIRectCenteredXInRect();
    -[UILabel setFrame:](self->_navigationTitleLabel, "setFrame:");
    -[UILabel _setLastLineBaselineFrameOriginY:](self->_navigationTitleLabel, "_setLastLineBaselineFrameOriginY:", v31[3]);
    v31[3] = v31[3] + 12.0;
    -[UILabel setHidden:](self->_sashTitleLabel, "setHidden:", 1);
    -[UIImageView setHidden:](self->_sashImageView, "setHidden:", 1);
    -[UILabel setHidden:](self->_navigationTitleLabel, "setHidden:", 0);
  }
  else
  {
    v31[3] = 8.0;
    -[UIImageView setFrame:](self->_sashImageView, "setFrame:", 8.0, 8.0, 20.0, 20.0);
    v31[3] = 23.0;
    -[UILabel sizeToFit](self->_sashTitleLabel, "sizeToFit");
    -[UILabel frame](self->_sashTitleLabel, "frame");
    v11 = v10;
    v13 = v12;
    v36.origin.x = 8.0;
    v36.origin.y = 8.0;
    v36.size.width = 20.0;
    v36.size.height = 20.0;
    -[UILabel setFrame:](self->_sashTitleLabel, "setFrame:", CGRectGetMaxX(v36) + 8.0, 0.0, v11, v13);
    -[UILabel _setLastLineBaselineFrameOriginY:](self->_sashTitleLabel, "_setLastLineBaselineFrameOriginY:", v31[3]);
    v31[3] = v31[3] + 13.0;
    -[UILabel setHidden:](self->_sashTitleLabel, "setHidden:", 0);
    -[UIImageView setHidden:](self->_sashImageView, "setHidden:", 0);
    -[UILabel setHidden:](self->_navigationTitleLabel, "setHidden:", 1);
  }
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  -[UIView setFrame:](self->_sashOverlayView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v37), v31[3]);
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x4010000000;
  v26 = 0;
  v27 = 0;
  v25 = &unk_21769F4EB;
  v28 = v8;
  v29 = 0x3FF0000000000000;
  if (-[NSMutableArray count](self->_keylines, "count"))
  {
    -[NSMutableArray firstObject](self->_keylines, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sizeThatFits:", v23[6], v23[7]);
    v16 = v15;

    *((_QWORD *)v23 + 7) = v16;
  }
  objc_initWeak(&location, self);
  stackedSubviews = self->_stackedSubviews;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__SiriUITemplatedStackSnippetView_layoutSubviews__block_invoke;
  v19[3] = &unk_24D7D9F50;
  objc_copyWeak(v20, &location);
  v19[4] = self;
  v19[5] = &v30;
  v20[2] = *(id *)&v8;
  v20[1] = (id)a2;
  v19[6] = &v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackedSubviews, "enumerateObjectsUsingBlock:", v19);
  touchInterceptView = self->_touchInterceptView;
  -[UIView frame](self->_auxiliaryView, "frame");
  -[UIView setFrame:](touchInterceptView, "setFrame:");
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v30, 8);
}

void __49__SiriUITemplatedStackSnippetView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id WeakRetained;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_254F164A0))
    {
      objc_msgSend(v14, "desiredHeight");
      v9 = v8;
      v10 = v14;
    }
    else
    {
      v10 = v14;
      if (*((id *)WeakRetained + 64) == v14)
      {
        v9 = *((double *)WeakRetained + 60);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SiriUITemplatedStackSnippetView.m"), 162, CFSTR("Subview %@ must be a template view or be the auxiliary view."), v14);

        v10 = v14;
        v9 = 0.0;
      }
    }
    objc_msgSend(v10, "setFrame:", 0.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(double *)(a1 + 72), v9);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    objc_msgSend(*((id *)WeakRetained + 59), "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));

    if (objc_msgSend(*((id *)WeakRetained + 58), "count") - 1 == a3)
    {
      objc_msgSend(*((id *)WeakRetained + 59), "objectAtIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

    }
  }
  else
  {
    *a4 = 1;
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SiriUITemplatedStackSnippetView reloadData](self, "reloadData");
    v5 = obj;
  }

}

- (void)setAuxiliaryView:(id)a3 atIndex:(unint64_t)a4 initialHeight:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  UIView *v13;
  id v14;
  UIView **p_auxiliaryView;
  NSMutableArray **p_stackedSubviews;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  UIView *touchInterceptView;
  UIView *v28;
  UIView *v29;

  v8 = a6;
  v13 = (UIView *)a3;
  v14 = a7;
  p_auxiliaryView = &self->_auxiliaryView;
  if (self->_auxiliaryView != v13)
  {
    p_stackedSubviews = &self->_stackedSubviews;
    -[NSMutableArray removeObject:](self->_stackedSubviews, "removeObject:");
    -[UIView removeFromSuperview](*p_auxiliaryView, "removeFromSuperview");
    self->_auxiliaryViewHeight = a5;
    objc_storeStrong((id *)&self->_auxiliaryView, a3);
    if (*p_auxiliaryView)
    {
      if (-[NSMutableArray count](*p_stackedSubviews, "count") < a4)
      {
        v17 = (void *)*MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          -[SiriUITemplatedStackSnippetView setAuxiliaryView:atIndex:initialHeight:animated:completion:].cold.1((id *)&self->_stackedSubviews, v17, a4);
        a4 = -[NSMutableArray count](*p_stackedSubviews, "count");
      }
      -[NSMutableArray insertObject:atIndex:](*p_stackedSubviews, "insertObject:atIndex:", *p_auxiliaryView, a4);
      v18 = *MEMORY[0x24BDBF090];
      v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v20 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v21 = *(double *)(MEMORY[0x24BDBF090] + 24);
      -[UIView setFrame:](*p_auxiliaryView, "setFrame:", *MEMORY[0x24BDBF090], v19, v20, v21);
      -[SiriUITemplatedStackSnippetView addSubview:](self, "addSubview:", *p_auxiliaryView);
      +[SiriUIKeyline keylineWithKeylineType:platterStyling:](SiriUIKeyline, "keylineWithKeylineType:platterStyling:", 2, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_keylines, "addObject:", v22);
      -[SiriUITemplatedStackSnippetView addSubview:](self, "addSubview:", v22);
      if (!self->_touchInterceptView)
      {
        v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v18, v19, v20, v21);
        -[UIView setUserInteractionEnabled:](v23, "setUserInteractionEnabled:", 1);
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);

        -[UIView layer](v23, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAllowsHitTesting:", 1);

        -[UIView layer](v23, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setHitTestsAsOpaque:", 1);

        -[SiriUITemplatedStackSnippetView addSubview:](self, "addSubview:", v23);
        touchInterceptView = self->_touchInterceptView;
        self->_touchInterceptView = v23;

      }
    }
    else
    {
      v28 = self->_touchInterceptView;
      if (v28)
      {
        -[UIView removeFromSuperview](v28, "removeFromSuperview");
        v29 = self->_touchInterceptView;
        self->_touchInterceptView = 0;

      }
    }
    -[SiriUITemplatedStackSnippetView _triggerLayoutAnimated:completion:](self, "_triggerLayoutAnimated:completion:", v8, v14);
  }

}

- (void)adjustAuxiliaryViewHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (self->_auxiliaryViewHeight != a3)
  {
    self->_auxiliaryViewHeight = a3;
    v10 = v8;
    -[SiriUITemplatedStackSnippetView _triggerLayoutAnimated:completion:](self, "_triggerLayoutAnimated:completion:", v5);
    goto LABEL_5;
  }
  if (v8)
  {
    v10 = v8;
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
LABEL_5:
    v9 = v10;
  }

}

- (double)desiredHeight
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_templateSubviews;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "desiredHeight", (_QWORD)v11);
        v7 = v7 + v9;
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7 + self->_auxiliaryViewHeight + 36.0;
}

- (void)reloadData
{
  UIImageView *sashImageView;
  SiriUITemplatedStackSnippetViewDataSource **p_dataSource;
  id WeakRetained;
  void *v6;
  UILabel *sashTitleLabel;
  id v8;
  void *v9;
  void *v10;
  UILabel *navigationTitleLabel;
  id v12;
  void *v13;
  id v14;
  int v15;
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *v18;
  char v19;
  UITapGestureRecognizer *v20;

  sashImageView = self->_sashImageView;
  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "sashImageForTemplatedStackSnippetView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](sashImageView, "setImage:", v6);

  sashTitleLabel = self->_sashTitleLabel;
  v8 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v8, "sashTitleForTemplatedStackSnippetView:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](sashTitleLabel, "setText:", v10);

  navigationTitleLabel = self->_navigationTitleLabel;
  v12 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v12, "navigationTitleForTemplatedStackSnippetView:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](navigationTitleLabel, "setText:", v13);

  v14 = objc_loadWeakRetained((id *)p_dataSource);
  v15 = objc_msgSend(v14, "hasDefaultTapActionForTemplatedStackSnippetView:", self);

  tapRecognizer = self->_tapRecognizer;
  if (!v15 || tapRecognizer)
  {
    if (tapRecognizer)
      v19 = v15;
    else
      v19 = 1;
    if ((v19 & 1) == 0)
    {
      -[SiriUITemplatedStackSnippetView removeGestureRecognizer:](self, "removeGestureRecognizer:");
      v20 = self->_tapRecognizer;
      self->_tapRecognizer = 0;

    }
  }
  else
  {
    v17 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__handleTapGesture_);
    v18 = self->_tapRecognizer;
    self->_tapRecognizer = v17;

    -[SiriUITemplatedStackSnippetView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
  }
  -[SiriUITemplatedStackSnippetView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_triggerLayoutAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t);
  _QWORD v7[5];

  v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__SiriUITemplatedStackSnippetView__triggerLayoutAnimated_completion___block_invoke;
    v7[3] = &unk_24D7D91F8;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v7, v6, 0.5, 0.0, 1.0, 0.5);
  }
  else
  {
    -[SiriUITemplatedStackSnippetView setNeedsLayout](self, "setNeedsLayout");
    -[SiriUITemplatedStackSnippetView layoutIfNeeded](self, "layoutIfNeeded");
    if (v6)
      v6[2](v6, 1);
  }

}

uint64_t __69__SiriUITemplatedStackSnippetView__triggerLayoutAnimated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)addTemplateSubview:(id)a3
{
  NSMutableSet *templateSubviews;
  id v5;
  id v6;

  if (a3)
  {
    templateSubviews = self->_templateSubviews;
    v5 = a3;
    -[NSMutableSet addObject:](templateSubviews, "addObject:", v5);
    -[NSMutableArray addObject:](self->_stackedSubviews, "addObject:", v5);
    -[SiriUITemplatedStackSnippetView addSubview:](self, "addSubview:", v5);
    objc_msgSend(v5, "setTemplatedSuperview:", self);

    +[SiriUIKeyline keylineWithKeylineType:platterStyling:](SiriUIKeyline, "keylineWithKeylineType:platterStyling:", 2, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_keylines, "addObject:", v6);
    -[SiriUITemplatedStackSnippetView addSubview:](self, "addSubview:", v6);
    -[SiriUITemplatedStackSnippetView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)templateSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  NSMutableArray *stackedSubviews;
  id v5;
  uint64_t v6;
  id v7;

  stackedSubviews = self->_stackedSubviews;
  v5 = a3;
  v6 = -[NSMutableArray indexOfObject:](stackedSubviews, "indexOfObject:", v5);
  -[NSMutableSet removeObject:](self->_templateSubviews, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_stackedSubviews, "removeObject:", v5);
  objc_msgSend(v5, "removeFromSuperview");
  objc_msgSend(v5, "setTemplatedSuperview:", 0);

  -[NSMutableArray objectAtIndex:](self->_keylines, "objectAtIndex:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](self->_keylines, "removeObject:", v7);
  objc_msgSend(v7, "removeFromSuperview");
  -[SiriUITemplatedStackSnippetView setNeedsLayout](self, "setNeedsLayout");

}

- (UIEdgeInsets)templatedContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_handleTapGesture:(id)a3
{
  id v4;

  -[SiriUITemplatedStackSnippetView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWantsDefaultTapAction:", self);

}

- (NSArray)stackedSubviews
{
  return &self->_stackedSubviews->super;
}

- (SiriUITemplatedStackSnippetViewDataSource)dataSource
{
  return (SiriUITemplatedStackSnippetViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SiriUITemplatedStackSnippetViewDelegate)delegate
{
  return (SiriUITemplatedStackSnippetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)auxiliaryView
{
  return self->_auxiliaryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_keylines, 0);
  objc_storeStrong((id *)&self->_stackedSubviews, 0);
  objc_storeStrong((id *)&self->_templateSubviews, 0);
  objc_storeStrong((id *)&self->_touchInterceptView, 0);
  objc_storeStrong((id *)&self->_navigationTitleLabel, 0);
  objc_storeStrong((id *)&self->_sashTitleLabel, 0);
  objc_storeStrong((id *)&self->_sashImageView, 0);
  objc_storeStrong((id *)&self->_sashOverlayView, 0);
}

- (void)setAuxiliaryView:(uint64_t)a3 atIndex:initialHeight:animated:completion:.cold.1(id *a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = a2;
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(*a1, "count");
  v9 = 136315906;
  v10 = "-[SiriUITemplatedStackSnippetView setAuxiliaryView:atIndex:initialHeight:animated:completion:]";
  v11 = 2048;
  v12 = a3;
  v13 = 2048;
  v14 = v7;
  v15 = 2048;
  v16 = v8;
  _os_log_error_impl(&dword_21764F000, v6, OS_LOG_TYPE_ERROR, "%s Requested index %lu is out bounds of our %lu subviews, changing index to %lu", (uint8_t *)&v9, 0x2Au);

}

@end
