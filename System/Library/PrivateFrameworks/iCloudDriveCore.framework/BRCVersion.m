@implementation BRCVersion

- (BOOL)_hasLastEditorDeviceRowID
{
  NSNumber *lastEditorDeviceOrUserRowID;

  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  return !lastEditorDeviceOrUserRowID || -[NSNumber longLongValue](lastEditorDeviceOrUserRowID, "longLongValue") >= 0;
}

- (BOOL)_hasLastEditorRowID
{
  return !-[BRCVersion _hasLastEditorDeviceRowID](self, "_hasLastEditorDeviceRowID");
}

- (void)setLastEditorDeviceRowID:(id)a3
{
  NSNumber *v4;
  NSNumber *lastEditorDeviceOrUserRowID;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v4 = (NSNumber *)a3;
  if (-[BRCVersion _hasLastEditorRowID](self, "_hasLastEditorRowID"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCVersion setLastEditorDeviceRowID:].cold.2();

    if (v4)
    {
LABEL_3:
      if (-[NSNumber longLongValue](v4, "longLongValue") > 0)
        goto LABEL_4;
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    -[BRCVersion setLastEditorDeviceRowID:].cold.1();

LABEL_4:
  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  self->_lastEditorDeviceOrUserRowID = v4;

}

- (void)setLastEditorRowID:(id)a3
{
  id v4;
  uint64_t v5;
  NSNumber *v6;
  NSNumber *lastEditorDeviceOrUserRowID;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (self->_lastEditorDeviceOrUserRowID && -[BRCVersion _hasLastEditorDeviceRowID](self, "_hasLastEditorDeviceRowID"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCVersion setLastEditorRowID:].cold.1();

  }
  v5 = objc_msgSend(v4, "longLongValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -v5);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastEditorDeviceOrUserRowID = self->_lastEditorDeviceOrUserRowID;
  self->_lastEditorDeviceOrUserRowID = v6;

}

- (NSNumber)lastEditorDeviceRowID
{
  NSNumber *v3;

  if (-[BRCVersion _hasLastEditorDeviceRowID](self, "_hasLastEditorDeviceRowID"))
    v3 = self->_lastEditorDeviceOrUserRowID;
  else
    v3 = 0;
  return v3;
}

- (BRCUserRowID)lastEditorRowID
{
  void *v3;

  if (-[BRCVersion _hasLastEditorRowID](self, "_hasLastEditorRowID"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", --[NSNumber longLongValue](self->_lastEditorDeviceOrUserRowID, "longLongValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (BRCUserRowID *)v3;
}

- (id)lastEditorDeviceDisplayNameWithDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *lastEditorDeviceName;
  NSString *v8;
  NSString *v9;

  v4 = a3;
  -[BRCVersion lastEditorDeviceRowID](self, "lastEditorDeviceRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    lastEditorDeviceName = self->_lastEditorDeviceName;
    if (lastEditorDeviceName)
      v8 = lastEditorDeviceName;
    else
      v8 = (NSString *)objc_msgSend(v4, "stringWithSQL:", CFSTR("SELECT name FROM devices WHERE key = %lld"), objc_msgSend(v5, "longLongValue"));
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastEditorUserIdentityWithDB:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCVersion lastEditorRowID](self, "lastEditorRowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[BRCAccountSessionFPFS userIdentityForKey:db:](BRCAccountSessionFPFS, "userIdentityForKey:db:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)lastEditorDisplayNameWithDB:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[BRCVersion lastEditorUserIdentityWithDB:](self, "lastEditorUserIdentityWithDB:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_formattedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displayNameWithoutExtension:(BOOL)a3
{
  return (id)-[NSString br_displayFilenameWithExtensionHidden:](self->_originalPOSIXName, "br_displayFilenameWithExtensionHidden:", a3);
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  BRFieldCKInfo *ckInfo;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *originalPOSIXName;
  void *v17;
  NSData *contentSignature;
  __CFString *v19;
  void *v20;
  NSData *thumbnailSignature;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSNumber *editedSinceShared;
  uint64_t v27;
  void *v28;
  void *v29;
  NSData *xattrSignature;
  void *v31;
  NSData *quarantineInfo;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 64);
  ckInfo = self->_ckInfo;
  if (ckInfo)
  {
    -[BRFieldCKInfo etag](ckInfo, "etag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("etag:%@ "), v7);

    -[BRFieldCKInfo etagBeforeCrossZoneMove](self->_ckInfo, "etagBeforeCrossZoneMove");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[BRFieldCKInfo etagBeforeCrossZoneMove](self->_ckInfo, "etagBeforeCrossZoneMove");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("prev-etag:%@ "), v9);

    }
    if (-[BRFieldCKInfo hasDeletionChangeToken](self->_ckInfo, "hasDeletionChangeToken"))
    {
      v10 = objc_alloc(MEMORY[0x24BDB9228]);
      -[BRFieldCKInfo deletionChangeToken](self->_ckInfo, "deletionChangeToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithData:", v11);

      objc_msgSend(v12, "descriptionWithContext:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("deletion-token:%@ "), v13);

    }
  }
  objc_msgSend(v5, "appendFormat:", CFSTR("mt:%lld "), self->_mtime);
  +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", self->_size, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("sz:%@ "), v14);

  if (self->_thumbnailSize >= 1)
  {
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("tsz:%@ "), v15);

  }
  originalPOSIXName = self->_originalPOSIXName;
  if (originalPOSIXName)
  {
    -[NSString fp_obfuscatedFilename](originalPOSIXName, "fp_obfuscatedFilename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("n:\"%@\" "), v17);

  }
  contentSignature = self->_contentSignature;
  if (contentSignature)
  {
    if (-[NSData brc_signatureIsPendingPlaceHolder](contentSignature, "brc_signatureIsPendingPlaceHolder"))
    {
      if (-[BRCVersion isPackage](self, "isPackage"))
        v19 = CFSTR("<pkg-pending>");
      else
        v19 = CFSTR("<file-pending>");
    }
    else
    {
      -[NSData brc_hexadecimalString](self->_contentSignature, "brc_hexadecimalString");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v19, 2, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("sig:%@ "), v20);

  }
  thumbnailSignature = self->_thumbnailSignature;
  if (thumbnailSignature)
  {
    if (-[NSData brc_signatureIsPendingPlaceHolder](thumbnailSignature, "brc_signatureIsPendingPlaceHolder"))
    {
      v22 = CFSTR("<pending>");
    }
    else
    {
      -[NSData brc_hexadecimalString](self->_thumbnailSignature, "brc_hexadecimalString");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v22, 2, v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("tsig:%@ "), v23);

  }
  if (-[NSSet count](self->_conflictLoserEtags, "count"))
  {
    -[NSSet allObjects](self->_conflictLoserEtags, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("losers:{%@} "), v25);

  }
  editedSinceShared = self->_editedSinceShared;
  if (editedSinceShared)
    objc_msgSend(v5, "appendFormat:", CFSTR("ess:%ld "), -[NSNumber integerValue](editedSinceShared, "integerValue"));
  if (-[BRCVersion _hasLastEditorDeviceRowID](self, "_hasLastEditorDeviceRowID"))
  {
    -[BRCVersion lastEditorDeviceRowID](self, "lastEditorDeviceRowID");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = &unk_24FEB3278;
    if (v27)
      v29 = (void *)v27;
    objc_msgSend(v5, "appendFormat:", CFSTR("device:%@ "), v29);
  }
  else
  {
    if (!-[BRCVersion _hasLastEditorRowID](self, "_hasLastEditorRowID"))
      goto LABEL_33;
    -[BRCVersion lastEditorRowID](self, "lastEditorRowID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("last-editor:%@ "), v28);
  }

LABEL_33:
  xattrSignature = self->_xattrSignature;
  if (xattrSignature)
  {
    -[NSData brc_hexadecimalString](xattrSignature, "brc_hexadecimalString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("ea:%@ "), v31);

  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo)
    objc_msgSend(v5, "appendFormat:", CFSTR("quarantine:%u "), -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);

  return v5;
}

- (id)description
{
  return -[BRCVersion descriptionWithContext:](self, "descriptionWithContext:", 0);
}

- (id)initFromResultSet:(id)a3 pos:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  BRCVersion *v8;
  uint64_t v9;
  BRFieldCKInfo *ckInfo;
  uint64_t v11;
  NSData *thumbnailSignature;
  uint64_t v13;
  NSData *contentSignature;
  uint64_t v15;
  NSData *xattrSignature;
  uint64_t v17;
  NSNumber *editedSinceShared;
  uint64_t v19;
  NSNumber *lastEditorDeviceOrUserRowID;
  id v21;
  uint64_t v22;
  NSSet *conflictLoserEtags;
  uint64_t v24;
  NSData *quarantineInfo;
  BRCVersion *v26;
  objc_super v28;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "stringAtIndex:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v28.receiver = self;
    v28.super_class = (Class)BRCVersion;
    v8 = -[BRCVersion init](&v28, sel_init);
    if (v8)
    {
      objc_msgSend(v6, "objectOfClass:atIndex:", objc_opt_class(), (v4 + 1));
      v9 = objc_claimAutoreleasedReturnValue();
      ckInfo = v8->_ckInfo;
      v8->_ckInfo = (BRFieldCKInfo *)v9;

      v8->_mtime = objc_msgSend(v6, "longLongAtIndex:", (v4 + 2));
      objc_storeStrong((id *)&v8->_originalPOSIXName, v7);
      v8->_size = objc_msgSend(v6, "longLongAtIndex:", (v4 + 3));
      v8->_thumbnailSize = objc_msgSend(v6, "longLongAtIndex:", (v4 + 4));
      objc_msgSend(v6, "dataAtIndex:", (v4 + 5));
      v11 = objc_claimAutoreleasedReturnValue();
      thumbnailSignature = v8->_thumbnailSignature;
      v8->_thumbnailSignature = (NSData *)v11;

      objc_msgSend(v6, "dataAtIndex:", (v4 + 6));
      v13 = objc_claimAutoreleasedReturnValue();
      contentSignature = v8->_contentSignature;
      v8->_contentSignature = (NSData *)v13;

      objc_msgSend(v6, "dataAtIndex:", (v4 + 7));
      v15 = objc_claimAutoreleasedReturnValue();
      xattrSignature = v8->_xattrSignature;
      v8->_xattrSignature = (NSData *)v15;

      objc_msgSend(v6, "numberAtIndex:", (v4 + 8));
      v17 = objc_claimAutoreleasedReturnValue();
      editedSinceShared = v8->_editedSinceShared;
      v8->_editedSinceShared = (NSNumber *)v17;

      objc_msgSend(v6, "numberAtIndex:", (v4 + 9));
      v19 = objc_claimAutoreleasedReturnValue();
      lastEditorDeviceOrUserRowID = v8->_lastEditorDeviceOrUserRowID;
      v8->_lastEditorDeviceOrUserRowID = (NSNumber *)v19;

      if (_BRCClassesConflictLoserEtags_once != -1)
        dispatch_once(&_BRCClassesConflictLoserEtags_once, &__block_literal_global_10);
      v21 = (id)_BRCClassesConflictLoserEtags_allowedClasses;
      objc_msgSend(v6, "unarchivedObjectOfClasses:atIndex:", v21, (v4 + 10));
      v22 = objc_claimAutoreleasedReturnValue();
      conflictLoserEtags = v8->_conflictLoserEtags;
      v8->_conflictLoserEtags = (NSSet *)v22;

      objc_msgSend(v6, "dataAtIndex:", (v4 + 11));
      v24 = objc_claimAutoreleasedReturnValue();
      quarantineInfo = v8->_quarantineInfo;
      v8->_quarantineInfo = (NSData *)v24;

    }
    self = v8;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BRCVersion)initWithVersion:(id)a3
{
  id v4;
  BRCVersion *v5;
  uint64_t v6;
  BRFieldCKInfo *ckInfo;
  uint64_t v8;
  NSString *originalPOSIXName;
  uint64_t v10;
  NSData *thumbnailSignature;
  uint64_t v12;
  NSData *contentSignature;
  uint64_t v14;
  NSNumber *lastEditorDeviceOrUserRowID;
  uint64_t v16;
  NSString *lastEditorDeviceName;
  uint64_t v18;
  NSSet *conflictLoserEtags;
  uint64_t v20;
  NSData *xattrSignature;
  uint64_t v22;
  NSData *quarantineInfo;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BRCVersion;
  v5 = -[BRCVersion init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 1), "copy");
    ckInfo = v5->_ckInfo;
    v5->_ckInfo = (BRFieldCKInfo *)v6;

    v5->_mtime = *((_QWORD *)v4 + 2);
    v8 = objc_msgSend(*((id *)v4 + 3), "copy");
    originalPOSIXName = v5->_originalPOSIXName;
    v5->_originalPOSIXName = (NSString *)v8;

    v5->_size = *((_QWORD *)v4 + 4);
    v5->_thumbnailSize = *((_QWORD *)v4 + 5);
    v10 = objc_msgSend(*((id *)v4 + 6), "copy");
    thumbnailSignature = v5->_thumbnailSignature;
    v5->_thumbnailSignature = (NSData *)v10;

    v12 = objc_msgSend(*((id *)v4 + 7), "copy");
    contentSignature = v5->_contentSignature;
    v5->_contentSignature = (NSData *)v12;

    objc_storeStrong((id *)&v5->_editedSinceShared, *((id *)v4 + 12));
    v14 = objc_msgSend(*((id *)v4 + 13), "copy");
    lastEditorDeviceOrUserRowID = v5->_lastEditorDeviceOrUserRowID;
    v5->_lastEditorDeviceOrUserRowID = (NSNumber *)v14;

    v16 = objc_msgSend(*((id *)v4 + 14), "copy");
    lastEditorDeviceName = v5->_lastEditorDeviceName;
    v5->_lastEditorDeviceName = (NSString *)v16;

    v18 = objc_msgSend(*((id *)v4 + 11), "mutableCopy");
    conflictLoserEtags = v5->_conflictLoserEtags;
    v5->_conflictLoserEtags = (NSSet *)v18;

    v20 = objc_msgSend(*((id *)v4 + 8), "copy");
    xattrSignature = v5->_xattrSignature;
    v5->_xattrSignature = (NSData *)v20;

    v22 = objc_msgSend(*((id *)v4 + 10), "copy");
    quarantineInfo = v5->_quarantineInfo;
    v5->_quarantineInfo = (NSData *)v22;

  }
  return v5;
}

- (BOOL)isPackage
{
  NSData *contentSignature;
  void *v5;
  NSObject *v6;

  contentSignature = self->_contentSignature;
  if (!contentSignature)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCVersion isPackage].cold.1();

    contentSignature = self->_contentSignature;
  }
  return -[NSData brc_signatureIsPackage](contentSignature, "brc_signatureIsPackage");
}

- (BOOL)hasThumbnail
{
  return self->_thumbnailSignature != 0;
}

- (BOOL)check:(id)a3 logToFile:(__sFILE *)a4
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVersion:", self);
}

- (unint64_t)diffAgainst:(id)a3
{
  id v4;
  void *v5;
  BRFieldCKInfo *v6;
  BRFieldCKInfo *v7;
  BRFieldCKInfo *v8;
  _BOOL4 v9;
  void *v10;
  BRFieldCKInfo *v11;
  BRFieldCKInfo *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  char v19;
  unint64_t v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  void *v26;
  NSData *v27;
  NSData *v28;
  NSData *v29;
  char v30;
  void *v31;
  NSData *v32;
  NSData *v33;
  NSData *v34;
  char v35;
  void *v36;
  NSSet *v37;
  NSSet *v38;
  NSSet *v39;
  char v40;
  void *v41;
  NSData *v42;
  NSData *v43;
  NSData *v44;
  char v45;

  v4 = a3;
  v5 = (void *)*((_QWORD *)v4 + 1);
  v6 = self->_ckInfo;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v7)
      goto LABEL_10;
    v9 = -[BRFieldCKInfo isEqual:](v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_11;
  }
  v10 = (void *)*((_QWORD *)v4 + 13);
  v6 = self->_lastEditorDeviceOrUserRowID;
  v11 = v10;
  if (v6 != v11)
  {
    v12 = v11;
    if (v11)
    {
      v13 = -[BRFieldCKInfo isEqual:](v6, "isEqual:", v11);

      if (v13)
        goto LABEL_13;
LABEL_11:
      v14 = 0x10000;
      goto LABEL_14;
    }
LABEL_10:

    goto LABEL_11;
  }

LABEL_13:
  v14 = 0;
LABEL_14:
  v15 = (void *)*((_QWORD *)v4 + 12);
  v16 = self->_editedSinceShared;
  v17 = v15;
  if (v16 == v17)
  {

    goto LABEL_21;
  }
  v18 = v17;
  if (!v17)
  {

    goto LABEL_20;
  }
  v19 = -[NSNumber isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
LABEL_20:
    v14 |= 0x2000000uLL;
LABEL_21:
  if (self->_mtime == *((_QWORD *)v4 + 2))
    v20 = v14;
  else
    v20 = v14 | 0x20000;
  if ((v20 & 0x40000) == 0)
  {
    v21 = (void *)*((_QWORD *)v4 + 3);
    v22 = self->_originalPOSIXName;
    v23 = v21;
    if (v22 == v23)
    {

    }
    else
    {
      v24 = v23;
      if (!v23)
      {

        goto LABEL_46;
      }
      v25 = -[NSString isEqual:](v22, "isEqual:", v23);

      if ((v25 & 1) == 0)
      {
LABEL_46:
        v20 |= 0x40000uLL;
        if ((v20 & 0x80000) != 0)
          goto LABEL_33;
        goto LABEL_31;
      }
    }
  }
  if ((v20 & 0x80000) != 0)
    goto LABEL_33;
LABEL_31:
  if (self->_size != *((_QWORD *)v4 + 4))
    v20 |= 0x80000uLL;
LABEL_33:
  if ((v20 & 0x100000) != 0)
    goto LABEL_39;
  v26 = (void *)*((_QWORD *)v4 + 7);
  v27 = self->_contentSignature;
  v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_39;
  }
  v29 = v28;
  if (!v28)
  {

    goto LABEL_49;
  }
  v30 = -[NSData isEqual:](v27, "isEqual:", v28);

  if ((v30 & 1) != 0)
  {
LABEL_39:
    if ((v20 & 0x400000) != 0)
      goto LABEL_53;
LABEL_40:
    v31 = (void *)*((_QWORD *)v4 + 6);
    v32 = self->_thumbnailSignature;
    v33 = v31;
    if (v32 == v33)
    {

      goto LABEL_53;
    }
    v34 = v33;
    if (v33)
    {
      v35 = -[NSData isEqual:](v32, "isEqual:", v33);

      if ((v35 & 1) != 0)
        goto LABEL_53;
    }
    else
    {

    }
    v20 |= 0x400000uLL;
    goto LABEL_53;
  }
LABEL_49:
  v20 |= 0x100000uLL;
  if ((v20 & 0x400000) == 0)
    goto LABEL_40;
LABEL_53:
  if ((v20 & 0x800000) != 0)
    goto LABEL_59;
  v36 = (void *)*((_QWORD *)v4 + 11);
  v37 = self->_conflictLoserEtags;
  v38 = v36;
  if (v37 == v38)
  {

    goto LABEL_59;
  }
  v39 = v38;
  if (!v38)
  {

    goto LABEL_66;
  }
  v40 = -[NSSet isEqual:](v37, "isEqual:", v38);

  if ((v40 & 1) != 0)
  {
LABEL_59:
    if ((v20 & 0x200000) != 0)
      goto LABEL_70;
    goto LABEL_60;
  }
LABEL_66:
  v20 |= 0x800000uLL;
  if ((v20 & 0x200000) != 0)
    goto LABEL_70;
LABEL_60:
  v41 = (void *)*((_QWORD *)v4 + 8);
  v42 = self->_xattrSignature;
  v43 = v41;
  if (v42 == v43)
  {

  }
  else
  {
    v44 = v43;
    if (v43)
    {
      v45 = -[NSData isEqual:](v42, "isEqual:", v43);

      if ((v45 & 1) != 0)
        goto LABEL_70;
    }
    else
    {

    }
    v20 |= 0x200000uLL;
  }
LABEL_70:
  if ((v20 & 0x1000000) == 0 && !BRCQuarantineInfoIsEqual(self->_quarantineInfo, *((void **)v4 + 10)))
    v20 |= 0x1000000uLL;

  return v20;
}

- (BOOL)isEtagEqual:(id)a3
{
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  if (self == a3)
    return 1;
  objc_msgSend(a3, "ckInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasEtag");
  if (v5 == -[BRFieldCKInfo hasEtag](self->_ckInfo, "hasEtag"))
  {
    objc_msgSend(v4, "etag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldCKInfo etag](self->_ckInfo, "etag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)additionNameForItemID:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  -[NSString br_pathExtension](self->_originalPOSIXName, "br_pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v7, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("~"), 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v7, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB8E88]);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v7, "ownerName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(":%@"), v13);

  }
  v14 = objc_msgSend(v8, "length");
  objc_msgSend(v6, "itemIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldCKInfo etag](self->_ckInfo, "etag");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v14)
    objc_msgSend(v9, "appendFormat:", CFSTR("_%@_%@.%@"), v15, v16, v8);
  else
    objc_msgSend(v9, "appendFormat:", CFSTR("_%@_%@"), v15, v16, v19);

  return v9;
}

- (id)uti
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[BRCVersion originalPOSIXName](self, "originalPOSIXName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)*MEMORY[0x24BDC1748];
  if (objc_msgSend(v3, "length"))
  {
    +[BRCUTITypeCache defaultCache](BRCUTITypeCache, "defaultCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UTIForExtension:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v4;
    v9 = v8;

    v4 = v9;
  }

  return v4;
}

- (BOOL)isSmallAndMostRecentClientsGenerateThumbnails
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v14;
  void *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!-[BRCVersion size](self, "size"))
  {
    brc_bread_crumbs();
    v5 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCVersion isSmallAndMostRecentClientsGenerateThumbnails].cold.1();
    goto LABEL_7;
  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minFileSizeForThumbnailTransfer");

  if (-[BRCVersion size](self, "size") <= v4)
  {
    -[BRCVersion uti](self, "uti");
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(MEMORY[0x24BDE5F08], "canMostRecentClientsGenerateThumbnailsForUTI:", v5);
    if (v9)
    {
      brc_bread_crumbs();
      v6 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", -[BRCVersion size](self, "size"), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v11;
        v16 = 2112;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        v12 = "[DEBUG] Being greedy because the document is small %@ and QL can generate a thumbnail for %@%@";
LABEL_15:
        _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v6 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", -[BRCVersion size](self, "size"), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412802;
        v15 = v11;
        v16 = 2112;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        v12 = "[DEBUG] Not being greedy even though the document is small %@: QL can’t generate a thumbnail for %@%@";
        goto LABEL_15;
      }
    }

    goto LABEL_13;
  }
  brc_bread_crumbs();
  v5 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", -[BRCVersion size](self, "size"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v4, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Not being greedy because document is bigger %@ than minimum size (%@) to generate a thumbnail%@", (uint8_t *)&v14, 0x20u);

  }
LABEL_7:
  LOBYTE(v9) = 0;
LABEL_13:

  return v9;
}

- (id)lazyXattrWithStageRegistry:(id)a3
{
  id v4;
  void *v5;
  NSData *lazyXattr;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  NSData *v10;
  void *v11;
  NSObject *v12;
  NSData *xattrSignature;
  id v15;
  uint8_t buf[4];
  NSData *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_xattrSignature)
  {
    lazyXattr = self->_lazyXattr;
    if (lazyXattr)
    {
      v7 = lazyXattr;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v4, "loadXattrBlobForSignature:error:");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = self->_lazyXattr;
      self->_lazyXattr = v8;

      v10 = self->_lazyXattr;
      if (!v10)
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          xattrSignature = self->_xattrSignature;
          *(_DWORD *)buf = 138412802;
          v17 = xattrSignature;
          v18 = 2112;
          v19 = v15;
          v20 = 2112;
          v21 = v11;
          _os_log_fault_impl(&dword_230455000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to load xattr with signature %@ - %@%@", buf, 0x20u);
        }

        v10 = self->_lazyXattr;
      }
      v7 = v10;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void)setCkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_ckInfo, a3);
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (void)setMtime:(int64_t)a3
{
  self->_mtime = a3;
}

- (NSString)originalPOSIXName
{
  return self->_originalPOSIXName;
}

- (void)setOriginalPOSIXName:(id)a3
{
  objc_storeStrong((id *)&self->_originalPOSIXName, a3);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)thumbnailSize
{
  return self->_thumbnailSize;
}

- (void)setThumbnailSize:(int64_t)a3
{
  self->_thumbnailSize = a3;
}

- (NSData)thumbnailSignature
{
  return self->_thumbnailSignature;
}

- (void)setThumbnailSignature:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailSignature, a3);
}

- (NSData)contentSignature
{
  return self->_contentSignature;
}

- (void)setContentSignature:(id)a3
{
  objc_storeStrong((id *)&self->_contentSignature, a3);
}

- (NSSet)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLoserEtags, a3);
}

- (NSData)xattrSignature
{
  return self->_xattrSignature;
}

- (void)setXattrSignature:(id)a3
{
  objc_storeStrong((id *)&self->_xattrSignature, a3);
}

- (NSNumber)editedSinceShared
{
  return self->_editedSinceShared;
}

- (void)setEditedSinceShared:(id)a3
{
  objc_storeStrong((id *)&self->_editedSinceShared, a3);
}

- (NSNumber)lastEditorDeviceOrUserRowID
{
  return self->_lastEditorDeviceOrUserRowID;
}

- (void)setLastEditorDeviceOrUserRowID:(id)a3
{
  objc_storeStrong((id *)&self->_lastEditorDeviceOrUserRowID, a3);
}

- (NSString)lastEditorDeviceName
{
  return self->_lastEditorDeviceName;
}

- (void)setLastEditorDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_lastEditorDeviceName, a3);
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (void)setQuarantineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_quarantineInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEditorDeviceName, 0);
  objc_storeStrong((id *)&self->_lastEditorDeviceOrUserRowID, 0);
  objc_storeStrong((id *)&self->_editedSinceShared, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_lazyXattr, 0);
  objc_storeStrong((id *)&self->_xattrSignature, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
  objc_storeStrong((id *)&self->_thumbnailSignature, 0);
  objc_storeStrong((id *)&self->_originalPOSIXName, 0);
  objc_storeStrong((id *)&self->_ckInfo, 0);
}

- (void)setLastEditorDeviceRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: lastEditorDeviceRowID && lastEditorDeviceRowID.longLongValue > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setLastEditorDeviceRowID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![self _hasLastEditorRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setLastEditorRowID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !_lastEditorDeviceOrUserRowID || ![self _hasLastEditorDeviceRowID]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)isPackage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _contentSignature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)isSmallAndMostRecentClientsGenerateThumbnails
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Not being greedy because current version size is 0%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
