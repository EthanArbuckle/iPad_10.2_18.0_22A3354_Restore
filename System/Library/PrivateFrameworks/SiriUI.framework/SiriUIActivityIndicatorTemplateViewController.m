@implementation SiriUIActivityIndicatorTemplateViewController

- (void)loadView
{
  SiriUIActivityIndicatorTemplateView *v3;
  void *v4;
  SiriUIActivityIndicatorTemplateView *v5;

  v3 = [SiriUIActivityIndicatorTemplateView alloc];
  -[SiriUITemplateViewController templateModel](self, "templateModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SiriUIActivityIndicatorTemplateView initWithDataSource:](v3, "initWithDataSource:", v4);

  -[SiriUIActivityIndicatorTemplateViewController setView:](self, "setView:", v5);
}

@end
