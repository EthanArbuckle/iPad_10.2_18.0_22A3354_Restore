@implementation SettingsTableViewCell

+ (void)initialize
{
  if (qword_1014D32E0 != -1)
    dispatch_once(&qword_1014D32E0, &stru_1011C69A8);
}

- (SettingsTableViewCell)initWithReuseIdentifier:(id)a3
{
  SettingsTableViewCell *v3;
  SettingsTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewCell;
  v3 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v6, "initWithStyle:reuseIdentifier:", 0, a3);
  v4 = v3;
  if (v3)
    -[SettingsTableViewCell updateBeforeDisplayWithTextAlignment:](v3, "updateBeforeDisplayWithTextAlignment:", 4);
  return v4;
}

- (void)updateBeforeDisplayWithTextAlignment:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SettingsTableViewCell setOpaque:](self, "setOpaque:", 0);
  -[SettingsTableViewCell setBackgroundColor:](self, "setBackgroundColor:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SettingsTableViewCell contentView](self, "contentView"));
  objc_msgSend(v7, "setOpaque:", 0);
  objc_msgSend(v7, "setBackgroundColor:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setTextAlignment:", a3);
  objc_msgSend(v5, "setOpaque:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "setBackgroundColor:", 0);
  -[SettingsTableViewCell _maps_recursivelySetAllowsGroupOpacity:](self, "_maps_recursivelySetAllowsGroupOpacity:", 0);

}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SettingsTableViewCell;
  -[MapsThemeTableViewCell updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewCell theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SettingsTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

@end
