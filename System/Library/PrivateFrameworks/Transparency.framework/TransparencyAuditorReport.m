@implementation TransparencyAuditorReport

- (TransparencyAuditorReport)initWithAuditorId:(int64_t)a3
{
  TransparencyAuditorReport *v4;
  TransparencyAuditorReport *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransparencyAuditorReport;
  v4 = -[TransparencyAuditorReport init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TransparencyAuditorReport setAuditorId:](v4, "setAuditorId:", a3);
  return v5;
}

- (NSString)auditorName
{
  if (-[TransparencyAuditorReport auditorId](self, "auditorId"))
    return (NSString *)CFSTR("Unknown");
  else
    return (NSString *)CFSTR("Apple Inc.");
}

- (void)getReportForUUID:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2_74;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_11);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_69);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous get auditor report for %@", buf, 0xCu);
    }
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_71;
    v12[3] = &unk_24DC8F928;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getReportsForUUIDs:completionBlock:", v10, v12);

  }
}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_68()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  void (*v6)(uint64_t, _QWORD);
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = a3;
    objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v6 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v7 = a3;
    v6(v3, 0);
  }

}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_2_74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_75);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getReportForUUID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __62__TransparencyAuditorReport_getReportForUUID_completionBlock___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (void)getReportsForUUIDs:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_80;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_77_0);
    v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_79);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous get auditor report for %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(v5, "getReportsForUUIDs:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_78()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_82);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getReportForUUID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__TransparencyAuditorReport_getReportsForUUIDs_completionBlock___block_invoke_2_81()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (void)makeReport:(id)a3 additionalData:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke;
  v17[3] = &unk_24DC8FE70;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_86;
  v15[3] = &unk_24DC8EA78;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v17, v15);

}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_83);
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_21A250000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_85_0);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)a1[4];
      v10 = v8;
      objc_msgSend(v9, "auditorName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous make auditor report to %@", buf, 0xCu);

    }
    v14 = a1[5];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeReports:additionalData:auditorURI:completionBlock:", v12, a1[6], 0, a1[7]);

  }
}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_84()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_88);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown makeReport error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__TransparencyAuditorReport_makeReport_additionalData_completionBlock___block_invoke_2_87()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (void)makeReports:(id)a3 additionalData:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke;
  v17[3] = &unk_24DC8FE70;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_92;
  v15[3] = &unk_24DC8EA78;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v17, v15);

}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_89_0);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_91_0);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)a1[4];
      v10 = v8;
      objc_msgSend(v9, "auditorName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous make auditor report to %@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(v5, "makeReports:additionalData:auditorURI:completionBlock:", a1[5], a1[6], 0, a1[7]);
  }

}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_90()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_10, &__block_literal_global_94);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown makeReport error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__TransparencyAuditorReport_makeReports_additionalData_completionBlock___block_invoke_2_93()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (int64_t)auditorId
{
  return self->_auditorId;
}

- (void)setAuditorId:(int64_t)a3
{
  self->_auditorId = a3;
}

@end
