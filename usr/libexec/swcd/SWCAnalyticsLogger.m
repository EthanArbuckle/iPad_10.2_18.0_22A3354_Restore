@implementation SWCAnalyticsLogger

+ (id)sharedLogger
{
  if (qword_100037268 != -1)
    dispatch_once(&qword_100037268, &stru_100030E08);
  return (id)qword_100037270;
}

- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4
{
  _QWORD v4[4];
  unsigned __int8 v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013F18;
  v4[3] = &unk_100030E28;
  v5 = a4;
  AnalyticsSendEventLazy(CFSTR("com.apple.SharedWebCredentials.StartAASAFileDownload"), v4, a3);
}

@end
