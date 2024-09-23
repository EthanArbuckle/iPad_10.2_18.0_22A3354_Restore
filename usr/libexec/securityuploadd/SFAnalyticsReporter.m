@implementation SFAnalyticsReporter

- (BOOL)saveReport:(id)a3 fileName:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005394;
  v10[3] = &unk_100018640;
  v11 = a4;
  v12 = v5;
  v6 = v5;
  v7 = v11;
  v8 = OSAWriteLogForSubmission(CFSTR("226"), v7, 0, 0, v10);

  return v8;
}

@end
