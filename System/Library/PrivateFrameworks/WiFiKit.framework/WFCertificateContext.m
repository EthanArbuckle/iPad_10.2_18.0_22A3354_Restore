@implementation WFCertificateContext

- (WFCertificateContext)initWithNetwork:(id)a3 profile:(id)a4 certificateChain:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFCertificateContext *v12;
  WFCertificateContext *v13;
  void *v14;
  __SecTrust *v15;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  os_log_type_t v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFCertificateContext;
  v12 = -[WFCertificateContext init](&v24, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_28;
  if (!v9)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v26 = "-[WFCertificateContext initWithNetwork:profile:certificateChain:]";
    v19 = "%s: nil network";
LABEL_16:
    v20 = v17;
    v21 = v18;
    v22 = 12;
LABEL_26:
    _os_log_impl(&dword_219FC8000, v20, v21, v19, buf, v22);
LABEL_27:

LABEL_28:
    v13 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v18))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v26 = "-[WFCertificateContext initWithNetwork:profile:certificateChain:]";
    v19 = "%s: nil profile";
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v12->_network, a3);
  objc_storeStrong((id *)&v13->_profile, a4);
  if (!v11)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v23))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "certificateChain is nil";
LABEL_25:
    v20 = v17;
    v21 = v23;
    v22 = 2;
    goto LABEL_26;
  }
  objc_storeStrong((id *)&v13->_certificateChain, a5);
  -[WFCertificateContext certificateChain](v13, "certificateChain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (__SecTrust *)WFCreateSecTrustFromCertificateChain(v14);

  if (!v15)
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v17 || !os_log_type_enabled(v17, v23))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v19 = "failed to create certificate trust";
    goto LABEL_25;
  }
  v13->_certificateTrust = v15;
  v13->_requestedFields = 4;
LABEL_7:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WFCertificateContext certificateTrust](self, "certificateTrust"))
  {
    CFRelease(-[WFCertificateContext certificateTrust](self, "certificateTrust"));
    -[WFCertificateContext setCertificateTrust:](self, "setCertificateTrust:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)WFCertificateContext;
  -[WFCertificateContext dealloc](&v3, sel_dealloc);
}

- (BOOL)needsDismissal
{
  return 1;
}

- (void)cancel
{
  void (**v2)(id, _QWORD);

  -[WFCertificateContext completionHandler](self, "completionHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 0);

}

- (void)accept
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFCertificateContext certificateChain](self, "certificateChain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_219FC8000, v5, v4, "User trusted provided certificate chain %@", (uint8_t *)&v8, 0xCu);

    }
  }

  -[WFCertificateContext completionHandler](self, "completionHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, 1);

}

- (void)launchSettings
{
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  WFCertificateContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      -[WFCertificateContext network](self, "network");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315650;
      v9 = "-[WFCertificateContext launchSettings]";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_219FC8000, v5, v4, "%s: opening settings for %@ (context: %@)", (uint8_t *)&v8, 0x20u);

    }
  }

  -[WFCertificateContext network](self, "network");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFScanRecordArchiveToEnterprisePath(v7);

  WFOpenSettingsURLWithType(1uLL);
  -[WFCertificateContext cancel](self, "cancel");
}

- (int64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(int64_t)a3
{
  self->_requestedFields = a3;
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
  objc_storeStrong((id *)&self->_certificateChain, a3);
}

- (__SecTrust)certificateTrust
{
  return self->_certificateTrust;
}

- (void)setCertificateTrust:(__SecTrust *)a3
{
  self->_certificateTrust = a3;
}

- (WFNetworkView)provider
{
  return (WFNetworkView *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFNetworkProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (WFNetworkScanRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_network, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end
