@implementation NSProcessInfo

+ (double)ask_processStartTime
{
  if (ask_processStartTime_onceToken != -1)
    dispatch_once(&ask_processStartTime_onceToken, &__block_literal_global_1);
  return *(double *)&ask_processStartTime_processStartTime;
}

void __49__NSProcessInfo_LaunchTime__ask_processStartTime__block_invoke(id a1)
{
  void *v1;
  uint64_t v2;
  size_t v3;
  _OWORD v4[40];
  int v5[2];
  int v6;
  pid_t v7;

  *(_QWORD *)v5 = 0xE00000001;
  v6 = 1;
  v7 = getpid();
  memset(v4, 0, 512);
  v3 = 648;
  if (sysctl(v5, 4u, v4, &v3, 0, 0))
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v1, "timeIntervalSince1970");
    ask_processStartTime_processStartTime = v2;

  }
  else
  {
    *(double *)&ask_processStartTime_processStartTime = (double)SDWORD2(v4[0]) / 1000000.0 + (double)*(uint64_t *)&v4[0];
  }
}

- (double)ask_launchTime
{
  double result;

  +[NSProcessInfo ask_processStartTime](NSProcessInfo, "ask_processStartTime");
  return result;
}

@end
