@implementation TUContactsDataProviderFetchRequest

- (TUContactsDataProviderFetchRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUContactsDataProviderFetchRequest.m"), 19, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUContactsDataProviderFetchRequest init]");

  return 0;
}

- (TUContactsDataProviderFetchRequest)initWithCall:(id)a3
{
  id v5;
  TUContactsDataProviderFetchRequest *v6;
  uint64_t v7;
  NSString *isoCountryCode;
  void *v9;
  uint64_t v10;
  NSArray *handles;
  NSArray *auxiliaryKeysToFetch;
  void *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUContactsDataProviderFetchRequest;
  v6 = -[TUContactsDataProviderFetchRequest init](&v15, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("TUContactsDataProviderFetchRequest.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("call != nil"));

    }
    v6->_emergency = objc_msgSend(v5, "isEmergency");
    objc_msgSend(v5, "isoCountryCode");
    v7 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v6->_isoCountryCode;
    v6->_isoCountryCode = (NSString *)v7;

    v6->_blocked = objc_msgSend(v5, "isBlocked");
    v6->_conversation = objc_msgSend(v5, "isConversation");
    v6->_verified = objc_msgSend(v5, "verificationStatus") == 1;
    v6->_incoming = objc_msgSend(v5, "isIncoming");
    objc_msgSend(v5, "remoteParticipantHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();
    handles = v6->_handles;
    v6->_handles = (NSArray *)v10;

    auxiliaryKeysToFetch = v6->_auxiliaryKeysToFetch;
    v6->_auxiliaryKeysToFetch = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v6;
}

- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3 isConversation:(BOOL)a4
{
  id v8;
  TUContactsDataProviderFetchRequest *v9;
  NSArray *auxiliaryKeysToFetch;
  void *v12;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUContactsDataProviderFetchRequest;
  v9 = -[TUContactsDataProviderFetchRequest init](&v13, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("TUContactsDataProviderFetchRequest.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handles != nil"));

    }
    objc_storeStrong((id *)&v9->_handles, a3);
    auxiliaryKeysToFetch = v9->_auxiliaryKeysToFetch;
    v9->_auxiliaryKeysToFetch = (NSArray *)MEMORY[0x1E0C9AA60];

    v9->_conversation = a4;
  }

  return v9;
}

- (TUContactsDataProviderFetchRequest)initWithHandles:(id)a3
{
  id v5;
  TUContactsDataProviderFetchRequest *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUContactsDataProviderFetchRequest.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handles != nil"));

  }
  v6 = -[TUContactsDataProviderFetchRequest initWithHandles:isConversation:](self, "initWithHandles:isConversation:", v5, 0);

  return v6;
}

- (TUContactsDataProviderFetchRequest)initWithHandle:(id)a3
{
  id v5;
  void *v6;
  TUContactsDataProviderFetchRequest *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUContactsDataProviderFetchRequest.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle != nil"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUContactsDataProviderFetchRequest initWithHandles:](self, "initWithHandles:", v6);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUContactsDataProviderFetchRequest contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" cI=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" uNCC=%d"), -[TUContactsDataProviderFetchRequest useNetworkCountryCode](self, "useNetworkCountryCode"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iEM=%d"), -[TUContactsDataProviderFetchRequest isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iBL=%d"), -[TUContactsDataProviderFetchRequest isBlocked](self, "isBlocked"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" c=%d"), -[TUContactsDataProviderFetchRequest isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" v=%d"), -[TUContactsDataProviderFetchRequest isVerified](self, "isVerified"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" i=%d"), -[TUContactsDataProviderFetchRequest isIncoming](self, "isIncoming"));
  -[TUContactsDataProviderFetchRequest isoCountryCode](self, "isoCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" isoCN=%@"), v5);

  -[TUContactsDataProviderFetchRequest handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" hdls=%@"), v6);

  -[TUContactsDataProviderFetchRequest phoneNumberPrefixHint](self, "phoneNumberPrefixHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" pnpH=%@"), v7);

  -[TUContactsDataProviderFetchRequest auxiliaryKeysToFetch](self, "auxiliaryKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[TUContactsDataProviderFetchRequest auxiliaryKeysToFetch](self, "auxiliaryKeysToFetch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" aKTF=%@"), v10);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (void)removePsuedHandles
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[TUContactsDataProviderFetchRequest handles](self, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TUContactsDataProviderFetchRequest handles](self, "handles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "destinationIdIsPseudonym");

      if ((v14 & 1) != 0)
        v9 = 1;
      else
        objc_msgSend(v5, "addObject:", v12);
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    -[TUContactsDataProviderFetchRequest setHandles:](self, "setHandles:", v6);
LABEL_13:

  }
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)auxiliaryKeysToFetch
{
  return self->_auxiliaryKeysToFetch;
}

- (void)setAuxiliaryKeysToFetch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phoneNumberPrefixHint
{
  return self->_phoneNumberPrefixHint;
}

- (void)setPhoneNumberPrefixHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)useNetworkCountryCode
{
  return self->_useNetworkCountryCode;
}

- (void)setUseNetworkCountryCode:(BOOL)a3
{
  self->_useNetworkCountryCode = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (BOOL)isVerified
{
  return self->_verified;
}

- (BOOL)isIncoming
{
  return self->_incoming;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumberPrefixHint, 0);
  objc_storeStrong((id *)&self->_auxiliaryKeysToFetch, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
