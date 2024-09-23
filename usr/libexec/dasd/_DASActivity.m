@implementation _DASActivity

+ (_DASActivity)activityWithDASBGSystemTask:(id)a3 withClientOffset:(double)a4
{
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v5 = a3;
  v6 = objc_msgSend(v5, "priority");
  if ((unint64_t)v6 < 2)
  {
    v7 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
    goto LABEL_7;
  }
  if (v6 == (id)2)
  {
    v7 = (uint64_t *)&_DASSchedulingPriorityUtility;
    goto LABEL_7;
  }
  if (v6 == (id)3)
  {
    v7 = (uint64_t *)&_DASSchedulingPriorityUserInitiated;
LABEL_7:
    v8 = *v7;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eligibleTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deadlineTime"));
  if (a4 == 0.0)
    goto LABEL_16;
  if (a4 == 64000000.0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));

    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v9 = (void *)v11;
LABEL_14:

    v10 = v12;
    goto LABEL_16;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", a4));

  objc_msgSend(v10, "timeIntervalSinceDate:", v14);
  if (v15 < 0.0)
  {
    v12 = v14;
    v9 = v12;
    goto LABEL_14;
  }
  v9 = v14;
LABEL_16:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  objc_msgSend(v5, "expected_duration");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v16, v8, (unint64_t)v17, v9, v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "related_applications"));
  objc_msgSend(v18, "setRelatedApplications:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
  objc_msgSend(v18, "setServiceName:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rateLimitConfigurationName"));
  objc_msgSend(v18, "setRateLimitConfigurationName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "involved_processes"));
  objc_msgSend(v18, "setInvolvedProcesses:", v22);

  objc_msgSend(v18, "setRunOnAppForeground:", objc_msgSend(v5, "runOnAppForeground"));
  objc_msgSend(v18, "setRequestsApplicationLaunch:", objc_msgSend(v5, "requestsApplicationLaunch"));
  objc_msgSend(v18, "setBudgeted:", objc_msgSend(v5, "duet_power_budgeted"));
  objc_msgSend(v18, "setBeforeApplicationLaunch:", objc_msgSend(v5, "beforeApplicationLaunch"));
  objc_msgSend(v18, "setDataBudgeted:", objc_msgSend(v5, "data_budgeted"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataBudgetName"));
  objc_msgSend(v18, "setClientDataBudgetName:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "group_name"));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "group_name"));
    objc_msgSend(v18, "setGroupName:", v25);

  }
  if (objc_msgSend(v5, "type") == (id)2)
  {
    objc_msgSend(v5, "interval");
    objc_msgSend(v18, "setInterval:");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "featureCodes"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "featureCodes"));
    objc_msgSend(v18, "setFeatureCodes:", v27);

  }
  if (objc_msgSend(v5, "requires_protection_class") == (id)1)
  {
    v28 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
  }
  else if (objc_msgSend(v5, "requires_protection_class") == (id)2)
  {
    v28 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](_DASFileProtection, "completeUnlessOpen"));
  }
  else
  {
    if (objc_msgSend(v5, "requires_protection_class") != (id)3)
      goto LABEL_29;
    v28 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUntilFirstUserAuthentication](_DASFileProtection, "completeUntilFirstUserAuthentication"));
  }
  v29 = (void *)v28;
  objc_msgSend(v18, "setFileProtection:", v28);

LABEL_29:
  objc_msgSend(v18, "setRequiresBuddyComplete:", objc_msgSend(v5, "requires_buddy_complete"));
  if (objc_msgSend(v5, "shouldWakeDevice"))
    objc_msgSend(v18, "setSchedulingPriority:", _DASSchedulingPriorityDefault);
  objc_msgSend(v18, "setShouldWakeDevice:", objc_msgSend(v5, "shouldWakeDevice"));
  objc_msgSend(v18, "setDarkWakeEligible:", objc_msgSend(v5, "power_nap"));
  objc_msgSend(v18, "setBeforeDaysFirstActivity:", objc_msgSend(v5, "app_refresh"));
  objc_msgSend(v18, "setRequiresSignificantUserInactivity:", objc_msgSend(v5, "requires_significant_user_inactivity"));
  objc_msgSend(v18, "setRequiresDeviceInactivity:", objc_msgSend(v5, "requiresUserInactivity"));
  objc_msgSend(v18, "setPreventDeviceSleep:", objc_msgSend(v5, "prevents_device_sleep"));
  objc_msgSend(v18, "setRequiresPlugin:", objc_msgSend(v5, "requiresExternalPower"));
  objc_msgSend(v18, "setTriggersRestart:", objc_msgSend(v5, "may_reboot_device"));
  if (objc_msgSend(v5, "resource_intensive"))
  {
    if (objc_msgSend(v5, "resources"))
    {
      objc_msgSend(v18, "setCpuIntensive:", (unint64_t)objc_msgSend(v5, "resources") & 1);
      objc_msgSend(v18, "setMemoryIntensive:", ((unint64_t)objc_msgSend(v5, "resources") >> 1) & 1);
      objc_msgSend(v18, "setDiskIntensive:", ((unint64_t)objc_msgSend(v5, "resources") >> 2) & 1);
      objc_msgSend(v18, "setAneIntensive:", ((unint64_t)objc_msgSend(v5, "resources") >> 3) & 1);
      objc_msgSend(v18, "setGpuIntensive:", ((unint64_t)objc_msgSend(v5, "resources") >> 4) & 1);
    }
    else
    {
      objc_msgSend(v18, "setCpuIntensive:", 1);
    }
  }
  objc_msgSend(v18, "setRequiresNetwork:", objc_msgSend(v5, "requires_network_connectivity"));
  objc_msgSend(v18, "setRequiresInexpensiveNetworking:", objc_msgSend(v5, "requires_inexpensive_network"));
  objc_msgSend(v18, "setRequiresUnconstrainedNetworking:", objc_msgSend(v5, "requires_unconstrained_network"));
  if (objc_msgSend(v5, "expected_network_download_size_bytes"))
    objc_msgSend(v18, "setDownloadSize:", (uint64_t)objc_msgSend(v5, "expected_network_download_size_bytes") / 1024);
  if (objc_msgSend(v5, "expected_network_upload_size_bytes"))
    objc_msgSend(v18, "setUploadSize:", (uint64_t)objc_msgSend(v5, "expected_network_upload_size_bytes") / 1024);
  objc_msgSend(v18, "setUserRequestedBackupTask:", objc_msgSend(v5, "user_requested_backup_task"));
  if (objc_msgSend(v5, "targetDevice") == (id)1)
  {
    v30 = 1;
  }
  else if (objc_msgSend(v5, "targetDevice") == (id)2)
  {
    v30 = 2;
  }
  else if (objc_msgSend(v5, "targetDevice") == (id)3)
  {
    v30 = 3;
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v18, "setTargetDevice:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteDevice"));
  objc_msgSend(v18, "setRemoteDevice:", v31);

  objc_msgSend(v18, "setRequiresRemoteDeviceWake:", objc_msgSend(v5, "requiresRemoteDeviceWake"));
  if (objc_msgSend(v5, "communicates_with_paired_device"))
    objc_msgSend(v18, "setTargetDevice:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "produced_result_identifiers"));
  objc_msgSend(v18, "setProducedResultIdentifiers:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependencies"));
  objc_msgSend(v18, "setDependencies:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskVolume"));
  objc_msgSend(v18, "setDiskVolume:", v34);

  if (objc_msgSend(v5, "run_on_motion_state") && (char *)objc_msgSend(v5, "run_on_motion_state") - 1 <= (char *)6)
    objc_msgSend(v18, "setMotionState:", objc_msgSend(v5, "run_on_motion_state"));
  if (objc_msgSend(v5, "backlogged"))
    objc_msgSend(v18, "setBacklogged:", objc_msgSend(v5, "backlogged"));
  if (objc_msgSend(v5, "type") == (id)3)
  {
    v35 = (void *)objc_opt_new(_DASFastPass);
    objc_msgSend(v18, "setFastPass:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processingTaskIdentifiers"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fastPass"));
    objc_msgSend(v37, "setProcessingTaskIdentifiers:", v36);

    v38 = objc_msgSend(v5, "semanticVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "fastPass"));
    objc_msgSend(v39, "setSemanticVersion:", v38);

    if (objc_msgSend(v5, "resource_intensive"))
    {
      objc_msgSend(v18, "setGpuIntensive:", 0);
      objc_msgSend(v18, "setAneIntensive:", 0);
      objc_msgSend(v18, "setDiskIntensive:", 0);
      objc_msgSend(v18, "setMemoryIntensive:", 0);
      objc_msgSend(v18, "setCpuIntensive:", 0);
      objc_msgSend(v18, "setRequiresDeviceInactivity:", 0);
    }
    objc_msgSend(v18, "setPreventDeviceSleep:", 1);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  v41 = objc_msgSend(v40, "mutableCopy");

  if (!v41)
    v41 = objc_alloc_init((Class)NSMutableDictionary);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "network_endpoint"));

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "network_endpoint"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](NWEndpoint, "endpointWithCEndpoint:", v43));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v44, kNWEndpointKey);

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "network_parameters"));
    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "network_parameters"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NWParameters parametersWithCParameters:](NWParameters, "parametersWithCParameters:", v46));
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v47, kNWParametersKey);

    }
  }
  if (objc_msgSend(v5, "resources"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourcesDescription"));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v48, _DASResourcesKey);

  }
  if (objc_msgSend(v5, "overrideRateLimiting"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "overrideRateLimiting")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v49, _DASOverrideRateLimitingKey);

  }
  if (objc_msgSend(v5, "magneticInterferenceSensitivity"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "magneticInterferenceSensitivity")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v50, _DASCTSMagneticInterferenceSensitivityKey);

  }
  if (objc_msgSend(v5, "mailFetch"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "mailFetch")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v51, _DASCTSMailFetchKey);

  }
  if (objc_msgSend(v5, "bypassPeakPower"))
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "bypassPeakPower")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v52, _DASCTSBypassPeakPowerPressureKey);

  }
  if (objc_msgSend(v5, "bypassBatteryAging"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "bypassBatteryAging")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v53, _DASCTSBypassBatteryAgingProtectionKey);

  }
  if (objc_msgSend(v5, "requiresMinimumBatteryLevel"))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "requiresMinimumBatteryLevel")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v54, _DASCTSMinBatteryLevelKey);

  }
  if (objc_msgSend(v5, "requiresMinimumDataBudgetPercentage"))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v5, "requiresMinimumDataBudgetPercentage") / 100.0));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v55, _DASCTSMinDataBudgetPercentRemainingKey);

  }
  if (objc_msgSend(v5, "blockRebootActivitiesForSU"))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "blockRebootActivitiesForSU")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v56, _DASCTSBlockRebootActivitiesForSUKey);

  }
  if (objc_msgSend(v5, "useStatisticalModelForTriggersRestart"))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "useStatisticalModelForTriggersRestart")));
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v57, _DASCTSUseStatisticalModelForRestartTasksKey);

  }
  if (objc_msgSend(v41, "count"))
    objc_msgSend(v18, "setUserInfo:", v41);

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper activityQueue](_DASBGSystemTaskHelper, "activityQueue"));
  objc_msgSend(v18, "setHandlerQueue:", v58);

  objc_msgSend(v18, "setDelayedStart:", 1);
  objc_msgSend(v18, "linkToBGSystemTask:", v5);
  v59 = v18;

  return (_DASActivity *)v59;
}

- (void)linkToBGSystemTask:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100065D44;
  v7[3] = &unk_10015E818;
  objc_copyWeak(&v8, &location);
  -[_DASActivity setStartHandler:](self, "setStartHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100065E98;
  v5[3] = &unk_10015E818;
  objc_copyWeak(&v6, &location);
  -[_DASActivity setSuspendHandler:](self, "setSuspendHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

@end
