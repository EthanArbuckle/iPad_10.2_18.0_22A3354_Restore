@implementation ICFixHiddenICloudAccountLaunchTask

- (void)runLaunchTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICFixHiddenICloudAccountLaunchTask *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccountUtilities sharedInstance](ICAccountUtilities, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allICloudACAccounts"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C6C04;
  v7[3] = &unk_10054FE80;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

@end
