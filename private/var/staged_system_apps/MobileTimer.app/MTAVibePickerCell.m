@implementation MTAVibePickerCell

- (MTAVibePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTAVibePickerCell *v4;
  MTAVibePickerCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MTAVibePickerCell *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTAVibePickerCell;
  v4 = -[MTAVibePickerCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", 1, a4);
  v5 = v4;
  if (v4)
  {
    -[MTAVibePickerCell setAccessoryType:](v4, "setAccessoryType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell textLabel](v5, "textLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell textLabel](v5, "textLabel"));
    objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v10, "setFont:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTAVibePickerCell setSelectedBackgroundColor:](v5, "setSelectedBackgroundColor:", v12);

    v13 = v5;
  }

  return v5;
}

- (void)setAlarm:(id)a3
{
  MTAlarm *v4;
  MTAlarm *alarm;

  v4 = (MTAlarm *)objc_msgSend(a3, "copy");
  alarm = self->_alarm;
  self->_alarm = v4;

  -[MTAVibePickerCell reload](self, "reload");
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell textLabel](self, "textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell alarm](self, "alarm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vibrationIdentifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell alarm](self, "alarm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sound"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vibrationIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameOfVibrationWithIdentifier:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v11, "setText:", v10);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_SOUND_NONE"), &stru_10009A4D0, CFSTR("MobileTimerUI")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v8, "setText:", v7);
  }

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTAVibePickerCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v12, "sizeToFit");

}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
