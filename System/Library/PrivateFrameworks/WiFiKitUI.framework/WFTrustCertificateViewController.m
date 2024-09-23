@implementation WFTrustCertificateViewController

- (WFTrustCertificateViewController)initWithCertificateProviderContext:(id)a3
{
  id v5;
  WFTrustCertificateViewController *v6;
  WFTrustCertificateViewController *v7;
  NSObject *v9;
  os_log_type_t v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFTrustCertificateViewController;
  v6 = -[TrustCertificateViewController initWithTrust:action:delegate:](&v11, sel_initWithTrust_action_delegate_, objc_msgSend(v5, "certificateTrust"), 2, self);
  v7 = v6;
  if (!v6)
  {
LABEL_10:

    v7 = 0;
    goto LABEL_4;
  }
  if (!v5)
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFTrustCertificateViewController initWithCertificateProviderContext:]";
      _os_log_impl(&dword_2196CC000, v9, v10, "%s: nil credentials provider context", buf, 0xCu);
    }

    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_credentialsContext, a3);
  v7->_wantsModalPresentation = 1;
LABEL_4:

  return v7;
}

- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4
{
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v10 = 136315394;
    v11 = "-[WFTrustCertificateViewController trustCertificateViewController:finishedWithReturnCode:]";
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_2196CC000, v6, v7, "%s- returnCode %d", (uint8_t *)&v10, 0x12u);
  }

  -[WFTrustCertificateViewController credentialsContext](self, "credentialsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 == 1)
    objc_msgSend(v8, "accept");
  else
    objc_msgSend(v8, "cancel");

}

- (BOOL)wantsModalPresentation
{
  return self->_wantsModalPresentation;
}

- (WFCertificateProviderContext)credentialsContext
{
  return self->_credentialsContext;
}

- (void)setCredentialsContext:(id)a3
{
  objc_storeStrong((id *)&self->_credentialsContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsContext, 0);
}

@end
