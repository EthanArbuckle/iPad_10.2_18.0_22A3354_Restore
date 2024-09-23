@implementation RAPReportComposerEntranceDetailsPart

- (RAPReportComposerEntranceDetailsPart)initWithCorrectableString:(id)a3
{
  id v4;
  RAPReportComposerIncorrectNameSection *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPReportComposerEntranceDetailsPart *v9;
  objc_super v11;
  RAPReportComposerIncorrectNameSection *v12;

  v4 = a3;
  v5 = -[RAPReportComposerIncorrectNameSection initWithCorrectableString:required:]([RAPReportComposerIncorrectNameSection alloc], "initWithCorrectableString:required:", v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Details [Report a Problem, Access Point]"), CFSTR("localized string not found"), 0));
  -[RAPTablePartSection setHeaderTitle:](v5, "setHeaderTitle:", v7);

  v12 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v11.receiver = self;
  v11.super_class = (Class)RAPReportComposerEntranceDetailsPart;
  v9 = -[RAPTablePart initWithSections:](&v11, "initWithSections:", v8);

  return v9;
}

@end
