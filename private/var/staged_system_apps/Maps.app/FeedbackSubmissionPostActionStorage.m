@implementation FeedbackSubmissionPostActionStorage

- (BOOL)saveFeedbackAction:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v5 = a4;
  v14 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v14));
  v7 = v14;
  if (v7)
  {
    v8 = sub_100431FFC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to archive feedback action for identifier:%@ withError:%@", buf, 0x16u);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("feedback")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage basePathForCorrections](RAPCorrectionsStorage, "basePathForCorrections"));
  v12 = +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", v6, v11, v10);

  return v12;
}

- (BOOL)removefeedbackActionForSubmissionIdentifier:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingString:", CFSTR("feedback")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", v3));
  v5 = +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v4);

  return v5;
}

- (id)feedbackActionForSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("feedback")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager dataAtFileURL:](RAPFileManager, "dataAtFileURL:", v5));
  v13 = 0;
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(FeedbackSubmissionPostAction), v6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v13;
  if (v9)
  {
    v10 = sub_100431FFC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive feedback action for identifier:%@ withError:%@", buf, 0x16u);
    }

  }
  return v8;
}

@end
