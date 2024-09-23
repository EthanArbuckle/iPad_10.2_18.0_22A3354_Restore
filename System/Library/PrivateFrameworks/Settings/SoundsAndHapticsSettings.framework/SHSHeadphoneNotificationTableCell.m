@implementation SHSHeadphoneNotificationTableCell

- (SHSHeadphoneNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  SHSHeadphoneNotificationTableCell *v9;
  SHSHeadphoneNotificationTableCell *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  UILabel *titleLabel;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  UILabel *countLabel;
  void *v27;
  uint64_t v28;
  NSArray *notificationData;
  NSArray *v30;
  void *v31;
  int v32;
  void *v34;
  uint64_t v35;
  UIViewController *hostingController;
  uint64_t v37;
  UIView *notificationChart;
  void *v39;
  objc_super v40;

  v8 = a5;
  v40.receiver = self;
  v40.super_class = (Class)SHSHeadphoneNotificationTableCell;
  v9 = -[SHSHeadphoneNotificationTableCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[PSTableCell titleLabel](v9, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[PSTableCell valueLabel](v10, "valueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v16);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v18);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v13, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v13;

    v21 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v23);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v21, "setBackgroundColor:", v24);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v25) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v21, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    countLabel = v10->_countLabel;
    v10->_countLabel = v21;

    -[SHSHeadphoneNotificationTableCell contentView](v10, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v10->_titleLabel);
    objc_msgSend(v27, "addSubview:", v10->_countLabel);
    objc_msgSend(v8, "propertyForKey:", CFSTR("NotificationDataKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    notificationData = v10->_notificationData;
    v10->_notificationData = (NSArray *)v28;

    v30 = v10->_notificationData;
    if (v30
      && -[NSArray count](v30, "count")
      && (-[NSArray valueForKeyPath:](v10->_notificationData, "valueForKeyPath:", CFSTR("@sum.count")),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "isEqual:", &unk_24F19D9B8),
          v31,
          !v32))
    {
      v10->_shouldHideChart = 0;
      +[HeadphoneAudioNotificationModel shared](_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel, "shared");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setData:", v10->_notificationData);

      +[HeadphoneNotificationChartFactory create](_TtC24SoundsAndHapticsSettings33HeadphoneNotificationChartFactory, "create");
      v35 = objc_claimAutoreleasedReturnValue();
      hostingController = v10->_hostingController;
      v10->_hostingController = (UIViewController *)v35;

      -[UIViewController view](v10->_hostingController, "view");
      v37 = objc_claimAutoreleasedReturnValue();
      notificationChart = v10->_notificationChart;
      v10->_notificationChart = (UIView *)v37;

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10->_notificationChart, "setBackgroundColor:", v39);

      objc_msgSend(v27, "addSubview:", v10->_notificationChart);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_notificationChart, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    }
    else
    {
      v10->_shouldHideChart = 1;
    }
    -[SHSHeadphoneNotificationTableCell layoutSubviews](v10, "layoutSubviews");

  }
  return v10;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SHSHeadphoneNotificationTableCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[PSTableCell valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_countLabel, "setText:", v10);

  v11.receiver = self;
  v11.super_class = (Class)SHSHeadphoneNotificationTableCell;
  -[PSTableCell layoutSubviews](&v11, sel_layoutSubviews);
  -[SHSHeadphoneNotificationTableCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  _BOOL4 IsAccessibilityCategory;
  _BOOL8 shouldHideChart;
  NSArray *v14;
  NSArray *constraints;
  objc_super v16;

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  if (self->_shouldHideChart)
  {
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _countLabel"), self->_titleLabel, self->_countLabel, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _NSDictionaryOfVariableBindings(CFSTR("minimumLabelMargin"), &unk_24F19D998, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[UILabel textSize](self->_titleLabel, "textSize");
    objc_msgSend(v7, "numberWithDouble:", v8 * 5.0);
    v9 = objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _countLabel, _notificationChart"), self->_titleLabel, self->_countLabel, self->_notificationChart, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _NSDictionaryOfVariableBindings(CFSTR("minimumLabelMargin, chartMargin, minimumChartHeight"), &unk_24F19D998, &unk_24F19D9A8, v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
  }

  -[SHSHeadphoneNotificationTableCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

  shouldHideChart = self->_shouldHideChart;
  if (IsAccessibilityCategory)
    -[SHSHeadphoneNotificationTableCell accessibilityConstraintsWithVariableBindings:metrics:hideChart:](self, "accessibilityConstraintsWithVariableBindings:metrics:hideChart:", v5, v6, shouldHideChart);
  else
    -[SHSHeadphoneNotificationTableCell regularConstraintsWithVariableBindings:metrics:hideChart:](self, "regularConstraintsWithVariableBindings:metrics:hideChart:", v5, v6, shouldHideChart);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v14;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  v16.receiver = self;
  v16.super_class = (Class)SHSHeadphoneNotificationTableCell;
  -[SHSHeadphoneNotificationTableCell updateConstraints](&v16, sel_updateConstraints);

}

- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_titleLabel]-(>=minimumLabelMargin)-[_countLabel]-|"), 0, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_titleLabel]-|"), 0, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_countLabel]-|"), 0, v8, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-chartMargin-[_notificationChart]-chartMargin-|"), 0, v8, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_titleLabel]-(>=minimumLabelMargin)-[_notificationChart(>=minimumChartHeight)]-|"), 0, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_countLabel]-(>=minimumLabelMargin)-[_notificationChart(>=minimumChartHeight)]-|"), 0, v8, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v17;
  }

  return v16;
}

- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4 hideChart:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_titleLabel]-|"), 0, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_countLabel]-|"), 0, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_titleLabel]-[_countLabel]-|"), 0, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-chartMargin-[_notificationChart]-chartMargin-|"), 0, v8, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[_titleLabel]-[_countLabel]-[_notificationChart(>=minimumChartHeight)]-|"), 0, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v16;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_notificationChart, 0);
  objc_storeStrong((id *)&self->_notificationData, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
