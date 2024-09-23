@implementation UARPiCloudAccessoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPiCloudAccessoryRecord)initWithCKRecord:(id)a3
{
  id v4;
  UARPiCloudAccessoryRecord *v5;
  uint64_t v6;
  CKRecord *ckRecord;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *recordName;
  void *v12;
  uint64_t v13;
  NSString *manufacturer;
  void *v15;
  uint64_t v16;
  NSString *recordStatus;
  void *v18;
  uint64_t v19;
  NSString *model;
  void *v21;
  uint64_t v22;
  NSString *firmwareVersion;
  void *v24;
  uint64_t v25;
  NSString *firmwareURL;
  void *v27;
  uint64_t v28;
  NSString *releaseType;
  void *v30;
  uint64_t v31;
  NSString *updateClassification;
  void *v33;
  uint64_t v34;
  NSString *releaseNotesURL;
  void *v36;
  uint64_t v37;
  NSString *firmwareBinaryHash;
  void *v39;
  uint64_t v40;
  NSString *releaseNotesHash;
  void *v42;
  uint64_t v43;
  NSString *signature;
  void *v45;
  uint64_t v46;
  NSString *releaseDate;
  void *v48;
  uint64_t v49;
  NSString *firmwareFileSize;
  void *v51;
  uint64_t v52;
  NSString *releaseNotesFileSize;
  void *v54;
  uint64_t v55;
  NSString *deploymentStr;
  NSString *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *deploymentList;
  objc_super v63;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)UARPiCloudAccessoryRecord;
  v5 = -[UARPiCloudAccessoryRecord init](&v63, sel_init);
  if (!v5)
  {
    v59 = 0;
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "copy");
  ckRecord = v5->_ckRecord;
  v5->_ckRecord = (CKRecord *)v6;

  objc_msgSend(v4, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  recordName = v5->_recordName;
  v5->_recordName = (NSString *)v10;

  if (!v5->_recordName)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("manufacturer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  manufacturer = v5->_manufacturer;
  v5->_manufacturer = (NSString *)v13;

  if (!v5->_manufacturer)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("recordStatus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  recordStatus = v5->_recordStatus;
  v5->_recordStatus = (NSString *)v16;

  if (!v5->_recordStatus)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("model"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  model = v5->_model;
  v5->_model = (NSString *)v19;

  if (!v5->_model)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  firmwareVersion = v5->_firmwareVersion;
  v5->_firmwareVersion = (NSString *)v22;

  if (!v5->_firmwareVersion)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  firmwareURL = v5->_firmwareURL;
  v5->_firmwareURL = (NSString *)v25;

  if (!v5->_firmwareURL)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("releaseType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  releaseType = v5->_releaseType;
  v5->_releaseType = (NSString *)v28;

  objc_msgSend(v4, "objectForKey:", CFSTR("updateClassification"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copy");
  updateClassification = v5->_updateClassification;
  v5->_updateClassification = (NSString *)v31;

  objc_msgSend(v4, "objectForKey:", CFSTR("releaseNotesURL"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copy");
  releaseNotesURL = v5->_releaseNotesURL;
  v5->_releaseNotesURL = (NSString *)v34;

  if (!v5->_releaseNotesURL)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareBinaryHash"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "copy");
  firmwareBinaryHash = v5->_firmwareBinaryHash;
  v5->_firmwareBinaryHash = (NSString *)v37;

  if (!v5->_firmwareBinaryHash)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("releaseNotesHash"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "copy");
  releaseNotesHash = v5->_releaseNotesHash;
  v5->_releaseNotesHash = (NSString *)v40;

  if (!v5->_releaseNotesHash)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("signature"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "copy");
  signature = v5->_signature;
  v5->_signature = (NSString *)v43;

  if (!v5->_signature)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("releaseDate"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "copy");
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = (NSString *)v46;

  if (!v5->_releaseDate)
    goto LABEL_20;
  objc_msgSend(v4, "objectForKey:", CFSTR("firmwareFileSize"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "copy");
  firmwareFileSize = v5->_firmwareFileSize;
  v5->_firmwareFileSize = (NSString *)v49;

  if (!v5->_firmwareFileSize
    || (objc_msgSend(v4, "objectForKey:", CFSTR("releaseNotesFileSize")),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        v52 = objc_msgSend(v51, "copy"),
        releaseNotesFileSize = v5->_releaseNotesFileSize,
        v5->_releaseNotesFileSize = (NSString *)v52,
        releaseNotesFileSize,
        v51,
        !v5->_releaseNotesFileSize))
  {
LABEL_20:
    v59 = v5;
    v5 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("deploymentList"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "copy");
  deploymentStr = v5->_deploymentStr;
  v5->_deploymentStr = (NSString *)v55;

  v57 = v5->_deploymentStr;
  if (v57)
  {
    v58 = (void *)MEMORY[0x24BDD1608];
    -[NSString dataUsingEncoding:](v57, "dataUsingEncoding:", 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "JSONObjectWithData:options:error:", v59, 0, 0);
    v60 = objc_claimAutoreleasedReturnValue();
    deploymentList = v5->_deploymentList;
    v5->_deploymentList = (NSArray *)v60;

LABEL_18:
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPiCloudAccessoryRecord initWithCKRecord:]([UARPiCloudAccessoryRecord alloc], "initWithCKRecord:", self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
  CKRecord *ckRecord;
  id v5;

  ckRecord = self->_ckRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ckRecord, CFSTR("record"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturer, CFSTR("manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordStatus, CFSTR("recordStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareVersion, CFSTR("model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareURL, CFSTR("firmwareURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseType, CFSTR("releaseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updateClassification, CFSTR("updateClassification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseNotesURL, CFSTR("releaseNotesURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firmwareBinaryHash, CFSTR("firmwareBinaryHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseNotesHash, CFSTR("releaseNotesHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deploymentList, CFSTR("deploymentList"));

}

- (UARPiCloudAccessoryRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  UARPiCloudAccessoryRecord *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UARPiCloudAccessoryRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "appendWithTabDepth:format:", a3, CFSTR("Name: %@\n"), self->_recordName);
  v6 = a3 + 1;
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Status: %@\n"), self->_recordStatus);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Manufacturer: %@\n"), self->_manufacturer);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Model: %@\n"), self->_model);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Firmware Version: %@\n"), self->_firmwareVersion);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Firmware URL: %@\n"), self->_firmwareURL);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Release Type: %@\n"), self->_releaseType);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Update Classification: %@\n"), self->_updateClassification);
  if (self->_deploymentStr)
    objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Deployment String: %@\n"), self->_deploymentStr);
  if (self->_deploymentList)
    objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Deployment List: %@\n"), self->_deploymentList);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Release Notes URL: %@\n"), self->_releaseNotesURL);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Firmware Binary Hash: %@\n"), self->_firmwareBinaryHash);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Release Notes Hash: %@\n"), self->_releaseNotesHash);
  objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Signature: %@\n"), self->_signature);
  if (self->_releaseDate)
    objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Release Date: %@\n"), self->_releaseDate);
  if (self->_releaseNotesFileSize)
    objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Release Notes File Size: %@\n"), self->_releaseNotesFileSize);
  v7 = v8;
  if (self->_firmwareFileSize)
  {
    objc_msgSend(v8, "appendWithTabDepth:format:", v6, CFSTR("Firmware File Size: %@\n"), self->_firmwareFileSize);
    v7 = v8;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: recordName=%@, firmwareVersion=%@, firmwareURL=%@, releaseNotesURL=%@, firmwareBinaryHash=%@, releaseNotesHash=%@>"), v5, self->_recordName, self->_firmwareVersion, self->_firmwareURL, self->_releaseNotesURL, self->_firmwareBinaryHash, self->_releaseNotesHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)firmwareURL
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)releaseType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)updateClassification
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)deploymentStr
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)deploymentList
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)releaseNotesURL
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)firmwareBinaryHash
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)releaseNotesHash
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)releaseDate
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)releaseNotesFileSize
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)firmwareFileSize
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecord, 0);
  objc_storeStrong((id *)&self->_firmwareFileSize, 0);
  objc_storeStrong((id *)&self->_releaseNotesFileSize, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_releaseNotesHash, 0);
  objc_storeStrong((id *)&self->_firmwareBinaryHash, 0);
  objc_storeStrong((id *)&self->_releaseNotesURL, 0);
  objc_storeStrong((id *)&self->_deploymentList, 0);
  objc_storeStrong((id *)&self->_deploymentStr, 0);
  objc_storeStrong((id *)&self->_updateClassification, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_firmwareURL, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_recordStatus, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
