@implementation BRCQueryItemUtil

- (BRCQueryItemUtil)initWithMacOS:(BOOL)a3
{
  BRCQueryItemUtil *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCQueryItemUtil;
  result = -[BRCQueryItemUtil init](&v5, sel_init);
  if (result)
    result->_isMacOS = a3;
  return result;
}

+ (id)sharedQueryItemUtil
{
  if (sharedQueryItemUtil_onceToken != -1)
    dispatch_once(&sharedQueryItemUtil_onceToken, &__block_literal_global_32);
  return (id)sharedQueryItemUtil_obj;
}

void __39__BRCQueryItemUtil_sharedQueryItemUtil__block_invoke()
{
  BRCQueryItemUtil *v0;
  void *v1;

  v0 = -[BRCQueryItemUtil initWithMacOS:]([BRCQueryItemUtil alloc], "initWithMacOS:", 0);
  v1 = (void *)sharedQueryItemUtil_obj;
  sharedQueryItemUtil_obj = (uint64_t)v0;

}

- (int64_t)contentPolicyForItemInfo:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  int v13;
  void *v14;
  char v16;

  v6 = a3;
  v7 = a4;
  LODWORD(self) = self->_isMacOS;
  v8 = objc_msgSend(v6, "isZoneRoot");
  if (!(_DWORD)self)
  {
    if (v8 && objc_msgSend(v6, "isAppInstalled") && (objc_msgSend(v6, "isWallet") & 1) != 0)
    {
      v11 = 3;
      goto LABEL_25;
    }
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fpfsSpeculativeSetDownload");

    if (v13
      && objc_msgSend(v7, "isOptimizeStorage")
      && (objc_msgSend(v6, "isZoneRoot") && (objc_msgSend(v6, "isDefaultZone") & 1) != 0
       || objc_msgSend(v6, "isAppInstalled") && (objc_msgSend(v6, "isDocumentsFolder") & 1) != 0))
    {
      v11 = 502;
      goto LABEL_25;
    }
LABEL_20:
    v11 = 0;
    goto LABEL_25;
  }
  if (!v8)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "fpfsOptimizeStorageAndSpeculativeDownload")
      && objc_msgSend(v6, "isAppInstalled")
      && (objc_msgSend(v6, "isWallet") & 1) == 0)
    {
      v16 = objc_msgSend(v6, "isGreedyDocument");

      if ((v16 & 1) != 0)
      {
        v11 = 501;
        goto LABEL_25;
      }
    }
    else
    {

    }
    goto LABEL_20;
  }
  if ((objc_msgSend(v6, "isAppInstalled") & 1) != 0)
  {
    v9 = objc_msgSend(v6, "isWallet") == 0;
    v10 = 3;
  }
  else
  {
    v9 = objc_msgSend(v7, "isOptimizeStorage") == 0;
    v10 = 2;
  }
  if (v9)
    v11 = 0;
  else
    v11 = v10;
LABEL_25:

  return v11;
}

- (int64_t)contentPolicyForRootContainerWithSessionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;

  v4 = a3;
  v5 = v4;
  if (self->_isMacOS)
  {
    if ((objc_msgSend(v4, "isOptimizeStorage") & 1) != 0 || objc_msgSend(v5, "isDataSeparated"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "fpfsOptimizeStorageAndSpeculativeDownload");

      if (v7)
        v8 = 500;
      else
        v8 = 1;
    }
    else
    {
      v8 = 3;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
