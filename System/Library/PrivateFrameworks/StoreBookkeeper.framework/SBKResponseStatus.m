@implementation SBKResponseStatus

- (SBKResponseStatus)initWithStatus:(int64_t)a3 isRecoverable:(BOOL)a4 isError:(BOOL)a5 consoleDescription:(id)a6 shouldFileRadar:(BOOL)a7
{
  id v13;
  SBKResponseStatus *v14;
  SBKResponseStatus *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBKResponseStatus;
  v14 = -[SBKResponseStatus init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_statusCode = a3;
    v14->_isRecoverable = a4;
    v14->_isError = a5;
    objc_storeStrong((id *)&v14->_consoleDescription, a6);
    v15->_shouldFileRadar = a7;
  }

  return v15;
}

- (BOOL)isSuccess
{
  return self->_statusCode == 0;
}

- (NSError)requestError
{
  void *v3;
  void *v4;
  NSString *consoleDescription;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  if (-[SBKResponseStatus isSuccess](self, "isSuccess"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    consoleDescription = self->_consoleDescription;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_statusCode);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (self->_shouldFileRadar)
      v8 = CFSTR(" Please enable logging and file a bug.");
    else
      v8 = &stru_24E2A84D0;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (status = %@)%@"), consoleDescription, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x24BDD0FC8], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SBKBookkeeperRequestErrorDomain"), self->_statusCode, v10);

  }
  return (NSError *)v3;
}

- (BOOL)isUnsupportedClient
{
  return self->_statusCode == 1101;
}

- (BOOL)isAuthenticationError
{
  return self->_statusCode == -4;
}

- (BOOL)isValidationError
{
  return self->_statusCode == -2;
}

- (BOOL)isGenericError
{
  int64_t statusCode;

  statusCode = self->_statusCode;
  return statusCode == -3 || statusCode == 1199;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)consoleDescription
{
  return self->_consoleDescription;
}

- (BOOL)isRecoverable
{
  return self->_isRecoverable;
}

- (BOOL)isError
{
  return self->_isError;
}

- (BOOL)shouldFileRadar
{
  return self->_shouldFileRadar;
}

- (BOOL)isPuntedError
{
  return self->_isPuntedError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleDescription, 0);
}

+ (id)responseStatusForStatusCodeNumber:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (responseStatusForStatusCodeNumber__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = objc_msgSend(v4, "integerValue");
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&responseStatusForStatusCodeNumber__onceToken, &__block_literal_global_2093);
    if (v4)
      goto LABEL_3;
  }
  v5 = -1;
LABEL_6:
  v6 = (void *)responseStatusForStatusCodeNumber____statusInfo;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)responseStatusForStatusCodeNumber____statusInfo, "objectForKey:", &unk_24E2AFF48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __55__SBKResponseStatus_responseStatusForStatusCodeNumber___block_invoke()
{
  SBKResponseStatus *v0;
  SBKResponseStatus *v1;
  SBKResponseStatus *v2;
  SBKResponseStatus *v3;
  SBKResponseStatus *v4;
  SBKResponseStatus *v5;
  SBKResponseStatus *v6;
  SBKResponseStatus *v7;
  SBKResponseStatus *v8;
  SBKResponseStatus *v9;
  uint64_t v10;
  void *v11;
  SBKResponseStatus *v12;
  SBKResponseStatus *v13;
  _QWORD v14[12];
  _QWORD v15[14];

  v15[12] = *MEMORY[0x24BDAC8D0];
  v14[0] = &unk_24E2AFF60;
  v13 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 0, 1, 0, CFSTR("Success"), 0);
  v15[0] = v13;
  v14[1] = &unk_24E2AFF78;
  v12 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", -1, 0, 1, CFSTR("Unknown server initialization error"), 1);
  v15[1] = v12;
  v14[2] = &unk_24E2AFF90;
  v0 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", -2, 0, 1, CFSTR("The request format was invalid, or referenced an invalid domain"), 1);
  v15[2] = v0;
  v14[3] = &unk_24E2AFFA8;
  v1 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", -3, 0, 1, CFSTR("An unspecified server-side error (type 1) was encountered"), 1);
  v15[3] = v1;
  v14[4] = &unk_24E2AFFC0;
  v2 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", -4, 0, 1, CFSTR("The request requires an authenticated weak-token"), 0);
  v15[4] = v2;
  v14[5] = &unk_24E2AFFD8;
  v3 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1197, 0, 1, CFSTR("The request deniend (punted - server too busy)"), 0);
  v15[5] = v3;
  v14[6] = &unk_24E2AFFF0;
  v4 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1195, 0, 1, CFSTR("The request denied (too many recent request)"), 0);
  v15[6] = v4;
  v14[7] = &unk_24E2AFF48;
  v5 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", -9999, 0, 1, CFSTR("Unknown status"), 1);
  v15[7] = v5;
  v14[8] = &unk_24E2B0008;
  v6 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1199, 0, 1, CFSTR("An unspecified server-side error (type 2) was encountered"), 1);
  v15[8] = v6;
  v14[9] = &unk_24E2B0020;
  v7 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1101, 0, 1, CFSTR("The client's user agent is not supported"), 1);
  v15[9] = v7;
  v14[10] = &unk_24E2B0038;
  v8 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1198, 0, 1, CFSTR("The putAll had a version mismatch"), 0);
  v15[10] = v8;
  v14[11] = &unk_24E2B0050;
  v9 = -[SBKResponseStatus initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:]([SBKResponseStatus alloc], "initWithStatus:isRecoverable:isError:consoleDescription:shouldFileRadar:", 1196, 0, 1, CFSTR("The domain specified in the request is locked"), 1);
  v15[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)responseStatusForStatusCodeNumber____statusInfo;
  responseStatusForStatusCodeNumber____statusInfo = v10;

}

@end
