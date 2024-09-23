@implementation ICSharedListeningConnectionController

- (ICSharedListeningConnectionController)initWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICSharedListeningConnectionController *v12;
  ICSharedListeningConnectionController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICSharedListeningConnectionController;
  v12 = -[ICSharedListeningConnectionController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v13->_identity, a4);
    objc_storeStrong((id *)&v13->_bundleID, a5);
  }

  return v13;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sessionToken, a3);
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setInviteURL:(id)a3
{
  objc_storeStrong((id *)&self->_inviteURL, a3);
}

- (ICSharedListeningConnectionControllerDelegate)delegate
{
  return (ICSharedListeningConnectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

+ (id)externalSharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  ICExternalSharedListeningConnectionController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ICExternalSharedListeningConnectionController initWithSessionIdentifier:identity:bundleID:]([ICExternalSharedListeningConnectionController alloc], "initWithSessionIdentifier:identity:bundleID:", v9, v8, v7);

  return v10;
}

+ (id)sharedListeningConnectionWithSessionIdentifier:(id)a3 identity:(id)a4 bundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  ICDirectSharedListeningConnectionController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ICDirectSharedListeningConnectionController initWithSessionIdentifier:identity:bundleID:]([ICDirectSharedListeningConnectionController alloc], "initWithSessionIdentifier:identity:bundleID:", v9, v8, v7);

  return v10;
}

@end
