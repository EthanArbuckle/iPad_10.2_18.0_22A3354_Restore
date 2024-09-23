@implementation BRCQueryItemInfo

+ (id)queryItemInfoForItem:(id)a3
{
  id v3;
  BRCQueryItemInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  v4->_isZoneRoot = objc_msgSend(v3, "isZoneRoot");
  objc_msgSend(v3, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isAppInstalled = objc_msgSend(v5, "isAppInstalled");

  if ((objc_msgSend(v3, "isDocument") & 1) != 0)
  {
    objc_msgSend(v3, "asDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_isGreedyDocument = objc_msgSend(v6, "shouldBeGreedy");

  }
  else
  {
    v4->_isGreedyDocument = 0;
  }
  objc_msgSend(v3, "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isDefaultZone = objc_msgSend(v7, "isCloudDocsZone");

  objc_msgSend(v3, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isDocumentsFolder = objc_msgSend(v8, "isDocumentsFolder");

  objc_msgSend(v3, "appLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appLibraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isWallet = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE17498]);

  return v4;
}

+ (id)queryItemInfoForAppLibrary:(id)a3
{
  id v3;
  BRCQueryItemInfo *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  v4->_isZoneRoot = 1;
  v4->_isAppInstalled = objc_msgSend(v3, "isAppInstalled");
  objc_msgSend(v3, "appLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isWallet = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE17498]);

  LOBYTE(v5) = objc_msgSend(v3, "isCloudDocsAppLibrary");
  v4->_isDefaultZone = (char)v5;
  return v4;
}

+ (id)queryItemInfoForDocumentsFolderWithAppLibrary:(id)a3
{
  id v3;
  BRCQueryItemInfo *v4;
  char v5;

  v3 = a3;
  v4 = objc_alloc_init(BRCQueryItemInfo);
  v5 = objc_msgSend(v3, "isAppInstalled");

  v4->_isAppInstalled = v5;
  v4->_isDocumentsFolder = 1;
  v4->_isZoneRoot = 0;
  return v4;
}

- (BOOL)isZoneRoot
{
  return self->_isZoneRoot;
}

- (BOOL)isDefaultZone
{
  return self->_isDefaultZone;
}

- (BOOL)isAppInstalled
{
  return self->_isAppInstalled;
}

- (BOOL)isWallet
{
  return self->_isWallet;
}

- (BOOL)isGreedyDocument
{
  return self->_isGreedyDocument;
}

- (BOOL)isDocumentsFolder
{
  return self->_isDocumentsFolder;
}

@end
