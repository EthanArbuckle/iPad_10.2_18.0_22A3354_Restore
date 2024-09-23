@implementation MKBDeviceLockModelEducationalMode

+ (id)sharedLockModelWithUID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  MKBDeviceLockModelEducationalMode *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  if (qword_1000358E8 != -1)
    dispatch_once(&qword_1000358E8, &stru_10002CE30);
  v4 = (void *)qword_1000358E0;
  objc_sync_enter((id)qword_1000358E0);
  if (!objc_msgSend((id)qword_1000358E0, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3)))
  {
    v5 = -[MKBDeviceLockModelEducationalMode initWithUID:]([MKBDeviceLockModelEducationalMode alloc], "initWithUID:", v3);
    objc_msgSend((id)qword_1000358E0, "setObject:forKeyedSubscript:", v5, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  }
  v6 = objc_msgSend((id)qword_1000358E0, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_sync_exit(v4);
  return v6;
}

- (MKBDeviceLockModelEducationalMode)initWithUID:(unsigned int)a3
{
  return -[MKBDeviceLockModelEducationalMode initWithJournalPath:uid:](self, "initWithJournalPath:uid:", CFSTR("/private/var/keybags/LockoutState.plist"), *(_QWORD *)&a3);
}

- (MKBDeviceLockModelEducationalMode)initWithJournalPath:(id)a3 uid:(unsigned int)a4
{
  uint64_t v4;
  MKBDeviceLockModelEducationalMode *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)MKBDeviceLockModelEducationalMode;
  v6 = -[MKBDeviceLockModelEducationalMode init](&v8, "init");
  if (v6)
  {
    v6->_lockStatePath = (NSString *)objc_msgSend(a3, "copy");
    v6->_uid = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%d"), v4);
    v6->_persistentStateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilekeybag.devicelockmodel", 0);
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](v6, "_persistentStateQueue_loadLockState");
  }
  return v6;
}

- (void)dealloc
{
  NSObject *persistentStateQueue;
  objc_super v4;

  persistentStateQueue = self->_persistentStateQueue;
  if (persistentStateQueue)
    dispatch_release(persistentStateQueue);

  v4.receiver = self;
  v4.super_class = (Class)MKBDeviceLockModelEducationalMode;
  -[MKBDeviceLockModelEducationalMode dealloc](&v4, "dealloc");
}

- (void)notePasscodeEntryBegan
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E444;
  block[3] = &unk_10002CB98;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeEntryCancelled
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E4A4;
  block[3] = &unk_10002CB98;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeUnlockSucceeded
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E504;
  block[3] = &unk_10002CB98;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (void)notePasscodeUnlockFailed
{
  NSObject *persistentStateQueue;
  _QWORD block[5];

  persistentStateQueue = self->_persistentStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E564;
  block[3] = &unk_10002CB98;
  block[4] = self;
  dispatch_sync(persistentStateQueue, block);
}

- (BOOL)isPermanentlyBlocked
{
  NSObject *persistentStateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E600;
  v5[3] = &unk_10002CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isTemporarilyBlocked
{
  double v3;
  double v4;
  double v5;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[MKBDeviceLockModelEducationalMode timeUntilUnblockedSinceReferenceDate](self, "timeUntilUnblockedSinceReferenceDate");
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  NSObject *persistentStateQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E6E8;
  v5[3] = &unk_10002CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isWipePending
{
  NSObject *persistentStateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E78C;
  v5[3] = &unk_10002CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)failedPasscodeAttempts
{
  NSObject *persistentStateQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  persistentStateQueue = self->_persistentStateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E830;
  v5[3] = &unk_10002CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(persistentStateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_persistentStateQueue_beginSpeculativeFailureCharge
{
  unint64_t failedPasscodeAttempts;
  unint64_t v4;
  unint64_t v5;
  int v6;
  double v7;
  NSDictionary *v8;
  NSDictionary *v9;
  NSNumber *v10;
  const __CFString *v11;
  double v12;
  _QWORD v13[4];
  _QWORD v14[4];

  if (!self->_speculativePasscodeFailureChargeOutstanding)
  {
    self->_speculativePasscodeFailureChargeOutstanding = 1;
    failedPasscodeAttempts = self->_failedPasscodeAttempts;
    v4 = failedPasscodeAttempts + 1;
    self->_failedPasscodeAttempts = failedPasscodeAttempts + 1;
    v5 = failedPasscodeAttempts - 9;
    if (failedPasscodeAttempts - 9 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      v6 = 0;
      v7 = 60.0;
      switch(failedPasscodeAttempts)
      {
        case 5uLL:
          break;
        case 6uLL:
          v6 = 0;
          v7 = 300.0;
          break;
        case 7uLL:
          v6 = 0;
          v7 = 900.0;
          break;
        case 8uLL:
          v6 = 0;
          v7 = 3600.0;
          break;
        default:
          v7 = -1.0;
          v6 = 1;
          break;
      }
    }
    else
    {
      v6 = 0;
      v7 = 0.0;
    }
    if (self->_originalDefaultsForRollback)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MKBDeviceLockModelEducationalMode.m"), 188, CFSTR("We should not have rollback values when beginning a speculative failure charge, but we had %@"), self->_originalDefaultsForRollback);
    v13[0] = CFSTR("MKBDeviceLockPendingWipe");
    v14[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_pendingWipe);
    v13[1] = CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate");
    v14[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_unblockTime);
    v13[2] = CFSTR("MKBDeviceLockBlocked");
    v14[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_permanentlyBlocked);
    v13[3] = CFSTR("MKBDeviceLockFailedAttempts");
    v14[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_failedPasscodeAttempts);
    v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    self->_originalDefaultsForRollback = v8;
    v9 = v8;
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_failedPasscodeAttempts), CFSTR("MKBDeviceLockFailedAttempts"));
    if (v5 >= 0xFFFFFFFFFFFFFFFCLL)
    {
      if (v6)
      {
        -[NSDate timeIntervalSinceReferenceDate](+[NSDate distantFuture](NSDate, "distantFuture"), "timeIntervalSinceReferenceDate");
        -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate"));
        v10 = (NSNumber *)&__kCFBooleanTrue;
        v11 = CFSTR("MKBDeviceLockBlocked");
      }
      else
      {
        +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
        v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 + v12);
        v11 = CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate");
      }
      -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", v10, v11);
    }
    if (v4 >= 0xA)
      -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", &__kCFBooleanTrue, CFSTR("MKBDeviceLockPendingWipe"));
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
  }
}

- (void)_persistentStateQueue_cancelSpeculativeFailureCharge
{
  self->_speculativePasscodeFailureChargeOutstanding = 0;

  self->_originalDefaultsForRollback = 0;
}

- (void)_persistentStateQueue_rollbackSpeculativeFailureCharge
{
  if (self->_speculativePasscodeFailureChargeOutstanding)
  {
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", -[NSDictionary objectForKeyedSubscript:](self->_originalDefaultsForRollback, "objectForKeyedSubscript:", CFSTR("MKBDeviceLockPendingWipe")), CFSTR("MKBDeviceLockPendingWipe"));
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", -[NSDictionary objectForKeyedSubscript:](self->_originalDefaultsForRollback, "objectForKeyedSubscript:", CFSTR("MKBDeviceLockBlocked")), CFSTR("MKBDeviceLockBlocked"));
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", -[NSDictionary objectForKeyedSubscript:](self->_originalDefaultsForRollback, "objectForKeyedSubscript:", CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate")), CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate"));
    -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", -[NSDictionary objectForKeyedSubscript:](self->_originalDefaultsForRollback, "objectForKeyedSubscript:", CFSTR("MKBDeviceLockFailedAttempts")), CFSTR("MKBDeviceLockFailedAttempts"));
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
    -[MKBDeviceLockModelEducationalMode _persistentStateQueue_cancelSpeculativeFailureCharge](self, "_persistentStateQueue_cancelSpeculativeFailureCharge");
  }
}

- (void)_persistentStateQueue_unlockSucceeded
{
  -[MKBDeviceLockModelEducationalMode _persistentStateQueue_cancelSpeculativeFailureCharge](self, "_persistentStateQueue_cancelSpeculativeFailureCharge");
  -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", 0, CFSTR("MKBDeviceLockBlocked"));
  -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", 0, CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate"));
  -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", 0, CFSTR("MKBDeviceLockPendingWipe"));
  -[MKBDeviceLockModelEducationalMode _setLockStateValue:forKey:](self, "_setLockStateValue:forKey:", 0, CFSTR("MKBDeviceLockFailedAttempts"));
  -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
}

- (void)_persistentStateQueue_unlockFailed
{
  -[MKBDeviceLockModelEducationalMode _persistentStateQueue_cancelSpeculativeFailureCharge](self, "_persistentStateQueue_cancelSpeculativeFailureCharge");
  -[MKBDeviceLockModelEducationalMode _persistentStateQueue_loadLockState](self, "_persistentStateQueue_loadLockState");
}

- (void)_persistentStateQueue_loadLockState
{
  id v3;
  double v4;

  v3 = -[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", CFSTR("MKBDeviceLockBlockTimeIntervalSinceReferenceDate"), objc_opt_class(NSNumber));
  if (v3)
    objc_msgSend(v3, "doubleValue");
  else
    -[NSDate timeIntervalSinceReferenceDate](+[NSDate distantPast](NSDate, "distantPast"), "timeIntervalSinceReferenceDate");
  self->_unblockTime = v4;
  self->_pendingWipe = objc_msgSend(-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", CFSTR("MKBDeviceLockPendingWipe"), objc_opt_class(NSNumber)), "BOOLValue");
  self->_permanentlyBlocked = objc_msgSend(-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", CFSTR("MKBDeviceLockBlocked"), objc_opt_class(NSNumber)), "BOOLValue");
  self->_failedPasscodeAttempts = (unint64_t)objc_msgSend(-[MKBDeviceLockModelEducationalMode _lockStateValueForKey:ofType:](self, "_lockStateValueForKey:ofType:", CFSTR("MKBDeviceLockFailedAttempts"), objc_opt_class(NSNumber)), "unsignedIntegerValue");
}

- (void)_loadLockState
{
  NSMutableDictionary *v3;

  v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", self->_lockStatePath);
  self->_lockStateCache = v3;
  if (!v3)
    self->_lockStateCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
}

- (id)_lockStateValueForKey:(id)a3 ofType:(Class)a4
{
  NSMutableDictionary *lockStateCache;
  id v8;

  lockStateCache = self->_lockStateCache;
  if (!lockStateCache)
  {
    -[MKBDeviceLockModelEducationalMode _loadLockState](self, "_loadLockState");
    lockStateCache = self->_lockStateCache;
  }
  v8 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](lockStateCache, "objectForKeyedSubscript:", self->_uid), "objectForKeyedSubscript:", a3);
  if ((objc_opt_isKindOfClass(v8, a4) & 1) != 0)
    return v8;
  else
    return 0;
}

- (void)_setLockStateValue:(id)a3 forKey:(id)a4
{
  id v7;

  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lockStateCache, "objectForKeyedSubscript:", self->_uid);
  if (a3)
  {
    if (!v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lockStateCache, "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), self->_uid);
    objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_lockStateCache, "objectForKeyedSubscript:", self->_uid), "setObject:forKeyedSubscript:", a3, a4);
  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", a4);
  }
  -[NSMutableDictionary writeToFile:atomically:](self->_lockStateCache, "writeToFile:atomically:", self->_lockStatePath, 1);
  sync();
}

@end
