@implementation CADataTransformEngine

- (CADataTransformEngine)init
{
  CADataTransformEngine *v2;
  uint64_t v3;
  RecommendationPreferences *preferences;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v10.receiver = self;
  v10.super_class = (Class)CADataTransformEngine;
  v2 = -[CADataTransformEngine init](&v10, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](RecommendationPreferences, "sharedObject"));
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[CADataTransformEngine init]";
      v13 = 1024;
      v14 = 82;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error RecommendationPreferences init", buf, 0x12u);
    }

    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[CADataTransformEngine init]";
      v13 = 1024;
      v14 = 87;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error initializing CADataTransformEngine", buf, 0x12u);
    }

    return 0;
  }
  return v2;
}

- (BOOL)computeSnapshotValidity:(unint64_t)a3 snapshotTimestamp:(id)a4 validityThreshold:(unint64_t)a5
{
  double v7;

  objc_msgSend(a4, "timeIntervalSince1970");
  return v7 > (double)a3 && (unint64_t)v7 - a3 <= a5;
}

- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setDropped:", objc_msgSend(v6, "dropped") + objc_msgSend(v5, "dropped"));
  objc_msgSend(v6, "setNoBuf:", objc_msgSend(v6, "noBuf") + objc_msgSend(v5, "noBuf"));
  objc_msgSend(v6, "setNoResources:", objc_msgSend(v6, "noResources") + objc_msgSend(v5, "noResources"));
  objc_msgSend(v6, "setNoAck:", objc_msgSend(v6, "noAck") + objc_msgSend(v5, "noAck"));
  objc_msgSend(v6, "setChipModeError:", objc_msgSend(v6, "chipModeError") + objc_msgSend(v5, "chipModeError"));
  objc_msgSend(v6, "setExpired:", objc_msgSend(v6, "expired") + objc_msgSend(v5, "expired"));
  objc_msgSend(v6, "setTxFailure:", objc_msgSend(v6, "txFailure") + objc_msgSend(v5, "txFailure"));
  objc_msgSend(v6, "setFirmwareFreePacket:", objc_msgSend(v6, "firmwareFreePacket") + objc_msgSend(v5, "firmwareFreePacket"));
  objc_msgSend(v6, "setMaxRetries:", objc_msgSend(v6, "maxRetries") + objc_msgSend(v5, "maxRetries"));
  LODWORD(a3) = objc_msgSend(v5, "forceLifetimeExp");

  objc_msgSend(v6, "setForceLifetimeExp:", objc_msgSend(v6, "forceLifetimeExp") + a3);
}

- (void)findTxCompletionFailureWithMaxCount:(id)a3 andReply:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, unint64_t, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  const __CFString *v14;
  char *v15;
  char *v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, unint64_t, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v9 = 0;
  v10 = 0;
  v11 = 1;
  while (2)
  {
    switch(v11)
    {
      case 1:
        v12 = objc_msgSend(v5, "dropped");
        goto LABEL_13;
      case 2:
        v12 = objc_msgSend(v5, "noBuf");
        goto LABEL_13;
      case 3:
        v12 = objc_msgSend(v5, "noResources");
        goto LABEL_13;
      case 4:
        v12 = objc_msgSend(v5, "noAck");
        goto LABEL_13;
      case 5:
        v12 = objc_msgSend(v5, "chipModeError");
        goto LABEL_13;
      case 6:
        v12 = objc_msgSend(v5, "expired");
        goto LABEL_13;
      case 7:
        v12 = objc_msgSend(v5, "txFailure");
        goto LABEL_13;
      case 8:
        v12 = objc_msgSend(v5, "firmwareFreePacket");
        goto LABEL_13;
      case 9:
        v12 = objc_msgSend(v5, "maxRetries");
        goto LABEL_13;
      case 10:
        v12 = objc_msgSend(v5, "forceLifetimeExp");
LABEL_13:
        v13 = v10 >= v12;
        if (v10 <= v12)
          v10 = v12;
        if (!v13)
          v9 = v11;
        v14 = CFSTR("1");
        if (!v12)
          goto LABEL_18;
        goto LABEL_19;
      default:
LABEL_18:
        v14 = CFSTR("0");
LABEL_19:
        objc_msgSend(v7, "insertString:atIndex:", v14, 0);
        if (++v11 != 11)
          continue;
        v15 = (char *)objc_msgSend(v7, "length");
        if (v15)
        {
          v16 = v15 - 1;
          do
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v16, 1));
            objc_msgSend(v8, "appendString:", v17);

            --v16;
          }
          while (v16 != (char *)-1);
        }
        v18 = WALogCategoryDefaultHandle();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136446722;
          v21 = "-[CADataTransformEngine findTxCompletionFailureWithMaxCount:andReply:]";
          v22 = 1024;
          v23 = 181;
          v24 = 2112;
          v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:txStatusString: %@", (uint8_t *)&v20, 0x1Cu);
        }

        v6[2](v6, v9, v10, v8);
        return;
    }
  }
}

- (void)computeDPSRecoveryIndex:(id)a3 timestamps:(id)a4 andReply:(id)a5
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  unint64_t v38;
  CADataTransformEngine *v39;
  id v40;
  id v41;
  void (**v42)(id, uint64_t, id, uint64_t);
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v8 = a3;
  v43 = a4;
  v42 = (void (**)(id, uint64_t, id, uint64_t))a5;
  v39 = self;
  v9 = -[RecommendationPreferences dps_interrogation_sample_count](self->_preferences, "dps_interrogation_sample_count");
  v40 = objc_msgSend(v8, "dpsCounterSamplesCount");
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v41 = v8;
    v38 = v9;
    while (1)
    {
      v14 = v13;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dpsCounterSampleAtIndex:", v10));

      if (!v13)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "peerStats"));

      if (!v15)
      {
        v12 = 0;
        break;
      }
      v12 = v15;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "acCompletions"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v49;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v49 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v21, "ac")
              && objc_msgSend(v21, "durSinceLastSuccessfulComp") / 0x3E8 < v11 + 8)
            {
              v22 = v11 + 5;
              v23 = 1;
              goto LABEL_17;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          if (v18)
            continue;
          break;
        }
      }

      v10 = ++v11;
      v9 = v38;
      v8 = v41;
      if (v38 <= v11)
        goto LABEL_21;
    }
    v22 = 0;
    v23 = 0;
    v25 = 0;
    goto LABEL_39;
  }
  v13 = 0;
  v12 = 0;
LABEL_21:
  if ((unint64_t)v40 <= v9)
  {
    v22 = 0;
    v23 = 0;
    v25 = 1;
LABEL_39:
    v24 = v43;
    goto LABEL_42;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dpsCounterSamples"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));

  v24 = v43;
  if (!v27)
  {
    v13 = 0;
    v22 = 0;
    v23 = 0;
    v25 = 0;
    goto LABEL_42;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "peerStats"));

  if (!v28)
  {
    v12 = 0;
    v22 = 0;
    v23 = 0;
    v25 = 0;
    v13 = v27;
    goto LABEL_42;
  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("start")));
  if (!v29
    || (v30 = (void *)v29,
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("end"))),
        v31,
        v30,
        !v31))
  {
    v22 = 0;
    v23 = 0;
    v25 = 1;
LABEL_41:
    v13 = v27;
    v12 = v28;
    goto LABEL_42;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("start")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("end")));
  v34 = -[CADataTransformEngine computeDifferenceBetweenDates:end:](v39, "computeDifferenceBetweenDates:end:", v32, v33);

  if ((unint64_t)v34 <= v9)
  {
    v22 = 0;
    v23 = 0;
    v25 = 0;
    goto LABEL_41;
  }
  v41 = v8;
  if (v34 > (id)-[RecommendationPreferences dps_report_sent_after](v39->_preferences, "dps_report_sent_after"))
  {
    v22 = 0;
    v23 = 0;
    v25 = 0;
    v13 = v27;
    v12 = v28;
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "acCompletions"));
    v22 = (unint64_t)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v22)
    {
      v35 = *(_QWORD *)v45;
      while (2)
      {
        for (j = 0; j != (void *)v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v16);
          v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v37, "ac")
            && (unint64_t)v34 + 8 > objc_msgSend(v37, "durSinceLastSuccessfulComp") / 0x3E8uLL)
          {
            v22 = ((_DWORD)v34 + 5);
            v23 = 1;
            goto LABEL_44;
          }
        }
        v22 = (unint64_t)objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v22)
          continue;
        break;
      }
      v23 = 0;
LABEL_44:
      v13 = v27;
      v12 = v28;
LABEL_17:
      v24 = v43;
    }
    else
    {
      v23 = 0;
      v13 = v27;
      v12 = v28;
    }

    v25 = 1;
  }
  v8 = v41;
LABEL_42:
  v42[2](v42, v23, (id)v22, v25);

}

- (unint64_t)computeDifferenceBetweenDates:(id)a3 end:(id)a4
{
  double v4;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return (unint64_t)v4;
}

- (unint64_t)compareValues:(unint64_t)a3 second:(unint64_t)a4
{
  if (a4 <= a3)
    return a4 != a3;
  else
    return 2;
}

- (double)computePercentage:(unint64_t)a3 denomenator:(unint64_t)a4
{
  if (a4)
    return (double)a3 / (double)a4 * 100.0;
  else
    return 0.0;
}

- (BOOL)transformAndSubmitDPSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  _QWORD v23[4];
  id v24;
  CADataTransformEngine *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100072540;
  v23[3] = &unk_1000CDA60;
  v12 = v9;
  v24 = v12;
  v25 = self;
  v13 = v8;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  v15 = AnalyticsSendEventLazy(CFSTR("com.apple.wifi.dps.notification"), v23);
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
      v30 = 1024;
      v31 = 448;
      v19 = "%{public}s::%d:Submitted DPS metric (CA)";
      v20 = v18;
      v21 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
    v30 = 1024;
    v31 = 446;
    v19 = "%{public}s::%d:Failed sending DPS metric (CA)";
    v20 = v18;
    v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

- (BOOL)transformAndSubmitDNSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  _QWORD v23[4];
  id v24;
  CADataTransformEngine *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100074398;
  v23[3] = &unk_1000CDA60;
  v12 = v9;
  v24 = v12;
  v25 = self;
  v13 = v8;
  v26 = v13;
  v14 = v10;
  v27 = v14;
  v15 = AnalyticsSendEventLazy(CFSTR("com.apple.wifi.dns.notification"), v23);
  v16 = WALogCategoryDefaultHandle();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
      v30 = 1024;
      v31 = 793;
      v19 = "%{public}s::%d:Submitted DNS metric (CA)";
      v20 = v18;
      v21 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
    v30 = 1024;
    v31 = 791;
    v19 = "%{public}s::%d:Failed sending DNS metric (CA)";
    v20 = v18;
    v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

- (BOOL)transformAndSubmitSWMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  _QWORD v22[4];
  id v23;
  CADataTransformEngine *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_autoreleasePoolPush();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100077D14;
  v22[3] = &unk_1000CDA88;
  v12 = v9;
  v23 = v12;
  v24 = self;
  v13 = v8;
  v25 = v13;
  v14 = AnalyticsSendEventLazy(CFSTR("com.apple.wifi.sw.notification"), v22);
  v15 = WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
      v28 = 1024;
      v29 = 1044;
      v18 = "%{public}s::%d:Submitted SW metric (CA)";
      v19 = v17;
      v20 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
    v28 = 1024;
    v29 = 1042;
    v18 = "%{public}s::%d:Failed sending SW metric (CA)";
    v19 = v17;
    v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v14;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
