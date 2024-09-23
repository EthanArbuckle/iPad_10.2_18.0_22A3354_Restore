@implementation ReportLinkAddToMapsProvider

- (id)createReportLink
{
  int BOOL;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  ReportLink *v8;
  void *v9;
  ReportLink *v10;

  BOOL = GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (BOOL)
    v6 = CFSTR("[Reports] Report Something Missing");
  else
    v6 = CFSTR("[Reports] Add to Maps");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  v8 = [ReportLink alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("pin.point.of.interest.badge.plus")));
  v10 = -[ReportLink initWithTitle:icon:](v8, "initWithTitle:icon:", v7, v9);

  -[ReportLink setReportLinkType:](v10, "setReportLinkType:", -[ReportLinkAddToMapsProvider reportLinkType](self, "reportLinkType"));
  return v10;
}

- (int64_t)reportLinkType
{
  return 0;
}

@end
