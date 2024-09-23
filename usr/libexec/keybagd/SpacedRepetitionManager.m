@implementation SpacedRepetitionManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003C38;
  block[3] = &unk_10002CB98;
  block[4] = a1;
  if (qword_100035880 != -1)
    dispatch_once(&qword_100035880, block);
  return (id)qword_100035888;
}

- (SpacedRepetitionManager)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("..."), 0));
}

- (void)setupIntervals
{
  NSArray *v2;
  uint64_t v3;

  if (dword_100035850 == 1)
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1000326C8, &off_1000326E0, &off_1000326F8, 0);
  else
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_100032710, &off_100032728, 0, v3);
  qword_100035858 = (uint64_t)v2;
}

- (id)initialize
{
  SpacedRepetitionManager *v2;
  SpacedRepetitionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SpacedRepetitionManager;
  v2 = -[SpacedRepetitionManager init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SpacedRepetitionManager setupIntervals](v2, "setupIntervals");
    -[SpacedRepetitionManager readConfig](v3, "readConfig");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SpacedRepetitionManager;
  -[SpacedRepetitionManager dealloc](&v3, "dealloc");
}

- (id)readConfig
{
  id result;

  if (qword_100035860)

  result = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfFile:", CFSTR("/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist"));
  qword_100035860 = (uint64_t)result;
  if (!result)
  {
    result = objc_alloc_init((Class)NSMutableDictionary);
    qword_100035860 = (uint64_t)result;
  }
  return result;
}

- (BOOL)writeConfig
{
  return objc_msgSend((id)qword_100035860, "writeToFile:atomically:", CFSTR("/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist"), 1);
}

- (int64_t)getNextVerificationEpoch
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = (id)time(0);
  v4 = objc_msgSend((id)qword_100035860, "valueForKey:", CFSTR("lastVerificationEpoch"));
  v5 = objc_msgSend((id)qword_100035860, "valueForKey:", CFSTR("verificationEpochStartTime"));
  -[SpacedRepetitionManager setupIntervals](self, "setupIntervals");
  if (!v4)
    return -1;
  v6 = objc_msgSend(v4, "integerValue");
  if (v5)
    v3 = objc_msgSend(v5, "integerValue");
  if (v6 < objc_msgSend((id)qword_100035858, "count"))
    return (int64_t)v3 + (int)objc_msgSend(objc_msgSend((id)qword_100035858, "objectAtIndex:", v6), "intValue");
  else
    return -1;
}

- (BOOL)commitNextVerificationEpoch
{
  unint64_t v3;
  signed int v4;
  unint64_t v5;

  v3 = (int)objc_msgSend(objc_msgSend((id)qword_100035860, "valueForKey:", CFSTR("lastVerificationEpoch")), "intValue");
  v4 = objc_msgSend(objc_msgSend((id)qword_100035858, "objectAtIndex:", v3), "intValue");
  -[SpacedRepetitionManager setupIntervals](self, "setupIntervals");
  if ((unint64_t)objc_msgSend((id)qword_100035858, "count") <= v3)
    return 0;
  v5 = v3 + 1;
  objc_msgSend((id)qword_100035860, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v5), CFSTR("lastVerificationEpoch"));
  objc_msgSend((id)qword_100035860, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", time(0) - v4), CFSTR("verificationEpochStartTime"));
  -[SpacedRepetitionManager writeConfig](self, "writeConfig");
  NSLog(CFSTR("advancing verification epoch to %lu"), v5);
  return v5 < (unint64_t)objc_msgSend((id)qword_100035858, "count");
}

- (int64_t)getSpacedRepetitionTimeout
{
  if (dword_100035850 == 1)
    return 120;
  else
    return 518400;
}

- (BOOL)checkForVerificationEpoch
{
  time_t v2;

  v2 = -[SpacedRepetitionManager getNextVerificationEpoch](self, "getNextVerificationEpoch");
  return v2 >= 1 && time(0) >= v2;
}

- (void)stopSpacedRepetition
{
  objc_msgSend((id)qword_100035860, "removeObjectForKey:", CFSTR("lastVerificationEpoch"));
  objc_msgSend((id)qword_100035860, "removeObjectForKey:", CFSTR("verificationEpochStartTime"));
  -[SpacedRepetitionManager writeConfig](self, "writeConfig");
}

- (BOOL)handleVerificationEpoch
{
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void **v9;
  uint64_t v10;
  Class (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v3 = -[SpacedRepetitionManager checkForVerificationEpoch](self, "checkForVerificationEpoch");
  if (!v3)
    return v3;
  NSLog(CFSTR("handling verification epoch"));
  v8 = 0;
  if (!sub_10001925C(-1, &v8))
  {
    NSLog(CFSTR("unable to get device state"));
    goto LABEL_7;
  }
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    NSLog(CFSTR("biometric state is NOT armed. NOT advancing verification interval."));
    goto LABEL_8;
  }
  if (dword_100035850 == 2)
  {
    NSLog(CFSTR("spaced repetition is disabled. NOT performing verification."));
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_1000046A8;
  v18 = sub_1000046B8;
  v4 = (void *)qword_100035890;
  v19 = qword_100035890;
  if (!qword_100035890)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000046C4;
    v12 = &unk_10002CBE8;
    v13 = &v14;
    sub_1000046C4((uint64_t)&v9);
    v4 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  v5 = objc_msgSend(v4, "availableDevices");
  if (!objc_msgSend(v5, "count"))
  {
    NSLog(CFSTR("could not find a biometric device for verification"));
    goto LABEL_8;
  }
  NSLog(CFSTR("discarding bio for verification"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_1000046A8;
  v18 = sub_1000046B8;
  v6 = (void *)qword_1000358A0;
  v19 = qword_1000358A0;
  if (!qword_1000358A0)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1000047BC;
    v12 = &unk_10002CBE8;
    v13 = &v14;
    sub_1000047BC((uint64_t)&v9);
    v6 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  v3 = objc_msgSend(objc_msgSend(v6, "deviceWithDescriptor:error:", objc_msgSend(v5, "objectAtIndexedSubscript:", 0), 0), "dropAllUnlockTokensWithError:", 0);
  if (v3)
  {
    if (!-[SpacedRepetitionManager commitNextVerificationEpoch](self, "commitNextVerificationEpoch"))
      -[SpacedRepetitionManager stopSpacedRepetition](self, "stopSpacedRepetition");
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)setupNextTimer
{
  uint64_t v3;
  uint64_t v4;
  time_t v5;
  uint64_t v6;
  uint64_t v7;
  time_t v9;
  _QWORD block[6];

  if (dword_100035850 == 2)
  {
    NSLog(CFSTR("stopping verification services, spaced repetition mode disabled"), a2);
    return 0;
  }
  v3 = -[SpacedRepetitionManager getNextVerificationEpoch](self, "getNextVerificationEpoch");
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = time(0);
  if (v5 >= -[SpacedRepetitionManager getSpacedRepetitionTimeout](self, "getSpacedRepetitionTimeout") + v4)
  {
    v9 = time(0);
    NSLog(CFSTR("spaced repetition has timed out: %lu secs"), v9 - v4);
    -[SpacedRepetitionManager stopSpacedRepetition](self, "stopSpacedRepetition");
    return 0;
  }
  if (dword_100035850 == 1)
    v6 = 20;
  else
    v6 = 60;
  v7 = v4 - time(0);
  if (v6 > v7)
    v7 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004408;
  block[3] = &unk_10002CBC0;
  block[4] = self;
  block[5] = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (BOOL)repetitionPeriodTimer:(id)a3
{
  int v4;
  BOOL v5;

  v4 = dword_100035854;
  if (v4 != objc_msgSend(objc_msgSend(a3, "userInfo"), "intValue"))
    return 0;
  NSLog(CFSTR("verification timer[%d] fired"), dword_100035854);
  if (-[SpacedRepetitionManager checkForVerificationEpoch](self, "checkForVerificationEpoch")
    && -[SpacedRepetitionManager handleVerificationEpoch](self, "handleVerificationEpoch"))
  {
    NSLog(CFSTR("handled verification epoch successfully"));
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  -[SpacedRepetitionManager setupNextTimer](self, "setupNextTimer");
  return v5;
}

- (BOOL)beginNewRepetitionPeriod
{
  _BOOL4 v3;

  -[SpacedRepetitionManager setupIntervals](self, "setupIntervals");
  objc_msgSend((id)qword_100035860, "setObject:forKey:", &off_100032740, CFSTR("lastVerificationEpoch"));
  objc_msgSend((id)qword_100035860, "setObject:forKey:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", time(0)), CFSTR("verificationEpochStartTime"));
  v3 = -[SpacedRepetitionManager writeConfig](self, "writeConfig");
  if (v3)
  {
    NSLog(CFSTR("beginning new verification cycle..."));
    LOBYTE(v3) = -[SpacedRepetitionManager setupNextTimer](self, "setupNextTimer");
  }
  return v3;
}

- (BOOL)continueRepetitionPeriod
{
  -[SpacedRepetitionManager setupIntervals](self, "setupIntervals");
  return -[SpacedRepetitionManager setupNextTimer](self, "setupNextTimer");
}

@end
