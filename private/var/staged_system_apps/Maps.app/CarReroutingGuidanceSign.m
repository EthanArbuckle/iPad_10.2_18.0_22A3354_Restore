@implementation CarReroutingGuidanceSign

- (CarReroutingGuidanceSign)initWithDestination:(unint64_t)a3
{
  CarReroutingGuidanceSign *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarReroutingGuidanceSign;
  v3 = -[CarSpinnerGuidanceSign initWithDestination:](&v9, "initWithDestination:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Rerouting... [CarPlay]"), CFSTR("localized string not found"), 0));
    -[CarSpinnerGuidanceSign setPrimaryString:](v3, "setPrimaryString:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Data connection required [CarPlay]"), CFSTR("localized string not found"), 0));
    -[CarSpinnerGuidanceSign setMessageString:](v3, "setMessageString:", v7);

  }
  return v3;
}

@end
