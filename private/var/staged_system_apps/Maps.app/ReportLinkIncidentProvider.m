@implementation ReportLinkIncidentProvider

- (id)createReportLink
{
  void *v3;
  void *v4;
  ReportLink *v5;
  void *v6;
  ReportLink *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Reports] Report an Incident"), CFSTR("localized string not found"), 0));

  v5 = [ReportLink alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.triangle")));
  v7 = -[ReportLink initWithTitle:icon:](v5, "initWithTitle:icon:", v4, v6);

  -[ReportLink setReportLinkType:](v7, "setReportLinkType:", -[ReportLinkIncidentProvider reportLinkType](self, "reportLinkType"));
  return v7;
}

- (int64_t)reportLinkType
{
  return 1;
}

@end
