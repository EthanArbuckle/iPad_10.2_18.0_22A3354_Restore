@implementation TUProxyRecentCall

- (TUProxyRecentCall)initWithRecentCall:(id)a3
{
  id v5;
  TUProxyRecentCall *v6;
  TUProxyRecentCall *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUProxyRecentCall;
  v6 = -[TUProxyRecentCall init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recentCall, a3);

  return v7;
}

- (TUProxyRecentCall)init
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUProxyRecentCall init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Don't call %@, call designated initializer instead."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v6);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUProxyRecentCall init]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUProxyRecentCall.m"), 52, CFSTR("Don't call %@, call designated initializer instead."), v8);

  }
  return 0;
}

- (NSString)mostRecentCallInfo
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = -[TUProxyRecentCall mostRecentCallType](self, "mostRecentCallType");
  if (v3 - 2 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FaceTime"), &stru_1E38A53C8, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 > 1)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    -[TUProxyRecentCall recentCall](self, "recentCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callerIdSubStringForDisplay");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return (NSString *)v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v4;
  objc_super v6;

  if (sel_callerId == a3 || sel_isoCountryCode == a3)
  {
    -[TUProxyRecentCall recentCall](self, "recentCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUProxyRecentCall;
    -[TUProxyRecentCall forwardingTargetForSelector:](&v6, sel_forwardingTargetForSelector_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  -[TUProxyRecentCall backingContact](self, "backingContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[TUProxyRecentCall recentCall](self, "recentCall");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callerIdForDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    -[TUProxyRecentCall recentCall](self, "recentCall");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "callerIdForDisplay");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "callerNameForDisplay");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (!v13)
      {
        v5 = 0;
        goto LABEL_8;
      }
      -[TUProxyRecentCall recentCall](self, "recentCall");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callerNameForDisplay");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v11;

  }
LABEL_8:

  return (NSString *)v5;
}

- (CNContact)backingContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;

  -[TUProxyRecentCall recentCall](self, "recentCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUProxyRecentCall searchController](self, "searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "keysToFetchForFaceTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (!v8)
    {
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C968C8]) & 1) != 0)
      {
        v11 = objc_msgSend(v9, "code");

        if (v11 == 200)
        {
LABEL_11:
          v8 = 0;
          goto LABEL_12;
        }
      }
      else
      {

      }
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TUProxyRecentCall backingContact].cold.1((uint64_t)self, (uint64_t)v9, v12);

      goto LABEL_11;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
LABEL_12:

  return (CNContact *)v8;
}

- (NSString)backingContactId
{
  void *v2;
  void *v3;

  -[TUProxyRecentCall recentCall](self, "recentCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressBookRecordId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)backingContactIdentifier
{
  void *v2;
  void *v3;

  -[TUProxyRecentCall recentCall](self, "recentCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)destinationId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUProxyRecentCall recentCall](self, "recentCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUProxyRecentCall backingContact](self, "backingContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyDestinationID");
  }
  else
  {
    -[TUProxyRecentCall recentCall](self, "recentCall");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "callerId");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)handles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[TUProxyRecentCall backingContact](self, "backingContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "phoneNumberStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddressStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TUProxyRecentCall destinationId](self, "destinationId");
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v8;
    if (v8)
    {
      v10[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return (NSArray *)v7;
}

- (int64_t)mostRecentCallType
{
  void **v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  if (!mostRecentCallType__kCHServiceProviderTelephony)
  {
    v3 = (void **)CUTWeakLinkSymbol();
    if (v3)
      v4 = *v3;
    else
      v4 = 0;
    objc_storeStrong((id *)&mostRecentCallType__kCHServiceProviderTelephony, v4);
  }
  if (!mostRecentCallType__kCHServiceProviderFaceTime)
  {
    v5 = (void **)CUTWeakLinkSymbol();
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&mostRecentCallType__kCHServiceProviderFaceTime, v6);
  }
  if (mostRecentCallType__kCHServiceProviderTelephony)
  {
    -[TUProxyRecentCall recentCall](self, "recentCall");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", mostRecentCallType__kCHServiceProviderTelephony);

    if ((v9 & 1) != 0)
      return 1;
  }
  if (!mostRecentCallType__kCHServiceProviderFaceTime)
    return 0;
  -[TUProxyRecentCall recentCall](self, "recentCall");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", mostRecentCallType__kCHServiceProviderFaceTime);

  if (!v13)
    return 0;
  -[TUProxyRecentCall recentCall](self, "recentCall");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mediaType");

  v16 = 3;
  if (v15 != 2)
    v16 = 0;
  if (v15 == 1)
    return 2;
  else
    return v16;
}

- (BOOL)mostRecentCallWasMissed
{
  void *v2;
  int v3;
  BOOL v4;

  -[TUProxyRecentCall recentCall](self, "recentCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callStatus");
  if (__CUTWeakkCHCallStatusMissed__pred_kCHCallStatusMissedCallHistory != -1)
    dispatch_once(&__CUTWeakkCHCallStatusMissed__pred_kCHCallStatusMissedCallHistory, &__block_literal_global_15);
  v4 = v3 == __CUTStaticWeak_kCHCallStatusMissed;

  return v4;
}

- (NSArray)idsCanonicalDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[TUProxyRecentCall backingContact](self, "backingContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUProxyRecentCall recentCall](self, "recentCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "allIDSDestinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "IDSFormattedDestinationID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (void)setRecentCall:(id)a3
{
  objc_storeStrong((id *)&self->_recentCall, a3);
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

- (void)backingContact
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Error fetching backing contact for recent call %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
