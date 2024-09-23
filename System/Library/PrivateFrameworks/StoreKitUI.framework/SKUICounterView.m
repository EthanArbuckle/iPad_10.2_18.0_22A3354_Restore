@implementation SKUICounterView

- (void)dealloc
{
  NSObject *updateTimer;
  objc_super v4;

  updateTimer = self->_updateTimer;
  if (updateTimer)
    dispatch_source_cancel(updateTimer);
  v4.receiver = self;
  v4.super_class = (Class)SKUICounterView;
  -[SKUIViewReuseView dealloc](&v4, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUICounterView prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(v7, "backgroundImageElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = objc_msgSend(v8, "prefetchResourcesForViewElement:reason:", v17, a4);
  else
    v18 = 0;

  return v18;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUICounterView preferredSizeForViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "backgroundImageElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v6, "sizeForImageElement:", v15);
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v5)
      +[SKUICounterView requestLayoutForViewElement:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUICounterView sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  objc_msgSend(a1, "preferredSizeForViewElement:context:", v7, v8);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  SKUICounterViewElement *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSNumberFormatter *numberFormatter;
  SKUICounterViewElement *v19;
  id v20;
  uint64_t v21;
  int *v22;
  _QWORD v23[4];
  SKUICounterViewElement *v24;
  SKUICounterView *v25;
  id v26;

  v8 = (SKUICounterViewElement *)a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUICounterView reloadWithViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if (self->_counterElement != v8)
  {
    -[SKUICounterView _stopUpdateTimer](self, "_stopUpdateTimer");
    objc_storeStrong((id *)&self->_counterElement, a3);
    numberFormatter = self->_numberFormatter;
    self->_numberFormatter = 0;

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__SKUICounterView_reloadWithViewElement_width_context___block_invoke;
  v23[3] = &unk_1E73A00B8;
  v19 = v8;
  v24 = v19;
  v25 = self;
  v20 = v9;
  v26 = v20;
  -[SKUIViewReuseView modifyUsingBlock:](self, "modifyUsingBlock:", v23);
  v21 = -[SKUICounterViewElement counterType](v19, "counterType");
  if (!v21)
  {
    -[SKUICounterView _addTimeViewWithViewElement:context:](self, "_addTimeViewWithViewElement:context:", v19, v20);
    v22 = &OBJC_IVAR___SKUICounterView__numberView;
    goto LABEL_11;
  }
  if (v21 == 1)
  {
    -[SKUICounterView _addNumberViewWithViewElement:context:](self, "_addNumberViewWithViewElement:context:", v19, v20);
    v22 = &OBJC_IVAR___SKUICounterView__timeView;
LABEL_11:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v22), "setHidden:", 1);
  }
  -[SKUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");

}

void __55__SKUICounterView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "backgroundImageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "addImageViewWithElement:context:", v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 472), v4);
  if (v3)

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUICounterView setContentInset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v16 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.top = top;
    self->_contentInset.left = left;
    self->_contentInset.bottom = bottom;
    self->_contentInset.right = right;
    -[SKUICounterView setNeedsLayout](self, "setNeedsLayout", v16);
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUICounterView setImage:forArtworkRequest:context:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  -[SKUICounterViewElement backgroundImageElement](self->_counterElement, "backgroundImageElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    && (v20 = objc_msgSend(v9, "requestIdentifier"),
        objc_msgSend(v10, "requestIdentifierForViewElement:", v19),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "unsignedIntegerValue"),
        v21,
        v20 == v22))
  {
    -[SKUIImageView setImage:](self->_imageView, "setImage:", v8);
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICounterView updateWithItemState:context:animated:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUICounterView viewForElementIdentifier:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)didMoveToWindow
{
  OUTLINED_FUNCTION_1();
}

- (void)didMoveToSuperview
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setAlpha:(double)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICounterView setAlpha:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICounterView;
  -[SKUICounterView setAlpha:](&v13, sel_setAlpha_, a3);
  -[SKUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICounterView setHidden:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICounterView;
  -[SKUICounterView setHidden:](&v13, sel_setHidden_, v3);
  -[SKUICounterView _reloadUpdateTimer](self, "_reloadUpdateTimer");
}

- (void)_addNumberViewWithViewElement:(id)a3 context:(id)a4
{
  id v6;
  UILabel *v7;
  UILabel *numberView;
  UILabel *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!self->_numberView)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    numberView = self->_numberView;
    self->_numberView = v7;

    v9 = self->_numberView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UILabel setTextAlignment:](self->_numberView, "setTextAlignment:", 1);
  }
  objc_msgSend(v16, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_numberView;
  SKUIViewElementFontWithStyle(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12, "setFont:", v13);

  objc_msgSend(v6, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setTextColor:](self->_numberView, "setTextColor:", v15);
  -[UILabel setHidden:](self->_numberView, "setHidden:", 0);
  -[SKUICounterView addSubview:](self, "addSubview:", self->_numberView);
  -[SKUICounterView _reloadNumberValue](self, "_reloadNumberValue");

}

- (void)_addTimeViewWithViewElement:(id)a3 context:(id)a4
{
  id v6;
  SKUICounterTimeView *v7;
  void *v8;
  SKUICounterTimeView *v9;
  SKUICounterTimeView *timeView;
  SKUICounterTimeView *v11;
  void *v12;
  void *v13;
  SKUICounterTimeView *v14;
  void *v15;
  void *v16;
  void *v17;
  SKUICounterTimeView *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  if (!self->_timeView)
  {
    v7 = [SKUICounterTimeView alloc];
    objc_msgSend(v6, "clientContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SKUICounterTimeView initWithClientContext:](v7, "initWithClientContext:", v8);
    timeView = self->_timeView;
    self->_timeView = v9;

    v11 = self->_timeView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICounterTimeView setBackgroundColor:](v11, "setBackgroundColor:", v12);

  }
  objc_msgSend(v20, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_timeView;
  objc_msgSend(v20, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICounterTimeView setEndDate:](v14, "setEndDate:", v15);

  objc_msgSend(v6, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUICounterTimeView setTextColor:](self->_timeView, "setTextColor:", v17);
  v18 = self->_timeView;
  SKUIViewElementFontWithStyle(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICounterTimeView setValueFont:](v18, "setValueFont:", v19);

  -[SKUICounterTimeView setVisibleFields:](self->_timeView, "setVisibleFields:", -[SKUICounterView _visibleTimeFieldsForDateFormat:](self, "_visibleTimeFieldsForDateFormat:", objc_msgSend(v20, "dateFormatType")));
  -[SKUICounterTimeView setHidden:](self->_timeView, "setHidden:", 0);
  -[SKUICounterView addSubview:](self, "addSubview:", self->_timeView);

}

- (void)_reloadNumberValue
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  void *v7;
  UILabel *numberView;
  void *v9;
  id v10;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_numberFormatter, "setNumberStyle:", 1);
    v6 = self->_numberFormatter;
    -[SKUICounterViewElement numberFormat](self->_counterElement, "numberFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setPositiveFormat:](v6, "setPositiveFormat:", v7);

    numberFormatter = self->_numberFormatter;
  }
  numberView = self->_numberView;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SKUICounterViewElement currentNumberValue](self->_counterElement, "currentNumberValue"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](numberView, "setText:", v9);

}

- (void)_reloadUpdateTimer
{
  double v3;
  void *v4;

  if ((-[SKUICounterView isHidden](self, "isHidden") & 1) != 0
    || (-[SKUICounterView alpha](self, "alpha"), v3 < 0.00000011920929)
    || (-[SKUICounterView window](self, "window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    -[SKUICounterView _stopUpdateTimer](self, "_stopUpdateTimer");
  }
  else
  {
    -[SKUICounterView _startUpdateTimer](self, "_startUpdateTimer");
  }
}

- (void)_startUpdateTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *updateTimer;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  unint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_updateTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    updateTimer = self->_updateTimer;
    self->_updateTimer = v3;

    if (-[SKUICounterViewElement counterType](self->_counterElement, "counterType") == 1)
    {
      -[SKUICounterViewElement changeRatePerSecond](self->_counterElement, "changeRatePerSecond");
      v6 = 1.0 / v5;
      v7 = v6 * 1000000000.0;
      v8 = v6 <= 0.333333333;
      v9 = 333333333.0;
      if (!v8)
        v9 = v7;
      v10 = (unint64_t)v9;
    }
    else
    {
      v10 = 1000000000;
    }
    v11 = self->_updateTimer;
    v12 = dispatch_time(0, v10);
    dispatch_source_set_timer(v11, v12, v10, 0);
    objc_initWeak(&location, self);
    v13 = self->_updateTimer;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__SKUICounterView__startUpdateTimer__block_invoke;
    v14[3] = &unk_1E739FF68;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v13, v14);
    dispatch_resume((dispatch_object_t)self->_updateTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __36__SKUICounterView__startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimerAction");

}

- (void)_stopUpdateTimer
{
  NSObject *updateTimer;
  OS_dispatch_source *v4;

  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    v4 = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)_updateTimerAction
{
  SKUICounterTimeView *timeView;
  UILabel *numberView;

  timeView = self->_timeView;
  if (timeView && (-[SKUICounterTimeView isHidden](timeView, "isHidden") & 1) == 0)
    -[SKUICounterTimeView reloadTimeValue](self->_timeView, "reloadTimeValue");
  numberView = self->_numberView;
  if (numberView)
  {
    if ((-[UILabel isHidden](numberView, "isHidden") & 1) == 0)
      -[SKUICounterView _reloadNumberValue](self, "_reloadNumberValue");
  }
}

- (unint64_t)_visibleTimeFieldsForDateFormat:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 7;
  else
    return qword_1BBED2500[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_numberView, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_counterElement, 0);
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setAlpha:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
