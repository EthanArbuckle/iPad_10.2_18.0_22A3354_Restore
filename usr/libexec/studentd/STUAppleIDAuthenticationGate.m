@implementation STUAppleIDAuthenticationGate

- (void)dealloc
{
  objc_super v3;

  -[CRKIDSAccountsEvaluator removeObserver:forKeyPath:context:](self->_evaluator, "removeObserver:forKeyPath:context:", self, CFSTR("state"), CFSTR("STUAppleIDAuthenticatorKVOContext"));
  v3.receiver = self;
  v3.super_class = (Class)STUAppleIDAuthenticationGate;
  -[STUAppleIDAuthenticationGate dealloc](&v3, "dealloc");
}

- (STUAppleIDAuthenticationGate)initWithClock:(id)a3 accountsPrimitives:(id)a4 IDSLocalPrimitives:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUAppleIDAuthenticationGate *v12;
  STUAppleIDAuthenticationGate *v13;
  CRKIDSAccountsEvaluator *v14;
  CRKIDSAccountsEvaluator *evaluator;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STUAppleIDAuthenticationGate;
  v12 = -[STUAppleIDAuthenticationGate init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clock, a3);
    objc_storeStrong((id *)&v13->_accountsPrimitives, a4);
    v14 = (CRKIDSAccountsEvaluator *)objc_msgSend(objc_alloc((Class)CRKIDSAccountsEvaluator), "initWithIDSLocalPrimitives:", v11);
    evaluator = v13->_evaluator;
    v13->_evaluator = v14;

    -[CRKIDSAccountsEvaluator addObserver:forKeyPath:options:context:](v13->_evaluator, "addObserver:forKeyPath:options:context:", v13, CFSTR("state"), 4, CFSTR("STUAppleIDAuthenticatorKVOContext"));
  }

  return v13;
}

- (BOOL)isOpenWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL result;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  void *v34;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate evaluator](self, "evaluator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "state"));
  v7 = objc_msgSend(v6, "summary");

  if (v7 == (id)2)
  {
    v8 = sub_10005BC0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v31 = 138543362;
      v32 = objc_opt_class(self);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: Active accounts exist; no need to prompt the user to renew their credentials.",
        (uint8_t *)&v31,
        0xCu);
    }

    return 0;
  }
  if (-[STUAppleIDAuthenticationGate accountNeedsMoreTimeToSettle](self, "accountNeedsMoreTimeToSettle"))
  {
    if (a3)
    {
      v11 = 44;
LABEL_12:
      v12 = CRKErrorWithCodeAndUserInfo(v11, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue(v12);
      result = 0;
      *a3 = v13;
      return result;
    }
    return 0;
  }
  if (-[STUAppleIDAuthenticationGate isRateLimited](self, "isRateLimited"))
  {
    if (a3)
    {
      v11 = 43;
      goto LABEL_12;
    }
    return 0;
  }
  v14 = sub_10005BC0C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_opt_class(self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate accountsPrimitives](self, "accountsPrimitives"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "primaryAppleID"));
    v31 = 138543618;
    v32 = v16;
    v33 = 2114;
    v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Allowing prompt to renew Apple Account credentials for account %{public}@ because an active IDS account was not detected.", (uint8_t *)&v31, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate lastPromptFinishDate](self, "lastPromptFinishDate"));

  if (v19)
  {
    v20 = sub_10005BC0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_opt_class(self);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate lastPromptFinishDate](self, "lastPromptFinishDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate timestampForDate:](self, "timestampForDate:", v23));
      v31 = 138543618;
      v32 = v22;
      v33 = 2114;
      v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@: Last prompt finished %{public}@", (uint8_t *)&v31, 0x16u);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));

  if (v25)
  {
    v26 = sub_10005BC0C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_opt_class(self);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate timestampForDate:](self, "timestampForDate:", v29));
      v31 = 138543618;
      v32 = v28;
      v33 = 2114;
      v34 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@: Accounts exist but none of them are active. This began %{public}@", (uint8_t *)&v31, 0x16u);

    }
  }
  return 1;
}

- (void)didFinishRenewingCredentials
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate clock](self, "clock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDate"));
  -[STUAppleIDAuthenticationGate setLastPromptFinishDate:](self, "setLastPromptFinishDate:", v3);

}

- (NSDictionary)debugInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v12[0] = CFSTR("lastPromptFinishDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate lastPromptFinishDate](self, "lastPromptFinishDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate timestampForDate:](self, "timestampForDate:", v3));
  v13[0] = v4;
  v12[1] = CFSTR("noAccountsActiveStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate timestampForDate:](self, "timestampForDate:", v5));
  v13[1] = v6;
  v13[2] = &off_1000D42C8;
  v12[2] = CFSTR("minimumSecondsBetweenPrompts");
  v12[3] = CFSTR("maximumSecondsForAccountToSettle");
  v13[3] = &off_1000D42D8;
  v12[4] = CFSTR("accountsState");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate evaluator](self, "evaluator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugInfo"));
  v13[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 5));

  return (NSDictionary *)v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("STUAppleIDAuthenticatorKVOContext"))
  {
    -[STUAppleIDAuthenticationGate handleStateChange](self, "handleStateChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)STUAppleIDAuthenticationGate;
    -[STUAppleIDAuthenticationGate observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)handleStateChange
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate evaluator](self, "evaluator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "state"));

  v5 = sub_10005BC0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = objc_opt_class(self);
    v9 = 2114;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: IDS account state changed: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  if (objc_msgSend(v4, "summary") == (id)1)
    -[STUAppleIDAuthenticationGate recordNoAccountsActiveStartDate](self, "recordNoAccountsActiveStartDate");
  else
    -[STUAppleIDAuthenticationGate clearNoAccountsActiveStartDate](self, "clearNoAccountsActiveStartDate");

}

- (void)recordNoAccountsActiveStartDate
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));

  if (!v3)
  {
    v4 = sub_10005BC0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Recording 'no accounts active' start date", v8, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate clock](self, "clock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentDate"));
    -[STUAppleIDAuthenticationGate setNoAccountsActiveStartDate:](self, "setNoAccountsActiveStartDate:", v7);

  }
}

- (void)clearNoAccountsActiveStartDate
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));

  if (v3)
  {
    v4 = sub_10005BC0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Clearing 'no accounts active' start date", v6, 2u);
    }

    -[STUAppleIDAuthenticationGate setNoAccountsActiveStartDate:](self, "setNoAccountsActiveStartDate:", 0);
  }
}

- (BOOL)isRateLimited
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate lastPromptFinishDate](self, "lastPromptFinishDate"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate lastPromptFinishDate](self, "lastPromptFinishDate"));
  -[STUAppleIDAuthenticationGate timeSince:](self, "timeSince:", v4);
  v6 = v5 < 240.0;

  return v6;
}

- (BOOL)accountNeedsMoreTimeToSettle
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate noAccountsActiveStartDate](self, "noAccountsActiveStartDate"));
  -[STUAppleIDAuthenticationGate timeSince:](self, "timeSince:", v4);
  v6 = v5 < 120.0;

  return v6;
}

- (id)timestampForDate:(id)a3
{
  uint64_t v3;
  void *v4;

  if (a3)
  {
    -[STUAppleIDAuthenticationGate timeSince:](self, "timeSince:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f seconds ago"), v3));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  return v4;
}

- (double)timeSince:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUAppleIDAuthenticationGate clock](self, "clock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDate"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v4);
  v8 = v7;

  return v8;
}

- (STUDateProviderProtocol)clock
{
  return self->_clock;
}

- (STUAccountsPrimitives)accountsPrimitives
{
  return self->_accountsPrimitives;
}

- (CRKIDSAccountsEvaluator)evaluator
{
  return self->_evaluator;
}

- (NSDate)lastPromptFinishDate
{
  return self->_lastPromptFinishDate;
}

- (void)setLastPromptFinishDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPromptFinishDate, a3);
}

- (NSDate)noAccountsActiveStartDate
{
  return self->_noAccountsActiveStartDate;
}

- (void)setNoAccountsActiveStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_noAccountsActiveStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noAccountsActiveStartDate, 0);
  objc_storeStrong((id *)&self->_lastPromptFinishDate, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_accountsPrimitives, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
