@implementation VTUISiriDataSharingOptInViewController

- (VTUISiriDataSharingOptInViewController)initWithViewStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  VTUISiriDataSharingOptInViewController *v9;
  objc_super v11;

  if (a3 == 2)
  {
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DATA_SHARING_TITLE_DICTATION");
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      v7 = 0;
      goto LABEL_11;
    }
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DATA_SHARING_TITLE_SIRI");
LABEL_6:
    objc_msgSend(v4, "uiLocalizedStringForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v11.receiver = self;
    v11.super_class = (Class)VTUISiriDataSharingOptInViewController;
    self = -[VTUISiriDataSharingOptInViewController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v7, 0, 0);

    v9 = self;
    goto LABEL_12;
  }
  v8 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR))
    -[VTUISiriDataSharingOptInViewController initWithViewStyle:].cold.1(v8);
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUISiriDataSharingOptInViewController;
  -[VTUISiriDataSharingOptInViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[VTUISiriDataSharingOptInViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissFromViewController:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (VTUISiriDataSharingOptInViewControllerDelegate)delegate
{
  return (VTUISiriDataSharingOptInViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithViewStyle:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[VTUISiriDataSharingOptInViewController initWithViewStyle:]";
  _os_log_error_impl(&dword_229EF7000, log, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Passing VTUISiriDataSharingOptInViewStyleSiriProx to VTUISiriDataSharingViewController", (uint8_t *)&v1, 0xCu);
}

@end
