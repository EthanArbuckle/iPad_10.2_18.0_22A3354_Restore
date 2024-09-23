@implementation BRCSharedServerItem

- (BOOL)isSharedToMeTopLevelItem
{
  void *v2;
  char v3;

  -[BRCServerItem parentItemIDOnServer](self, "parentItemIDOnServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedZoneRoot");

  return v3;
}

- (BOOL)isSharedToMeChildItem
{
  return !-[BRCSharedServerItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem");
}

- (id)fallbackParentAppLibraryOnFS
{
  BRCAccountSessionFPFS *session;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  session = self->super._session;
  -[BRCServerItem clientZone](self, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asSharedClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSharedServerItem st](self, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logicalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS fallbackAppLibraryForClientZone:extension:](session, "fallbackAppLibraryForClientZone:extension:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fallbackParentItemOnFS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[BRCSharedServerItem fallbackParentAppLibraryOnFS](self, "fallbackParentAppLibraryOnFS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSharedServerItem fallbackParentItemIDOnFS](self, "fallbackParentItemIDOnFS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemByItemID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v3;
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      -[BRCSharedServerItem fallbackParentItemIDOnFS](self, "fallbackParentItemIDOnFS");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mangledID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v9;
      _os_log_fault_impl(&dword_230455000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't find %@ in %@%@", (uint8_t *)&v17, 0x20u);

    }
    -[BRCAccountSessionFPFS appLibraryByID:](self->super._session, "appLibraryByID:", *MEMORY[0x24BE17550]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "defaultClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentsFolderItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemByItemID:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[BRCSharedServerItem fallbackParentItemOnFS].cold.1((uint64_t)v13, v14);

      v6 = 0;
    }
  }

  return v6;
}

- (id)fallbackParentServerItemOnFS
{
  return 0;
}

- (id)fallbackParentItemIDOnFS
{
  void *v3;
  BRCPQLConnection *db;
  void *v5;
  BRCPQLConnection *v6;
  BRCPQLConnection *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[BRCSharedServerItem fallbackParentAppLibraryOnFS](self, "fallbackParentAppLibraryOnFS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  db = self->super._db;
  -[BRCServerItem session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientDB");
  v6 = (BRCPQLConnection *)objc_claimAutoreleasedReturnValue();

  if (db == v6)
  {
    v7 = self->super._db;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__BRCSharedServerItem_fallbackParentItemIDOnFS__block_invoke;
    v10[3] = &unk_24FE40140;
    v11 = v3;
    -[BRCPQLConnection performWithFlags:action:](v7, "performWithFlags:action:", 4, v10);

  }
  objc_msgSend(v3, "documentsFolderItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __47__BRCSharedServerItem_fallbackParentItemIDOnFS__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "recreateDocumentsFolderIfNeededInDB");
}

- (id)parentItemOnFS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BRCSharedServerItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCServerItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerItem parentItemIDOnServer](self, "parentItemIDOnServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serverItemByItemID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:](self->super._session, "serverAliasItemForSharedItem:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (!v6)
    {
      -[BRCSharedServerItem fallbackParentServerItemOnFS](self, "fallbackParentServerItemOnFS");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v6, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverItemByItemID:db:", v7, self->super._db);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v5;
}

- (id)parentLocalItemOnFS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BRCSharedServerItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCServerItem clientZone](self, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerItem parentItemIDOnServer](self, "parentItemIDOnServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemByItemID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:](self->super._session, "serverAliasItemForSharedItem:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
    if (!v6)
    {
      -[BRCSharedServerItem fallbackParentItemOnFS](self, "fallbackParentItemOnFS");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v6, "clientZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentItemIDOnFS");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemByItemID:db:", v7, self->super._db);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v5;
}

- (id)parentItemIDOnFSInDB:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCSharedServerItem parentItemIDOnFSInDB:]", 110, v17);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15 = v17[0];
    -[BRCServerItem itemID](self, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2112;
    v23 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx computing the parent item id of %@%@", buf, 0x20u);

  }
  if (-[BRCSharedServerItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCServerItem parentItemIDOnServer](self, "parentItemIDOnServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:db:](self->super._session, "serverAliasItemForSharedItem:db:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCSharedServerItem parentItemIDOnFSInDB:].cold.2((uint64_t)v8, (uint64_t)v9, v10);

      objc_msgSend(v8, "parentItemIDOnFS");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCSharedServerItem fallbackParentItemIDOnFS](self, "fallbackParentItemIDOnFS");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "debugItemIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSharedServerItem parentItemIDOnFSInDB:].cold.1(v13, (uint64_t)v11, (uint64_t)buf, v12);
      }

    }
  }
  __brc_leave_section(v17);

  return v7;
}

- (id)aliasDerivedStructure
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BRCSharedServerItem;
  -[BRCServerItem st](&v15, sel_st);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCSharedServerItem isSharedToMeTopLevelItem](self, "isSharedToMeTopLevelItem"))
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:db:](self->super._session, "serverAliasItemForSharedItem:db:", self, self->super._db);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "copy");
    objc_msgSend(v4, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ckInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCkInfo:", v7);

    objc_msgSend(v4, "st");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastUsedTime:", objc_msgSend(v8, "lastUsedTime"));

    objc_msgSend(v4, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finderTags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFinderTags:", v10);

    objc_msgSend(v4, "st");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFavoriteRank:", objc_msgSend(v11, "favoriteRank"));

    objc_msgSend(v4, "st");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logicalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v5, "setLogicalName:", v13);
    objc_storeStrong((id *)&self->_aliasDerivedStructureForDescription, v5);

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (id)aliasDerivedStructureForDescription
{
  return self->_aliasDerivedStructureForDescription;
}

- (id)parentItemIDOnFS
{
  return -[BRCSharedServerItem parentItemIDOnFSInDB:](self, "parentItemIDOnFSInDB:", self->super._db);
}

- (id)parentZoneOnFS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[BRCSharedServerItem isSharedToMeChildItem](self, "isSharedToMeChildItem"))
  {
    -[BRCServerItem serverZone](self, "serverZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRCAccountSessionFPFS serverAliasItemForSharedItem:](self->super._session, "serverAliasItemForSharedItem:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "serverZone");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BRCSharedServerItem fallbackParentAppLibraryOnFS](self, "fallbackParentAppLibraryOnFS");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultClientZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverZone");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliasDerivedStructureForDescription, 0);
}

- (void)fallbackParentItemOnFS
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fallbackItem%@", (uint8_t *)&v2, 0xCu);
}

- (void)parentItemIDOnFSInDB:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a4, a3, "[DEBUG] falling back to an app library documents root: %@%@", (uint8_t *)a3);

}

- (void)parentItemIDOnFSInDB:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] found the alias representing this item: %@%@", (uint8_t *)&v3);
}

@end
