@implementation CarLoadingGuidanceSign

- (CarLoadingGuidanceSign)initWithDestination:(unint64_t)a3
{
  CarLoadingGuidanceSign *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarLoadingGuidanceSign;
  v3 = -[CarSpinnerGuidanceSign initWithDestination:](&v7, "initWithDestination:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Loading... [CarPlay]"), CFSTR("localized string not found"), 0));
    -[CarSpinnerGuidanceSign setPrimaryString:](v3, "setPrimaryString:", v5);

  }
  return v3;
}

@end
