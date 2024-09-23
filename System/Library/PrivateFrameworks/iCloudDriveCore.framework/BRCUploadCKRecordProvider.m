@implementation BRCUploadCKRecordProvider

- (BRCUploadCKRecordProvider)initWithStageRegistry:(id)a3 deviceID:(id)a4
{
  id v7;
  id v8;
  BRCUploadCKRecordProvider *v9;
  BRCUploadCKRecordProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCUploadCKRecordProvider;
  v9 = -[BRCUploadCKRecordProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stageRegistry, a3);
    objc_storeStrong((id *)&v10->_deviceID, a4);
  }

  return v10;
}

- (id)createCKRecordFor:(id)a3 document:(id)a4 stageID:(id)a5 mtime:(unint64_t)a6 etag:(id)a7 xattrSignature:(id)a8 transferSize:(int64_t *)a9 boundaryKey:(id *)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const char *v38;
  int64_t *v39;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  _BYTE buf[12];
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v39 = a9;
  v52 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v41 = a5;
  v18 = a7;
  v19 = a8;
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v21, &v44);

  if (!(_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 2);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        v38 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCUploadCKRecordProvider createCKRecordFor:document:stageID:mtime:etag:xattrSignature:tr"
                             "ansferSize:boundaryKey:error:]";
        v46 = 2080;
        if (!a11)
          v38 = "(ignored by caller)";
        v47 = v38;
        v48 = 2112;
        v49 = v24;
        v50 = 2112;
        v51 = v25;
        _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a11)
    {
      v24 = objc_retainAutorelease(v24);
      v27 = 0;
      *a11 = v24;
    }
    else
    {
      v27 = 0;
    }
    goto LABEL_29;
  }
  *(_QWORD *)buf = 0;
  if (v44)
  {
    v43 = 0;
    v22 = (id *)&v43;
    -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:](self, "_createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:", v16, v17, v41, buf, &v43, a11);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
    v22 = (id *)&v42;
    -[BRCUploadCKRecordProvider _createFileRecordForURL:item:fileSize:boundaryKey:error:](self, "_createFileRecordForURL:item:fileSize:boundaryKey:error:", v16, v17, buf, &v42, a11);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (id)v23;
  v28 = *v22;
  v24 = v28;
  if (!v27)
  {
LABEL_29:

    v27 = v27;
    v35 = v27;
    goto LABEL_30;
  }
  if (a10)
    *a10 = objc_retainAutorelease(v28);
  v29 = objc_msgSend(v17, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v24 != 0);
  if (objc_msgSend(v27, "serializeForContentUpload:size:mtime:etag:shouldUseEnhancedDrivePrivacy:error:", v17, *(_QWORD *)buf, a6, v18, v29, a11))
  {
    if (v19)
    {
      -[BRCStageRegistry urlForXattrSignature:](self->_stageRegistry, "urlForXattrSignature:", v19);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v30, v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("xattr"));
        if (v24)
          v32 = v19;
        else
          v32 = 0;
        objc_msgSend(v27, "encryptedValues", a9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("xattrSignature"));

        v34 = objc_msgSend(v31, "size");
      }
      else
      {
        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          -[BRCUploadCKRecordProvider createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:].cold.1();

        v34 = 0;
      }

    }
    else
    {
      v34 = 0;
    }
    if (v39)
      *v39 = *(_QWORD *)buf + v34;
    goto LABEL_29;
  }

  v35 = 0;
LABEL_30:

  return v35;
}

- (id)_createFileRecordForURL:(id)a3 item:(id)a4 fileSize:(int64_t *)a5 boundaryKey:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  int64_t *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  __CFString **v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[BRCUploadCKRecordProvider _createFileRecordForURL:item:fileSize:boundaryKey:error:].cold.1(v11);

  objc_msgSend(v12, "baseRecordClearAllFields:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v16 = *MEMORY[0x24BDBCC48];
  v37 = 0;
  v17 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v38, v16, &v37);
  v18 = v38;
  v19 = v37;
  v20 = v19;
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v15, "getAndUpdateBoundaryKeyForItem:", v12);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v21 != 0);
    if (a6)
      *a6 = objc_retainAutorelease(v21);
    v36 = v20;
    v23 = v18;
    v24 = a5;
    if (objc_msgSend(v12, "isFinderBookmark"))
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }

      v29 = kBRRecordKeyFinderBookmarkContent;
      v21 = (id)v25;
    }
    else
    {
      v29 = kBRRecordKeyFileContent;
    }
    objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v11, v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, *v29);
    objc_msgSend(v12, "st");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logicalName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "br_pathExtension");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setItemTypeHint:", v33);

    if (v24)
      *v24 = objc_msgSend(v23, "longLongValue");
    v28 = v15;

    v18 = v23;
    v20 = v36;
  }
  else
  {
    v21 = v19;
    if (v21)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v40 = "-[BRCUploadCKRecordProvider _createFileRecordForURL:item:fileSize:boundaryKey:error:]";
        v41 = 2080;
        if (!a7)
          v35 = "(ignored by caller)";
        v42 = v35;
        v43 = 2112;
        v44 = v21;
        v45 = 2112;
        v46 = v26;
        _os_log_error_impl(&dword_230455000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
    {
      v21 = objc_retainAutorelease(v21);
      v28 = 0;
      *a7 = v21;
    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (id)_createPackageRecordForURL:(id)a3 item:(id)a4 stageID:(id)a5 fileSize:(int64_t *)a6 boundaryKey:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BRCPackageManifestWriter *v21;
  void *v22;
  BRCPackageManifestWriter *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  char v29;
  BRCLazyPackage *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  BRCPackageManifestWriter *v54;
  id v55;
  BRCLazyPackage *v56;
  id v57;
  id v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  BRCUploadCKRecordProvider *v70;
  id v71;
  id v72;
  BRCLazyPackage *v73;
  BRCPackageManifestWriter *v74;
  id v75;
  _BYTE *v76;
  id v77;
  id v78;
  uint8_t v79[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  _BYTE buf[24];
  id v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v13 = a4;
  v14 = a5;
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:].cold.3(v66);

  objc_msgSend(v13, "baseRecordClearAllFields:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStageRegistry createURLForUploadWithStageID:name:](self->_stageRegistry, "createURLForUploadWithStageID:name:", v14, CFSTR("brpackage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStageRegistry createURLForUploadWithStageID:name:](self->_stageRegistry, "createURLForUploadWithStageID:name:", v14, CFSTR("ckpackage"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isFinderBookmark"))
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:].cold.2((uint64_t)v51, v52);

  }
  objc_msgSend(v17, "getAndUpdateBoundaryKeyForItem:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a7)
    *a7 = objc_retainAutorelease(v19);
  objc_msgSend(v13, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", v20 != 0);
  v21 = [BRCPackageManifestWriter alloc];
  objc_msgSend(v13, "clientZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[BRCPackageManifestWriter initWithZone:stageID:url:](v21, "initWithZone:stageID:url:", v22, v14, v18);

  -[BRCPackageManifestWriter error](v23, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v78 = 0;
    objc_msgSend(MEMORY[0x24BDB9198], "br_packageWithBoundaryKey:error:", v20, &v78);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v78;
    if (v63)
    {
      v77 = v28;
      v29 = objc_msgSend(v63, "anchorAtURL:error:", v65, &v77);
      v57 = v77;

      if ((v29 & 1) != 0)
      {
        v30 = -[BRCLazyPackage initWithRegistry:stageID:name:boundaryKey:]([BRCLazyPackage alloc], "initWithRegistry:stageID:name:boundaryKey:", self->_stageRegistry, v14, CFSTR("ckpackage-xattrs"), v20);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v86 = 0;
        v31 = (void *)objc_opt_new();
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke;
        v67[3] = &unk_24FE41870;
        v68 = v66;
        v53 = v20;
        v69 = v53;
        v70 = self;
        v32 = v63;
        v71 = v32;
        v76 = buf;
        v55 = v31;
        v72 = v55;
        v56 = v30;
        v73 = v56;
        v54 = v23;
        v74 = v54;
        v33 = v18;
        v75 = v33;
        objc_msgSend(v32, "performTransactionBlock:", v67);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          brc_bread_crumbs();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
          {
            *(_DWORD *)v79 = 138412802;
            v80 = (uint64_t)v32;
            v81 = 2112;
            v82 = (uint64_t)v28;
            v83 = 2112;
            v84 = v61;
            _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] Fail to performTransactionBlock for package [%@] with error [%@]%@", v79, 0x20u);
          }

          if (a8)
          {
            v35 = objc_retainAutorelease(v28);
LABEL_40:
            v27 = 0;
            *a8 = v35;
LABEL_42:

            _Block_object_dispose(buf, 8);
            goto LABEL_43;
          }
        }
        else
        {
          objc_msgSend(v32, "close");
          if (-[BRCPackageManifestWriter done](v54, "done"))
          {
            -[BRCLazyPackage closeAndReturn](v56, "closeAndReturn");
            v42 = objc_claimAutoreleasedReturnValue();
            if (v42)
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v42, CFSTR("pkgXattrs"));
            v58 = (id)v42;
            objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v33, v53, v53);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("pkgContent"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v43, CFSTR("pkgManifest"));
            objc_msgSend(v55, "signature");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, CFSTR("pkgSignature"));

            if (a6)
              *a6 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
            v27 = v17;

            goto LABEL_42;
          }
          brc_bread_crumbs();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
          {
            objc_msgSend(v33, "path");
            v48 = objc_claimAutoreleasedReturnValue();
            -[BRCPackageManifestWriter error](v54, "error");
            v49 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v79 = 138412802;
            v59 = (id)v48;
            v80 = v48;
            v81 = 2112;
            v82 = v49;
            v83 = 2112;
            v84 = v62;
            v50 = (void *)v49;
            _os_log_error_impl(&dword_230455000, v46, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", v79, 0x20u);

          }
          if (a8)
          {
            -[BRCPackageManifestWriter error](v54, "error");
            v35 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_40;
          }
        }
        v27 = 0;
        goto LABEL_42;
      }
      brc_bread_crumbs();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v65, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        v86 = v57;
        v87 = 2112;
        v88 = v39;
        _os_log_impl(&dword_230455000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);

      }
      if (!a8)
      {
        v27 = 0;
        v28 = v57;
        goto LABEL_43;
      }
      v38 = objc_retainAutorelease(v57);
    }
    else
    {
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
        -[BRCUploadCKRecordProvider _createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:].cold.1();

      if (!a8)
      {
        v27 = 0;
        goto LABEL_43;
      }
      v38 = objc_retainAutorelease(v28);
    }
    v28 = v38;
    v27 = 0;
    *a8 = v38;
LABEL_43:

    goto LABEL_44;
  }
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
  {
    objc_msgSend(v18, "path");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPackageManifestWriter error](v23, "error");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v45;
    *(_WORD *)&buf[22] = 2112;
    v86 = v25;
    _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

  }
  if (a8)
  {
    -[BRCPackageManifestWriter error](v23, "error");
    v27 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_44:

  return v27;
}

id __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke(uint64_t a1)
{
  BRCFSPackageEnumerator *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id v6;
  BRFieldPkgItem *v7;
  id *v8;
  void *v9;
  BRFieldPkgItem *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, _BYTE *);
  void *v16;
  uint64_t v17;
  id v18;
  BRFieldPkgItem *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7;
  v33 = __Block_byref_object_dispose__7;
  v34 = 0;
  v2 = [BRCFSPackageEnumerator alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (id *)(v30 + 5);
  obj = (id)v30[5];
  v6 = -[BRCFSPackageEnumerator initForURL:boundaryKey:error:](v2, "initForURL:boundaryKey:error:", v3, v4, &obj);
  objc_storeStrong(v5, obj);
  if (v6)
  {
    v7 = objc_alloc_init(BRFieldPkgItem);
    v8 = (id *)(v30 + 5);
    v27 = (id)v30[5];
    v13 = MEMORY[0x24BDAC760];
    v15 = __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16;
    v16 = &unk_24FE41848;
    v9 = *(void **)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 48);
    v24 = v35;
    v14 = 3221225472;
    v18 = v9;
    v25 = &v29;
    v26 = *(_QWORD *)(a1 + 96);
    v10 = v7;
    v19 = v10;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 72);
    v22 = *(id *)(a1 + 80);
    v23 = *(id *)(a1 + 88);
    objc_msgSend(v6, "enumeratePackageItemsWithSortOrder:error:usingBlock:", 2, &v27, &v13);
    objc_storeStrong(v8, v27);
    objc_msgSend(*(id *)(a1 + 64), "done", v13, v14, v15, v16, v17);
    v11 = (id)v30[5];

  }
  else
  {
    v11 = (id)v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
  return v11;
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  _BYTE *v50;
  id v51;
  id v52;
  id obj;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "isFile"))
  {
    v9 = objc_alloc(MEMORY[0x24BDB91A0]);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "fileID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fsGenerationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithDeviceID:fileID:generationID:", v10, v11, v13);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_msgSend(v14, "setPackageIndex:");
    objc_msgSend(v7, "pathInPackage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "br_pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setItemTypeHint:", v17);

    if ((objc_msgSend(*(id *)(a1 + 40), "addItem:", v14) & 1) == 0)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
        __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16_cold_2((uint64_t)v34, v35);

      objc_msgSend(MEMORY[0x24BDB9120], "errorWithCode:format:", 1000, CFSTR("Failed to add item to package"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "CKClientSuitableError");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

      goto LABEL_29;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += objc_msgSend(v7, "size");
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "updateWithPkgItem:", v7);
  v19 = *(_QWORD *)(a1 + 48);
  v18 = *(void **)(a1 + 56);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  obj = *(id *)(v20 + 40);
  v21 = objc_msgSend(v18, "addItem:error:", v19, &obj);
  objc_storeStrong((id *)(v20 + 40), obj);
  if ((v21 & 1) == 0)
  {
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16_cold_1(v8, (uint64_t)v32, v33);

    goto LABEL_30;
  }
  objc_msgSend(v7, "xattrSignature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v7, "xattrSignature");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "urlForXattrSignature:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0;
    LOBYTE(v24) = objc_msgSend(v25, "checkResourceIsReachableAndReturnError:", &v52);
    v26 = v52;
    if ((v24 & 1) != 0)
    {
      v50 = a4;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91A0]), "initWithFileURL:", v25);
      v28 = objc_msgSend(*(id *)(a1 + 64), "itemCount");
      objc_msgSend(v14, "setPackageIndex:", v28);
      v29 = *(void **)(a1 + 64);
      v51 = v26;
      v30 = objc_msgSend(v29, "addItem:error:", v27, &v51);
      v31 = v51;

      if ((v30 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "setXattrIndex:", v28);
      }
      else
      {
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v55 = v31;
          v56 = 2112;
          v57 = v41;
          _os_log_impl(&dword_230455000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to add xattrs to xattrs package: %@%@", buf, 0x16u);
        }

      }
      v26 = v31;
      a4 = v50;
    }
    else
    {
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "xattrSignature");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v55 = v49;
        v56 = 2112;
        v57 = v26;
        v58 = 2112;
        v59 = v27;
        _os_log_fault_impl(&dword_230455000, v40, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We're missing a package xattr for signature %@ - %@%@", buf, 0x20u);

      }
    }

  }
  if ((objc_msgSend(*(id *)(a1 + 72), "addItem:", *(_QWORD *)(a1 + 48), v50) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 72), "error");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v45 = *(void **)(v44 + 40);
    *(_QWORD *)(v44 + 40) = v43;

    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(a1 + 80), "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v55 = v47;
      v56 = 2112;
      v57 = v48;
      v58 = 2112;
      v59 = v36;
      _os_log_error_impl(&dword_230455000, v46, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

    }
LABEL_29:

LABEL_30:
    *a4 = 1;
    goto LABEL_31;
  }
  objc_msgSend(*(id *)(a1 + 48), "clear");
LABEL_31:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
}

- (void)createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No xattr url found for signature %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

- (void)_createFileRecordForURL:(void *)a1 item:fileSize:boundaryKey:error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v3, v4, "[DEBUG] Creating CK record for URL: %@%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_createPackageRecordForURL:item:stageID:fileSize:boundaryKey:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0(&dword_230455000, v0, (uint64_t)v0, "[ERROR] Failed to create package: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_createPackageRecordForURL:(uint64_t)a1 item:(NSObject *)a2 stageID:fileSize:boundaryKey:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !document.isFinderBookmark%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)_createPackageRecordForURL:(void *)a1 item:stageID:fileSize:boundaryKey:error:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_230455000, v3, v4, "[DEBUG] Creating CK record for URL: %@%@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_obfuscatedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_0(&dword_230455000, a3, v6, "[ERROR] Couldn't add item for checksumming at %@%@", v7);

  OUTLINED_FUNCTION_6();
}

void __96__BRCUploadCKRecordProvider__createPackageRecordForURL_item_stageID_fileSize_boundaryKey_error___block_invoke_16_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230455000, a2, (os_log_type_t)0x90u, "[ERROR] Failed to add item to package%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
