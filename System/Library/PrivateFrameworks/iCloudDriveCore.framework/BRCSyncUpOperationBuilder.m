@implementation BRCSyncUpOperationBuilder

- (BRCSyncUpOperationBuilder)init
{
  BRCSyncUpOperationBuilder *v2;
  uint64_t v3;
  NSMutableSet *fullyChainedParentIDWhitelist;
  uint64_t v5;
  NSMutableSet *halfChainedParentIDWhitelist;
  uint64_t v7;
  NSMutableDictionary *parentItemIDToChildBasehashSalt;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRCSyncUpOperationBuilder;
  v2 = -[BRCSyncUpOperationBuilder init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    fullyChainedParentIDWhitelist = v2->_fullyChainedParentIDWhitelist;
    v2->_fullyChainedParentIDWhitelist = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    halfChainedParentIDWhitelist = v2->_halfChainedParentIDWhitelist;
    v2->_halfChainedParentIDWhitelist = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    parentItemIDToChildBasehashSalt = v2->_parentItemIDToChildBasehashSalt;
    v2->_parentItemIDToChildBasehashSalt = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (unsigned)shouldPCSChainStatusForItem:(id)a3
{
  id v4;
  unsigned __int8 v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  char v27;
  int v28;
  char v29;
  unsigned int v30;
  int v31;
  char v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isSharedToMeChildItem"))
  {
    v32 = 0;
    v6 = objc_msgSend(v4, "isNewToServer:", &v32);
    if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0)
    {
      objc_msgSend(v4, "asSharedToMeTopLevelItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sharedAliasItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "appLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mangledID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCSyncUpOperationBuilder op](self, "op");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "isPrivateZone")
      || (objc_msgSend(v8, "isDocumentsFolder") & 1) != 0
      || (objc_msgSend(v4, "parentClientZone"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToClientZone:", v16),
          v17,
          !v18))
    {
      v5 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v16, "asPrivateClientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "optimisticallyPCSChainWithSession:", self->_session))
    {
      v20 = objc_msgSend(v13, "optimisticallyPCSChainDuringResetWithSession:", self->_session);
      if (v32)
        v21 = v20;
      else
        v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    v31 = objc_msgSend(v13, "should2PhasePCSChain");
    v23 = objc_msgSend(v19, "pcsChainStateForItem:", v8);
    if ((v23 & 0xFFFFFFFE) == 2)
    {
      if (objc_msgSend(v4, "isDirectory"))
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
      if (v6)
        v5 = 8;
      else
        v5 = 16;
      goto LABEL_56;
    }
    v24 = v23;
    if ((-[NSMutableSet containsObject:](self->_fullyChainedParentIDWhitelist, "containsObject:", v10) & 1) != 0)
    {
LABEL_26:
      -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v10);
      if (objc_msgSend(v4, "isDirectory"))
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
      v5 = 8;
      goto LABEL_56;
    }
    if ((-[NSMutableSet containsObject:](self->_halfChainedParentIDWhitelist, "containsObject:", v10) & 1) != 0)
    {
      v25 = 4;
    }
    else
    {
      v25 = objc_msgSend(v19, "pcsChainStateForItem:", v10);
      if ((v25 & 0xFFFFFFFE) == 2)
        goto LABEL_26;
    }
    v30 = v25;
    if (v21 && objc_msgSend(v4, "isInDocumentOrTrashScope"))
    {
      if (objc_msgSend(v4, "isDirectory"))
      {
        if (v30 < 2 || (objc_msgSend(v19, "parentIDHasLiveUnchainedChildren:", v8) & 1) != 0)
        {
          if (v24 < 2)
            v26 = 1;
          else
            v26 = v6;
          if (v26 != 1)
            goto LABEL_55;
          goto LABEL_46;
        }
        -[NSMutableSet addObject:](self->_fullyChainedParentIDWhitelist, "addObject:", v8);
LABEL_58:
        v5 = 4;
        goto LABEL_56;
      }
      if (v24 < 2)
        v28 = v31;
      else
        v28 = 0;
      if (v30 >= 2 && !v28)
        goto LABEL_58;
      v29 = objc_msgSend(v4, "isDocument");
      if (v24 > 1 || (v29 & 1) == 0)
      {
LABEL_55:
        v5 = 1;
        goto LABEL_56;
      }
    }
    else
    {
      v27 = v6 ^ 1;
      if (v24 < 2)
        v27 = 1;
      if ((v27 & 1) != 0)
        goto LABEL_55;
      if (objc_msgSend(v4, "isDirectory"))
LABEL_46:
        -[NSMutableSet addObject:](self->_halfChainedParentIDWhitelist, "addObject:", v8);
    }
    v5 = 2;
LABEL_56:

    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isKnownByServer"))
    v5 = 32;
  else
    v5 = 8;
LABEL_17:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToSaltingBasehashItem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  BRCDirectoryItem *v11;
  BRCDirectoryItem *itemNeedingBasehashSalting;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSData *v18;
  NSData *rootChildBasehashSalt;
  NSData *v20;
  NSData *v21;
  NSData *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *parentItemIDToChildBasehashSalt;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSMutableDictionary *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isDead") & 1) == 0)
  {
    v5 = 0;
    if (!objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 0))
      goto LABEL_27;
    objc_msgSend(v4, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "parentClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "saltingStateForItemID:", v7);
    if (v9 > 2)
    {
      if (v9 == -1 && !self->_rootChildBasehashSalt && objc_msgSend(v7, "isNonDesktopRoot"))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
            -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.3();

        }
        objc_msgSend(v4, "parentClientZone");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "asPrivateClientZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "childBaseSaltForItemID:", v7);
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        rootChildBasehashSalt = self->_rootChildBasehashSalt;
        self->_rootChildBasehashSalt = v18;

        v20 = self->_rootChildBasehashSalt;
        if (!v20)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
          v21 = (NSData *)objc_claimAutoreleasedReturnValue();
          v22 = self->_rootChildBasehashSalt;
          self->_rootChildBasehashSalt = v21;

          brc_bread_crumbs();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            -[NSData brc_truncatedSHA256](self->_rootChildBasehashSalt, "brc_truncatedSHA256");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "brc_hexadecimalString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "debugDescription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 138412802;
            v44 = v37;
            v45 = 2112;
            v46 = v38;
            v47 = 2112;
            v48 = v23;
            _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated root child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);

          }
          v20 = self->_rootChildBasehashSalt;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v20, v7);
      }
    }
    else if ((objc_msgSend(v4, "localDiffs") & 0x1000000060) != 0)
    {
      objc_msgSend(v8, "itemByItemID:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asDirectory");
      v11 = (BRCDirectoryItem *)objc_claimAutoreleasedReturnValue();
      itemNeedingBasehashSalting = self->_itemNeedingBasehashSalting;
      self->_itemNeedingBasehashSalting = v11;

      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.2(v7, (uint64_t)v13, v14);
      goto LABEL_24;
    }
    if (!objc_msgSend(v4, "isDirectory"))
    {
      v5 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v4, "clientZone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "childBaseSaltForItemID:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      parentItemIDToChildBasehashSalt = self->_parentItemIDToChildBasehashSalt;
      objc_msgSend(v4, "itemID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        brc_bread_crumbs();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:].cold.1();

      }
      objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "itemID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "debugDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138412802;
        v44 = v13;
        v45 = 2112;
        v46 = v35;
        v47 = 2112;
        v48 = v30;
        _os_log_debug_impl(&dword_230455000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] Generated child basehash salt %@ for %@%@", (uint8_t *)&v43, 0x20u);

      }
    }
    v32 = self->_parentItemIDToChildBasehashSalt;
    objc_msgSend(v4, "itemID");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v13, v14);
    v5 = 0;
LABEL_24:

LABEL_26:
    goto LABEL_27;
  }
  v5 = 0;
LABEL_27:

  return v5;
}

- (BOOL)_checkIfShouldDedicateOpToPCSChainingItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSMutableSet *fullyChainedParentIDWhitelist;
  void *v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  unsigned int v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;

  v5 = a3;
  if ((objc_msgSend(v5, "isDead") & 1) != 0)
    goto LABEL_11;
  objc_msgSend(v5, "appLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mangledID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "should2PhasePCSChain");

  if ((objc_msgSend(v5, "isDeadOrMissingInServerTruth") & 1) != 0
    || (objc_msgSend(v5, "localDiffs") & 0x20) == 0
    || (objc_msgSend(v5, "isDirectory") & 1) == 0 && (objc_msgSend(v5, "isDocument") & v9) != 1)
  {
    goto LABEL_11;
  }
  objc_msgSend(v5, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDocumentsFolder"))
    goto LABEL_7;
  objc_msgSend(v5, "clientZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPrivateZone");

  if (!v12)
    goto LABEL_11;
  objc_msgSend(v5, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "asPrivateClientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  fullyChainedParentIDWhitelist = self->_fullyChainedParentIDWhitelist;
  objc_msgSend(v5, "st");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](fullyChainedParentIDWhitelist, "containsObject:", v16))
  {

  }
  else
  {
    objc_msgSend(v5, "st");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parentID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "pcsChainStateForItem:", v20) & 0xFFFFFFFE;

    if (v21 != 2)
    {
LABEL_7:

LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
  }
  objc_msgSend(v5, "itemID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v10, "pcsChainStateForItem:", v22);

  if (v23 < 2)
    v24 = v9;
  else
    v24 = 0;
  if ((v24 & 1) == 0)
  {
    if ((v23 & 0xFFFFFFFE) == 2)
      goto LABEL_7;
    objc_msgSend(v5, "itemID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v10, "parentIDHasLiveUnchainedChildren:", v25);

    if (!v26)
      goto LABEL_7;
  }
  brc_bread_crumbs();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:].cold.1(v5, (uint64_t)v27, v28);

  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, a3);
  v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)checkIfSyncAllowedInSharedZoneForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isSharedZone")
    || objc_msgSend(v4, "isSharedToMeTopLevelItem") && (objc_msgSend(v4, "isDead") & 1) != 0)
  {
    v7 = 1;
    goto LABEL_25;
  }
  if (objc_msgSend(v4, "isDeadOrMissingInServerTruth")
    && objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    objc_msgSend(v4, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "state") & 4) != 0)
    {

    }
    else
    {
      v9 = objc_msgSend(v4, "localDiffs");

      if ((v9 & 0x400000000000000) != 0)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.2();

LABEL_24:
        v7 = 0;
        goto LABEL_25;
      }
    }
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.1();

    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v6);
    goto LABEL_24;
  }
  objc_msgSend(v4, "clientZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverItemByItemID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = v4;
  v16 = objc_msgSend(v15, "sharingOptions");
  v7 = (v16 & 0x20) == 0;
  if ((v16 & 0x20) != 0)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:].cold.3();

    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v14, v6);
  }

LABEL_25:
  return v7;
}

- (float)addDeletionOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v11;
  NSObject *v12;

  v4 = a3;
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  objc_msgSend(v4, "structureRecordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "st");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ckInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v5, v7);
  v9 = v8;

  return v9;
}

- (float)addDeletionOfRecordID:(id)a3 ckInfo:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  int v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deletedRecordIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v6);

  if (objc_msgSend(v7, "hasEtag"))
  {
    objc_msgSend(v7, "etag");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordIDsToDeleteToEtags");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
    v14 = v6;
LABEL_7:
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v13, v14);
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "hasEtagBeforeCrossZoneMove"))
  {
    objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v10 = objc_opt_new();
      objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, v6);

    }
    objc_msgSend(v7, "etagBeforeCrossZoneMove");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("br_etagInPreviousZone");
    v11 = v10;
    v13 = v12;
    goto LABEL_7;
  }
  brc_bread_crumbs();
  v10 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = v10;
    _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] item should really have an etag%@", (uint8_t *)&v27, 0xCu);
  }
LABEL_8:

  if (objc_msgSend(v7, "hasDeletionChangeToken"))
  {
    -[__CFString recordName](v6, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("shareAlias/"));

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v20 = (void *)objc_opt_new();
        objc_msgSend(v8, "pluginFieldsForRecordDeletesByID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v6);

      }
      objc_msgSend(v7, "deletionChangeToken");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("br_deleteChangeToken"));

    }
  }
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "syncUpStructureDeleteCost");
  v25 = v24;

  return v25;
}

- (id)_getChildBasehashSaltForItemID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[BRCSyncUpOperation serverZone](self->_op, "serverZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childBaseSaltForItemID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v12, v4);

      v8 = 0;
      v6 = 0;
      goto LABEL_7;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parentItemIDToChildBasehashSalt, "setObject:forKeyedSubscript:", v6, v4);
    goto LABEL_6;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
LABEL_6:
    v8 = v6;
    v6 = v8;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)_getChildBasehashSaltForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 1)
    && objc_msgSend(v4, "isDirectory"))
  {
    objc_msgSend(v4, "itemID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder _getChildBasehashSaltForItemID:](self, "_getChildBasehashSaltForItemID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_getSaltForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsEnhancedDrivePrivacy");

  v7 = 0;
  if (v6)
  {
    if ((objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "st");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "parentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder _getSaltForItem:].cold.1();

      }
      -[BRCSyncUpOperationBuilder _getChildBasehashSaltForItemID:](self, "_getChildBasehashSaltForItemID:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)_generateSaltGetterBlock
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke;
  v5[3] = &unk_24FE45C98;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2348BA0DC](v5, a2);
  v3 = (void *)MEMORY[0x2348BA0DC]();

  return v3;
}

uint64_t __53__BRCSyncUpOperationBuilder__generateSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSaltForItem:", a2);
}

- (id)_generateChildBasehashSaltGetterBlock
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke;
  v5[3] = &unk_24FE45C98;
  v5[4] = self;
  v2 = (void *)MEMORY[0x2348BA0DC](v5, a2);
  v3 = (void *)MEMORY[0x2348BA0DC]();

  return v3;
}

uint64_t __66__BRCSyncUpOperationBuilder__generateChildBasehashSaltGetterBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getChildBasehashSaltForItem:", a2);
}

- (float)addEditOfSharedTopLevelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  float v9;
  __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  NSObject *v26;
  float v27;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  const char *v33;
  void *v34;
  int v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSharedZone");

  if (!v7)
  {
    v10 = objc_msgSend(v4, "localDiffs");
    objc_msgSend(v4, "parentClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToClientZone:", v13);

    if ((v14 & 1) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412546;
        v36 = (const char *)v4;
        v37 = 2112;
        v38 = v25;
        _os_log_impl(&dword_230455000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Fake syncing up share alias in the wrong zone! %@%@", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_15;
    }
    if ((v10 & 0x1A69) == 0)
    {
LABEL_16:
      objc_msgSend(v5, "serverZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v8);
      goto LABEL_17;
    }
    objc_msgSend(v4, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serverAliasItemForSharedItem:inZone:", v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
    objc_msgSend(v5, "serverZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:shouldPCSChainStatus:inZone:", v17 == 0, v18, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if ((v18 & 0x2C) != 0)
        v33 = "pcs chained ";
      else
        v33 = "";
      objc_msgSend(v8, "description");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 136315650;
      v36 = v33;
      v37 = 2112;
      v38 = v34;
      v39 = 2112;
      v40 = v20;
      _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sshared document alias record %@%@", (uint8_t *)&v35, 0x20u);

    }
    if (v8)
    {
      objc_msgSend(v5, "recordsToSave");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v8);

      if (objc_msgSend(v4, "isFromInitialScan"))
      {
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "syncUpInitialItemCost");
      }
      else
      {
        v31 = objc_msgSend(v4, "isKnownByServer");
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v32;
        if (v31)
          objc_msgSend(v32, "syncUpStructureEditCost");
        else
          objc_msgSend(v32, "syncUpStructureCreateCost");
      }
      v27 = v24;

      goto LABEL_18;
    }
LABEL_23:
    v27 = -1.0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v4, "isDocument"))
  {
    if (objc_msgSend(v4, "isDirectory"))
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:].cold.1((uint64_t)v25, v26);
LABEL_15:

      goto LABEL_16;
    }
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:].cold.2();

    goto LABEL_23;
  }
  objc_msgSend(v4, "asDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder addEditOfDocument:](self, "addEditOfDocument:", v8);
LABEL_17:
  v27 = v9;
LABEL_18:

LABEL_19:
  return v27;
}

- (float)addDeletionOfSharedTopLevelItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  NSObject *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSharedZone");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v4, "asShareableItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initShareIDWithShareableItem:", v9);

    -[BRCSyncUpOperationBuilder op](self, "op");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedRecordIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v10);

    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncUpDocumentDeleteCost");
    v15 = v14;

  }
  else
  {
    -[BRCSyncUpOperationBuilder op](self, "op");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "serverZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "structureRecordIDInZone:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:].cold.1();

      objc_msgSend(v4, "st");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ckInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v10, v21);
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_230455000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] syncing the structure of an item without an alias item%@", (uint8_t *)&v26, 0xCu);
      }

      -[BRCSyncUpOperationBuilder op](self, "op");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverZone");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v21);
    }
    v15 = v22;

  }
  return v15;
}

- (void)prepareAppLibraryRootSyncUpForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;

  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mangledID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isPrivateZone") & 1) == 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v4, "appLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "state") & 0x300002) != 0x200000)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[BRCSyncUpOperationBuilder op](self, "op");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createdAppLibraryNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraryOrZoneName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v4, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE17550])
      || (objc_msgSend(v6, "isCloudDocsMangledID") & 1) != 0)
    {

      goto LABEL_8;
    }
    objc_msgSend(v4, "appLibrary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isiCloudDesktopAppLibrary");

    if ((v40 & 1) == 0)
    {
      v14 = objc_alloc(MEMORY[0x24BDB91F8]);
      objc_msgSend(v4, "clientZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "zoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithZoneName:ownerName:", v16, *MEMORY[0x24BDB8E88]);

      objc_msgSend(v4, "appLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "childBasehashSalt");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDB91D8], "rootAppLibraryRecordForAppLibraryID:zoneID:", v6, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19)
      {
        objc_msgSend(v20, "brc_fillWithChildBasehashSalt:", v19);
        objc_msgSend(v4, "appLibrary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "saltingState");

        if (v23 <= 1)
          v24 = 3;
        else
          v24 = v23;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("saltingState"));

      }
      objc_msgSend(v4, "appLibrary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "includesDataScope"))
      {

      }
      else
      {
        objc_msgSend(v4, "appLibrary");
        v41 = v19;
        v27 = v17;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "mangledID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "optimisticallyPCSChainWithSession:", self->_session);

        v17 = v27;
        v19 = v41;

        if (v31)
          objc_msgSend(v21, "setWantsChainPCS:", 1);
      }
      if (v21)
      {
        brc_bread_crumbs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:].cold.1();

        -[BRCSyncUpOperationBuilder op](self, "op");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "recordsToSave");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v21);

        -[BRCSyncUpOperationBuilder op](self, "op");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "createdAppLibraryNames");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appLibraryOrZoneName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v38);

      }
    }
  }
LABEL_11:

}

- (float)fakeSyncForItem:(id)a3 serverItem:(id)a4 inZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id *v65;
  uint64_t v66[3];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ckInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "etag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {

  }
  else
  {
    v13 = objc_msgSend(v9, "isSharedZone");

    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:].cold.2();

      objc_msgSend(v7, "prepareForSyncUpSideCarZone");
      objc_msgSend(v7, "markLatestSyncRequestAcknowledgedInZone:", &unk_24FEB3458);
    }
  }
  v16 = objc_msgSend(v7, "localDiffs", self);
  objc_msgSend(v65, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "syncUpScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dbRowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "inFlightDiffsForItem:zoneRowID:", v7, v19);

  if (objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    objc_msgSend(MEMORY[0x24BDB91E8], "brc_fetchShareIDWithSharedItem:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "brc_shareItemID");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serverItemByItemID:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isLive");

    v26 = v25 ^ 1;
    if ((v25 & 1) == 0)
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v68 = (uint64_t)v7;
        v69 = 2112;
        v70 = v27;
        _os_log_impl(&dword_230455000, v28, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the root share is dead%@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (!objc_msgSend(v7, "isSharedToMeTopLevelItem"))
      goto LABEL_15;
    objc_msgSend(v7, "clientZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "serverItemByItemID:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isLive");

    if ((v32 & 1) != 0)
    {
LABEL_15:
      v26 = 0;
      goto LABEL_20;
    }
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v68 = (uint64_t)v7;
      v69 = 2112;
      v70 = v21;
      _os_log_impl(&dword_230455000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking %@ as rejected because the server item is dead%@", buf, 0x16u);
    }
    v26 = 1;
  }

LABEL_20:
  if (objc_msgSend(v7, "isDocumentBeingCopiedToNewZone"))
  {
    brc_bread_crumbs();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:].cold.1();

  }
  v35 = v20 | v16;
  if (v26)
  {
    objc_msgSend(v7, "markForceRejected");
    goto LABEL_38;
  }
  if ((objc_msgSend(v7, "isKnownByServer") & 1) != 0 || !objc_msgSend(v7, "isSharedToMeChildItem"))
  {
    objc_msgSend(v7, "prepareForSyncUpInZone:", v9);
    objc_msgSend(v9, "dbRowID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markLatestSyncRequestAcknowledgedInZone:", v40);

    if ((objc_msgSend(v8, "sharingOptions") & 0x20) != 0 && objc_msgSend(v7, "isDocument"))
    {
      objc_msgSend(v7, "asDocument");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "currentVersion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "ckInfo");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {

        if ((v35 & 0x180000) != 0)
        {
          objc_msgSend(v7, "asDocument");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "currentVersion");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v7, "asDocument");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "fileIDForUpload");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "brc_errorItemIneligibleFromSyncForInode:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setUploadError:", v49);

        }
      }
      else
      {

      }
    }
LABEL_38:
    v39 = 0;
    if ((v35 & 0x1000000000000000) != 0)
      goto LABEL_50;
    goto LABEL_39;
  }
  if (objc_msgSend(v7, "isDocument"))
  {
    objc_msgSend(v7, "asDocument");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "currentVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemIneligibleFromSyncForInode:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setUploadError:", v38);

  }
  v39 = 1;
  if ((v35 & 0x1000000000000000) == 0)
  {
LABEL_39:
    if (v8)
      goto LABEL_41;
    objc_msgSend(v9, "clientZone");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "serverItemByItemID:", v51);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_41:
      memset(v66, 0, sizeof(v66));
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:]", 555, v66);
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v68 = v66[0];
        v69 = 2112;
        v70 = v8;
        v71 = 2112;
        v72 = v52;
        _os_log_debug_impl(&dword_230455000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-scheduling apply jobs for %@ because it finished sync-up%@", buf, 0x20u);
      }

      v54 = objc_msgSend(v7, "isDead");
      if (v54)
        v55 = 0;
      else
        v55 = v7;
      v56 = v55;
      objc_msgSend(v65[5], "applyScheduler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (v54)
        v59 = 1;
      else
        v59 = 2;
      objc_msgSend(v57, "createApplyJobFromServerItem:localItem:state:kind:", v8, v56, 1, v59);

      __brc_leave_section(v66);
    }
  }
LABEL_50:
  objc_msgSend(v7, "saveToDB");
  if (v39)
  {
    objc_msgSend(v9, "session");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "syncUpScheduler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dbRowID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setState:forItem:zone:", 52, v7, v62);

  }
  return -1.0;
}

- (void)handleDeletionOfSharedItem:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BDB91E8];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initShareIDWithShareableItem:", v5);

  -[BRCSyncUpOperationBuilder op](self, "op");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletedRecordIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)handleEditOfSharedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "itemScope") == 3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initShareIDWithShareableItem:", v4);
    objc_msgSend(v4, "st");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iWorkShareable");

    -[BRCSyncUpOperationBuilder op](self, "op");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "iworkUnsharedShareIDs");
    else
      objc_msgSend(v8, "deletedRecordIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v5);

    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:].cold.1();
LABEL_10:

    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "localDiffs") & 0x40) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initShareIDWithShareableItem:", v4);
    objc_msgSend(v4, "st");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logicalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder op](self, "op");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renamedShareIDsToNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v5);

    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:].cold.2();
    goto LABEL_10;
  }
LABEL_11:

}

- (float)addEditOfDirectory:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  int v29;
  void *v30;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  NSObject *v38;
  int v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v6 = (v5 & 1) != 0 || (objc_msgSend(v4, "localDiffs") & 0x3FFE) != 0;
  v7 = objc_msgSend(v4, "isKnownByServer");
  objc_msgSend(v4, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isDocumentsFolder") & 1) == 0)
  {

LABEL_10:
    if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
    {
      objc_msgSend(v4, "asShareableItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder handleEditOfSharedItem:](self, "handleEditOfSharedItem:", v11);

    }
    if (v6)
    {
      v12 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
      -[BRCSyncUpOperationBuilder op](self, "op");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stageID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateChildBasehashSaltGetterBlock](self, "_generateChildBasehashSaltGetterBlock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v5, v14, v12, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (objc_msgSend(v4, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 0)
          && objc_msgSend(v4, "isNewToServer:", 0))
        {
          objc_msgSend(v17, "encryptedValues");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("childBasehashSalt"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            brc_bread_crumbs();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              -[BRCSyncUpOperationBuilder addEditOfDirectory:].cold.1();

          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24FEB3470, CFSTR("saltingState"));
        }
        brc_bread_crumbs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v32 = "half chained ";
          if ((_DWORD)v12 != 2)
            v32 = "";
          if ((v12 & 0x2C) != 0)
            v33 = "pcs chained ";
          else
            v33 = v32;
          objc_msgSend(v17, "description");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          v36 = "\n(dead in server truth)";
          v39 = 136315906;
          v40 = v33;
          if (!(_DWORD)v5)
            v36 = "";
          v41 = 2112;
          v42 = v34;
          v43 = 2080;
          v44 = v36;
          v45 = 2112;
          v46 = v20;
          _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdirectory record %@%s%@", (uint8_t *)&v39, 0x2Au);

        }
        -[BRCSyncUpOperationBuilder op](self, "op");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "recordsToSave");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v17);

        if (objc_msgSend(v4, "isFromInitialScan"))
        {
          -[BRCSyncUpOperationBuilder defaults](self, "defaults");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "syncUpInitialItemCost");
        }
        else
        {
          v29 = objc_msgSend(v4, "isKnownByServer");
          -[BRCSyncUpOperationBuilder defaults](self, "defaults");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v30;
          if (v29)
            objc_msgSend(v30, "syncUpStructureEditCost");
          else
            objc_msgSend(v30, "syncUpStructureCreateCost");
        }
        v10 = v25;

      }
      else
      {
        v10 = -1.0;
      }

    }
    else
    {
      -[BRCSyncUpOperationBuilder op](self, "op");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "serverZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v27);
      v10 = v28;

    }
    goto LABEL_28;
  }
  objc_msgSend(v4, "appLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "state") & 0x40000) == 0)
    v7 = 1;

  v10 = -1.0;
  if (v7 == 1)
    goto LABEL_10;
LABEL_28:

  return v10;
}

- (float)addDeletionOfDirectory:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleDeletionOfSharedItem:](self, "handleDeletionOfSharedItem:", v5);

  }
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
  v7 = v6;

  return v7;
}

- (float)addDeletionOfAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  void *v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "targetClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSharedZone"))
  {
    objc_msgSend(v4, "targetItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemByItemID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asSharedToMeTopLevelItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "parentClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToClientZone:", v10);

    if (v11)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for alias item alive in the same zone as the target %@%@", (uint8_t *)&v21, 0x16u);
      }

      objc_msgSend(v4, "serverZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v14);
      v16 = v15;

      goto LABEL_9;
    }

  }
  if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCSyncUpOperationBuilder addDeletionOfItem:].cold.1();

  }
  -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
  v16 = v17;
LABEL_9:

  return v16;
}

- (float)addDeletionOfDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  int v24;
  BRCSyncUpOperationBuilder *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleDeletionOfSharedItem:](self, "handleDeletionOfSharedItem:", v6);

  }
  objc_msgSend(v4, "currentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ckInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasEtag") & 1) != 0 || objc_msgSend(v8, "hasEtagBeforeCrossZoneMove"))
  {
    objc_msgSend(v4, "documentRecordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder addDeletionOfRecordID:ckInfo:](self, "addDeletionOfRecordID:ckInfo:", v9, v8);
    -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
    v10 = objc_msgSend(v4, "isInDocumentScope");
    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "syncUpDocumentDeleteCost");
    else
      objc_msgSend(v11, "syncUpDataDeleteCost");
    v14 = v13;

  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412546;
      v25 = self;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Not syncing deletion of ETag-less version: %@%@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(v4, "clientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serverItemByItemID:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isLive"))
    {
      objc_msgSend(v4, "session");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "applyScheduler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createApplyJobFromServerItem:localItem:state:kind:", v9, 0, 1, 1);

    }
    objc_msgSend(v5, "serverZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v9, v21);
    v14 = v22;

  }
  return v14;
}

- (BOOL)_recoverItemIDChangedWhileUploadingIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "currentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uploadedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v4, "itemID"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v8, "isEqualToItemID:", v9),
          v9,
          (v10 & 1) == 0))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v8;
        v19 = 2112;
        v20 = v16;
        v21 = 2112;
        v22 = v12;
        _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ItemID changed while uploading (%@ -> %@), starting over%@", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(v4, "currentVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clearUploadedAssets");

      objc_msgSend(v4, "markNeedsUploadOrSyncingUp");
      objc_msgSend(v4, "saveToDB");
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_validateSharedDocumentFieldsForRecord:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[BRCSyncUpOperationBuilder _recoverItemIDChangedWhileUploadingIfNecessary:](self, "_recoverItemIDChangedWhileUploadingIfNecessary:", v7))
  {
    goto LABEL_5;
  }
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v8, 0);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "currentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clearUploadedAssets");

    objc_msgSend(v7, "markNeedsUploadOrSyncingUp");
    objc_msgSend(v7, "saveToDB");
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (float)addEditOfDocument:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  float v50;
  void *v51;
  char isKindOfClass;
  void *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  float v67;
  void *v68;
  char v69;
  void *v70;
  float v71;
  int v72;
  void *v73;
  void *v74;
  float v75;
  void *v76;
  char v77;
  void *v78;
  int v79;
  uint64_t v80;
  void *v81;
  __CFString *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  double Current;
  double v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  uint64_t v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  int v106;
  void *v107;
  void *v108;
  float v109;
  void *v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  char *v114;
  NSObject *v115;
  double v116;
  _BOOL4 v117;
  double v118;
  const char *v119;
  const char *v120;
  char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  int v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  char *v144;
  NSObject *v145;
  const char *v147;
  char *v148;
  const char *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  id v154;
  void *v155;
  void *v156;
  unsigned int v157;
  unint64_t v158;
  void *v159;
  id v160;
  id v161;
  uint8_t buf[4];
  const char *v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  void *v167;
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v7 = objc_msgSend(v4, "localDiffs");
  objc_msgSend(v4, "st");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ckInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || (v6 & 1) != 0)
  {
    objc_msgSend(v4, "st");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iWorkShareable");

    if ((v12 & v6) == 1)
    {
      v13 = objc_msgSend(v4, "sharingOptions");
      v14 = (v13 & 4) == 0;
      v158 = (unint64_t)(v13 & 4) >> 2;
      goto LABEL_8;
    }
    LOBYTE(v158) = v12;
  }
  else
  {

    LOBYTE(v158) = 0;
  }
  v14 = 0;
LABEL_8:
  v15 = v7 & 0x3FFE;
  v16 = v7 & 0x1FE0000;
  if (!objc_msgSend(v4, "sharingOptions"))
    goto LABEL_17;
  objc_msgSend(v4, "currentVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ckInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

    goto LABEL_17;
  }
  objc_msgSend(v4, "clientZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isPrivateZone"))
  {

  }
  else
  {
    v20 = objc_msgSend(v4, "isSharedToMeTopLevelItem");

    if (!v20)
      goto LABEL_17;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.8();

  LOBYTE(v158) = 1;
LABEL_17:
  v159 = (void *)v5;
  v23 = objc_msgSend(v4, "localDiffs");
  v24 = v16 == 0;
  v25 = (v23 >> 59) & 1;
  if (v24)
    v26 = v25 | v6;
  else
    v26 = 1;
  if (v15)
    v27 = 1;
  else
    v27 = v25 | v6;
  objc_msgSend(v4, "serverZone");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isSharedZone");

  if (v29)
  {
    v27 = objc_msgSend(v4, "isSharedToMeChildItem");
    objc_msgSend(v4, "clientZone");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "serverItemByItemID:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v6 && (objc_msgSend(v4, "isSharedToMeTopLevelItem") & 1) != 0
      || (v32 ? (v33 = v32) : (v33 = v4), (objc_msgSend(v33, "sharingOptions") & 0x20) != 0))
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.7();

      v26 = 0;
    }

  }
  v36 = v25 | v14;
  v37 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  if ((v37 & 6) != 0)
    v38 = v27;
  else
    v38 = 1;
  if ((v37 & 4) != 0)
    v39 = v26;
  else
    v39 = 1;
  if (v39)
    v40 = v37;
  else
    v40 = 2;
  if (v38)
    v41 = v40;
  else
    v41 = 1;
  v157 = v41;
  if ((v41 & 0xC) != 0)
  {
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.6();

    v27 = 1;
  }
  else if (!v26)
  {
    v153 = v36;
    v154 = 0;
    v46 = 0;
    v54 = 0;
    v44 = v159;
    goto LABEL_62;
  }
  v44 = v159;
  objc_msgSend(v4, "currentVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "uploadedAssets");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v46, "brc_isfakeRecordWithErrorMarkerFor20716676"))
  {
    brc_bread_crumbs();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.1();

    objc_msgSend(v4, "markForceUpload");
    objc_msgSend(v4, "saveToDB");
    v49 = 0;
LABEL_55:
    v50 = -1.0;
    goto LABEL_182;
  }
  if (v46)
  {
    v50 = -1.0;
    if (!-[BRCSyncUpOperationBuilder _validateSharedDocumentFieldsForRecord:item:](self, "_validateSharedDocumentFieldsForRecord:item:", v46, v4))
    {
      v49 = 0;
      goto LABEL_182;
    }
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v153 = v36;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("thumb1024"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v53, "isRereferencedAssetUpload") & 1) != 0)
      {
        v49 = 0;
      }
      else
      {
        objc_msgSend(v53, "fileURL");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = 0;
        v77 = objc_msgSend(v76, "checkResourceIsReachableAndReturnError:", &v161);
        v154 = v161;

        if ((v77 & 1) == 0)
        {
          brc_bread_crumbs();
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, (os_log_type_t)0x90u))
            -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.5();

          objc_msgSend(v4, "markForceUpload");
          objc_msgSend(v4, "saveToDB");
LABEL_122:

          goto LABEL_166;
        }
        v49 = v154;
      }

    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v4, "currentVersion");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "isPackage");

    if (v79)
    {
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("pkgContent"));
      v80 = objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        v81 = (void *)v80;
        v155 = v49;
        v82 = CFSTR("pkgManifest");
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
        v83 = objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          v84 = (void *)v83;
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("pkgSignature"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v155;
          if (v85)
          {
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("pkgContent"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("thumb1024"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v150 = v86;
            objc_msgSend(v86, "earliestUploadReceiptExpiration");
            v90 = v89;
            Current = CFAbsoluteTimeGetCurrent();
            v92 = Current;
            v151 = v88;
            if (v90 == 0.0)
              goto LABEL_138;
            if (v90 >= Current)
            {
              objc_msgSend(v87, "deviceID");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend(v86, "longLongValue");
              -[BRCAccountSessionFPFS volume](self->_session, "volume");
              v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v93 == (int)-[__CFString deviceID](v82, "deviceID"))
              {
                v88 = v151;
LABEL_138:
                if (objc_msgSend(v87, "size") && (objc_msgSend(v87, "uploadReceiptExpiration"), v116 < v92))
                {
                  v117 = 1;
                }
                else if (objc_msgSend(v88, "size"))
                {
                  objc_msgSend(v88, "uploadReceiptExpiration");
                  v117 = v118 < v92;
                }
                else
                {
                  v117 = 0;
                }
                if (v90 == 0.0)
                {
                  if (v117)
                    goto LABEL_178;
                }
                else
                {

                  if (v117)
                    goto LABEL_178;
                }

                goto LABEL_154;
              }

            }
LABEL_178:
            brc_bread_crumbs();
            v144 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v145 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v163 = (const char *)v4;
              v164 = 2112;
              v165 = v144;
              _os_log_impl(&dword_230455000, v145, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
            }

            objc_msgSend(v4, "markForceUpload");
            objc_msgSend(v4, "saveToDB");

            goto LABEL_181;
          }
        }
        else
        {

        }
      }
      brc_bread_crumbs();
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT))
        -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.3();
LABEL_126:

      objc_msgSend(v4, "markForceUpload");
      objc_msgSend(v4, "saveToDB");
LABEL_181:
      v44 = v159;
      goto LABEL_182;
    }
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("fileContent"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {

    }
    else
    {
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("bookmarkContent"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v95)
      {
        brc_bread_crumbs();
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT))
          -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.4();
        goto LABEL_126;
      }
    }
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("fileContent"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("thumb1024"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = CFAbsoluteTimeGetCurrent();
    if (objc_msgSend(v96, "size"))
    {
      objc_msgSend(v96, "uploadReceiptExpiration");
      if (v99 >= v98)
      {
        v156 = v49;
        objc_msgSend(v96, "deviceID");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "longLongValue");
        -[BRCAccountSessionFPFS volume](self->_session, "volume");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        if (v101 == (int)objc_msgSend(v102, "deviceID"))
        {
          if (!objc_msgSend(v97, "size"))
          {

            v49 = v156;
LABEL_153:

LABEL_154:
            v44 = v159;
            goto LABEL_155;
          }
          objc_msgSend(v97, "uploadReceiptExpiration");
          v104 = v103;

          v49 = v156;
          if (v104 >= v98)
            goto LABEL_153;
        }
        else
        {

          v49 = v156;
        }
      }
    }
    else
    {
      if (!objc_msgSend(v97, "size"))
        goto LABEL_153;
      objc_msgSend(v97, "uploadReceiptExpiration");
      if (v105 >= v98)
        goto LABEL_153;
    }
    brc_bread_crumbs();
    v114 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v163 = (const char *)v4;
      v164 = 2112;
      v165 = v114;
      _os_log_impl(&dword_230455000, v115, OS_LOG_TYPE_DEFAULT, "[WARNING] Forcing re-upload of an item which has an expired put receipt - %@%@", buf, 0x16u);
    }

    objc_msgSend(v4, "markForceUpload");
    objc_msgSend(v4, "saveToDB");

    goto LABEL_181;
  }
  if (objc_msgSend(v4, "contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:", v6))
  {
    brc_bread_crumbs();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.2();

    objc_msgSend(v4, "markForceUpload");
    objc_msgSend(v4, "saveToDB");
    v49 = 0;
    v46 = 0;
    goto LABEL_55;
  }
  v153 = v36;
  objc_msgSend(v4, "baseRecord");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
LABEL_155:
  v123 = objc_msgSend(v4, "localDiffs");
  -[BRCSyncUpOperationBuilder _getSaltForItem:](self, "_getSaltForItem:", v4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v49;
  LOBYTE(v123) = objc_msgSend(v46, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, v123, v6, v124, &v160);
  v154 = v160;

  if ((v123 & 1) == 0)
  {
    brc_bread_crumbs();
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v142 = objc_claimAutoreleasedReturnValue();
    v49 = v154;
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v163 = (const char *)v154;
      v164 = 2112;
      v165 = (const char *)v4;
      v166 = 2112;
      v167 = v141;
      _os_log_debug_impl(&dword_230455000, v142, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
    }

    goto LABEL_55;
  }
  objc_msgSend(v4, "session");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v46, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v125, 0);

  v50 = -1.0;
  if (!v126)
  {
LABEL_166:
    v49 = v154;
    goto LABEL_182;
  }
  objc_msgSend(v4, "resolvedConflictLoserEtags");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v127;
  if (objc_msgSend(v127, "count"))
  {
    objc_msgSend(v127, "allObjects");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "conflictLosersToResolveByRecordID");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "recordID");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setObject:forKeyedSubscript:", v128, v130);

    v127 = v152;
  }
  v54 = v46 != 0;
  if (!v46)
    goto LABEL_173;
  if ((v157 & 0x2C) != 0)
  {
    objc_msgSend(v4, "itemID");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverZone");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "zoneID");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "pcsChainDocumentStructureReferenceInZoneID:", v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setParent:", v134);

    v127 = v152;
  }
  brc_bread_crumbs();
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v136 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
  {
    if ((v157 & 0x2C) != 0)
      v147 = "pcs chained ";
    else
      v147 = "";
    objc_msgSend(v46, "description");
    v148 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v163 = v147;
    v164 = 2112;
    v165 = v148;
    v166 = 2112;
    v167 = v135;
    _os_log_debug_impl(&dword_230455000, v136, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sversion record %@%@", buf, 0x20u);

    v127 = v152;
  }

  brc_bread_crumbs();
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v138 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
  {
    v149 = "";
    *(_DWORD *)buf = 138412802;
    v163 = (const char *)v4;
    if ((_DWORD)v6)
      v149 = "\n(dead in server truth)";
    v164 = 2080;
    v165 = v149;
    v166 = 2112;
    v167 = v137;
    _os_log_debug_impl(&dword_230455000, v138, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  v44 = v159;
  objc_msgSend(v159, "recordsToSave");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "addObject:", v46);

  if ((v158 & 1) != 0)
  {
    objc_msgSend(v159, "recordsNeedingUpdatedSharingProtectionInfo");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_172:
    v143 = v140;
    objc_msgSend(v140, "addObject:", v46);

    goto LABEL_173;
  }
  if (v153)
  {
    objc_msgSend(v159, "recordsNeedingNewSharingProtectionInfo");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_172;
  }
LABEL_173:

LABEL_62:
  if (objc_msgSend(v4, "hasShareIDAndIsOwnedByMe"))
  {
    objc_msgSend(v4, "asShareableItem");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder handleEditOfSharedItem:](self, "handleEditOfSharedItem:", v55);

  }
  if (!v27)
  {
    if (v54)
    {
LABEL_85:
      v69 = objc_msgSend(v4, "isInDocumentScope");
      v49 = v154;
      if (objc_msgSend(v4, "isFromInitialScan"))
      {
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "syncUpInitialItemCost");
      }
      else
      {
        v72 = objc_msgSend(v4, "isKnownByServer");
        -[BRCSyncUpOperationBuilder defaults](self, "defaults");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v73;
        if (v72)
        {
          if ((v69 & 1) != 0)
            objc_msgSend(v73, "syncUpDocumentEditCost");
          else
            objc_msgSend(v73, "syncUpDataEditCost");
        }
        else if ((v69 & 1) != 0)
        {
          objc_msgSend(v73, "syncUpDocumentCreateCost");
        }
        else
        {
          objc_msgSend(v73, "syncUpDataCreateCost");
        }
      }
      v50 = v71;

      goto LABEL_182;
    }
    objc_msgSend(v44, "serverZone");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v53);
    v50 = v67;
    goto LABEL_122;
  }
  objc_msgSend(v44, "stageID");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v6, v56, v157, v57, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    v46 = 0;
    v50 = -1.0;
    goto LABEL_166;
  }
  brc_bread_crumbs();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    v119 = "";
    if (v157 == 2)
      v119 = "half chained ";
    if ((v157 & 0x2C) != 0)
      v120 = "pcs chained ";
    else
      v120 = v119;
    objc_msgSend(v58, "description");
    v121 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v163 = v120;
    v164 = 2112;
    v165 = v121;
    v166 = 2112;
    v167 = v59;
    _os_log_debug_impl(&dword_230455000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sdocument structure record %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    v122 = "";
    *(_DWORD *)buf = 138412802;
    v163 = (const char *)v4;
    if ((_DWORD)v6)
      v122 = "\n(dead in server truth)";
    v164 = 2080;
    v165 = v122;
    v166 = 2112;
    v167 = v61;
    _os_log_debug_impl(&dword_230455000, v62, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
  }

  objc_msgSend(v44, "recordsToSave");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addObject:", v58);

  if ((v158 & 1) != 0)
  {
    objc_msgSend(v44, "recordsNeedingUpdatedSharingProtectionInfo");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v153)
      goto LABEL_83;
    objc_msgSend(v44, "recordsNeedingNewSharingProtectionInfo");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v68 = v64;
  objc_msgSend(v64, "addObject:", v58);

LABEL_83:
  if (v54)
  {
    v46 = v58;
    goto LABEL_85;
  }
  if (objc_msgSend(v4, "isFromInitialScan"))
  {
    -[BRCSyncUpOperationBuilder defaults](self, "defaults");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "syncUpInitialItemCost");
    v50 = v75;

    v46 = v58;
    goto LABEL_166;
  }
  v106 = objc_msgSend(v4, "isKnownByServer");
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v107;
  v49 = v154;
  if (v106)
    objc_msgSend(v107, "syncUpStructureEditCost");
  else
    objc_msgSend(v107, "syncUpStructureCreateCost");
  v50 = v109;

  v46 = v58;
LABEL_182:

  return v50;
}

- (float)addEditOfFinderBookmark:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  float v15;
  void *v16;
  char v17;
  char *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  const char *v40;
  char *v41;
  const char *v42;
  char v43;
  char *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  if ((v5 & 1) != 0)
  {
    v6 = 1;
    v7 = 1;
  }
  else
  {
    v6 = (objc_msgSend(v4, "localDiffs") & 0x3FFE) != 0;
    v7 = (objc_msgSend(v4, "localDiffs") & 0x1FE0000) != 0;
  }
  v8 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  v9 = v8 & 0x2C;
  v10 = (v8 & 0x2C) != 0 || v6;
  objc_msgSend(v4, "currentVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uploadedAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_13:
    if (((v7 | v10) & 1) == 0)
    {
      -[BRCSyncUpOperationBuilder op](self, "op");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serverZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, 0, v22);
      v15 = v23;

LABEL_38:
      goto LABEL_39;
    }
    -[BRCSyncUpOperationBuilder _getSaltForItem:](self, "_getSaltForItem:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v46 = 0;
      v17 = objc_msgSend(v12, "serializeVersion:diffs:deadInServerTruth:basehashSalt:error:", v4, objc_msgSend(v4, "localDiffs"), v5, v16, &v46);
      v18 = (char *)v46;
      if ((v17 & 1) == 0)
      {
        brc_bread_crumbs();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = v18;
          v49 = 2112;
          v50 = (const char *)v4;
          v51 = 2112;
          v52 = v19;
          _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        v15 = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      v18 = 0;
    }
    if (v10)
    {
      v43 = v8 & 0x2C;
      v44 = v18;
      v24 = objc_msgSend(v4, "localDiffs");
      -[BRCSyncUpOperationBuilder op](self, "op");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stageID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      LOBYTE(v24) = objc_msgSend(v12, "serializeStatInfo:diffs:stageID:deadInServerTruth:shouldPCSChainStatus:basehashSaltGetter:childBasehashSaltGetter:error:", v4, v24, v26, v5, v8, v27, 0, &v45);
      v19 = v45;

      if ((v24 & 1) == 0)
      {
        brc_bread_crumbs();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v48 = (const char *)v19;
          v49 = 2112;
          v50 = (const char *)v4;
          v51 = 2112;
          v52 = v35;
          _os_log_debug_impl(&dword_230455000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] Error creating record %@ for item %@%@", buf, 0x20u);
        }

        v15 = -1.0;
        v18 = v44;
        goto LABEL_36;
      }

      v18 = v44;
      v9 = v43;
    }
    v15 = -1.0;
    if (!-[BRCSyncUpOperationBuilder _validateSharedDocumentFieldsForRecord:item:](self, "_validateSharedDocumentFieldsForRecord:item:", v12, v4))
    {
LABEL_37:

      goto LABEL_38;
    }
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      if (v9)
        v40 = "pcs chained ";
      else
        v40 = "";
      objc_msgSend(v12, "description");
      v41 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v48 = v40;
      v49 = 2112;
      v50 = v41;
      v51 = 2112;
      v52 = v28;
      _os_log_debug_impl(&dword_230455000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %sfinder alias record %@%@", buf, 0x20u);

    }
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v42 = "";
      *(_DWORD *)buf = 138412802;
      v48 = (const char *)v4;
      if ((_DWORD)v5)
        v42 = "\n(dead in server truth)";
      v49 = 2080;
      v50 = v42;
      v51 = 2112;
      v52 = v30;
      _os_log_debug_impl(&dword_230455000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] for %@%s%@", buf, 0x20u);
    }

    -[BRCSyncUpOperationBuilder op](self, "op");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recordsToSave");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v12);

    if (objc_msgSend(v4, "isFromInitialScan"))
    {
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "syncUpInitialItemCost");
    }
    else
    {
      v37 = objc_msgSend(v4, "isKnownByServer");
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v38;
      if (v37)
        objc_msgSend(v38, "syncUpStructureEditCost");
      else
        objc_msgSend(v38, "syncUpStructureCreateCost");
    }
    v15 = v34;
LABEL_36:

    goto LABEL_37;
  }
  if (!objc_msgSend(v4, "contentRecordNeedsForceAllFieldsWhenDeadInServerTruth:", v5))
  {
    objc_msgSend(v4, "baseRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCSyncUpOperationBuilder addEditOfDocument:].cold.2();

  objc_msgSend(v4, "markForceUpload");
  objc_msgSend(v4, "saveToDB");
  v15 = -1.0;
LABEL_39:

  return v15;
}

- (float)addDeletionOfFinderBookmark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;

  v4 = a3;
  -[BRCSyncUpOperationBuilder op](self, "op");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletedRecordIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  -[BRCSyncUpOperationBuilder defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncUpDocumentDeleteCost");
  v10 = v9;

  return v10;
}

- (float)addEditOfSymlink:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  int v18;
  void *v19;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isDeadOrMissingInServerTruth");
  v6 = -[BRCSyncUpOperationBuilder shouldPCSChainStatusForItem:](self, "shouldPCSChainStatusForItem:", v4);
  -[BRCSyncUpOperationBuilder op](self, "op");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncUpOperationBuilder _generateSaltGetterBlock](self, "_generateSaltGetterBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "structureRecordBeingDeadInServerTruth:stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:", v5, v8, v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if ((v6 & 0x2C) != 0)
        v21 = "pcs chained ";
      else
        v21 = "";
      objc_msgSend(v10, "description");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = "\n(dead in server truth)";
      v25 = 136315906;
      v26 = v21;
      if (!(_DWORD)v5)
        v24 = "";
      v27 = 2112;
      v28 = v22;
      v29 = 2080;
      v30 = v24;
      v31 = 2112;
      v32 = v11;
      _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Syncing up %ssymlink record %@%s%@", (uint8_t *)&v25, 0x2Au);

    }
    -[BRCSyncUpOperationBuilder op](self, "op");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordsToSave");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);

    if (objc_msgSend(v4, "isFromInitialScan"))
    {
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "syncUpInitialItemCost");
    }
    else
    {
      v18 = objc_msgSend(v4, "isKnownByServer");
      -[BRCSyncUpOperationBuilder defaults](self, "defaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (v18)
        objc_msgSend(v19, "syncUpStructureEditCost");
      else
        objc_msgSend(v19, "syncUpStructureCreateCost");
    }
    v17 = v16;

  }
  else
  {
    v17 = -1.0;
  }

  return v17;
}

- (float)addItem:(id)a3
{
  id v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  NSObject *v24;
  void *v25;
  float v26;
  void *v27;
  NSObject *v28;
  void *v29;
  float v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  float v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "captureLogsForOperationType:ofSubtype:withContext:", CFSTR("SyncHealth"), CFSTR("SyncUp"), CFSTR("AppLibrary is nil"));

    -[BRCSyncUpOperationBuilder session](self, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "analyticsReporter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "aggregateReportForAppTelemetryIdentifier:error:", 216, 0);

    v6 = -1.0;
    goto LABEL_18;
  }
  -[BRCSyncUpOperationBuilder prepareAppLibraryRootSyncUpForItem:](self, "prepareAppLibraryRootSyncUpForItem:", v4);
  v6 = -1.0;
  if (-[BRCSyncUpOperationBuilder checkIfSyncAllowedInSharedZoneForItem:](self, "checkIfSyncAllowedInSharedZoneForItem:", v4)&& !-[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToSaltingBasehashItem:](self, "_checkIfShouldDedicateOpToSaltingBasehashItem:", v4)&& !-[BRCSyncUpOperationBuilder _checkIfShouldDedicateOpToPCSChainingItem:](self, "_checkIfShouldDedicateOpToPCSChainingItem:", v4))
  {
    -[BRCSyncUpOperationBuilder op](self, "op");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "preventRecordSyncWithoutDiffs");

    if (!v11)
      goto LABEL_10;
    objc_msgSend(v4, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverItemByItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (v15 = objc_msgSend(v4, "diffAgainstServerItem:", v14),
          (objc_msgSend(v4, "metadataSyncUpMask:", 1) & v15) != 0)
      || (objc_msgSend(v4, "forceNeedsSyncUpWithoutDiffs") & 1) != 0)
    {

LABEL_10:
      if (objc_msgSend(v4, "isDead"))
      {
        if (objc_msgSend(v4, "isDeadOrMissingInServerTruth"))
        {
          if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
          {
            objc_msgSend(v4, "asSharedToMeTopLevelItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "insertTombstoneAliasRecordInZone:", 0);

          }
          brc_bread_crumbs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[BRCSyncUpOperationBuilder addItem:].cold.1();

          objc_msgSend(v4, "markNeedsDeleteWhenAlreadyDeadInServerTruth");
          objc_msgSend(v4, "saveToDB");
          goto LABEL_18;
        }
        v46 = 0;
        v47 = 0;
        v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1156, &v46);
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v42 = v46;
          objc_msgSend(v4, "st");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          BRCPrettyPrintEnumWithContext((int)objc_msgSend(v43, "type"), (uint64_t)&brc_item_type_pretty_entries, 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v50 = v42;
          v51 = 2112;
          v52 = v44;
          v53 = 2112;
          v54 = v4;
          v55 = 2112;
          v56 = v27;
          _os_log_debug_impl(&dword_230455000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Deleting %@ record for %@%@", buf, 0x2Au);

        }
        if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
        {
          objc_msgSend(v4, "asSharedToMeTopLevelItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfSharedTopLevelItem:](self, "addDeletionOfSharedTopLevelItem:", v29);
        }
        else if (objc_msgSend(v4, "isFinderBookmark"))
        {
          objc_msgSend(v4, "asFinderBookmark");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfFinderBookmark:](self, "addDeletionOfFinderBookmark:", v29);
        }
        else if (objc_msgSend(v4, "isDocument"))
        {
          objc_msgSend(v4, "asDocument");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfDocument:](self, "addDeletionOfDocument:", v29);
        }
        else if (objc_msgSend(v4, "isDirectory"))
        {
          objc_msgSend(v4, "asDirectory");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfDirectory:](self, "addDeletionOfDirectory:", v29);
        }
        else
        {
          if (!objc_msgSend(v4, "isBRAlias"))
          {
            -[BRCSyncUpOperationBuilder addDeletionOfItem:](self, "addDeletionOfItem:", v4);
            v6 = v45;
            goto LABEL_49;
          }
          objc_msgSend(v4, "asBRAlias");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCSyncUpOperationBuilder addDeletionOfAlias:](self, "addDeletionOfAlias:", v29);
        }
        v6 = v30;

LABEL_49:
        __brc_leave_section(&v46);
LABEL_50:
        if (v6 >= 0.0)
        {
          -[BRCSyncUpOperationBuilder op](self, "op");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "serverZone");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "prepareForSyncUpInZone:", v40);

        }
        goto LABEL_18;
      }
      v46 = 0;
      v47 = 0;
      v48 = 0;
      __brc_create_section(0, (uint64_t)"-[BRCSyncUpOperationBuilder addItem:]", 1172, &v46);
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v36 = v46;
        objc_msgSend(v4, "itemID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "debugItemIDString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v50 = v36;
        v51 = 2112;
        v52 = v38;
        v53 = 2112;
        v54 = v23;
        _os_log_debug_impl(&dword_230455000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx preparing sync-up of %@%@", buf, 0x20u);

      }
      if (objc_msgSend(v4, "isSharedToMeTopLevelItem"))
      {
        objc_msgSend(v4, "asSharedToMeTopLevelItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfSharedTopLevelItem:](self, "addEditOfSharedTopLevelItem:", v25);
      }
      else if (objc_msgSend(v4, "isFinderBookmark"))
      {
        objc_msgSend(v4, "asFinderBookmark");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfFinderBookmark:](self, "addEditOfFinderBookmark:", v25);
      }
      else if (objc_msgSend(v4, "isSymLink"))
      {
        objc_msgSend(v4, "asSymlink");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfSymlink:](self, "addEditOfSymlink:", v25);
      }
      else if (objc_msgSend(v4, "isDocument"))
      {
        objc_msgSend(v4, "asDocument");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfDocument:](self, "addEditOfDocument:", v25);
      }
      else
      {
        if (!objc_msgSend(v4, "isDirectory"))
        {
          brc_bread_crumbs();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            -[BRCSyncUpOperationBuilder addItem:].cold.2();

          v6 = 0.0;
          goto LABEL_45;
        }
        objc_msgSend(v4, "asDirectory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSyncUpOperationBuilder addEditOfDirectory:](self, "addEditOfDirectory:", v25);
      }
      v6 = v26;
LABEL_45:

      __brc_leave_section(&v46);
      goto LABEL_50;
    }
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v50 = (uint64_t)v4;
      v51 = 2112;
      v52 = v14;
      v53 = 2112;
      v54 = v31;
      _os_log_impl(&dword_230455000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Faking sync for item because it doesn't have field differences with the server item %@ vs %@%@", buf, 0x20u);
    }

    -[BRCSyncUpOperationBuilder op](self, "op");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serverZone");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncUpOperationBuilder fakeSyncForItem:serverItem:inZone:](self, "fakeSyncForItem:serverItem:inZone:", v4, v14, v34);
    v6 = v35;

  }
LABEL_18:

  return v6;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BRCSyncUpOperation)op
{
  return self->_op;
}

- (void)setOp:(id)a3
{
  objc_storeStrong((id *)&self->_op, a3);
}

- (BRCUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (BRCLocalItem)itemNeedingPCSChaining
{
  return self->_itemNeedingPCSChaining;
}

- (BRCDirectoryItem)itemNeedingBasehashSalting
{
  return self->_itemNeedingBasehashSalting;
}

- (NSData)rootChildBasehashSalt
{
  return self->_rootChildBasehashSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemNeedingBasehashSalting, 0);
  objc_storeStrong((id *)&self->_itemNeedingPCSChaining, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_op, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_rootChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_parentItemIDToChildBasehashSalt, 0);
  objc_storeStrong((id *)&self->_halfChainedParentIDWhitelist, 0);
  objc_storeStrong((id *)&self->_fullyChainedParentIDWhitelist, 0);
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[item.itemID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Sync: Dedicating sync op to metadata salting %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_checkIfShouldDedicateOpToSaltingBasehashItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _parentItemIDToChildBasehashSalt[parentItemID] == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_checkIfShouldDedicateOpToPCSChainingItem:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Sync: Dedicating sync op to pcs chaining %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Not allowing re-creation of shared to me top level item when the item is dead in the server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Waiting on server full sync before we fake sync shared to me top level item which is missing in the server truth%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)checkIfSyncAllowedInSharedZoneForItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] shared document is read-only, do not sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addDeletionOfItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !item.isSharedToMeTopLevelItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_getSaltForItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: parentItemID != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfSharedTopLevelItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(0, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a2, v4, "[DEBUG] Fake syncing up shared folder record %@%@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)addEditOfSharedTopLevelItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: unsupported top level item kind%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addDeletionOfSharedTopLevelItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Deleting alias in private zone %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)prepareAppLibraryRootSyncUpForItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Syncing up root app library record %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: We should never fake sync for an item being copied to a new zone that isn't a fault: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)fakeSyncForItem:serverItem:inZone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Also faking sync in side car for child item not known to the server %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)handleEditOfSharedItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Unsharing %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)handleEditOfSharedItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Editing name on shareID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: record.encryptedValues[kBRRecordKeyChildBasehashSalt]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] re-uploading uploaded record: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] forcing upload of %@\n(dead in server truth)%@");
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: package with no uploaded content - %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: File with no content signature - %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] thumbnail not found.  Force upload again%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] will pcs chain records%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] shared document is read-only, do not sync its version%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addEditOfDocument:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We need to update sharing info for this reset item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)addItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Deleting dead record already dead in the server truth %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)addItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: asked to syncup an unkown item type: %@%@");
  OUTLINED_FUNCTION_0();
}

@end
