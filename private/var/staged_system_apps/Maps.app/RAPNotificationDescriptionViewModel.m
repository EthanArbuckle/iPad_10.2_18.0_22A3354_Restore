@implementation RAPNotificationDescriptionViewModel

- (RAPNotificationDescriptionViewModel)initWithRAPNotificationDetailsViewModel:(id)a3
{
  id v5;
  RAPNotificationDescriptionViewModel *v6;
  RAPNotificationDescriptionViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPNotificationDescriptionViewModel;
  v6 = -[RAPNotificationDescriptionViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_detailsViewModel, a3);

  return v7;
}

- (NSString)imageName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewModel descriptionInfo](self->_detailsViewModel, "descriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageName"));

  return (NSString *)v3;
}

- (UIColor)imageBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewModel descriptionInfo](self->_detailsViewModel, "descriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageBackgroundColor"));

  return (UIColor *)v3;
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewModel descriptionInfo](self->_detailsViewModel, "descriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleText"));

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsViewModel descriptionInfo](self->_detailsViewModel, "descriptionInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptionText"));

  return (NSString *)v3;
}

- (NSString)linkButtonText
{
  return -[RAPNotificationDetailsViewModel linkButtonText](self->_detailsViewModel, "linkButtonText");
}

- (NSString)linkButtonLink
{
  return -[RAPNotificationDetailsViewModel linkButtonLink](self->_detailsViewModel, "linkButtonLink");
}

- (BOOL)shouldDisplayLink
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel linkButtonLink](self, "linkButtonLink"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel linkButtonText](self, "linkButtonText"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsViewModel, 0);
}

@end
