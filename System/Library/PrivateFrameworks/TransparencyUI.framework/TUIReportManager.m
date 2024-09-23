@implementation TUIReportManager

- (TUIReportManager)initWithStaticIdentityManager:(id)a3
{
  id v5;
  TUIReportManager *v6;
  TUIReportManager *v7;
  uint64_t v8;
  TransparencyAuditorReport *auditor;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIReportManager;
  v6 = -[TUIReportManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_staticIdentityManager, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBA840]), "initWithAuditorId:", 0);
    auditor = v7->_auditor;
    v7->_auditor = (TransparencyAuditorReport *)v8;

  }
  return v7;
}

- (void)sendReport:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSDictionary *reportData;
  NSString *additionalDetails;
  NSString *v8;
  NSString **p_additionalDetails;
  NSObject *v10;
  NSError *reportDataError;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  NSError *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  reportData = self->_reportData;
  if (reportData)
  {
    p_additionalDetails = &self->_additionalDetails;
    additionalDetails = self->_additionalDetails;
    v8 = p_additionalDetails[1];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __31__TUIReportManager_sendReport___block_invoke_3;
    v12[3] = &unk_251A5C190;
    v13 = v4;
    -[NSString makeReport:additionalData:completionBlock:](v8, "makeReport:additionalData:completionBlock:", reportData, additionalDetails, v12);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_9);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      reportDataError = self->_reportDataError;
      *(_DWORD *)buf = 138412290;
      v15 = reportDataError;
      _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_ERROR, "No report data, error = %@", buf, 0xCu);
    }
    if (v5)
      ((void (**)(_QWORD, NSError *))v5)[2](v5, self->_reportDataError);
  }

}

void __31__TUIReportManager_sendReport___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

void __31__TUIReportManager_sendReport___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_4_0);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "Failed to send report, error = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __31__TUIReportManager_sendReport___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

- (void)fetchDataWithUUID:(id)a3
{
  id v4;
  void *v5;
  TransparencyAuditorReport *auditor;
  NSError *reportDataError;
  NSObject *v8;
  NSError *v9;
  _QWORD v10[4];
  NSError *v11;
  TUIReportManager *v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    auditor = self->_auditor;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __38__TUIReportManager_fetchDataWithUUID___block_invoke_9;
    v10[3] = &unk_251A5C1F8;
    v11 = (NSError *)v4;
    v12 = self;
    -[TransparencyAuditorReport getReportForUUID:completionBlock:](auditor, "getReportForUUID:completionBlock:", v11, v10);
    reportDataError = v11;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_6);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch report data, no UUID provided", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -1, CFSTR("Failed to fetch report data, no UUID provided"));
    v9 = (NSError *)objc_claimAutoreleasedReturnValue();
    reportDataError = self->_reportDataError;
    self->_reportDataError = v9;
  }

}

void __38__TUIReportManager_fetchDataWithUUID___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

void __38__TUIReportManager_fetchDataWithUUID___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v8 = (_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = 0;

    v11 = 24;
    a3 = a2;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_9, &__block_literal_global_10);
    v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_2493EE000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch report data for UUID (%@), error = %@", (uint8_t *)&v14, 0x16u);
    }
    v8 = (_QWORD *)(a1 + 40);
    v11 = 8;
  }
  objc_storeStrong((id *)(*v8 + v11), a3);

}

void __38__TUIReportManager_fetchDataWithUUID___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_9 = (uint64_t)v0;

}

- (id)reportDetails
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  -[TUIStaticIdentityManager selfAccountKeyDisplayString](self->_staticIdentityManager, "selfAccountKeyDisplayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPORTING_ACCOUNT_KEY"), &stru_251A5E438, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentityManager selfAccountKeyDisplayString](self->_staticIdentityManager, "selfAccountKeyDisplayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n%@"), v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_251A5E438;
  }
  -[TUIStaticIdentityManager peerAccountKeyDisplayString](self->_staticIdentityManager, "peerAccountKeyDisplayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONTACT_ACCOUNT_KEY"), &stru_251A5E438, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentityManager peerAccountKeyDisplayString](self->_staticIdentityManager, "peerAccountKeyDisplayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@\n\n%@\n%@"), v9, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v16;
  }
  if (-[NSString length](self->_additionalDetails, "length"))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ADDITIONAL_DETAILS"), &stru_251A5E438, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@\n\n%@\n%@"), v9, v19, self->_additionalDetails);
    v20 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v20;
  }
  if (-[NSDictionary count](self->_reportData, "count"))
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("COMMUNICATION_LOG"), &stru_251A5E438, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@\n\n%@ (ids.apple.com)\n%@"), v9, v23, self->_reportData);
    v24 = objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)v24;
  }
  return v9;
}

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityManager, a3);
}

- (NSDictionary)reportData
{
  return self->_reportData;
}

- (NSString)additionalDetails
{
  return self->_additionalDetails;
}

- (void)setAdditionalDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TransparencyAuditorReport)auditor
{
  return self->_auditor;
}

- (void)setAuditor:(id)a3
{
  objc_storeStrong((id *)&self->_auditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditor, 0);
  objc_storeStrong((id *)&self->_additionalDetails, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_reportDataError, 0);
}

@end
