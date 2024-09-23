@implementation ICFixMissingPaperBundlesLaunchTask

- (void)runLaunchTask
{
  id v3;
  _QWORD v4[4];
  id v5;
  ICFixMissingPaperBundlesLaunchTask *v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C84F4;
  v4[3] = &unk_10054FE80;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v6 = self;
  v3 = v5;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (BOOL)paperBundleIsMissing:(id)a3
{
  return objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0) ^ 1;
}

- (BOOL)paperBundleIsEmpty:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, 0));

  LOBYTE(v4) = objc_msgSend(v5, "count") == 0;
  return (char)v4;
}

@end
