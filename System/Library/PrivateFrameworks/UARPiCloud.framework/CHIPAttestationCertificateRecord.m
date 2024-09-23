@implementation CHIPAttestationCertificateRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAttestationCertificateRecord)initWithCKRecord:(id)a3
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
  NSString *rootCertificate;
  void *v22;
  NSString *v23;
  NSString *intermediateCertificates;
  void *v25;
  NSString *v26;
  NSString *recordStatus;
  CHIPAttestationCertificateRecord *v28;
  objc_super v30;

  v4 = a3;
  if (v4
    && (v30.receiver = self,
        v30.super_class = (Class)CHIPAttestationCertificateRecord,
        (self = -[CHIPAttestationCertificateRecord init](&v30, sel_init)) != 0))
  {
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

    objc_msgSend(v4, "objectForKey:", CFSTR("signature"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)objc_msgSend(v13, "copy");
    signature = self->_signature;
    self->_signature = v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("verificationCertificateKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSString *)objc_msgSend(v16, "copy");
    verificationCertificateID = self->_verificationCertificateID;
    self->_verificationCertificateID = v17;

    objc_msgSend(v4, "objectForKey:", CFSTR("rootCertificate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSString *)objc_msgSend(v19, "copy");
    rootCertificate = self->_rootCertificate;
    self->_rootCertificate = v20;

    objc_msgSend(v4, "objectForKey:", CFSTR("intermediateCertificates"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSString *)objc_msgSend(v22, "copy");
    intermediateCertificates = self->_intermediateCertificates;
    self->_intermediateCertificates = v23;

    objc_msgSend(v4, "objectForKey:", CFSTR("recordStatus"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (NSString *)objc_msgSend(v25, "copy");
    recordStatus = self->_recordStatus;
    self->_recordStatus = v26;

    if (!self->_signature || !self->_verificationCertificateID || !self->_rootCertificate || !self->_recordStatus)
    {

      self = 0;
    }
    self = self;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHIPAttestationCertificateRecord initWithCKRecord:]([CHIPAttestationCertificateRecord alloc], "initWithCKRecord:", self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_ckRecord, CFSTR("record"));
}

- (CHIPAttestationCertificateRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CHIPAttestationCertificateRecord *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CHIPAttestationCertificateRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (NSString)rootCertificate
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)intermediateCertificates
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCertificateID, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_ckRecord, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_recordStatus, 0);
  objc_storeStrong((id *)&self->_intermediateCertificates, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
