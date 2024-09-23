@implementation _DASActivityRecorder

- (id)createOrUpdateActivity:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new(NSFetchRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v9, v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForUniqueRecord:](_DASActivityRecorder, "predicateForUniqueRecord:", v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    v15 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v15));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

    if (!v13)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder createNewActivity:](self, "createNewActivity:", v7));
    -[_DASActivityRecorder copyActivity:toManagedObject:](self, "copyActivity:toManagedObject:", v6, v13);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)deleteActivity:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSFetchRequest *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_opt_new(NSFetchRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v8, v6));
  -[NSFetchRequest setEntity:](v11, "setEntity:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForUniqueRecord:](_DASActivityRecorder, "predicateForUniqueRecord:", v7));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", v10);

  -[_DASActivityRecorder deleteActivites:moc:](self, "deleteActivites:moc:", v11, v6);
}

- (void)deleteActivites:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setFetchBatchSize:", 512);
  v7 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v6);

  v9 = 0;
  v8 = objc_msgSend(v5, "executeRequest:error:", v7, &v9);

}

- (id)createNewActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v5, v4));

  return v6;
}

- (id)entityName
{
  return CFSTR("Activity");
}

- (void)copyActivity:(id)a3 toManagedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  objc_msgSend(v6, "setName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startAfter"));
  objc_msgSend(v6, "setStartAfter:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startBefore"));
  objc_msgSend(v6, "setStartBefore:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submitDate"));
  objc_msgSend(v6, "setSubmitDate:", v10);

  objc_msgSend(v6, "setSchedulingPriority:", (__int16)objc_msgSend(v5, "schedulingPriority"));
  objc_msgSend(v5, "predictedOptimalScore");
  objc_msgSend(v6, "setPredictedOptimalScore:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predictedOptimalStartDate"));
  objc_msgSend(v6, "setPredictedOptimalStartDate:", v11);

  objc_msgSend(v6, "setSuspendable:", objc_msgSend(v5, "suspendable"));
  objc_msgSend(v6, "setTargetDevice:", (__int16)objc_msgSend(v5, "targetDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteDevice"));
  objc_msgSend(v6, "setRemoteDevice:", v12);

  objc_msgSend(v6, "setRequiresRemoteDeviceWake:", objc_msgSend(v5, "requiresRemoteDeviceWake"));
  objc_msgSend(v6, "setCancelAfterDeadline:", objc_msgSend(v5, "cancelAfterDeadline"));
  objc_msgSend(v6, "setDuration:", objc_msgSend(v5, "duration"));
  objc_msgSend(v6, "setTransferSize:", objc_msgSend(v5, "transferSize"));
  objc_msgSend(v6, "setTriggersRestart:", objc_msgSend(v5, "triggersRestart"));
  objc_msgSend(v6, "setRequiresPlugin:", objc_msgSend(v5, "requiresPlugin"));
  objc_msgSend(v6, "setRequiresNetwork:", objc_msgSend(v5, "requiresNetwork"));
  objc_msgSend(v6, "setRequiresDeviceInactivity:", objc_msgSend(v5, "requiresDeviceInactivity"));
  objc_msgSend(v6, "setRequiresInexpensiveNetworking:", objc_msgSend(v5, "requiresInexpensiveNetworking"));
  objc_msgSend(v6, "setRequestsApplicationLaunch:", objc_msgSend(v5, "requestsApplicationLaunch"));
  objc_msgSend(v6, "setRequestsExtensionLaunch:", objc_msgSend(v5, "requestsExtensionLaunch"));
  objc_msgSend(v6, "setSupportsAnyApplication:", objc_msgSend(v5, "supportsAnyApplication"));
  objc_msgSend(v6, "setCpuIntensive:", objc_msgSend(v5, "cpuIntensive"));
  objc_msgSend(v6, "setDiskIntensive:", objc_msgSend(v5, "diskIntensive"));
  objc_msgSend(v6, "setMemoryIntensive:", objc_msgSend(v5, "memoryIntensive"));
  objc_msgSend(v6, "setBeforeUserIsActive:", objc_msgSend(v5, "beforeUserIsActive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleId"));
  objc_msgSend(v6, "setBundleID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rateLimitConfigurationName"));
  objc_msgSend(v6, "setRateLimitConfigurationName:", v14);

  objc_msgSend(v6, "setIsUpload:", objc_msgSend(v5, "isUpload"));
  objc_msgSend(v6, "setBudgeted:", objc_msgSend(v5, "budgeted"));
  objc_msgSend(v6, "setRelevancy:", objc_msgSend(v5, "relevancy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "launchReason"));
  objc_msgSend(v6, "setLaunchReason:", v15);

  objc_msgSend(v6, "setCurrentState:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extensionIdentifier"));
  objc_msgSend(v6, "setExtensionIdentifier:", v16);

  v28[0] = 0;
  v28[1] = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  objc_msgSend(v17, "getUUIDBytes:", v28);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v28, 16));
  objc_msgSend(v6, "setUuid:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relatedApplications"));
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relatedApplications"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0));
    objc_msgSend(v6, "setRelatedApplications:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "schedulerRecommendedApplications"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "schedulerRecommendedApplications"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, 0));
    objc_msgSend(v6, "setSchedulerRecommendedApplications:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0));
    objc_msgSend(v6, "setUserInfo:", v27);

  }
}

+ (id)predicateForUniqueRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForActivityWithName:](_DASActivityRecorder, "predicateForActivityWithName:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submitDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForActivityWithSubmitDate:](_DASActivityRecorder, "predicateForActivityWithSubmitDate:", v6));

  v11[0] = v7;
  v11[1] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));

  return v9;
}

+ (id)predicateForActivityWithSubmitDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -2.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", 2.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("submitDate > %@ AND submitDate < %@"), v5, v6));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  }

  return v7;
}

+ (id)predicateForActivityWithName:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@"), a3);
}

+ (id)predicateForPendingActivities
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("currentState == %d"), 0);
}

+ (id)predicateForStartedActivities
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("currentState == %d"), 1);
}

+ (id)predicateForLaunchActivities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestsApplicationLaunch == %d"), 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("requestsExtensionLaunch == %d"), 1));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v4));

  return v5;
}

- (id)fetchActivitiesUsingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSFetchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v9, v6));
  -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

  -[NSFetchRequest setPredicate:](v8, "setPredicate:", v7);
  -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 512);
  -[NSFetchRequest setFetchLimit:](v8, "setFetchLimit:", 512);
  v13 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v13));

  return v11;
}

- (id)fetchActivity:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityRecorder predicateForUniqueRecord:](_DASActivityRecorder, "predicateForUniqueRecord:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder fetchActivitiesUsingPredicate:context:](self, "fetchActivitiesUsingPredicate:context:", v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  return v9;
}

- (id)fetchAllActivities:(id)a3
{
  return -[_DASActivityRecorder fetchActivitiesUsingPredicate:context:](self, "fetchActivitiesUsingPredicate:context:", 0, a3);
}

- (id)getActivityFromManagedObject:(id)a3
{
  id v3;
  _DASActivity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = a3;
  v4 = objc_opt_new(_DASActivity);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  -[_DASActivity setName:](v4, "setName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startAfter"));
  -[_DASActivity setStartAfter:](v4, "setStartAfter:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startBefore"));
  -[_DASActivity setStartBefore:](v4, "setStartBefore:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "submitDate"));
  -[_DASActivity setSubmitDate:](v4, "setSubmitDate:", v8);

  -[_DASActivity setSchedulingPriority:](v4, "setSchedulingPriority:", (int)objc_msgSend(v3, "schedulingPriority"));
  objc_msgSend(v3, "predictedOptimalScore");
  -[_DASActivity setPredictedOptimalScore:](v4, "setPredictedOptimalScore:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "predictedOptimalStartDate"));
  -[_DASActivity setPredictedOptimalStartDate:](v4, "setPredictedOptimalStartDate:", v9);

  -[_DASActivity setSuspendable:](v4, "setSuspendable:", objc_msgSend(v3, "suspendable"));
  -[_DASActivity setTargetDevice:](v4, "setTargetDevice:", (int)objc_msgSend(v3, "targetDevice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteDevice"));
  -[_DASActivity setRemoteDevice:](v4, "setRemoteDevice:", v10);

  -[_DASActivity setRequiresRemoteDeviceWake:](v4, "setRequiresRemoteDeviceWake:", objc_msgSend(v3, "requiresRemoteDeviceWake"));
  -[_DASActivity setCancelAfterDeadline:](v4, "setCancelAfterDeadline:", objc_msgSend(v3, "cancelAfterDeadline"));
  -[_DASActivity setDuration:](v4, "setDuration:", objc_msgSend(v3, "duration"));
  -[_DASActivity setTransferSize:](v4, "setTransferSize:", objc_msgSend(v3, "transferSize"));
  -[_DASActivity setTriggersRestart:](v4, "setTriggersRestart:", objc_msgSend(v3, "triggersRestart"));
  -[_DASActivity setRequiresPlugin:](v4, "setRequiresPlugin:", objc_msgSend(v3, "requiresPlugin"));
  -[_DASActivity setRequiresNetwork:](v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
  -[_DASActivity setRequiresDeviceInactivity:](v4, "setRequiresDeviceInactivity:", objc_msgSend(v3, "requiresDeviceInactivity"));
  -[_DASActivity setRequiresInexpensiveNetworking:](v4, "setRequiresInexpensiveNetworking:", objc_msgSend(v3, "requiresInexpensiveNetworking"));
  -[_DASActivity setRequestsApplicationLaunch:](v4, "setRequestsApplicationLaunch:", objc_msgSend(v3, "requestsApplicationLaunch"));
  -[_DASActivity setRequestsExtensionLaunch:](v4, "setRequestsExtensionLaunch:", objc_msgSend(v3, "requestsExtensionLaunch"));
  -[_DASActivity setSupportsAnyApplication:](v4, "setSupportsAnyApplication:", objc_msgSend(v3, "supportsAnyApplication"));
  -[_DASActivity setCpuIntensive:](v4, "setCpuIntensive:", objc_msgSend(v3, "cpuIntensive"));
  -[_DASActivity setDiskIntensive:](v4, "setDiskIntensive:", objc_msgSend(v3, "diskIntensive"));
  -[_DASActivity setMemoryIntensive:](v4, "setMemoryIntensive:", objc_msgSend(v3, "memoryIntensive"));
  -[_DASActivity setBeforeUserIsActive:](v4, "setBeforeUserIsActive:", objc_msgSend(v3, "beforeUserIsActive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
  -[_DASActivity setBundleId:](v4, "setBundleId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rateLimitConfigurationName"));
  -[_DASActivity setRateLimitConfigurationName:](v4, "setRateLimitConfigurationName:", v12);

  -[_DASActivity setIsUpload:](v4, "setIsUpload:", objc_msgSend(v3, "isUpload"));
  -[_DASActivity setBudgeted:](v4, "setBudgeted:", objc_msgSend(v3, "budgeted"));
  -[_DASActivity setRelevancy:](v4, "setRelevancy:", objc_msgSend(v3, "relevancy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "launchReason"));
  -[_DASActivity setLaunchReason:](v4, "setLaunchReason:", v13);

  v14 = objc_alloc((Class)NSUUID);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid")));
  v16 = objc_msgSend(v14, "initWithUUIDBytes:", objc_msgSend(v15, "bytes"));
  -[_DASActivity setUuid:](v4, "setUuid:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extensionIdentifier"));
  -[_DASActivity setExtensionIdentifier:](v4, "setExtensionIdentifier:", v17);

  v18 = objc_opt_class(NSArray);
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(NSString), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "relatedApplications"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v20, v22, 0));
    -[_DASActivity setRelatedApplications:](v4, "setRelatedApplications:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "schedulerRecommendedApplications"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "schedulerRecommendedApplications"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v20, v25, 0));
    -[_DASActivity setSchedulerRecommendedApplications:](v4, "setSchedulerRecommendedApplications:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity validClassesForUserInfoSerialization](_DASActivity, "validClassesForUserInfoSerialization"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v28, v29, 0));
    -[_DASActivity setUserInfo:](v4, "setUserInfo:", v30);

  }
  return v4;
}

- (void)updateActivity:(id)a3 value:(int)a4 context:(id)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a4;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder fetchActivity:context:](self, "fetchActivity:context:"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setCurrentState:", v5);
    if ((v5 - 2) < 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v8, "setCompletedDate:", v9);
LABEL_6:

      goto LABEL_7;
    }
    if ((_DWORD)v5 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
      objc_msgSend(v8, "setStartDate:", v9);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)updateActivityStarted:(id)a3 context:(id)a4
{
  -[_DASActivityRecorder updateActivity:value:context:](self, "updateActivity:value:context:", a3, 1, a4);
}

- (void)updateActivityCompleted:(id)a3 context:(id)a4
{
  -[_DASActivityRecorder updateActivity:value:context:](self, "updateActivity:value:context:", a3, 2, a4);
}

- (void)updateActivityCanceled:(id)a3 context:(id)a4
{
  -[_DASActivityRecorder updateActivity:value:context:](self, "updateActivity:value:context:", a3, 3, a4);
}

- (void)deleteOldActivities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -432000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("currentState <= %@ AND startBefore <= %@"), &off_10016E600, v9));
  v6 = objc_alloc_init((Class)NSFetchRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v7, v4));
  objc_msgSend(v6, "setEntity:", v8);

  objc_msgSend(v6, "setPredicate:", v5);
  -[_DASActivityRecorder deleteActivites:moc:](self, "deleteActivites:moc:", v6, v4);

}

- (void)deleteActivitiesIfRequired:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSFetchRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v6, v4));
  objc_msgSend(v5, "setEntity:", v7);

  v8 = 0;
  if ((unint64_t)objc_msgSend(v4, "countForFetchRequest:error:", v5, &v8) >= 0x201)
    -[_DASActivityRecorder deleteActivites:moc:](self, "deleteActivites:moc:", v5, v4);

}

@end
