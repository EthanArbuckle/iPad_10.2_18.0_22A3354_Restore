@implementation BMSyncCKRecord

- (BMSyncCKRecord)initWithFMResultSet:(id)a3
{
  id v4;
  BMSyncCKRecord *v5;
  uint64_t v6;
  NSString *recordName;
  uint64_t v8;
  NSString *streamIdentifier;
  uint64_t v10;
  NSData *localMergeableValue;
  uint64_t v12;
  NSNumber *locationID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMSyncCKRecord;
  v5 = -[BMSyncCKRecord init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("record_name")));
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForColumn:", CFSTR("stream_identifier")));
    streamIdentifier = v5->_streamIdentifier;
    v5->_streamIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataForColumn:", CFSTR("local_mergeable_value")));
    localMergeableValue = v5->_localMergeableValue;
    v5->_localMergeableValue = (NSData *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", objc_msgSend(v4, "longForColumn:", CFSTR("location_id"))));
    locationID = v5->_locationID;
    v5->_locationID = (NSNumber *)v12;

  }
  return v5;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (NSData)localMergeableValue
{
  return self->_localMergeableValue;
}

- (NSNumber)locationID
{
  return self->_locationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_localMergeableValue, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
