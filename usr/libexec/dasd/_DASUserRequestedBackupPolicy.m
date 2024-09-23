@implementation _DASUserRequestedBackupPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v3, "userRequestedBackupTask") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "requiresNetwork");
  }

  return v5;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (double)weightForActivity:(id)a3
{
  return 0.1;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[4];
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", self->_userRequestedBackup));
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("predicate");
  v7[0] = CFSTR("com.apple.das.userRequestedBackup");
  v7[1] = v2;
  v6[2] = CFSTR("deviceSet");
  v6[3] = CFSTR("mustWake");
  v7[2] = &off_10016E930;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 4));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v4;
}

- (_DASUserRequestedBackupPolicy)init
{
  _DASUserRequestedBackupPolicy *v2;
  _DASUserRequestedBackupPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContextualKeyPath *userRequestedBackup;
  uint64_t v7;
  NSArray *triggers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASUserRequestedBackupPolicy;
  v2 = -[_DASUserRequestedBackupPolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("User Requested Backup Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath](_DASUserRequestedBackupTaskManager, "userRequestedBackupKeyPath"));
    userRequestedBackup = v3->_userRequestedBackup;
    v3->_userRequestedBackup = (_CDContextualKeyPath *)v5;

    v7 = objc_claimAutoreleasedReturnValue(-[_DASUserRequestedBackupPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB9C8 != -1)
    dispatch_once(&qword_1001AB9C8, &stru_10015E8D0);
  return (id)qword_1001AB9D0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;

  v6 = a4;
  v9 = 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.das.userRequestedBackup")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", self->_userRequestedBackup));
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) != 0)
      v9 = 0;
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _DASPolicyResponseRationale *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKeyedSubscript:", self->_userRequestedBackup));
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backupTaskManager"));

  v11 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("User Requested Backup Policy"));
  v12 = objc_msgSend(v6, "userRequestedBackupTask");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    if (v13)
    {

    }
    else if ((objc_msgSend(v10, "activityEligibleForRunning:", v6) & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eligibleForRunning == %@"), &__kCFBooleanFalse));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v11, "addRationaleWithCondition:", v17);

      v16 = 33;
      goto LABEL_15;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("userRequestedBackup == %@"), v14));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v11, "addRationaleWithCondition:", v15);

  if ((_DWORD)v8)
  {
    if ((v12 & 1) != 0)
    {
      v16 = 67;
    }
    else if (objc_msgSend(v6, "requiresNetwork"))
    {
      v16 = 67;
    }
    else
    {
      v16 = 33;
    }
  }
  else if (v12)
  {
    v16 = 33;
  }
  else
  {
    v16 = 0;
  }
LABEL_15:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v16, v11, (double)0x384uLL));

  return v18;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
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

- (_CDContextualKeyPath)userRequestedBackup
{
  return self->_userRequestedBackup;
}

- (void)setUserRequestedBackup:(id)a3
{
  objc_storeStrong((id *)&self->_userRequestedBackup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRequestedBackup, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
