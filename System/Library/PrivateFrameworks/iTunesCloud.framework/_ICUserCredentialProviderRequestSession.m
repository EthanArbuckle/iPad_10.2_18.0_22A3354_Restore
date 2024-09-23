@implementation _ICUserCredentialProviderRequestSession

- (id)responseHandler
{
  return self->_responseHandler;
}

- (NSMutableArray)pendingResponseCredentialRequests
{
  return self->_pendingResponseCredentialRequests;
}

- (NSMutableArray)pendingPropertyLoadCredentialRequests
{
  return self->_pendingPropertyLoadCredentialRequests;
}

- (BOOL)hasPendingResponses
{
  return -[NSMutableArray count](self->_pendingResponseCredentialRequests, "count") != 0;
}

- (NSMapTable)delegationCredentialRequestToSpecificUserIdentity
{
  return self->_delegationCredentialRequestToSpecificUserIdentity;
}

- (ICUserIdentityProperties)activeICloudAccountProperties
{
  return self->_activeICloudAccountProperties;
}

- (_ICUserCredentialProviderRequestSession)initWithCredentialRequests:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  _ICUserCredentialProviderRequestSession *v8;
  uint64_t v9;
  NSArray *credentialRequests;
  uint64_t v11;
  NSMutableArray *pendingResponseCredentialRequests;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  id responseHandler;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_ICUserCredentialProviderRequestSession;
  v8 = -[_ICUserCredentialProviderRequestSession init](&v27, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    credentialRequests = v8->_credentialRequests;
    v8->_credentialRequests = (NSArray *)v9;

    v11 = -[NSArray mutableCopy](v8->_credentialRequests, "mutableCopy");
    pendingResponseCredentialRequests = v8->_pendingResponseCredentialRequests;
    v8->_pendingResponseCredentialRequests = (NSMutableArray *)v11;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      v17 = -1;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v19 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "qualityOfService", (_QWORD)v23);
          if (v17 <= v19)
            v17 = v19;
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
    }
    else
    {
      v17 = -1;
    }

    v8->_maximumQualityOfService = v17;
    v20 = MEMORY[0x1A1AFA8D0](v7);
    responseHandler = v8->_responseHandler;
    v8->_responseHandler = (id)v20;

  }
  return v8;
}

- (void)setActiveICloudAccountProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPendingPropertyLoadCredentialRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPropertyLoadCredentialRequests, a3);
}

- (NSArray)credentialRequests
{
  return self->_credentialRequests;
}

- (int64_t)maximumQualityOfService
{
  return self->_maximumQualityOfService;
}

- (ICUserIdentityStore)identityStore
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_credentialRequests, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICUserIdentityStore *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_pendingResponseCredentialRequests, 0);
  objc_storeStrong((id *)&self->_pendingPropertyLoadCredentialRequests, 0);
  objc_storeStrong((id *)&self->_delegationUserIdentityToUUIDs, 0);
  objc_storeStrong((id *)&self->_delegationCredentialRequestToIdentityProperties, 0);
  objc_storeStrong((id *)&self->_delegationCredentialRequestToSpecificUserIdentity, 0);
  objc_storeStrong((id *)&self->_credentialRequests, 0);
  objc_storeStrong((id *)&self->_activeICloudAccountProperties, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [%@]>"), objc_opt_class(), self, self->_credentialRequests);
}

- (void)setDelegationCredentialRequestToSpecificUserIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_delegationCredentialRequestToSpecificUserIdentity, a3);
}

- (NSMapTable)delegationCredentialRequestToIdentityProperties
{
  return self->_delegationCredentialRequestToIdentityProperties;
}

- (void)setDelegationCredentialRequestToIdentityProperties:(id)a3
{
  objc_storeStrong((id *)&self->_delegationCredentialRequestToIdentityProperties, a3);
}

- (NSMutableDictionary)delegationUserIdentityToUUIDs
{
  return self->_delegationUserIdentityToUUIDs;
}

- (void)setDelegationUserIdentityToUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_delegationUserIdentityToUUIDs, a3);
}

- (void)setPendingResponseCredentialRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingResponseCredentialRequests, a3);
}

@end
