@implementation BRCDocumentItem

- (BOOL)hasFileIDForUpload
{
  return self->_fileIDForUpload != 0;
}

- (id)aliasItemID
{
  void *v3;
  BRCItemID *v4;
  BRCItemID *v5;
  void *v6;

  if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCLocalItem asSharedToMeTopLevelItem](self, "asSharedToMeTopLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedAliasItemID");
    v4 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "wasMovedToCloudDocs") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v5 = [BRCItemID alloc];
      -[BRCItemID itemIDString](self->super._itemID, "itemIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[BRCItemID initWithAliasUUID:](v5, "initWithAliasUUID:", v6);

    }
  }

  return v4;
}

- (NSError)uploadError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BRCLocalItem syncUpError](self, "syncUpError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uploadError");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSError *)v5;
}

- (BOOL)isPackage
{
  unsigned int v3;
  void *v5;
  NSObject *v6;

  if (!-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark"))
  {
    v3 = -[BRCStatInfo type](self->super._st, "type");
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem isPackage].cold.1();

    }
  }
  return -[BRCVersion isPackage](self->_currentVersion, "isPackage");
}

- (BOOL)isDocument
{
  unsigned int v3;
  void *v5;
  NSObject *v6;

  if (!-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark"))
  {
    v3 = -[BRCStatInfo type](self->super._st, "type");
    if (v3 > 8 || ((1 << v3) & 0x106) == 0)
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem isPackage].cold.1();

    }
  }
  return 1;
}

- (BOOL)isShareableItem
{
  return 1;
}

- (id)collaborationIdentifierIfComputable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[BRCDocumentItem isShareableItem](self, "isShareableItem"))
  {
    v3 = objc_alloc(MEMORY[0x24BDB91E8]);
    -[BRCDocumentItem asShareableItem](self, "asShareableItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initShareIDWithShareableItem:", v4);

    -[BRCLocalItem session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedCurrentUserRecordNameIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_collaborationIdentifierWithCachedCurrentUserRecordName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)hasLocalContent
{
  return -[BRCStatInfo state](self->super._st, "state") == 0;
}

- (BOOL)isDocumentBeingCopiedToNewZone
{
  void *v2;
  BOOL v3;

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isCrossZoneMoveTombstone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[BRCLocalItem asDocument](self->super._orig, "asDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCLocalItem isDead](self, "isDead")
    || -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || (objc_msgSend(v3, "isDead") & 1) != 0
    || !objc_msgSend(v3, "isDocumentBeingCopiedToNewZone"))
  {
    v7 = 0;
  }
  else
  {
    -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previousItemGlobalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToItemGlobalID:", v6);

  }
  return v7;
}

- (BOOL)isEvictable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  char v13;
  BOOL v14;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "br_pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24FE4A790;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend(v5, "nonEvictableExtensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v11);

  v14 = (v13 & 1) == 0 && -[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected");
  return v14;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonEvictableExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v3))
  {
    objc_msgSend(v4, "nonAutoEvictableExtensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v3);

    if ((v7 & 1) != 0)
      goto LABEL_4;
    +[BRCUTITypeCache defaultCache](BRCUTITypeCache, "defaultCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UTIForExtension:", v3);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v8 = 1;
LABEL_27:

      goto LABEL_28;
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "autoEvictableUTIs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
LABEL_8:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        if (UTTypeConformsTo(v10, *(CFStringRef *)(*((_QWORD *)&v25 + 1) + 8 * v15)))
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v13)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "nonAutoEvictableUTIs", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v11);
            if (UTTypeConformsTo(v10, *(CFStringRef *)(*((_QWORD *)&v21 + 1) + 8 * i)))
            {
              v8 = 0;
              goto LABEL_26;
            }
          }
          v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          v8 = 1;
          if (v17)
            continue;
          goto LABEL_26;
        }
      }
    }
    v8 = 1;
LABEL_26:

    goto LABEL_27;
  }

LABEL_4:
  v8 = 0;
LABEL_28:

  return v8;
}

+ (BOOL)isDocumentAutomaticallyEvictableWithName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "br_pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "isDocumentAutomaticallyEvictableWithExtension:", v5);
  return (char)a1;
}

- (BOOL)isAutomaticallyEvictable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  if (!-[BRCDocumentItem isEvictable](self, "isEvictable"))
    return 0;
  if (!-[BRCDocumentItem hasLocalContent](self, "hasLocalContent"))
    return 0;
  v3 = (void *)objc_opt_class();
  -[BRCLocalStatInfo logicalName](self->super._st, "logicalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isDocumentAutomaticallyEvictableWithName:", v4);

  if (!(_DWORD)v3)
    return 0;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "minAutomaticallyEvictableFilesize");
  v9 = -[BRCVersion size](self->_currentVersion, "size") >= v8;

  return v9;
}

- (BOOL)isVisibleIniCloudDrive
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[BRCLocalItem isInDocumentScope](self, "isInDocumentScope"))
  {
    if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[BRCClientZone asPrivateClientZone](self->super._clientZone, "asPrivateClientZone");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultAppLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "containerMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isDocumentScopePublic"))
        v3 = objc_msgSend(v6, "isCloudSyncTCCDisabled") ^ 1;
      else
        LOBYTE(v3) = 0;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasShareIDAndIsOwnedByMe
{
  _BOOL4 v3;

  v3 = -[BRCLocalItem isOwnedByMe](self, "isOwnedByMe");
  if (v3)
    return (LOBYTE(self->super._sharingOptions) >> 2) & 1;
  return v3;
}

+ (BOOL)shouldDocumentBeGreedyWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a3, "br_pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonEvictableExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "shouldBeGreedyExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsObject:", v4);

  }
  return v7;
}

- (BOOL)shouldBeGreedy
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mangledID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumDocumentAgeToBeGreedy");
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = (uint64_t)v9;

  -[BRCDocumentItem currentVersion](self, "currentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mtime");

  if (v12 >= v10)
  {
    -[BRCLocalItem appLibrary](self, "appLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isDocumentScopePublic");

    if ((v17 & 1) == 0)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem shouldBeGreedy].cold.2();

      goto LABEL_13;
    }
    if (!-[BRCLocalItem isInTrashScope](self, "isInTrashScope")
      && !-[BRCLocalItem isInDataScope](self, "isInDataScope"))
    {
      -[BRCLocalItem appLibrary](self, "appLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v22, "shouldEvictUploadedItems") ^ 1;

      return v20;
    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem shouldBeGreedy].cold.1();
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[BRCDocumentItem currentVersion](self, "currentVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218498;
      v24 = objc_msgSend(v15, "mtime");
      v25 = 2048;
      v26 = (uint64_t)(v7 / 86400.0);
      v27 = 2112;
      v28 = v13;
      _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] don't be greedy because document is too old (mtime: %lld; max age: %lld days)%@",
        (uint8_t *)&v23,
        0x20u);

    }
  }

LABEL_13:
  LOBYTE(v20) = 0;
  return v20;
}

- (BOOL)shouldHaveThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  -[BRCLocalItem st](self, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logicalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24FE4A790;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "mangledID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blacklistedThumbnailExtensions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v13, "containsObject:", v9);
  v14 = (v10 & 1) == 0 && -[BRCLocalItem isInDocumentScope](self, "isInDocumentScope");

  return v14;
}

- (BOOL)shouldTransferThumbnail
{
  void *v3;
  int v4;

  if (-[BRCLocalItem isFinderBookmark](self, "isFinderBookmark")
    || -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || !-[BRCDocumentItem shouldHaveThumbnail](self, "shouldHaveThumbnail"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSmallAndMostRecentClientsGenerateThumbnails") ^ 1;

  }
  return v4;
}

- (unsigned)queryItemStatus
{
  return -[BRCLocalItem isDead](self, "isDead");
}

- (unsigned)downloadStatus
{
  return 3;
}

- (BOOL)_isInterestingUpdateForNotifs
{
  BRCLocalItem *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  void *v10;

  v3 = self->super._orig;
  -[BRCLocalItem currentVersion](v3, "currentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uploadError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_7:
      v9 = 1;
      goto LABEL_8;
    }
  }
  v6 = -[BRCLocalItem queryItemStatus](v3, "queryItemStatus");
  if (v6 != -[BRCDocumentItem queryItemStatus](self, "queryItemStatus"))
    goto LABEL_7;
  v7 = -[BRCLocalItem downloadStatus](v3, "downloadStatus");
  if (v7 != -[BRCDocumentItem downloadStatus](self, "downloadStatus"))
    goto LABEL_7;
  v8 = -[BRCLocalItem uploadStatus](v3, "uploadStatus");
  v9 = v8 != -[BRCLocalItem uploadStatus](self, "uploadStatus");
LABEL_8:

  return v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCLocalVersion *currentVersion;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem descriptionWithContext:](&v12, sel_descriptionWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_fileIDForUpload)
    objc_msgSend(v5, "appendFormat:", CFSTR(" up-id{fid:%@, gen:%@}"), self->_fileIDForUpload, self->_generationIDForUpload);
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    -[BRCLocalVersion descriptionWithContext:](currentVersion, "descriptionWithContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" ct{%@}"), v8);

  }
  if (-[NSMutableSet count](self->_resolvedConflictLoserEtags, "count"))
  {
    -[NSMutableSet allObjects](self->_resolvedConflictLoserEtags, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" resolved-losers:{%@}"), v10);

  }
  return v6;
}

- (id)_initWithServerItem:(id)a3 dbRowID:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  BRCLocalVersion *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v18;
  NSObject *v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BRCDocumentItem;
  v7 = -[BRCLocalItem _initWithServerItem:dbRowID:](&v20, sel__initWithServerItem_dbRowID_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "latestVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((objc_msgSend(v6, "isDocument") & 1) == 0)
      {
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[BRCDocumentItem _initWithServerItem:dbRowID:].cold.2();

      }
      v9 = [BRCLocalVersion alloc];
      objc_msgSend(v6, "latestVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[BRCLocalVersion initWithVersion:](v9, "initWithVersion:", v10);
      v12 = (void *)*((_QWORD *)v7 + 25);
      *((_QWORD *)v7 + 25) = v11;

      v13 = objc_msgSend(*((id *)v7 + 25), "copy");
      v14 = *((_QWORD *)v7 + 11);
      v15 = *(void **)(v14 + 200);
      *(_QWORD *)(v14 + 200) = v13;
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem _initWithServerItem:dbRowID:].cold.1((uint64_t)v6);

    }
  }

  return v7;
}

- (id)_initWithLocalItem:(id)a3
{
  id v4;
  _QWORD *v5;
  id *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem _initWithLocalItem:](&v16, sel__initWithLocalItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "asDocument");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6[25], "copy");
    v8 = (void *)v5[25];
    v5[25] = v7;

    v9 = objc_msgSend(v6[27], "copy");
    v10 = (void *)v5[27];
    v5[27] = v9;

    v11 = objc_msgSend(v6[28], "copy");
    v12 = (void *)v5[28];
    v5[28] = v11;

    v13 = objc_msgSend(v6[26], "mutableCopy");
    v14 = (void *)v5[26];
    v5[26] = v13;

  }
  return v5;
}

- (BOOL)hasValidCKInfo
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = -[BRCLocalItem isTopLevelSharedItem](self, "isTopLevelSharedItem");
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = v4 != 0;
  }
  else if (v4)
  {
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)diffAgainstServerItem:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v12;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v14;
  void *v15;
  void *v17;
  NSObject *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem diffAgainstServerItem:](&v19, sel_diffAgainstServerItem_, v4);
  if (v4 && (objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem diffAgainstServerItem:].cold.1();

  }
  if (objc_msgSend(v4, "isDocument"))
  {
    if (self->_currentVersion)
    {
      objc_msgSend(v4, "latestVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "latestVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= -[BRCVersion diffAgainst:](self->_currentVersion, "diffAgainst:", v7);
        if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
          v5 &= ~0x1000000uLL;
        if ((v5 & 0x2000000) != 0)
        {
          -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
          {
            objc_msgSend(v7, "editedSinceShared");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "BOOLValue");

            if (!v10)
              v5 &= ~0x2000000uLL;
          }
          else
          {

          }
        }

        if ((v5 & 0x800000) != 0)
          goto LABEL_20;
LABEL_18:
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        objc_msgSend(v4, "latestVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "conflictLoserEtags");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(resolvedConflictLoserEtags) = -[NSMutableSet intersectsSet:](resolvedConflictLoserEtags, "intersectsSet:", v15);

        if ((_DWORD)resolvedConflictLoserEtags)
          v5 |= 0x800000uLL;
        goto LABEL_20;
      }
      currentVersion = self->_currentVersion;
    }
    else
    {
      currentVersion = 0;
    }
    objc_msgSend(v4, "latestVersion");
    v12 = (BRCLocalVersion *)objc_claimAutoreleasedReturnValue();

    if (currentVersion != v12)
      v5 |= 0x3FF0000uLL;
    if ((v5 & 0x800000) == 0)
      goto LABEL_18;
  }
LABEL_20:

  return v5;
}

- (unint64_t)diffAgainstLocalItem:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  BRCLocalVersion *currentVersion;
  uint64_t v10;
  NSNumber *fileIDForUpload;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  int v16;
  BRCGenerationID *generationIDForUpload;
  void *v18;
  BRCGenerationID *v19;
  BRCGenerationID *v20;
  BRCGenerationID *v21;
  int v22;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *v26;
  NSMutableSet *v27;
  int v28;
  void *v30;
  NSObject *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem diffAgainstLocalItem:](&v32, sel_diffAgainstLocalItem_, v4);
  if (v4 && (objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem diffAgainstServerItem:].cold.1();

  }
  if (objc_msgSend(v4, "isDocument"))
  {
    objc_msgSend(v4, "asDocument");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_currentVersion)
    {
      objc_msgSend(v6, "currentVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      currentVersion = self->_currentVersion;
      if (v8)
      {
        v10 = -[BRCLocalVersion diffAgainstLocalVersion:](currentVersion, "diffAgainstLocalVersion:", v7[25]) | v5;
        if ((v10 & 0x400000000) != 0)
          goto LABEL_20;
LABEL_13:
        fileIDForUpload = self->_fileIDForUpload;
        objc_msgSend(v7, "fileIDForUpload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = fileIDForUpload;
        v14 = v12;
        v15 = v14;
        if (v13 == v14)
        {
          v16 = 0;
        }
        else if (v14)
        {
          v16 = -[NSNumber isEqual:](v13, "isEqual:", v14) ^ 1;
        }
        else
        {
          v16 = 1;
        }

        if (v16)
          v10 |= 0x400000000uLL;
LABEL_20:
        if ((v10 & 0x800000000) != 0)
        {
          if ((v10 & 0x800000) != 0)
          {
LABEL_38:
            if (-[BRCClientZone isSharedZone](self->super._clientZone, "isSharedZone"))
              v5 = v10 & 0xFFFFFFFFFEFFFFFFLL;
            else
              v5 = v10;
            if (-[BRCLocalItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
              v5 &= ~0x40000uLL;

            goto LABEL_44;
          }
        }
        else
        {
          generationIDForUpload = self->_generationIDForUpload;
          objc_msgSend(v7, "generationIDForUpload");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = generationIDForUpload;
          v20 = v18;
          v21 = v20;
          if (v19 == v20)
          {
            v22 = 0;
          }
          else if (v20)
          {
            v22 = !-[BRCGenerationID isEqual:](v19, "isEqual:", v20);
          }
          else
          {
            v22 = 1;
          }

          if (v22)
            v10 |= 0x800000000uLL;
          if ((v10 & 0x800000) != 0)
            goto LABEL_38;
        }
        resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
        objc_msgSend(v7, "resolvedConflictLoserEtags");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = resolvedConflictLoserEtags;
        v26 = v24;
        v27 = v26;
        if (v25 == v26)
        {
          v28 = 0;
        }
        else if (v26)
        {
          v28 = -[NSMutableSet isEqual:](v25, "isEqual:", v26) ^ 1;
        }
        else
        {
          v28 = 1;
        }

        if (v28)
          v10 |= 0x800000uLL;
        goto LABEL_38;
      }
    }
    else
    {
      currentVersion = 0;
    }
    if (currentVersion == (BRCLocalVersion *)v7[25])
      v10 = v5;
    else
      v10 = v5 | 0x7000003FF0000;
    if ((v10 & 0x400000000) != 0)
      goto LABEL_20;
    goto LABEL_13;
  }
LABEL_44:

  return v5;
}

- (BOOL)validateLoggingToFile:(__sFILE *)a3
{
  unsigned int v5;
  BRCLocalVersion *currentVersion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem validateLoggingToFile:](&v8, sel_validateLoggingToFile_);
  currentVersion = self->_currentVersion;
  if (currentVersion)
  {
    if (v5)
      LOBYTE(v5) = -[BRCVersion check:logToFile:](currentVersion, "check:logToFile:", self->super._itemID, a3);
  }
  else if (!-[BRCLocalItem isDead](self, "isDead"))
  {
    fprintf(a3, "item %s is a live document without a version\n", -[BRCItemID UTF8String](self->super._itemID, "UTF8String"));
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)clearVersionSignatures:(unint64_t)a3 isPackage:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSObject *v8;

  v4 = a4;
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCDocumentItem clearVersionSignatures:isPackage:].cold.1();

  -[BRCLocalVersion _clearSignatures:isPackage:](self->_currentVersion, "_clearSignatures:isPackage:", a3, v4);
}

- (id)syncContextUsedForTransfers
{
  BRCServerZone *serverZone;
  void *v3;
  void *v4;

  serverZone = self->super._serverZone;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", serverZone, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "latestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "etag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v13;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v7;
    _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] updating ct-etag:%@ from server item: %@%@", (uint8_t *)&v22, 0x20u);

  }
  if (!v4)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.3();

  }
  if ((objc_msgSend(v4, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.3();

  }
  if (-[BRCDocumentItem isDocument](self, "isDocument"))
  {
    if (v6)
      goto LABEL_7;
    goto LABEL_19;
  }
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.2();

  if (!v6)
  {
LABEL_19:
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.2();

  }
LABEL_7:
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etagBeforeCrossZoneMove");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:", v10);

  }
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", v6);
  objc_msgSend(v4, "latestVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastEditorDeviceOrUserRowID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setLastEditorDeviceOrUserRowID:](self->_currentVersion, "setLastEditorDeviceOrUserRowID:", v12);

}

- (void)updateVersionMetadataFromServerItem:(id)a3 preventVersionDiffs:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  NSObject *isa;
  void *v15;
  BRCLocalVersion *currentVersion;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  BRCLocalVersion *v22;
  void *v23;
  BRCLocalVersion *v24;
  BRCLocalVersion *v25;
  BRCLocalVersion *v26;
  BRCLocalItem *orig;
  BRCLocalVersion *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BRCLocalVersion *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.3();

  }
  objc_msgSend(v6, "latestVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:].cold.2();

  }
  objc_msgSend(v6, "latestVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "diffAgainst:", self->_currentVersion);

  if ((v9 & 0x100000) != 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    isa = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(isa, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "latestVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      currentVersion = self->_currentVersion;
      v33 = 134218754;
      v34 = v9;
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = currentVersion;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_230455000, isa, OS_LOG_TYPE_DEFAULT, "[WARNING] We think this is a meta only update but it isn't (%llu)!\n latest-version: %@\n current-verions: %@%@", (uint8_t *)&v33, 0x2Au);

    }
    goto LABEL_23;
  }
  -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) != 0)
  {
    v12 = 1;
    goto LABEL_17;
  }
  if (-[BRCLocalItem isSharedToMe](self, "isSharedToMe") || -[BRCLocalItem isSharedByMe](self, "isSharedByMe"))
  {
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "etag");
    v18 = objc_claimAutoreleasedReturnValue();
    v12 = v18 != 0;
    if (!v18)
    {
LABEL_15:

      goto LABEL_17;
    }
    v19 = (void *)v18;
    v20 = -[BRCDocumentItem diffAgainstServerItem:](self, "diffAgainstServerItem:", v6) & 0x1A0000;

    if (v20)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem updateVersionMetadataFromServerItem:preventVersionDiffs:].cold.1();

      goto LABEL_15;
    }
  }
  v12 = 0;
LABEL_17:
  -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [BRCLocalVersion alloc];
  objc_msgSend(v6, "latestVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[BRCLocalVersion initWithServerVersion:](v22, "initWithServerVersion:", v23);
  v25 = self->_currentVersion;
  self->_currentVersion = v24;

  if (v12)
    -[BRCVersion setEditedSinceShared:](self->_currentVersion, "setEditedSinceShared:", MEMORY[0x24BDBD1C8]);
  if (objc_msgSend(v13, "br_isCloudDocsErrorCode:", 43))
    -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", v13);
  if (v4)
  {
    v26 = self->_currentVersion;
    orig = self->super._orig;
    v28 = v26;
    isa = orig[1].super.isa;
    orig[1].super.isa = (Class)v28;
LABEL_23:

  }
}

- (void)markItemForgottenByServer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markItemForgottenByServer](&v3, sel_markItemForgottenByServer);
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
}

- (void)forceiWorkConflictEtag:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  BRCDocumentItem *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412802;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] forcing iwork conflict etag on %@ to be %@%@", (uint8_t *)&v8, 0x20u);
  }

  -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEtag:", v4);

  self->super._localDiffs |= 0x4000000000000000uLL;
}

- (void)forceVersionConflictByClearkingCKInfo
{
  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
}

- (void)forceiWorkSharingInfoResend
{
  self->super._localDiffs |= 0x800000000000000uLL;
  -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
}

- (void)appDidResolveConflictLoserWithEtag:(id)a3
{
  id v4;
  uint64_t v5;
  BRCPQLConnection *db;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended"))
    v5 = 4;
  else
    v5 = 20;
  db = self->super._db;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke;
  v8[3] = &unk_24FE41988;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[BRCPQLConnection performWithFlags:action:](db, "performWithFlags:action:", v5, v8);

}

uint64_t __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "conflictLoserEtags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "addResolvedConflictLoserEtag:", *(_QWORD *)(a1 + 40));
    if ((objc_msgSend(*(id *)(a1 + 32), "needsReading") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "markNeedsReading");
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2();

  }
  return objc_msgSend(*(id *)(a1 + 32), "saveToDB");
}

- (void)markDead
{
  BRCLocalVersion *v3;
  void *v4;
  void *v5;
  BRCLocalVersion *currentVersion;
  BRCLocalVersion *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markDead](&v9, sel_markDead);
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
  v3 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", -[BRCVersion isPackage](self->_currentVersion, "isPackage"));
  -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setOriginalPOSIXName:](v3, "setOriginalPOSIXName:", v4);

  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion setCkInfo:](v3, "setCkInfo:", v5);

  currentVersion = self->_currentVersion;
  self->_currentVersion = v3;
  v7 = v3;

  -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cancelAndCleanupItemDownloads:", self);
}

- (void)markNeedsReading
{
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCDocumentItem clearVersionSignatures:isPackage:](self, "clearVersionSignatures:isPackage:", 0, -[BRCVersion isPackage](self->_currentVersion, "isPackage"));
    -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
  }
  -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
}

- (void)markLatestSyncRequestRejectedInZone:(id)a3
{
  id v4;
  unint64_t localDiffs;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  localDiffs = self->super._localDiffs;
  if ((-[BRCLocalItem metadataSyncUpMask:](self, "metadataSyncUpMask:", 0) & localDiffs) == 0)
    -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
  v10.receiver = self;
  v10.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markLatestSyncRequestRejectedInZone:](&v10, sel_markLatestSyncRequestRejectedInZone_, v4);
  if (self->super._syncUpState != 1)
    -[BRCDocumentItem markForceUpload](self, "markForceUpload");
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "br_isEqualToNumber:", v6);

    if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem markLatestSyncRequestRejectedInZone:].cold.1();

      -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
    }
  }

}

- (BOOL)markLatestSyncRequestAcknowledgedInZone:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSMutableSet *resolvedConflictLoserEtags;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem markLatestSyncRequestAcknowledgedInZone:](&v12, sel_markLatestSyncRequestAcknowledgedInZone_, v4);
  if (v5)
  {
    resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = 0;

    if ((self->super._localDiffs & 0x1FE0000) == 0)
      -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
    if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
    {
      -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "br_isEqualToNumber:", v7);

      if (v8)
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem markLatestSyncRequestRejectedInZone:].cold.1();

        -[BRCDocumentItem _insertTombstoneForPreviousZoneGlobalID](self, "_insertTombstoneForPreviousZoneGlobalID");
      }
    }
  }

  return v5;
}

- (void)handleUnknownItemError
{
  objc_super v3;

  -[BRCVersion setCkInfo:](self->_currentVersion, "setCkInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem handleUnknownItemError](&v3, sel_handleUnknownItemError);
}

- (void)markForceUpload
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7[3];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceUpload]", 1192, v7);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v7[0];
    -[BRCLocalItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force upload: %@%@", buf, 0x20u);

  }
  if (-[BRCDocumentItem hasFileIDForUpload](self, "hasFileIDForUpload")
    || -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone"))
  {
    -[BRCDocumentItem clearVersionSignatures:isPackage:](self, "clearVersionSignatures:isPackage:", 3, -[BRCVersion isPackage](self->_currentVersion, "isPackage"));
    -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  }
  else
  {
    -[BRCDocumentItem reIngestFromFileProvider](self, "reIngestFromFileProvider");
  }
  __brc_leave_section(v7);
}

- (void)markForceNeedsSyncUp
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markForceNeedsSyncUp]", 1212, v8);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v8[0];
    -[BRCLocalItem itemID](self, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_debug_impl(&dword_230455000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking force needs-syncup: %@%@", buf, 0x20u);

  }
  self->super._localDiffs |= 0x20000uLL;
  v7.receiver = self;
  v7.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem markForceNeedsSyncUp](&v7, sel_markForceNeedsSyncUp);
  __brc_leave_section(v8);
}

- (void)markUploadedWithRecord:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  __CFString **v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  BRCLocalVersion *currentVersion;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  int64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46[3];
  uint8_t buf[4];
  BRCDocumentItem *v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v46, 0, sizeof(v46));
  __brc_create_section(0, (uint64_t)"-[BRCDocumentItem markUploadedWithRecord:]", 1230, v46);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v29 = v46[0];
    -[BRCLocalItem itemID](self, "itemID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v48 = (BRCDocumentItem *)v29;
    v49 = 2112;
    v50 = (int64_t)v30;
    v51 = 2112;
    v52 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx marking uploaded %@%@", buf, 0x20u);

  }
  if (self->super._syncUpState == 3)
  {
    if (!v4)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.9();

    }
    v7 = -[BRCLocalItem isFinderBookmark](self, "isFinderBookmark");
    v8 = kBRRecordKeyFinderBookmarkContent;
    if (!v7)
      v8 = kBRRecordKeyFileContent;
    objc_msgSend(v4, "objectForKeyedSubscript:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pkgSignature"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v9, "signature");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v10;
    }
    v13 = v12;
    objc_msgSend(v11, "signature");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (self->_currentVersion)
      {
        if ((objc_msgSend(v9, "isRereferencedAssetUpload") & 1) != 0)
          goto LABEL_14;
        v14 = objc_msgSend(v9, "size");
        if (v14 == -[BRCVersion size](self->_currentVersion, "size"))
          goto LABEL_14;
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v31 = objc_msgSend(v9, "size");
          v32 = -[BRCVersion size](self->_currentVersion, "size");
          *(_DWORD *)buf = 134218498;
          v48 = (BRCDocumentItem *)v31;
          v49 = 2048;
          v50 = v32;
          v51 = 2112;
          v52 = v26;
          _os_log_fault_impl(&dword_230455000, v27, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK disagrees on the item size: %lld != %lld%@", buf, 0x20u);
        }
      }
      else
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          -[BRCLocalItem itemID](self, "itemID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCDocumentItem markUploadedWithRecord:].cold.1(v28, (uint64_t)v26, (uint64_t)buf, v27);
        }
      }

      -[BRCDocumentItem markNeedsReading](self, "markNeedsReading");
LABEL_36:

      goto LABEL_37;
    }
LABEL_14:
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v48 = self;
      v49 = 2112;
      v50 = (int64_t)v13;
      v51 = 2112;
      v52 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] marking uploaded %@, signature:%@%@", buf, 0x20u);
    }

    if ((v9 != 0) == (v10 != 0))
    {
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.8();

    }
    if (!v13)
    {
      brc_bread_crumbs();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.7();

    }
    currentVersion = self->_currentVersion;
    if (!currentVersion)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.6();

      currentVersion = self->_currentVersion;
    }
    -[BRCVersion contentSignature](currentVersion, "contentSignature", v45);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
    {
      v19 = -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");

      if (v19)
      {
LABEL_22:
        -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
        {
          v21 = -[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone");

          if (v21)
            goto LABEL_25;
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem markUploadedWithRecord:].cold.4();

        }
LABEL_25:
        -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (!v23)
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem markUploadedWithRecord:].cold.3();

        }
        -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", 0);
        -[BRCVersion setContentSignature:](self->_currentVersion, "setContentSignature:", v13);
        -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", v4);
        -[BRCVersion setThumbnailSignature:](self->_currentVersion, "setThumbnailSignature:", v45);
        -[BRCVersion setThumbnailSize:](self->_currentVersion, "setThumbnailSize:", objc_msgSend(v11, "size"));
        -[BRCLocalItem _markNeedsSyncingUp](self, "_markNeedsSyncingUp");
        if (!-[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
          -[BRCLocalVersion setUploadedAssets:](self->_currentVersion, "setUploadedAssets:", 0);
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[BRCDocumentItem markUploadedWithRecord:].cold.2((uint64_t)self);

        goto LABEL_36;
      }
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem markUploadedWithRecord:].cold.5();

    }
    goto LABEL_22;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[BRCDocumentItem markUploadedWithRecord:].cold.10();
LABEL_37:

  __brc_leave_section(v46);
}

- (void)markNeedsUploadOrSyncingUp
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.needsUpload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markOverQuotaWithError:(id)a3
{
  BRCLocalVersion *currentVersion;
  id v5;

  currentVersion = self->_currentVersion;
  v5 = a3;
  -[BRCLocalVersion _clearSignatures:isPackage:](currentVersion, "_clearSignatures:isPackage:", 3, -[BRCVersion isPackage](currentVersion, "isPackage"));
  self->super._syncUpState = 3;
  -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", v5);

}

- (void)_markAsDeadTombstoneWithPreviousGlobalID
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revertEtagsForOldZoneTombstone");

  v5.receiver = self;
  v5.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem _markAsDeadTombstoneWithPreviousGlobalID:](&v5, sel__markAsDeadTombstoneWithPreviousGlobalID_, v3);

}

- (void)_insertTombstoneForPreviousZoneGlobalID
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCLocalItem createSyncUpJob].cold.7();

  }
  v3 = (void *)-[BRCDocumentItem copy](self, "copy");
  objc_msgSend(v3, "_markAsDeadTombstoneWithPreviousGlobalID");
  objc_msgSend(v3, "markNeedsUploadOrSyncingUp");
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "existsByItemID:", v5);

  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "itemGlobalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Not inserting dead tombstone because the item was already revived for %@%@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v3, "saveToDB");
  }
  -[BRCAccountSessionFPFS applyScheduler](self->super._session, "applyScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rescheduleSuspendedJobsMatching:inState:", v11, 17);

  -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearCrossZoneMoveEtag");

  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearCrossZoneMoveEtag");

}

- (BOOL)supportsServerSideAssetCopies
{
  unint64_t localDiffs;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  BRCDocumentItem *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  localDiffs = self->super._localDiffs;
  if ((localDiffs & 0x180000) == 0)
  {
    -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "brc_signatureIsValid");

    if ((v5 & 1) != 0)
    {
      -[BRCClientZone mangledID](self->super._clientZone, "mangledID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v6) = objc_msgSend(v7, "supportsServerSideAssetCopies");
      return (char)v6;
    }
    localDiffs = self->super._localDiffs;
  }
  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "brc_signatureIsValid");

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = v9 != 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (localDiffs & 0x180000) != 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413314;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] skip supportsServerSideAssetCopies: has local diffs [%@], content signature [%@] valid [%@] --> NO\n item: %@%@", (uint8_t *)&v18, 0x34u);

  }
  return 0;
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:(id)a3
{
  id v4;
  void *v5;
  BRCAccountSessionFPFS *session;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCZoneRowID *v12;
  BRCZoneRowID *parentZoneRowID;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  BRCDocumentItem *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BRCDocumentItem *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint8_t buf[4];
  BRCDocumentItem *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:].cold.2();

  }
  if (!-[BRCDocumentItem supportsServerSideAssetCopies](self, "supportsServerSideAssetCopies"))
  {
    brc_bread_crumbs();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:].cold.1();

  }
  -[BRCLocalItem itemGlobalID](self, "itemGlobalID");
  v51 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemGlobalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  session = self->super._session;
  objc_msgSend(v5, "zoneRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo setParentID:](self->super._st, "setParentID:", v11);

  v50 = v5;
  objc_msgSend(v5, "zoneRowID");
  v12 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
  parentZoneRowID = self->super._parentZoneRowID;
  self->super._parentZoneRowID = v12;

  objc_storeStrong((id *)&self->super._clientZone, v9);
  self->super._serverZone = (BRCServerZone *)(id)objc_msgSend(v9, "serverZone");
  self->super._orig->_syncUpState = 0;
  if (v10)
  {
    objc_msgSend(v10, "zoneRowID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbRowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "br_isEqualToNumber:", v15);

    if (v16)
    {
      objc_msgSend(v10, "itemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serverItemByItemID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v53 = self;
        v54 = 2112;
        v55 = v18;
        v56 = 2112;
        v57 = v19;
        _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Item moved back into its original zone %@ si: %@%@", buf, 0x20u);
      }

      -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", 0);
      -[BRCAccountSessionFPFS syncUpScheduler](self->super._session, "syncUpScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "inFlightDiffsForItem:", self);

      if (v22)
      {
        v49 = v4;
        brc_bread_crumbs();
        v23 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v23;
          _os_log_impl(&dword_230455000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] Item has in-flight diffs in the current zone. We need to be sure to insert a tombstone%@", buf, 0xCu);
        }

        v25 = (void *)-[BRCDocumentItem copy](self, "copy");
        objc_msgSend(v25, "currentVersion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ckInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "clearCrossZoneMoveEtag");

        objc_msgSend(v25, "st");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "ckInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "clearCrossZoneMoveEtag");

        -[BRCLocalItem itemGlobalID](self->super._orig, "itemGlobalID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_restorePreviousGlobalID:", v30);

        objc_msgSend(v25, "markDead");
        objc_msgSend(v25, "markNeedsUploadOrSyncingUp");
        v4 = v49;
      }
      else
      {
        v25 = 0;
      }
      -[BRCStatInfo ckInfo](self->super._st, "ckInfo", v49);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "revertEtagsForOldZoneTombstone");

      -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "revertEtagsForOldZoneTombstone");

      objc_msgSend(v10, "itemID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v43, v18);

      -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
      v40 = v25;
      v33 = (void *)v51;
      if (!v22)
        goto LABEL_21;
LABEL_20:
      -[BRCLocalItem saveToDB](self, "saveToDB");
      objc_msgSend(v25, "saveToDB");
      v40 = v25;
      goto LABEL_21;
    }
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v53 = self;
      v54 = 2112;
      v55 = v35;
      _os_log_impl(&dword_230455000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] Item already has a previous zone so ignore the existing zone for %@%@", buf, 0x16u);
    }

    v33 = (void *)v51;
  }
  else
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v53 = self;
      v54 = 2112;
      v55 = v9;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_230455000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ moved into new zone which supports server side asset copies %@%@", buf, 0x20u);
    }

    v33 = (void *)v51;
    -[BRCLocalVersion setPreviousItemGlobalID:](self->_currentVersion, "setPreviousItemGlobalID:", v51);
    -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "markCrossZoneMoved");

    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "markCrossZoneMoved");
  }

  v37 = (void *)objc_opt_new();
  -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v37, 0);

  self->super._sharingOptions = objc_msgSend(v4, "sharingOptions") & 0x78;
  brc_bread_crumbs();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    BRCPrettyPrintBitmap();
    v44 = (BRCDocumentItem *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v53 = v44;
    v54 = 2112;
    v55 = v4;
    v56 = 2112;
    v57 = v38;
    _os_log_debug_impl(&dword_230455000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);

  }
  -[BRCDocumentItem markNeedsUploadOrSyncingUp](self, "markNeedsUploadOrSyncingUp");
  v25 = 0;
  v40 = 0;
  if (!v10)
    goto LABEL_20;
LABEL_21:

}

- (void)_crossZoneMoveToParent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BRCAccountSessionFPFS *session;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BRCZoneRowID *v23;
  BRCZoneRowID *parentZoneRowID;
  void *v25;
  void *v26;
  NSObject *v27;
  BRCPQLConnection *db;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCLocalItem clientZone](self, "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enhancedDrivePrivacyEnabled");
  objc_msgSend(v4, "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "enhancedDrivePrivacyEnabled");

  if (!-[BRCDocumentItem supportsServerSideAssetCopies](self, "supportsServerSideAssetCopies") || (v8 & 1) != 0)
  {
    if ((self->super._localDiffs & 0x180000) == 0)
    {
      -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "brc_signatureIsValid");

      if (((v10 ^ 1 | v8) & 1) == 0)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[BRCDocumentItem _crossZoneMoveToParent:].cold.2();

      }
    }
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCDocumentItem _crossZoneMoveToParent:].cold.1((uint64_t)self);

    v15 = (void *)-[BRCDocumentItem copy](self, "copy");
    objc_msgSend(v15, "markDead");
    objc_msgSend(v15, "itemGlobalID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_restorePreviousGlobalID:", v16);

    objc_msgSend(v15, "markNeedsUploadOrSyncingUp");
    objc_msgSend(v4, "itemGlobalID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    session = self->super._session;
    objc_msgSend(v17, "zoneRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clientZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "itemID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCStatInfo setParentID:](self->super._st, "setParentID:", v22);

    objc_msgSend(v17, "zoneRowID");
    v23 = (BRCZoneRowID *)objc_claimAutoreleasedReturnValue();
    parentZoneRowID = self->super._parentZoneRowID;
    self->super._parentZoneRowID = v23;

    objc_storeStrong((id *)&self->super._clientZone, v21);
    self->super._serverZone = (BRCServerZone *)(id)objc_msgSend(v21, "serverZone");
    self->super._orig->_syncUpState = 0;
    v25 = (void *)objc_opt_new();
    -[BRCLocalItem learnItemID:serverItem:](self, "learnItemID:serverItem:", v25, 0);

    -[BRCDocumentItem markItemForgottenByServer](self, "markItemForgottenByServer");
    self->super._sharingOptions = objc_msgSend(v4, "sharingOptions") & 0x78;
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      BRCPrettyPrintBitmap();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v30;
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v26;
      _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] learning sharing options %@ from parent %@%@", buf, 0x20u);

    }
    -[BRCDocumentItem markForceUpload](self, "markForceUpload");
    db = self->super._db;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __42__BRCDocumentItem__crossZoneMoveToParent___block_invoke;
    v31[3] = &unk_24FE41988;
    v31[4] = self;
    v32 = v15;
    v29 = v15;
    -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v31);

  }
  else
  {
    -[BRCDocumentItem markCrossZoneMovedForServerAssetCopyWithParentItem:](self, "markCrossZoneMovedForServerAssetCopyWithParentItem:", v4);
  }

}

uint64_t __42__BRCDocumentItem__crossZoneMoveToParent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "saveToDB");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "saveToDB");
  return result;
}

- (BOOL)contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:(BOOL)a3
{
  BOOL v3;
  void *v4;
  void *v5;

  if (a3 || (self->super._localDiffs & 0x900000) != 0)
    return 1;
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "etag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 == 0;

  return v3;
}

- (NSDictionary)conflictLoserState
{
  void *v3;
  NSMutableSet *resolvedConflictLoserEtags;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableSet count](self->_resolvedConflictLoserEtags, "count");
  if (v3)
  {
    resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
    v6 = CFSTR("r");
    v7[0] = resolvedConflictLoserEtags;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDictionary *)v3;
}

- (void)addResolvedConflictLoserEtag:(id)a3
{
  NSMutableSet *resolvedConflictLoserEtags;
  NSMutableSet *v4;
  objc_class *v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;

  resolvedConflictLoserEtags = self->_resolvedConflictLoserEtags;
  if (resolvedConflictLoserEtags)
  {
    v9 = (NSMutableSet *)a3;
    -[NSMutableSet addObject:](resolvedConflictLoserEtags, "addObject:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x24BDBCEF0];
    v7 = a3;
    v8 = (NSMutableSet *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    v4 = self->_resolvedConflictLoserEtags;
    self->_resolvedConflictLoserEtags = v8;
  }

}

- (void)_updateUploadJobIfNeededWithDiffs:(unint64_t)a3
{
  BRCClientZone *clientZone;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unsigned int syncUpState;
  void *generationIDForUpload;
  void *v16;
  void *v17;
  void *v18;
  NSNumber *fileIDForUpload;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24[3];

  if (self->super._syncUpState == 3)
  {
    if (-[BRCLocalVersion shouldRecreateUploadJobGivenDiffs:](self->_currentVersion, "shouldRecreateUploadJobGivenDiffs:", a3)|| (clientZone = self->super._clientZone, -[BRCLocalItem clientZone](self->super._orig, "clientZone"), v6 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v6), v6, (clientZone & 1) == 0))
    {
      -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelAndCleanupItemUpload:", self);

LABEL_7:
      memset(v24, 0, sizeof(v24));
      __brc_create_section(0, (uint64_t)"-[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:]", 1667, v24);
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:].cold.3();

      if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
      {
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          -[BRCLocalItem createSyncUpJob].cold.7();

      }
      -[BRCAccountSessionFPFS syncUpScheduler](self->super._session, "syncUpScheduler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem serverZone](self, "serverZone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dbRowID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isItemInSyncUpAndInFlight:inZone:", self, v12);

      syncUpState = self->super._syncUpState;
      if (syncUpState == 3)
      {
        if (-[BRCLocalItem isDead](self, "isDead"))
        {
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:].cold.1();

        }
        -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
        if (v13)
        {
          generationIDForUpload = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(generationIDForUpload, "setState:forItem:", 31, self);
        }
        else
        {
          generationIDForUpload = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(generationIDForUpload, "uploadItem:", self);
        }
      }
      else if (syncUpState == 4)
      {
        -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
        generationIDForUpload = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(generationIDForUpload, "setState:forItem:", 31, self);
      }
      else
      {
        -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cancelAndCleanupItemUpload:", self);

        if (!self->_fileIDForUpload || -[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS"))
          goto LABEL_21;
        -[BRCAccountSessionFPFS stageRegistry](self->super._session, "stageRegistry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem liveStageFilename](self, "liveStageFilename");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "unlinkLiveStageFilename:", v18);

        fileIDForUpload = self->_fileIDForUpload;
        self->_fileIDForUpload = 0;

        generationIDForUpload = self->_generationIDForUpload;
        self->_generationIDForUpload = 0;
      }

LABEL_21:
      __brc_leave_section(v24);
      return;
    }
  }
  if ((a3 & 0x20000000000000) != 0)
    goto LABEL_7;
}

- (BOOL)_nukePackageItemsFromDB:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  unint64_t dbRowID;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "execute:", CFSTR("DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu"), self->super._dbRowID);
  if (v5 && objc_msgSend(v4, "changes") >= 1)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v4, "changes");
      dbRowID = self->super._dbRowID;
      *(_DWORD *)buf = 134218498;
      v14 = v9;
      v15 = 2048;
      v16 = dbRowID;
      v17 = 2112;
      v18 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg [%llu]%@", buf, 0x20u);
    }

    if ((-[BRCPQLConnection isBatchSuspended](self->super._db, "isBatchSuspended") & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem createSyncUpJob].cold.7();

    }
  }

  return v5;
}

- (void)_updateRecursivePropertiesInDB:(id)a3 dbRowID:(unint64_t)a4 diffs:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  int v31;
  int v32;
  void *v33;
  BRCItemID *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v40;
  BRCItemID *itemID;
  void *v42;
  NSObject *v43;
  _BOOL4 v44;
  uint64_t v45;
  _BOOL8 v46;
  _BOOL8 v47;
  _BOOL8 v48;
  uint64_t v49;
  _BOOL8 v50;
  void *v51;
  uint8_t buf[4];
  BRCItemID *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  _BOOL8 v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  _BOOL8 v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if ((objc_msgSend(v7, "isBatchSuspended") & 1) == 0)
  {
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.3();

  }
  -[BRCLocalItem asDocument](self->super._orig, "asDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->super._sharingOptions & 4) != 0
    || (-[BRCLocalItem sharingOptions](self->super._orig, "sharingOptions") & 4) != 0)
  {
    v9 = 1073741826;
  }
  else
  {
    v9 = 2;
  }
  if (((v9 & 0xFFFFFFFFFFFFLL | 0x22000000000000) & a5) != 0
    || (-[BRCLocalItem clientZone](self->super._orig, "clientZone"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToClientZone:", self->super._clientZone),
        v10,
        (v11 & 1) == 0))
  {
    if (-[BRCLocalItem needsUpload](self, "needsUpload"))
    {
      -[BRCDocumentItem currentVersion](self, "currentVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "size");

      v14 = 1;
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
    v15 = -[BRCLocalItem needsSyncUp](self, "needsSyncUp");
    v16 = -[BRCLocalItem needsUpload](self->super._orig, "needsUpload");
    if (v16 != -[BRCLocalItem needsUpload](self, "needsUpload")
      && -[BRCLocalItem needsUpload](self->super._orig, "needsUpload")
      && -[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
    {
      objc_msgSend(v8, "currentVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "size");

    }
    else
    {
      v18 = 0;
    }
    v19 = -[BRCLocalItem needsSyncUp](self->super._orig, "needsSyncUp");
    if (v19 == -[BRCLocalItem needsSyncUp](self, "needsSyncUp"))
      v20 = 0;
    else
      v20 = -[BRCLocalItem needsSyncUp](self->super._orig, "needsSyncUp");
    v50 = v15;
    -[BRCDocumentItem uploadError](self, "uploadError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "brc_isCloudKitOutOfQuota");

    v23 = v22;
    if ((self->super._sharingOptions & 4) != 0)
    {
      v24 = -[BRCServerZone isSharedZone](self->super._serverZone, "isSharedZone");
      v48 = !v24;
      v47 = v24;
    }
    else
    {
      v47 = 0;
      v48 = 0;
    }
    v51 = v8;
    v44 = -[BRCLocalItem isAlmostDead](self, "isAlmostDead");
    if (v13)
      v25 = 1;
    else
      v25 = v14;
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      itemID = self->super._itemID;
      *(_DWORD *)buf = 138414338;
      v54 = itemID;
      v55 = 2048;
      v56 = v23;
      v57 = 2048;
      v58 = v25;
      v59 = 2048;
      v60 = v13;
      v61 = 2048;
      v62 = v18 != 0;
      v63 = 2048;
      v64 = v18;
      v65 = 2048;
      v66 = v50;
      v67 = 2048;
      v68 = v20;
      v69 = 2112;
      v70 = v26;
      _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] updating recursive properties starting from document %@:\n quota:    %lld\n upload:   {needs:(count:%lld size:%lld) done:(count:%lld size:%lld)}\n sync-up:  {needs:%lld done:%lld}\n%@", buf, 0x5Cu);
    }
    v45 = v25;
    v46 = v18 != 0;
    v49 = v18;
    v28 = v13;

    v29 = -[BRCStatInfo type](self->super._st, "type");
    if (v29 == 8 || v29 == 2)
      v31 = 1;
    else
      v31 = v29;
    if (v31 == 7)
      v32 = 6;
    else
      v32 = v31;
    -[BRCStatInfo parentID](self->super._st, "parentID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = self->super._itemID;
    -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem parentClientZone](self, "parentClientZone");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dbRowID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v7, "execute:", CFSTR("INSERT OR IGNORE INTO item_recursive_properties (item_rowid, item_parent_id, item_id, zone_rowid, item_type, item_parent_zone_rowid) VALUES  (%lld, %@, %@, %@, %d, %@)"), a4, v33, v34, v35, v32, v37);

    if ((v38 & 1) == 0)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.1();
      v8 = v51;
      goto LABEL_43;
    }
    v8 = v51;
    if ((objc_msgSend(v7, "execute:", CFSTR("UPDATE item_recursive_properties SET  dir_faults_count = %lld, uploaded_size = %lld, needs_upload_size = %lld, uploaded_count = %lld, needs_upload_count = %lld, synced_up_count = %lld, needs_sync_up_count = %lld, over_quota_count = %lld, shared_by_me_count = %lld, shared_to_me_count = %lld, needs_delete_doc_count = %lld  WHERE item_rowid = %llu "), 0, v49, v28, v46, v45, v20, v50, v23, v48, v47, v44, a4) & 1) == 0)
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:].cold.1();
LABEL_43:

    }
  }

}

- (BOOL)_insertInDB:(id)a3 dbRowID:(unint64_t)a4
{
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  int64_t v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  _BOOL4 v34;
  const __CFString *v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  int v39;
  int v40;
  int v41;
  _BOOL8 isUserVisible;
  NSNumber *minimumSupportedOSRowID;
  unint64_t localDiffs;
  unint64_t notifsRank;
  uint64_t syncUpState;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  objc_super v72;

  v71 = a3;
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dbRowID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[BRCStatInfo state](self->super._st, "state");
  v40 = -[BRCStatInfo type](self->super._st, "type");
  v39 = -[BRCStatInfo mode](self->super._st, "mode");
  v38 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v37 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v36 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v35 = logicalName;
  v34 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v33 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BRCVersion mtime](self->_currentVersion, "mtime");
  v23 = -[BRCVersion size](self->_currentVersion, "size");
  v21 = -[BRCVersion thumbnailSize](self->_currentVersion, "thumbnailSize");
  -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion xattrSignature](self->_currentVersion, "xattrSignature");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion lastEditorDeviceOrUserRowID](self->_currentVersion, "lastEditorDeviceOrUserRowID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion quarantineInfo](self->_currentVersion, "quarantineInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "brc_strippedError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "zoneRowID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BRCLocalVersion localChangeCount](self->_currentVersion, "localChangeCount");
  -[BRCLocalVersion oldVersionIdentifier](self->_currentVersion, "oldVersionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem conflictLoserState](self, "conflictLoserState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem fileIDForUpload](self, "fileIDForUpload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem generationIDForUpload](self, "generationIDForUpload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v71, "execute:", CFSTR("INSERT INTO client_items(rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation) VALUES(%lld, %@, %@, %@, %ld, %@, %@, %d, %lld, %lld, %@, %@, %d, %@, %d, %d, %d, %lld, %lld, %lld, %@, %@, %d, %@, %@, %@, %@, %@, %@, %@, %@, %d, %llu, %@, %@, %@, %@, %lld, %lld, %lld, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %llu, %@, %@, %@, %@)"), a4, v70, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v69, minimumSupportedOSRowID, isUserVisible, v66, v41, v40,
          v39,
          v38,
          v37,
          v36,
          v68,
          v35,
          v34,
          v65,
          v67,
          v64,
          v63,
          v62,
          v59,
          v61,
          v60,
          v29,
          v33,
          v56,
          v57,
          v58,
          v55,
          v25,
          v23,
          v21,
          v32,
          v18,
          v30,
          v28,
          v27,
          v17,
          v24,
          v20,
          v19,
          v7,
          v16,
          v8,
          v15,
          v14,
          v13,
          v9);

  if (v52
    && (v72.receiver = self,
        v72.super_class = (Class)BRCDocumentItem,
        -[BRCLocalItem _insertInDB:dbRowID:](&v72, sel__insertInDB_dbRowID_, v71, a4)))
  {
    -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:](self, "_updateUploadJobIfNeededWithDiffs:", 0xFF003FF3FF7FFFLL);
    -[BRCAccountSessionFPFS globalProgress](self->super._session, "globalProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didUpdateDocument:", self);

    -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:](self, "_updateRecursivePropertiesInDB:dbRowID:diffs:", v71, a4, 0xFF003FF3FF7FFFLL);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6;
  BRCClientZone *clientZone;
  void *v8;
  void *v9;
  NSObject *v10;
  BRCItemDBRowIDAndZoneJobIdentifier *v11;
  unint64_t dbRowID;
  void *v13;
  void *v14;
  BRCItemDBRowIDAndZoneJobIdentifier *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BRCLocalStatInfo *st;
  const __CFString *logicalName;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  BRCLocalItem *orig;
  void *v49;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int64_t v59;
  void *v60;
  int64_t v61;
  int64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  unint64_t v69;
  int64_t v70;
  _BOOL4 v71;
  const __CFString *v72;
  int64_t v73;
  int64_t v74;
  int v75;
  int v76;
  int v77;
  NSNumber *minimumSupportedOSRowID;
  _BOOL8 isUserVisible;
  unint64_t notifsRank;
  uint64_t syncUpState;
  unint64_t localDiffs;
  BRCZoneRowID *parentZoneRowID;
  BRFieldCKInfo *sideCarCKInfo;
  unint64_t sharingOptions;
  BRCUserRowID *ownerKey;
  BRCItemID *itemID;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  objc_super v108;
  uint8_t buf[4];
  uint64_t v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((a4 & 0x100000000) != 0 && -[BRCLocalItem isDead](self, "isDead"))
    -[BRCDocumentItem _nukePackageItemsFromDB:](self, "_nukePackageItemsFromDB:", v6);
  v107 = v6;
  if (-[BRCDocumentItem isDocumentBeingCopiedToNewZone](self, "isDocumentBeingCopiedToNewZone")
    || -[BRCLocalItem isDocumentBeingCopiedToNewZone](self->super._orig, "isDocumentBeingCopiedToNewZone"))
  {
    clientZone = self->super._clientZone;
    -[BRCLocalItem clientZone](self->super._orig, "clientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(clientZone) = -[BRCClientZone isEqualToClientZone:](clientZone, "isEqualToClientZone:", v8);

    if ((clientZone & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCDocumentItem _updateInDB:diffs:].cold.1();

      v11 = [BRCItemDBRowIDAndZoneJobIdentifier alloc];
      dbRowID = self->super._dbRowID;
      -[BRCLocalItem clientZone](self->super._orig, "clientZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dbRowID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[BRCItemDBRowIDAndZoneJobIdentifier initWithItemDBRowID:zoneRowID:](v11, "initWithItemDBRowID:zoneRowID:", dbRowID, v14);

      -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deleteJobsMatching:", v15);

      -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deleteJobsMatching:", v15);

    }
  }
  -[BRCDocumentItem _updateUploadJobIfNeededWithDiffs:](self, "_updateUploadJobIfNeededWithDiffs:", a4);
  v51 = a4;
  if ((a4 & 0x2010000) != 0)
  {
    -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rescheduleJobsPendingWinnerForItem:", self);

    }
  }
  -[BRCClientZone dbRowID](self->super._clientZone, "dbRowID");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->super._itemID;
  ownerKey = self->super._ownerKey;
  sharingOptions = self->super._sharingOptions;
  sideCarCKInfo = self->super._sideCarCKInfo;
  parentZoneRowID = self->super._parentZoneRowID;
  localDiffs = self->super._localDiffs;
  notifsRank = self->super._notifsRank;
  syncUpState = self->super._syncUpState;
  -[BRCLocalItem appLibrary](self, "appLibrary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "dbRowID");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  minimumSupportedOSRowID = self->super._minimumSupportedOSRowID;
  isUserVisible = self->super._isUserVisible;
  -[BRCStatInfo ckInfo](self->super._st, "ckInfo");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = -[BRCStatInfo state](self->super._st, "state");
  v76 = -[BRCStatInfo type](self->super._st, "type");
  v75 = -[BRCStatInfo mode](self->super._st, "mode");
  v74 = -[BRCStatInfo birthtime](self->super._st, "birthtime");
  v73 = -[BRCStatInfo lastUsedTime](self->super._st, "lastUsedTime");
  v70 = -[BRCStatInfo favoriteRank](self->super._st, "favoriteRank");
  -[BRCStatInfo parentID](self->super._st, "parentID");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  st = self->super._st;
  logicalName = (const __CFString *)st->super._logicalName;
  if (!logicalName)
    logicalName = &stru_24FE4A790;
  v72 = logicalName;
  v71 = -[BRCStatInfo isHiddenExt](st, "isHiddenExt");
  -[BRCStatInfo finderTags](self->super._st, "finderTags");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo xattrSignature](self->super._st, "xattrSignature");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackPath](self->super._st, "trashPutBackPath");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo trashPutBackParentID](self->super._st, "trashPutBackParentID");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo aliasTarget](self->super._st, "aliasTarget");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStatInfo creatorRowID](self->super._st, "creatorRowID");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo processingStamp](self->super._st, "processingStamp");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo rawBouncedLogicalName](self->super._st, "rawBouncedLogicalName");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[BRCLocalStatInfo itemScope](self->super._st, "itemScope");
  v69 = -[BRCLocalStatInfo localChangeCount](self->super._st, "localChangeCount");
  -[BRCLocalStatInfo oldVersionIdentifier](self->super._st, "oldVersionIdentifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalStatInfo fpCreationItemIdentifier](self->super._st, "fpCreationItemIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion originalPOSIXName](self->_currentVersion, "originalPOSIXName");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[BRCVersion mtime](self->_currentVersion, "mtime");
  v61 = -[BRCVersion size](self->_currentVersion, "size");
  v59 = -[BRCVersion thumbnailSize](self->_currentVersion, "thumbnailSize");
  -[BRCVersion thumbnailSignature](self->_currentVersion, "thumbnailSignature");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion contentSignature](self->_currentVersion, "contentSignature");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion xattrSignature](self->_currentVersion, "xattrSignature");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion lastEditorDeviceOrUserRowID](self->_currentVersion, "lastEditorDeviceOrUserRowID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion conflictLoserEtags](self->_currentVersion, "conflictLoserEtags");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCVersion quarantineInfo](self->_currentVersion, "quarantineInfo");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadedAssets](self->_currentVersion, "uploadedAssets");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "brc_strippedError");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "itemID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCLocalVersion previousItemGlobalID](self->_currentVersion, "previousItemGlobalID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "zoneRowID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BRCLocalVersion localChangeCount](self->_currentVersion, "localChangeCount");
  -[BRCLocalVersion oldVersionIdentifier](self->_currentVersion, "oldVersionIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem conflictLoserState](self, "conflictLoserState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem fileIDForUpload](self, "fileIDForUpload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDocumentItem generationIDForUpload](self, "generationIDForUpload");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v107, "execute:", CFSTR("UPDATE client_items SET  zone_rowid = %@, item_id = %@, item_creator_id = %@, item_sharing_options = %ld, item_side_car_ckinfo = %@, item_parent_zone_rowid = %@, item_localsyncupstate = %d, item_local_diffs = %llu, item_notifs_rank = %lld, app_library_rowid = %@, item_min_supported_os_rowid = %@, item_user_visible = %d, item_stat_ckinfo = %@, item_state = %d, item_type = %d, item_mode = %d, item_birthtime = %lld, item_lastusedtime = %lld, item_favoriterank = %lld, item_parent_id = %@, item_filename = %@, item_hidden_ext = %d, item_finder_tags = %@, item_xattr_signature = %@, item_trash_put_back_path = %@, item_trash_put_back_parent_id = %@, item_alias_target = %@, item_creator = %@, item_processing_stamp = %@, item_bouncedname = %@, item_scope = %d,item_local_change_count = %llu, item_old_version_identifier = %@,fp_creation_item_identifier = %@, version_name = %@, version_ckinfo = %@, version_mtime = %lld, version_size = %lld, version_thumb_size = %lld, version_thumb_signature = %@, version_content_signature = %@, version_xattr_signature = %@, version_edited_since_shared = %@, version_device = %@, version_conflict_loser_etags = %@, version_quarantine_info = %@, version_uploaded_assets = %@, version_upload_error = %@, version_old_zone_item_id = %@, version_old_zone_rowid = %@, version_local_change_count = %llu, version_old_version_identifier = %@, item_live_conflict_loser_etags = %@, item_file_id = %@, item_generation = %@  WHERE rowid = %llu"), v106, itemID, ownerKey, sharingOptions, sideCarCKInfo, parentZoneRowID, syncUpState, localDiffs, notifsRank, v105, minimumSupportedOSRowID, isUserVisible, v104, v77, v76, v75,
          v74,
          v73,
          v70,
          v96,
          v72,
          v71,
          v102,
          v101,
          v99,
          v103,
          v100,
          v98,
          v97,
          v93,
          v68,
          v69,
          v95,
          v91,
          v94,
          v92,
          v62,
          v61,
          v59,
          v56,
          v67,
          v90,
          v65,
          v55,
          v54,
          v63,
          v58,
          v57,
          v23,
          v24,
          v25,
          v53,
          v26,
          v27,
          v52,
          self->super._dbRowID);

  if (v88)
  {
    v28 = v51;
    -[BRCDocumentItem _updateRecursivePropertiesInDB:dbRowID:diffs:](self, "_updateRecursivePropertiesInDB:dbRowID:diffs:", v107, self->super._dbRowID, v51);
    if ((v51 & 0x100000) != 0)
    {
      -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:", self, 0, 0, 1, 1);

    }
    if ((v51 & 0x80000000) != 0)
    {
      -[BRCAccountSessionFPFS applyScheduler](self->super._session, "applyScheduler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem unsaltedBookmarkData](self, "unsaltedBookmarkData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v107, "fetch:", CFSTR("SELECT zone_rowid, item_rank FROM server_items WHERE item_alias_target = %@ AND item_type = 3"), v31);

      if (objc_msgSend(v32, "next"))
      {
        do
        {
          objc_msgSend(v32, "numberAtIndex:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSessionFPFS serverZoneByRowID:](self->super._session, "serverZoneByRowID:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v32, "longLongAtIndex:", 1);
          brc_bread_crumbs();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v34, "zoneName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v110 = v35;
            v111 = 2112;
            v112 = v38;
            v113 = 2112;
            v114 = v36;
            _os_log_debug_impl(&dword_230455000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: Rescheduling reverse-alias in %@%@", buf, 0x20u);

          }
          objc_msgSend(v30, "setState:andApplyKind:forRank:zoneRowID:", 1, 1, v35, v33);

        }
        while ((objc_msgSend(v32, "next") & 1) != 0);
      }

      v28 = v51;
    }
    -[BRCDocumentItem _updateReadThrottleIfNeededForRowID:forCreation:](self, "_updateReadThrottleIfNeededForRowID:forCreation:", self->super._dbRowID, 0);
    -[BRCLocalItem session](self, "session");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "globalProgress");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "didUpdateDocument:", self);

    -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem asDocument](self->super._orig, "asDocument");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "currentVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "uploadError");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[BRCDocumentItem _needsSyncBubbleRecomputeForError:origError:](self, "_needsSyncBubbleRecomputeForError:origError:", v43, v46);

    if (v47)
      -[BRCClientZone recomputeAllItemsDidUploadState](self->super._clientZone, "recomputeAllItemsDidUploadState");
    orig = self->super._orig;
    v40 = v107;
    if (orig && !-[BRCLocalItem isOnDisk](orig, "isOnDisk") && -[BRCLocalItem isOnDisk](self, "isOnDisk"))
    {
      -[BRCAccountSessionFPFS applyScheduler](self->super._session, "applyScheduler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "rescheduleMissingTargetAliasesWithTarget:", self);

    }
    v108.receiver = self;
    v108.super_class = (Class)BRCDocumentItem;
    v39 = -[BRCLocalItem _updateInDB:diffs:](&v108, sel__updateInDB_diffs_, v107, v28);
  }
  else
  {
    v39 = 0;
    v40 = v107;
  }

  return v39;
}

- (BOOL)_needsSyncBubbleRecomputeForError:(id)a3 origError:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "brc_isEverRetriable") & 1) != 0
    || v6 && (objc_msgSend(v6, "brc_isEverRetriable") & 1) == 0)
  {
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retrySyncBubbleLaterIfNeededWithError:", v5);

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_deleteFromDB:(id)a3 keepAliases:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  unsigned int v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[BRCDocumentItem _nukePackageItemsFromDB:](self, "_nukePackageItemsFromDB:", v6))
  {
    if (self->super._dbRowID)
    {
      -[BRCLocalItem session](self, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "globalProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didDeleteDocument:", self);

      -[BRCLocalItem clientZone](self, "clientZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem itemID](self, "itemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "popOnDiskBlockForItemID:", v10);
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v11)
        v11[2](v11, 0);
      -[BRCLocalItem clientZone](self, "clientZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalItem itemID](self, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "popDownloadedBlockForItemID:", v13);
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v14)
        ((void (**)(_QWORD, BRCDocumentItem *))v14)[2](v14, self);
      if (-[BRCLocalItem isDocumentBeingCopiedToNewZone](self->super._orig, "isDocumentBeingCopiedToNewZone"))
      {
        -[BRCLocalItem clientZone](self, "clientZone");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dbRowID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCLocalItem asDocument](self->super._orig, "asDocument");
        v31 = v4;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentVersion");
        v30 = v14;
        v17 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "previousItemGlobalID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "zoneRowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v15, "br_isEqualToNumber:", v20);

        v11 = v17;
        v14 = v30;

        v4 = v31;
        if ((v21 & 1) == 0)
        {
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v22;
            _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Deleted item was copied from another zone, insert tombstone in the old zone%@", buf, 0xCu);
          }

          -[BRCLocalItem asDocument](self->super._orig, "asDocument");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_insertTombstoneForPreviousZoneGlobalID");

        }
      }
      -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deleteDownloadingJobForItem:", self);

      -[BRCAccountSessionFPFS fsUploader](self->super._session, "fsUploader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "deleteUploadingJobForItem:", self);

      v32.receiver = self;
      v32.super_class = (Class)BRCDocumentItem;
      v27 = -[BRCLocalItem _deleteFromDB:keepAliases:](&v32, sel__deleteFromDB_keepAliases_, v6, v4);

    }
    else
    {
      v27 = 1;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)startDownloadInTask:(id)a3 options:(unint64_t)a4 etagIfLoser:(id)a5 stageFileName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  BRCPQLConnection *db;
  char v15;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  id *v21;
  objc_super v22;

  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BRCDocumentItem;
  if (-[BRCLocalItem startDownloadInTask:options:etagIfLoser:stageFileName:error:](&v22, sel_startDownloadInTask_options_etagIfLoser_stageFileName_error_, a3, a4, v12, v13, a7))
  {
    db = self->super._db;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke;
    v17[3] = &unk_24FE42FF8;
    v17[4] = self;
    v20 = a4;
    v18 = v12;
    v19 = v13;
    v21 = a7;
    v15 = -[BRCPQLConnection groupInTransaction:](db, "groupInTransaction:", v17);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __79__BRCDocumentItem_startDownloadInTask_options_etagIfLoser_stageFileName_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1[4] + 8), "fsDownloader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:", a1[4], 0, a1[7], a1[5], a1[6], a1[8]);

  return v3;
}

- (BRCLocalVersion)currentVersion
{
  return self->_currentVersion;
}

- (NSSet)resolvedConflictLoserEtags
{
  return &self->_resolvedConflictLoserEtags->super;
}

- (NSNumber)fileIDForUpload
{
  return self->_fileIDForUpload;
}

- (BRCGenerationID)generationIDForUpload
{
  return self->_generationIDForUpload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationIDForUpload, 0);
  objc_storeStrong((id *)&self->_fileIDForUpload, 0);
  objc_storeStrong((id *)&self->_resolvedConflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

- (id)documentRecordID
{
  BRCItemID *itemID;
  void *v3;
  void *v4;

  itemID = self->super._itemID;
  -[BRCServerZone zoneID](self->super._serverZone, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID contentsRecordIDInZoneID:](itemID, "contentsRecordIDInZoneID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)baseRecord
{
  return -[BRCDocumentItem baseRecordClearAllFields:](self, "baseRecordClearAllFields:", 0);
}

- (id)baseRecordClearAllFields:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  __CFString *v6;
  objc_class *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = -[BRCLocalItem isFinderBookmark](self, "isFinderBookmark");
  v6 = CFSTR("content");
  if (v5)
    v6 = CFSTR("structure");
  v7 = (objc_class *)MEMORY[0x24BDB91D8];
  v8 = v6;
  v9 = [v7 alloc];
  -[BRCDocumentItem documentRecordID](self, "documentRecordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordType:recordID:", v8, v10);

  if (v3)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("fileContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("bookmarkContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgSignature"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgContent"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgXattrs"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgManifest"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("pkgSignature"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("thumb1024"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("thumbQLMetadata"));
  }
  return v11;
}

- (id)_initFromPQLResultSet:(id)a3 session:(id)a4 db:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v24;
  objc_super v25;

  v10 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCDocumentItem;
  v11 = -[BRCLocalItem _initFromPQLResultSet:session:db:error:](&v25, sel__initFromPQLResultSet_session_db_error_, v10, a4, a5, a6);
  if (v11)
  {
    v12 = -[BRCLocalVersion initFromResultSet:pos:]([BRCLocalVersion alloc], "initFromResultSet:pos:", v10, 35);
    v13 = (void *)*((_QWORD *)v11 + 25);
    *((_QWORD *)v11 + 25) = v12;

    if (objc_msgSend(*((id *)v11 + 9), "isExecutable")
      && (objc_msgSend(v11, "isDead") & 1) == 0
      && objc_msgSend(*((id *)v11 + 25), "isPackage"))
    {
      *(_BYTE *)(*((_QWORD *)v11 + 9) + 26) &= ~2u;
    }
    if (_allowedClassesForEtags_once != -1)
      dispatch_once(&_allowedClassesForEtags_once, &__block_literal_global_47);
    v14 = (id)_allowedClassesForEtags_allowedClasses;
    objc_msgSend(v10, "unarchivedObjectOfClasses:atIndex:", v14, 53);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("r"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mutableCopy");
      v18 = (void *)*((_QWORD *)v11 + 26);
      *((_QWORD *)v11 + 26) = v17;
    }
    else
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(BRCFPFSAdditions) _initFromPQLResultSet:session:db:error:].cold.1((uint64_t)v15);

      v16 = v15;
      v15 = 0;
    }

    objc_msgSend(v10, "numberAtIndex:", 54);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v11 + 27);
    *((_QWORD *)v11 + 27) = v19;

    objc_msgSend(v10, "objectOfClass:atIndex:", objc_opt_class(), 55);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v11 + 28);
    *((_QWORD *)v11 + 28) = v21;

  }
  return v11;
}

- (id)_initWithImportObject:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  BRCLocalVersion *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCDocumentItem;
  v7 = -[BRCLocalItem _initWithImportObject:error:](&v15, sel__initWithImportObject_error_, v6, a4);
  if (v7)
  {
    v8 = -[BRCLocalVersion initWithImportObject:]([BRCLocalVersion alloc], "initWithImportObject:", v6);
    v9 = (void *)v7[25];
    v7[25] = v8;

    if (objc_msgSend(v7, "_updatePackageItemsIfNecessaryWithImportObject:error:", v6, a4))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "fileID"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v7[27];
      v7[27] = v10;

      objc_msgSend(v6, "generationID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v7[28];
      v7[28] = v12;
    }
    else
    {
      v13 = v7;
      v7 = 0;
    }

  }
  return v7;
}

- (void)updateWithContentModificationDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  -[BRCVersion setMtime:](self->_currentVersion, "setMtime:", (uint64_t)v4);
}

- (BOOL)_updatePackageItemsIfNecessaryWithImportObject:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BRCPackageItem *v13;
  void *v14;
  BRCPackageItem *v15;
  id v16;
  int v17;
  char *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  char *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  char *v26;
  BOOL v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  const char *v36;
  const char *v37;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint64_t (*v40)(uint64_t, uint64_t);
  id obj;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint8_t v58[128];
  _BYTE v59[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  if (!-[BRCLocalItem needsInsert](self, "needsInsert")
    && !-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected")
    && !-[BRCPQLConnection execute:](self->super._db, "execute:", CFSTR("DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu"), self->super._dbRowID))
  {
    -[BRCPQLConnection lastError](self->super._db, "lastError");
    v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        v37 = "(passed to caller)";
        *(_DWORD *)v59 = 136315906;
        *(_QWORD *)&v59[4] = "-[BRCDocumentItem(BRCFPFSAdditions) _updatePackageItemsIfNecessaryWithImportObject:error:]";
        *(_WORD *)&v59[12] = 2080;
        if (!a4)
          v37 = "(ignored by caller)";
        *(_QWORD *)&v59[14] = v37;
        *(_WORD *)&v59[22] = 2112;
        v60 = v39;
        LOWORD(v61) = 2112;
        *(_QWORD *)((char *)&v61 + 2) = v32;
        _os_log_error_impl(&dword_230455000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v59, 0x2Au);
      }

    }
    if (!a4)
      goto LABEL_39;
    v40 = objc_retainAutorelease(v39);
    v27 = 0;
    *a4 = v40;

    goto LABEL_47;
  }
  if (!objc_msgSend(v43, "isPackageRoot"))
  {
    v27 = 1;
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v39 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v59 = 0;
  *(_QWORD *)&v59[8] = v59;
  *(_QWORD *)&v59[16] = 0x3032000000;
  v60 = __Block_byref_object_copy__37;
  *(_QWORD *)&v61 = __Block_byref_object_dispose__37;
  *((_QWORD *)&v61 + 1) = 0;
  objc_msgSend(v43, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __90__BRCDocumentItem_BRCFPFSAdditions___updatePackageItemsIfNecessaryWithImportObject_error___block_invoke;
  v49[3] = &unk_24FE41898;
  v49[4] = v59;
  objc_msgSend(v39, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 0, v49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (!v7)
  {

    v42 = 0;
    goto LABEL_33;
  }
  v8 = 0;
  v42 = 0;
  v9 = *(_QWORD *)v46;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v46 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x2348B9F14]();
      v13 = [BRCPackageItem alloc];
      objc_msgSend(v43, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v8;
      v15 = -[BRCPackageItem initWithURL:inPackage:forItem:error:](v13, "initWithURL:inPackage:forItem:error:", v11, v14, self, &v44);
      v16 = v44;

      if (v15)
      {
        if (-[BRCPackageItem saveToDBWithSession:](v15, "saveToDBWithSession:", self->super._session))
        {
          v17 = 0;
          v42 += -[BRCPackageItem size](v15, "size");
LABEL_23:
          v8 = v16;
          goto LABEL_24;
        }
        -[BRCAccountSessionFPFS clientDB](self->super._session, "clientDB");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastError");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        brc_bread_crumbs();
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          v51 = (const char *)v8;
          v52 = 2112;
          v53 = v22;
          _os_log_error_impl(&dword_230455000, v23, (os_log_type_t)0x90u, "[ERROR] Failed saving package item to db - %@%@", buf, 0x16u);
        }

        v17 = 6;
      }
      else
      {
        if (!objc_msgSend(v16, "br_isCloudDocsErrorCode:", 43))
        {
          brc_bread_crumbs();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
          {
            objc_msgSend(v11, "path");
            v26 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v51 = v26;
            v52 = 2112;
            v53 = (const char *)v16;
            v54 = 2112;
            v55 = v24;
            _os_log_error_impl(&dword_230455000, v25, (os_log_type_t)0x90u, "[ERROR] Couldn't create import item for %@ - %@%@", buf, 0x20u);

          }
          v17 = 6;
          goto LABEL_23;
        }
        brc_bread_crumbs();
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "path");
          v20 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = v20;
          v52 = 2112;
          v53 = v18;
          _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring excluded package item from sync %@%@", buf, 0x16u);

        }
        v8 = 0;
        v17 = 7;
      }
LABEL_24:

      objc_autoreleasePoolPop(v12);
      if (v17 != 7 && v17)
        goto LABEL_28;
      ++v10;
    }
    while (v7 != v10);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  }
  while (v7);
LABEL_28:

  if (v8)
  {
    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
    goto LABEL_38;
  }
LABEL_33:
  v28 = *(void **)(*(_QWORD *)&v59[8] + 40);
  if (v28)
  {
    v29 = v28;
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v51 = "-[BRCDocumentItem(BRCFPFSAdditions) _updatePackageItemsIfNecessaryWithImportObject:error:]";
      v52 = 2080;
      if (!a4)
        v36 = "(ignored by caller)";
      v53 = v36;
      v54 = 2112;
      v55 = v29;
      v56 = 2112;
      v57 = v30;
      _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v29);

    v8 = 0;
LABEL_38:

    _Block_object_dispose(v59, 8);
LABEL_39:
    v27 = 0;
  }
  else
  {
    -[BRCDocumentItem currentVersion](self, "currentVersion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "updateWithPackageSize:", v42);

    _Block_object_dispose(v59, 8);
    v27 = 1;
  }

LABEL_47:
  return v27;
}

uint64_t __90__BRCDocumentItem_BRCFPFSAdditions___updatePackageItemsIfNecessaryWithImportObject_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] Failed enumerating item at url %@ - %@%@", (uint8_t *)&v11, 0x20u);

  }
  return 0;
}

- (void)markDoneMigratingToFPFS
{
  NSNumber *fileIDForUpload;
  BRCGenerationID *generationIDForUpload;
  objc_super v5;

  if (-[BRCLocalItem isMigratingToFPFS](self, "isMigratingToFPFS"))
  {
    v5.receiver = self;
    v5.super_class = (Class)BRCDocumentItem;
    -[BRCLocalItem markDoneMigratingToFPFS](&v5, sel_markDoneMigratingToFPFS);
    fileIDForUpload = self->_fileIDForUpload;
    self->_fileIDForUpload = 0;

    generationIDForUpload = self->_generationIDForUpload;
    self->_generationIDForUpload = 0;

  }
}

- (BOOL)updateWithImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSNumber *v9;
  NSNumber *fileIDForUpload;
  BRCGenerationID *v11;
  BRCGenerationID *generationIDForUpload;
  BOOL v13;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  if (-[BRCDocumentItem _updatePackageItemsIfNecessaryWithImportObject:error:](self, "_updatePackageItemsIfNecessaryWithImportObject:error:", v8, a5))
  {
    -[BRCLocalVersion updateWithImportObject:onlyContentDependentProperties:](self->_currentVersion, "updateWithImportObject:onlyContentDependentProperties:", v8, v6);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "fileID"));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fileIDForUpload = self->_fileIDForUpload;
    self->_fileIDForUpload = v9;

    objc_msgSend(v8, "generationID");
    v11 = (BRCGenerationID *)objc_claimAutoreleasedReturnValue();
    generationIDForUpload = self->_generationIDForUpload;
    self->_generationIDForUpload = v11;

    v15.receiver = self;
    v15.super_class = (Class)BRCDocumentItem;
    v13 = -[BRCLocalItem updateWithImportObject:onlyContentDependentProperties:error:](&v15, sel_updateWithImportObject_onlyContentDependentProperties_error_, v8, v6, a5);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4
{
  -[BRCDocumentItem updateWithLogicalName:newParent:forceTopLevelShareMove:](self, "updateWithLogicalName:newParent:forceTopLevelShareMove:", a3, a4, 0);
}

- (void)updateWithLogicalName:(id)a3 newParent:(id)a4 forceTopLevelShareMove:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v8 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCDocumentItem;
  -[BRCLocalItem updateWithLogicalName:newParent:forceTopLevelShareMove:](&v9, sel_updateWithLogicalName_newParent_forceTopLevelShareMove_, v8, a4, v5);
  if (-[BRCDocumentItem hasShareIDAndIsOwnedByMe](self, "hasShareIDAndIsOwnedByMe"))
    -[BRCVersion setOriginalPOSIXName:](self->_currentVersion, "setOriginalPOSIXName:", v8);

}

- (void)reIngestFromFileProvider
{
  void *v3;
  BRCAccountSessionFPFS *v4;
  NSNumber *fileIDForUpload;
  BRCGenerationID *generationIDForUpload;
  void *v7;
  BRCAccountSessionFPFS *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BRCAccountSessionFPFS *v12;

  self->super._syncUpState = 7;
  -[BRCLocalItem fileObjectID](self, "fileObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->super._session;
  fileIDForUpload = self->_fileIDForUpload;
  self->_fileIDForUpload = 0;

  generationIDForUpload = self->_generationIDForUpload;
  self->_generationIDForUpload = 0;

  objc_msgSend(v3, "asString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke;
  v10[3] = &unk_24FE408B8;
  v11 = v3;
  v12 = v4;
  v8 = v4;
  v9 = v3;
  +[BRCImportUtil requestModificationOfItemIdentifier:completionHandler:](BRCImportUtil, "requestModificationOfItemIdentifier:completionHandler:", v7, v10);

}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(v3, "fp_isFileProviderError:", -1005) & 1) != 0
    || objc_msgSend(v3, "br_isCocoaErrorCode:", 4353))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_1(a1);

    objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_21;
    v10[3] = &unk_24FE3FA40;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    dispatch_async(v6, v10);

    v7 = v11;
  }
  else
  {
    if (v3)
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v14 = v9;
        v15 = 2112;
        v16 = v3;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_230455000, v8, (os_log_type_t)0x90u, "[ERROR] Failed to re-ingest item %@ - %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_2(a1);
    }

  }
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_21(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "itemByFileObjectID:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "asDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "syncUpState") == 7)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v2;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as delete for re-apply %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v2, "clientZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverItemByItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "markNeedsDeleteForRescheduleOfItem:", v7);
    objc_msgSend(v2, "saveToDB");

  }
}

- (BOOL)updateFromServerItem:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *currentVersion;
  void *v17;
  void *v18;
  void *v19;
  BRCLocalVersion *v20;
  void *v21;
  BRCLocalVersion *v22;
  BRCLocalVersion *v23;
  BRCLocalVersion *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BRCDocumentItem;
  v5 = -[BRCLocalItem updateFromServerItem:](&v35, sel_updateFromServerItem_, v4);
  if (v5 && (objc_msgSend(v4, "isBRAlias") & 1) == 0)
  {
    if (!v4)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BRCLocalItem updateStructuralCKInfoFromServerItem:].cold.3();

    }
    if ((objc_msgSend(v4, "isDocument") & 1) == 0)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem updateContentsCKInfoAndDeviceIDFromServerItem:].cold.3();

    }
    if (!-[BRCDocumentItem isDocument](self, "isDocument"))
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:].cold.3();

    }
    if (!-[BRCLocalItem isIdleOrRejected](self, "isIdleOrRejected"))
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:].cold.2();

    }
    -[BRCVersion ckInfo](self->_currentVersion, "ckInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "etag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "latestVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCDocumentItem(BRCFPFSAdditions) updateFromServerItem:].cold.1((uint64_t)v4);

      currentVersion = self->_currentVersion;
      self->_currentVersion = 0;
      goto LABEL_27;
    }
    -[BRCVersion editedSinceShared](self->_currentVersion, "editedSinceShared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) != 0)
    {
      v13 = 1;
LABEL_19:
      objc_msgSend(v4, "latestVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_28:

        goto LABEL_29;
      }
      v34 = v13;
      -[BRCLocalVersion uploadError](self->_currentVersion, "uploadError");
      currentVersion = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCLocalVersion oldVersionIdentifier](self->_currentVersion, "oldVersionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v7;
      v20 = [BRCLocalVersion alloc];
      objc_msgSend(v4, "latestVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      v7 = v19;
      v23 = -[BRCLocalVersion initWithServerVersion:](v22, "initWithServerVersion:", v21);
      v24 = self->_currentVersion;
      self->_currentVersion = v23;

      if (objc_msgSend(v19, "isEqual:", v10))
        -[BRCLocalVersion setOldVersionIdentifier:](self->_currentVersion, "setOldVersionIdentifier:", v18);
      if (v34)
        -[BRCVersion setEditedSinceShared:](self->_currentVersion, "setEditedSinceShared:", MEMORY[0x24BDBD1C8]);
      if (objc_msgSend(currentVersion, "br_isCloudDocsErrorCode:", 43))
        -[BRCLocalVersion setUploadError:](self->_currentVersion, "setUploadError:", currentVersion);

LABEL_27:
      goto LABEL_28;
    }
    if (-[BRCLocalItem isSharedToMe](self, "isSharedToMe"))
    {
      if (!v7)
      {
        v13 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v13 = 0;
      if (!-[BRCLocalItem isSharedByMe](self, "isSharedByMe") || !v7)
        goto LABEL_19;
    }
    v13 = (-[BRCDocumentItem diffAgainstServerItem:](self, "diffAgainstServerItem:", v4) & 0x1A0000) != 0;
    goto LABEL_19;
  }
LABEL_29:

  return v5;
}

- (void)cancelDownloadWithEtag:(id)a3 downloadKind:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v6 && (_DWORD)v4 != 2)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCDocumentItem(BRCFPFSAdditions) cancelDownloadWithEtag:downloadKind:].cold.1();

  }
  -[BRCAccountSessionFPFS fsDownloader](self->super._session, "fsDownloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:", self, v4, v6, 1);

}

- (void)recoverDamagedDocumentIfNecessaryWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BRCDocumentItem *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recoverDamagedDocumentOnDisk");

  if (v6 && objc_msgSend(v4, "br_isCloudDocsErrorCode:", 151))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v15 = 138412802;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_INFO, "[INFO] Recovering damaged document %@ with error %@%@", (uint8_t *)&v15, 0x20u);
    }

    -[BRCLocalItem clientZone](self, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemByItemID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCLocalItem clientZone](self, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem itemID](self, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverItemByItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "markNeedsDeleteForRescheduleOfItem:", v14);
    objc_msgSend(v11, "saveToDB");

  }
}

- (void)isPackage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isFinderBookmark || BRCItemTypeIsDocument(_st.type)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)shouldBeGreedy
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] don't be greedy because the app is document scope private%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_initWithServerItem:(uint64_t)a1 dbRowID:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: document without a version:\n    %@\n\n   this typically indicates either of two problems:\n    - either we failed processing the last sync down and we\n      saved the structure record but not the contents record,\n    - or the server forgot to send us a contents record.%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_0();
}

- (void)_initWithServerItem:dbRowID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)diffAgainstServerItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !info || info.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)clearVersionSignatures:isPackage:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  v4 = *MEMORY[0x24BDAC8D0];
  BRCPrettyPrintBitmap();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v2, "[DEBUG] Clearing signatures: %@%@", v3);

  OUTLINED_FUNCTION_6();
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateContentsCKInfoAndDeviceIDFromServerItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverItem.isDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Marking %@ as edited since shared because the item differs in edit mask%@");
  OUTLINED_FUNCTION_0();
}

- (void)updateVersionMetadataFromServerItem:preventVersionDiffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: serverItem.latestVersion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] removing conflict loser with etag %@%@");
  OUTLINED_FUNCTION_0();
}

void __54__BRCDocumentItem_appDidResolveConflictLoserWithEtag___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] there is no conflict loser with etag %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)markLatestSyncRequestRejectedInZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Clearing prev zone rowID and inserting tombstone for item which finished syncing to the new zone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a4, a3, "[CRIT] UNREACHABLE: no version on uploaded document %@%@", (uint8_t *)a3);

}

- (void)markUploadedWithRecord:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] item is now uploaded: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _currentVersion.uploadedAssets == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _currentVersion.thumbnailSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _currentVersion.contentSignature.brc_signatureIsPendingPlaceHolder || self.isDocumentBeingCopiedToNewZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _currentVersion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: (fileAsset && !pkgSignature) || (!fileAsset && pkgSignature)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: record%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markUploadedWithRecord:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] API MISUSE: state isn't needs-upload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.supportsServerSideAssetCopies%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)markCrossZoneMovedForServerAssetCopyWithParentItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_crossZoneMoveToParent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Document %@ is being cross zone moved with local changes or enhanced drive privacy mismatch%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_crossZoneMoveToParent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: (_localDiffs & (BRC_IF_CONTENT_SIZE|BRC_IF_CONTENT_SIGNATURE)) != 0 || !_currentVersion.contentSignature.brc_signatureIsValid || !enhancedDrivePrivacyMatches%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !self.isDead && (!isFault || self.isDocumentBeingCopiedToNewZone)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateUploadJobIfNeededWithDiffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] ┏%llx updating upload jobs%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "lastError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, v3, "[CRIT] UNREACHABLE: can't update recursive properties: %@%@", v4);

  OUTLINED_FUNCTION_6();
}

- (void)_updateRecursivePropertiesInDB:dbRowID:diffs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: db.isBatchSuspended%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateInDB:diffs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Updating zone info for a CZM item and deleting old zone jobs%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_230455000, v2, (os_log_type_t)0x90u, "[ERROR] Failed to find item to re-ingest %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __61__BRCDocumentItem_BRCFPFSAdditions__reIngestFromFileProvider__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_230455000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] Asked to re-ingest %@ for a file ID%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
