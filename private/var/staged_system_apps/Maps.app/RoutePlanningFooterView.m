@implementation RoutePlanningFooterView

- (RoutePlanningFooterView)initWithCoder:(id)a3
{
  RoutePlanningFooterView *v3;
  RoutePlanningFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  v3 = -[RoutePlanningFooterView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RoutePlanningFooterView customInit](v3, "customInit");
  return v4;
}

- (RoutePlanningFooterView)initWithFrame:(CGRect)a3
{
  RoutePlanningFooterView *v3;
  RoutePlanningFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  v3 = -[RoutePlanningFooterView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RoutePlanningFooterView customInit](v3, "customInit");
  return v4;
}

- (void)customInit
{
  void *v3;
  MapsThemeButton *v4;
  double y;
  double width;
  double height;
  MapsThemeButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  MapsThemeButton *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  MKViewWithHairline *v25;
  MKViewWithHairline *trailingHairlineView;
  uint64_t v27;
  void *v28;
  void *v29;
  Block_layout *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];

  self->_previousLayoutWidth = -1.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RoutePlanningFooterView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = [MapsThemeButton alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[MapsThemeButton initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RoutePlanningFooterView setLeadingButton:](self, "setLeadingButton:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v9, "setTitleColorProvider:", &stru_1011BE7C0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v11, "setContentHorizontalAlignment:", 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
  objc_msgSend(v13, "setLineBreakMode:", 4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("LeadingButton"));

  v17 = -[MapsThemeButton initWithFrame:]([MapsThemeButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RoutePlanningFooterView setTrailingButton:](self, "setTrailingButton:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "titleLabel"));
  objc_msgSend(v20, "setLineBreakMode:", 4);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v21, "setContentHorizontalAlignment:", 5);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, "setContentCompressionResistancePriority:forAxis:", 1, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("TrailingButton"));

  v25 = (MKViewWithHairline *)objc_msgSend(objc_alloc((Class)MKViewWithHairline), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  trailingHairlineView = self->_trailingHairlineView;
  self->_trailingHairlineView = v25;

  -[MKViewWithHairline setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKViewWithHairline setTopHairlineHidden:](self->_trailingHairlineView, "setTopHairlineHidden:", 1);
  -[MKViewWithHairline setBottomHairlineHidden:](self->_trailingHairlineView, "setBottomHairlineHidden:", 1);
  -[RoutePlanningFooterView addSubview:](self, "addSubview:", self->_trailingHairlineView);
  v27 = sub_1002A8AA0(self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "titleLabel"));
  if (v27 == 5)
    v30 = &stru_1011E7A38;
  else
    v30 = &stru_1011E7A78;
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v29, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v32, v30);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, "_didTapButton:", 64);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v34, "addTarget:action:forControlEvents:", self, "_didTapButton:", 64);

  v35 = objc_alloc((Class)UIStackView);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  v48[0] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  v48[1] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
  v39 = objc_msgSend(v35, "initWithArrangedSubviews:", v38);
  -[RoutePlanningFooterView setStackView:](self, "setStackView:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v41, "setAxis:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v42, "setDistribution:", 3);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v43, "setAlignment:", 2);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v44, "setBaselineRelativeArrangement:", 1);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v45, "setSpacing:", 16.0);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  objc_msgSend(v46, "setAccessibilityIdentifier:", CFSTR("RoutePlanningFooterStack"));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  -[RoutePlanningFooterView addSubview:](self, "addSubview:", v47);

  -[RoutePlanningFooterView _updateVisibleCommandsForCommandSet](self, "_updateVisibleCommandsForCommandSet");
  -[RoutePlanningFooterView _setupConstraints](self, "_setupConstraints");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningFooterView;
  -[RoutePlanningFooterView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[RoutePlanningFooterView updateTheme](self, "updateTheme");
  }

}

- (void)updateTheme
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hairlineColor"));
  -[MKViewWithHairline setHairlineColor:](self->_trailingHairlineView, "setHairlineColor:", v3);

}

- (void)_updateVisibleCommandsForCommandSet
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  _QWORD v48[4];
  char v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v4 = -[RoutePlanningFooterView visibleCommandSet](self, "visibleCommandSet");
  v5 = v4;
  if (sub_1003DEBC8(v4) && (v5 & 8) != 0)
  {
    v56[1] = CFSTR("title");
    v57[0] = &off_10126ECC8;
    v56[0] = CFSTR("command");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Report an Issue"), CFSTR("localized string not found"), 0));
    v57[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
    objc_msgSend(v3, "addObject:", v8);

  }
  if ((v5 & 1) != 0)
  {
    v55[0] = &off_10126ECE0;
    v54[0] = CFSTR("command");
    v54[1] = CFSTR("title");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("More Rides"), CFSTR("localized string not found"), 0));
    v55[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));
    objc_msgSend(v3, "addObject:", v20);

    if ((v5 & 2) == 0)
    {
LABEL_6:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_6;
  }
  v52[1] = CFSTR("title");
  v53[0] = &off_10126ECF8;
  v52[0] = CFSTR("command");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Share"), CFSTR("localized string not found"), 0));
  v53[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
  objc_msgSend(v3, "addObject:", v23);

  if ((v5 & 4) != 0)
  {
LABEL_7:
    v51[0] = &off_10126ED10;
    v50[0] = CFSTR("command");
    v50[1] = CFSTR("title");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Get Tickets"), CFSTR("localized string not found"), 0));
    v51[1] = v10;
    v50[2] = CFSTR("menuProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView _getTicketsMenuProvider](self, "_getTicketsMenuProvider"));
    v51[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));
    objc_msgSend(v3, "addObject:", v12);

  }
LABEL_8:
  v47 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v14 = v13;
  if (v13)
  {
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("title")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("command")));
    v16 = objc_msgSend(v15, "integerValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("menuProvider")));
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v46 = &stru_1011EB268;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastObject"));
  v25 = 0;
  v26 = &stru_1011EB268;
  if (v24)
  {
    v27 = 0;
    if (v24 != v14)
    {
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("title")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("command")));
      v25 = objc_msgSend(v28, "integerValue");

      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("menuProvider")));
    }
  }
  else
  {
    v27 = 0;
  }
  v29 = -[__CFString length](v46, "length", v27) == 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v30, "setHidden:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v31, "setTitle:forState:", v46, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v32, "setTag:", v16);

  if (sub_1002A8AA0(self) == 5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
    objc_msgSend(v33, "_setMenuProvider:", v17);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
    objc_msgSend(v34, "setContextMenuInteractionEnabled:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
    objc_msgSend(v35, "setShowsMenuAsPrimaryAction:", v17 != 0);

  }
  v36 = -[__CFString length](v26, "length") == 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v37, "setHidden:", v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v38, "setTitle:forState:", v26, 0);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v39, "setTag:", v25);

  if (sub_1002A8AA0(self) == 5)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    objc_msgSend(v40, "_setMenuProvider:", v45);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    objc_msgSend(v41, "setContextMenuInteractionEnabled:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    objc_msgSend(v42, "setShowsMenuAsPrimaryAction:", v45 != 0);

  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1007872C0;
  v48[3] = &unk_1011C6538;
  v49 = 1;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v43, "setTitleColorProvider:", v48);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v44, "setUserInteractionEnabled:", 1);

}

- (id)_getTicketsMenuProvider
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", 7014, 606, 0);

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007873C8;
  v7[3] = &unk_1011C6560;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v4 = objc_retainBlock(v7);
  v5 = objc_retainBlock(v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)_didTapTicketingSegmentInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "routePlanningView:didTapGetTicketsForURL:");

  v6 = v12;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ticketingUrl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
      objc_msgSend(v11, "routePlanningView:didTapGetTicketsForURL:", self, v10);

    }
    v6 = v12;
  }

}

- (void)setVisibleCommandSet:(int64_t)a3
{
  if (self->_visibleCommandSet != a3)
  {
    self->_visibleCommandSet = a3;
    -[RoutePlanningFooterView _updateVisibleCommandsForCommandSet](self, "_updateVisibleCommandsForCommandSet");
    -[RoutePlanningFooterView _setupConstraints](self, "_setupConstraints");
  }
}

- (void)layoutSubviews
{
  CGFloat Width;
  unsigned int v4;
  unsigned int v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFooterView;
  -[RoutePlanningFooterView layoutSubviews](&v6, "layoutSubviews");
  -[RoutePlanningFooterView bounds](self, "bounds");
  Width = CGRectGetWidth(v7);
  if (Width != self->_previousLayoutWidth)
  {
    v4 = -[RoutePlanningFooterView shouldStackButtonsForWidth:](self, "shouldStackButtonsForWidth:");
    v5 = -[RoutePlanningFooterView shouldStackButtonsForWidth:](self, "shouldStackButtonsForWidth:", Width);
    self->_previousLayoutWidth = Width;
    if (v4 != v5)
      -[RoutePlanningFooterView _setupConstraints](self, "_setupConstraints");
  }
}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  _UNKNOWN **v5;
  unsigned int v6;
  void *v7;
  void *v8;
  __objc2_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSArray *v69;
  NSArray *constraints;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  id v81;
  _QWORD v82[3];
  _QWORD v83[4];
  CGRect v84;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  LODWORD(v4) = 1144750080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);

  v5 = MKPlaceCollectionsLogicController_ptr;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[RoutePlanningFooterView bounds](self, "bounds");
  v6 = -[RoutePlanningFooterView shouldStackButtonsForWidth:](self, "shouldStackButtonsForWidth:", CGRectGetWidth(v84));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  v8 = v7;
  v9 = SearchListOrderedDataSource;
  v80 = v6;
  if (v6)
  {
    objc_msgSend(v7, "setAxis:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    objc_msgSend(v10, "setAlignment:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    +[DynamicTypeWizard autoscaleStackView:spacing:withFontProvider:](DynamicTypeWizard, "autoscaleStackView:spacing:withFontProvider:", v11, &stru_1011E7A38, 31.0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    objc_msgSend(v12, "setContentHorizontalAlignment:", 4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    objc_msgSend(v13, "setTopHairlineHidden:", 0);

    v81 = objc_alloc_init((Class)NSMutableArray);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView centerYAnchor](self, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 3.0));

    v79 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v17, &stru_1011E7A38, 3.0));
    v83[0] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "leadingAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v75));
    v83[1] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "lastBaselineAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v18));
    v83[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v83[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 4));
    objc_msgSend(v81, "addObjectsFromArray:", v25);

    v5 = MKPlaceCollectionsLogicController_ptr;
    v9 = SearchListOrderedDataSource;

  }
  else
  {
    objc_msgSend(v7, "setSpacing:", 16.0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    objc_msgSend(v26, "setAxis:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    objc_msgSend(v27, "setAlignment:", 2);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    +[DynamicTypeWizard stopAutoscalingStackView:](DynamicTypeWizard, "stopAutoscalingStackView:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    objc_msgSend(v29, "setContentHorizontalAlignment:", 5);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    objc_msgSend(v30, "setTopHairlineHidden:", 1);

    v31 = objc_alloc_init((Class)NSMutableArray);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingHairlineView](self, "trailingHairlineView"));
    LODWORD(v34) = 1148846080;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_maps_constraintsEqualToEdgesOfView:priority:", v33, v34));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allConstraints"));
    v81 = v31;
    objc_msgSend(v31, "addObjectsFromArray:", v36);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView traitCollection](self, "traitCollection"));
  v38 = objc_msgSend(v37, "userInterfaceIdiom");

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
  v41 = v39;
  if (v38 == (id)5)
  {
    LODWORD(v40) = 1148846080;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, 8.0, 16.0, 8.0, 16.0, v40));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allConstraints"));
    v44 = v81;
    objc_msgSend(v81, "addObjectsFromArray:", v43);
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstBaselineAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView topAnchor](self, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 32.0));

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView bottomAnchor](self, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "lastBaselineAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, 15.0));

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v9[16], "autoscaledConstraint:constant:withFontProvider:", v47, &stru_1011E7A38, 32.0));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v9[16], "autoscaledConstraint:constant:withFontProvider:", v51, &stru_1011E7A38, 15.0));

    v82[0] = v41;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingAnchor](self, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 16.0));
    v82[1] = v55;
    v82[2] = v42;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 3));
    objc_msgSend(v81, "addObjectsFromArray:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingAnchor](self, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59, 16.0));
    -[RoutePlanningFooterView setStackViewTrailingConstraint:](self, "setStackViewTrailingConstraint:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingAnchor](self, "trailingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackView](self, "stackView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintGreaterThanOrEqualToAnchor:constant:", v63, 16.0));
    -[RoutePlanningFooterView setStackViewFlexibleTrailingConstraint:](self, "setStackViewFlexibleTrailingConstraint:", v64);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
    LODWORD(v62) = v80 | objc_msgSend(v65, "isHidden") ^ 1;

    if ((_DWORD)v62 == 1)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackViewFlexibleTrailingConstraint](self, "stackViewFlexibleTrailingConstraint"));
      objc_msgSend(v66, "setActive:", 0);

      v67 = objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackViewTrailingConstraint](self, "stackViewTrailingConstraint"));
    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackViewTrailingConstraint](self, "stackViewTrailingConstraint"));
      objc_msgSend(v68, "setActive:", 0);

      v67 = objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView stackViewFlexibleTrailingConstraint](self, "stackViewFlexibleTrailingConstraint"));
    }
    v43 = (void *)v67;
    v44 = v81;
    objc_msgSend(v81, "addObject:", v67);
  }

  v69 = (NSArray *)objc_msgSend(v44, "copy");
  constraints = self->_constraints;
  self->_constraints = v69;

  objc_msgSend(v5[348], "activateConstraints:", self->_constraints);
}

- (BOOL)shouldStackButtonsForWidth:(double)a3
{
  void *v5;
  id v6;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView leadingButton](self, "leadingButton"));
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView trailingButton](self, "trailingButton"));
  objc_msgSend(v11, "intrinsicContentSize");
  v13 = v12;

  v14 = a3 + -48.0;
  if (a3 + -48.0 < 0.0)
    v14 = 0.0;
  return v10 + v13 - v14 > 0.0;
}

- (void)_didTapButton:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;

  v4 = objc_msgSend(a3, "tag");
  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
      v6 = objc_opt_respondsToSelector(v5, "didTapMoreRidesharingChoicesButtonOnRoutePlanningFooterView:");

      if ((v6 & 1) != 0)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
        objc_msgSend(v13, "didTapMoreRidesharingChoicesButtonOnRoutePlanningFooterView:", self);
        goto LABEL_11;
      }
      break;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
      v8 = objc_opt_respondsToSelector(v7, "didTapShareButtonOnRoutePlanningFooterView:");

      if ((v8 & 1) != 0)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
        objc_msgSend(v13, "didTapShareButtonOnRoutePlanningFooterView:", self);
        goto LABEL_11;
      }
      break;
    case 4uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
      v10 = objc_opt_respondsToSelector(v9, "didTapGetTicketsOnRoutePlanningFooterView:");

      if ((v10 & 1) != 0)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
        objc_msgSend(v13, "didTapGetTicketsOnRoutePlanningFooterView:", self);
        goto LABEL_11;
      }
      break;
    case 8uLL:
      if (sub_1003DEBC8((uint64_t)v4))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
        v12 = objc_opt_respondsToSelector(v11, "didTapReportAProblemButtonOnRoutePlanningFooterView:");

        if ((v12 & 1) != 0)
        {
          v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterView delegate](self, "delegate"));
          objc_msgSend(v13, "didTapReportAProblemButtonOnRoutePlanningFooterView:", self);
LABEL_11:

        }
      }
      break;
    default:
      return;
  }
}

- (int64_t)visibleCommandSet
{
  return self->_visibleCommandSet;
}

- (RoutePlanningFooterViewDelegate)delegate
{
  return (RoutePlanningFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (void)setLeadingButton:(id)a3
{
  objc_storeStrong((id *)&self->_leadingButton, a3);
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (void)setTrailingButton:(id)a3
{
  objc_storeStrong((id *)&self->_trailingButton, a3);
}

- (MKViewWithHairline)trailingHairlineView
{
  return self->_trailingHairlineView;
}

- (void)setTrailingHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingHairlineView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)stackViewFlexibleTrailingConstraint
{
  return self->_stackViewFlexibleTrailingConstraint;
}

- (void)setStackViewFlexibleTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewFlexibleTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewFlexibleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingHairlineView, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
