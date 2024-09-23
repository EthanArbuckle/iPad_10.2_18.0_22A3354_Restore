@implementation OspreyMescalSession

- (OspreyMescalSession)init
{
  OspreyMescalSession *v2;
  int v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OspreyMescalSession;
  v2 = -[OspreyMescalSession init](&v6, sel_init);
  if (v2)
  {
    zxcm2Qme0x(0, 0, (uint64_t)&v2->_hardwareInfo);
    if (v3)
    {
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
        -[OspreyMescalSession init].cold.2();
    }
    else
    {
      cp2g1b9ro((uint64_t)&v2->_fairplayContext, (uint64_t)&v2->_hardwareInfo);
      if (!v4)
      {
        v2->_state = 1;
        return v2;
      }
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
        -[OspreyMescalSession init].cold.1();
    }

    return 0;
  }
  return v2;
}

- (void)invalidate
{
  NSObject *v3;
  FPSAPContextOpaque_ *fairplayContext;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OspreyLoggingInit();
  v3 = OspreyLogContextDeviceAuth;
  if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[OspreyMescalSession invalidate]";
    _os_log_impl(&dword_1B97C2000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  self->_state = 0;
  fairplayContext = self->_fairplayContext;
  if (fairplayContext)
  {
    IPaI1oem5iL((uint64_t)fairplayContext);
    self->_fairplayContext = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[OspreyMescalSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)OspreyMescalSession;
  -[OspreyMescalSession dealloc](&v3, sel_dealloc);
}

- (BOOL)completeWithHandshakeResponse:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[OspreyMescalSession _exchangeData:error:](self, "_exchangeData:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_exchangeData:(id)a3 error:(id *)a4
{
  FPSAPContextOpaque_ *fairplayContext;
  FairPlayHWInfo_ *p_hardwareInfo;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  unint64_t v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  fairplayContext = self->_fairplayContext;
  if (!fairplayContext)
  {
    v14 = 0;
LABEL_8:
    v15 = 0;
    goto LABEL_15;
  }
  v20 = 0;
  v19 = 0;
  v18 = -1;
  p_hardwareInfo = &self->_hardwareInfo;
  v8 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  Mib5yocT(200, (uint64_t)p_hardwareInfo, (uint64_t)fairplayContext, v9, v10, (uint64_t)&v20, (uint64_t)&v19, (uint64_t)&v18);
  if (!v11)
  {
    if (v18 == 1)
    {
      v16 = 2;
    }
    else
    {
      if (v18)
      {
LABEL_14:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0;
        goto LABEL_15;
      }
      v16 = 3;
    }
    self->_state = v16;
    goto LABEL_14;
  }
  v12 = v11;
  OspreyLoggingInit();
  v13 = OspreyLogContextDeviceAuth;
  if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[OspreyMescalSession _exchangeData:error:]";
    v23 = 2048;
    v24 = v12;
    _os_log_error_impl(&dword_1B97C2000, v13, OS_LOG_TYPE_ERROR, "%s SAP exchange failed: %li", buf, 0x16u);
  }
  -[OspreyMescalSession invalidate](self, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyDeviceAuthenticationErrorDomain"), v12, &unk_1E70A3748);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_8;
  v14 = objc_retainAutorelease(v14);
  v15 = 0;
  *a4 = v14;
LABEL_15:

  return v15;
}

- (id)signData:(id)a3 error:(id *)a4
{
  void *fairplayContext;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  unsigned int v12;
  uint64_t v13;

  fairplayContext = self->_fairplayContext;
  if (!fairplayContext)
    goto LABEL_6;
  v13 = 0;
  v12 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  Fc3vhtJDvr((uint64_t)fairplayContext, v7, v8, (uint64_t)&v13, (uint64_t)&v12);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, v12);
    fairplayContext = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("OspreyDeviceAuthenticationErrorDomain"), v9, &unk_1E70A3770);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    fairplayContext = 0;
    *a4 = v10;
  }
  else
  {
    fairplayContext = 0;
  }
LABEL_8:

  return fairplayContext;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_2(&dword_1B97C2000, v0, v1, "%s Could not initialize hardware info: %d", v2, v3, v4, v5, 2u);
}

@end
