@implementation SUAutoInstallOperation

- (SUAutoInstallOperation)init
{
  SUAutoInstallOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallOperation;
  result = -[SUAutoInstallOperation init](&v3, sel_init);
  if (result)
  {
    result->_agreementStatus = 0;
    *(_WORD *)&result->_canceled = 0;
  }
  return result;
}

- (id)_initWithClient:(id)a3 clientOwned:(BOOL)a4 id:(id)a5 forecast:(id)a6 agreementStatus:(int)a7 cancelled:(BOOL)a8 expired:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  SUAutoInstallOperation *v19;
  SUAutoInstallOperation *v20;
  void *v22;
  void *v23;
  objc_super v25;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUAutoInstallOperation.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v17)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUAutoInstallOperation.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

    goto LABEL_3;
  }
  if (!v17)
    goto LABEL_9;
LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SUAutoInstallOperation;
  v19 = -[SUAutoInstallOperation init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_clientOwned = a4;
    objc_storeStrong((id *)&v19->_client, a3);
    objc_storeStrong((id *)&v20->_id, a5);
    objc_storeStrong((id *)&v20->_forecast, a6);
    v20->_agreementStatus = a7;
    v20->_canceled = a8;
    v20->_expired = a9;
    if (!a8 && !a9)
      objc_msgSend(v16, "_registerAutoInstallOperationClientHandler:", v20);
  }

  return v20;
}

- (SUAutoInstallOperation)initWithAutoInstallOperationModel:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SUAutoInstallOperation *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "id");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forecast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "agreementStatus");

  LOBYTE(v13) = 0;
  v11 = -[SUAutoInstallOperation _initWithClient:clientOwned:id:forecast:agreementStatus:cancelled:expired:](self, "_initWithClient:clientOwned:id:forecast:agreementStatus:cancelled:expired:", v6, 0, v8, v9, v10, 0, v13);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_clientOwned)
    -[SUManagerClient invalidate](self->_client, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallOperation;
  -[SUAutoInstallOperation dealloc](&v3, sel_dealloc);
}

- (void)setAgreementStatus:(int)a3
{
  SUManagerClient *client;
  id WeakRetained;
  _QWORD v6[5];

  self->_agreementStatus = a3;
  if (a3 == 1)
  {
    client = self->_client;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__SUAutoInstallOperation_setAgreementStatus___block_invoke;
    v6[3] = &unk_24CE3BD08;
    v6[4] = self;
    -[SUManagerClient _consentAutoInstallOperation:withResult:](client, "_consentAutoInstallOperation:withResult:", self, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoInstallOperationDidConsent:", self);

  }
}

void __45__SUAutoInstallOperation_setAgreementStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(CFSTR("consent auto install operation (%@) result: %@, error: %@"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)cancel
{
  SUManagerClient *client;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  _QWORD v9[5];

  self->_canceled = 1;
  -[SUManagerClient _unregisterAutoInstallOperationClientHandler:](self->_client, "_unregisterAutoInstallOperationClientHandler:", self);
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__SUAutoInstallOperation_cancel__block_invoke;
  v9[3] = &unk_24CE3BD08;
  v9[4] = self;
  -[SUManagerClient _cancelAutoInstallOperation:withResult:](client, "_cancelAutoInstallOperation:withResult:", self, v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "autoInstallOperationWasCancelled:", self);

    }
  }
}

void __32__SUAutoInstallOperation_cancel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(CFSTR("cancel auto install operation (%@) result: %@, error: %@"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[<SUAutoInstallOperation:%p> "), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[SUAutoInstallOperation id](self, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("ID=%@, "), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  v9 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUAutoInstallOperation agreementStatus](self, "agreementStatus") == 1)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("AcceptedAgreementStatus=%@, "), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  v12 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUAutoInstallOperation isExpired](self, "isExpired"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("isExpired=%@, "), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v14);

  v15 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUAutoInstallOperation _isEffectivelyScheduled](self, "_isEffectivelyScheduled"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("isScheduled=%@, "), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v17);

  v18 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUAutoInstallOperation isCanceled](self, "isCanceled"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("isCancelled=%@, "), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v20);

  v21 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUAutoInstallOperation _isValidForScheduling](self, "_isValidForScheduling"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v21, "stringWithFormat:", CFSTR("isValidForScheduling=%@, "), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v23);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ForecastDetails=%@"), self->_forecast);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v24);

  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return (NSString *)v3;
}

- (BOOL)isExpired
{
  return self->_expired;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUAutoInstallOperation)initWithCoder:(id)a3
{
  id v4;
  SUManagerClient *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SUAutoInstallOperation *v11;
  uint64_t v13;

  v4 = a3;
  v5 = objc_alloc_init(SUManagerClient);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__expired"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__cancelled"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__agreementStatus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__forecast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v13) = v7;
  v11 = -[SUAutoInstallOperation _initWithClient:clientOwned:id:forecast:agreementStatus:cancelled:expired:](self, "_initWithClient:clientOwned:id:forecast:agreementStatus:cancelled:expired:", v5, 1, v6, v10, v9, v8, v13);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUAutoInstallOperation id](self, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("__id"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SUAutoInstallOperation isExpired](self, "isExpired"), CFSTR("__expired"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUAutoInstallOperation isCanceled](self, "isCanceled"), CFSTR("__cancelled"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUAutoInstallOperation agreementStatus](self, "agreementStatus"), CFSTR("__agreementStatus"));
  -[SUAutoInstallOperation forecast](self, "forecast");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("__forecast"));

}

- (id)uniqueIdentifier
{
  return -[NSUUID UUIDString](self->_id, "UUIDString");
}

- (void)_noteAutoInstallOperationWasCancelled
{
  id WeakRetained;

  if (!self->_canceled)
  {
    self->_canceled = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoInstallOperationWasCancelled:", self);

  }
  -[SUManagerClient _unregisterAutoInstallOperationClientHandler:](self->_client, "_unregisterAutoInstallOperationClientHandler:", self);
}

- (void)_noteAutoInstallOperationDidExpireWithError:(id)a3
{
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  id v8;
  char v9;
  id v10;

  v10 = a3;
  if (!self->_expired)
  {
    self->_expired = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_opt_respondsToSelector();

      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "autoInstallOperationDidExpire:withError:", self, v10);
LABEL_7:

        goto LABEL_8;
      }
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "autoInstallOperationDidExpire:", self);
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  -[SUManagerClient _unregisterAutoInstallOperationClientHandler:](self->_client, "_unregisterAutoInstallOperationClientHandler:", self);

}

- (void)_noteAutoInstallOperationDidConsent
{
  id WeakRetained;

  if (self->_agreementStatus != 1)
  {
    self->_agreementStatus = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoInstallOperationDidConsent:", self);

  }
}

- (void)_noteAutoInstallOperationIsReadyToInstall:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  char v17;
  void (**v18)(id, _QWORD, void *);

  v18 = (void (**)(id, _QWORD, void *))a3;
  if (*(_WORD *)&self->_canceled)
  {
    SULogInfo(CFSTR("auto install operation (%@) not ready: canceled: %@, expired: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)self->_id);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 49;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v15 = WeakRetained;
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "autoInstallOperationIsReadyToInstall:withResponse:", self, v18);
        goto LABEL_4;
      }
    }
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 48;
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, 0, v13);
LABEL_4:

}

- (void)_noteAutoInstallOperationPasscodePolicyChanged:(unint64_t)a3
{
  SUAutoInstallOperationDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "autoInstallOperationPasscodePolicyDidChange:passcodePolicyType:", self, a3);

    }
  }
}

- (BOOL)_isEffectivelyScheduled
{
  SUAutoInstallOperation *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[SUAutoInstallOperation forecast](self, "forecast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SUAutoInstallOperation _isValidTillDate:](v2, "_isValidTillDate:", v4);

  return (char)v2;
}

- (BOOL)_isValidForScheduling
{
  SUAutoInstallOperation *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[SUAutoInstallOperation forecast](self, "forecast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SUAutoInstallOperation _isValidTillDate:](v2, "_isValidTillDate:", v4);

  return (char)v2;
}

- (BOOL)_isValidTillDate:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[SUAutoInstallOperation isExpired](self, "isExpired")
    || -[SUAutoInstallOperation isCanceled](self, "isCanceled"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = !-[SUAutoInstallOperation _isDateExpired:](self, "_isDateExpired:", v4);
  }

  return v5;
}

- (BOOL)_isDateExpired:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (NSUUID)id
{
  return self->_id;
}

- (SUAutoInstallOperationDelegate)delegate
{
  return (SUAutoInstallOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUAutoInstallForecast)forecast
{
  return self->_forecast;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (int)agreementStatus
{
  return self->_agreementStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecast, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
