@implementation ICUpdateInlineDrawingsSectionLaunchTask

- (void)runOneTimeLaunchTask
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000829DC;
  v4[3] = &unk_100550110;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

@end
