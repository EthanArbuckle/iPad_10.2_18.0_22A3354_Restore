@implementation _PLSharedStreamsEnablementStateObserver

- (_PLSharedStreamsEnablementStateObserver)init
{
  _PLSharedStreamsEnablementStateObserver *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PLSharedStreamsEnablementStateObserver;
  v2 = -[_PLSharedStreamsEnablementStateObserver init](&v6, sel_init);
  if (v2)
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_accountStoreDidChange, CFSTR("PLAccountStoreDidChangeNotification"), v3);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_PLSharedStreamsEnablementStateObserver;
  -[_PLSharedStreamsEnablementStateObserver dealloc](&v4, sel_dealloc);
}

- (void)accountStoreDidChange
{
  NSObject *v2;
  uint8_t v3[16];

  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "PLAccountStore did change; invalidating sharedStreamsEnabled",
      v3,
      2u);
  }

  +[PLPhotoSharingHelper accountSettingsChanged](PLPhotoSharingHelper, "accountSettingsChanged");
}

@end
