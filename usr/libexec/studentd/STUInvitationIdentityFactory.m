@implementation STUInvitationIdentityFactory

- (STUInvitationIdentityFactory)initWithConfigurationManager:(id)a3
{
  id v5;
  STUInvitationIdentityFactory *v6;
  STUInvitationIdentityFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUInvitationIdentityFactory;
  v6 = -[STUInvitationIdentityFactory init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configurationManager, a3);

  return v7;
}

- (id)makeInvitationIdentity
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityFactory makeInvitationIdentityConfiguration](self, "makeInvitationIdentityConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityFactory keychain](self, "keychain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makeIdentityWithConfiguration:", v3));

  if (!v5)
  {
    if (qword_1000FC1B8 != -1)
      dispatch_once(&qword_1000FC1B8, &stru_1000CA2E8);
    v6 = qword_1000FC1B0;
    if (os_log_type_enabled((os_log_t)qword_1000FC1B0, OS_LOG_TYPE_ERROR))
      sub_10007B30C(v6);
  }

  return v5;
}

- (id)makeInvitationIdentityConfiguration
{
  STURollingDeviceIdentitySet *v3;
  void *v4;
  STURollingDeviceIdentitySet *v5;
  void *v6;

  v3 = [STURollingDeviceIdentitySet alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityFactory userIdentifier](self, "userIdentifier"));
  v5 = -[STURollingUserIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:](v3, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:", 0, 0, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STURollingIdentitySet identityConfiguration](v5, "identityConfiguration"));
  return v6;
}

- (id)userIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUInvitationIdentityFactory configurationManager](self, "configurationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "adHocBaseUserIdentifier"));

  return v3;
}

- (id)keychain
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keychain"));

  return v3;
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
