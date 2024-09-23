@implementation SBBiometricMonitorViewController

- (void)loadView
{
  void *v3;
  SBBiometricMonitorView *v4;

  v4 = objc_alloc_init(SBBiometricMonitorView);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBiometricMonitorView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  -[SBBiometricMonitorViewController setView:](self, "setView:", v4);
}

@end
