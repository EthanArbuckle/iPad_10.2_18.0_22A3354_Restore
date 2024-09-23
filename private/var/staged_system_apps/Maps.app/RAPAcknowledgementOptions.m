@implementation RAPAcknowledgementOptions

+ (id)defaultOptions
{
  return objc_alloc_init(RAPAcknowledgementOptions);
}

- (RAPAcknowledgementOptions)init
{
  RAPAcknowledgementOptions *v2;
  RAPAcknowledgementOptions *v3;
  uint64_t v4;
  NSString *title;
  uint64_t v6;
  NSString *message;
  NSString *primaryButtonTitle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RAPAcknowledgementOptions;
  v2 = -[RAPAcknowledgementOptions init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[RAPAcknowledgementOptions _defaultTitle](v2, "_defaultTitle"));
    title = v3->_title;
    v3->_title = (NSString *)v4;

    v6 = objc_claimAutoreleasedReturnValue(-[RAPAcknowledgementOptions _defaultMessage](v3, "_defaultMessage"));
    message = v3->_message;
    v3->_message = (NSString *)v6;

    primaryButtonTitle = v3->_primaryButtonTitle;
    v3->_primaryButtonTitle = (NSString *)&stru_1011EB268;

  }
  return v3;
}

- (id)_defaultTitle
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "loggedIn");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[RAP] Title for the Thank You screen, logged in"), CFSTR("localized string not found"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userGivenName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[RAP] Title for the Thank You screen, not logged in"), CFSTR("localized string not found"), 0));
  }

  return v8;
}

- (id)_defaultMessage
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UserProfileReportHistoryManager sharedInstance](UserProfileReportHistoryManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "inChina");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("You’re making Maps better for everyone!");
  else
    v6 = CFSTR("You’re making Maps better for everyone! We’ll let you know when we’ve reviewed your report.");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return v7;
}

- (BOOL)shouldDismissAutomatically
{
  return 0;
}

- (BOOL)showsInternalStatusLink
{
  return 1;
}

- (int64_t)acknowledgementOptionsType
{
  return 0;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
}

@end
