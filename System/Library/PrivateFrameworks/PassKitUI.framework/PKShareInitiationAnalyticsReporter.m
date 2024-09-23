@implementation PKShareInitiationAnalyticsReporter

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3
{
  return -[PKShareInitiationAnalyticsReporter initWithPass:sessionToken:](self, "initWithPass:sessionToken:", a3, 0);
}

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 sessionToken:(id)a4
{
  return (PKShareInitiationAnalyticsReporter *)-[PKShareInitiationAnalyticsReporter _initWithPass:sessionToken:reuseExistingSession:](self, "_initWithPass:sessionToken:reuseExistingSession:", a3, a4, 0);
}

- (PKShareInitiationAnalyticsReporter)initWithPass:(id)a3 reuseExistingSession:(BOOL)a4
{
  return (PKShareInitiationAnalyticsReporter *)-[PKShareInitiationAnalyticsReporter _initWithPass:sessionToken:reuseExistingSession:](self, "_initWithPass:sessionToken:reuseExistingSession:", a3, 0, a4);
}

- (id)_initWithPass:(id)a3 sessionToken:(id)a4 reuseExistingSession:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  PKShareInitiationAnalyticsReporter *v11;
  PKShareInitiationAnalyticsReporter *v12;
  PKShareInitiationAnalyticsReporter *v13;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  if (v9)
  {
    v10 = *MEMORY[0x1E0D69930];
    v15.receiver = self;
    v15.super_class = (Class)PKShareInitiationAnalyticsReporter;
    v11 = -[PKSharingAnalyticsReporter initWithSubject:sessionToken:reuseExistingSession:](&v15, sel_initWithSubject_sessionToken_reuseExistingSession_, v10, a4, v5);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_pass, a3);
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  PKPass *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  unint64_t v14;
  objc_super v15;

  v4 = a3;
  -[PKPass secureElementPass](self->_pass, "secureElementPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardType");
  PKPaymentCardTypeToString();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString lowercaseString](v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D69040]);

  v8 = self->_pass;
  if (-[PKPass passType](v8, "passType") == PKPassTypeSecureElement)
  {
    -[PKPass secureElementPass](v8, "secureElementPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cardType");
    if (v10 <= 4)
      v6 = (__CFString *)**((id **)&unk_1E3E62C58 + v10);

  }
  else
  {
    v6 = CFSTR("other");
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D69028]);
  -[PKPass secureElementPass](self->_pass, "secureElementPass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isIdentityPass"))
  {
    if (objc_msgSend(v11, "isAccessPass"))
    {
      v14 = objc_msgSend(v11, "accessType");
      if (v14 < 7)
      {
        v13 = off_1E3E62DA0[v14];
        goto LABEL_13;
      }
    }
LABEL_12:
    v13 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    goto LABEL_13;
  }
  v12 = objc_msgSend(v11, "identityType");
  if ((unint64_t)(v12 - 1) >= 3)
    goto LABEL_12;
  v13 = off_1E3E62C80[v12 - 1];
LABEL_13:

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D69020]);
  v15.receiver = self;
  v15.super_class = (Class)PKShareInitiationAnalyticsReporter;
  -[PKSharingAnalyticsReporter sendEvent:](&v15, sel_sendEvent_, v4);

}

- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4
{
  -[PKShareInitiationAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", a3, 0, *MEMORY[0x1E0D68C50], a4);
}

- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5
{
  -[PKShareInitiationAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", a3, a4, *MEMORY[0x1E0D68B18], a5);
}

- (void)sendAuthenticationEventForSuccess:(BOOL)a3 specifics:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  id v10;

  v4 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v8;

  if (v4)
    v9 = CFSTR("success");
  else
    v9 = CFSTR("failure");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D694F0]);
  -[PKShareInitiationAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", 3, 0, *MEMORY[0x1E0D68B88], v10);

}

- (void)sendDoneEventWithDidShare:(BOOL)a3 error:(id)a4 specifics:(id)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = (void *)objc_msgSend(a5, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;

  v12 = *MEMORY[0x1E0D69550];
  if (v6)
  {
    v13 = (_QWORD *)MEMORY[0x1E0D69558];
LABEL_9:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *v13, v12);
    goto LABEL_10;
  }
  if (!v15)
  {
    v13 = (_QWORD *)MEMORY[0x1E0D69540];
    goto LABEL_9;
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D69548], v12);
  ErrorTypeFromError(v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D68A90]);

LABEL_10:
  -[PKShareInitiationAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", 4, 0, *MEMORY[0x1E0D68C50], v11);

}

- (void)_sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 eventType:(id)a5 specifics:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;

  v10 = a5;
  v11 = (void *)objc_msgSend(a6, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v13;

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D68AA0]);
  v14 = *MEMORY[0x1E0D68F50];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D68F50]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = 1;
  else
    v16 = a3 > 4;
  if (!v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", off_1E3E62D78[a3], v14);
  v17 = *MEMORY[0x1E0D68858];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D68858]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (a4 == 1)
    {
      v19 = (_QWORD *)MEMORY[0x1E0D688E8];
      goto LABEL_14;
    }
    if (a4 == 2)
    {
      v19 = (_QWORD *)MEMORY[0x1E0D68958];
LABEL_14:
      objc_msgSend(v20, "setObject:forKeyedSubscript:", *v19, v17);
    }
  }
  -[PKShareInitiationAnalyticsReporter sendEvent:](self, "sendEvent:", v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
