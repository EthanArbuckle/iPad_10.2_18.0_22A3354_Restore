@implementation PKShareRedemptionAnalyticsReporter

- (PKShareRedemptionAnalyticsReporter)init
{
  return -[PKShareRedemptionAnalyticsReporter initWithSessionToken:](self, "initWithSessionToken:", 0);
}

- (PKShareRedemptionAnalyticsReporter)initWithSessionToken:(id)a3
{
  uint64_t v4;
  objc_super v6;

  v4 = *MEMORY[0x1E0D69928];
  v6.receiver = self;
  v6.super_class = (Class)PKShareRedemptionAnalyticsReporter;
  return -[PKSharingAnalyticsReporter initWithSubject:sessionToken:reuseExistingSession:](&v6, sel_initWithSubject_sessionToken_reuseExistingSession_, v4, a3, 0);
}

- (void)sendEvent:(id)a3
{
  id v4;
  unint64_t accessPassType;
  __CFString *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("access"), *MEMORY[0x1E0D69040]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("access"), *MEMORY[0x1E0D69028]);
  accessPassType = self->_accessPassType;
  if (accessPassType >= 7)
    v6 = (__CFString *)(id)*MEMORY[0x1E0D69618];
  else
    v6 = off_1E3E62DA0[accessPassType];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D69020]);

  v7.receiver = self;
  v7.super_class = (Class)PKShareRedemptionAnalyticsReporter;
  -[PKSharingAnalyticsReporter sendEvent:](&v7, sel_sendEvent_, v4);

}

- (void)sendEventForPage:(unint64_t)a3 specifics:(id)a4
{
  -[PKShareRedemptionAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", a3, 0, *MEMORY[0x1E0D68C50], a4);
}

- (void)sendEventForPage:(unint64_t)a3 error:(id)a4 specifics:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = (void *)objc_msgSend(a5, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v11;

  ErrorTypeFromError(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D68A90]);
  -[PKShareRedemptionAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", a3, 0, *MEMORY[0x1E0D68C50], v13);

}

- (void)sendEventForPage:(unint64_t)a3 button:(unint64_t)a4 specifics:(id)a5
{
  -[PKShareRedemptionAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", a3, a4, *MEMORY[0x1E0D68B18], a5);
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
  -[PKShareRedemptionAnalyticsReporter _sendEventForPage:button:eventType:specifics:](self, "_sendEventForPage:button:eventType:specifics:", 1, 0, *MEMORY[0x1E0D68B88], v10);

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
    v16 = a3 > 2;
  if (!v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", off_1E3E62DD8[a3], v14);
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
  -[PKShareRedemptionAnalyticsReporter sendEvent:](self, "sendEvent:", v20);

}

- (int64_t)accessPassType
{
  return self->_accessPassType;
}

- (void)setAccessPassType:(int64_t)a3
{
  self->_accessPassType = a3;
}

@end
