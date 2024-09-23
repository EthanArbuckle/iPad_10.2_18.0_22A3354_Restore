@implementation BMCoreAnalyticsEvents

+ (void)sendSyncSessionLog:(id)a3
{
  +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.syncSessionLog"), a3);
}

+ (void)sendSyncDatabaseSummaryWithDatabase:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dictionaryWithSyncDatabase:", a3));
  +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.syncdatabase"), v3);

}

+ (void)sendCKRecordCRDTLog:(id)a3
{
  +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.ckrecordcrdt"), a3);
}

+ (id)dictionaryWithSyncDatabase:(id)a3
{
  id v3;
  void *v4;
  NSDate *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[9];
  _QWORD v21[9];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateOfLastVacuum"));
  if (v4)
  {
    v5 = objc_opt_new(NSDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateOfLastVacuum"));
    -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v6);
    v18 = (uint64_t)v7;

  }
  else
  {
    v18 = -1;
  }

  v20[0] = CFSTR("database_size");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "databaseSizeInKilobytes")));
  v21[0] = v19;
  v20[1] = CFSTR("wal_size");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "walSizeInKilobytes")));
  v21[1] = v8;
  v20[2] = CFSTR("num_rows_CKAtom");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numRowsInTable:", CFSTR("CKAtom"))));
  v21[2] = v9;
  v20[3] = CFSTR("table_size_CKAtom");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "sizeOfTableInKilobytes:", CFSTR("CKAtom"))));
  v21[3] = v10;
  v20[4] = CFSTR("num_rows_CKRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numRowsInTable:", CFSTR("CKRecord"))));
  v21[4] = v11;
  v20[5] = CFSTR("table_size_CKRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "sizeOfTableInKilobytes:", CFSTR("CKRecord"))));
  v21[5] = v12;
  v20[6] = CFSTR("num_rows_CRDTLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "numRowsInTable:", CFSTR("CRDTLocation"))));
  v21[6] = v13;
  v20[7] = CFSTR("time_since_vacuum");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
  v21[7] = v14;
  v20[8] = CFSTR("table_size_CRDTLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "sizeOfTableInKilobytes:", CFSTR("CRDTLocation"))));
  v21[8] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 9));

  return v16;
}

@end
