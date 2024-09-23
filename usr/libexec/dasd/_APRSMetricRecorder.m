@implementation _APRSMetricRecorder

- (_APRSMetricRecorder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_APRSMetricRecorder;
  return -[_APRSMetricRecorder init](&v3, "init");
}

+ (id)sharedInstance
{
  if (qword_1001AB518 != -1)
    dispatch_once(&qword_1001AB518, &stru_10015DBF0);
  return (id)qword_1001AB520;
}

- (id)log
{
  if (qword_1001AB528 != -1)
    dispatch_once(&qword_1001AB528, &stru_10015DC10);
  return (id)qword_1001AB530;
}

- (void)reportEvent:(id)a3 forApp:(id)a4 forEvent:(unint64_t)a5
{
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *prewarmedApps;
  NSMutableDictionary *dockedApps;
  NSMutableDictionary *frozenApps;
  void *v28;
  void *v29;
  void *v30;
  _UNKNOWN **v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  NSMutableDictionary *v35;
  __int16 v36;
  id v37;

  v8 = a3;
  v9 = (NSMutableDictionary *)a4;
  if (a5 <= 2)
  {
    v10 = (&self->_prewarmedApps)[a5];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v9));
    if (v11)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Timeout")) & 1) != 0)
      {
        v12 = 0xFFFFFFFFLL;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startDate"));
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v12 = (int)(v15 / 60.0);

      }
      v29 = v11;
      v16 = objc_claimAutoreleasedReturnValue(-[_APRSMetricRecorder log](self, "log"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        v36 = 2112;
        v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Process %@ %@.", buf, 0x16u);
      }
      v32[0] = CFSTR("Type");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABEF8, "objectAtIndexedSubscript:", a5));
      v33[0] = v17;
      v33[1] = v9;
      v32[1] = CFSTR("BundleID");
      v32[2] = CFSTR("State");
      v33[2] = v8;
      v32[3] = CFSTR("Interval");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v12));
      v33[3] = v18;
      v19 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 4));

      v28 = (void *)v19;
      -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:](self, "sendAnalyticsLazyWithCommonFeilds:forEvent:", v19, CFSTR("com.apple.dasd.appResumeDetail"));
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v9);
      LODWORD(v17) = objc_msgSend(v8, "isEqualToString:", CFSTR("Launched"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABEF8, "objectAtIndexedSubscript:", a5));
      v21 = v20;
      if ((_DWORD)v17)
        v22 = CFSTR("LaunchCount");
      else
        v22 = CFSTR("NonLaunchCount");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", v22));

      v30 = v23;
      v31 = &off_10016E5D0;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:](self, "sendAnalyticsLazyWithCommonFeilds:forEvent:", v24, CFSTR("com.apple.dasd.appResumeStats"));

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        prewarmedApps = self->_prewarmedApps;
        *(_DWORD *)buf = 138412290;
        v35 = prewarmedApps;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting to CA prewarmedApps: %@", buf, 0xCu);
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        dockedApps = self->_dockedApps;
        *(_DWORD *)buf = 138412290;
        v35 = dockedApps;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting to CA dockedApps: %@", buf, 0xCu);
      }
      v11 = v29;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        frozenApps = self->_frozenApps;
        *(_DWORD *)buf = 138412290;
        v35 = frozenApps;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reporting to CA frozenApps: %@", buf, 0xCu);
      }

    }
  }

}

- (id)commonAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *kernelExperimentID;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "experimentID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CommonExperimentID"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "treatmentID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CommonTreatmentID"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "deploymentID")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CommonDeploymentID"));

  }
  kernelExperimentID = self->_kernelExperimentID;
  if (kernelExperimentID)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", kernelExperimentID, CFSTR("CommonKernelExperimentID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_kernelTreatmentID, CFSTR("CommonKernelTreatmentID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_kernelDeploymentID));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("CommonKernelDeploymentID"));

  }
  return v3;
}

- (void)sendAnalyticsLazyWithCommonFeilds:(id)a3 forEvent:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A2D4;
  v7[3] = &unk_10015DC38;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  AnalyticsSendEventLazy(v5, v7);

}

- (void)reportActivationTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  void *i;
  double v19;
  void *v20;
  void *v21;
  _APRSMetricRecorder *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v22 = self;
    v9 = (double)(unint64_t)v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)((double)(unint64_t)v8 * 0.25)));
    objc_msgSend(v5, "setObject:forKeyedSubscript:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)(v9 * 0.5)));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("activationTime50"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)(v9 * 0.75)));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("activationTime75"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (int)(v9 * 0.9)));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("activationTime90"));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      v17 = 0.0;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "doubleValue");
          v17 = v17 + v19;
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }
    else
    {
      v17 = 0.0;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17 / v9));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("activationTimeMean"));

    -[_APRSMetricRecorder sendAnalyticsLazyWithCommonFeilds:forEvent:](v22, "sendAnalyticsLazyWithCommonFeilds:forEvent:", v5, CFSTR("com.apple.dasd.appResumeHalfDayEvent"));
  }

}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (NSMutableDictionary)prewarmedApps
{
  return self->_prewarmedApps;
}

- (void)setPrewarmedApps:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmedApps, a3);
}

- (NSMutableDictionary)dockedApps
{
  return self->_dockedApps;
}

- (void)setDockedApps:(id)a3
{
  objc_storeStrong((id *)&self->_dockedApps, a3);
}

- (NSMutableDictionary)frozenApps
{
  return self->_frozenApps;
}

- (void)setFrozenApps:(id)a3
{
  objc_storeStrong((id *)&self->_frozenApps, a3);
}

- (NSString)kernelTreatmentID
{
  return self->_kernelTreatmentID;
}

- (void)setKernelTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_kernelTreatmentID, a3);
}

- (NSString)kernelExperimentID
{
  return self->_kernelExperimentID;
}

- (void)setKernelExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_kernelExperimentID, a3);
}

- (int)kernelDeploymentID
{
  return self->_kernelDeploymentID;
}

- (void)setKernelDeploymentID:(int)a3
{
  self->_kernelDeploymentID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelExperimentID, 0);
  objc_storeStrong((id *)&self->_kernelTreatmentID, 0);
  objc_storeStrong((id *)&self->_frozenApps, 0);
  objc_storeStrong((id *)&self->_dockedApps, 0);
  objc_storeStrong((id *)&self->_prewarmedApps, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
