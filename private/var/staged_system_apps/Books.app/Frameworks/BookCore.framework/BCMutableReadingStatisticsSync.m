@implementation BCMutableReadingStatisticsSync

- (BCMutableReadingStatisticsSync)initWithAssetID:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  objc_super v10;

  v4 = a3;
  if (!v4)
  {
    v7 = BCCloudKitLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1B64F8();

    v5 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)BCMutableReadingStatisticsSync;
  v5 = -[BCMutableReadingStatisticsSync init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    self = (BCMutableReadingStatisticsSync *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;
LABEL_7:

  }
  return (BCMutableReadingStatisticsSync *)v5;
}

- (BCMutableReadingStatisticsSync)initWithCloudData:(id)a3
{
  id v4;
  BCMutableReadingStatisticsSync *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *assetID;
  void *v12;
  NSString *v13;
  NSString *assetVersion;
  uint64_t v15;
  void *readingStatisticsBook;
  id v17;
  NSObject *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BCMutableReadingStatisticsSync;
  v5 = -[BCMutableReadingStatisticsSync initWithCloudData:](&v20, "initWithCloudData:", v4);
  if (v5)
  {
    v6 = BUProtocolCast(&OBJC_PROTOCOL___BCReadingStatisticsSync, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      v10 = (NSString *)objc_msgSend(v9, "copy");
      assetID = v5->_assetID;
      v5->_assetID = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetVersion"));
      v13 = (NSString *)objc_msgSend(v12, "copy");
      assetVersion = v5->_assetVersion;
      v5->_assetVersion = v13;

      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingStatisticsBook"));
      readingStatisticsBook = v5->_readingStatisticsBook;
      v5->_readingStatisticsBook = (NSData *)v15;
    }
    else
    {
      v17 = BCCloudKitLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1B6524();

      readingStatisticsBook = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableReadingStatisticsSync)initWithRecord:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  objc_super v20;

  v4 = a3;
  if (!v4)
  {
    v16 = BCCloudKitLog();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B6550();
    v5 = 0;
    goto LABEL_11;
  }
  v20.receiver = self;
  v20.super_class = (Class)BCMutableReadingStatisticsSync;
  v5 = -[BCMutableReadingStatisticsSync initWithRecord:](&v20, "initWithRecord:", v4);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[BCCloudData localIdentifierFromRecord:](BCCloudData, "localIdentifierFromRecord:", v4));
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("assetVersion")));
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    v10 = objc_opt_class(CKAsset);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("assetStatistics")));
    v12 = BUDynamicCast(v10, v11);
    self = (BCMutableReadingStatisticsSync *)objc_claimAutoreleasedReturnValue(v12);

    v13 = objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync fileURL](self, "fileURL"));
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v13));
      v15 = *((_QWORD *)v5 + 3);
      *((_QWORD *)v5 + 3) = v14;
    }
    else
    {
      v17 = BCReadingStatisticsLog();
      v15 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1B657C((uint64_t *)v5 + 1, v15, v18);
    }

LABEL_11:
  }

  return (BCMutableReadingStatisticsSync *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync assetID](self, "assetID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync assetVersion](self, "assetVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("assetID: %@, assetVersion: %@, statistics: %@"), v3, v4, v5));

  return (NSString *)v6;
}

- (id)recordType
{
  return CFSTR("assetReadingStatistics");
}

- (id)zoneName
{
  return kBCCloudKitZoneReadingStatistics;
}

- (id)configuredRecordFromAttributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BCMutableReadingStatisticsSync;
  v3 = -[BCMutableReadingStatisticsSync configuredRecordFromAttributes](&v14, "configuredRecordFromAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync assetVersion](self, "assetVersion"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("assetVersion"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingStatisticsSyncManager sharedInstance](BCReadingStatisticsSyncManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync assetID](self, "assetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileURLForCachingCKAssetWithAssetID:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCMutableReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  LODWORD(v6) = objc_msgSend(v9, "writeToURL:atomically:", v8, 1);

  if ((_DWORD)v6)
  {
    v10 = objc_msgSend(objc_alloc((Class)CKAsset), "initWithFileURL:", v8);
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("assetStatistics"));

  }
  else
  {
    v11 = BCReadingStatisticsLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1B65EC();

    objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("assetStatistics"));
  }

  return v4;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)readingStatisticsBook
{
  return self->_readingStatisticsBook;
}

- (void)setReadingStatisticsBook:(id)a3
{
  objc_storeStrong((id *)&self->_readingStatisticsBook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingStatisticsBook, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
