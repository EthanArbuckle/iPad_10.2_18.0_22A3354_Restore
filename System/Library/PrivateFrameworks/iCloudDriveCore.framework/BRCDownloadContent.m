@implementation BRCDownloadContent

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->super._progress, a3);
}

- (id)etagIfLoser
{
  if (self->_isLoser)
    return self->super._etag;
  else
    return 0;
}

- (int)kind
{
  return self->_kind;
}

- (BRCDownloadContent)initWithDocument:(id)a3 stageID:(id)a4 etagIfLoser:(id)a5 downloadKind:(int)a6
{
  id v10;
  NSString *v11;
  BRCDownloadContent *v12;
  uint64_t v13;
  BRCServerZone *zone;
  void *v15;
  NSString *etag;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v10 = a3;
  v11 = (NSString *)a5;
  v21.receiver = self;
  v21.super_class = (Class)BRCDownloadContent;
  v12 = -[BRCDownload initWithDocument:stageID:](&v21, sel_initWithDocument_stageID_, v10, a4);
  if (v12)
  {
    objc_msgSend(v10, "serverZone");
    v13 = objc_claimAutoreleasedReturnValue();
    zone = v12->_zone;
    v12->_zone = (BRCServerZone *)v13;

    objc_msgSend(v10, "currentVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12->super._totalSize = objc_msgSend(v15, "size");

    v12->_isFinderBookmark = objc_msgSend(v10, "isFinderBookmark");
    etag = v11;
    if (!v11)
      etag = v12->super._etag;
    objc_storeStrong((id *)&v12->super._etag, etag);
    v12->_isLoser = v11 != 0;
    v12->_kind = a6;
    objc_msgSend(v10, "currentVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "db");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastEditorUserIdentityWithDB:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v12->_isDocumentModifiedByOtherUser = 1;
  }

  return v12;
}

- (id)description
{
  const char *v2;

  if (self->_isLoser)
    v2 = "loser";
  else
    v2 = "current";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<dl-content[%lld] %@_%@ %s>"), self->super._throttleID, self->super._itemID, self->super._etag, v2);
}

- (BOOL)_stageWithDownloadStager:(id)a3 manifest:(id)a4 package:(id)a5 xattrsPackage:(id)a6 error:(id *)a7
{
  id v11;
  NSString *stageID;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BRCPackageManifestReader *v18;
  BRCPackageManifestWriter *v19;
  void *v20;
  BRCPackageManifestWriter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  const char *v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  stageID = self->super._stageID;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v15, "createURLForDownloadWithStageID:name:", stageID, CFSTR("item"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("brpackage-extended"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[BRCPackageManifestReader initWithAsset:]([BRCPackageManifestReader alloc], "initWithAsset:", v11);
  v19 = [BRCPackageManifestWriter alloc];
  -[BRCServerZone clientZone](self->_zone, "clientZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[BRCPackageManifestWriter initWithZone:stageID:url:](v19, "initWithZone:stageID:url:", v20, self->super._stageID, v17);

  -[BRCDownload recordID](self, "recordID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recordName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = self->_isDocumentModifiedByOtherUser;
  LOBYTE(self) = -[BRCPackageManifestWriter stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:](v21, "stagePackageWithReader:package:xattrsPackage:stageItemURL:livefd:recordName:isDocumentModifiedByOtherUser:", v18, v14, v13, v16, 0xFFFFFFFFLL, v23, v34);

  if ((self & 1) == 0)
  {
    -[BRCPackageManifestWriter error](v21, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v33 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[BRCDownloadContent _stageWithDownloadStager:manifest:package:xattrsPackage:error:]";
        v38 = 2080;
        if (!a7)
          v33 = "(ignored by caller)";
        v39 = v33;
        v40 = 2112;
        v41 = v24;
        v42 = 2112;
        v43 = v25;
        _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
      objc_storeStrong(a7, v24);

  }
  objc_msgSend(v11, "fileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeItemAtURL:error:", v29, 0);

  }
  -[BRCPackageManifestWriter error](v21, "error");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  return v31;
}

- (BOOL)_stageWithDownloadStager:(id)a3 error:(id *)a4
{
  id v6;
  CKRecord **p_record;
  __CFString **v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  BOOL v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  char isKindOfClass;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  const char *v44;
  char *v45;
  const char *v46;
  void *v47;
  NSObject *v48;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_record = &self->super._record;
  if (self->_isFinderBookmark)
    v8 = kBRRecordKeyFinderBookmarkContent;
  else
    v8 = kBRRecordKeyFileContent;
  -[CKRecord objectForKeyedSubscript:](self->super._record, "objectForKeyedSubscript:", *v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (id)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[BRCDownloadContent _stageWithDownloadStager:error:].cold.6();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: file content is not a CKAsset: %@"), *p_record);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        brc_bread_crumbs();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          v44 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          v53 = 2080;
          if (!a4)
            v44 = "(ignored by caller)";
          v54 = v44;
          v55 = 2112;
          v56 = v11;
          v57 = 2112;
          v58 = v27;
          _os_log_error_impl(&dword_230455000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        objc_storeStrong(a4, v11);
      goto LABEL_86;
    }
    objc_msgSend(v6, "createURLForDownloadWithStageID:name:", self->super._stageID, CFSTR("item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v10, "fileURL");
        v45 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v52 = v45;
        v53 = 2112;
        v54 = (const char *)v11;
        v55 = 2112;
        v56 = v14;
        _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: asset has a missing url (%@), or we can't compute the stage url %@%@", buf, 0x20u);

      }
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BE17430];
      objc_msgSend(v10, "fileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "br_errorWithDomain:code:description:", v17, 15, CFSTR("unreachable: asset has a missing url (%@), or we can't compute the stage url %@"), v18, v11);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_34;
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
        v53 = 2080;
        if (!a4)
          v19 = "(ignored by caller)";
        v54 = v19;
        v55 = 2112;
        v56 = v31;
        v57 = 2112;
        v58 = v29;
        _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v30 = objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v29, "br_forceMoveItemAtURL:toURL:error:", v30, v11, &v50);
      v31 = v50;
    }

LABEL_34:
    if (a4)
      objc_storeStrong(a4, v31);
LABEL_85:

LABEL_86:
    v24 = 0;
    goto LABEL_87;
  }
  if (!self->_isFinderBookmark)
  {
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgContent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CKRecord objectForKeyedSubscript:](*p_record, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      v32 = v10 == 0;
    else
      v32 = 1;
    if (v32)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        -[BRCDownloadContent _stageWithDownloadStager:error:].cold.4();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: unknown type for downloaded object %@"), *p_record);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_82;
      brc_bread_crumbs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
        goto LABEL_81;
      v38 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
      v53 = 2080;
      if (!a4)
        v38 = "(ignored by caller)";
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v24 = -[BRCDownloadContent _stageWithDownloadStager:manifest:package:xattrsPackage:error:](self, "_stageWithDownloadStager:manifest:package:xattrsPackage:error:", v6, v10, v11, v31, a4);

            goto LABEL_87;
          }
          brc_bread_crumbs();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            -[BRCDownloadContent _stageWithDownloadStager:error:].cold.1();

          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: xattrs package is not a CKAsset: %@"), *p_record);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
          {
LABEL_82:
            if (a4)
              objc_storeStrong(a4, v35);

            goto LABEL_85;
          }
          brc_bread_crumbs();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
          {
LABEL_81:

            goto LABEL_82;
          }
          v38 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          v53 = 2080;
          if (!a4)
            v38 = "(ignored by caller)";
        }
        else
        {
          brc_bread_crumbs();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            -[BRCDownloadContent _stageWithDownloadStager:error:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: package manifest is not a CKAsset: %@"), *p_record);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35)
            goto LABEL_82;
          brc_bread_crumbs();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
            goto LABEL_81;
          v38 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
          v53 = 2080;
          if (!a4)
            v38 = "(ignored by caller)";
        }
      }
      else
      {
        brc_bread_crumbs();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          -[BRCDownloadContent _stageWithDownloadStager:error:].cold.3();

        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: pkg content is not a CKPackage: %@"), *p_record);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_82;
        brc_bread_crumbs();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v37, (os_log_type_t)0x90u))
          goto LABEL_81;
        v38 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
        v53 = 2080;
        if (!a4)
          v38 = "(ignored by caller)";
      }
    }
    v54 = v38;
    v55 = 2112;
    v56 = v35;
    v57 = 2112;
    v58 = v36;
    _os_log_error_impl(&dword_230455000, v37, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_81;
  }
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    -[BRCDownloadContent _stageWithDownloadStager:error:].cold.5();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: finder bookmark without content: %@"), *p_record);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
    {
      v46 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v52 = "-[BRCDownloadContent _stageWithDownloadStager:error:]";
      v53 = 2080;
      if (!a4)
        v46 = "(ignored by caller)";
      v54 = v46;
      v55 = 2112;
      v56 = v10;
      v57 = 2112;
      v58 = v22;
      _os_log_error_impl(&dword_230455000, v23, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
  {
    v10 = v10;
    v24 = 0;
    v11 = *a4;
    *a4 = v10;
LABEL_87:

    goto LABEL_88;
  }
  v24 = 0;
LABEL_88:

  return v24;
}

- (BOOL)isLoser
{
  return self->_isLoser;
}

- (BOOL)isDocumentModifiedByOtherUser
{
  return self->_isDocumentModifiedByOtherUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)_stageWithDownloadStager:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: xattrs package is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_stageWithDownloadStager:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: package manifest is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_stageWithDownloadStager:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: pkg content is not a CKPackage: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_stageWithDownloadStager:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: unknown type for downloaded object %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_stageWithDownloadStager:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: finder bookmark without content: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_stageWithDownloadStager:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: file content is not a CKAsset: %@%@");
  OUTLINED_FUNCTION_0();
}

@end
