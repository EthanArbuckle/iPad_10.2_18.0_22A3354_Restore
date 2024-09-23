@implementation ICRefetchNoteRecordsLaunchTask

- (ICRefetchNoteRecordsLaunchTask)initWithIdentifier:(id)a3 modifiedAfterDateString:(id)a4
{
  id v7;
  id v8;
  ICRefetchNoteRecordsLaunchTask *v9;
  ICRefetchNoteRecordsLaunchTask *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSDate *modifiedAfterDate;
  ICRefetchNoteRecordsLaunchTask *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICRefetchNoteRecordsLaunchTask;
  v9 = -[ICRefetchNoteRecordsLaunchTask init](&v17, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_3;
  objc_storeStrong((id *)&v9->_identifier, a3);
  objc_storeStrong((id *)&v10->_modifiedAfterDateString, a4);
  v11 = objc_msgSend((id)objc_opt_class(v10), "dateFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateFromString:", v8));
  modifiedAfterDate = v10->_modifiedAfterDate;
  v10->_modifiedAfterDate = (NSDate *)v13;

  if (!v10->_modifiedAfterDate)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICRefetchNoteRecordsLaunchTask initWithIdentifier:modifiedAfterDateString:]", 1, 0, CFSTR("Refetch records launch task doesn't have a valid modified after date"));
    v15 = 0;
  }
  else
  {
LABEL_3:
    v15 = v10;
  }

  return v15;
}

+ (NSDateFormatter)dateFormatter
{
  if (qword_1005DDDC8 != -1)
    dispatch_once(&qword_1005DDDC8, &stru_100551ED8);
  return (NSDateFormatter *)(id)qword_1005DDDC0;
}

- (id)relationshipKeyPathsForPrefetching
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v2 = ICKeyPathFromSelector("identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v14[0] = v3;
  v4 = ICKeyPathFromSelector("account");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[1] = v5;
  v6 = ICKeyPathFromSelector("zoneOwnerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14[2] = v7;
  v8 = ICKeyPathFromSelector("modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14[3] = v9;
  v10 = ICKeyPathFromSelector("userSpecificServerRecordData");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));

  return v12;
}

- (unint64_t)batchSize
{
  return 32;
}

- (id)taskIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICRefetchNoteRecordsLaunchTask identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ICRefetchNoteRecordsLaunchTask-%@"), v2));

  return v3;
}

- (void)runLaunchTask
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1004073A8(self, v3);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100074C34;
  v8[3] = &unk_100550298;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICRefetchNoteRecordsLaunchTask identifier](self, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[3]));
    sub_100407344(v6, v7, (uint64_t)v13, v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (NSString)modifiedAfterDateString
{
  return self->_modifiedAfterDateString;
}

- (NSDate)modifiedAfterDate
{
  return self->_modifiedAfterDate;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedAfterDate, 0);
  objc_storeStrong((id *)&self->_modifiedAfterDateString, 0);
}

@end
