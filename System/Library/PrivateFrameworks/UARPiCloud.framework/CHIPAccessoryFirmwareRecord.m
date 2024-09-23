@implementation CHIPAccessoryFirmwareRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAccessoryFirmwareRecord)initWithCKRecord:(id)a3
{
  id v4;
  OS_os_log *v5;
  OS_os_log *log;
  CKRecord *v7;
  CKRecord *ckRecord;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *recordName;
  void *v13;
  NSString *v14;
  NSString *signature;
  void *v16;
  NSString *v17;
  NSString *verificationCertificateID;
  void *v19;
  NSString *v20;
  NSString *firmwareVersion;
  NSNumber *v22;
  NSNumber *firmwareVersionNumber;
  NSNumber *v24;
  NSNumber *minFirmwareVersionNumber;
  NSNumber *v26;
  NSNumber *maxFirmwareVersionNumber;
  void *v28;
  NSString *v29;
  NSString *firmwareURL;
  void *v31;
  NSString *v32;
  NSString *firmwareBinaryHash;
  void *v34;
  NSString *v35;
  NSString *firmwareFileSize;
  NSNumber *v37;
  NSNumber *hashAlgorithmType;
  NSNumber *v39;
  NSNumber *cdVersionNumber;
  NSString *v41;
  NSString *releaseNotesURL;
  void *v43;
  NSDate *v44;
  NSDate *releaseDate;
  NSString *v46;
  NSString *recordStatus;
  CHIPAccessoryFirmwareRecord *v48;
  objc_super v50;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v50.receiver = self;
  v50.super_class = (Class)CHIPAccessoryFirmwareRecord;
  self = -[CHIPAccessoryFirmwareRecord init](&v50, sel_init);
  if (!self)
    goto LABEL_14;
  v5 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
  log = self->_log;
  self->_log = v5;

  v7 = (CKRecord *)objc_msgSend(v4, "copy");
  ckRecord = self->_ckRecord;
  self->_ckRecord = v7;

  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSString *)objc_msgSend(v10, "copy");
  recordName = self->_recordName;
  self->_recordName = v11;

  objc_msgSend(v4, "objectForKey:", CFSTR("signatureV2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSString *)objc_msgSend(v13, "copy");
  signature = self->_signature;
  self->_signature = v14;

  if (!self->_signature)
    goto LABEL_14;
  objc_msgSend(v4, "objectForKey:", CFSTR("verificationCertificateKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSString *)objc_msgSend(v16, "copy");
  verificationCertificateID = self->_verificationCertificateID;
  self->_verificationCertificateID = v17;

  if (!self->_verificationCertificateID)
    goto LABEL_14;
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareVersionString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSString *)objc_msgSend(v19, "copy");
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v20;

  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareVersionNumber"));
  v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  firmwareVersionNumber = self->_firmwareVersionNumber;
  self->_firmwareVersionNumber = v22;

  if (!self->_firmwareVersionNumber)
    goto LABEL_14;
  objc_msgSend(v4, "objectForKey:", CFSTR("minFirmwareVersionNumber"));
  v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minFirmwareVersionNumber = self->_minFirmwareVersionNumber;
  self->_minFirmwareVersionNumber = v24;

  objc_msgSend(v4, "objectForKey:", CFSTR("maxFirmwareVersionNumber"));
  v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  maxFirmwareVersionNumber = self->_maxFirmwareVersionNumber;
  self->_maxFirmwareVersionNumber = v26;

  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareURL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSString *)objc_msgSend(v28, "copy");
  firmwareURL = self->_firmwareURL;
  self->_firmwareURL = v29;

  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareBinaryHash"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSString *)objc_msgSend(v31, "copy");
  firmwareBinaryHash = self->_firmwareBinaryHash;
  self->_firmwareBinaryHash = v32;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareBinaryHash)
      goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareFileSize"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSString *)objc_msgSend(v34, "copy");
  firmwareFileSize = self->_firmwareFileSize;
  self->_firmwareFileSize = v35;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareFileSize)
      goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("hashAlgorithmType"));
  v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hashAlgorithmType = self->_hashAlgorithmType;
  self->_hashAlgorithmType = v37;

  if (self->_firmwareURL)
  {
    if (!self->_hashAlgorithmType)
      goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("cdVersionNumber"));
  v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cdVersionNumber = self->_cdVersionNumber;
  self->_cdVersionNumber = v39;

  objc_msgSend(v4, "objectForKey:", CFSTR("releaseNotesURL"));
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  releaseNotesURL = self->_releaseNotesURL;
  self->_releaseNotesURL = v41;

  objc_msgSend(v4, "modificationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (NSDate *)objc_msgSend(v43, "copy");
  releaseDate = self->_releaseDate;
  self->_releaseDate = v44;

  objc_msgSend(v4, "objectForKey:", CFSTR("recordStatus"));
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  recordStatus = self->_recordStatus;
  self->_recordStatus = v46;

  if (self->_recordStatus)
  {
    -[CHIPAccessoryFirmwareRecord calculateDigestFromCKRecord:](self, "calculateDigestFromCKRecord:", v4);
    self = self;
    v48 = self;
  }
  else
  {
LABEL_14:
    v48 = 0;
  }

  return v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHIPAccessoryFirmwareRecord initWithCKRecord:]([CHIPAccessoryFirmwareRecord alloc], "initWithCKRecord:", self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_ckRecord, CFSTR("record"));
}

- (CHIPAccessoryFirmwareRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CHIPAccessoryFirmwareRecord *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CHIPAccessoryFirmwareRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (void)calculateDigestFromCKRecord:(id)a3
{
  id v4;
  NSData *digest;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  CC_LONG v16;
  uint64_t v17;
  id v18;
  id v19;
  NSData *v20;
  NSData *v21;
  CHIPAccessoryFirmwareRecord *v22;
  unint64_t data;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CC_SHA256_CTX c;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  digest = self->_digest;
  self->_digest = 0;

  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    for (i = *(_QWORD *)v25; ; i = *(_QWORD *)v25)
    {
      if (i != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("firmwareVersionNumber")) & 1) != 0
        || (objc_msgSend(v14, "isEqualToString:", CFSTR("minFirmwareVersionNumber")) & 1) != 0
        || objc_msgSend(v14, "isEqualToString:", CFSTR("maxFirmwareVersionNumber")))
      {
        break;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("hashAlgorithmType")))
      {
        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        data = 0;
        data = bswap64(objc_msgSend(v15, "unsignedLongLongValue"));
        v16 = 8;
        goto LABEL_9;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("cdVersionNumber")))
      {
        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(data) = 0;
        LOWORD(data) = __rev16(objc_msgSend(v15, "unsignedShortValue"));
        v16 = 2;
        goto LABEL_9;
      }
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("verificationCertificateKey")) & 1) == 0
        && (objc_msgSend(v14, "isEqualToString:", CFSTR("signature")) & 1) == 0
        && (objc_msgSend(v14, "isEqualToString:", CFSTR("signatureV2")) & 1) == 0)
      {
        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dataUsingEncoding:", 4);
        v22 = self;
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CC_SHA256_Update(&c, (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

        self = v22;
        goto LABEL_10;
      }
LABEL_11:
      if (++v11 >= v10)
      {
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (!v17)
          goto LABEL_23;
        v10 = v17;
        v11 = 0;
      }
    }
    objc_msgSend(v4, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(data) = 0;
    LODWORD(data) = bswap32(objc_msgSend(v15, "unsignedIntValue"));
    v16 = 4;
LABEL_9:
    CC_SHA256_Update(&c, &data, v16);
LABEL_10:

    goto LABEL_11;
  }
LABEL_23:

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v19, "mutableBytes"), &c);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v19);
  v20 = (NSData *)objc_claimAutoreleasedReturnValue();
  v21 = self->_digest;
  self->_digest = v20;

}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)firmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)minFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)maxFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)firmwareURL
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)firmwareBinaryHash
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)firmwareFileSize
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)releaseNotesURL
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)releaseNotesHash
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)hashAlgorithmType
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)cdVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSData)digest
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_verificationCertificateID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_ckRecord, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_recordStatus, 0);
  objc_storeStrong((id *)&self->_cdVersionNumber, 0);
  objc_storeStrong((id *)&self->_hashAlgorithmType, 0);
  objc_storeStrong((id *)&self->_releaseNotesHash, 0);
  objc_storeStrong((id *)&self->_releaseNotesURL, 0);
  objc_storeStrong((id *)&self->_firmwareFileSize, 0);
  objc_storeStrong((id *)&self->_firmwareBinaryHash, 0);
  objc_storeStrong((id *)&self->_firmwareURL, 0);
  objc_storeStrong((id *)&self->_maxFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_minFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
