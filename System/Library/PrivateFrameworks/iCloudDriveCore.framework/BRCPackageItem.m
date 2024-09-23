@implementation BRCPackageItem

+ (id)newItemForSignatureCalculationWithURL:(id)a3 inPackage:(id)a4 boundaryKey:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = -[BRCPackageItem _initWithURL:inPackage:forItem:error:]([BRCPackageItem alloc], "_initWithURL:inPackage:forItem:error:", v9, v11, 0, a6);

  if (v12 && objc_msgSend(v12, "updateContentSignature:boundaryKey:error:", v9, v10, a6))
    v13 = v12;
  else
    v13 = 0;

  return v13;
}

- (BOOL)updateContentSignature:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSData *v15;
  void *contentSignature;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  const char *v24;
  id v25;
  uint8_t buf[4];
  BRCPackageItem *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  if (self->_type != 2)
  {
    v17 = 0;
    goto LABEL_19;
  }
  v10 = objc_msgSend(MEMORY[0x24BE17660], "open:flags:", v8, 0x8000);
  if ((v10 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v27 = self;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v12;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] %@ - Failed opening contents at '%@'. Error: %@%@", buf, 0x2Au);
    }

  }
  else
  {
    v11 = v10;
    v25 = 0;
    objc_msgSend(MEMORY[0x24BDB9248], "br_signatureWithFileDescriptor:boundaryKey:error:", v10, v9, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;
    v14 = v13;
    if (v12)
    {
      v15 = v12;
      contentSignature = self->_contentSignature;
      self->_contentSignature = v15;
    }
    else
    {
      if (!v13)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      brc_bread_crumbs();
      contentSignature = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138413058;
        v27 = self;
        v28 = 2112;
        v29 = v8;
        v30 = 2112;
        v31 = v14;
        v32 = 2112;
        v33 = contentSignature;
        _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %@ - Failed calculating content signature at '%@'. Error: %@%@", buf, 0x2Au);
      }

    }
    objc_msgSend(MEMORY[0x24BE17660], "closeFD:", v11);
  }

  v17 = v14;
  if (!v17)
  {
LABEL_19:
    v22 = 1;
    if (!a5)
      goto LABEL_21;
LABEL_20:
    *a5 = objc_retainAutorelease(v17);
    goto LABEL_21;
  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
  {
    v24 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v27 = (BRCPackageItem *)"-[BRCPackageItem(FPFSAdditions) updateContentSignature:boundaryKey:error:]";
    v28 = 2080;
    if (!a5)
      v24 = "(ignored by caller)";
    v29 = v24;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v20;
    _os_log_error_impl(&dword_230455000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

  v22 = 0;
  if (a5)
    goto LABEL_20;
LABEL_21:

  return v22;
}

- (id)_initWithURL:(id)a3 inPackage:(id)a4 forItem:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BRCPackageItem *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  NSString *pathInPackage;
  BRCImportObject *v24;
  BRCImportObject *v25;
  void *v26;
  NSObject *v27;
  BRCPackageItem *v28;
  BRCImportObject *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  NSData *quarantineInfo;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  void *v41;
  void *v43;
  NSObject *v44;
  unsigned int v45;
  const char *v46;
  void *v47;
  BRCImportObject *v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  _BYTE v53[18];
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)BRCPackageItem;
  v13 = -[BRCPackageItem init](&v51, sel_init);
  if (!v13)
    goto LABEL_36;
  if (v12)
  {
    if ((objc_msgSend(v12, "needsInsert") & 1) != 0)
    {
      objc_msgSend(v12, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13->_itemRowID = objc_msgSend(v15, "nextItemRowID");

    }
    else
    {
      v13->_itemRowID = objc_msgSend(v12, "dbRowID");
    }
  }
  v50 = 0;
  v16 = *MEMORY[0x24BDBCBD0];
  v17 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v50, *MEMORY[0x24BDBCBD0], a6);
  v18 = v50;
  v19 = 0;
  if (!v17
    || (v49 = 0,
        v20 = objc_msgSend(v10, "getResourceValue:forKey:error:", &v49, v16, a6),
        v21 = v49,
        v19 = v21,
        (v20 & 1) == 0))
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      -[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:].cold.1();

    goto LABEL_13;
  }
  objc_msgSend(v21, "br_pathRelativeToPath:", v18);
  v22 = objc_claimAutoreleasedReturnValue();
  pathInPackage = v13->_pathInPackage;
  v13->_pathInPackage = (NSString *)v22;

  v24 = [BRCImportObject alloc];
  if (v12)
    v25 = -[BRCImportObject initWithURL:packageRoot:error:](v24, "initWithURL:packageRoot:error:", v10, v12, a6);
  else
    v25 = -[BRCImportObject initWithPackageURL:error:](v24, "initWithPackageURL:error:", v10, a6);
  v29 = v25;
  if (v25)
  {
    if (-[BRCImportObject isExcluded](v25, "isExcluded"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemIneligibleFromSyncForInode:", 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
LABEL_20:
        if (a6)
        {
          v30 = objc_retainAutorelease(v30);
          *a6 = v30;
        }

        goto LABEL_23;
      }
      brc_bread_crumbs();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, (os_log_type_t)0x90u))
      {
LABEL_19:

        goto LABEL_20;
      }
      v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)v53 = "-[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:]";
      *(_WORD *)&v53[8] = 2080;
      if (!a6)
        v46 = "(ignored by caller)";
LABEL_49:
      *(_QWORD *)&v53[10] = v46;
      v54 = 2112;
      v55 = v30;
      v56 = 2112;
      v57 = v47;
      _os_log_error_impl(&dword_230455000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_19;
    }
    v13->_fileID = -[BRCImportObject fileID](v29, "fileID");
    -[BRCImportObject quarantineInfo](v29, "quarantineInfo");
    v32 = objc_claimAutoreleasedReturnValue();
    quarantineInfo = v13->_quarantineInfo;
    v13->_quarantineInfo = (NSData *)v32;

    -[BRCImportObject xattrs](v29, "xattrs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[BRCImportObject xattrs](v29, "xattrs");
      v48 = v29;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stageRegistry");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPackageItem _setXattrs:stageRegistry:](v13, "_setXattrs:stageRegistry:", v35, v37);

      v29 = v48;
    }
    v13->_mtime = -[BRCImportObject modificationTime](v29, "modificationTime");
    if (-[BRCImportObject isFile](v29, "isFile"))
    {
      v13->_type = 2;
      v13->_size = -[BRCImportObject size](v29, "size");
      if (-[BRCImportObject isWritable](v29, "isWritable"))
        v13->_mode |= 1u;
      if (-[BRCImportObject isExecutable](v29, "isExecutable"))
        v13->_mode |= 2u;
      -[BRCImportObject generationID](v29, "generationID");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = &OBJC_IVAR___BRCPackageItem__generationID;
    }
    else
    {
      if (-[BRCImportObject isUnixDir](v29, "isUnixDir"))
      {
        v13->_type = 1;
        goto LABEL_35;
      }
      if (!-[BRCImportObject isSymLink](v29, "isSymLink"))
      {
        brc_bread_crumbs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = -[BRCImportObject fileType](v29, "fileType");
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v53 = v45;
          *(_WORD *)&v53[4] = 2112;
          *(_QWORD *)&v53[6] = v43;
          _os_log_impl(&dword_230455000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't determine item type %d%@", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemIneligibleFromSyncForInode:", 0);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        if (!v30)
          goto LABEL_20;
        brc_bread_crumbs();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, (os_log_type_t)0x90u))
          goto LABEL_19;
        v46 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)v53 = "-[BRCPackageItem(FPFSAdditions) _initWithURL:inPackage:forItem:error:]";
        *(_WORD *)&v53[8] = 2080;
        if (!a6)
          v46 = "(ignored by caller)";
        goto LABEL_49;
      }
      v13->_type = 3;
      -[BRCImportObject symlinkContent](v29, "symlinkContent");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = &OBJC_IVAR___BRCPackageItem__symlinkContent;
    }
    v40 = *v39;
    v41 = *(Class *)((char *)&v13->super.isa + v40);
    *(Class *)((char *)&v13->super.isa + v40) = (Class)v38;

LABEL_35:
LABEL_36:
    v28 = v13;
    goto LABEL_37;
  }
LABEL_23:

LABEL_13:
  v28 = 0;
LABEL_37:

  return v28;
}

+ (int64_t)largestPackageItemSizeInItemRowID:(unint64_t)a3 session:(id)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT largest_file_size FROM client_pkg_upload_sizes WHERE item_rowid = %llu"), a3);

  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return v7;
}

+ (id)packageItemsForItemRowID:(unint64_t)a3 order:(unint64_t)a4 db:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v15 = a3;
    v16 = 2048;
    v17 = a4;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_INFO, "[INFO] packageItemsFor itemRowID [%llu] order [%lu]%@", buf, 0x20u);
  }

  if (a4 == 1)
  {
    v10 = CFSTR("SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode FROM client_pkg_upload_items WHERE item_rowid = %llu ORDER BY asset_rank");
  }
  else
  {
    if (a4 != 2)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v10 = CFSTR("SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode FROM client_pkg_upload_items WHERE item_rowid = %llu ORDER BY rel_path");
  }
  v11 = (void *)objc_msgSend(v7, "fetch:", v10, a3);
LABEL_9:
  objc_msgSend(v11, "enumerateObjects:", &__block_literal_global_35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __67__BRCPackageItem_FPFSAdditions__packageItemsForItemRowID_order_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = -[BRCPackageItem initFromPQLResultSet:error:]([BRCPackageItem alloc], "initFromPQLResultSet:error:", v4, a3);

  return v5;
}

+ (BOOL)updateSignaturesForFilesInItem:(id)a3 fromCKPackage:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  objc_msgSend(v8, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "fetch:", CFSTR("SELECT asset_rank, generation  FROM client_pkg_upload_items WHERE item_rowid = %llu AND item_type = %d"), objc_msgSend(v6, "dbRowID"), 2);
  while (1)
  {

    if (!objc_msgSend(v12, "next"))
      break;
    objc_msgSend(v12, "numberAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectOfClass:atIndex:", objc_opt_class(), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "signature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);
    objc_msgSend(v9, "addIndex:", objc_msgSend(v11, "unsignedIntegerValue"));

  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__28;
  v38 = __Block_byref_object_dispose__28;
  v39 = 0;
  v15 = objc_msgSend(v7, "itemCount");
  if (v15 == objc_msgSend(v9, "count"))
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke;
    v26[3] = &unk_24FE45E38;
    v27 = v7;
    v31 = v40;
    v28 = v10;
    v29 = v6;
    v32 = &v41;
    v33 = &v34;
    v30 = v8;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v26);

    v16 = v27;
  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v23 = objc_msgSend(v7, "itemCount");
      v24 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218498;
      v46 = v23;
      v47 = 2048;
      v48 = v24;
      v49 = 2112;
      v50 = v17;
      _os_log_fault_impl(&dword_230455000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong number of items in package. pkg [%lu] assetRanks [%lu]%@", buf, 0x20u);
    }

    *((_BYTE *)v42 + 24) = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], 17, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v35[5];
    v35[5] = v19;
  }

  v20 = *((unsigned __int8 *)v42 + 24);
  if (a5 && !*((_BYTE *)v42 + 24))
  {
    *a5 = objc_retainAutorelease((id)v35[5]);
    v20 = *((unsigned __int8 *)v42 + 24);
  }
  v21 = v20 != 0;
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);

  return v21;
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x2348B9F14]();
  v7 = *(void **)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(v7, "itemAtIndex:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "signature");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = a2;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v12;
    _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Learning signature for rank %ld, signature:%@, asset %@%@", buf, 0x2Au);

  }
  objc_msgSend(v8, "signature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (!v11)
      goto LABEL_6;
  }
  else
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2();

    if (!v11)
      goto LABEL_6;
  }
  objc_msgSend(v8, "signature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "isEqualToData:", v15);

  if ((v16 & 1) == 0)
  {
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "itemID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v30;
      v35 = 2048;
      v36 = a2;
      v37 = 2112;
      v38 = v25;
      _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing updates of signatures for item %@ because pkg item with rank %lu changed%@", buf, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a3 = 1;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], 17, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v23 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;
    goto LABEL_13;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 56), "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v17, "execute:", CFSTR("UPDATE client_pkg_upload_items SET signature_or_link = %@ WHERE item_rowid = %llu AND asset_rank = %ld"), v18, objc_msgSend(*(id *)(a1 + 48), "dbRowID"), a2);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    *a3 = 1;
    objc_msgSend(*(id *)(a1 + 56), "clientDB");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastError");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1();

LABEL_13:
  }

  objc_autoreleasePoolPop(v6);
}

- (BOOL)saveToDBWithSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*v6)(uint64_t, void *, uint64_t);
  uint64_t *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint64_t (**v34)(_QWORD, _QWORD, _QWORD);
  _QWORD v35[4];
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  BRCPackageItem *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_assetRank)
  {
    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_assetRank = objc_msgSend(v5, "allocatePackageItemRank");

  }
  switch(self->_type)
  {
    case 1:
      v38 = MEMORY[0x24BDAC760];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2;
      v7 = &v38;
      goto LABEL_7;
    case 2:
      v39 = MEMORY[0x24BDAC760];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke;
      v7 = &v39;
      goto LABEL_7;
    case 3:
      v37 = MEMORY[0x24BDAC760];
      v6 = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3;
      v7 = &v37;
LABEL_7:
      v7[1] = 3221225472;
      v7[2] = (uint64_t)v6;
      v7[3] = (uint64_t)&unk_24FE45E60;
      v7[4] = (uint64_t)self;
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC]();
      if (!v8)
        goto LABEL_8;
      goto LABEL_11;
    case 4:
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_230455000, v30, OS_LOG_TYPE_DEFAULT, "[NOTICE] Ignoring tombstone pkg item %@%@", buf, 0x16u);
      }

      brc_bread_crumbs();
      v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.3();
      v16 = 1;
      goto LABEL_23;
    default:
LABEL_8:
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.2();

      v8 = 0;
LABEL_11:
      objc_msgSend(v4, "clientDB");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sqliteErrorHandler");
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "clientDB");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_38;
      v35[3] = &unk_24FE402A8;
      v15 = (id)v12;
      v36 = v15;
      LOBYTE(v12) = ((uint64_t (**)(_QWORD, void *, _QWORD *))v8)[2](v8, v13, v35);

      if ((v12 & 1) != 0)
        goto LABEL_12;
      objc_msgSend(v4, "clientDB");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isSqliteErrorCode:", 19);

      if (!v19)
        goto LABEL_17;
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = self;
        v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] Overriding an already declared item %@%@", buf, 0x16u);
      }

      objc_msgSend(v4, "clientDB");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v14;
      v33[1] = 3221225472;
      v33[2] = __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_40;
      v33[3] = &unk_24FE45E88;
      v33[4] = self;
      v34 = v8;
      v23 = objc_msgSend(v22, "groupInTransaction:", v33);

      if ((v23 & 1) != 0)
      {
LABEL_12:
        v16 = 1;
      }
      else
      {
LABEL_17:
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        {
          objc_msgSend(v4, "clientDB");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastError");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = self;
          v42 = 2112;
          v43 = v32;
          v44 = 2112;
          v45 = v24;
          _os_log_error_impl(&dword_230455000, v25, (os_log_type_t)0x90u, "[ERROR] failed to save item %@ to DB: %@%@", buf, 0x20u);

        }
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[BRCPackageItem(DatabaseMethods) saveToDBWithSession:].cold.1();

        v16 = 0;
      }

LABEL_23:
      return v16;
  }
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu, %@, %@, %llu, %u)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 48), *(char *)(v3 + 60));
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 40));
}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "executeWithErrorHandler:sql:", a3, CFSTR("INSERT INTO client_pkg_upload_items (item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link) VALUES (%llu, %@, %u, %llu, %llu, %@, %@, %llu, %@)"), *(_QWORD *)(v3 + 8), *(_QWORD *)(v3 + 32), *(unsigned int *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 72));
}

void __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_38(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isSqliteErrorCode:", 19) & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }

}

uint64_t __55__BRCPackageItem_DatabaseMethods__saveToDBWithSession___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "execute:", CFSTR("DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu AND rel_path = %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)))v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v4 = 0;

  return v4;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5;
  BRCPackageItem *v6;
  uint64_t v7;
  NSString *pathInPackage;
  uint64_t v9;
  NSData *quarantineInfo;
  uint64_t v11;
  NSData *xattrSignature;
  int type;
  uint64_t v14;
  NSString *symlinkContent;
  uint64_t v16;
  NSData *contentSignature;
  uint64_t v18;
  BRCGenerationID *generationID;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCPackageItem;
  v6 = -[BRCPackageItem init](&v21, sel_init);
  if (v6)
  {
    v6->_itemRowID = objc_msgSend(v5, "longLongAtIndex:", 0);
    objc_msgSend(v5, "stringAtIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    pathInPackage = v6->_pathInPackage;
    v6->_pathInPackage = (NSString *)v7;

    v6->_type = objc_msgSend(v5, "intAtIndex:", 2);
    v6->_assetRank = objc_msgSend(v5, "longLongAtIndex:", 3);
    v6->_fileID = objc_msgSend(v5, "longLongAtIndex:", 4);
    objc_msgSend(v5, "dataAtIndex:", 5);
    v9 = objc_claimAutoreleasedReturnValue();
    quarantineInfo = v6->_quarantineInfo;
    v6->_quarantineInfo = (NSData *)v9;

    objc_msgSend(v5, "dataAtIndex:", 6);
    v11 = objc_claimAutoreleasedReturnValue();
    xattrSignature = v6->_xattrSignature;
    v6->_xattrSignature = (NSData *)v11;

    v6->_mtime = objc_msgSend(v5, "longLongAtIndex:", 7);
    type = v6->_type;
    if (type == 2)
    {
      objc_msgSend(v5, "dataAtIndex:", 8);
      v16 = objc_claimAutoreleasedReturnValue();
      contentSignature = v6->_contentSignature;
      v6->_contentSignature = (NSData *)v16;

      objc_msgSend(v5, "objectOfClass:atIndex:", objc_opt_class(), 9);
      v18 = objc_claimAutoreleasedReturnValue();
      generationID = v6->_generationID;
      v6->_generationID = (BRCGenerationID *)v18;

      v6->_size = objc_msgSend(v5, "unsignedLongLongAtIndex:", 10);
      v6->_mode = objc_msgSend(v5, "intAtIndex:", 11);
    }
    else if (type == 3)
    {
      objc_msgSend(v5, "stringAtIndex:", 8);
      v14 = objc_claimAutoreleasedReturnValue();
      symlinkContent = v6->_symlinkContent;
      v6->_symlinkContent = (NSString *)v14;

    }
  }

  return v6;
}

+ (BOOL)dumpSession:(id)a3 toContext:(id)a4 db:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(v11, "fetch:", CFSTR("SELECT item_rowid, rel_path, item_type, asset_rank, file_id, quarantine_info, xattr_signature, mtime, signature_or_link, generation, size, mode  FROM client_pkg_upload_items  ORDER BY item_rowid, rel_path"));
  objc_msgSend(v10, "writeLineWithFormat:", CFSTR("client_pkg_upload_items"));
  objc_msgSend(v10, "writeLineWithFormat:", CFSTR("================"));
  if (objc_msgSend(v12, "next"))
  {
    do
    {
      v13 = (void *)MEMORY[0x2348B9F14]();
      v14 = -[BRCPackageItem initFromPQLResultSet:error:]([BRCPackageItem alloc], "initFromPQLResultSet:error:", v12, 0);
      objc_msgSend(v10, "writeLineWithFormat:", CFSTR("%@"), v14);

      objc_autoreleasePoolPop(v13);
    }
    while ((objc_msgSend(v12, "next") & 1) != 0);
  }
  objc_msgSend(v10, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v12, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v12, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v22 = "+[BRCPackageItem(DatabaseMethods) dumpSession:toContext:db:error:]";
        v23 = 2080;
        if (!a6)
          v20 = "(ignored by caller)";
        v24 = v20;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v16);

  }
  return v15 == 0;
}

- (BOOL)isFile
{
  return self->_type == 2;
}

- (BOOL)isSymLink
{
  return self->_type == 3;
}

- (BOOL)isDirectory
{
  return self->_type == 1;
}

- (NSString)symlinkContent
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[BRCPackageItem isSymLink](self, "isSymLink"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCPackageItem symlinkContent].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return self->_symlinkContent;
}

- (NSData)contentSignature
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[BRCPackageItem isFile](self, "isFile"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCPackageItem contentSignature].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return self->_contentSignature;
}

- (NSString)description
{
  void *v3;
  unint64_t itemRowID;
  const char *v5;
  void *v6;
  BRCGenerationID *generationID;
  int64_t size;
  int64_t mtime;
  int mode;
  char v11;
  char v12;
  NSData *contentSignature;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSData *quarantineInfo;
  NSData *xattrSignature;
  void *v24;
  _BYTE v26[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 32);
  itemRowID = self->_itemRowID;
  if (self->_isDirty)
    v5 = " (dirty)";
  else
    v5 = "";
  -[NSString fp_obfuscatedPath](self->_pathInPackage, "fp_obfuscatedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pkg:%lld%s p:'%@' rank:%lld ino:%lld"), itemRowID, v5, v6, self->_assetRank, self->_fileID);

  switch(self->_type)
  {
    case 1:
      objc_msgSend(v3, "appendString:", CFSTR(" dir"));
      break;
    case 2:
      generationID = self->_generationID;
      mtime = self->_mtime;
      size = self->_size;
      v26[0] = 114;
      mode = self->_mode;
      if ((mode & 1) != 0)
        v11 = 119;
      else
        v11 = 45;
      v26[1] = v11;
      if ((mode & 2) != 0)
        v12 = 120;
      else
        v12 = 45;
      v26[2] = v12;
      v26[3] = (mode << 29 >> 31) & 0x4C;
      v26[4] = 0;
      objc_msgSend(v3, "appendFormat:", CFSTR(" file gen:%@ size:%llu mtime:%llu mode:%s"), generationID, size, mtime, v26);
      contentSignature = self->_contentSignature;
      if (contentSignature)
      {
        -[NSData brc_hexadecimalString](contentSignature, "brc_hexadecimalString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" sig:%@"), v14);
        goto LABEL_18;
      }
      break;
    case 3:
      -[NSString fp_obfuscatedPath](self->_symlinkContent, "fp_obfuscatedPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" link to:'%@'"), v14);
      goto LABEL_18;
    case 4:
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BRCPackageItem description].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

LABEL_18:
      break;
    default:
      break;
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo)
    objc_msgSend(v3, "appendFormat:", CFSTR(" quarantine:%u "), -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    -[NSData brc_hexadecimalString](xattrSignature, "brc_hexadecimalString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" xattrSig:%@"), v24);

  }
  return (NSString *)v3;
}

- (void)_setXattrs:(id)a3 stageRegistry:(id)a4
{
  id v6;
  NSData *v7;
  NSData *xattrSignature;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "brc_signature");
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  xattrSignature = self->_xattrSignature;
  self->_xattrSignature = v7;

  if (v9 && v6)
    objc_msgSend(v6, "saveXattrBlob:forSignature:error:", v9, self->_xattrSignature, 0);

}

- (BRCPackageItem)initWithPBItem:(id)a3 forLocalItem:(id)a4
{
  id v6;
  id v7;
  BRCPackageItem *v8;
  void *v9;
  uint64_t v10;
  NSString *pathInPackage;
  void *v12;
  uint64_t v13;
  NSData *quarantineInfo;
  void *v15;
  int type;
  void *v17;
  uint64_t v18;
  NSString *symlinkContent;
  void *v20;
  int v21;
  void *v22;
  int v23;
  BRCGenerationID *v24;
  BRCGenerationID *generationID;
  void *v26;
  void *v27;
  uint64_t v28;
  NSData *contentSignature;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)BRCPackageItem;
  v8 = -[BRCPackageItem init](&v34, sel_init);
  if (v8)
  {
    v8->_itemRowID = objc_msgSend(v7, "dbRowID");
    objc_msgSend(v6, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    pathInPackage = v8->_pathInPackage;
    v8->_pathInPackage = (NSString *)v10;

    v8->_fileID = objc_msgSend(v6, "fileID");
    objc_msgSend(v6, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quarantineInfo");
    v13 = objc_claimAutoreleasedReturnValue();
    quarantineInfo = v8->_quarantineInfo;
    v8->_quarantineInfo = (NSData *)v13;

    objc_msgSend(v6, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_type = objc_msgSend(v15, "type");

    type = v8->_type;
    if (type == 4)
    {
      v30 = v8;
      v8 = 0;
      goto LABEL_14;
    }
    if (type == 3)
    {
      objc_msgSend(v6, "item");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "symlinkContent");
      v18 = objc_claimAutoreleasedReturnValue();
      symlinkContent = v8->_symlinkContent;
      v8->_symlinkContent = (NSString *)v18;

      type = v8->_type;
    }
    if (type == 2)
    {
      v8->_mode = 0;
      objc_msgSend(v6, "item");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isWritable");

      if (v21)
        v8->_mode |= 1u;
      objc_msgSend(v6, "item");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isExecutable");

      if (v23)
        v8->_mode |= 2u;
      v24 = -[BRCGenerationID initWithFSGenerationID:]([BRCGenerationID alloc], "initWithFSGenerationID:", objc_msgSend(v6, "generationID"));
      generationID = v8->_generationID;
      v8->_generationID = v24;

      v8->_size = objc_msgSend(v6, "size");
      objc_msgSend(v6, "item");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_mtime = objc_msgSend(v26, "mtime");

      objc_msgSend(v6, "item");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "signature");
      v28 = objc_claimAutoreleasedReturnValue();
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v28;

    }
    if (objc_msgSend(v6, "hasXattrs"))
    {
      objc_msgSend(v6, "xattrs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "session");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stageRegistry");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCPackageItem _setXattrs:stageRegistry:](v8, "_setXattrs:stageRegistry:", v30, v32);

LABEL_14:
    }
  }

  return v8;
}

+ (id)packageItemsForItem:(id)a3 order:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 138412802;
    v14 = v6;
    v15 = 2048;
    v16 = objc_msgSend(v6, "dbRowID");
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_INFO, "[INFO] calling packageItemsForItem %@ item_rowid %llu%@", (uint8_t *)&v13, 0x20u);
  }

  v9 = objc_msgSend(v6, "dbRowID");
  objc_msgSend(v6, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "packageItemsForItemRowID:order:db:", v9, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)packageItemsForFileObjectID:(id)a3 order:(unint64_t)a4 db:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a1, "packageItemsForItemRowID:order:db:", objc_msgSend(a3, "rawID"), a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)type
{
  return self->_type;
}

- (int64_t)assetRank
{
  return self->_assetRank;
}

- (unint64_t)itemRowID
{
  return self->_itemRowID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (BRCGenerationID)generationID
{
  return self->_generationID;
}

- (NSString)pathInPackage
{
  return self->_pathInPackage;
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (char)mode
{
  return self->_mode;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_pathInPackage, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: updating asset signature should work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __86__BRCPackageItem_DatabaseMethods__updateSignaturesForFilesInItem_fromCKPackage_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: cpi.signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)symlinkContent
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: self.isSymLink%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)contentSignature
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: self.isFile%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)description
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] UNREACHABLE: no BRCPackageItem should be a Tombstone%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
