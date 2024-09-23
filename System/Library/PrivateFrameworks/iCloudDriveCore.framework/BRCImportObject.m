@implementation BRCImportObject

- (BOOL)isDocument
{
  if (!-[BRCImportObject isFile](self, "isFile"))
    return -[BRCImportObject isPackageRoot](self, "isPackageRoot");
  if ((*((_BYTE *)self + 161) & 0x40) != 0 || -[BRCImportObject isSymLink](self, "isSymLink"))
    return 0;
  return !-[BRCImportObject isFinderAlias](self, "isFinderAlias");
}

- (BOOL)isFault
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[BRCImportObject isDocument](self, "isDocument");
  if (v3)
  {
    -[BRCImportObject logicalName](self, "logicalName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "br_isSideFaultName");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isUnixDir
{
  return (self->_mode & 0xF000) == 0x4000;
}

- (BOOL)isFile
{
  return (self->_mode & 0xF000) == 0x8000;
}

- (BOOL)isPackageRoot
{
  return (*((unsigned __int8 *)self + 161) >> 2) & 1;
}

- (BOOL)isExcluded
{
  return *((_BYTE *)self + 161) & 1;
}

- (BOOL)isSymLink
{
  return (self->_mode & 0xF000) == 40960;
}

- (BOOL)hasFinderTags
{
  return (*((unsigned __int8 *)self + 161) >> 4) & 1;
}

- (int64_t)birthTime
{
  return self->_birthtime.tv_sec;
}

- (int64_t)modificationTime
{
  return self->_mtime.tv_sec;
}

- (BRCGenerationID)generationID
{
  BRCGenerationID *generationID;
  BRCGenerationID *v4;
  BRCGenerationID *v5;

  generationID = self->_generationID;
  if (!generationID)
  {
    v4 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", self->_fsGenerationID);
    v5 = self->_generationID;
    self->_generationID = v4;

    generationID = self->_generationID;
  }
  return generationID;
}

- (BOOL)isWritable
{
  return (self->_mode >> 7) & 1;
}

- (BOOL)isExecutable
{
  return (self->_mode >> 6) & 1;
}

- (BOOL)isHiddenExtension
{
  return (self->_finderInfo[9] >> 4) & 1;
}

- (BOOL)isFileWithFinderInfoAliasBit
{
  _BOOL4 v3;

  v3 = -[BRCImportObject isFile](self, "isFile");
  if (v3)
    return (*((unsigned __int8 *)self + 161) >> 5) & 1;
  return v3;
}

- (BOOL)isFinderAlias
{
  _BOOL4 v3;

  v3 = -[BRCImportObject isFileWithFinderInfoAliasBit](self, "isFileWithFinderInfoAliasBit");
  if (v3)
    LOBYTE(v3) = (*((_BYTE *)self + 161) & 0x40) == 0;
  return v3;
}

- (BOOL)isBRAlias
{
  _BOOL4 v3;

  v3 = -[BRCImportObject isFileWithFinderInfoAliasBit](self, "isFileWithFinderInfoAliasBit");
  if (v3)
    return (*((unsigned __int8 *)self + 161) >> 6) & 1;
  return v3;
}

- (unsigned)fileType
{
  return bswap32(*(_DWORD *)self->_finderInfo);
}

- (id)initAsSymlinkWithTarget:(id)a3 parentItem:(id)a4 logicalName:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  BRCImportObject *v14;
  BRCImportObject *v15;
  BRCImportObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v21;
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
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BRCImportObject;
  v14 = -[BRCImportObject init](&v22, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_4;
  if (v11)
  {
    -[BRCImportObject _resolveParentBasedPropertiesWithParent:logicalName:](v14, "_resolveParentBasedPropertiesWithParent:logicalName:", v12, v13);
    v15->_mode = -24128;
    v15->_birthtime.tv_sec = time(0);
    v15->_mtime = v15->_birthtime;
    objc_storeStrong((id *)&v15->_symlinkContent, a3);
LABEL_4:
    v16 = v15;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 96);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v21 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v24 = "-[BRCImportObject initAsSymlinkWithTarget:parentItem:logicalName:error:]";
      v25 = 2080;
      if (!a6)
        v21 = "(ignored by caller)";
      v26 = v21;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v17);

  v16 = 0;
LABEL_11:

  return v16;
}

- (BRCImportObject)initWithURL:(id)a3 existingItem:(id)a4 quarantineInfo:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  BRCImportObject *v11;
  id v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  NSString *logicalName;
  id *p_logicalName;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  BRCImportObject *v25;
  char *v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  BRCAccountSessionFPFS *session;
  uint64_t v31;
  BRCItemGlobalID *parentItemGlobalID;
  uint64_t v33;
  BRCAppLibrary *appLibrary;
  const char *v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)BRCImportObject;
  v11 = -[BRCImportObject init](&v37, sel_init);
  if (!v11)
  {
LABEL_22:
    v25 = v11;
    goto LABEL_23;
  }
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  objc_storeStrong((id *)&v11->_fileURL, v12);
  if (v10)
  {
    objc_msgSend(v10, "st");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logicalName");
    v15 = objc_claimAutoreleasedReturnValue();
    p_logicalName = (id *)&v11->_logicalName;
    logicalName = v11->_logicalName;
    v11->_logicalName = (NSString *)v15;

  }
  else
  {
    objc_msgSend(v12, "lastPathComponent");
    v18 = objc_claimAutoreleasedReturnValue();
    p_logicalName = (id *)&v11->_logicalName;
    v14 = v11->_logicalName;
    v11->_logicalName = (NSString *)v18;
  }

  v19 = open(v13, 2129924);
  if ((v19 & 0x80000000) != 0)
  {
    v21 = *__error();
    if ((_DWORD)v21)
      goto LABEL_7;
    goto LABEL_14;
  }
  v20 = v19;
  v21 = -[BRCImportObject _resolveAgainstFileDescriptor:](v11, "_resolveAgainstFileDescriptor:", v19);
  close(v20);
  if (!(_DWORD)v21)
  {
LABEL_14:
    if (objc_msgSend(*p_logicalName, "br_isExcludedWithMaximumDepth:", 1024))
    {
      brc_bread_crumbs();
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL path](v11->_fileURL, "path");
        v28 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v28;
        v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_230455000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] fileURL is excluded at %@%@", buf, 0x16u);

      }
      *((_BYTE *)v11 + 161) |= 1u;
    }
    if (objc_msgSend(v10, "isDocument") && -[BRCImportObject isUnixDir](v11, "isUnixDir"))
      *((_BYTE *)v11 + 161) |= 4u;
    objc_msgSend(v10, "session");
    v29 = objc_claimAutoreleasedReturnValue();
    session = v11->_session;
    v11->_session = (BRCAccountSessionFPFS *)v29;

    objc_msgSend(v10, "itemParentGlobalID");
    v31 = objc_claimAutoreleasedReturnValue();
    parentItemGlobalID = v11->_parentItemGlobalID;
    v11->_parentItemGlobalID = (BRCItemGlobalID *)v31;

    objc_msgSend(v10, "appLibrary");
    v33 = objc_claimAutoreleasedReturnValue();
    appLibrary = v11->_appLibrary;
    v11->_appLibrary = (BRCAppLibrary *)v33;

    v11->_itemScope = objc_msgSend(v10, "itemScope");
    v11->_sharingOptions = objc_msgSend(v10, "sharingOptions");
    v11->_isUserVisible = objc_msgSend(v10, "isUserVisible");
    goto LABEL_22;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
    {
      v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "-[BRCImportObject initWithURL:existingItem:quarantineInfo:error:]";
      v40 = 2080;
      if (!a6)
        v36 = "(ignored by caller)";
      v41 = v36;
      v42 = 2112;
      v43 = v22;
      v44 = 2112;
      v45 = v23;
      _os_log_error_impl(&dword_230455000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a6)
    *a6 = objc_retainAutorelease(v22);

  v25 = 0;
LABEL_23:

  return v25;
}

- (void)_resolveParentBasedPropertiesWithParent:(id)a3 logicalName:(id)a4
{
  void *v4;
  id v7;
  BRCAccountSessionFPFS *v8;
  BRCAccountSessionFPFS *session;
  BRCItemGlobalID *v10;
  BRCItemGlobalID *parentItemGlobalID;
  BRCAppLibrary *v12;
  BRCAppLibrary *appLibrary;
  BOOL v14;
  BOOL v15;
  unsigned __int8 v16;
  void *v17;
  int v18;
  void *v19;
  BRCAppLibrary *v20;
  BRCAppLibrary *v21;
  BRCAppLibrary *v22;
  BRCItemGlobalID *v23;
  BRCItemGlobalID *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_logicalName, a4);
  objc_msgSend(v32, "session");
  v8 = (BRCAccountSessionFPFS *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v8;

  objc_msgSend(v32, "itemGlobalID");
  v10 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
  parentItemGlobalID = self->_parentItemGlobalID;
  self->_parentItemGlobalID = v10;

  objc_msgSend(v32, "appLibrary");
  v12 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
  appLibrary = self->_appLibrary;
  self->_appLibrary = v12;

  v14 = -[BRCAppLibrary includesDataScope](self->_appLibrary, "includesDataScope");
  if (objc_msgSend(v32, "isZoneRoot"))
  {
    if (v14)
    {
      v15 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE17538]) == 0;
      v16 = 1;
    }
    else
    {
      v15 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE175A0]) == 0;
      v16 = 2;
    }
    if (!v15)
      ++v16;
    goto LABEL_10;
  }
  objc_msgSend(v32, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isDocumentsFolder"))
  {
    v18 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE175A0]);

    if (v18)
    {
      v16 = 3;
LABEL_10:
      self->_itemScope = v16;
      goto LABEL_13;
    }
  }
  else
  {

  }
  self->_itemScope = objc_msgSend(v32, "itemScope");
LABEL_13:
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE17578]))
  {
    objc_msgSend(v32, "fileObjectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isAppLibraryRoot") && (objc_msgSend(v19, "isCloudDocsRoot") & 1) == 0)
    {
      objc_msgSend(v32, "appLibrary");
      v20 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
      v21 = self->_appLibrary;
      self->_appLibrary = v20;
      v22 = v20;

      *((_BYTE *)self + 162) |= 2u;
      -[BRCAppLibrary rootItemGlobalID](v22, "rootItemGlobalID");
      v23 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
      v24 = self->_parentItemGlobalID;
      self->_parentItemGlobalID = v23;

    }
  }
  self->_sharingOptions = objc_msgSend(v32, "sharingOptions") & 0x78;
  v25 = objc_msgSend(v32, "isUserVisible");
  objc_msgSend(v32, "itemID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isNonDesktopRoot");
  v28 = objc_msgSend(v32, "itemScope");
  v29 = objc_msgSend(v32, "isZoneRoot");
  if ((v29 & 1) != 0)
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend(v32, "st");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logicalName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v32, "appLibrary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isUserVisible = +[BRCLocalItem computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:](BRCLocalItem, "computeUserVisibleStatusOfLiveItemWithParentVisible:parentIsNonDesktopRoot:parentScope:itemFilename:parentFilename:appLibrary:", v25, v27, v28, v7, v30, v31);

  if ((v29 & 1) == 0)
  {

  }
  if (-[NSString br_isExcludedWithMaximumDepth:](self->_logicalName, "br_isExcludedWithMaximumDepth:", 1))*((_BYTE *)self + 161) |= 1u;

}

- (id)initAsNewDirectoryWithLogicalName:(id)a3 parentItem:(id)a4
{
  id v6;
  id v7;
  BRCImportObject *v8;
  BRCImportObject *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BRCImportObject;
  v8 = -[BRCImportObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[BRCImportObject _resolveParentBasedPropertiesWithParent:logicalName:](v8, "_resolveParentBasedPropertiesWithParent:logicalName:", v7, v6);
    v9->_mode = 16832;
    v9->_birthtime.tv_sec = time(0);
    v9->_mtime = v9->_birthtime;
  }

  return v9;
}

- (BRCImportObject)initWithURL:(id)a3 logicalName:(id)a4 quarantineInfo:(id)a5 parentItem:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BRCImportObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  BRCImportObject *v30;
  char v31;
  const char *v33;
  objc_super v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)BRCImportObject;
  v16 = -[BRCImportObject init](&v34, sel_init);
  if (!v16)
  {
LABEL_15:
    v30 = v16;
    goto LABEL_16;
  }
  v17 = objc_retainAutorelease(v12);
  v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
  objc_storeStrong((id *)&v16->_fileURL, v17);
  objc_storeStrong((id *)&v16->_logicalName, a4);
  objc_storeStrong((id *)&v16->_quarantineInfo, a5);
  v24 = BRCOpenAt(0xFFFFFFFFLL, v18, 32772, v19, v20, v21, v22, v23, (unsigned __int16)v34.receiver);
  if ((v24 & 0x80000000) != 0)
  {
    v26 = *__error();
    if ((_DWORD)v26)
      goto LABEL_4;
    goto LABEL_11;
  }
  v25 = v24;
  v26 = -[BRCImportObject _resolveAgainstFileDescriptor:](v16, "_resolveAgainstFileDescriptor:", v24);
  close(v25);
  if (!(_DWORD)v26)
  {
LABEL_11:
    if (-[BRCImportObject isUnixDir](v16, "isUnixDir"))
      v31 = 4;
    else
      v31 = 0;
    *((_BYTE *)v16 + 161) = *((_BYTE *)v16 + 161) & 0xFB | v31;
    -[BRCImportObject _resolveParentBasedPropertiesWithParent:logicalName:](v16, "_resolveParentBasedPropertiesWithParent:logicalName:", v15, v13);
    goto LABEL_15;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      v33 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v36 = "-[BRCImportObject initWithURL:logicalName:quarantineInfo:parentItem:error:]";
      v37 = 2080;
      if (!a7)
        v33 = "(ignored by caller)";
      v38 = v33;
      v39 = 2112;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a7)
    *a7 = objc_retainAutorelease(v27);

  v30 = 0;
LABEL_16:

  return v30;
}

- (int)_resolveAgainstFileDescriptor:(int)a3
{
  uint64_t v3;
  __int16 v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  int v20;
  time_t v21;
  time_t v22;
  timespec v23;
  int64_t v24;
  __int128 v25;
  int v26;
  char v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  char v37;
  void *v38;
  void *v39;
  NSObject *v40;
  int v41;
  void *v42;
  NSObject *v43;
  NSString *logicalName;
  NSString *v45;
  NSString *symlinkContent;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSData *v51;
  id v52;
  NSData *xattrs;
  void *v54;
  NSObject *v55;
  int v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  const char *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  __int128 v76;
  uint64_t v77;
  uint8_t v78[4];
  const char *v79;
  __int16 v80;
  void *v81;
  uint8_t buf[4];
  _BYTE v83[34];
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  BRCImportObject *v93;
  __int16 v94;
  void *v95;
  _QWORD v96[12];
  int64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0)
    return *__error();
  v3 = *(_QWORD *)&a3;
  v76 = xmmword_230722D88;
  v77 = 513;
  v97 = 0;
  memset(v96, 0, sizeof(v96));
  if (fgetattrlist(a3, &v76, v96, 0x68uLL, 0x20u) < 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      -[NSURL path](self->_fileURL, "path");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v83 = v3;
      *(_WORD *)&v83[4] = 2112;
      *(_QWORD *)&v83[6] = v38;
      *(_WORD *)&v83[14] = 1024;
      *(_DWORD *)&v83[16] = v17;
      *(_WORD *)&v83[20] = 2112;
      *(_QWORD *)&v83[22] = v18;
      _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) at '%@' failed %{errno}d%@", buf, 0x22u);

    }
    *__error() = v17;
    return *__error();
  }
  v5 = v96[9];
  v6 = v96[9] & 0xF000;
  if (v6 != 0x4000 && v6 != 0x8000 && v6 != 40960)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v61 = aPcDBLSW[LOWORD(v96[9]) >> 12];
      *(_DWORD *)buf = 67111938;
      if ((v96[9] & 0x100) != 0)
        v62 = 114;
      else
        v62 = 45;
      *(_DWORD *)v83 = v61;
      *(_WORD *)&v83[4] = 1024;
      if ((v96[9] & 0x80) != 0)
        v63 = 119;
      else
        v63 = 45;
      *(_DWORD *)&v83[6] = v62;
      *(_WORD *)&v83[10] = 1024;
      if ((v96[9] & 0x40) != 0)
        v64 = 120;
      else
        v64 = 45;
      *(_DWORD *)&v83[12] = v63;
      if ((v96[9] & 0x20) != 0)
        v65 = 114;
      else
        v65 = 45;
      *(_WORD *)&v83[16] = 1024;
      if ((v96[9] & 0x10) != 0)
        v66 = 119;
      else
        v66 = 45;
      *(_DWORD *)&v83[18] = v64;
      if ((v96[9] & 8) != 0)
        v67 = 120;
      else
        v67 = 45;
      *(_WORD *)&v83[22] = 1024;
      if ((v96[9] & 4) != 0)
        v68 = 114;
      else
        v68 = 45;
      *(_DWORD *)&v83[24] = v65;
      if ((v96[9] & 2) != 0)
        v69 = 119;
      else
        v69 = 45;
      *(_WORD *)&v83[28] = 1024;
      if ((v96[9] & 1) != 0)
        v70 = 120;
      else
        v70 = 45;
      *(_DWORD *)&v83[30] = v66;
      v84 = 1024;
      v85 = v67;
      v86 = 1024;
      v87 = v68;
      v88 = 1024;
      v89 = v69;
      v90 = 1024;
      v91 = v70;
      v92 = 2112;
      v93 = self;
      v94 = 2112;
      v95 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Inappropriate file type %c%c%c%c%c%c%c%c%c%c for %@%@", buf, 0x52u);
    }

    *((_BYTE *)self + 161) |= 1u;
    v5 = v96[9];
  }
  v9 = BRCIsLegacyUbiquityFault(v3, SBYTE4(v96[9]), v5, &v96[5]);
  if (v9)
  {
    v10 = v9;
    -[NSURL path](self->_fileURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BRCUnlinkAt(-1, v11, ((v96[9] & 0xF000) == 0x4000) << 7);

    if (v12 < 0)
    {
      v28 = *__error();
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        if (v10 == 2)
          v71 = "brok";
        else
          v71 = "UF_COMPRESSED";
        -[NSURL path](self->_fileURL, "path");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v83 = v71;
        *(_WORD *)&v83[8] = 2112;
        *(_QWORD *)&v83[10] = v72;
        *(_WORD *)&v83[18] = 1024;
        *(_DWORD *)&v83[20] = v28;
        *(_WORD *)&v83[24] = 2112;
        *(_QWORD *)&v83[26] = v29;
        _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] failed to unlink legacy ubiquity %s fault at '%@' %{errno}d%@", buf, 0x26u);

      }
      *__error() = v28;
    }
    else
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v10 == 2)
          v15 = "brok";
        else
          v15 = "UF_COMPRESSED";
        -[NSURL path](self->_fileURL, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v83 = v15;
        *(_WORD *)&v83[8] = 2112;
        *(_QWORD *)&v83[10] = v16;
        *(_WORD *)&v83[18] = 2112;
        *(_QWORD *)&v83[20] = v13;
        _os_log_impl(&dword_230455000, v14, OS_LOG_TYPE_DEFAULT, "[NOTICE] cleaned up legacy ubiquity %s fault at '%@'%@", buf, 0x20u);

      }
    }
    return 14;
  }
  self->_fileID = *(_QWORD *)((char *)&v96[10] + 4);
  *(int32x2_t *)&self->_fsGenerationID = vrev64_s32(*(int32x2_t *)((char *)&v96[9] + 4));
  self->_mode = v96[9];
  if (BRCIsBusyDate(v96[1]))
  {
    v21 = time(0);
    v22 = v96[3];
    if (v21 < v96[3])
      v22 = v21;
    v96[1] = v22;
  }
  v23 = *(timespec *)&v96[3];
  self->_birthtime = *(timespec *)&v96[1];
  self->_mtime = v23;
  if ((v96[9] & 0xF000) == 0x8000)
    v24 = v97;
  else
    v24 = 0;
  self->_size = v24;
  v25 = *(_OWORD *)&v96[7];
  *(_OWORD *)self->_finderInfo = *(_OWORD *)&v96[5];
  *(_OWORD *)&self->_finderInfo[16] = v25;
  v26 = *((_BYTE *)self + 161) & 0xDF | (32 * ((LOBYTE(v96[6]) >> 7) & 1));
  *((_BYTE *)self + 161) = *((_BYTE *)self + 161) & 0xDF | (32 * (LOBYTE(v96[6]) >> 7));
  if ((v96[6] & 0xE00) != 0)
    v27 = v26 | 0x10;
  else
    v27 = *((_BYTE *)self + 161) & 0xEF | (16
                                         * (fgetxattr(v3, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0) > 0));
  *((_BYTE *)self + 161) = v27;
  if ((v27 & 0x20) != 0)
  {
    if ((v27 & 2) != 0)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.5();

      *((_BYTE *)self + 161) |= 1u;
    }
    if ((v96[9] & 0xF000) == 0x4000)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.4();

      *((_BYTE *)self + 161) |= 1u;
    }
    if (fgetxattr(v3, "com.apple.clouddocs.security", 0, 0, 0, 0) != -1)
    {
      *((_BYTE *)self + 161) |= 0x40u;
      brc_bread_crumbs();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.3((uint64_t)self, (uint64_t)v35, v36);

      return 45;
    }
    if (*__error() == 93)
    {
      v37 = *((_BYTE *)self + 161);
    }
    else
    {
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *__error();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v83 = self;
        *(_WORD *)&v83[8] = 1024;
        *(_DWORD *)&v83[10] = v41;
        *(_WORD *)&v83[14] = 2112;
        *(_QWORD *)&v83[16] = v39;
        _os_log_impl(&dword_230455000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr for '%@' %{errno}d%@", buf, 0x1Cu);
      }

      v37 = *((_BYTE *)self + 161) | 1;
    }
    *((_BYTE *)self + 161) = v37 & 0xBF;
  }
  if (_CFURLIsPromiseName() && ((self->_mode & 0xF000) != 0x8000 || (*((_BYTE *)self + 161) & 0x40) != 0))
  {
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      logicalName = self->_logicalName;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v83 = logicalName;
      *(_WORD *)&v83[8] = 2112;
      *(_QWORD *)&v83[10] = v42;
      _os_log_impl(&dword_230455000, v43, OS_LOG_TYPE_DEFAULT, "[WARNING] Excluding item with promise name that isn't a promise '%@'%@", buf, 0x16u);
    }

    *((_BYTE *)self + 161) |= 1u;
  }
  if (!-[BRCImportObject isSymLink](self, "isSymLink"))
    goto LABEL_61;
  if ((BRCReadlinkAt(-1, -[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), (char *)buf, 1025) & 0x80000000) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "br_pathWithFileSystemRepresentation:", buf);
    v45 = (NSString *)objc_claimAutoreleasedReturnValue();
    symlinkContent = self->_symlinkContent;
    self->_symlinkContent = v45;

    if (!-[NSString fileSystemRepresentation](self->_symlinkContent, "fileSystemRepresentation"))
    {
      brc_bread_crumbs();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.2((uint64_t)v73, v74);

    }
LABEL_61:
    -[BRCImportObject appLibrary](self, "appLibrary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mangledID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "maxXattrBlobSize");

    v75 = 0;
    +[BRFieldXattrBlob loadXattrsFromFD:withMaximumSize:error:](BRFieldXattrBlob, "loadXattrsFromFD:withMaximumSize:error:", v3, v50, &v75);
    v51 = (NSData *)objc_claimAutoreleasedReturnValue();
    v52 = v75;
    xattrs = self->_xattrs;
    self->_xattrs = v51;

    if (v52)
    {
      brc_bread_crumbs();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, (os_log_type_t)0x90u))
        -[BRCImportObject _resolveAgainstFileDescriptor:].cold.1((uint64_t)self, (uint64_t)v54, v55);

    }
    return 0;
  }
  v57 = *__error();
  if (v57)
    v20 = v57;
  else
    v20 = 22;
  brc_bread_crumbs();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = -[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation");
    *(_DWORD *)v78 = 136315394;
    v79 = v60;
    v80 = 2112;
    v81 = v58;
    _os_log_impl(&dword_230455000, v59, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read symlink at '%s'%@", v78, 0x16u);
  }

  return v20;
}

- (NSString)logicalName
{
  return self->_logicalName;
}

- (NSString)symlinkContent
{
  return self->_symlinkContent;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrs
{
  return self->_xattrs;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (BRCItemGlobalID)parentItemGlobalID
{
  return self->_parentItemGlobalID;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (unsigned)itemScope
{
  return self->_itemScope;
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (unint64_t)sharingOptions
{
  return self->_sharingOptions;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (BOOL)isDocumentsFolder
{
  return (*((unsigned __int8 *)self + 162) >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_parentItemGlobalID, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_logicalName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (BRCImportObject)initWithPackageURL:(id)a3 error:(id *)a4
{
  id v7;
  BRCImportObject *v8;
  BRCImportObject *v9;
  uint64_t v10;
  NSString *logicalName;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  char *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[18];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCImportObject;
  v8 = -[BRCImportObject init](&v24, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_14;
  objc_storeStrong((id *)&v8->_fileURL, a3);
  -[NSURL lastPathComponent](v9->_fileURL, "lastPathComponent");
  v10 = objc_claimAutoreleasedReturnValue();
  logicalName = v9->_logicalName;
  v9->_logicalName = (NSString *)v10;

  *((_BYTE *)v9 + 161) |= 2u;
  v12 = open(-[NSURL fileSystemRepresentation](v9->_fileURL, "fileSystemRepresentation"), 2129924);
  if ((v12 & 0x80000000) == 0)
  {
    v13 = v12;
    v14 = -[BRCImportObject _resolveAgainstFileDescriptor:](v9, "_resolveAgainstFileDescriptor:", v12);
    close(v13);
    if (!(_DWORD)v14)
      goto LABEL_14;
    goto LABEL_8;
  }
  v14 = *__error();
  v15 = *__error();
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
  {
    -[NSURL path](v9->_fileURL, "path");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v23;
    v27 = 1024;
    *(_DWORD *)v28 = v15;
    *(_WORD *)&v28[4] = 2112;
    *(_QWORD *)&v28[6] = v16;
    _os_log_error_impl(&dword_230455000, v17, (os_log_type_t)0x90u, "[ERROR] Failed opening %@ %{errno}d%@", buf, 0x1Cu);

  }
  *__error() = v15;
  if ((_DWORD)v14)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v26 = "-[BRCImportObject(BRCPackageAdditions) initWithPackageURL:error:]";
        v27 = 2080;
        if (!a4)
          v22 = "(ignored by caller)";
        *(_QWORD *)v28 = v22;
        *(_WORD *)&v28[8] = 2112;
        *(_QWORD *)&v28[10] = v18;
        v29 = 2112;
        v30 = v19;
        _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v18);

    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (BRCImportObject)initWithURL:(id)a3 packageRoot:(id)a4 error:(id *)a5
{
  id v8;
  BRCImportObject *v9;
  uint64_t v10;
  BRCAccountSessionFPFS *session;
  uint64_t v12;
  BRCAppLibrary *appLibrary;

  v8 = a4;
  v9 = -[BRCImportObject initWithPackageURL:error:](self, "initWithPackageURL:error:", a3, a5);
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = objc_claimAutoreleasedReturnValue();
    session = v9->_session;
    v9->_session = (BRCAccountSessionFPFS *)v10;

    objc_msgSend(v8, "appLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    appLibrary = v9->_appLibrary;
    v9->_appLibrary = (BRCAppLibrary *)v12;

  }
  return v9;
}

- (void)_resolveAgainstFileDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 8), "fileSystemRepresentation");
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] Recieved an error while reading xattrs at '%s'%@", v4, 0x16u);
}

- (void)_resolveAgainstFileDescriptor:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _symlinkContent.fileSystemRepresentation != nil%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)_resolveAgainstFileDescriptor:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 8), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] BR alias is ignored at '%@'%@", v5, 0x16u);

}

- (void)_resolveAgainstFileDescriptor:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Directory is marked as alias, ignoring '%@'%@");
  OUTLINED_FUNCTION_0();
}

- (void)_resolveAgainstFileDescriptor:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Inappropriate location or an alias for '%@'%@");
  OUTLINED_FUNCTION_0();
}

@end
