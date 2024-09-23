@implementation WAGreetingView

- (WAGreetingView)initWithFrame:(CGRect)a3
{
  WAGreetingView *v3;
  WAGreetingView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WAGreetingView;
  v3 = -[WAGreetingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WAGreetingView setIsViewCreated:](v3, "setIsViewCreated:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[WAGreetingView createViews](v4, "createViews");
    -[WAGreetingView startService](v4, "startService");
  }
  return v4;
}

- (WAGreetingView)initWithColor:(id)a3
{
  id v4;
  WAGreetingView *v5;
  WAGreetingView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WAGreetingView;
  v5 = -[WAGreetingView init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WAGreetingView setLabelColor:](v5, "setLabelColor:", v4);
    -[WAGreetingView updateLabelColors](v6, "updateLabelColors");
  }

  return v6;
}

- (WAGreetingView)init
{
  WAGreetingView *v2;
  WAGreetingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WAGreetingView;
  v2 = -[WAGreetingView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WAGreetingView setIsViewCreated:](v2, "setIsViewCreated:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[WAGreetingView createViews](v3, "createViews");
    -[WAGreetingView startService](v3, "startService");
  }
  return v3;
}

- (void)startService
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[WAGreetingView todayModel](self, "todayModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[WAGreetingView _setupWeatherModel](self, "_setupWeatherModel");
  objc_initWeak(&location, self);
  -[WAGreetingView todayModel](self, "todayModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__WAGreetingView_startService__block_invoke;
  v5[3] = &unk_24DD9D678;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "executeModelUpdateWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __30__WAGreetingView_startService__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *WeakRetained;
  _BOOL4 v6;

  v4 = a3;
  WALogForCategory(3);
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
      __30__WAGreetingView_startService__block_invoke_cold_2((uint64_t)v4, WeakRetained);
  }
  else
  {
    if (v6)
      __30__WAGreetingView_startService__block_invoke_cold_1(WeakRetained);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject updateView](WeakRetained, "updateView");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[WAGreetingView _teardownWeatherModel](self, "_teardownWeatherModel");
  v3.receiver = self;
  v3.super_class = (Class)WAGreetingView;
  -[WAGreetingView dealloc](&v3, sel_dealloc);
}

- (void)_setupWeatherModel
{
  WATodayAutoupdatingLocationModel *v3;
  void *v4;
  WATodayAutoupdatingLocationModel *v5;
  void *v6;
  id v7;

  v3 = [WATodayAutoupdatingLocationModel alloc];
  v4 = (void *)objc_opt_new();
  v5 = -[WATodayAutoupdatingLocationModel initWithPreferences:effectiveBundleIdentifier:](v3, "initWithPreferences:effectiveBundleIdentifier:", v4, CFSTR("com.apple.weather"));
  -[WAGreetingView setTodayModel:](self, "setTodayModel:", v5);

  -[WAGreetingView todayModel](self, "todayModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithInitialCitySource:locationServicesActive:", 1, 1);

  -[WAGreetingView todayModel](self, "todayModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

}

- (void)_teardownWeatherModel
{
  void *v3;

  -[WAGreetingView todayModel](self, "todayModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WAGreetingView setTodayModel:](self, "setTodayModel:", 0);
}

- (void)updateLabelColors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAGreetingView labelColor](self, "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  -[WAGreetingView temperatureLabel](self, "temperatureLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WAGreetingView labelColor](self, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (void)createViews
{
  UILabel *v3;
  UILabel *natualLanguageDescriptionLabel;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *conditionImageView;
  UILabel *v10;
  UILabel *temperatureLabel;
  void *v12;
  void *v13;
  void *v14;

  if (!self->_natualLanguageDescriptionLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    natualLanguageDescriptionLabel = self->_natualLanguageDescriptionLabel;
    self->_natualLanguageDescriptionLabel = v3;

    -[WAGreetingView labelColor](self, "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[WAGreetingView labelColor](self, "labelColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_natualLanguageDescriptionLabel, "setTextColor:", v6);

    -[UILabel setTextAlignment:](self->_natualLanguageDescriptionLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_natualLanguageDescriptionLabel, "setFont:", v7);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_natualLanguageDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_natualLanguageDescriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_natualLanguageDescriptionLabel, "setLineBreakMode:", 0);
  }
  if (!self->_conditionImageView)
  {
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    conditionImageView = self->_conditionImageView;
    self->_conditionImageView = v8;

    -[UIImageView setContentMode:](self->_conditionImageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_conditionImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  if (!self->_temperatureLabel)
  {
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    temperatureLabel = self->_temperatureLabel;
    self->_temperatureLabel = v10;

    -[WAGreetingView labelColor](self, "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[WAGreetingView labelColor](self, "labelColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_temperatureLabel, "setTextColor:", v13);

    -[UILabel setTextAlignment:](self->_temperatureLabel, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 52.0, *MEMORY[0x24BDF7878]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_temperatureLabel, "setFont:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_temperatureLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  -[WAGreetingView addSubview:](self, "addSubview:", self->_natualLanguageDescriptionLabel);
  -[WAGreetingView addSubview:](self, "addSubview:", self->_conditionImageView);
  -[WAGreetingView addSubview:](self, "addSubview:", self->_temperatureLabel);
  self->_isViewCreated = 1;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WAGreetingView;
  -[WAGreetingView updateConstraints](&v3, sel_updateConstraints);
  -[WAGreetingView setupConstraints](self, "setupConstraints");
}

- (void)setupConstraints
{
  NSMutableArray *v3;
  NSMutableArray *constraints;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableArray *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSMutableArray *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  if (!-[NSMutableArray count](self->_constraints, "count") && self->_isViewCreated)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    constraints = self->_constraints;
    self->_constraints = v3;

    v5 = self->_constraints;
    -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView centerXAnchor](self, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v5, "addObject:", v9);

    v10 = self->_constraints;
    -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 32.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v10, "addObject:", v14);

    v15 = self->_constraints;
    -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView leadingAnchor](self, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 25.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v19);

    v20 = self->_constraints;
    -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView trailingAnchor](self, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -25.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v20, "addObject:", v24);

    v25 = self->_constraints;
    -[WAGreetingView conditionImageView](self, "conditionImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 65.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v25, "addObject:", v28);

    v29 = self->_constraints;
    -[WAGreetingView conditionImageView](self, "conditionImageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 65.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v29, "addObject:", v32);

    v33 = self->_constraints;
    -[WAGreetingView conditionImageView](self, "conditionImageView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView centerXAnchor](self, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v33, "addObject:", v37);

    v38 = self->_constraints;
    -[WAGreetingView conditionImageView](self, "conditionImageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView temperatureLabel](self, "temperatureLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v38, "addObject:", v43);

    v44 = self->_constraints;
    -[WAGreetingView temperatureLabel](self, "temperatureLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "lastBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 68.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v44, "addObject:", v49);

    v50 = self->_constraints;
    -[WAGreetingView temperatureLabel](self, "temperatureLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView centerXAnchor](self, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v50, "addObject:", v54);

    v55 = self->_constraints;
    -[WAGreetingView temperatureLabel](self, "temperatureLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAGreetingView trailingAnchor](self, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v55, "addObject:", v59);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  }
}

- (void)updateView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WAGreetingView natualLanguageDescriptionLabel](self, "natualLanguageDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAGreetingView todayModel](self, "todayModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forecastModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "naturalLanguageDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v7);

  -[WAGreetingView conditionImageView](self, "conditionImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAGreetingView _conditionsImage](self, "_conditionsImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

  -[WAGreetingView temperatureLabel](self, "temperatureLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WAGreetingView _temperature](self, "_temperature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

}

- (id)_temperature
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (_temperature_onceToken_0 != -1)
    dispatch_once(&_temperature_onceToken_0, &__block_literal_global_10);
  objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "temperatureUnit");
  objc_msgSend((id)_temperature_temperatureFormatter_0, "setOutputUnit:", v4);

  objc_msgSend((id)_temperature_temperatureFormatter_0, "setSymbolType:", !WAIsChinaSKUAndSimplifiedChinese());
  v5 = (void *)_temperature_temperatureFormatter_0;
  -[WAGreetingView todayModel](self, "todayModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forecastModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentConditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "temperature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForObjectValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __30__WAGreetingView__temperature__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_temperature_temperatureFormatter_0;
  _temperature_temperatureFormatter_0 = v0;

}

- (id)_conditionsImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WAGreetingView todayModel](self, "todayModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forecastModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WAImageForLegacyConditionCode(objc_msgSend(v4, "conditionCode"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WATodayAutoupdatingLocationModel)todayModel
{
  return self->_todayModel;
}

- (void)setTodayModel:(id)a3
{
  objc_storeStrong((id *)&self->_todayModel, a3);
}

- (UILabel)natualLanguageDescriptionLabel
{
  return self->_natualLanguageDescriptionLabel;
}

- (void)setNatualLanguageDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_natualLanguageDescriptionLabel, a3);
}

- (UIImageView)conditionImageView
{
  return self->_conditionImageView;
}

- (void)setConditionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_conditionImageView, a3);
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabel, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (BOOL)isViewCreated
{
  return self->_isViewCreated;
}

- (void)setIsViewCreated:(BOOL)a3
{
  self->_isViewCreated = a3;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionImageView, 0);
  objc_storeStrong((id *)&self->_natualLanguageDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_todayModel, 0);
}

void __30__WAGreetingView_startService__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Update succeed", v1, 2u);
}

void __30__WAGreetingView_startService__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "Update Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
