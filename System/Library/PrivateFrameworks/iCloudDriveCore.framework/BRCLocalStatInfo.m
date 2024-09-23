@implementation BRCLocalStatInfo

- (id)logicalName
{
  NSString *bouncedLogicalName;

  bouncedLogicalName = self->_bouncedLogicalName;
  if (!bouncedLogicalName)
    bouncedLogicalName = self->super._logicalName;
  return bouncedLogicalName;
}

- (NSString)logicalNameWithoutLocalBounce
{
  return self->super._logicalName;
}

- (unsigned)itemScope
{
  int itemScope;
  void *v4;
  NSObject *v5;

  itemScope = self->_itemScope;
  if (!itemScope)
  {
    if (self->super._state == 1)
    {
      LOBYTE(itemScope) = 0;
    }
    else
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo itemScope].cold.1();

      LOBYTE(itemScope) = self->_itemScope;
    }
  }
  return itemScope;
}

- (id)descriptionWithContext:(id)a3 origName:(id)a4
{
  void *v5;
  NSString *bouncedLogicalName;
  void *v7;
  int itemScope;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v13;
  NSObject *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BRCLocalStatInfo;
  -[BRCStatInfo descriptionWithContext:origName:](&v15, sel_descriptionWithContext_origName_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo descriptionWithContext:origName:].cold.1();

  }
  bouncedLogicalName = self->_bouncedLogicalName;
  if (bouncedLogicalName)
  {
    -[NSString fp_obfuscatedFilename](bouncedLogicalName, "fp_obfuscatedFilename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" bln:\"%@\"), v7);

  }
  itemScope = self->_itemScope;
  v9 = CFSTR("docs");
  v10 = CFSTR("unknown");
  if (itemScope == 3)
    v10 = CFSTR("trash");
  if (itemScope != 2)
    v9 = v10;
  if (itemScope == 1)
    v11 = CFSTR("data");
  else
    v11 = v9;
  objc_msgSend(v5, "appendFormat:", CFSTR(" sc:%@"), v11);
  if (self->_localChangeCount)
    objc_msgSend(v5, "appendFormat:", CFSTR(" lch:%llx"), self->_localChangeCount);
  if (self->_oldVersionIdentifier)
    objc_msgSend(v5, "appendFormat:", CFSTR(" over:%@"), self->_oldVersionIdentifier);
  if (self->_processingStamp)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pstamp:%@"), self->_processingStamp);
  return v5;
}

- (id)description
{
  return -[BRCLocalStatInfo descriptionWithContext:origName:](self, "descriptionWithContext:origName:", 0, 0);
}

- (id)initAsShareAcceptFaultWithName:(id)a3 mode:(char)a4 isDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BRCLocalStatInfo *v9;
  BRCLocalStatInfo *v10;
  char v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCLocalStatInfo;
  v9 = -[BRCLocalStatInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->super._state = 0;
    if (v5)
      v11 = 10;
    else
      v11 = 8;
    v9->super._type = v11;
    v9->super._mode = a4;
    -[BRCLocalStatInfo setFilename:](v9, "setFilename:", v8);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalStatInfo:", self);
}

- (void)setFilename:(id)a3
{
  -[BRCLocalStatInfo setFilename:forceBouncedLogicalName:serverName:](self, "setFilename:forceBouncedLogicalName:serverName:", a3, 0, 0);
}

- (void)setFilename:(id)a3 forceBouncedLogicalName:(id)a4 serverName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSString **p_bouncedLogicalName;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(v9, "br_isSideFaultName") & 1) != 0 || objc_msgSend(v10, "br_isSideFaultName"))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo setFilename:forceBouncedLogicalName:serverName:].cold.1();
  }
  else
  {
    p_bouncedLogicalName = &self->_bouncedLogicalName;
    if (!-[NSString isEqualToString:](self->_bouncedLogicalName, "isEqualToString:", v9)
      || (objc_msgSend(v11, "isEqualToString:", *p_bouncedLogicalName) & 1) != 0)
    {
      objc_storeStrong((id *)&self->_bouncedLogicalName, a4);
      objc_storeStrong((id *)&self->super._logicalName, a3);
      goto LABEL_6;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRCLocalStatInfo setFilename:forceBouncedLogicalName:serverName:].cold.2(p_bouncedLogicalName);
  }

LABEL_6:
}

- (void)_setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (void)_setCKInfo:(id)a3
{
  objc_storeStrong((id *)&self->super._ckInfo, a3);
}

- (void)_moveItemAsideWithUUIDString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't move aside a root item!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (unint64_t)diffAgainstLocalInfo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = a3;
  v5 = -[BRCStatInfo diffAgainst:](self, "diffAgainst:", v4);
  v6 = v5;
  if ((v5 & 0x100000000) == 0 && self->super._state != *((unsigned __int8 *)v4 + 24))
    v6 = v5 | 0x100000000;
  if ((v6 & 0x1000000000) != 0)
    goto LABEL_10;
  v7 = (void *)v4[19];
  v8 = self->_bouncedLogicalName;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_10;
  }
  v10 = v9;
  if (!v9)
  {

    goto LABEL_15;
  }
  v11 = -[NSString isEqual:](v8, "isEqual:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_10:
    if ((v6 & 0x2000000000) != 0)
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_15:
  v6 |= 0x1000000000uLL;
  if ((v6 & 0x2000000000) != 0)
    goto LABEL_13;
LABEL_11:
  if (self->_itemScope != *((unsigned __int8 *)v4 + 160))
    v6 |= 0x2000000000uLL;
LABEL_13:

  return v6;
}

- (void)_markZombieForCrossZoneMove
{
  NSNumber *processingStamp;

  self->super._state = -3;
  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

}

- (void)_markDead
{
  NSNumber *processingStamp;

  if (self->super._state != 1)
  {
    self->super._state = 1;
    processingStamp = self->_processingStamp;
    self->_processingStamp = 0;

  }
}

- (void)_markDeadAsSharedTopLevelItemWithDocumentsItemID:(id)a3
{
  BRCItemID *v4;
  BRCItemID *parentID;

  v4 = (BRCItemID *)a3;
  -[BRCLocalStatInfo _markDead](self, "_markDead");
  parentID = self->super._parentID;
  self->super._parentID = v4;

}

- (void)_updateStatMeta:(id)a3
{
  id v4;
  NSData *v5;
  NSData *xattrSignature;
  NSData *lazyXattr;
  NSData *v8;
  NSData *finderTags;
  NSString *v10;
  NSString *trashPutBackPath;
  BRCItemID *v12;
  BRCItemID *trashPutBackParentID;

  v4 = a3;
  self->super._mode = objc_msgSend(v4, "mode");
  self->super._birthtime = objc_msgSend(v4, "birthtime");
  self->super._hiddenExt = objc_msgSend(v4, "isHiddenExt");
  objc_msgSend(v4, "xattrSignature");
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v5;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  objc_msgSend(v4, "finderTags");
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  finderTags = self->super._finderTags;
  self->super._finderTags = v8;

  self->super._favoriteRank = objc_msgSend(v4, "favoriteRank");
  self->super._lastUsedTime = objc_msgSend(v4, "lastUsedTime");
  objc_msgSend(v4, "trashPutBackPath");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v10;

  objc_msgSend(v4, "trashPutBackParentID");
  v12 = (BRCItemID *)objc_claimAutoreleasedReturnValue();

  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v12;

}

- (BOOL)checkStateWithItemID:(id)a3 logToFile:(__sFILE *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCLocalStatInfo;
  return -[BRCStatInfo checkStateWithItemID:logToFile:](&v5, sel_checkStateWithItemID_logToFile_, a3, a4);
}

- (NSNumber)processingStamp
{
  return self->_processingStamp;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (NSString)rawBouncedLogicalName
{
  return self->_bouncedLogicalName;
}

- (void)setRawBouncedLogicalName:(id)a3
{
  objc_storeStrong((id *)&self->_bouncedLogicalName, a3);
}

- (unint64_t)localChangeCount
{
  return self->_localChangeCount;
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (NSString)fpCreationItemIdentifier
{
  return self->_fpCreationItemIdentifier;
}

- (void)setFpCreationItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fpCreationItemIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStamp, 0);
  objc_storeStrong((id *)&self->_bouncedLogicalName, 0);
  objc_storeStrong((id *)&self->_fpCreationItemIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BRCLocalStatInfo;
  v7 = -[BRCStatInfo initFromResultSet:pos:](&v17, sel_initFromResultSet_pos_, v6, v4);
  if (v7)
  {
    objc_msgSend(v6, "numberAtIndex:", (v4 + 16));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[21];
    v7[21] = v8;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 17));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7[19];
    v7[19] = v10;

    *((_BYTE *)v7 + 160) = objc_msgSend(v6, "intAtIndex:", (v4 + 18));
    v7[16] = objc_msgSend(v6, "unsignedLongLongAtIndex:", (v4 + 19));
    objc_msgSend(v6, "stringAtIndex:", (v4 + 20));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v7[17];
    v7[17] = v12;

    objc_msgSend(v6, "stringAtIndex:", (v4 + 21));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v7[18];
    v7[18] = v14;

  }
  return v7;
}

- (BRCLocalStatInfo)initWithLocalStatInfo:(id)a3
{
  id v4;
  BRCLocalStatInfo *v5;
  BRCLocalStatInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRCLocalStatInfo;
  v5 = -[BRCStatInfo initWithStatInfo:](&v8, sel_initWithStatInfo_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_processingStamp, *((id *)v4 + 21));
    objc_storeStrong((id *)&v6->_bouncedLogicalName, *((id *)v4 + 19));
    v6->_localChangeCount = *((_QWORD *)v4 + 16);
    objc_storeStrong((id *)&v6->_oldVersionIdentifier, *((id *)v4 + 17));
    v6->_itemScope = *((_BYTE *)v4 + 160);
    objc_storeStrong((id *)&v6->_fpCreationItemIdentifier, *((id *)v4 + 18));
  }

  return v6;
}

- (BRFieldStructureSignature)versionSignature
{
  return -[BRFieldStructureSignature initWithLocalStatInfo:]([BRFieldStructureSignature alloc], "initWithLocalStatInfo:", self);
}

- (void)_updateStatAliasMeta:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *logicalName;
  BRCItemID *v8;
  BRCItemID *parentID;
  void *v10;
  NSData *v11;
  NSData *finderTags;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  if ((objc_msgSend(v4, "isBRAlias") & 1) == 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCLocalStatInfo(FPFSAdditions) _updateStatAliasMeta:].cold.1();

  }
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logicalName");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  logicalName = v6;
  if (!v6)
    logicalName = self->super._logicalName;
  objc_storeStrong((id *)&self->super._logicalName, logicalName);

  objc_msgSend(v4, "parentItemIDOnFS");
  v8 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  parentID = v8;
  if (!v8)
    parentID = self->super._parentID;
  objc_storeStrong((id *)&self->super._parentID, parentID);

  objc_msgSend(v4, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finderTags");
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  finderTags = self->super._finderTags;
  self->super._finderTags = v11;

  objc_msgSend(v4, "st");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->super._favoriteRank = objc_msgSend(v13, "favoriteRank");

  objc_msgSend(v4, "st");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->super._lastUsedTime = objc_msgSend(v14, "lastUsedTime");

}

- (void)updateWithFileSystemFlags:(unint64_t)a3 ignoreExecutable:(BOOL)a4
{
  unsigned int v4;

  self->super._hiddenExt = (a3 & 0x10) != 0;
  v4 = (a3 >> 2) & 1;
  if ((a3 & 1) != 0 && !a4)
    LOBYTE(v4) = ((a3 & 4) != 0) | 2;
  self->super._mode = v4;
}

- (BRCLocalStatInfo)initWithImportObject:(id)a3 error:(id *)a4
{
  id v6;
  BRCLocalStatInfo *v7;
  BRCLocalStatInfo *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  char v15;
  BRCLocalStatInfo *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  NSObject *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCLocalStatInfo;
  v7 = -[BRCLocalStatInfo init](&v22, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_13;
  v7->super._state = 0;
  if (!objc_msgSend(v6, "isFault"))
  {
    if ((objc_msgSend(v6, "isSymLink") & 1) != 0)
    {
      v15 = 5;
    }
    else
    {
      if (objc_msgSend(v6, "isBRAlias"))
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:].cold.2();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: nobody should import an item from a BR Alias"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_20;
        brc_bread_crumbs();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, (os_log_type_t)0x90u))
          goto LABEL_19;
        v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
        v25 = 2080;
        if (!a4)
          v14 = "(ignored by caller)";
        goto LABEL_9;
      }
      if ((objc_msgSend(v6, "isFinderAlias") & 1) != 0)
      {
        v15 = 6;
      }
      else if ((objc_msgSend(v6, "isDocument") & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        if ((objc_msgSend(v6, "isUnixDir") & 1) == 0)
        {
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:].cold.3();

          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Unexpected import object %@"), v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
            goto LABEL_20;
          brc_bread_crumbs();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, (os_log_type_t)0x90u))
            goto LABEL_19;
          v14 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
          v25 = 2080;
          if (!a4)
            v14 = "(ignored by caller)";
          goto LABEL_9;
        }
        v15 = 0;
      }
    }
    v8->super._type = v15;
    -[BRCLocalStatInfo updateFromImportObject:onlyContentDependentProperties:](v8, "updateFromImportObject:onlyContentDependentProperties:", v6, 0);
LABEL_13:
    v16 = v8;
    goto LABEL_23;
  }
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: nobody should import an item from a fault"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_20;
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v24 = "-[BRCLocalStatInfo(FPFSAdditions) initWithImportObject:error:]";
    v25 = 2080;
    if (!a4)
      v14 = "(ignored by caller)";
LABEL_9:
    v26 = v14;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }
LABEL_19:

LABEL_20:
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  v16 = 0;
LABEL_23:

  return v16;
}

+ (char)modeFromImportObject:(id)a3 isPackageFault:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  char v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "isWritable");
  if (objc_msgSend(v5, "isExecutable")
    && objc_msgSend(v5, "isFile")
    && (objc_msgSend(v5, "isFault") & v4) == 0)
  {
    v6 |= 2u;
  }

  return v6;
}

+ (id)_finderTagsFromImportObject:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRFieldFinderTags *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "hasFinderTags"))
  {
    objc_msgSend(v3, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = 0;
    v5 = objc_msgSend(v4, "br_getTagNames:error:", &v24, &v23);
    v6 = v24;
    v7 = v23;

    if ((v5 & 1) == 0)
    {
      brc_bread_crumbs();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
        +[BRCLocalStatInfo(FPFSAdditions) _finderTagsFromImportObject:].cold.2();

      v10 = 0;
      goto LABEL_19;
    }
    if (objc_msgSend(v6, "count"))
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[BRCLocalStatInfo(FPFSAdditions) _finderTagsFromImportObject:].cold.1(v6, (uint64_t)v8, v9);

      v10 = objc_alloc_init(BRFieldFinderTags);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            -[BRFieldFinderTags addTags:](v10, "addTags:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v13);
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v10 = 0;
LABEL_20:
  -[BRFieldFinderTags data](v10, "data", (_QWORD)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_updateStatMetaFromServer:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *xattrSignature;
  NSData *lazyXattr;
  NSData *v9;
  NSData *finderTags;
  NSString *v11;
  NSString *trashPutBackPath;
  BRCItemID *v13;
  BRCItemID *trashPutBackParentID;
  BRFieldCKInfo *v15;
  BRFieldCKInfo *ckInfo;
  NSString *bouncedLogicalName;
  NSString *v18;
  NSString *logicalName;
  BRCItemID *v20;
  BRCItemID *parentID;
  NSString *aliasTarget;
  void *v23;
  BOOL v24;
  void *v25;
  NSObject *v26;

  v4 = a3;
  objc_msgSend(v4, "st");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->super._mode = objc_msgSend(v5, "mode");
  self->super._birthtime = objc_msgSend(v5, "birthtime");
  self->super._hiddenExt = objc_msgSend(v5, "isHiddenExt");
  objc_msgSend(v5, "xattrSignature");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->super._xattrSignature;
  self->super._xattrSignature = v6;

  lazyXattr = self->super._lazyXattr;
  self->super._lazyXattr = 0;

  objc_msgSend(v5, "finderTags");
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  finderTags = self->super._finderTags;
  self->super._finderTags = v9;

  self->super._favoriteRank = objc_msgSend(v5, "favoriteRank");
  self->super._lastUsedTime = objc_msgSend(v5, "lastUsedTime");
  objc_msgSend(v5, "trashPutBackPath");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  trashPutBackPath = self->super._trashPutBackPath;
  self->super._trashPutBackPath = v11;

  objc_msgSend(v5, "trashPutBackParentID");
  v13 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
  trashPutBackParentID = self->super._trashPutBackParentID;
  self->super._trashPutBackParentID = v13;

  objc_msgSend(v5, "ckInfo");
  v15 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
  ckInfo = self->super._ckInfo;
  self->super._ckInfo = v15;

  if (self->super._state == 1 && !objc_msgSend(v5, "state"))
  {
    bouncedLogicalName = self->_bouncedLogicalName;
    self->_bouncedLogicalName = 0;

  }
  self->super._state = objc_msgSend(v5, "state");
  objc_msgSend(v5, "logicalName");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  logicalName = self->super._logicalName;
  self->super._logicalName = v18;

  objc_msgSend(v4, "parentItemIDOnFS");
  v20 = (BRCItemID *)objc_claimAutoreleasedReturnValue();

  parentID = self->super._parentID;
  self->super._parentID = v20;

  aliasTarget = self->super._aliasTarget;
  if (aliasTarget)
  {
    objc_msgSend(v5, "aliasTarget");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSString isEqualToString:](aliasTarget, "isEqualToString:", v23);

    if (!v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCLocalStatInfo(FPFSAdditions) _updateStatMetaFromServer:].cold.1();

    }
  }

}

- (void)updateFromImportObject:(id)a3 onlyContentDependentProperties:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BRCItemID *v11;
  BRCItemID *parentID;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "isUnixDir") && (objc_msgSend(v6, "isExecutable") & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Inaccessible folder %@%@", (uint8_t *)&v21, 0x16u);
    }

  }
  self->super._state = 0;
  objc_msgSend(v6, "parentItemGlobalID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "parentItemGlobalID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemID");
    v11 = (BRCItemID *)objc_claimAutoreleasedReturnValue();
    parentID = self->super._parentID;
    self->super._parentID = v11;

  }
  if (!a4)
  {
    self->super._birthtime = objc_msgSend(v6, "birthTime");
    objc_msgSend(v6, "logicalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalStatInfo setFilename:](self, "setFilename:", v13);

    +[BRCLocalStatInfo _finderTagsFromImportObject:](BRCLocalStatInfo, "_finderTagsFromImportObject:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (self->super._finderTags)
      v16 = v14 == 0;
    else
      v16 = 0;
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCLocalStatInfo(FPFSAdditions) updateFromImportObject:onlyContentDependentProperties:].cold.1();

    }
    objc_storeStrong((id *)&self->super._finderTags, v15);
    self->super._hiddenExt = objc_msgSend(v6, "isHiddenExtension");
    if (objc_msgSend(v6, "isFault"))
      v19 = objc_msgSend(v6, "isPackageRoot");
    else
      v19 = 0;
    self->super._mode = +[BRCLocalStatInfo modeFromImportObject:isPackageFault:](BRCLocalStatInfo, "modeFromImportObject:isPackageFault:", v6, v19);

  }
  -[BRFieldCKInfo etag](self->super._ckInfo, "etag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    -[BRCStatInfo setCreatorRowID:](self, "setCreatorRowID:", &unk_24FEB33E0);

}

- (void)clearCKInfo
{
  BRFieldCKInfo *ckInfo;
  NSString *oldVersionIdentifier;

  ckInfo = self->super._ckInfo;
  self->super._ckInfo = 0;

  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;

}

- (void)bumpLocalChangeCount
{
  NSString *oldVersionIdentifier;

  oldVersionIdentifier = self->_oldVersionIdentifier;
  self->_oldVersionIdentifier = 0;

  ++self->_localChangeCount;
}

- (void)clearBouncedName
{
  void *v3;
  NSObject *v4;
  NSString *bouncedLogicalName;

  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCLocalStatInfo(FPFSAdditions) clearBouncedName].cold.1();

  bouncedLogicalName = self->_bouncedLogicalName;
  self->_bouncedLogicalName = 0;

}

- (void)_markNeedsPropertiesPropagatedToChildren
{
  NSNumber *v3;
  NSNumber *processingStamp;

  if (!self->_processingStamp)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", brc_current_date_nsec());
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    processingStamp = self->_processingStamp;
    self->_processingStamp = v3;

  }
}

- (void)_markChildPropagationComplete
{
  NSNumber *processingStamp;

  processingStamp = self->_processingStamp;
  self->_processingStamp = 0;

}

- (void)itemScope
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _itemScope != BRC_ITEM_SCOPE_UNKNOWN || _state == BRC_ITEM_STATE_TOMBSTONE%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)descriptionWithContext:origName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [s isKindOfClass:[NSMutableString class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setFilename:forceBouncedLogicalName:serverName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: got a fault name%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setFilename:(_QWORD *)a1 forceBouncedLogicalName:serverName:.cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Not overriding name equal to bounced name %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
