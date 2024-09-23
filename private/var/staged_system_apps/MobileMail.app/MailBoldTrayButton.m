@implementation MailBoldTrayButton

+ (id)boldButton
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MailBoldTrayButton;
  v2 = objc_msgSendSuper2(&v6, "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boldConfiguration"));
  objc_msgSend(v3, "setConfiguration:", v4);

  return v3;
}

- (id)boldConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  objc_msgSend(v2, "setButtonSize:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "background"));
  objc_msgSend(v3, "setCornerRadius:", 14.0);

  return v2;
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailBoldTrayButton;
  -[MailBoldTrayButton updateConfiguration](&v5, "updateConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailBoldTrayButton configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailBoldTrayButton tintColor](self, "tintColor"));
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  -[MailBoldTrayButton setConfiguration:](self, "setConfiguration:", v3);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MailBoldTrayButton;
  -[MailBoldTrayButton tintColorDidChange](&v3, "tintColorDidChange");
  -[MailBoldTrayButton setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

@end
