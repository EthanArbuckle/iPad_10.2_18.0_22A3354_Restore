@implementation SBKStoreError

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKStoreError localizedDescription](self, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> \"%@\"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBKStoreError;
  v4 = -[SBKStoreError copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SBKStoreError transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransaction:", v5);

  return v4;
}

- (BOOL)isAuthenticationError
{
  uint64_t v2;

  v2 = -[SBKStoreError code](self, "code");
  return (unint64_t)(v2 + 1004) < 4 || v2 == -4;
}

- (BOOL)isAccountsChangedError
{
  return ((-[SBKStoreError code](self, "code") + 1003) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isRecoverableError
{
  uint64_t v2;
  BOOL result;

  v2 = -[SBKStoreError code](self, "code");
  result = 1;
  if (v2 > -2007)
  {
    if ((unint64_t)(v2 + 1008) >= 4 && (unint64_t)(v2 + 2006) >= 2 && v2 != -1)
      return result;
    return 0;
  }
  if ((unint64_t)(v2 + 4003) < 3 || (unint64_t)(v2 + 3002) < 2)
    return 0;
  return result;
}

- (BOOL)isClampError
{
  return (-[SBKStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFCLL) == -2004;
}

- (BOOL)isTransactionCancelledError
{
  return (-[SBKStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -4002;
}

- (BOOL)isTransactionMissingInformationError
{
  return (-[SBKStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -3002;
}

- (NSString)previousStoreAccountName
{
  void *v2;
  void *v3;

  -[SBKStoreError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SBKStoreErrorUserInfoKeyPreviousStoreAccountName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)currentStoreAccountName
{
  void *v2;
  void *v3;

  -[SBKStoreError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SBKStoreErrorUserInfoKeyCurrentStoreAccountName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)retrySeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBKStoreError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("SBKStoreErrorUserInfoKeyRetrySeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (SBKTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = *MEMORY[0x24BDD0FC8];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v9, "dictionaryWithObject:forKey:", a4, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ErrorInfoWithUnderlyingError(v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTransaction:", v12);
  return v15;
}

+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FC8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a4;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SBKTransactionErorGeneric: An unknown server error occurred. (underlyingError = %@) \n\t*** Please file a radar against 'Purple StoreBookkeeper / 1.0'\n\t*** - enable logging in Settings->Internal: iTunes Store->Verbose and iPod->Bookmark Syncing->Verbose\n\t*** - reproduce, then run > 'ituneskvsTool -debug' and attach console and PurplePod output\n"), v5, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ErrorInfoWithUnderlyingError(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-2006);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2006, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-2004);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2004, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-2005);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2005, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)storeLoggedOutErrorWithPreviousStoreAccountName:(id)a3 transaction:(id)a4 underlyingError:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SBKStoreErrorStoreAccountLoggedOut"), &stru_24E2A84D0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v13, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(v11, "setValue:forKey:", v10, CFSTR("SBKStoreErrorUserInfoKeyPreviousStoreAccountName"));
  ErrorInfoWithUnderlyingError(v11, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1002, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTransaction:", v9);
  return v15;
}

+ (id)storeAccountMismatchErrorWithPreviousStoreAccountName:(id)a3 currentStoreAccountName:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SBKStoreErrorStoreAccountMismatch"), &stru_24E2A84D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v16, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(v14, "setValue:forKey:", v13, CFSTR("SBKStoreErrorUserInfoKeyPreviousStoreAccountName"));
  objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("SBKStoreErrorUserInfoKeyCurrentStoreAccountName"));

  ErrorInfoWithUnderlyingError(v14, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1003, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setTransaction:", v11);
  return v18;
}

+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a4;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SBKStoreErrorCodeGeneric: An unspecified server-side error was encountered (underlyingError = %@).\n\t*** Please file a radar against 'Purple StoreBookkeeper / 1.0'\n\t*** - enable logging in Settings->Internal: iTunes Store->Verbose and iPod->Bookmark Syncing->Verbose\n\t*** - reproduce, then run > 'ituneskvsTool -debug' and attach console and PurplePod output\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ErrorInfoWithUnderlyingError(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1007, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a4;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SBKStoreErrorCodeGeneric: Request Invalid: It's likely that there is something wrong with the request format (underlyingError = %@).\n\t*** Please file a radar against 'Purple StoreBookkeeper / 1.0'\n\t*** - enable logging in Settings->Internal: iTunes Store->Verbose and iPod->Bookmark Syncing->Verbose\n\t*** - reproduce, then run > 'ituneskvsTool -debug' and attach console and PurplePod output\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD0FC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ErrorInfoWithUnderlyingError(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -1007, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-1005);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1005, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-1006);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1006, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-1001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1001, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-1004);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1004, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-3002);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -3002, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  NSStringFromErrorCode(-3001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -3001, v7, v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  NSStringFromErrorCode(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](SBKStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", a4, v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4003, a4);
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4001, a4);
}

+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4002, a4);
}

+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SBKStoreErrorUserClamp"), &stru_24E2A84D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v12, *MEMORY[0x24BDD0FC8]);

  if (fabs(a4) > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("SBKStoreErrorUserInfoKeyRetrySeconds"));

  }
  ErrorInfoWithUnderlyingError(v10, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -2003, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTransaction:", v9);
  return v15;
}

+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SBKStoreErrorServerClamp"), &stru_24E2A84D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v12, *MEMORY[0x24BDD0FC8]);

  if (fabs(a4) > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("SBKStoreErrorUserInfoKeyRetrySeconds"));

  }
  ErrorInfoWithUnderlyingError(v10, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKStoreError errorWithDomain:code:userInfo:](SBKStoreError, "errorWithDomain:code:userInfo:", CFSTR("SBKStoreErrorDomain"), -2002, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTransaction:", v9);
  return v15;
}

@end
