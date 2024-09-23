@implementation STUSessionInfo

- (STUSessionInfo)initWithTransport:(id)a3 clientUserInfo:(id)a4
{
  id v7;
  id v8;
  STUSessionInfo *v9;
  STUSessionInfo *v10;
  NSDictionary *v11;
  NSDictionary *clientUserInfo;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUSessionInfo;
  v9 = -[STUSessionInfo init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transport, a3);
    v11 = (NSDictionary *)objc_msgSend(v8, "copy");
    clientUserInfo = v10->_clientUserInfo;
    v10->_clientUserInfo = v11;

  }
  return v10;
}

- (DMFControlSessionIdentifier)selfReportedSessionIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo clientUserInfo](self, "clientUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CRKTaskClientSessionIdentifierUserInfoKey));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(objc_alloc((Class)DMFControlSessionIdentifier), "initWithString:", v6);
  else
    v7 = 0;

  return (DMFControlSessionIdentifier *)v7;
}

- (NSString)instructorIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo clientUserInfo](self, "clientUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CRKTaskClientInstructorIdentifierUserInfoKey));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (NSString)classSessionGenerationToken
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo clientUserInfo](self, "clientUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CRKTaskClientSessionTokenUserInfoKey));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)disallowsClassroomAirDropOverLocalNetwork
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo clientUserInfo](self, "clientUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CRKTaskClientInstructorDisallowsClassroomAirDropOverLocalNetworkKey));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

- (BOOL)isTrustedByInstructor
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned __int8 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo clientUserInfo](self, "clientUserInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CRKTaskClientUntrustedKey));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7 ^ 1;
}

- (BOOL)isEligibleForSessionSnapshotting
{
  _BOOL4 v3;

  v3 = -[STUSessionInfo isLocalNetworkSession](self, "isLocalNetworkSession");
  if (v3)
    LOBYTE(v3) = -[STUSessionInfo isTrustedByInstructor](self, "isTrustedByInstructor");
  return v3;
}

- (BOOL)isXPCSession
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo transport](self, "transport"));
  v3 = objc_opt_class(CATXPCTransport);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)isNonXPCSession
{
  return !-[STUSessionInfo isXPCSession](self, "isXPCSession");
}

- (BOOL)isIDSSession
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo transport](self, "transport"));
  v3 = objc_opt_class(CATIDSServiceTransport);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (BOOL)isLocalNetworkSession
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSessionInfo transport](self, "transport"));
  v3 = objc_opt_class(CATRemoteTransport);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (CATTransport)transport
{
  return self->_transport;
}

- (NSDictionary)clientUserInfo
{
  return self->_clientUserInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUserInfo, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
