@implementation SWTBridge

+ (BOOL)writeIssueReport:(id)a3 filename:(id)a4
{
  id v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013240;
  v7[3] = &unk_1001065B0;
  v8 = a3;
  v5 = v8;
  LOBYTE(a4) = OSAWriteLogForSubmission(CFSTR("226"), a4, 0, 0, v7);

  return (char)a4;
}

+ (id)swTransparencyXPCInterface
{
  return +[SWTransparencyXPCInterface interface](SWTransparencyXPCInterface, "interface");
}

@end
