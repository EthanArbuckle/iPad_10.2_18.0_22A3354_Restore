@implementation MTATonePickerCell

- (MTATonePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTATonePickerCell *v4;
  MTATonePickerCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MTATonePickerCell *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTATonePickerCell;
  v4 = -[MTATonePickerCell initWithStyle:reuseIdentifier:](&v15, "initWithStyle:reuseIdentifier:", 1, a4);
  v5 = v4;
  if (v4)
  {
    -[MTATonePickerCell setAccessoryType:](v4, "setAccessoryType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell textLabel](v5, "textLabel"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell textLabel](v5, "textLabel"));
    objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v10, "setFont:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTATonePickerCell setSelectedBackgroundColor:](v5, "setSelectedBackgroundColor:", v12);

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

  -[MTATonePickerCell reload](self, "reload");
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell textLabel](self, "textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)reload
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell alarm](self, "alarm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sound"));
  v5 = objc_msgSend(v4, "soundType");

  if (v5 == (id)2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell alarm](self, "alarm"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sound"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString toneIdentifier](v8, "toneIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameForToneIdentifier:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v11, "setText:", v10);

LABEL_7:
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell alarm](self, "alarm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sound"));
  v14 = objc_msgSend(v13, "soundType");

  if (v14 == (id)3)
  {
    v15 = objc_alloc((Class)MPMediaItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell alarm](self, "alarm"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sound"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaItemIdentifier"));
    v6 = objc_msgSend(v15, "initWithPersistentID:", objc_msgSend(v18, "longLongValue"));

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", MPMediaItemPropertyTitle));
    v20 = (void *)v19;
    v21 = &stru_10009A4D0;
    if (v19)
      v21 = (__CFString *)v19;
    v8 = v21;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell detailTextLabel](self, "detailTextLabel"));
    objc_msgSend(v7, "setText:", v8);
    goto LABEL_7;
  }
LABEL_8:
  v22 = (id)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v22, "sizeToFit");

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
