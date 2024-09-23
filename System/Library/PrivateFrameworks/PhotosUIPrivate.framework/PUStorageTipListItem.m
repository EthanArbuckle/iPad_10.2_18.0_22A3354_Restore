@implementation PUStorageTipListItem

- (PUStorageTipListItem)initWithStorageTipType:(unint64_t)a3 count:(int64_t)a4 totalSizeInBytes:(int64_t)a5
{
  PUStorageTipListItem *v9;
  PUStorageTipListItem *v10;
  uint64_t v11;
  NSString *title;
  NSString *systemImageName;
  id *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  NSString *v19;
  NSString *cloudQuotaBytesUsedIdentifier;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUStorageTipListItem;
  v9 = -[PUStorageTipListItem init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_storageTipType = a3;
    switch(a3)
    {
      case 0uLL:
        PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_DUPLICATES_ALBUM_TITLE"));
        v11 = objc_claimAutoreleasedReturnValue();
        title = v10->_title;
        v10->_title = (NSString *)v11;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)CFSTR("square.on.square");
        v14 = (id *)MEMORY[0x1E0CD1B18];
        goto LABEL_6;
      case 1uLL:
        PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_SCREENSHOTS_ALBUM_TITLE"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v10->_title;
        v10->_title = (NSString *)v15;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)CFSTR("camera.viewfinder");
        v14 = (id *)MEMORY[0x1E0CD1B20];
        goto LABEL_6;
      case 2uLL:
        PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_LARGE_VIDEOS_ALBUM_TITLE"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v10->_title;
        v10->_title = (NSString *)v17;

        systemImageName = v10->_systemImageName;
        v10->_systemImageName = (NSString *)CFSTR("video");
        v14 = (id *)MEMORY[0x1E0CD1B28];
LABEL_6:

        v19 = (NSString *)*v14;
        cloudQuotaBytesUsedIdentifier = v10->_cloudQuotaBytesUsedIdentifier;
        v10->_cloudQuotaBytesUsedIdentifier = v19;

        break;
      case 3uLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUStorageTipListItem.m"), 41, CFSTR("Code which should be unreachable has been reached"));

        abort();
      default:
        break;
    }
    v10->_count = a4;
    v10->_totalSizeInBytes = a5;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUStorageTipListItem initWithStorageTipType:count:totalSizeInBytes:](+[PUStorageTipListItem allocWithZone:](PUStorageTipListItem, "allocWithZone:", a3), "initWithStorageTipType:count:totalSizeInBytes:", self->_storageTipType, self->_count, self->_totalSizeInBytes);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)totalSizeInBytes
{
  return self->_totalSizeInBytes;
}

- (unint64_t)storageTipType
{
  return self->_storageTipType;
}

- (NSString)cloudQuotaBytesUsedIdentifier
{
  return self->_cloudQuotaBytesUsedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaBytesUsedIdentifier, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (unint64_t)storageTipTypeForCloudQuotaUsedBytesIdentifier:(id)a3
{
  id v5;
  unint64_t v6;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1B18]) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1B20]) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1B28]) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUStorageTipListItem.m"), 60, CFSTR("Attempted to get PUStorageTipType for unknown CloudQuotaUsedBytesIdentifier"));

      abort();
    }
    v6 = 2;
  }

  return v6;
}

@end
