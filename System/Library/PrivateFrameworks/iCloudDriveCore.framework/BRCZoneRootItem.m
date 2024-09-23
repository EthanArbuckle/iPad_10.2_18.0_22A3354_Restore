@implementation BRCZoneRootItem

- (BRCZoneRootItem)initWithZoneRootItemID:(id)a3 session:(id)a4
{
  id v7;
  BRCAccountSessionFPFS *v8;
  BRCZoneRootItem *v9;
  void *v10;
  NSObject *v11;
  BRCZoneRootItem *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BRCClientZone *clientZone;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  objc_super v22;

  v7 = a3;
  v8 = (BRCAccountSessionFPFS *)a4;
  v22.receiver = self;
  v22.super_class = (Class)BRCZoneRootItem;
  v9 = -[BRCZoneRootItem init](&v22, sel_init);
  if (!v9)
  {
LABEL_9:
    v12 = v9;
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "isNonDesktopRoot") & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCZoneRootItem initWithZoneRootItemID:session:].cold.3();

  }
  objc_storeStrong((id *)&v9->super.super._itemID, a3);
  v9->super.super._session = v8;
  if (!objc_msgSend(v7, "isSharedZoneRoot"))
  {
    objc_msgSend(v7, "appLibraryRowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS appLibraryByRowID:](v8, "appLibraryByRowID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:].cold.2();

    }
    -[BRCLocalItem setAppLibrary:](v9, "setAppLibrary:", v14);
    objc_msgSend(v14, "defaultClientZone");
    v15 = objc_claimAutoreleasedReturnValue();
    clientZone = v9->super.super._clientZone;
    v9->super.super._clientZone = (BRCClientZone *)v15;

    v9->super.super._serverZone = (BRCServerZone *)-[BRCClientZone serverZone](v9->super.super._clientZone, "serverZone");
    goto LABEL_9;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[BRCZoneRootItem initWithZoneRootItemID:session:].cold.1();

  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)isFSRoot
{
  return 1;
}

- (BOOL)isDirectoryFault
{
  void *v2;
  BOOL v3;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "state") & 0x2000000) == 0;

  return v3;
}

- (BOOL)isZoneRoot
{
  return 1;
}

- (BOOL)saveToDB
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCZoneRootItem saveToDB].cold.1();

  return 0;
}

- (id)parentItemOnFS
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[BRCZoneRootItem parentItemOnFS].cold.1();

  return 0;
}

- (id)parentItemID
{
  void *v3;
  NSObject *v4;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BRCZoneRootItem parentItemID].cold.1();

  -[BRCLocalItem itemID](self, "itemID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)st
{
  void *v3;
  NSObject *v4;
  objc_super v6;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[BRCZoneRootItem st].cold.1();

  v6.receiver = self;
  v6.super_class = (Class)BRCZoneRootItem;
  -[BRCLocalItem st](&v6, sel_st);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isShareableItem
{
  return 0;
}

- (id)extendedAttributes
{
  return 0;
}

- (BOOL)isUserVisible
{
  void *v2;
  char v3;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includesDataScope") ^ 1;

  return v3;
}

- (unsigned)itemScope
{
  void *v2;
  int v3;

  -[BRCLocalItem appLibrary](self, "appLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includesDataScope");

  if (v3)
    return 1;
  else
    return 2;
}

- (void)initWithZoneRootItemID:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_230455000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Constructing shared zone root item for itemID %@ is not supported%@", v2, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)initWithZoneRootItemID:session:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: itemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveToDB
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] API MISUSE: can't save a zone root item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)parentItemOnFS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asking the parent item of a root item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)parentItemID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asking the parent item ID of a root item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)st
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asking the structural bit of a zone root is not supported%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
