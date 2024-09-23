@implementation _DASFileProtectionPolicy

- (BOOL)appliesToActivity:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fileProtection"));
  v4 = objc_msgSend(v3, "indicatesProtection");

  return v4;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDeviceLockStatus](_CDContextQueries, "keyPathForDeviceLockStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForKeybagLockStatus](_CDContextQueries, "keyPathForKeybagLockStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v4));

  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("predicate");
  v13[0] = CFSTR("com.apple.das.fileprotectionpolicy.statuschanged");
  v13[1] = v3;
  v12[2] = CFSTR("deviceSet");
  v12[3] = CFSTR("mustWake");
  v13[2] = &off_10016E7B0;
  v13[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));
  v14[0] = v6;
  v10[0] = CFSTR("identifier");
  v10[1] = CFSTR("predicate");
  v11[0] = CFSTR("com.apple.das.fileprotectionpolicy.kbstatuschanged");
  v11[1] = v5;
  v10[2] = CFSTR("deviceSet");
  v10[3] = CFSTR("mustWake");
  v11[2] = &off_10016E7B0;
  v11[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));

  return v8;
}

- (_DASFileProtectionPolicy)init
{
  _DASFileProtectionPolicy *v2;
  _DASFileProtectionPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  dispatch_queue_t v7;
  OS_dispatch_queue *handleUnlockQueue;
  NSObject *v9;
  _DASFileProtectionPolicy *v10;
  const __CFBoolean *v11;
  uint64_t v12;
  const __CFBoolean *v13;
  BOOL v14;
  _QWORD handler[4];
  _DASFileProtectionPolicy *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DASFileProtectionPolicy;
  v2 = -[_DASFileProtectionPolicy init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("File Protection Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASFileProtectionPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = dispatch_queue_create("com.apple.duetactivityscheduler.fileprotectionpolicy.queue", 0);
    handleUnlockQueue = v3->_handleUnlockQueue;
    v3->_handleUnlockQueue = (OS_dispatch_queue *)v7;

    v9 = v3->_handleUnlockQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000540EC;
    handler[3] = &unk_10015D9B8;
    v10 = v3;
    v17 = v10;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v3->_classCLockedToken, v9, handler);
    v11 = (const __CFBoolean *)MGCopyAnswer(CFSTR("PasswordConfigured"), 0);
    v13 = v11;
    if (v11)
      CFRelease(v11);
    v14 = kCFBooleanTrue == v13 && MKBDeviceUnlockedSinceBoot(v11, v12) == 0;
    v10->_isClassCLocked = v14;

  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000541E8;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB7A8 != -1)
    dispatch_once(&qword_1001AB7A8, block);
  return (id)qword_1001AB7B0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)deviceRecentlyLocked:(id)a3 since:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDeviceLockStatus](_CDContextQueries, "keyPathForDeviceLockStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForKeybagLockStatus](_CDContextQueries, "keyPathForKeybagLockStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));

  LOBYTE(v4) = objc_msgSend(v9, "BOOLValue");
  return v7 & (v4 ^ 1);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  _BOOL4 isClassCLocked;
  void *v9;
  void *v10;
  id v11;
  _DASPolicyResponseRationale *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSPredicate *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  _DASPolicyResponseRationale *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  isClassCLocked = self->_isClassCLocked;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForKeybagLockStatus](_CDContextQueries, "keyPathForKeybagLockStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("File Protection Policy"));
  if ((_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
      v18 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("classALocked == %@ && activityFileProtection == %@"), v16, v17);
LABEL_7:
      v22 = (void *)objc_claimAutoreleasedReturnValue(v18);
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v12, "addRationaleWithCondition:", v22);
      goto LABEL_8;
    }
  }
  if (isClassCLocked)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUntilFirstUserAuthentication](_DASFileProtection, "completeUntilFirstUserAuthentication"));
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (v21)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
      v18 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("classCLocked == %@ && activityFileProtection == %@"), v16, v17);
      goto LABEL_7;
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if (!v27)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (-[_DASFileProtectionPolicy deviceRecentlyLocked:since:](self, "deviceRecentlyLocked:since:", v7, v16)
    || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate")), v28, v28)
    || (v11 & 1) == 0 && (objc_msgSend(v6, "overdueAtDate:", v16) & 1) != 0)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_13;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  objc_msgSend(v31, "timeIntervalSinceDate:", v16);
  v33 = v32;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileProtection"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("classALocked == %@ && activityFileProtection == %@ && timeUntilDeadline == %@"), v17, v22, v34));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v12, "addRationaleWithCondition:", v35);

LABEL_8:
  v23 = 100;
  v24 = v12;
LABEL_13:

LABEL_15:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v23, v24, (double)0x384uLL));

  return v29;
}

- (BOOL)isClassCLocked
{
  return self->_isClassCLocked;
}

- (void)setIsClassCLocked:(BOOL)a3
{
  self->_isClassCLocked = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (BOOL)passwordConfigured
{
  return self->_passwordConfigured;
}

- (void)setPasswordConfigured:(BOOL)a3
{
  self->_passwordConfigured = a3;
}

- (int)classCLockedToken
{
  return self->_classCLockedToken;
}

- (void)setClassCLockedToken:(int)a3
{
  self->_classCLockedToken = a3;
}

- (OS_dispatch_queue)handleUnlockQueue
{
  return self->_handleUnlockQueue;
}

- (void)setHandleUnlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handleUnlockQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleUnlockQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
