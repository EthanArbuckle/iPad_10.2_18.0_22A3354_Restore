@implementation WFLeadingInsetTableViewCell

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFLeadingInsetTableViewCell;
  -[WFLeadingInsetTableViewCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFLeadingInsetTableViewCell;
  -[WFLeadingInsetTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)layoutSubviews
{
  void *v3;
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
  void *v14;
  objc_super v15;

  -[WFLeadingInsetTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[WFLeadingInsetTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v11 = v10;
  -[WFLeadingInsetTableViewCell _airportSettingsCellConnectionStateExtraLeadingInset](self, "_airportSettingsCellConnectionStateExtraLeadingInset");
  v13 = v11 + v12;
  -[WFLeadingInsetTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v5, v13, v7, v9);

  v15.receiver = self;
  v15.super_class = (Class)WFLeadingInsetTableViewCell;
  -[WFLeadingInsetTableViewCell layoutSubviews](&v15, sel_layoutSubviews);
}

- (double)_airportSettingsCellConnectionStateExtraLeadingInset
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double result;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 >= v7)
    v8 = v7;
  else
    v8 = v4;
  v9 = v8 >= 414.0 && v8 <= 430.0;
  result = 20.0;
  if (!v9)
    return 24.0;
  return result;
}

@end
