@implementation NSError

- (NSDictionary)mf_mailHandoffActivityContextInfo
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ceActivityType")));

  if (v3)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ceActivityInfo")));
  v5 = v4;

  return (NSDictionary *)v5;
}

- (unint64_t)mf_activitySource
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError mf_mailHandoffActivityContextInfo](self, "mf_mailHandoffActivityContextInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ceActivityIsHandoff")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (unint64_t)mf_activityErrorReason
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError mf_mailHandoffActivityContextInfo](self, "mf_mailHandoffActivityContextInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ceActivityErrorReason")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (NSString)mf_mailHandoffActivityType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError mf_mailHandoffActivityContextInfo](self, "mf_mailHandoffActivityContextInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ceActivityType")));

  return (NSString *)v3;
}

- (BOOL)mf_isSpotlightHandoffError
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError mf_mailHandoffActivityType](self, "mf_mailHandoffActivityType"));
  v3 = objc_msgSend(CSSearchableItemActionType, "isEqualToString:", v2);

  return v3;
}

+ (id)mailHandoffErrorWithActivityContextInfo:(id)a3 errorFormat:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v13);
  v11[0] = NSLocalizedDescriptionKey;
  v11[1] = CFSTR("ceActivityInfo");
  v12[0] = v7;
  v12[1] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MFHandoffErrorDomain, -1, v8));

  return v9;
}

+ (id)mailHandoffSimulatedError
{
  void *v2;
  void *v3;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Simulated handoff error.");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MFHandoffErrorDomain, 101, v2));

  return v3;
}

+ (id)mf_blockedURLErrorWithRequest:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mf_errorWithCode:request:underlyingError:allowFallbackRouting:debugDescription:", 6000001, a3, 0, 0, 0));
}

+ (id)mf_noSuitableRouteErrorWithRequest:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mf_errorWithCode:request:underlyingError:allowFallbackRouting:debugDescription:", 6000002, a3, 0, 1, 0));
}

+ (id)mf_routingErrorWithUnderlyingError:(id)a3 request:(id)a4 allowFallbackRouting:(BOOL)a5
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mf_errorWithCode:request:underlyingError:allowFallbackRouting:debugDescription:", 6000003, a4, a3, a5, 0));
}

+ (id)mf_generalRoutingErrorWithDescription:(id)a3 request:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mf_errorWithCode:request:underlyingError:allowFallbackRouting:debugDescription:", 6000000, a4, 0, 1, a3));
}

+ (id)_mf_errorWithCode:(unint64_t)a3 request:(id)a4 underlyingError:(id)a5 allowFallbackRouting:(BOOL)a6 debugDescription:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v8 = a6;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  if (qword_1005AA4E0 != -1)
    dispatch_once(&qword_1005AA4E0, &stru_100523430);
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("MFURLRouterErrorRequestKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("MFURLRoutingErrorAllowFallbackRoutingKey"));

  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, NSUnderlyingErrorKey);
  if (v13)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, NSDebugDescriptionErrorKey);
  v16 = objc_msgSend(v14, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MFURLRoutingErrorDomain"), a3, v16));

  return v17;
}

- (BOOL)mf_isBlockedURLError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("MFURLRoutingErrorDomain"), 6000001);

  return v3;
}

- (BOOL)mf_isNoSuitableRouteError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("MFURLRoutingErrorDomain"), 6000002);

  return v3;
}

- (BOOL)mf_allowFallbackRouting
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MFURLRoutingErrorAllowFallbackRoutingKey")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (MFURLRoutingRequest)mf_request
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MFURLRouterErrorRequestKey")));

  return (MFURLRoutingRequest *)v3;
}

+ (id)mf_invalidRestorationDataErrorWithUnderlyingError:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000000, a3));
}

+ (id)mf_restorationAccountNotAvailableErrorWithUnderlyingError:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000001, a3));
}

+ (id)mf_restorationMailboxNotAvailableErrorWithUnderlyingError:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000002, a3));
}

+ (id)mf_restorationMessageNotAvailableErrorWithUnderlyingError:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000003, a3));
}

+ (id)mf_blackPearlStateRestorationNotSupportedError
{
  return objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000004, 0);
}

+ (id)mf_restorationQueryInvalid
{
  return objc_msgSend(a1, "_restorationStateErrorWithCode:underlyingError:", 5000005, 0);
}

+ (id)_restorationStateErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v10;
  void *v11;

  v5 = a4;
  v6 = v5;
  if (qword_1005AA4E8 != -1)
  {
    dispatch_once(&qword_1005AA4E8, &stru_100523508);
    if (v6)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = NSUnderlyingErrorKey;
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobilemail.restoration"), a3, v7));

  return v8;
}

- (BOOL)mf_isAnyRestorationError
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilemail.restoration"));

  return v3;
}

- (BOOL)mf_isInvalidRestorationDataError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("com.apple.mobilemail.restoration"), 5000000);

  return v3;
}

- (BOOL)mf_isRestorationAccountNotAvailableError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("com.apple.mobilemail.restoration"), 5000001);

  return v3;
}

- (BOOL)mf_isRestorationMailboxNotAvailableError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("com.apple.mobilemail.restoration"), 5000002);

  return v3;
}

- (BOOL)mf_isRestorationMessageNotAvailableError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("com.apple.mobilemail.restoration"), 5000003);

  return v3;
}

- (BOOL)mf_isBlackPearlStateRestorationNotSupportedError
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;

  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSError ef_match](self, "ef_match"));
  v3 = ((uint64_t (**)(_QWORD, const __CFString *, uint64_t))v2)[2](v2, CFSTR("com.apple.mobilemail.restoration"), 5000004);

  return v3;
}

@end
