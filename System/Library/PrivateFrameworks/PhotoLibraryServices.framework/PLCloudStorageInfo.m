@implementation PLCloudStorageInfo

- (PLCloudStorageInfo)initWithTotalQuotaBytes:(int64_t)a3 totalAvailableBytes:(int64_t)a4 totalUsedBytes:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8
{
  PLCloudStorageInfo *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PLCloudStorageInfo;
  result = -[PLCloudStorageInfo init](&v15, sel_init);
  if (result)
  {
    result->_totalBytes = a3;
    result->_availableBytes = a4;
    result->_usedBytes = a5;
    result->_cameraRollBackupBytes = a6;
    result->_iCloudPhotosBytes = a7;
    result->_hasMaxQuotaTier = a8;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total bytes: %llu Available byte: %llu Used bytes: %llu Camera roll bytes: %llu iCloud Photos bytes: %llu Max quota tier %d"), self->_totalBytes, self->_availableBytes, self->_usedBytes, self->_cameraRollBackupBytes, self->_iCloudPhotosBytes, self->_hasMaxQuotaTier);
}

- (int64_t)totalBytes
{
  return self->_totalBytes;
}

- (int64_t)availableBytes
{
  return self->_availableBytes;
}

- (int64_t)usedBytes
{
  return self->_usedBytes;
}

- (int64_t)cameraRollBackupBytes
{
  return self->_cameraRollBackupBytes;
}

- (int64_t)iCloudPhotosBytes
{
  return self->_iCloudPhotosBytes;
}

- (BOOL)hasMaxQuotaTier
{
  return self->_hasMaxQuotaTier;
}

+ (id)storageInfoWithTotal:(int64_t)a3 available:(int64_t)a4 used:(int64_t)a5 cameraRollBackupBytes:(int64_t)a6 iCloudPhotosSize:(int64_t)a7 hasMaxQuotaTier:(BOOL)a8
{
  return -[PLCloudStorageInfo initWithTotalQuotaBytes:totalAvailableBytes:totalUsedBytes:cameraRollBackupBytes:iCloudPhotosSize:hasMaxQuotaTier:]([PLCloudStorageInfo alloc], "initWithTotalQuotaBytes:totalAvailableBytes:totalUsedBytes:cameraRollBackupBytes:iCloudPhotosSize:hasMaxQuotaTier:", a3, a4, a5, a6, a7, a8);
}

@end
