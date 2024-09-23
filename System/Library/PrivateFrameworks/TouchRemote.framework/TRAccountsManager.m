@implementation TRAccountsManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TRAccountsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

void __35__TRAccountsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

- (NSString)deviceName
{
  return (NSString *)(id)MGCopyAnswer();
}

- (SSAccount)activeiTunesStoreAccount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SSAccount *)v3;
}

- (ACAccountStore)iCloudAccountStore
{
  ACAccountStore *iCloudAccountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  iCloudAccountStore = self->_iCloudAccountStore;
  if (!iCloudAccountStore)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_iCloudAccountStore;
    self->_iCloudAccountStore = v4;

    iCloudAccountStore = self->_iCloudAccountStore;
  }
  return iCloudAccountStore;
}

- (ACAccount)activeiCloudAccount
{
  void *v2;
  void *v3;

  -[TRAccountsManager iCloudAccountStore](self, "iCloudAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (NSString)homeSharingAppleID
{
  return (NSString *)(id)CFPreferencesCopyAppValue(CFSTR("homeSharingAppleID"), CFSTR("com.apple.homesharing"));
}

- (NSString)homeSharingGroupID
{
  return (NSString *)(id)CFPreferencesCopyAppValue(CFSTR("homeSharingGroupID"), CFSTR("com.apple.homesharing"));
}

- (GKLocalPlayer)localGameCenterPlayer
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getGKLocalPlayerClass_softClass;
  v9 = getGKLocalPlayerClass_softClass;
  if (!getGKLocalPlayerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getGKLocalPlayerClass_block_invoke;
    v5[3] = &unk_24C2E4E50;
    v5[4] = &v6;
    __getGKLocalPlayerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "localPlayer");
  return (GKLocalPlayer *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultAccountIDForAuthenticationAccountType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  switch(a3)
  {
    case 1uLL:
      -[TRAccountsManager activeiTunesStoreAccount](self, "activeiTunesStoreAccount");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[TRAccountsManager activeiCloudAccount](self, "activeiCloudAccount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "username");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      -[TRAccountsManager homeSharingAppleID](self, "homeSharingAppleID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 4uLL:
      -[TRAccountsManager localGameCenterPlayer](self, "localGameCenterPlayer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = v3;
      objc_msgSend(v3, "accountName");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v6;

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)accountTypesWithDefaultAccountID:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_24C2F2A50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      -[TRAccountsManager defaultAccountIDForAuthenticationAccountType:](self, "defaultAccountIDForAuthenticationAccountType:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", v4) & 1) == 0)
        objc_msgSend(v5, "removeObjectAtIndex:", v6--);

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }

  return v5;
}

- (void)setICloudAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudAccountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudAccountStore, 0);
}

@end
