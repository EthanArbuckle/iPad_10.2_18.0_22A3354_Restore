@implementation SEMIndexSite

+ (id)_indexSiteAtRootDirectoryURL:(id)a3 userId:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  void *userId_userIdHash_error;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  char isEqual;
  const char *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  _QWORD v40[2];

  v7 = a5;
  v40[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a3;
  sub_2462ECD30((uint64_t)v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462ED054((uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc((Class)objc_opt_class());
  userId_userIdHash_error = (void *)objc_msgSend_initWithIndexSiteURL_readOnly_create_userId_userIdHash_error_(v15, v16, (uint64_t)v14, v7, v7 ^ 1, v10, v13, a6);
  v20 = userId_userIdHash_error;
  if (!userId_userIdHash_error)
  {
LABEL_12:
    v26 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    objc_msgSend_userId(userId_userIdHash_error, v18, v19);
    a1 = (id)objc_claimAutoreleasedReturnValue();
    if (!a1)
      goto LABEL_6;
  }
  objc_msgSend_userId(v20, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v10, v22, (uint64_t)v21);

  if (!v10)
  {

    if ((isEqual & 1) != 0)
      goto LABEL_6;
    goto LABEL_8;
  }
  if ((isEqual & 1) == 0)
  {
LABEL_8:
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0B88];
    v39 = *MEMORY[0x24BDD0FC8];
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_indexSiteURL(v20, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v29, v31, (uint64_t)CFSTR("Index Site: %@ does not match userId: \"%@\" at indexSiteURL: %@"), v20, v10, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v32;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v33, (uint64_t)v40, &v39, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v35, v28, -1000, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a6 && v36)
      *a6 = objc_retainAutorelease(v36);

    goto LABEL_12;
  }
LABEL_6:
  v26 = v20;
LABEL_13:

  return v26;
}

+ (id)_existingIndexSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  void *userId_userIdHash_error;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  char isEqual;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v40;
  _QWORD v41[2];

  v6 = a4;
  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  sub_2462ECED0(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)objc_opt_class());
  userId_userIdHash_error = (void *)objc_msgSend_initWithIndexSiteURL_readOnly_create_userId_userIdHash_error_(v10, v11, (uint64_t)v8, v6, 0, 0, v9, a5);

  if (userId_userIdHash_error)
  {
    if (!v9)
    {
      objc_msgSend_userId(userId_userIdHash_error, v13, v14);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      sub_2462ECD30((uint64_t)a1, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {

        goto LABEL_15;
      }
      v8 = (id)v16;
    }
    objc_msgSend_userId(userId_userIdHash_error, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462ECD30((uint64_t)v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v9, v20, (uint64_t)v19);

    if (v9)
    {
      if ((isEqual & 1) != 0)
        goto LABEL_15;
      goto LABEL_9;
    }

    if ((isEqual & 1) == 0)
    {
LABEL_9:
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0B88];
      v40 = *MEMORY[0x24BDD0FC8];
      v26 = (void *)MEMORY[0x24BDD17C8];
      sub_2462ECD80(v9, v22, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexSiteURL(userId_userIdHash_error, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v26, v31, (uint64_t)CFSTR("Index Site: %@ does not match userIdHash: %@ at indexSiteURL: %@"), userId_userIdHash_error, v27, v30, v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v32;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v33, (uint64_t)v41, &v40, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v35, v25, -1000, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (a5 && v36)
        *a5 = objc_retainAutorelease(v36);

      goto LABEL_13;
    }
LABEL_15:
    v38 = userId_userIdHash_error;
    goto LABEL_16;
  }
LABEL_13:
  v38 = 0;
LABEL_16:

  return v38;
}

- (SEMIndexSite)initWithIndexSiteURL:(id)a3 readOnly:(BOOL)a4 create:(BOOL)a5 userId:(id)a6 userIdHash:(id)a7 error:(id *)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  SEMIndexSite *v18;
  SEMIndexSite *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  SEMDictionaryLog *v23;
  const char *v24;
  uint64_t error;
  SEMDictionaryLog *log;
  const char *v27;
  SEMDictionaryLog *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *description;
  const char *v34;
  uint64_t v35;
  NSURL *skitDirectoryURL;
  const char *v37;
  uint64_t v38;
  NSURL *ftsDirectoryURL;
  const char *v40;
  uint64_t v41;
  NSURL *ftsDatabaseURL;
  SEMIndexSite *v43;
  objc_super v45;

  v11 = a5;
  v12 = a4;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v45.receiver = self;
  v45.super_class = (Class)SEMIndexSite;
  v18 = -[SEMIndexSite init](&v45, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_indexSiteURL, a3);
    v19->_dataProtectionClass = sub_2462ED00C(v19->_indexSiteURL, v20, v21);
    if (v11)
    {
      sub_2462ED484(v19->_indexSiteURL, a8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_10;
    }
    v23 = [SEMDictionaryLog alloc];
    error = objc_msgSend_initWithFilename_protectionClass_directory_readOnly_create_error_(v23, v24, (uint64_t)CFSTR("Site"), v19->_dataProtectionClass, v19->_indexSiteURL, v12, v11, a8);
    log = v19->_log;
    v19->_log = (SEMDictionaryLog *)error;

    v28 = v19->_log;
    if (!v28
      || v16
      && v11
      && !objc_msgSend_writeUpdatedObject_forKey_error_(v28, v27, (uint64_t)v16, CFSTR("userId"), a8))
    {
LABEL_10:
      v43 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v19->_userIdHash, a7);
    objc_msgSend_userId(v19, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462ECDC8(v31, v19->_userIdHash);
    v32 = objc_claimAutoreleasedReturnValue();
    description = v19->_description;
    v19->_description = (NSString *)v32;

    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v34, (uint64_t)CFSTR("SKIT"), 1, v19->_indexSiteURL);
    v35 = objc_claimAutoreleasedReturnValue();
    skitDirectoryURL = v19->_skitDirectoryURL;
    v19->_skitDirectoryURL = (NSURL *)v35;

    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v37, (uint64_t)CFSTR("FTS"), 1, v19->_indexSiteURL);
    v38 = objc_claimAutoreleasedReturnValue();
    ftsDirectoryURL = v19->_ftsDirectoryURL;
    v19->_ftsDirectoryURL = (NSURL *)v38;

    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v40, (uint64_t)CFSTR("SEM_FTS"), 1, v19->_indexSiteURL);
    v41 = objc_claimAutoreleasedReturnValue();
    ftsDatabaseURL = v19->_ftsDatabaseURL;
    v19->_ftsDatabaseURL = (NSURL *)v41;

  }
  v43 = v19;
LABEL_11:

  return v43;
}

- (SEMIndexSite)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  return self->_description;
}

- (NSString)userId
{
  return (NSString *)objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)CFSTR("userId"));
}

- (NSDate)lastMaintenance
{
  return (NSDate *)objc_msgSend_objectForKey_(self->_log, a2, (uint64_t)CFSTR("lastMaintenance"));
}

- (BOOL)recordMaintenance:(id *)a3
{
  id *v3;
  SEMDictionaryLog *log;
  void *v5;
  const char *v6;

  v3 = a3;
  log = self->_log;
  objc_msgSend_now(MEMORY[0x24BDBCE60], a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_writeUpdatedObject_forKey_error_(log, v6, (uint64_t)v5, CFSTR("lastMaintenance"), v3);

  return (char)v3;
}

- (BOOL)remove:(id *)a3
{
  return sub_2462ED544(self->_indexSiteURL, a3);
}

- (BOOL)isEqual:(id)a3
{
  SEMIndexSite *v4;
  SEMIndexSite *v5;
  const char *v6;
  char isEqualToIndexSite;

  v4 = (SEMIndexSite *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToIndexSite = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToIndexSite = objc_msgSend_isEqualToIndexSite_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToIndexSite = 0;
  }

  return isEqualToIndexSite;
}

- (BOOL)isEqualToIndexSite:(id)a3
{
  void *v4;
  const char *v5;

  objc_msgSend_indexSiteURL(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_isEquivalentIndexSiteURL_(self, v5, (uint64_t)v4);

  return (char)self;
}

- (BOOL)isEquivalentIndexSiteURL:(id)a3
{
  NSURL *indexSiteURL;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  indexSiteURL = self->_indexSiteURL;
  v4 = a3;
  objc_msgSend_path(indexSiteURL, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);
  return (char)v4;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_hash(self->_indexSiteURL, a2, v2);
}

- (NSURL)indexSiteURL
{
  return self->_indexSiteURL;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSURL)skitDirectoryURL
{
  return self->_skitDirectoryURL;
}

- (NSURL)ftsDirectoryURL
{
  return self->_ftsDirectoryURL;
}

- (NSURL)ftsDatabaseURL
{
  return self->_ftsDatabaseURL;
}

- (NSNumber)userIdHash
{
  return self->_userIdHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdHash, 0);
  objc_storeStrong((id *)&self->_ftsDatabaseURL, 0);
  objc_storeStrong((id *)&self->_ftsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_skitDirectoryURL, 0);
  objc_storeStrong((id *)&self->_indexSiteURL, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
