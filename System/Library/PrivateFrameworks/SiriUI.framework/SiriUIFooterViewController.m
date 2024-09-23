@implementation SiriUIFooterViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUIFooterViewController;
  -[SiriUIFooterViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SiriUIFooterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriUIFooterViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginProgressAnimation");

  }
}

@end
