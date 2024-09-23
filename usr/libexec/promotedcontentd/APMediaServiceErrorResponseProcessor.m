@implementation APMediaServiceErrorResponseProcessor

+ (id)processErrorsForContentDataItems:(id)a3 error:(id)a4 contextFingerprint:(id)a5 params:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  APJourneyDaemonMetricHelper *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(a3, "count");
  if (!v9 && !v12)
  {
    v13 = APLogForCategory(34);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Received empty batch from Media API.", buf, 2u);
    }

    v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APContentData createForServerUnfilledReason:placementType:contextIdentifier:](APContentData, "createForServerUnfilledReason:placementType:contextIdentifier:", 1025, 5, v15));

    v17 = -[APJourneyDaemonMetricHelper initWithContentData:]([APJourneyDaemonMetricHelper alloc], "initWithContentData:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v17, "requestFailedForBundleID:withCode:requestID:placement:placementType:", CFSTR("com.apple.AppStore"), 3304, v19, objc_msgSend(v11, "placement"), 5);

    objc_msgSend(v16, "setDiagnosticCode:", 1);
LABEL_16:
    v20 = v16;

    goto LABEL_17;
  }
  if (v9)
  {
    v20 = 0;
    v21 = 3300;
    v22 = 1010;
    switch((unint64_t)objc_msgSend(v9, "code"))
    {
      case 0xBB8uLL:
        goto LABEL_12;
      case 0xBB9uLL:
      case 0xBBBuLL:
      case 0xBBDuLL:
        v21 = 3302;
        v22 = 1023;
        goto LABEL_12;
      case 0xBBAuLL:
        v21 = 3301;
        v22 = 1022;
        goto LABEL_12;
      case 0xBBEuLL:
      case 0xBBFuLL:
        v21 = 3303;
        v22 = 1025;
LABEL_12:
        v23 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[APContentData createForServerUnfilledReason:placementType:contextIdentifier:](APContentData, "createForServerUnfilledReason:placementType:contextIdentifier:", v22, 5, v23));

        objc_msgSend(v16, "setDiagnosticCode:", 0);
        v17 = -[APJourneyDaemonMetricHelper initWithContentData:]([APJourneyDaemonMetricHelper alloc], "initWithContentData:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
        -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v17, "requestFailedForBundleID:withCode:requestID:placement:placementType:", CFSTR("com.apple.AppStore"), v21, v25, objc_msgSend(v11, "placement"), 5);

        goto LABEL_16;
      case 0xBC0uLL:
        goto LABEL_17;
      case 0xBC1uLL:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internalErrors"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100170DDC;
        v28[3] = &unk_100218B98;
        v29 = v10;
        v30 = v11;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v28);

        goto LABEL_15;
      default:
        APSimulateCrashNoKillProcess(5, CFSTR("Unexpected error code for error: %@"));
LABEL_15:
        v16 = 0;
        v17 = 0;
        break;
    }
    goto LABEL_16;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

@end
