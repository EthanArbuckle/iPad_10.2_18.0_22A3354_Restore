@implementation MZKeyValueStoreError

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", NSUnderlyingErrorKey));

  if (v4)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", underlying error = \"%@\"), v4));
  else
    v5 = &stru_1004C6D40;
  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError localizedDescription](self, "localizedDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> \"%@\"%@"), v8, self, v9, v5));

  return v10;
}

- (BOOL)isAuthenticationError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFCLL) == -1004;
}

- (BOOL)isAccountsChangedError
{
  return (((unint64_t)-[MZKeyValueStoreError code](self, "code") + 1003) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isRecoverableError
{
  uint64_t v2;
  BOOL result;

  v2 = (uint64_t)-[MZKeyValueStoreError code](self, "code");
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
  id v2;

  v2 = -[MZKeyValueStoreError code](self, "code");
  return (unint64_t)v2 + 2004 < 4 || v2 == (id)-1009;
}

- (BOOL)isTransactionCancelledError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -4002;
}

- (BOOL)isTransactionMissingInformationError
{
  return ((unint64_t)-[MZKeyValueStoreError code](self, "code") & 0xFFFFFFFFFFFFFFFELL) == -3002;
}

- (id)previousStoreAccountKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("MZKeyValueStorePreviousStoreAccountKey")));

  return v3;
}

- (id)currentStoreAccountKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("MZKeyValueStoreCurrentStoreAccountKey")));

  return v3;
}

- (double)retrySeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("MZKeyValueStoreRetrySecondsKey")));

  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MZKeyValueStoreError;
  v4 = -[MZKeyValueStoreError copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreError transactionDescription](self, "transactionDescription"));
  objc_msgSend(v4, "setTransactionDescription:", v5);

  return v4;
}

+ (id)keyValueStoreErrorWithCode:(int64_t)a3 localizedDescription:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a6;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a4, NSLocalizedDescriptionKey));
  v12 = sub_100092F34(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), a3, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));

  objc_msgSend(v14, "setTransactionDescription:", v15);
  return v14;
}

+ (id)unknownErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MZKeyValueStoreErrorGeneric: An unknown server error occurred.  Please %@"), CFSTR("submit a bug to PEP Podcasts with console logs attached")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, NSLocalizedDescriptionKey, 0));

  v7 = sub_100092F34(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1, v8));
  return v9;
}

+ (id)keyValueStoreDisabledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-2006);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2006, v8, v6, v5));

  return v9;
}

+ (id)networkingBlockedErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-2004);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2004, v8, v6, v5));

  return v9;
}

+ (id)killSwitchErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-2005);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -2005, v8, v6, v5));

  return v9;
}

+ (id)storeLoggedOutErrorWithPreviousStoreAccountText:(id)a3 transaction:(id)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v10, "setValue:forKey:", CFSTR("MZKeyValueStoreErrorStoreAccountLoggedOut"), NSLocalizedDescriptionKey);
  objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("MZKeyValueStorePreviousStoreAccountKey"));

  v11 = sub_100092F34(v10, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1002, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));

  objc_msgSend(v13, "setTransactionDescription:", v14);
  return v13;
}

+ (id)storeAccountMismatchErrorWithPreviousStoreAccountText:(id)a3 currentStoreAccontText:(id)a4 transaction:(id)a5 underlyingError:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v13, "setValue:forKey:", CFSTR("MZKeyValueStoreErrorStoreAccountMismatch"), NSLocalizedDescriptionKey);
  objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("MZKeyValueStorePreviousStoreAccountKey"));

  objc_msgSend(v13, "setValue:forKey:", v11, CFSTR("MZKeyValueStoreCurrentStoreAccountKey"));
  v14 = sub_100092F34(v13, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1003, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));

  objc_msgSend(v16, "setTransactionDescription:", v17);
  return v16;
}

+ (id)storeGenericErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("MZKeyValueStoreErrorGeneric: This usually means your format is wrong. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging."), NSLocalizedDescriptionKey));
  v6 = sub_100092F34(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1007, v7));
  return v8;
}

+ (id)storeValidationErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("MZKeyValueStoreErrorValidation: Your request is invalid, maybe referenced a non-existent Domain. Turn on MZ_KVSTORE_SERIALIZER_LOG and MZ_KVSTORE_LOG for debugging"), NSLocalizedDescriptionKey));
  v6 = sub_100092F34(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1007, v7));
  return v8;
}

+ (id)userCancelledSignInErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-1005);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1005, v8, v6, v5));

  return v9;
}

+ (id)userEnteredWrongCredentialsErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-1006);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1006, v8, v6, v5));

  return v9;
}

+ (id)noStoreAccountErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-1001);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1001, v8, v6, v5));

  return v9;
}

+ (id)storeAccountSessionExpiredWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-1004);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -1004, v8, v6, v5));

  return v9;
}

+ (id)transactionMissingDomainErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-3002);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -3002, v8, v6, v5));

  return v9;
}

+ (id)transactionMissingURLErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = sub_10009312C(-3001);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", -3001, v8, v6, v5));

  return v9;
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a3;
  v9 = sub_10009312C(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:", a4, v10, v8, v7));

  return v11;
}

+ (id)transactionTimeoutErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4003, a4);
}

+ (id)transactionCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4001, a4);
}

+ (id)delegateCancelledErrorWithTransaction:(id)a3 underlyingError:(id)a4
{
  return objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:", a3, -4002, a4);
}

+ (id)userClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v9, "setValue:forKey:", CFSTR("MZKeyValueStoreErrorUserClamp"), NSLocalizedDescriptionKey);
  if (fabs(a4) > 2.22044605e-16)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("MZKeyValueStoreRetrySecondsKey"));

  }
  v11 = sub_100092F34(v9, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -2003, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  objc_msgSend(v13, "setTransactionDescription:", v14);

  return v13;
}

+ (id)clientClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v9, "setValue:forKey:", CFSTR("MZKeyValueStoreErrorClientClamp"), NSLocalizedDescriptionKey);
  if (fabs(a4) > 2.22044605e-16)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("MZKeyValueStoreRetrySecondsKey"));

  }
  v11 = sub_100092F34(v9, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -1009, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  objc_msgSend(v13, "setTransactionDescription:", v14);

  return v13;
}

+ (id)serverClampErrorWithTransaction:(id)a3 retrySeconds:(double)a4 underlyingError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v9, "setValue:forKey:", CFSTR("MZKeyValueStoreErrorServerClamp"), NSLocalizedDescriptionKey);
  if (fabs(a4) > 2.22044605e-16)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("MZKeyValueStoreRetrySecondsKey"));

  }
  v11 = sub_100092F34(v9, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError errorWithDomain:code:userInfo:](MZKeyValueStoreError, "errorWithDomain:code:userInfo:", CFSTR("MZKeyValueStoreErrorDomain"), -2002, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
  objc_msgSend(v13, "setTransactionDescription:", v14);

  return v13;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDescription, 0);
}

@end
