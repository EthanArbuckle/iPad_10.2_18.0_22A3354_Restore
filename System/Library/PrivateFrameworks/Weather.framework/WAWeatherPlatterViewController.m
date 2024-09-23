@implementation WAWeatherPlatterViewController

+ (double)defaultViewHeight
{
  void *v2;
  unint64_t v3;
  double result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  result = 0.0;
  if (v3 <= 6)
    return dbl_21AB39378[v3];
  return result;
}

- (WAWeatherPlatterViewController)init
{
  WAWeatherPlatterViewController *v2;
  WAWeatherPlatterViewController *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WAWeatherPlatterViewController;
  v2 = -[WAWeatherPlatterViewController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WAWeatherPlatterViewController setLastBounds:](v2, "setLastBounds:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[WAWeatherPlatterViewController preferredContentWidth](v3, "preferredContentWidth");
    v5 = v4;
    +[WAWeatherPlatterViewController defaultViewHeight](WAWeatherPlatterViewController, "defaultViewHeight");
    -[WAWeatherPlatterViewController setPreferredContentSize:](v3, "setPreferredContentSize:", v5, v6);
    objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v3);

  }
  return v3;
}

- (WAWeatherPlatterViewController)initWithLocationString:(id)a3
{
  id v4;
  WAWeatherPlatterViewController *v5;
  WAWeatherPlatterViewController *v6;

  v4 = a3;
  v5 = -[WAWeatherPlatterViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[WAWeatherPlatterViewController _kickoffLoadingWithLocation:orPerhapsALocationString:](v5, "_kickoffLoadingWithLocation:orPerhapsALocationString:", 0, v4);

  return v6;
}

- (WAWeatherPlatterViewController)initWithLocation:(id)a3
{
  id v4;
  WAWeatherPlatterViewController *v5;
  WAWeatherPlatterViewController *v6;

  v4 = a3;
  v5 = -[WAWeatherPlatterViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[WAWeatherPlatterViewController _kickoffLoadingWithLocation:orPerhapsALocationString:](v5, "_kickoffLoadingWithLocation:orPerhapsALocationString:", v4, 0);

  return v6;
}

- (WAWeatherPlatterViewController)initWithURL:(id)a3
{
  void *v4;
  WAWeatherPlatterViewController *v5;

  objc_msgSend(MEMORY[0x24BEC2240], "componentsForURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[WAWeatherPlatterViewController initWithURLComponents:](self, "initWithURLComponents:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (WAWeatherPlatterViewController)initWithURLComponents:(id)a3
{
  id v4;
  void *v5;
  WAWeatherPlatterViewController *v6;
  void *v7;
  WAWeatherPlatterViewController *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URL");
    v6 = (WAWeatherPlatterViewController *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WAWeatherPlatterViewController initWithLocation:](self, "initWithLocation:", v7);

      if (v8)
        -[WAWeatherPlatterViewController setURLComponents:](v8, "setURLComponents:", v5);
      self = v8;
      v6 = self;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WAWeatherPlatterViewController;
  -[WAWeatherPlatterViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeDidUpdate_, *MEMORY[0x24BDF7670], 0);

  -[WAWeatherPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[WAWeatherPlatterViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 16);

  -[WAWeatherPlatterViewController setupBackgroundView](self, "setupBackgroundView");
  -[WAWeatherPlatterViewController setupHeaderView](self, "setupHeaderView");
  -[WAWeatherPlatterViewController setupAfterHeaderDividerView](self, "setupAfterHeaderDividerView");
  -[WAWeatherPlatterViewController setupAQIView](self, "setupAQIView");
  -[WAWeatherPlatterViewController setupAfterAQIDividerView](self, "setupAfterAQIDividerView");
  -[WAWeatherPlatterViewController setupHourlyForecast](self, "setupHourlyForecast");
  -[WAWeatherPlatterViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  objc_super v4;

  -[WAWeatherPlatterViewController setupConstraints](self, "setupConstraints");
  v4.receiver = self;
  v4.super_class = (Class)WAWeatherPlatterViewController;
  -[WAWeatherPlatterViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setupBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setBackgroundView:](self, "setBackgroundView:", 0);
  }
  -[WAWeatherPlatterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  -[WAWeatherPlatterViewController setLastBounds:](self, "setLastBounds:");

  v6 = (void *)objc_opt_new();
  -[WAWeatherPlatterViewController setBackgroundView:](self, "setBackgroundView:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 0.7);

  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 18);

  -[WAWeatherPlatterViewController lastBounds](self, "lastBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[WAWeatherPlatterViewController view](self, "view");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v20);

}

- (void)setupHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WAWeatherPlatterViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setHeaderView:](self, "setHeaderView:", 0);
  }
  v5 = (void *)objc_opt_new();
  -[WAWeatherPlatterViewController setHeaderView:](self, "setHeaderView:", v5);

  -[WAWeatherPlatterViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WAWeatherPlatterViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)setupAfterHeaderDividerView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WAWeatherPlatterViewController afterHeaderDividerLineView](self, "afterHeaderDividerLineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController afterHeaderDividerLineView](self, "afterHeaderDividerLineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setAfterHeaderDividerLineView:](self, "setAfterHeaderDividerLineView:", 0);
  }
  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[WAWeatherPlatterViewController setAfterHeaderDividerLineView:](self, "setAfterHeaderDividerLineView:", v6);

  WADividerLineColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController afterHeaderDividerLineView](self, "afterHeaderDividerLineView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[WAWeatherPlatterViewController afterHeaderDividerLineView](self, "afterHeaderDividerLineView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WAWeatherPlatterViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController afterHeaderDividerLineView](self, "afterHeaderDividerLineView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)setupAQIView
{
  void *v3;
  void *v4;
  WAAQIView *v5;
  void *v6;
  WAAQIView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController aqiView](self, "aqiView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setAqiView:](self, "setAqiView:", 0);
  }
  v5 = [WAAQIView alloc];
  -[WAWeatherPlatterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[WAAQIView initWithFrame:](v5, "initWithFrame:", 0.0, 0.0);
  -[WAWeatherPlatterViewController setAqiView:](self, "setAqiView:", v7);

  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController city](self, "city");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithCity:layoutMode:", v10, 3);

  -[WAWeatherPlatterViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

}

- (void)setupAfterAQIDividerView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setAfterAQIDividerLineView:](self, "setAfterAQIDividerLineView:", 0);
  }
  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[WAWeatherPlatterViewController setAfterAQIDividerLineView:](self, "setAfterAQIDividerLineView:", v6);

  WADividerLineColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WAWeatherPlatterViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

}

- (void)setupHourlyForecast
{
  void *v3;
  void *v4;
  double v5;
  unint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[WAWeatherPlatterViewController setHourlyBeltView:](self, "setHourlyBeltView:", 0);
  }
  v18 = (id)objc_opt_new();
  -[WAWeatherPlatterViewController lastBounds](self, "lastBounds");
  for (i = (unint64_t)(v5 / 50.0); i; --i)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v18, "addObject:", v7);

  }
  -[WAWeatherPlatterViewController setHourlyForecastViews:](self, "setHourlyForecastViews:", v18);
  v8 = objc_alloc(MEMORY[0x24BDF6DD0]);
  -[WAWeatherPlatterViewController hourlyForecastViews](self, "hourlyForecastViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArrangedSubviews:", v9);
  -[WAWeatherPlatterViewController setHourlyBeltView:](self, "setHourlyBeltView:", v10);

  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", 0);

  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDistribution:", 1);

  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", 1);

  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WAWeatherPlatterViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController hourlyBeltView](self, "hourlyBeltView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[WAWeatherPlatterViewController _updateViewContent](self, "_updateViewContent");
  -[WAWeatherPlatterViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsUpdateConstraints");

}

- (void)setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[5];

  v47[4] = *MEMORY[0x24BDAC8D0];
  -[WAWeatherPlatterViewController constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[WAWeatherPlatterViewController setConstraints:](self, "setConstraints:", 0);
  }
  _NSDictionaryOfVariableBindings(CFSTR("_headerView, _afterHeaderDividerLineView, _aqiView, _afterAQIDividerLineView, _hourlyBeltView"), self->_headerView, self->_afterHeaderDividerLineView, self->_aqiView, self->_afterAQIDividerLineView, self->_hourlyBeltView, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = &unk_24DDB16F8;
  v46[0] = CFSTR("DividerLineGap");
  v46[1] = CFSTR("DividerLineHeight");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[WAWeatherPlatterViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  objc_msgSend(v7, "numberWithDouble:", 1.0 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v10;
  v46[2] = CFSTR("AQIViewHeight");
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "sizeThatFits:", v14, v15);
  objc_msgSend(v11, "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = CFSTR("AQIViewXMargin");
  v47[2] = v17;
  v47[3] = &unk_24DDB16F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  -[WAWeatherPlatterViewController setConstraints:](self, "setConstraints:", v19);

  -[WAWeatherPlatterViewController constraints](self, "constraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_headerView]|"), 0, v18, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  -[WAWeatherPlatterViewController constraints](self, "constraints");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_hourlyBeltView]|"), 0, v18, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  -[WAWeatherPlatterViewController city](self, "city");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = -[WAWeatherPlatterViewController _showingAQIViewForCity:](self, "_showingAQIViewForCity:", v24);

  -[WAWeatherPlatterViewController constraints](self, "constraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v23)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-DividerLineGap-[_afterAQIDividerLineView]|"), 0, v18, v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v26);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-AQIViewXMargin-[_aqiView]-AQIViewXMargin-|"), 0, v18, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v28);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-DividerLineGap-[_afterHeaderDividerLineView]|"), 0, v18, v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v30);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_headerView][_afterHeaderDividerLineView(==DividerLineHeight)]"), 0, v18, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v32);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_afterHeaderDividerLineView][_aqiView(==AQIViewHeight)]"), 0, v18, v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v34);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_aqiView][_afterAQIDividerLineView(==DividerLineHeight)]"), 0, v18, v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v36);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x24BDD1628];
    v39 = CFSTR("V:[_afterAQIDividerLineView][_hourlyBeltView]|");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-DividerLineGap-[_afterHeaderDividerLineView]|"), 0, v18, v6);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v40);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_headerView][_afterHeaderDividerLineView(==DividerLineHeight)]"), 0, v18, v6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObjectsFromArray:", v42);

    -[WAWeatherPlatterViewController constraints](self, "constraints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x24BDD1628];
    v39 = CFSTR("V:[_afterHeaderDividerLineView][_hourlyBeltView]|");
  }
  objc_msgSend(v38, "constraintsWithVisualFormat:options:metrics:views:", v39, 0, v18, v6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObjectsFromArray:", v43);

  v44 = (void *)MEMORY[0x24BDD1628];
  -[WAWeatherPlatterViewController constraints](self, "constraints");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v45);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)WAWeatherPlatterViewController;
  -[WAWeatherPlatterViewController viewDidLayoutSubviews](&v27, sel_viewDidLayoutSubviews);
  -[WAWeatherPlatterViewController lastBounds](self, "lastBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WAWeatherPlatterViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v29.origin.x = v12;
  v29.origin.y = v13;
  v29.size.width = v14;
  v29.size.height = v15;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v16 = CGRectEqualToRect(v28, v29);

  if (!v16)
  {
    -[WAWeatherPlatterViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[WAWeatherPlatterViewController setLastBounds:](self, "setLastBounds:");

    -[WAWeatherPlatterViewController setupHourlyForecast](self, "setupHourlyForecast");
    -[WAWeatherPlatterViewController lastBounds](self, "lastBounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[WAWeatherPlatterViewController backgroundView](self, "backgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateViewContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t i;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  int v72;
  _BOOL4 v74;
  _BOOL4 v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  __int128 v112;
  uint64_t v113;
  int v114;
  id obj;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  WAWeatherPlatterViewController *v122;
  uint64_t v123;
  _QWORD v124[5];
  id v125;
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  uint64_t v146;
  void *v147;
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  -[WAWeatherPlatterViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_62;
  -[WAWeatherPlatterViewController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forecastModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentConditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hourlyForecasts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dailyForecasts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airQualityConditions");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v9, "isDay");
  -[WAWeatherPlatterViewController URLComponents](self, "URLComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationName");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;

  }
  else
  {
    objc_msgSend(v9, "displayName");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_6;
  }
  v13 = (void *)MEMORY[0x24BDF6F90];
  v143[0] = MEMORY[0x24BDAC760];
  v143[1] = 3221225472;
  v143[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke;
  v143[3] = &unk_24DD9CF48;
  v144 = v3;
  v12 = v12;
  v145 = v12;
  objc_msgSend(v13, "performWithoutAnimation:", v143);

LABEL_6:
  v110 = v12;
  if (v7 && v8 && v6)
  {
    v108 = v7;
    v109 = v5;
    v122 = self;
    if (_updateViewContent_onceToken != -1)
      dispatch_once(&_updateViewContent_onceToken, &__block_literal_global_17);
    objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "temperatureUnit");
    objc_msgSend((id)_updateViewContent_temperatureFormatter, "setOutputUnit:", v15);

    objc_msgSend((id)_updateViewContent_temperatureFormatter, "setSymbolType:", !WAIsChinaSKUAndSimplifiedChinese());
    v16 = (void *)_updateViewContent_temperatureFormatter;
    objc_msgSend(v6, "temperature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringForObjectValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)_updateViewContent_temperatureFormatter;
    objc_msgSend(v8, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "low");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringForObjectValue:", v21);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)_updateViewContent_temperatureFormatter;
    v105 = v8;
    objc_msgSend(v8, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "high");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringForObjectValue:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    WAConditionsLineStringFromCurrentForecasts(v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = WAAirQualityCategoryFromConditions(v111);
    objc_msgSend(v9, "countryAbbreviation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    if ((WAAirQualityIsSignificantForCategory(v27, v28) & 1) != 0)
    {
      objc_msgSend(v9, "countryAbbreviation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      WAAirQualityDescriptionForCategory(v27, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WAConditionsLine2StringFromHourlyForecasts(v108);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }

    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isV3Enabled");

    v35 = v9;
    if (v34)
    {
      objc_msgSend(v109, "city");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "airQualityScaleCategory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "longDescription");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v39 = (void *)v38;
        v118 = v26;
        v40 = v25;
        v41 = v18;
        v42 = v3;
        v43 = objc_msgSend(v37, "categoryIndex");
        v44 = objc_msgSend(v37, "warningLevel");

        if (v43 > v44)
        {
          objc_msgSend(v37, "longDescription");
          v45 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v45;
        }
        v3 = v42;
        v46 = v29;
        v18 = v41;
        v25 = v40;
        v26 = v118;
      }
      else
      {
        v46 = v29;
      }

    }
    else
    {
      v46 = v29;
    }
    v47 = RemapSmallIconForDayOrNight(objc_msgSend(v46, "conditionCode"), objc_msgSend(v35, "isDay"));
    WAImageForLegacyConditionCode(v47, 2uLL);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x24BDF6F90];
    v133[0] = MEMORY[0x24BDAC760];
    v133[1] = 3221225472;
    v133[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_4;
    v133[3] = &unk_24DD9DF80;
    v107 = v3;
    v134 = v3;
    v103 = v18;
    v135 = v103;
    v102 = v120;
    v136 = v102;
    v101 = v25;
    v137 = v101;
    v100 = v26;
    v138 = v100;
    v99 = v31;
    v139 = v99;
    v98 = v48;
    v140 = v98;
    objc_msgSend(v49, "performWithoutAnimation:", v133);
    v50 = (void *)_updateViewContent_ISO6801Calendar;
    objc_msgSend(v35, "timeZone");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTimeZone:", v51);

    v52 = (void *)_updateViewContent_ISO6801Calendar;
    objc_msgSend(v109, "sunrise");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "components:fromDate:", 96, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = objc_msgSend(v54, "minute");
    v56 = v55 + 100 * objc_msgSend(v54, "hour");
    v57 = (void *)_updateViewContent_ISO6801Calendar;
    objc_msgSend(v109, "sunset");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "components:fromDate:", 96, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = objc_msgSend(v59, "minute");
    v97 = v59;
    v61 = v60 + 100 * objc_msgSend(v59, "hour");
    v104 = v35;
    objc_msgSend(v35, "timeZone");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = CityTimeDigitForTimeZone(v62);

    objc_msgSend((id)_updateViewContent_temperatureFormatter, "setSymbolType:", 0);
    objc_msgSend(v46, "temperature");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v46;
    *(_QWORD *)&v112 = v61;
    *((_QWORD *)&v112 + 1) = v56;
    +[WAHourlyForecastParser parseForecasts:temperature:currentTime:condition:sunrise:sunset:](WAHourlyForecastParser, "parseForecasts:temperature:currentTime:condition:sunrise:sunset:", v108, v64, v63, objc_msgSend(v46, "conditionCode"), v56, v61);
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    -[WAWeatherPlatterViewController hourlyForecastViews](v122, "hourlyForecastViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v148, 16);
    if (v121)
    {
      v123 = 0;
      v117 = *(_QWORD *)v130;
      v113 = *MEMORY[0x24BDF65F8];
      v116 = *MEMORY[0x24BDF6600];
      do
      {
        for (i = 0; i != v121; ++i)
        {
          if (*(_QWORD *)v130 != v117)
            objc_enumerationMutation(obj);
          v66 = v123 + i;
          v67 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i);
          objc_msgSend(v119, "objectAtIndexedSubscript:", v123 + i);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "eventType");
          objc_msgSend(v68, "time");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = Time24StringToInt(v70);

          if (v112 == 0)
          {
            v72 = 1;
          }
          else
          {
            v72 = v114;
            if (!v69)
            {
              v74 = *((_QWORD *)&v112 + 1) < (unint64_t)v71 || (unint64_t)v112 > v71;
              v76 = *((_QWORD *)&v112 + 1) < (unint64_t)v71 && (unint64_t)v112 > v71;
              if (*((_QWORD *)&v112 + 1) < (unint64_t)v112)
                v72 = v76;
              else
                v72 = v74;
            }
          }
          WAHourlyConditionsTimeLabelFont(v66 == 0);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          WAHourlyConditionsTemperatureLabelAttributesDictionary(v66 == 0);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = RemapSmallIconForDayOrNight(objc_msgSend(v68, "conditionCode"), v72);
          v80 = objc_msgSend(v68, "eventType");
          switch(v80)
          {
            case 1:
              WAImageForSunrise(3);
              v81 = objc_claimAutoreleasedReturnValue();
              goto LABEL_52;
            case 3:
              WAImageForLegacyConditionCode(v79, 3uLL);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_alloc(MEMORY[0x24BDD1458]);
              objc_msgSend(v68, "time");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v146 = v113;
              v147 = v77;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = (void *)objc_msgSend(v83, "initWithString:attributes:", v84, v85);

              break;
            case 2:
              WAImageForSunset(3);
              v81 = objc_claimAutoreleasedReturnValue();
LABEL_52:
              v82 = (void *)v81;
              objc_msgSend(v68, "forecastDetail");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "time");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              WATimeInRegionFormat(v88, v77);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_55;
            default:
              WAImageForLegacyConditionCode(v79, 3uLL);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "time");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              WACondensedTimeInRegionFormat(v84, v77);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              break;
          }

          v89 = (void *)_updateViewContent_temperatureFormatter;
          objc_msgSend(v68, "temperature");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "stringForObjectValue:", v88);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:

          v90 = (void *)objc_msgSend(v86, "mutableCopy");
          if (v66)
            WADetailColor();
          else
            WAContentColor();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "addAttribute:value:range:", v116, v91, 0, objc_msgSend(v86, "length"));

          v92 = (void *)MEMORY[0x24BDF6F90];
          v124[0] = MEMORY[0x24BDAC760];
          v124[1] = 3221225472;
          v124[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_5;
          v124[3] = &unk_24DD9DFA8;
          v124[4] = v67;
          v125 = v90;
          v126 = v87;
          v127 = v78;
          v128 = v82;
          v93 = v82;
          v94 = v78;
          v95 = v87;
          v96 = v90;
          objc_msgSend(v92, "performWithoutAnimation:", v124);

        }
        v121 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v148, 16);
        v123 += i;
      }
      while (v121);
    }

    v6 = v106;
    v3 = v107;
    v7 = v108;
    v5 = v109;
    v9 = v104;
    v8 = v105;
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDF6F90];
    v141[0] = MEMORY[0x24BDAC760];
    v141[1] = 3221225472;
    v141[2] = __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_2;
    v141[3] = &unk_24DD9CF20;
    v142 = v3;
    objc_msgSend(v32, "performWithoutAnimation:", v141);

  }
LABEL_62:

}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLocationName:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTemperature:", CFSTR("--"));
  objc_msgSend(*(id *)(a1 + 32), "setTemperatureLow:", CFSTR("--"));
  objc_msgSend(*(id *)(a1 + 32), "setTemperatureHigh:", CFSTR("--"));
  objc_msgSend(*(id *)(a1 + 32), "setConditionsLine1:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setConditionsLine2:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setConditionsImage:", 0);
}

void __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_3()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)_updateViewContent_temperatureFormatter;
  _updateViewContent_temperatureFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_updateViewContent_temperatureFormatter, "setLocale:", v2);

  v3 = objc_alloc(MEMORY[0x24BDBCE48]);
  v4 = objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
  v5 = (void *)_updateViewContent_ISO6801Calendar;
  _updateViewContent_ISO6801Calendar = v4;

}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTemperature:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTemperatureLow:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setTemperatureHigh:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setConditionsLine1:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setConditionsLine2:", *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 32), "setConditionsImage:", *(_QWORD *)(a1 + 80));
}

uint64_t __52__WAWeatherPlatterViewController__updateViewContent__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setTime:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(v2, "setTemperature:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setConditionsImage:", *(_QWORD *)(a1 + 64));
}

- (void)_contentSizeDidUpdate:(id)a3
{
  NSObject *v4;
  void *v5;

  WALogForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[WAWeatherPlatterViewController _contentSizeDidUpdate:].cold.1(v4);

  -[WAWeatherPlatterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)_kickoffLoadingWithLocation:(id)a3 orPerhapsALocationString:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke;
  v13[3] = &unk_24DD9DFD0;
  v8 = v6;
  v14 = v8;
  objc_copyWeak(&v15, &location);
  v9 = (void *)MEMORY[0x220751644](v13);
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x24BEC21D8]);
    objc_msgSend(v8, "coordinate");
    v11 = objc_msgSend(v10, "initWithCoordinate:resultHandler:", v9);
  }
  else
  {
    if (!v7)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEC21D8]), "initWithSearchString:resultHandler:", v7, v9);
  }
  v12 = (void *)v11;
LABEL_6:
  objc_msgSend(v12, "start");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WALogForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateStatus:", -1);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_buildModelForLocation:", v5);
  }

}

- (void)_buildModelForLocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WAWeatherPlatterViewController.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

  }
  -[WAWeatherPlatterViewController _updateStatus:](self, "_updateStatus:", 2);
  -[WAWeatherPlatterViewController _loadAQIDataForLocation:](self, "_loadAQIDataForLocation:", v5);
  objc_initWeak(&location, self);
  +[WATodayModel modelWithLocation:](WATodayModel, "modelWithLocation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAWeatherPlatterViewController setModel:](self, "setModel:", v6);

  -[WAWeatherPlatterViewController model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke;
  v10[3] = &unk_24DD9E020;
  v8 = v5;
  v11 = v8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "executeModelUpdateWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    WALogForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateStatus:", -1);

  }
  else
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "_updateStatus:", 3);

    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_69;
    v12 = &unk_24DD9DFF8;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], &v9);
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "_updateStatus:", 4, v9, v10, v11, v12);

    objc_destroyWeak(&v14);
  }

}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_69(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "URLComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2240]), "initWithLocation:", *(_QWORD *)(a1 + 32));
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setURLComponents:", v5);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom") == 0;
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "URLComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDestination:", v8);

  }
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "URLComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "setCommitURL:", v13);

  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "_updateViewContent");

}

- (void)_loadAQIDataForLocation:(id)a3
{
  id v4;
  City *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  City *v10;
  _QWORD v11[5];
  City *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(City);
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setName:](v5, "setName:", v6);

  objc_msgSend(v4, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setLocation:](v5, "setLocation:", v7);

  -[City setWfLocation:](v5, "setWfLocation:", v4);
  +[TWCCityUpdater sharedCityUpdater](TWCCityUpdater, "sharedCityUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke;
  v11[3] = &unk_24DD9E070;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "updateWeatherForCities:withCompletionHandler:", v9, v11);

}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_2;
  v11[3] = &unk_24DD9E048;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateViewWithAQIFromCity:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_3;
    v4[3] = &unk_24DD9CF48;
    v2 = *(id *)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = v2;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

void __58__WAWeatherPlatterViewController__loadAQIDataForLocation___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_updateViewWithAQIFromCity:", v2);

}

- (BOOL)_showingAQIViewForCity:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "aqiDataAvailabilityStatus") > 1;
}

- (double)preferredContentWidth
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  v4 = v3;

  result = 374.0;
  if (v4 <= 374.0)
    return v4;
  return result;
}

- (void)_updateViewWithAQIFromCity:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  -[WAWeatherPlatterViewController setCity:](self, "setCity:", v4);
  v5 = -[WAWeatherPlatterViewController _showingAQIViewForCity:](self, "_showingAQIViewForCity:", v4);

  -[WAWeatherPlatterViewController aqiView](self, "aqiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    -[WAWeatherPlatterViewController city](self, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithCity:layoutMode:", v8, 3);

    -[WAWeatherPlatterViewController aqiView](self, "aqiView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[WAWeatherPlatterViewController aqiView](self, "aqiView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAWeatherPlatterViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v10, "sizeThatFits:", v12, v13);

    -[WAWeatherPlatterViewController traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");

    +[WAWeatherPlatterViewController defaultViewHeight](WAWeatherPlatterViewController, "defaultViewHeight");
    -[WAWeatherPlatterViewController preferredContentWidth](self, "preferredContentWidth");
    -[WAWeatherPlatterViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    -[WAWeatherPlatterViewController aqiView](self, "aqiView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

    -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 0);

  }
  else
  {
    objc_msgSend(v6, "setHidden:", 1);

    -[WAWeatherPlatterViewController afterAQIDividerLineView](self, "afterAQIDividerLineView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    -[WAWeatherPlatterViewController preferredContentWidth](self, "preferredContentWidth");
    v19 = v18;
    +[WAWeatherPlatterViewController defaultViewHeight](WAWeatherPlatterViewController, "defaultViewHeight");
    -[WAWeatherPlatterViewController setPreferredContentSize:](self, "setPreferredContentSize:", v19, v20);
  }
  -[WAWeatherPlatterViewController updateViewConstraints](self, "updateViewConstraints");
}

- (void)_updateStatus:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__WAWeatherPlatterViewController__updateStatus___block_invoke;
  v3[3] = &unk_24DD9E098;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __48__WAWeatherPlatterViewController__updateStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:", *(_QWORD *)(a1 + 40));
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)commitURL
{
  return self->_commitURL;
}

- (void)setCommitURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (WFURLComponents)URLComponents
{
  return self->_URLComponents;
}

- (void)setURLComponents:(id)a3
{
  objc_storeStrong((id *)&self->_URLComponents, a3);
}

- (WATodayModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (WATodayHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)afterHeaderDividerLineView
{
  return self->_afterHeaderDividerLineView;
}

- (void)setAfterHeaderDividerLineView:(id)a3
{
  objc_storeStrong((id *)&self->_afterHeaderDividerLineView, a3);
}

- (WAAQIView)aqiView
{
  return self->_aqiView;
}

- (void)setAqiView:(id)a3
{
  objc_storeStrong((id *)&self->_aqiView, a3);
}

- (UIView)afterAQIDividerLineView
{
  return self->_afterAQIDividerLineView;
}

- (void)setAfterAQIDividerLineView:(id)a3
{
  objc_storeStrong((id *)&self->_afterAQIDividerLineView, a3);
}

- (NSArray)hourlyForecastViews
{
  return self->_hourlyForecastViews;
}

- (void)setHourlyForecastViews:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyForecastViews, a3);
}

- (UIStackView)hourlyBeltView
{
  return self->_hourlyBeltView;
}

- (void)setHourlyBeltView:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyBeltView, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (CGRect)lastBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastBounds.origin.x;
  y = self->_lastBounds.origin.y;
  width = self->_lastBounds.size.width;
  height = self->_lastBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastBounds:(CGRect)a3
{
  self->_lastBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_hourlyBeltView, 0);
  objc_storeStrong((id *)&self->_hourlyForecastViews, 0);
  objc_storeStrong((id *)&self->_afterAQIDividerLineView, 0);
  objc_storeStrong((id *)&self->_aqiView, 0);
  objc_storeStrong((id *)&self->_afterHeaderDividerLineView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
  objc_storeStrong((id *)&self->_commitURL, 0);
}

- (void)_contentSizeDidUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21AAEC000, log, OS_LOG_TYPE_DEBUG, "CONTENT SIZE DID UPDATE...", v1, 2u);
}

void __87__WAWeatherPlatterViewController__kickoffLoadingWithLocation_orPerhapsALocationString___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_21AAEC000, v0, v1, "Error geocoding location '%@': %@");
}

void __57__WAWeatherPlatterViewController__buildModelForLocation___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_21AAEC000, v0, v1, "Error executing model update for location'%@': %@");
}

@end
