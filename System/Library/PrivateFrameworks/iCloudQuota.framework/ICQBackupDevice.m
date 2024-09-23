@implementation ICQBackupDevice

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceName: %@, deviceUDID: %@, deviceSubtitle: %@, storageUsedLabel: %@, storageUsed: %@, backupSize: %@, imageURL: %@, largeImageURL: %@, detailViewController: %@, backupTimestamp: %@ deleteURL: %@ deleteButtonLabel: %@, backupFailedByinBytes: %@, bytesRequiredForBackup: %@, isActive: %d, isLocalBackup: %d"), self->_deviceName, self->_deviceUDID, self->_deviceSubtitle, self->_storageUsedLabel, self->_storageUsed, self->_backupSize, self->_imageURL, self->_largeImageURL, self->_detailViewController, self->_backupTimestamp, self->_deleteURL, self->_deleteButtonLabel, self->_backupFailedByinBytes, self->_bytesRequiredForBackup, self->_isActive, self->_isLocalBackup);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQBackupDevice *v4;

  v4 = objc_alloc_init(ICQBackupDevice);
  -[ICQBackupDevice setDeviceName:](v4, "setDeviceName:", self->_deviceName);
  -[ICQBackupDevice setDeviceUDID:](v4, "setDeviceUDID:", self->_deviceUDID);
  -[ICQBackupDevice setDeviceSubtitle:](v4, "setDeviceSubtitle:", self->_deviceSubtitle);
  -[ICQBackupDevice setStorageUsedLabel:](v4, "setStorageUsedLabel:", self->_storageUsedLabel);
  -[ICQBackupDevice setStorageUsed:](v4, "setStorageUsed:", self->_storageUsed);
  -[ICQBackupDevice setBackupSize:](v4, "setBackupSize:", self->_backupSize);
  -[ICQBackupDevice setImageURL:](v4, "setImageURL:", self->_imageURL);
  -[ICQBackupDevice setLargeImageURL:](v4, "setLargeImageURL:", self->_largeImageURL);
  -[ICQBackupDevice setDetailViewController:](v4, "setDetailViewController:", self->_detailViewController);
  -[ICQBackupDevice setBackupTimestamp:](v4, "setBackupTimestamp:", self->_backupTimestamp);
  -[ICQBackupDevice setDeleteURL:](v4, "setDeleteURL:", self->_deleteURL);
  -[ICQBackupDevice setDeleteButtonLabel:](v4, "setDeleteButtonLabel:", self->_deleteButtonLabel);
  -[ICQBackupDevice setBackupFailedByinBytes:](v4, "setBackupFailedByinBytes:", self->_backupFailedByinBytes);
  -[ICQBackupDevice setBytesRequiredForBackup:](v4, "setBytesRequiredForBackup:", self->_bytesRequiredForBackup);
  -[ICQBackupDevice setIsActive:](v4, "setIsActive:", self->_isActive);
  -[ICQBackupDevice setIsLocalBackup:](v4, "setIsLocalBackup:", self->_isLocalBackup);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceSubtitle, CFSTR("deviceSubtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageUsedLabel, CFSTR("storageUsedLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storageUsed, CFSTR("storageUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupSize, CFSTR("backupSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_largeImageURL, CFSTR("largeImageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailViewController, CFSTR("detailViewController"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupTimestamp, CFSTR("backupTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deleteURL, CFSTR("deleteURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deleteButtonLabel, CFSTR("deleteButtonLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupFailedByinBytes, CFSTR("backupFailedByinBytes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bytesRequiredForBackup, CFSTR("bytesRequiredForBackup"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActive, CFSTR("isActive"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocalBackup, CFSTR("isLocalBackup"));

}

- (ICQBackupDevice)initWithCoder:(id)a3
{
  id v4;
  ICQBackupDevice *v5;
  uint64_t v6;
  NSString *deviceName;
  uint64_t v8;
  NSString *deviceUDID;
  uint64_t v10;
  NSString *deviceSubtitle;
  uint64_t v12;
  NSString *storageUsedLabel;
  uint64_t v14;
  NSNumber *storageUsed;
  uint64_t v16;
  NSNumber *backupSize;
  uint64_t v18;
  ICQImageURL *imageURL;
  uint64_t v20;
  ICQImageURL *largeImageURL;
  uint64_t v22;
  NSString *detailViewController;
  uint64_t v24;
  NSNumber *backupTimestamp;
  uint64_t v26;
  NSURL *deleteURL;
  uint64_t v28;
  NSString *deleteButtonLabel;
  uint64_t v30;
  NSNumber *backupFailedByinBytes;
  uint64_t v32;
  NSNumber *bytesRequiredForBackup;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ICQBackupDevice;
  v5 = -[ICQBackupDevice init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUDID"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceSubtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceSubtitle = v5->_deviceSubtitle;
    v5->_deviceSubtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageUsedLabel"));
    v12 = objc_claimAutoreleasedReturnValue();
    storageUsedLabel = v5->_storageUsedLabel;
    v5->_storageUsedLabel = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storageUsed"));
    v14 = objc_claimAutoreleasedReturnValue();
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupSize"));
    v16 = objc_claimAutoreleasedReturnValue();
    backupSize = v5->_backupSize;
    v5->_backupSize = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("largeImageURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    largeImageURL = v5->_largeImageURL;
    v5->_largeImageURL = (ICQImageURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailViewController"));
    v22 = objc_claimAutoreleasedReturnValue();
    detailViewController = v5->_detailViewController;
    v5->_detailViewController = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupTimestamp"));
    v24 = objc_claimAutoreleasedReturnValue();
    backupTimestamp = v5->_backupTimestamp;
    v5->_backupTimestamp = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deleteURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    deleteURL = v5->_deleteURL;
    v5->_deleteURL = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deleteButtonLabel"));
    v28 = objc_claimAutoreleasedReturnValue();
    deleteButtonLabel = v5->_deleteButtonLabel;
    v5->_deleteButtonLabel = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupFailedByinBytes"));
    v30 = objc_claimAutoreleasedReturnValue();
    backupFailedByinBytes = v5->_backupFailedByinBytes;
    v5->_backupFailedByinBytes = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bytesRequiredForBackup"));
    v32 = objc_claimAutoreleasedReturnValue();
    bytesRequiredForBackup = v5->_bytesRequiredForBackup;
    v5->_bytesRequiredForBackup = (NSNumber *)v32;

    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
    v5->_isLocalBackup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocalBackup"));
  }

  return v5;
}

- (NSDictionary)rawDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", CFSTR("button"), CFSTR("class"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceName, CFSTR("deviceName"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceUDID, CFSTR("deviceUdid"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceSubtitle, CFSTR("subLabel"));
  objc_msgSend(v3, "setValue:forKey:", self->_storageUsedLabel, CFSTR("detailLabel"));
  objc_msgSend(v3, "setValue:forKey:", self->_storageUsed, CFSTR("backupSize"));
  -[ICQImageURL URL1x](self->_imageURL, "URL1x");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("image"));

  -[ICQImageURL URL2x](self->_imageURL, "URL2x");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("image2x"));

  -[ICQImageURL URL3x](self->_imageURL, "URL3x");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("image3x"));

  -[ICQImageURL URL1x](self->_largeImageURL, "URL1x");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("largeImage"));

  -[ICQImageURL URL2x](self->_largeImageURL, "URL2x");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("largeImage2x"));

  -[ICQImageURL URL3x](self->_largeImageURL, "URL3x");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("largeImage3x"));

  objc_msgSend(v3, "setValue:forKey:", self->_backupTimestamp, CFSTR("backupTimestamp"));
  -[NSURL absoluteString](self->_deleteURL, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("deleteURL"));

  objc_msgSend(v3, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("forceFullSizeDetailLabel"));
  objc_msgSend(v3, "setValue:forKey:", CFSTR("disclosure"), CFSTR("accessory"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceName, CFSTR("label"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceSubtitle, CFSTR("sublabel"));
  objc_msgSend(v3, "setValue:forKey:", CFSTR("localBackup"), CFSTR("name"));
  objc_msgSend(v3, "setValue:forKey:", CFSTR("currentDeviceBackUp"), CFSTR("id"));
  objc_msgSend(v3, "setValue:forKey:", &unk_1E8B51B28, CFSTR("height"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActive);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("isActive"));

  v18 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v18;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceSubtitle
{
  return self->_deviceSubtitle;
}

- (void)setDeviceSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)storageUsedLabel
{
  return self->_storageUsedLabel;
}

- (void)setStorageUsedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
  objc_storeStrong((id *)&self->_storageUsed, a3);
}

- (NSNumber)backupSize
{
  return self->_backupSize;
}

- (void)setBackupSize:(id)a3
{
  objc_storeStrong((id *)&self->_backupSize, a3);
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (ICQImageURL)largeImageURL
{
  return self->_largeImageURL;
}

- (void)setLargeImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_largeImageURL, a3);
}

- (NSString)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)backupTimestamp
{
  return self->_backupTimestamp;
}

- (void)setBackupTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_backupTimestamp, a3);
}

- (NSURL)deleteURL
{
  return self->_deleteURL;
}

- (void)setDeleteURL:(id)a3
{
  objc_storeStrong((id *)&self->_deleteURL, a3);
}

- (NSString)deleteButtonLabel
{
  return self->_deleteButtonLabel;
}

- (void)setDeleteButtonLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)backupFailedByinBytes
{
  return self->_backupFailedByinBytes;
}

- (void)setBackupFailedByinBytes:(id)a3
{
  objc_storeStrong((id *)&self->_backupFailedByinBytes, a3);
}

- (NSNumber)bytesRequiredForBackup
{
  return self->_bytesRequiredForBackup;
}

- (void)setBytesRequiredForBackup:(id)a3
{
  objc_storeStrong((id *)&self->_bytesRequiredForBackup, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isLocalBackup
{
  return self->_isLocalBackup;
}

- (void)setIsLocalBackup:(BOOL)a3
{
  self->_isLocalBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytesRequiredForBackup, 0);
  objc_storeStrong((id *)&self->_backupFailedByinBytes, 0);
  objc_storeStrong((id *)&self->_deleteButtonLabel, 0);
  objc_storeStrong((id *)&self->_deleteURL, 0);
  objc_storeStrong((id *)&self->_backupTimestamp, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_largeImageURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_backupSize, 0);
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_storageUsedLabel, 0);
  objc_storeStrong((id *)&self->_deviceSubtitle, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
