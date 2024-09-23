@implementation WLDetailWarningViewController

- (WLDetailWarningViewController)initWithWLDetailItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WLDetailWarningViewController *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)WLDetailWarningViewController;
  v7 = -[WLDetailWarningViewController initWithTitle:detailText:symbolName:](&v9, sel_initWithTitle_detailText_symbolName_, v5, v6, CFSTR("exclamationmark.triangle"));

  return v7;
}

@end
