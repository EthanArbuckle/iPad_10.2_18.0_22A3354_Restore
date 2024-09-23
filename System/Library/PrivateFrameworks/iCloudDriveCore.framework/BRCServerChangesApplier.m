@implementation BRCServerChangesApplier

- (BRCServerChangesApplier)initWithAccountSession:(id)a3
{
  id v5;
  BRCServerChangesApplier *v6;
  BRCServerChangesApplier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCServerChangesApplier;
  v6 = -[BRCServerChangesApplier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (BOOL)_handleServerItemBRAliasIfNeeded:(id)a3 li:(id)a4 jobID:(int64_t)a5 zone:(id)a6 diffs:(unint64_t)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v24;

  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(a4, "isBRAlias") & 1) != 0 || objc_msgSend(v11, "isBRAlias"))
  {
    -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aliasTargetClientZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isSharedZone"))
    {
      objc_msgSend(v11, "aliasTargetItemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serverItemByItemID:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        brc_bread_crumbs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[BRCServerChangesApplier _handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:].cold.2();

        objc_msgSend(v14, "itemByItemID:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createApplyJobFromServerItem:localItem:state:kind:", v17, v20, 1, 2);

        goto LABEL_14;
      }

    }
    if (!objc_msgSend(v11, "aliasTargetIsShared"))
    {
LABEL_15:
      objc_msgSend(v12, "dbRowID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setState:forRank:zoneRowID:", 0, a5, v24);

      v21 = 1;
      goto LABEL_16;
    }
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCServerChangesApplier _handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:].cold.1();

    -[BRCAccountSessionFPFS containerScheduler](self->_session, "containerScheduler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scheduleSyncDownForSharedDatabaseImmediately:", 0);
LABEL_14:

    goto LABEL_15;
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (void)applyChanges:(id)a3 localItem:(id)a4 rank:(int64_t)a5 zone:(id)a6
{
  int64_t v10;
  int64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  _BOOL8 v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  BRCServerChangesApplier *v48;
  char *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BRCServerChangesApplier *v57;
  NSObject *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  char *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[4];
  id v107;
  char v108;
  char v109;
  uint64_t v110[3];
  uint64_t v111;
  uint8_t buf[4];
  BRCServerChangesApplier *v113;
  __int16 v114;
  int64_t v115;
  __int16 v116;
  const char *v117;
  __int16 v118;
  int64_t v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  void *v123;
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v10 = (int64_t)a3;
  v11 = (int64_t)a4;
  v12 = a6;
  objc_msgSend(v12, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend((id)v11, "diffAgainstServerItem:", v10);
  memset(v110, 0, sizeof(v110));
  __brc_create_section(0, (uint64_t)"-[BRCServerChangesApplier applyChanges:localItem:rank:zone:]", 106, v110);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v38 = v110[0];
    BRCItemFieldsPrettyPrint();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    v41 = "existing";
    *(_DWORD *)buf = 134219266;
    v113 = (BRCServerChangesApplier *)v38;
    v114 = 2048;
    if (!v11)
      v41 = "new";
    v115 = a5;
    v116 = 2080;
    v117 = v41;
    v118 = 2112;
    v119 = v10;
    v120 = 2112;
    v121 = v39;
    v122 = 2112;
    v123 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Apply Changes[%lld]: %s item: %@\n diffs: %@%@", buf, 0x3Eu);

  }
  if (!(v10 | v11))
  {
    brc_bread_crumbs();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
      -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.5((uint64_t)v96, v97);

  }
  if (!v13)
  {
    brc_bread_crumbs();
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v113 = (BRCServerChangesApplier *)v10;
      v114 = 2112;
      v115 = v11;
      v116 = 2112;
      v117 = v16;
      _os_log_fault_impl(&dword_230455000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no client zone when applying %@ and %@%@", buf, 0x20u);
    }

  }
  v18 = +[BRCServerChangesApplyUtil deletingShareRoot:localItem:](BRCServerChangesApplyUtil, "deletingShareRoot:localItem:", v10, v11);
  v19 = -[BRCServerChangesApplier _handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:](self, "_handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:", v10, v11, a5, v12, v111);
  LOBYTE(v98) = v18;
  if (+[BRCServerChangesApplyUtil checkEarlyExitsPriorToApplying:si:rank:scheduler:zone:session:isDeleteOfShareRoot:diffs:clientZone:](BRCServerChangesApplyUtil, "checkEarlyExitsPriorToApplying:si:rank:scheduler:zone:session:isDeleteOfShareRoot:diffs:clientZone:", v11, v10, a5, v105, v12, self->_session, v98, v111, v13)|| v19)
  {
    goto LABEL_80;
  }
  if (!objc_msgSend((id)v10, "isLive"))
  {
    if (!+[BRCServerChangesApplyUtil handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:](BRCServerChangesApplyUtil, "handleApplyChangesForUnliveServerItem:isDeleteOfShareRoot:rank:scheduler:zone:session:", v11, v18, a5, v105, v12, self->_session))
    {
      objc_msgSend((id)v11, "markDead");
      objc_msgSend((id)v11, "saveToDBForServerEdit:keepAliases:", 1, 0);
      objc_msgSend((id)v11, "clientZone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "didApplyTombstoneForRank:", objc_msgSend((id)v10, "rank"));

      v104 = (void *)v11;
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  v109 = 0;
  if (objc_msgSend((id)v11, "isShareAcceptationFault"))
  {
    objc_msgSend((id)v11, "asShareAcceptationFault");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "markNeedsTransformIntoNormalFault");

    v109 = 1;
  }
  if (objc_msgSend((id)v10, "isDirectoryFault"))
  {
    objc_msgSend((id)v10, "itemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isDocumentsFolder"))
    {
      objc_msgSend((id)v11, "appLibrary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_msgSend(v22, "state") & 0x4000000) == 0;

      if (v23)
        goto LABEL_18;
      objc_msgSend((id)v11, "appLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "clearStateBits:", 0x4000000);

      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.4((uint64_t)v21, v25, v26, v27, v28, v29, v30, v31);

    }
  }
LABEL_18:
  -[BRCAccountSessionFPFS bouncingAnalyzer](self->_session, "bouncingAnalyzer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "analyzeServerBouncingOfItem:withServerItem:", v11, v10);

  if (objc_msgSend((id)v11, "logicalNameNeedsRename"))
  {
    objc_msgSend((id)v11, "st");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "clearBouncedName");

  }
  if (!+[BRCServerChangesApplyUtil handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:](BRCServerChangesApplyUtil, "handleEtagsChangesOnly:si:rank:scheduler:zone:diffs:needsSave:", v11, v10, a5, v105, v12, &v111, &v109))
  {
    if (v11 && !objc_msgSend((id)v11, "isDead"))
    {
      if (objc_msgSend((id)v11, "isIdleOrRejected"))
      {
        brc_bread_crumbs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.3();

        objc_msgSend((id)v11, "updateFromServerItem:", v10);
        v109 = 1;
      }
      v104 = (void *)v11;
      goto LABEL_63;
    }
    objc_msgSend((id)v10, "parentZoneOnFS");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "clientZone");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
      v35 = v11 != 0;
    else
      v35 = 1;
    if (v35)
    {
      v36 = 0;
LABEL_51:
      v104 = (void *)objc_msgSend((id)v10, "newLocalItemWithServerZone:dbRowID:", v12, objc_msgSend((id)v11, "dbRowID"));

      v109 = 1;
      if (v36)
        objc_msgSend(v104, "markBouncedToNextAvailableBounceNumber:", 500);
      if (objc_msgSend(v104, "isSharedToMeTopLevelItem"))
      {
        objc_msgSend((id)v10, "asSharedItem");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "fallbackParentAppLibraryOnFS");
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v100, "defaultClientZone");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "asShareableItem");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "unsaltedBookmarkData");
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v54, "serverAliasByUnsaltedBookmarkData:", v99);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v55) = v56 == 0;

        if ((_DWORD)v55)
        {
          brc_bread_crumbs();
          v57 = (BRCServerChangesApplier *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v113 = v57;
            _os_log_impl(&dword_230455000, v58, OS_LOG_TYPE_DEFAULT, "[WARNING] No alias pointing to new item shared container, forcing sync down on private container%@", buf, 0xCu);
          }

          objc_msgSend(v54, "serverZone");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "state");

          if ((v60 & 4) != 0)
          {
            objc_msgSend(v54, "scheduleSyncDown");
          }
          else
          {
            objc_msgSend((id)v10, "itemGlobalID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "serverZone");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[BRCItemID shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:](BRCItemID, "shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:", v61, v62, 0);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v54, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v63, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v106[0] = MEMORY[0x24BDAC760];
            v106[1] = 3221225472;
            v106[2] = __60__BRCServerChangesApplier_applyChanges_localItem_rank_zone___block_invoke;
            v106[3] = &unk_24FE42E78;
            v65 = v63;
            v107 = v65;
            objc_msgSend(v64, "addLocateRecordCompletionBlock:", v106);

          }
        }

      }
      brc_bread_crumbs();
      v66 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        v95 = CFSTR("new");
        *(_DWORD *)buf = 138412802;
        if (v11)
          v95 = CFSTR("revived");
        v113 = (BRCServerChangesApplier *)v95;
        v114 = 2112;
        v115 = (int64_t)v104;
        v116 = 2112;
        v117 = v66;
        _os_log_debug_impl(&dword_230455000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] Created reservation for %@ item: %@%@", buf, 0x20u);
      }

LABEL_63:
      if ((v111 & 0x60) != 0)
      {
        objc_msgSend(v104, "parentClientZone");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "st");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "parentID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "st");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "logicalName");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "itemByParentID:andLogicalName:", v70, v72);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (v103)
        {
          brc_bread_crumbs();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.2();

          objc_msgSend(v103, "markBouncedToNextAvailableBounceNumber:", 502);
          objc_msgSend(v103, "saveToDB");
          objc_msgSend(v103, "st");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "logicalNameWithoutLocalBounce");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "orig");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "st");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "logicalName");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v75, "isEqualToString:", v78);

          if (v79)
          {
            brc_bread_crumbs();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              -[BRCServerChangesApplier applyChanges:localItem:rank:zone:].cold.1((uint64_t)v80, v81, v82, v83, v84, v85, v86, v87);

            objc_msgSend(v103, "clientZone");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "itemID");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "serverItemByItemID:", v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            -[BRCAccountSessionFPFS applyScheduler](self->_session, "applyScheduler");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "createApplyJobFromServerItem:localItem:state:kind:", v90, v103, 1, 2);

          }
        }

      }
      if (objc_msgSend((id)v10, "isLive") && objc_msgSend(v104, "isRejected"))
      {
        brc_bread_crumbs();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v113 = self;
          v114 = 2112;
          v115 = (int64_t)v92;
          _os_log_impl(&dword_230455000, v93, OS_LOG_TYPE_DEFAULT, "[WARNING] Rejected item was revived.  Marking sync as idle to apply server version for %@%@", buf, 0x16u);
        }

        objc_msgSend(v104, "markRejectedItemRemotelyRevived");
        v109 = 1;
        goto LABEL_78;
      }
      if (v109)
LABEL_78:
        objc_msgSend(v104, "saveToDBForServerEdit:keepAliases:", 1, 0);
LABEL_79:
      objc_msgSend(v12, "dbRowID");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setState:forRank:zoneRowID:", 0, a5, v94);

      v11 = (int64_t)v104;
      goto LABEL_80;
    }
    objc_msgSend((id)v10, "parentItemIDOnFS");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    if (+[BRCServerChangesApplyUtil handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:](BRCServerChangesApplyUtil, "handleNonRevivedItemIfNecessary:si:rank:scheduler:zone:hasInitialScanItemTypeMismatch:", 0, v10, a5, v105, v12, &v108))
    {

      goto LABEL_80;
    }
    if (v108)
    {
      -[BRCAccountSessionFPFS bouncingAnalyzer](self->_session, "bouncingAnalyzer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "reportInitialScanItemTypeMismatch:", v10);

    }
    objc_msgSend((id)v10, "st");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "logicalName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "itemByParentID:andLogicalName:", v42, v47);
    v48 = (BRCServerChangesApplier *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      brc_bread_crumbs();
      v49 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v113 = v48;
        v114 = 2112;
        v115 = v10;
        v116 = 2112;
        v117 = v49;
        _os_log_debug_impl(&dword_230455000, v50, OS_LOG_TYPE_DEBUG, "[DEBUG] Found item %@ that collides with %@%@", buf, 0x20u);
      }

      if ((-[BRCServerChangesApplier isDead](v48, "isDead") & 1) == 0
        && (objc_msgSend((id)v10, "isSharedToMeTopLevelItem") & 1) != 0)
      {
        v36 = 1;
LABEL_50:

        goto LABEL_51;
      }
      -[BRCAccountSessionFPFS bouncingAnalyzer](self->_session, "bouncingAnalyzer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "analyzeBouncingOfItem:withServerItem:bounceReason:", v48, v10, 501);

      -[BRCServerChangesApplier markBouncedToNextAvailableBounceNumber:](v48, "markBouncedToNextAvailableBounceNumber:", v52);
      -[BRCServerChangesApplier saveToDB](v48, "saveToDB");
    }
    v36 = 0;
    goto LABEL_50;
  }
LABEL_80:
  __brc_leave_section(v110);

}

void __60__BRCServerChangesApplier_applyChanges_localItem_rank_zone___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("fail");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    if (a2)
      v8 = CFSTR("success");
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Encountered a share alias, syncing down shared database to detect %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_handleServerItemBRAliasIfNeeded:li:jobID:zone:diffs:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Forwarding server alias rank bump to target item %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)applyChanges:(uint64_t)a3 localItem:(uint64_t)a4 rank:(uint64_t)a5 zone:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] We are vacating where the bypath item want's to be. Scheduling apply%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)applyChanges:localItem:rank:zone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Bouncing by path item %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)applyChanges:localItem:rank:zone:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Updating item %@ from server item%@");
  OUTLINED_FUNCTION_0();
}

- (void)applyChanges:(uint64_t)a3 localItem:(uint64_t)a4 rank:(uint64_t)a5 zone:(uint64_t)a6 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_230455000, a2, a3, "[DEBUG] Clearing the listed docs bit on the documents folder because the documents folder is a dir-fault%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)applyChanges:(uint64_t)a1 localItem:(NSObject *)a2 rank:zone:.cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: li || si%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
