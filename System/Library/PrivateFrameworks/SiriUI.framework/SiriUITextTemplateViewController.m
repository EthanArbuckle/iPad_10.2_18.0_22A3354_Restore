@implementation SiriUITextTemplateViewController

- (void)loadView
{
  SiriUITextTemplateView *v3;
  void *v4;
  SiriUITextTemplateView *v5;

  v3 = [SiriUITextTemplateView alloc];
  -[SiriUITemplateViewController templateModel](self, "templateModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SiriUITextTemplateView initWithDataSource:](v3, "initWithDataSource:", v4);

  -[SiriUITextTemplateView addTargetForDisclosure:action:](v5, "addTargetForDisclosure:action:", self, sel__textTemplateViewDisclosed_);
  -[SiriUILabelStackTemplateView setDelegate:](v5, "setDelegate:", self);
  -[SiriUITextTemplateViewController setView:](self, "setView:", v5);

}

- (void)_textTemplateViewDisclosed:(id)a3
{
  id v4;

  -[SiriUITemplateViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentDetailsForTemplateViewController:", self);

}

@end
