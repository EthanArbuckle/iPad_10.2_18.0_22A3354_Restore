@implementation VUIGDPRViewController

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VUIGDPRViewController;
  -[AMSUIOnboardingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("dialogId");
  v6[1] = CFSTR("dialogType");
  v7[0] = CFSTR("GDPR");
  v7[1] = CFSTR("GDPR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordDialog:", v4);

}

@end
