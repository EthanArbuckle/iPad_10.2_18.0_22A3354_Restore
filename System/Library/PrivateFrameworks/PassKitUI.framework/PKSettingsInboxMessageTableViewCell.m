@implementation PKSettingsInboxMessageTableViewCell

- (PKSettingsInboxMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PKSettingsInboxMessageTableViewCell *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKSettingsInboxMessageTableViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v13, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pkInboxMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInboxMessageContentConfiguration configurationWithInboxMessage:](PKInboxMessageContentConfiguration, "configurationWithInboxMessage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSettingsInboxMessageTableViewCell setContentConfiguration:](v9, "setContentConfiguration:", v11);

  }
  return v9;
}

@end
