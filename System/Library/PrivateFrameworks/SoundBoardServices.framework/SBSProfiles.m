@implementation SBSProfiles

- (SBSProfiles)init
{
  return -[SBSProfiles initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSProfiles)initWithTarget:(id)a3
{
  id v4;
  SBSProfiles *v5;
  uint64_t v6;
  SBSProfilesImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSProfiles;
  v5 = -[SBSProfiles init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSProfilesImplementer *)v6;

  }
  return v5;
}

- (void)getInstalledProfiles:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSProfilesImplementer getInstalledProfiles:](self->_sbProxy, "getInstalledProfiles:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "Reply completion handler is nil", v4, 2u);
    }

  }
}

- (void)installProfileData:(id)a3 completion:(id)a4
{
  -[SBSProfilesImplementer installProfileData:completion:](self->_sbProxy, "installProfileData:completion:", a3, a4);
}

- (void)removeProfileByIdentifier:(id)a3 completion:(id)a4
{
  -[SBSProfilesImplementer removeProfileByIdentifier:completion:](self->_sbProxy, "removeProfileByIdentifier:completion:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSProfiles;
  -[SBSProfiles dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
