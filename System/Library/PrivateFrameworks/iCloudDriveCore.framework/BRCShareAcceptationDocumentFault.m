@implementation BRCShareAcceptationDocumentFault

- (BRCShareAcceptationDocumentFault)initWithFilename:(id)a3 itemID:(id)a4 parentIDWhenSubitem:(id)a5 appLibrary:(id)a6 clientZone:(id)a7 sharingOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BRCShareAcceptationDocumentFault *v19;
  BRCShareAcceptationDocumentFault *v20;
  BRCLocalStatInfo *v21;
  BRCLocalStatInfo *st;
  void *v23;
  void *v24;
  BRCLocalVersion *v25;
  BRCLocalVersion *currentVersion;
  uint64_t v27;
  BRCPQLConnection *db;
  BRCAccountSessionFPFS *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  BRCUserRowID *ownerKey;
  void *v34;
  double v35;
  uint64_t v37;
  id v38;
  unint64_t v39;
  objc_super v40;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)BRCShareAcceptationDocumentFault;
  v19 = -[BRCShareAcceptationDocumentFault init](&v40, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->super.super._itemID, a4);
    v39 = a8;
    v21 = -[BRCLocalStatInfo initAsShareAcceptFaultWithName:mode:isDirectory:]([BRCLocalStatInfo alloc], "initAsShareAcceptFaultWithName:mode:isDirectory:", v14, (a8 & 0x20) == 0, 0);
    st = v20->super.super._st;
    v20->super.super._st = v21;

    if (v16)
    {
      v38 = v16;
      -[BRCStatInfo setParentID:](v20->super.super._st, "setParentID:");
      objc_msgSend(v18, "dbRowID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
    }
    else
    {
      objc_msgSend(v17, "documentsFolderItemID");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      -[BRCStatInfo setParentID:](v20->super.super._st, "setParentID:");
      objc_msgSend(v17, "defaultClientZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dbRowID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v20->super.super._parentZoneRowID, v23);
    if (v16)
    {
      v37 = 0;
    }
    else
    {

      v37 = 4;
    }

    v25 = -[BRCLocalVersion initForPackage:]([BRCLocalVersion alloc], "initForPackage:", 0);
    currentVersion = v20->super._currentVersion;
    v20->super._currentVersion = v25;

    -[BRCVersion setOriginalPOSIXName:](v20->super._currentVersion, "setOriginalPOSIXName:", v14);
    -[BRCVersion setMtime:](v20->super._currentVersion, "setMtime:", time(0));
    -[BRCVersion setSize:](v20->super._currentVersion, "setSize:", 20480);
    -[BRCLocalItem setAppLibrary:](v20, "setAppLibrary:", v17);
    objc_storeStrong((id *)&v20->super.super._clientZone, a7);
    v20->super.super._serverZone = (BRCServerZone *)-[BRCClientZone serverZone](v20->super.super._clientZone, "serverZone");
    -[BRCClientZone db](v20->super.super._clientZone, "db");
    v27 = objc_claimAutoreleasedReturnValue();
    db = v20->super.super._db;
    v20->super.super._db = (BRCPQLConnection *)v27;

    v29 = (BRCAccountSessionFPFS *)(id)objc_msgSend(v17, "session");
    v20->super.super._session = v29;
    objc_msgSend(v18, "ownerName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientDB](v20->super.super._session, "clientDB");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS userKeyForOwnerName:db:](v29, "userKeyForOwnerName:db:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    ownerKey = v20->super.super._ownerKey;
    v20->super.super._ownerKey = (BRCUserRowID *)v32;

    -[BRCStatInfo setBirthtime:](v20->super.super._st, "setBirthtime:", -[BRCVersion mtime](v20->super._currentVersion, "mtime"));
    -[BRCLocalStatInfo setItemScope:](v20->super.super._st, "setItemScope:", 2);
    -[BRCStatInfo setState:](v20->super.super._st, "setState:", 0);
    -[BRCStatInfo setHiddenExt:](v20->super.super._st, "setHiddenExt:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSince1970");
    -[BRCStatInfo setLastUsedTime:](v20->super.super._st, "setLastUsedTime:", (uint64_t)v35);

    v20->super.super._sharingOptions = v37 | v39;
    v20->super.super._isUserVisible = 1;

  }
  return v20;
}

- (BOOL)isShareAcceptationFault
{
  return 1;
}

- (void)deleteShareAcceptationFault
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: only share acceptation fault can be deleted; %@%@");
}

- (void)markNeedsTransformIntoNormalFault
{
  -[BRCStatInfo setType:](self->super.super._st, "setType:", 1);
}

- (BOOL)_updateInDB:(id)a3 diffs:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  int v8;
  char v9;
  BRCItemID *itemID;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BRCShareAcceptationDocumentFault;
  v7 = -[BRCDocumentItem _updateInDB:diffs:](&v14, sel__updateInDB_diffs_, v6, a4);
  v8 = -[BRCStatInfo type](self->super.super._st, "type");
  if (v8 == 2)
    v9 = 0;
  else
    v9 = v7;
  if (v8 == 2 && v7 != 0)
  {
    itemID = self->super.super._itemID;
    -[BRCClientZone dbRowID](self->super.super._clientZone, "dbRowID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "execute:", CFSTR("UPDATE client_items SET item_type = 2 WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 8"), itemID, v12);

  }
  return v9;
}

@end
