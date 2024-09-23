@implementation ICResetReplicaIDsAfterBackupRestoreLaunchTask

- (void)runOneTimePerBackupRestoreLaunchTask
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v2 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100407464(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workerManagedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100075558;
  v6[3] = &unk_100550110;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

@end
