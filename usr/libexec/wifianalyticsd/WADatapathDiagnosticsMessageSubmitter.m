@implementation WADatapathDiagnosticsMessageSubmitter

- (WADatapathDiagnosticsMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  WADatapathDiagnosticsMessageSubmitter *v4;
  void *v5;
  objc_class *v6;
  SDRDiagnosticReporter *v7;
  SDRDiagnosticReporter *ABCReporter;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)WADatapathDiagnosticsMessageSubmitter;
  v4 = -[WADatapathDiagnosticsMessageSubmitter init](&v10, "init");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)qword_1000ED0D0;
  v15 = qword_1000ED0D0;
  if (!qword_1000ED0D0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100083B48;
    v11[3] = &unk_1000CD9D0;
    v11[4] = &v12;
    sub_100083B48((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  v7 = (SDRDiagnosticReporter *)objc_alloc_init(v6);
  ABCReporter = v4->_ABCReporter;
  v4->_ABCReporter = v7;

  v4->_groupTypeForThisSubmitter = a3;
  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    v18 = 136446722;
    v19 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    v20 = 1024;
    v21 = 81;
    v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", (uint8_t *)&v18, 0x1Cu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DPSR"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:](self, "submitDPEMessage:", v4));
LABEL_7:
    v13 = (void *)v10;
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SWFR"));

  if (v12)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:](self, "submitSlowWiFiMessage:", v4));
    goto LABEL_7;
  }
  v14 = WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    v18 = 136446722;
    v19 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    v20 = 1024;
    v21 = 90;
    v22 = 2112;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:No Processor for key %@", (uint8_t *)&v18, 0x1Cu);

  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)submitSlowWiFiMessage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  SDRDiagnosticReporter *ABCReporter;
  id v24;
  id v25;
  void *v26;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;

  v4 = a3;
  v5 = WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
    *(_DWORD *)buf = 136446722;
    v39 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
    v40 = 1024;
    v41 = 99;
    v42 = 2112;
    v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);

  }
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v4));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    v31 = v8;
    v32 = v4;
    if (objc_msgSend(v11, "hasSlowNotice"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "slowNotice"));
      v13 = objc_msgSend(v12, "recoveryReason");
      if (v13 > 0x11)
      {
        v19 = 0;
        v25 = 0;
        v24 = 0;
        v26 = 0;
        goto LABEL_10;
      }
      v14 = v13;
      v30 = v12;
    }
    else
    {
      v14 = 0;
      v30 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Slow WiFi")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("recoveryReason 0x%x"), v14));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](self->_ABCReporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("WiFi"), CFSTR("Slow WiFi"), v17, v18, CFSTR("wifianalyticsd"), 0));
    v20 = objc_alloc((Class)NSArray);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryRepresentation"));
    v22 = objc_msgSend(v20, "initWithObjects:", v21, 0);

    ABCReporter = self->_ABCReporter;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10007E3DC;
    v33[3] = &unk_1000CDCD0;
    v24 = v15;
    v34 = v24;
    v25 = v16;
    v35 = v25;
    -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:](ABCReporter, "snapshotWithSignature:duration:events:payload:actions:reply:", v19, v22, 0, 0, v33, 10.0);

    v26 = 0;
    v8 = v31;
    v4 = v32;
    v12 = v30;
  }
  else
  {
    v28 = WALogCategoryDefaultHandle();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
      v40 = 1024;
      v41 = 110;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", buf, 0x12u);
    }

    v36 = NSLocalizedFailureReasonErrorKey;
    v37 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v17));
    v19 = 0;
    v12 = 0;
    v25 = 0;
    v24 = 0;
  }

LABEL_10:
  objc_autoreleasePoolPop(v8);

  return v26;
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

- (int)findTxCompletionFailureWithMaxCount:(id)a3
{
  id v3;
  unsigned int v4;
  int v5;
  uint64_t i;
  int v7;

  v3 = a3;
  v4 = 0;
  v5 = 0;
  for (i = 1; ; ++i)
  {
    switch(i)
    {
      case 1:
        if (objc_msgSend(v3, "dropped") > v4)
        {
          v4 = objc_msgSend(v3, "dropped");
          v5 = 1;
        }
        break;
      case 2:
        if (objc_msgSend(v3, "noBuf") > v4)
        {
          v4 = objc_msgSend(v3, "noBuf");
          v5 = 2;
        }
        break;
      case 3:
        if (objc_msgSend(v3, "noResources") > v4)
        {
          v4 = objc_msgSend(v3, "noResources");
          v5 = 3;
        }
        break;
      case 4:
        if (objc_msgSend(v3, "noAck") > v4)
        {
          v4 = objc_msgSend(v3, "noAck");
          v5 = 4;
        }
        break;
      case 5:
        if (objc_msgSend(v3, "chipModeError") > v4)
        {
          v4 = objc_msgSend(v3, "chipModeError");
          v5 = 5;
        }
        break;
      case 6:
        if (objc_msgSend(v3, "expired") > v4)
        {
          v4 = objc_msgSend(v3, "expired");
          v5 = 6;
        }
        break;
      case 7:
        if (objc_msgSend(v3, "txFailure") > v4)
        {
          v4 = objc_msgSend(v3, "txFailure");
          v5 = 7;
        }
        break;
      case 8:
        if (objc_msgSend(v3, "firmwareFreePacket") > v4)
        {
          v4 = objc_msgSend(v3, "firmwareFreePacket");
          v5 = 8;
        }
        break;
      case 9:
        if (objc_msgSend(v3, "maxRetries") > v4)
        {
          v4 = objc_msgSend(v3, "maxRetries");
          v5 = 9;
        }
        break;
      case 10:
        if (objc_msgSend(v3, "forceLifetimeExp") <= v4)
        {
          if (v5)
            v7 = v5;
          else
            v7 = -1;
        }
        else
        {
          objc_msgSend(v3, "forceLifetimeExp");
          v7 = 10;
        }

        return v7;
      default:
        continue;
    }
  }
}

- (id)submitDPEMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  int v14;
  int v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  SDRDiagnosticReporter *ABCReporter;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v53;
  NSObject *v54;
  void *context;
  int v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;
  uint8_t v70[4];
  const char *v71;
  __int16 v72;
  int v73;
  _BYTE buf[32];
  void (*v75)(uint64_t);
  id v76;

  v59 = a3;
  v4 = WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "key"));
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 246;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);

  }
  context = objc_autoreleasePoolPush();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = sub_10007F2A0;
  v75 = sub_10007F2B0;
  v76 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_10007F2A0;
  v66 = sub_10007F2B0;
  v67 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v59));
  v60 = v7;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dpsEpiloge"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dpsEpiloge"));
      v11 = objc_msgSend(v10, "action");
      if ((v11 & 2) != 0)
      {
        v12 = WALogCategoryDefaultHandle();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          v72 = 1024;
          v73 = 268;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Slow DPS Reset", v70, 0x12u);
        }
        v14 = 0;
        v57 = 0;
        v15 = 0;
      }
      else if ((objc_msgSend(v10, "action") & 4) != 0)
      {
        v20 = WALogCategoryDefaultHandle();
        v13 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          v72 = 1024;
          v73 = 271;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Fast DPS Reset", v70, 0x12u);
        }
        v14 = 0;
        v57 = 0;
        v15 = 1;
      }
      else if ((objc_msgSend(v10, "action") & 0x40) != 0)
      {
        v21 = WALogCategoryDefaultHandle();
        v13 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          v72 = 1024;
          v73 = 274;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Symptoms DNS Reset", v70, 0x12u);
        }
        v14 = 0;
        v15 = 0;
        v57 = 1;
      }
      else
      {
        v16 = objc_msgSend(v10, "action");
        v17 = WALogCategoryDefaultHandle();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v13 = v18;
        if ((v16 & 0x80) == 0)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v70 = 136446466;
            v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
            v72 = 1024;
            v73 = 279;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:No DPE Action found", v70, 0x12u);
          }
          v19 = 0;
          goto LABEL_62;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          v72 = 1024;
          v73 = 277;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Symptoms DNS Reassoc", v70, 0x12u);
        }
        v57 = 0;
        v15 = 0;
        v14 = 1;
      }

      v56 = (v11 >> 1) & 1;
    }
    else
    {
      v14 = 0;
      v56 = 0;
      v57 = 0;
      v15 = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));

    v23 = WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v70 = 136446466;
        v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        v72 = 1024;
        v73 = 285;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found - snapshot submessage", v70, 0x12u);
      }

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
      v26 = 0;
      v27 = 0;
      v28 = 0;
      do
      {
        switch(v26)
        {
          case 0:
            v29 = objc_claimAutoreleasedReturnValue(-[NSObject txCompletionSnapshotBE](v25, "txCompletionSnapshotBE"));
            goto LABEL_35;
          case 1:
            v29 = objc_claimAutoreleasedReturnValue(-[NSObject txCompletionSnapshotBK](v25, "txCompletionSnapshotBK"));
            goto LABEL_35;
          case 2:
            v29 = objc_claimAutoreleasedReturnValue(-[NSObject txCompletionSnapshotVI](v25, "txCompletionSnapshotVI"));
            goto LABEL_35;
          case 3:
            v29 = objc_claimAutoreleasedReturnValue(-[NSObject txCompletionSnapshotVO](v25, "txCompletionSnapshotVO"));
LABEL_35:
            v30 = (void *)v29;

            v27 = v30;
            break;
          default:
            break;
        }
        if (v27)
        {
          if (v28)
            -[WADatapathDiagnosticsMessageSubmitter computeAggregateTxCompletionStatus:source:](self, "computeAggregateTxCompletionStatus:source:", v28, v27);
          else
            v28 = v27;
        }
        ++v26;
      }
      while (v26 != 4);
      v31 = -[WADatapathDiagnosticsMessageSubmitter findTxCompletionFailureWithMaxCount:](self, "findTxCompletionFailureWithMaxCount:", v28);

    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v70 = 136446466;
        v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        v72 = 1024;
        v73 = 319;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:snapshot submessage not found", v70, 0x12u);
      }
      v31 = 0xFFFFFFFFLL;
    }

    if (v15)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fDPS")));
      if ((_DWORD)v31 != -1)
      {
LABEL_47:
        v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TE%d"), v31));
LABEL_57:
        v35 = (void *)v32;
LABEL_58:
        v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v58));
        v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

        if ((v15 | v56) == 1)
        {
          v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v35));
          v39 = (void *)v63[5];
          v63[5] = v38;
          v40 = CFSTR("DPS.Stall");
        }
        else
        {
          v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", &stru_1000CF640));
          v39 = (void *)v63[5];
          v63[5] = v41;
          v40 = CFSTR("DNS.Stall");
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v40));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v63[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
        v13 = objc_claimAutoreleasedReturnValue(-[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](self->_ABCReporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("WiFi"), v10, v42, v43, CFSTR("wifianalyticsd"), 0));
        v44 = objc_alloc((Class)NSArray);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionaryRepresentation"));
        v46 = objc_msgSend(v44, "initWithObjects:", v45, 0);

        ABCReporter = self->_ABCReporter;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10007F2B8;
        v61[3] = &unk_1000CDCF8;
        v61[4] = buf;
        v61[5] = &v62;
        -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:](ABCReporter, "snapshotWithSignature:duration:events:payload:actions:reply:", v13, v46, 0, 0, v61, 10.0);

        v19 = 1;
LABEL_62:

        v48 = 0;
        goto LABEL_63;
      }
    }
    else
    {
      if (((v57 | v14 | v56 ^ 1) & 1) != 0)
      {
        v33 = CFSTR("None");
        if (v14)
          v33 = CFSTR("sDNS.Reassoc");
        if (v57)
          v34 = CFSTR("sDNS.Reset");
        else
          v34 = v33;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v34));
        v35 = 0;
        goto LABEL_58;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sDPS")));
      if ((_DWORD)v31 != -1)
        goto LABEL_47;
    }
    v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NoTE")));
    goto LABEL_57;
  }
  v53 = WALogCategoryDefaultHandle();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v70 = 136446466;
    v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    v72 = 1024;
    v73 = 261;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", v70, 0x12u);
  }

  v68 = NSLocalizedFailureReasonErrorKey;
  v69 = CFSTR("WAErrorCodeSubmissionModelFailure");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v10));
  v19 = 0;
LABEL_63:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(context);
  if (v19)
  {
    v49 = WALogCategoryDefaultHandle();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "key"));
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 372;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);

    }
  }

  return v48;
}

- (id)submitDPSRMessage:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  int v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  int v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  char v41;
  char v42;
  char v43;
  int v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  char v53;
  char v54;
  char v55;
  id v56;
  void *v57;
  int v58;
  id v59;
  NSObject *v60;
  const char *v61;
  id v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  char v74;
  void *j;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  unsigned int v83;
  id v84;
  NSObject *v85;
  _BOOL4 v86;
  id v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  void *v91;
  _BOOL4 v92;
  id v93;
  NSObject *v94;
  void *v95;
  BOOL v96;
  id v97;
  NSObject *v98;
  id v99;
  id v100;
  NSObject *v101;
  void *v102;
  void *v103;
  id v104;
  NSObject *v105;
  const __CFString *v106;
  const __CFString *v107;
  id v108;
  NSObject *v109;
  void *v110;
  id v111;
  NSObject *v112;
  void *v113;
  id v114;
  NSObject *v115;
  void *v116;
  id v117;
  uint64_t v118;
  id v119;
  NSObject *v120;
  _BOOL4 v121;
  unsigned int v122;
  void *v123;
  void *v124;
  BOOL v125;
  void *v126;
  void *v127;
  void *v128;
  _BYTE *v129;
  void *v130;
  void *v131;
  void *v132;
  _BYTE *v133;
  int64_t v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  _BOOL4 v139;
  int v140;
  unsigned int v141;
  _BOOL8 v142;
  uint64_t v143;
  unsigned int v144;
  void *v145;
  void *v146;
  BOOL v147;
  void *v148;
  void *v149;
  void *v150;
  _BYTE *v151;
  void *v152;
  void *v153;
  void *v154;
  _BYTE *v155;
  int64_t v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  unsigned int v161;
  void *v162;
  void *v163;
  BOOL v164;
  void *v165;
  void *v166;
  void *v167;
  _BYTE *v168;
  void *v169;
  void *v170;
  void *v171;
  _BYTE *v172;
  int64_t v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  _BYTE *v181;
  void *v182;
  void *v183;
  void *v184;
  _BYTE *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  unsigned int v206;
  void *v207;
  void *v208;
  BOOL v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  void *ii;
  void *v217;
  void *v218;
  BOOL v219;
  void *v220;
  void *v221;
  unsigned int v222;
  void *v223;
  void *v224;
  unsigned int v225;
  _BYTE *v226;
  void *v227;
  void *v228;
  id v229;
  id v230;
  NSObject *v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  void *v237;
  _BOOL4 v238;
  id v239;
  NSObject *v240;
  id v241;
  NSObject *v242;
  id v243;
  NSObject *v244;
  void *v245;
  void *v246;
  void *v247;
  id v248;
  __CFString *v249;
  __CFString *v250;
  id v251;
  NSObject *v252;
  id v253;
  NSObject *v254;
  id v255;
  NSObject *v256;
  id v257;
  id v258;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  int v265;
  id v266;
  NSObject *v267;
  void *v268;
  void *v269;
  id v270;
  void *v271;
  void *v272;
  void *v273;
  id v274;
  void *v275;
  void *v276;
  BOOL v277;
  void *v278;
  void *v279;
  void *v280;
  _BYTE *v281;
  void *v282;
  void *v283;
  void *v284;
  _BYTE *v285;
  uint64_t v286;
  unsigned int v287;
  id v288;
  NSObject *v289;
  void *v290;
  void *v291;
  void *v292;
  id v293;
  void *v294;
  void *v295;
  id v296;
  BOOL v297;
  id v298;
  NSObject *v299;
  void *v300;
  void *v301;
  id v302;
  void *v303;
  void *v304;
  void *v305;
  id v306;
  void *v307;
  void *v308;
  BOOL v309;
  void *v310;
  void *v311;
  void *v312;
  _BYTE *v313;
  void *v314;
  void *v315;
  void *v316;
  _BYTE *v317;
  uint64_t v318;
  unsigned int v319;
  id v320;
  NSObject *v321;
  void *v322;
  void *v323;
  void *v324;
  id v325;
  void *v326;
  void *v327;
  id v328;
  id v329;
  NSObject *v330;
  void *v331;
  void *v332;
  id v333;
  void *v334;
  void *v335;
  void *v336;
  id v337;
  void *v338;
  void *v339;
  BOOL v340;
  void *v341;
  void *v342;
  void *v343;
  _BYTE *v344;
  void *v345;
  void *v346;
  void *v347;
  _BYTE *v348;
  uint64_t v349;
  unsigned int v350;
  id v351;
  NSObject *v352;
  void *v353;
  void *v354;
  void *v355;
  id v356;
  void *v357;
  void *v358;
  id v359;
  id v360;
  NSObject *v361;
  id v362;
  NSObject *v363;
  id v364;
  NSObject *v365;
  int v366;
  int v367;
  id v368;
  NSObject *v369;
  int v370;
  id v371;
  NSObject *v372;
  const char *v373;
  id v374;
  id v375;
  NSObject *v376;
  id v377;
  NSObject *v378;
  BOOL v379;
  BOOL v380;
  uint64_t v381;
  int v382;
  id v383;
  NSObject *v384;
  id v385;
  NSObject *v386;
  const __CFString *v387;
  const __CFString *v388;
  void *v389;
  const __CFString *v390;
  uint64_t v391;
  void *v392;
  uint64_t v393;
  void *v394;
  void *v395;
  const __CFString *v396;
  void *v397;
  uint64_t v398;
  const __CFString *v399;
  const __CFString *v400;
  const __CFString *v401;
  const __CFString *v402;
  const __CFString *v403;
  void *v404;
  uint64_t v405;
  void *v406;
  uint64_t v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  id v412;
  void *v413;
  id v414;
  SDRDiagnosticReporter *ABCReporter;
  id v416;
  NSObject *v417;
  void *v418;
  id v419;
  id v421;
  id v422;
  NSObject *v423;
  _BOOL4 v424;
  unsigned int v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  _BOOL8 v432;
  _BOOL8 v433;
  _BOOL8 v434;
  _BOOL8 v435;
  int v436;
  int v437;
  int v438;
  void *context;
  int v440;
  _BOOL4 v441;
  int v442;
  int v443;
  int v444;
  void *v445;
  uint64_t v446;
  id v447;
  _BOOL4 v448;
  _BOOL4 v449;
  id v450;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  int v457;
  int v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  unsigned int v464;
  uint64_t v465;
  unsigned int v466;
  char v467;
  unsigned int v468;
  _BYTE *v469;
  int v470;
  char v471;
  char v472;
  unsigned int v473;
  id v474;
  char v475;
  char v476;
  char obj;
  void *obja;
  int64_t objb;
  int64_t objc;
  int64_t objd;
  char v482;
  char v483;
  char v484;
  unsigned int k;
  unsigned int m;
  unsigned int n;
  char v488;
  uint64_t v489;
  unint64_t v490;
  unint64_t v491;
  unint64_t v492;
  uint64_t v493;
  void *log;
  unsigned int logb;
  id loga;
  NSObject *logc;
  NSObject *logd;
  NSObject *loge;
  unint64_t v500;
  unsigned int v501;
  unint64_t v502;
  _QWORD v503[6];
  __int128 v504;
  __int128 v505;
  __int128 v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  uint64_t v520;
  uint64_t *v521;
  uint64_t v522;
  uint64_t (*v523)(uint64_t, uint64_t);
  void (*v524)(uint64_t);
  id v525;
  uint64_t v526;
  uint64_t *v527;
  uint64_t v528;
  uint64_t (*v529)(uint64_t, uint64_t);
  void (*v530)(uint64_t);
  id v531;
  NSErrorUserInfoKey v532;
  const __CFString *v533;
  uint8_t buf[4];
  const char *v535;
  __int16 v536;
  int v537;
  __int16 v538;
  _BYTE v539[10];
  _BYTE v540[20];
  _BYTE v541[10];
  _BYTE v542[10];
  __int16 v543;
  _BOOL4 v544;
  __int16 v545;
  _BOOL4 v546;
  _BYTE v547[128];
  _BYTE v548[128];
  _BYTE v549[128];
  _BYTE v550[128];
  NSErrorUserInfoKey v551;
  const __CFString *v552;

  v450 = a3;
  v3 = WALogCategoryDefaultHandle();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v450, "key"));
    *(_DWORD *)buf = 136446722;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 380;
    v538 = 2112;
    *(_QWORD *)v539 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting to submit: %@", buf, 0x1Cu);

  }
  context = objc_autoreleasePoolPush();
  v526 = 0;
  v527 = &v526;
  v528 = 0x3032000000;
  v529 = sub_10007F2A0;
  v530 = sub_10007F2B0;
  v531 = 0;
  v520 = 0;
  v521 = &v520;
  v522 = 0x3032000000;
  v523 = sub_10007F2A0;
  v524 = sub_10007F2B0;
  v525 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v450));
  v452 = v6;
  if (!v6)
  {
    v422 = WALogCategoryDefaultHandle();
    v423 = objc_claimAutoreleasedReturnValue(v422);
    if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 469;
      _os_log_impl((void *)&_mh_execute_header, v423, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating data to send to ABC", buf, 0x12u);
    }

    v551 = NSLocalizedFailureReasonErrorKey;
    v552 = CFSTR("WAErrorCodeSubmissionModelFailure");
    v445 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v552, &v551, 1));
    v395 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9007, v445));
    v454 = 0;
    v455 = 0;
    v456 = 0;
    goto LABEL_479;
  }
  v474 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "stallNotifications"));
  v449 = objc_msgSend(v7, "count") != 0;

  if (v449)
  {
    v518 = 0u;
    v519 = 0u;
    v516 = 0u;
    v517 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "stallNotifications"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v516, v550, 16);
    if (!v9)
      goto LABEL_13;
    v10 = *(_QWORD *)v517;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v517 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v516 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v12, "symptom"))
        {
          v425 = objc_msgSend(v12, "problemAC");
          v13 = WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
            v536 = 1024;
            v537 = 479;
            v538 = 1024;
            *(_DWORD *)v539 = v425;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found first DPS on AC bitfield %x", buf, 0x18u);
          }

          v438 = 1;
LABEL_17:

          v514 = 0u;
          v515 = 0u;
          v512 = 0u;
          v513 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "stallNotifications"));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v512, v549, 16);
          if (!v16)
          {
            v488 = 0;
            v482 = 0;
            LOBYTE(v470) = 0;
            v467 = 0;
            v471 = 0;
            v475 = 0;
            goto LABEL_53;
          }
          v488 = 0;
          v482 = 0;
          v470 = 0;
          v467 = 0;
          v471 = 0;
          v475 = 0;
          v17 = *(_QWORD *)v513;
          while (2)
          {
            v18 = 0;
LABEL_20:
            if (*(_QWORD *)v513 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v512 + 1) + 8 * v18);
            v20 = WALogCategoryDefaultHandle();
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "stallNotifications"));
              v23 = objc_msgSend(v22, "indexOfObject:", v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "stallNotifications"));
              v25 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 136446978;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              v536 = 1024;
              v537 = 485;
              v538 = 2048;
              *(_QWORD *)v539 = v23;
              *(_WORD *)&v539[8] = 2048;
              *(_QWORD *)v540 = v25;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:stallNotification %lu of %lu", buf, 0x26u);

            }
            v26 = WALogCategoryDefaultHandle();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              v536 = 1024;
              v537 = 486;
              v538 = 2112;
              *(_QWORD *)v539 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WiFiAnalyticsAWDWiFiDPSNotification[]: %@", buf, 0x1Cu);
            }

            if (objc_msgSend(v19, "symptom"))
            {
              if (objc_msgSend(v19, "symptom") == 2)
              {
                v28 = WALogCategoryDefaultHandle();
                v29 = objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  v536 = 1024;
                  v537 = 498;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found User Toggle WiFi Off", buf, 0x12u);
                }

                v488 = 1;
                goto LABEL_42;
              }
              if (objc_msgSend(v19, "symptom") == 3)
              {
                v31 = WALogCategoryDefaultHandle();
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  v536 = 1024;
                  v537 = 502;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** Found User Toggle WiFi On", buf, 0x12u);
                }

                v488 = 0;
LABEL_42:
                v482 = 1;
              }
            }
            else if ((objc_msgSend(v19, "problemAC") & 1) != 0)
            {
              v475 = 1;
            }
            else if ((objc_msgSend(v19, "problemAC") & 2) != 0)
            {
              v471 = 1;
            }
            else if ((objc_msgSend(v19, "problemAC") & 4) != 0)
            {
              v467 = 1;
            }
            else
            {
              if ((objc_msgSend(v19, "problemAC") & 8) != 0)
                v30 = 1;
              else
                v30 = v470;
              v470 = v30;
            }
            if (v16 == (id)++v18)
            {
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v512, v549, 16);
              if (!v16)
              {
LABEL_53:

                v429 = 0;
                v440 = v488 & 1;
                v35 = v482 & 1;
                v442 = v470 & 1;
                v444 = v467 & 1;
                LODWORD(v446) = v471 & 1;
                HIDWORD(v446) = v475 & 1;
                goto LABEL_54;
              }
              continue;
            }
            goto LABEL_20;
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v516, v550, 16);
      if (!v9)
      {
LABEL_13:
        v425 = 0;
        v438 = 0;
        goto LABEL_17;
      }
    }
  }
  v33 = WALogCategoryDefaultHandle();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 510;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}s::%d:Missing DPS Notificaiton", buf, 0x12u);
  }

  v440 = 0;
  v35 = 0;
  v442 = 0;
  v444 = 0;
  v446 = 0;
  v425 = 0;
  v438 = 0;
  v429 = 1;
LABEL_54:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResults"));
  v448 = objc_msgSend(v36, "count") != 0;

  if (!v448)
  {
    v47 = WALogCategoryDefaultHandle();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 566;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Missing Probe result", buf, 0x12u);
    }
    v49 = 0;
    v424 = 0;
    v436 = 0;
    v437 = 0;
    v428 = 1;
    goto LABEL_137;
  }
  v453 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResultAtIndex:", 0));
  v37 = WALogCategoryDefaultHandle();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 519;
    v538 = 2112;
    *(_QWORD *)v539 = v453;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:**** First Probe result %@", buf, 0x1Cu);
  }

  if (objc_msgSend(v453, "hasRttGatewayBE")
    && objc_msgSend(v453, "rttGatewayBE")
    && objc_msgSend(v453, "hasRttGatewayBK")
    && objc_msgSend(v453, "rttGatewayBK")
    && objc_msgSend(v453, "hasRttGatewayVO")
    && objc_msgSend(v453, "rttGatewayVO")
    && objc_msgSend(v453, "hasRttGatewayVI")
    && objc_msgSend(v453, "rttGatewayVI"))
  {
    v39 = WALogCategoryDefaultHandle();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 525;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results All successfull, conflicts DPS Notificaiton", buf, 0x12u);
    }
    v437 = 0;
  }
  else
  {
    if (!objc_msgSend(v453, "hasRttGatewayBE")
      || objc_msgSend(v453, "rttGatewayBE")
      || !objc_msgSend(v453, "hasRttGatewayBK")
      || objc_msgSend(v453, "rttGatewayBK")
      || !objc_msgSend(v453, "hasRttGatewayVO")
      || objc_msgSend(v453, "rttGatewayVO")
      || !objc_msgSend(v453, "hasRttGatewayVI")
      || objc_msgSend(v453, "rttGatewayVI"))
    {
      v437 = 0;
      goto LABEL_78;
    }
    v421 = WALogCategoryDefaultHandle();
    v40 = objc_claimAutoreleasedReturnValue(v421);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 531;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results All AC blocked, confirm DPS Notificaiton", buf, 0x12u);
    }
    v437 = 1;
  }

LABEL_78:
  if (objc_msgSend(v453, "hasRttGatewayBE")
    && (!objc_msgSend(v453, "rttGatewayBE") ? (v41 = BYTE4(v446)) : (v41 = 0), (v41 & 1) != 0)
    || objc_msgSend(v453, "hasRttGatewayBE")
    && (!objc_msgSend(v453, "rttGatewayBK") ? (v42 = v446) : (v42 = 0), (v42 & 1) != 0)
    || objc_msgSend(v453, "hasRttGatewayBE")
    && (!objc_msgSend(v453, "rttGatewayVO") ? (v43 = v444) : (v43 = 0), (v43 & 1) != 0)
    || objc_msgSend(v453, "hasRttGatewayBE")
    && (!objc_msgSend(v453, "rttGatewayVI") ? (v44 = v442) : (v44 = 0), v44 == 1))
  {
    v45 = WALogCategoryDefaultHandle();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 540;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:Probe results confirm DPS Notificaiton", buf, 0x12u);
    }

    v436 = 1;
  }
  else
  {
    v436 = 0;
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResults"));
  v51 = (unint64_t)objc_msgSend(v50, "count") > 1;

  if (!v51)
  {
    v424 = 0;
    v448 = 0;
    v428 = 0;
    goto LABEL_139;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResults"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResultAtIndex:", (char *)objc_msgSend(v52, "count") - 1));

  v424 = objc_msgSend(v49, "hasRttGatewayBE")
      && objc_msgSend(v49, "rttGatewayBE")
      && objc_msgSend(v49, "hasRttGatewayBK")
      && objc_msgSend(v49, "rttGatewayBK")
      && objc_msgSend(v49, "hasRttGatewayVO")
      && objc_msgSend(v49, "rttGatewayVO")
      && objc_msgSend(v49, "hasRttGatewayVI")
      && objc_msgSend(v49, "rttGatewayVI") != 0;
  if (!objc_msgSend(v49, "hasRttGatewayBE")
    || (objc_msgSend(v49, "rttGatewayBE") ? (v53 = BYTE4(v446)) : (v53 = 0), (v53 & 1) == 0))
  {
    if (!objc_msgSend(v49, "hasRttGatewayBE")
      || (objc_msgSend(v49, "rttGatewayBK") ? (v54 = v446) : (v54 = 0), (v54 & 1) == 0))
    {
      if (!objc_msgSend(v49, "hasRttGatewayBE")
        || (objc_msgSend(v49, "rttGatewayVO") ? (v55 = v444) : (v55 = 0), (v55 & 1) == 0))
      {
        if (!objc_msgSend(v49, "hasRttGatewayBE")
          || !objc_msgSend(v49, "rttGatewayVI")
          || !v442)
        {
          v448 = 0;
          v428 = 0;
          goto LABEL_138;
        }
      }
    }
  }
  v56 = WALogCategoryDefaultHandle();
  v48 = objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 559;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:Last Probe results show recovered DPS", buf, 0x12u);
  }
  v428 = 0;
LABEL_137:

LABEL_138:
  v453 = v49;
LABEL_139:
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsEpiloge"));

  if (!v57)
  {
    v430 = 0;
    v431 = 0;
    v426 = 0;
    v427 = 0;
    v443 = 0;
    v441 = 0;
    v447 = 0;
    v445 = 0;
    goto LABEL_227;
  }
  log = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsEpiloge"));
  v58 = v35;
  v468 = objc_msgSend(log, "action");
  if ((v468 & 2) != 0)
  {
    v59 = WALogCategoryDefaultHandle();
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 575;
      v61 = "%{public}s::%d:Found Action - DPS Watchdog";
LABEL_148:
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v61, buf, 0x12u);
      goto LABEL_149;
    }
    goto LABEL_149;
  }
  if ((objc_msgSend(log, "action") & 4) != 0)
  {
    v62 = WALogCategoryDefaultHandle();
    v60 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 578;
      v61 = "%{public}s::%d:Found Action - Fast DPS Watchdog";
      goto LABEL_148;
    }
LABEL_149:
    v441 = (v468 & 2) == 0;

    v58 = v35;
    goto LABEL_150;
  }
  v441 = 0;
LABEL_150:
  v466 = objc_msgSend(log, "action");
  if ((v466 & 8) != 0)
  {
    v63 = WALogCategoryDefaultHandle();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 583;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - DPS Watchdog but No WD Budget", buf, 0x12u);
    }

    v58 = v35;
  }
  v464 = objc_msgSend(log, "action");
  if ((v464 & 0x10) != 0)
  {
    v65 = WALogCategoryDefaultHandle();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 588;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - Fast DPS Watchdog but No WD Budget", buf, 0x12u);
    }

    v58 = v35;
  }
  if ((objc_msgSend(log, "action") & 0x20) != 0)
  {
    v67 = WALogCategoryDefaultHandle();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 593;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - User Changed", buf, 0x12u);
    }

    v58 = 1;
  }
  if (!objc_msgSend(log, "action"))
  {
    v69 = WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 597;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Action - None", buf, 0x12u);
    }

  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "associationChanges"));
  v457 = v58;

  if (!v71)
  {
    v476 = 0;
    v74 = 0;
    v472 = 0;
    obj = 0;
    v483 = 0;
    goto LABEL_212;
  }
  v510 = 0u;
  v511 = 0u;
  v508 = 0u;
  v509 = 0u;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "associationChanges"));
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v508, v548, 16);
  if (!v73)
  {
    v476 = 0;
    v74 = 0;
    v472 = 0;
    obj = 0;
    v483 = 0;
    goto LABEL_211;
  }
  v476 = 0;
  v74 = 0;
  v472 = 0;
  obj = 0;
  v483 = 0;
  v489 = *(_QWORD *)v509;
  do
  {
    for (j = 0; j != v73; j = (char *)j + 1)
    {
      if (*(_QWORD *)v509 != v489)
        objc_enumerationMutation(v72);
      v76 = *(void **)(*((_QWORD *)&v508 + 1) + 8 * (_QWORD)j);
      v77 = WALogCategoryDefaultHandle();
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "associationChanges"));
        v80 = objc_msgSend(v79, "indexOfObject:", v76);
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "associationChanges"));
        v82 = objc_msgSend(v81, "count");
        *(_DWORD *)buf = 136446978;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 602;
        v538 = 2048;
        *(_QWORD *)v539 = v80;
        *(_WORD *)&v539[8] = 2048;
        *(_QWORD *)v540 = v82;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Change %lu of %lu", buf, 0x26u);

      }
      v83 = objc_msgSend(v76, "newBSSID");
      v84 = WALogCategoryDefaultHandle();
      v85 = objc_claimAutoreleasedReturnValue(v84);
      v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
      if (v83)
      {
        if (v86)
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 604;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - newBSSID - after link up we are associated to a different BSSID", buf, 0x12u);
        }
        v74 = 1;
        v483 = 1;
      }
      else if (v86)
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 608;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No change in BSSID", buf, 0x12u);
      }

      if (objc_msgSend(v76, "changedChannel"))
      {
        v87 = WALogCategoryDefaultHandle();
        v88 = objc_claimAutoreleasedReturnValue(v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 612;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedChannel", buf, 0x12u);
        }

        obj = 1;
      }
      if (objc_msgSend(v76, "changedMAC"))
      {
        v89 = WALogCategoryDefaultHandle();
        v90 = objc_claimAutoreleasedReturnValue(v89);
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 617;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedMAC - meaning user toggled WiFi", buf, 0x12u);
        }

        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResults"));
        v92 = (unint64_t)objc_msgSend(v91, "count") > 1;

        if (v92)
        {
          v93 = WALogCategoryDefaultHandle();
          v94 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
            v536 = 1024;
            v537 = 619;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Multiple probe results as well", buf, 0x12u);
          }

        }
        if ((v457 & 1) != 0)
        {
          v457 = 1;
          v74 = 1;
          goto LABEL_202;
        }
        v99 = WALogCategoryDefaultHandle();
        v98 = objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 622;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%{public}s::%d:changedMAC but userToggled isn't True?!", buf, 0x12u);
        }
        v457 = 1;
        v74 = 1;
      }
      else
      {
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResults"));
        v96 = objc_msgSend(v95, "count") == (id)1;

        if (v96)
        {
          v476 = 1;
          goto LABEL_202;
        }
        v97 = WALogCategoryDefaultHandle();
        v98 = objc_claimAutoreleasedReturnValue(v97);
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 630;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - changedMAC is false - probably involuntary link down", buf, 0x12u);
        }
        v476 = 1;
      }

LABEL_202:
      if (objc_msgSend(v76, "changedDNSPrimary"))
      {
        v100 = WALogCategoryDefaultHandle();
        v101 = objc_claimAutoreleasedReturnValue(v100);
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
          v536 = 1024;
          v537 = 636;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found Change - networkDidChange", buf, 0x12u);
        }

        v74 = 1;
        v472 = 1;
      }
    }
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v508, v548, 16);
  }
  while (v73);
LABEL_211:

LABEL_212:
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "qDpsStats"));

  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(log, "qDpsStats"));
    LODWORD(v431) = objc_msgSend(v103, "quickDpsResetRecommendation");
    v104 = WALogCategoryDefaultHandle();
    v105 = objc_claimAutoreleasedReturnValue(v104);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = CFSTR("NO");
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      *(_DWORD *)buf = 136446722;
      if ((_DWORD)v431)
        v106 = CFSTR("YES");
      v536 = 1024;
      v537 = 648;
      v538 = 2112;
      *(_QWORD *)v539 = v106;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- quickDpsResetRecommendation -- %@", buf, 0x1Cu);
    }

    if (objc_msgSend(v103, "screenStateOn"))
      v107 = CFSTR("ON");
    else
      v107 = CFSTR("OFF");
    v447 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v107));

    v108 = WALogCategoryDefaultHandle();
    v109 = objc_claimAutoreleasedReturnValue(v108);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 651;
      v538 = 2112;
      *(_QWORD *)v539 = v447;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- screenState -- %@", buf, 0x1Cu);
    }

    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "suppressedReasonAsString:", objc_msgSend(v103, "suppressedReason")));
    v445 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v110));

    v111 = WALogCategoryDefaultHandle();
    v112 = objc_claimAutoreleasedReturnValue(v111);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 654;
      v538 = 2112;
      *(_QWORD *)v539 = v445;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found qDpsStat -- suppressionReason -- %@", buf, 0x1Cu);
    }

  }
  else
  {
    LODWORD(v431) = 0;
    v447 = 0;
    v445 = 0;
  }

  v443 = (v468 >> 1) & 1;
  HIDWORD(v431) = v476 & 1;
  LODWORD(v430) = (v464 >> 4) & 1;
  HIDWORD(v430) = (v466 >> 3) & 1;
  LODWORD(v427) = obj & 1;
  HIDWORD(v427) = v472 & 1;
  LODWORD(v426) = v74 & 1;
  HIDWORD(v426) = v483 & 1;
  v35 = v457;
LABEL_227:
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "snapshot"));
  v458 = v35;

  if (v113)
  {
    v114 = WALogCategoryDefaultHandle();
    v115 = objc_claimAutoreleasedReturnValue(v114);
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 659;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found - snapshot submessage", buf, 0x12u);
    }

  }
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSamples"));
  v117 = objc_msgSend(v116, "count");

  v118 = (uint64_t)v117 - 1;
  if ((unint64_t)v117 > 5)
    v118 = 5;
  v500 = v118;
  v119 = WALogCategoryDefaultHandle();
  v120 = objc_claimAutoreleasedReturnValue(v119);
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 671;
    v538 = 2048;
    *(_QWORD *)v539 = v117;
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Iterating through %lu dpsCounterSamples", buf, 0x1Cu);
  }
  v121 = (unint64_t)v117 > 5;

  if ((unint64_t)v117 <= 5)
  {
    v432 = 0;
    v433 = 0;
    v434 = 0;
    v435 = 0;
    v139 = 0;
    v140 = 0;
    v454 = 0;
    v455 = 0;
    v456 = 0;
    v141 = 0;
    v449 = 0;
    v142 = v117 == 0;
    v143 = 1;
  }
  else
  {
    v122 = 0;
    v456 = 0;
    v490 = 0;
    while (1)
    {
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "peerStats"));
      v125 = (unint64_t)objc_msgSend(v124, "ccasCount") > v122;

      if (!v125)
        break;
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "peerStats"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "ccaAtIndex:", v122));
      v129 = objc_msgSend(v128, "residentTime");
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "peerStats"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "ccaAtIndex:", v122));
      v133 = objc_msgSend(v132, "residentTime");

      v134 = v129 - v133;
      if (v129 - v133 > v490)
      {
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "peerStats"));
        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "ccaAtIndex:", v122));
        v138 = objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "state"));

        v456 = (void *)v138;
        v490 = v134;
      }
      ++v122;
    }
    if (!v456)
    {
      v266 = WALogCategoryDefaultHandle();
      v267 = objc_claimAutoreleasedReturnValue(v266);
      if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR))
      {
        v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "peerStats"));
        v270 = objc_msgSend(v269, "ccasCount");
        v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "peerStats"));
        v273 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "ccas"));
        v274 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v273, "description"));
        *(_DWORD *)buf = 136446978;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 687;
        v538 = 2048;
        *(_QWORD *)v539 = v270;
        *(_WORD *)&v539[8] = 2112;
        *(_QWORD *)v540 = v274;
        _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median CCA not found nCCA %lu %@", buf, 0x26u);

      }
      for (k = 0; ; ++k)
      {
        v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "peerStats"));
        v277 = (unint64_t)objc_msgSend(v276, "ccasCount") > k;

        if (!v277)
          break;
        v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
        v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v278, "peerStats"));
        v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v279, "ccaAtIndex:", k));
        v281 = objc_msgSend(v280, "residentTime");
        v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v283 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "peerStats"));
        v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "ccaAtIndex:", k));
        v285 = objc_msgSend(v284, "residentTime");

        if (v500)
        {
          v286 = 0;
          objb = v281 - v285;
          v287 = 1;
          do
          {
            v288 = WALogCategoryDefaultHandle();
            v289 = objc_claimAutoreleasedReturnValue(v288);
            if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
            {
              logc = v289;
              v290 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v286));
              v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v290, "peerStats"));
              v292 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v291, "ccaAtIndex:", k));
              v293 = objc_msgSend(v292, "residentTime");
              v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v286));
              v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "peerStats"));
              v296 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v295, "ccaAtIndex:", k));
              *(_DWORD *)buf = 136448002;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              v536 = 1024;
              v537 = 691;
              v538 = 1024;
              *(_DWORD *)v539 = k;
              *(_WORD *)&v539[4] = 1024;
              *(_DWORD *)&v539[6] = v287 - 1;
              *(_WORD *)v540 = 2048;
              *(_QWORD *)&v540[2] = v490;
              *(_WORD *)&v540[10] = 2048;
              *(_QWORD *)&v540[12] = objb;
              *(_WORD *)v541 = 2048;
              *(_QWORD *)&v541[2] = v293;
              *(_WORD *)v542 = 2112;
              *(_QWORD *)&v542[2] = v296;
              v289 = logc;
              _os_log_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:CCA index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);

            }
            v286 = v287;
            v297 = v500 > v287++;
          }
          while (v297);
        }
      }
    }
    v144 = 0;
    v455 = 0;
    v491 = 0;
    while (1)
    {
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "peerStats"));
      v147 = (unint64_t)objc_msgSend(v146, "rssisCount") > v144;

      if (!v147)
        break;
      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "peerStats"));
      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "rssiAtIndex:", v144));
      v151 = objc_msgSend(v150, "residentTime");
      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "peerStats"));
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "rssiAtIndex:", v144));
      v155 = objc_msgSend(v154, "residentTime");

      v156 = v151 - v155;
      if (v151 - v155 > v491)
      {
        v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "peerStats"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "rssiAtIndex:", v144));
        v160 = objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "state"));

        v455 = (void *)v160;
        v491 = v156;
      }
      ++v144;
    }
    if (!v455)
    {
      v298 = WALogCategoryDefaultHandle();
      v299 = objc_claimAutoreleasedReturnValue(v298);
      if (os_log_type_enabled(v299, OS_LOG_TYPE_ERROR))
      {
        v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v300, "peerStats"));
        v302 = objc_msgSend(v301, "rssisCount");
        v303 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "peerStats"));
        v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v304, "rssis"));
        v306 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "description"));
        *(_DWORD *)buf = 136446978;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 709;
        v538 = 2048;
        *(_QWORD *)v539 = v302;
        *(_WORD *)&v539[8] = 2112;
        *(_QWORD *)v540 = v306;
        _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median RSSI not found nRSSI %lu %@", buf, 0x26u);

      }
      for (m = 0; ; ++m)
      {
        v307 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v307, "peerStats"));
        v309 = (unint64_t)objc_msgSend(v308, "rssisCount") > m;

        if (!v309)
          break;
        v310 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
        v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v310, "peerStats"));
        v312 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v311, "rssiAtIndex:", m));
        v313 = objc_msgSend(v312, "residentTime");
        v314 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v314, "peerStats"));
        v316 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v315, "rssiAtIndex:", m));
        v317 = objc_msgSend(v316, "residentTime");

        if (v500)
        {
          v318 = 0;
          objc = v313 - v317;
          v319 = 1;
          do
          {
            v320 = WALogCategoryDefaultHandle();
            v321 = objc_claimAutoreleasedReturnValue(v320);
            if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
            {
              logd = v321;
              v322 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v318));
              v323 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "peerStats"));
              v324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "rssiAtIndex:", m));
              v325 = objc_msgSend(v324, "residentTime");
              v326 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v318));
              v327 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v326, "peerStats"));
              v328 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v327, "rssiAtIndex:", m));
              *(_DWORD *)buf = 136448002;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              v536 = 1024;
              v537 = 713;
              v538 = 1024;
              *(_DWORD *)v539 = m;
              *(_WORD *)&v539[4] = 1024;
              *(_DWORD *)&v539[6] = v319 - 1;
              *(_WORD *)v540 = 2048;
              *(_QWORD *)&v540[2] = v491;
              *(_WORD *)&v540[10] = 2048;
              *(_QWORD *)&v540[12] = objc;
              *(_WORD *)v541 = 2048;
              *(_QWORD *)&v541[2] = v325;
              *(_WORD *)v542 = 2112;
              *(_QWORD *)&v542[2] = v328;
              v321 = logd;
              _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RSSI index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);

            }
            v318 = v319;
            v297 = v500 > v319++;
          }
          while (v297);
        }
      }
    }
    v161 = 0;
    v454 = 0;
    v492 = 0;
    while (1)
    {
      v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "peerStats"));
      v164 = (unint64_t)objc_msgSend(v163, "snrsCount") > v161;

      if (!v164)
        break;
      v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
      v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "peerStats"));
      v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "snrAtIndex:", v161));
      v168 = objc_msgSend(v167, "residentTime");
      v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "peerStats"));
      v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "snrAtIndex:", v161));
      v172 = objc_msgSend(v171, "residentTime");

      v173 = v168 - v172;
      if (v168 - v172 > v492)
      {
        v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "peerStats"));
        v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "snrAtIndex:", v161));
        v177 = objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "state"));

        v454 = (void *)v177;
        v492 = v173;
      }
      ++v161;
    }
    if (!v454)
    {
      v329 = WALogCategoryDefaultHandle();
      v330 = objc_claimAutoreleasedReturnValue(v329);
      if (os_log_type_enabled(v330, OS_LOG_TYPE_ERROR))
      {
        v331 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v331, "peerStats"));
        v333 = objc_msgSend(v332, "snrsCount");
        v334 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v335 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v334, "peerStats"));
        v336 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v335, "snrs"));
        v337 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v336, "description"));
        *(_DWORD *)buf = 136446978;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 731;
        v538 = 2048;
        *(_QWORD *)v539 = v333;
        *(_WORD *)&v539[8] = 2112;
        *(_QWORD *)v540 = v337;
        _os_log_impl((void *)&_mh_execute_header, v330, OS_LOG_TYPE_ERROR, "%{public}s::%d:Median SNR not found nSNR %lu %@", buf, 0x26u);

      }
      for (n = 0; ; ++n)
      {
        v338 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v339 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "peerStats"));
        v340 = (unint64_t)objc_msgSend(v339, "snrsCount") > n;

        if (!v340)
          break;
        v341 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
        v342 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v341, "peerStats"));
        v343 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "snrAtIndex:", n));
        v344 = objc_msgSend(v343, "residentTime");
        v345 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
        v346 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v345, "peerStats"));
        v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "snrAtIndex:", n));
        v348 = objc_msgSend(v347, "residentTime");

        if (v500)
        {
          v349 = 0;
          objd = v344 - v348;
          v350 = 1;
          do
          {
            v351 = WALogCategoryDefaultHandle();
            v352 = objc_claimAutoreleasedReturnValue(v351);
            if (os_log_type_enabled(v352, OS_LOG_TYPE_DEFAULT))
            {
              loge = v352;
              v353 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v349));
              v354 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v353, "peerStats"));
              v355 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v354, "snrAtIndex:", n));
              v356 = objc_msgSend(v355, "residentTime");
              v357 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v349));
              v358 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "peerStats"));
              v359 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v358, "snrAtIndex:", n));
              *(_DWORD *)buf = 136448002;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              v536 = 1024;
              v537 = 735;
              v538 = 1024;
              *(_DWORD *)v539 = n;
              *(_WORD *)&v539[4] = 1024;
              *(_DWORD *)&v539[6] = v350 - 1;
              *(_WORD *)v540 = 2048;
              *(_QWORD *)&v540[2] = v492;
              *(_WORD *)&v540[10] = 2048;
              *(_QWORD *)&v540[12] = objd;
              *(_WORD *)v541 = 2048;
              *(_QWORD *)&v541[2] = v356;
              *(_WORD *)v542 = 2112;
              *(_QWORD *)&v542[2] = v359;
              v352 = loge;
              _os_log_impl((void *)&_mh_execute_header, loge, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SNR index %d itwo %d maxTimeInState %llu deltaTimeInState %llu time %llu peerStatsAtIndex %@ ", buf, 0x46u);

            }
            v349 = v350;
            v297 = v500 > v350++;
          }
          while (v297);
        }
      }
    }
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "controllerStats"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "aggregateMetrics"));
    v181 = objc_msgSend(v180, "kRxCRCGlitch");
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "controllerStats"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "aggregateMetrics"));
    v185 = objc_msgSend(v184, "kRxCRCGlitch");

    v435 = (unint64_t)(v181 - v185) > 0xE15;
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "controllerStats"));
    v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "scanActivity"));
    LODWORD(v181) = objc_msgSend(v188, "roamCount");
    v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "controllerStats"));
    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "scanActivity"));
    LODWORD(v185) = objc_msgSend(v191, "roamCount");

    v434 = (_DWORD)v181 != (_DWORD)v185;
    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "controllerStats"));
    v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "btCoex"));
    LODWORD(v181) = objc_msgSend(v194, "duration");
    v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
    v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "controllerStats"));
    v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "btCoex"));
    LODWORD(v185) = objc_msgSend(v197, "duration");

    v433 = (_DWORD)v181 != (_DWORD)v185;
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
    v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "controllerStats"));
    logb = objc_msgSend(v199, "channelsVisited0");
    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", v500));
    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "controllerStats"));
    v501 = objc_msgSend(v201, "channelsVisited1");
    v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
    v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v202, "controllerStats"));
    LODWORD(v185) = objc_msgSend(v203, "channelsVisited0");
    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "controllerStats"));
    LODWORD(v197) = objc_msgSend(v205, "channelsVisited1");

    v459 = 0;
    v460 = 0;
    v206 = 0;
    v463 = 0;
    v465 = 0;
    v461 = 0;
    v462 = 0;
    v484 = 0;
    v432 = v501 + logb != (_DWORD)v197 + (_DWORD)v185;
    while (1)
    {
      v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "peerStats"));
      v502 = v206;
      v209 = (unint64_t)objc_msgSend(v208, "acCompletionsCount") > v206;

      if (!v209)
        break;
      v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "peerStats"));
      v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "acCompletionsAtIndex:", v502));
      v473 = objc_msgSend(v212, "success");

      v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
      v469 = objc_msgSend(v213, "timestamp");

      v506 = 0u;
      v507 = 0u;
      v504 = 0u;
      v505 = 0u;
      v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSamples"));
      v215 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v504, v547, 16);
      if (v215)
      {
        v493 = *(_QWORD *)v505;
        obja = v214;
        do
        {
          loga = v215;
          for (ii = 0; ii != loga; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v505 != v493)
              objc_enumerationMutation(obja);
            v217 = *(void **)(*((_QWORD *)&v504 + 1) + 8 * (_QWORD)ii);
            v218 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
            v219 = (unint64_t)objc_msgSend(v218, "acCompletionsCount") > v502;

            if (v219)
            {
              v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
              v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "acCompletionsAtIndex:", v502));
              v222 = objc_msgSend(v221, "qeuedPackets");

              v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
              v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "acCompletionsAtIndex:", v502));
              v225 = objc_msgSend(v224, "success");

              v226 = objc_msgSend(v217, "timestamp");
              v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
              v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "acCompletionsAtIndex:", v502));
              v229 = objc_msgSend(v228, "ac");

              v230 = WALogCategoryDefaultHandle();
              v231 = objc_claimAutoreleasedReturnValue(v230);
              if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
              {
                v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
                v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "acCompletionsAtIndex:", v502));
                v234 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v233, "acAsString:", v229));
                *(_DWORD *)buf = 136447234;
                v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                v536 = 1024;
                v537 = 783;
                v538 = 2112;
                *(_QWORD *)v539 = v234;
                *(_WORD *)&v539[8] = 1024;
                *(_DWORD *)v540 = v225;
                *(_WORD *)&v540[4] = 1024;
                *(_DWORD *)&v540[6] = v222;
                _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_DEFAULT, "%{public}s::%d: %@ TxSuccess %d qp %d", buf, 0x28u);

              }
              if ((v484 & 1) == 0)
              {
                v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "peerStats"));
                v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "acCompletionsAtIndex:", v502));
                v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "acAsString:", v229));
                v238 = objc_msgSend(v237, "length") == 0;

                if (v238)
                {
                  v239 = WALogCategoryDefaultHandle();
                  v240 = objc_claimAutoreleasedReturnValue(v239);
                  if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446466;
                    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                    v536 = 1024;
                    v537 = 786;
                    _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_ERROR, "%{public}s::%d: Caught bad data in perAC counterSample - setting missingValidCounterSample", buf, 0x12u);
                  }

                  v484 = 1;
                }
              }
              switch((int)v229)
              {
                case 2:
                  if (!((v225 <= v473) | v462 & 1))
                  {
                    v241 = WALogCategoryDefaultHandle();
                    v242 = objc_claimAutoreleasedReturnValue(v241);
                    if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 805;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v242, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    LODWORD(v462) = 1;
                  }
                  if (!((v222 == 0) | BYTE4(v463) & 1))
                  {
                    v259 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v259);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 809;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                    goto LABEL_319;
                  }
                  if (v222 == 0 && (v463 & 0x100000000) != 0)
                  {
                    if ((v459 & 0x100000000) == 0)
                    {
                      v262 = WALogCategoryDefaultHandle();
                      v244 = objc_claimAutoreleasedReturnValue(v262);
                      if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136446722;
                        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                        v536 = 1024;
                        v537 = 813;
                        v538 = 2048;
                        *(_QWORD *)v539 = v226 - v469;
                        _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BK Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                      }
                      BYTE4(v459) = 1;
LABEL_319:
                      BYTE4(v463) = 1;
                      goto LABEL_284;
                    }
                    BYTE4(v459) = 1;
                    BYTE4(v463) = 1;
                  }
                  break;
                case 3:
                  if (!((v225 <= v473) | BYTE4(v461) & 1))
                  {
                    v255 = WALogCategoryDefaultHandle();
                    v256 = objc_claimAutoreleasedReturnValue(v255);
                    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 792;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    HIDWORD(v461) = 1;
                  }
                  if ((v222 == 0) | v463 & 1)
                  {
                    if (v222 != 0 || (v463 & 1) == 0)
                      continue;
                    if ((v459 & 1) != 0)
                    {
                      LOBYTE(v459) = 1;
                      LOBYTE(v463) = 1;
                      continue;
                    }
                    v264 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v264);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 800;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    LOBYTE(v459) = 1;
                  }
                  else
                  {
                    v260 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v260);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 796;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC BE Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  LOBYTE(v463) = 1;
                  goto LABEL_284;
                case 4:
                  if (!((v225 <= v473) | BYTE4(v462) & 1))
                  {
                    v251 = WALogCategoryDefaultHandle();
                    v252 = objc_claimAutoreleasedReturnValue(v251);
                    if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 818;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    HIDWORD(v462) = 1;
                  }
                  if ((v222 == 0) | v465 & 1)
                  {
                    if (v222 != 0 || (v465 & 1) == 0)
                      continue;
                    if ((v460 & 1) != 0)
                    {
                      LOBYTE(v460) = 1;
                      LOBYTE(v465) = 1;
                      continue;
                    }
                    v261 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v261);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 826;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    LOBYTE(v460) = 1;
                  }
                  else
                  {
                    v257 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v257);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 822;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  LOBYTE(v465) = 1;
                  goto LABEL_284;
                case 5:
                  if (!((v225 <= v473) | v461 & 1))
                  {
                    v253 = WALogCategoryDefaultHandle();
                    v254 = objc_claimAutoreleasedReturnValue(v253);
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 831;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VI Successful Tx status after %llu ms", buf, 0x1Cu);
                    }

                    LODWORD(v461) = 1;
                  }
                  if ((v222 == 0) | BYTE4(v465) & 1)
                  {
                    if (v222 != 0 || (v465 & 0x100000000) == 0)
                      continue;
                    if ((v460 & 0x100000000) != 0)
                    {
                      BYTE4(v460) = 1;
                      BYTE4(v465) = 1;
                      continue;
                    }
                    v263 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v263);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 839;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VI Tx Queue has emptied queue at %llu ms", buf, 0x1Cu);
                    }
                    BYTE4(v460) = 1;
                  }
                  else
                  {
                    v258 = WALogCategoryDefaultHandle();
                    v244 = objc_claimAutoreleasedReturnValue(v258);
                    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136446722;
                      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                      v536 = 1024;
                      v537 = 835;
                      v538 = 2048;
                      *(_QWORD *)v539 = v226 - v469;
                      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AC VO Tx has Queued Data at %llu ms", buf, 0x1Cu);
                    }
                  }
                  BYTE4(v465) = 1;
                  goto LABEL_284;
                default:
                  continue;
              }
            }
            else
            {
              v243 = WALogCategoryDefaultHandle();
              v244 = objc_claimAutoreleasedReturnValue(v243);
              if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
              {
                v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dpsCounterSampleAtIndex:", 0));
                v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v245, "peerStats"));
                v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "acCompletionsAtIndex:", v502));
                v248 = objc_msgSend(v247, "ac");
                if (v248 >= 0xC)
                  v249 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v248));
                else
                  v249 = off_1000CDD30[(int)v248];
                v250 = v249;
                *(_DWORD *)buf = 136446722;
                v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                v536 = 1024;
                v537 = 773;
                v538 = 2112;
                *(_QWORD *)v539 = v250;
                _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ doesn't exist at this counterSample history", buf, 0x1Cu);

              }
LABEL_284:

            }
          }
          v214 = obja;
          v215 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v504, v547, 16);
        }
        while (v215);
      }

      v206 = v502 + 1;
    }
    if (BYTE4(v461) & 1 | ((v446 & 0x100000000) == 0) | v463 & 1)
    {
      v265 = 0;
    }
    else
    {
      v360 = WALogCategoryDefaultHandle();
      v361 = objc_claimAutoreleasedReturnValue(v360);
      if (os_log_type_enabled(v361, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 847;
        _os_log_impl((void *)&_mh_execute_header, v361, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on BE has insufficient usage to determine recovery state", buf, 0x12u);
      }

      v265 = 1;
    }
    if (!(v462 & 1 | ((v446 & 1) == 0) | BYTE4(v463) & 1))
    {
      v362 = WALogCategoryDefaultHandle();
      v363 = objc_claimAutoreleasedReturnValue(v362);
      if (os_log_type_enabled(v363, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 851;
        _os_log_impl((void *)&_mh_execute_header, v363, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on BK has insufficient usage to determine recovery state", buf, 0x12u);
      }

      v265 = 1;
    }
    if (!(BYTE4(v462) & 1 | ((v444 & 1) == 0) | v465 & 1))
    {
      v364 = WALogCategoryDefaultHandle();
      v365 = objc_claimAutoreleasedReturnValue(v364);
      if (os_log_type_enabled(v365, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 855;
        _os_log_impl((void *)&_mh_execute_header, v365, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on VO has insufficient usage to determine recovery state", buf, 0x12u);
      }

      v265 = 1;
    }
    v366 = v442;
    if (v461 & 1 | ((v442 & 1) == 0) | BYTE4(v465) & 1)
    {
      v367 = v442 & v461;
    }
    else
    {
      v368 = WALogCategoryDefaultHandle();
      v369 = objc_claimAutoreleasedReturnValue(v368);
      if (os_log_type_enabled(v369, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 859;
        _os_log_impl((void *)&_mh_execute_header, v369, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS on VI has insufficient usage to determine recovery state", buf, 0x12u);
      }

      v367 = 0;
      v265 = 1;
      v366 = v442;
    }
    v370 = v444 + v366 + v446 + HIDWORD(v446);
    v140 = (v446 & v462) + (v444 & HIDWORD(v462)) + (HIDWORD(v446) & HIDWORD(v461)) + v367;
    v121 = v370 == v140;
    if (v370 == v140)
    {
      v371 = WALogCategoryDefaultHandle();
      v372 = objc_claimAutoreleasedReturnValue(v371);
      if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 868;
        v373 = "%{public}s::%d:DPS Full Recovery on all stalled ACs";
        goto LABEL_391;
      }
      goto LABEL_392;
    }
    if (v140)
    {
      v374 = WALogCategoryDefaultHandle();
      v372 = objc_claimAutoreleasedReturnValue(v374);
      if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
        v536 = 1024;
        v537 = 872;
        v373 = "%{public}s::%d:DPS Partially Recovered on stalled ACs";
LABEL_391:
        _os_log_impl((void *)&_mh_execute_header, v372, OS_LOG_TYPE_DEFAULT, v373, buf, 0x12u);
      }
LABEL_392:
      v140 = v370 != v140;

    }
    v143 = 0;
    v142 = 0;
    v139 = v265 != 0;
    v141 = v484 & 1;
  }
  if (v438)
  {
    v375 = WALogCategoryDefaultHandle();
    v376 = objc_claimAutoreleasedReturnValue(v375);
    if (os_log_type_enabled(v376, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447746;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 888;
      v538 = 1024;
      *(_DWORD *)v539 = v425;
      *(_WORD *)&v539[4] = 1024;
      *(_DWORD *)&v539[6] = HIDWORD(v446);
      *(_WORD *)v540 = 1024;
      *(_DWORD *)&v540[2] = v446;
      *(_WORD *)&v540[6] = 1024;
      *(_DWORD *)&v540[8] = v444;
      *(_WORD *)&v540[12] = 1024;
      *(_DWORD *)&v540[14] = v442;
      _os_log_impl((void *)&_mh_execute_header, v376, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS reported on AC bitfeild %x and later on BE %d BK %d VO %d VI %d", buf, 0x30u);
    }

  }
  v377 = WALogCategoryDefaultHandle();
  v378 = objc_claimAutoreleasedReturnValue(v377);
  if (os_log_type_enabled(v378, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136448514;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 892;
    v538 = 2048;
    *(_QWORD *)v539 = 6;
    *(_WORD *)&v539[8] = 2112;
    *(_QWORD *)v540 = v456;
    *(_WORD *)&v540[8] = 2112;
    *(_QWORD *)&v540[10] = v455;
    *(_WORD *)&v540[18] = 2112;
    *(_QWORD *)v541 = v454;
    *(_WORD *)&v541[8] = 1024;
    *(_DWORD *)v542 = v435;
    *(_WORD *)&v542[4] = 1024;
    *(_DWORD *)&v542[6] = v434;
    v543 = 1024;
    v544 = v433;
    v545 = 1024;
    v546 = v432;
    _os_log_impl((void *)&_mh_execute_header, v378, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS %llu second medianCCA %@, medianRSSI %@ medianSNR %@: highCRS %d roamScan %d btActive %d channelChanges %d", buf, 0x52u);
  }

  if (v455)
    v379 = v456 == 0;
  else
    v379 = 1;
  v380 = v379 || v454 == 0;
  v381 = v380;
  if (v380)
    v382 = 1;
  else
    v382 = v141;
  v383 = WALogCategoryDefaultHandle();
  v384 = objc_claimAutoreleasedReturnValue(v383);
  if (os_log_type_enabled(v384, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 917;
    v538 = 1024;
    *(_DWORD *)v539 = v437;
    *(_WORD *)&v539[4] = 1024;
    *(_DWORD *)&v539[6] = v436;
    _os_log_impl((void *)&_mh_execute_header, v384, OS_LOG_TYPE_ERROR, "%{public}s::%d:didFirstProbeShowAllACGatewayBlocked %d didFirstProbeConfirmDPS %d", buf, 0x1Eu);
  }

  v385 = WALogCategoryDefaultHandle();
  v386 = objc_claimAutoreleasedReturnValue(v385);
  if (os_log_type_enabled(v386, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136448258;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    v536 = 1024;
    v537 = 919;
    v538 = 1024;
    *(_DWORD *)v539 = v443;
    *(_WORD *)&v539[4] = 1024;
    *(_DWORD *)&v539[6] = v458 & 1;
    *(_WORD *)v540 = 1024;
    *(_DWORD *)&v540[2] = v441;
    *(_WORD *)&v540[6] = 1024;
    *(_DWORD *)&v540[8] = v440;
    *(_WORD *)&v540[12] = 1024;
    *(_DWORD *)&v540[14] = HIDWORD(v430);
    *(_WORD *)&v540[18] = 1024;
    *(_DWORD *)v541 = v430;
    *(_WORD *)&v541[4] = 1024;
    *(_DWORD *)&v541[6] = HIDWORD(v431);
    _os_log_impl((void *)&_mh_execute_header, v386, OS_LOG_TYPE_ERROR, "%{public}s::%d:isDPSReset %d userToggled %d isFastDPSReset %d userDisconnected %d issDSPWDSpent %d isfDSPWDSpent %d involuntaryToggled %d", buf, 0x3Cu);
  }

  if ((v449 & ~v382) == 0)
  {
    v391 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Incomplete DPS Report")));
    v392 = (void *)v527[5];
    v527[5] = v391;

    v393 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("missingDSPNotification %d, missingProbe %d missingEnoughCounters %d missingAllCounters %d missingPhyStates %d invalidCounterReading %d"), v429, v428, v143, v142, v381, v141));
    v394 = (void *)v521[5];
    v521[5] = v393;

    v532 = NSLocalizedFailureReasonErrorKey;
    v533 = CFSTR("WAErrorCodeIncompleteSampleData");
    v389 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v533, &v532, 1));
    v395 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifi.analytics.errordomain"), 9019, v389));
    goto LABEL_478;
  }
  v387 = CFSTR("All Probe Success");
  if (v436)
    v387 = CFSTR("Confirmed");
  if (v437)
    v388 = CFSTR("Confirmed All AC");
  else
    v388 = v387;
  v389 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v388));
  if (!(v458 & 1 | ((v443 & 1) == 0)))
  {
    v396 = CFSTR("sDPS");
    goto LABEL_439;
  }
  if (!(v458 & 1 | !v441))
  {
    v396 = CFSTR("fDPS");
    goto LABEL_439;
  }
  if (!(v440 & 1 | ((v458 & 1) == 0)))
  {
    if (v443)
      v396 = CFSTR("UserToggled + sDPS");
    else
      v396 = CFSTR("UserToggled + fDPS");
    if (((v443 | v441) & 1) == 0)
    {
      if ((v430 | HIDWORD(v430) ^ 1) == 1)
      {
        if ((HIDWORD(v430) | v430 ^ 1) == 1)
        {
          if (v430)
            v396 = CFSTR("UserToggled + No WD Budget");
          else
            v396 = CFSTR("UserToggled");
        }
        else
        {
          v396 = CFSTR("UserToggled + fDPSNoBudget");
        }
      }
      else
      {
        v396 = CFSTR("UserToggled + sDPSNoBudget");
      }
    }
LABEL_439:
    v397 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v396));
    if (v440)
      goto LABEL_440;
    goto LABEL_461;
  }
  if (!v440)
  {
    if (HIDWORD(v431))
    {
      v397 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Involuntary")));
      goto LABEL_462;
    }
    v399 = CFSTR("No Action");
    if ((_DWORD)v430)
      v399 = CFSTR("fDPSNoBudget");
    v400 = CFSTR("No WD Budget");
    if (!(_DWORD)v430)
      v400 = CFSTR("sDPSNoBudget");
    if (HIDWORD(v430))
      v401 = v400;
    else
      v401 = v399;
    v397 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v401));
LABEL_461:
    if (((v443 | v441 | v458 | HIDWORD(v431)) & 1) == 0)
    {
      if (v140)
        v403 = CFSTR("Unstuck");
      else
        v403 = CFSTR("Unsure");
LABEL_470:
      v398 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v403));
      goto LABEL_471;
    }
LABEL_462:
    v402 = CFSTR("Still Stuck");
    if (v139)
      v402 = CFSTR("Unsure");
    if ((v424 || v448) | v121 | v140)
      v403 = CFSTR("Unstuck");
    else
      v403 = v402;
    goto LABEL_470;
  }
  if (v443)
    v390 = CFSTR("UserDisconnect + sDPS");
  else
    v390 = CFSTR("UserDisconnect + fDPS");
  if (((v443 | v441) & 1) == 0)
  {
    if ((v430 | HIDWORD(v430) ^ 1) == 1)
    {
      if ((HIDWORD(v430) | v430 ^ 1) == 1)
      {
        if (v430)
          v390 = CFSTR("UserDisconnect + No WD Budget");
        else
          v390 = CFSTR("UserDisconnect");
      }
      else
      {
        v390 = CFSTR("UserDisconnect + fDPSNoBudget");
      }
    }
    else
    {
      v390 = CFSTR("UserDisconnect + sDPSNoBudget");
    }
  }
  v397 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v390));
LABEL_440:
  v398 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Disconnected")));
LABEL_471:
  v404 = (void *)v398;
  if (((HIDWORD(v426) | v427 | HIDWORD(v427) | v426) & 1) != 0)
    v405 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -  %@ - %@: change bssid %d channel %d network %d link %d"), v389, v397, v398, HIDWORD(v426), v427, HIDWORD(v427), v426));
  else
    v405 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@ - %@"), v389, v397, v398));
  v406 = (void *)v527[5];
  v527[5] = v405;

  if ((_DWORD)v431)
    v407 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("medianCCA %@, medianRSSI %@ medianSNR %@ highCRS %d roamScan %d btActive %d channelChanges %d screenState %@"), v456, v455, v454, v435, v434, v433, v432, v447));
  else
    v407 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("medianCCA %@, medianRSSI %@ medianSNR %@ highCRS %d roamScan %d btActive %d channelChanges %d screenState %@ quickDpsSuppressedReason %@"), v456, v455, v454, v435, v434, v433, v432, v447, v445));
  v408 = (void *)v521[5];
  v521[5] = v407;

  v395 = 0;
LABEL_478:

  v409 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v527[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
  v410 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v521[5], "stringByReplacingOccurrencesOfString:withString:", CFSTR("%"), &stru_1000CF640));
  v411 = (void *)objc_claimAutoreleasedReturnValue(-[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](self->_ABCReporter, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("WiFi"), CFSTR("WiFi DatapathStall"), v409, v410, CFSTR("wifianalyticsd"), 0));
  v412 = objc_alloc((Class)NSArray);
  v413 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "dictionaryRepresentation"));
  v414 = objc_msgSend(v412, "initWithObjects:", v413, 0);

  ABCReporter = self->_ABCReporter;
  v503[0] = _NSConcreteStackBlock;
  v503[1] = 3221225472;
  v503[2] = sub_1000839F4;
  v503[3] = &unk_1000CDCF8;
  v503[4] = &v526;
  v503[5] = &v520;
  -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:](ABCReporter, "snapshotWithSignature:duration:events:payload:actions:reply:", v411, v414, 0, 0, v503, 10.0);

LABEL_479:
  _Block_object_dispose(&v520, 8);

  _Block_object_dispose(&v526, 8);
  objc_autoreleasePoolPop(context);
  if (v452)
  {
    v416 = WALogCategoryDefaultHandle();
    v417 = objc_claimAutoreleasedReturnValue(v416);
    if (os_log_type_enabled(v417, OS_LOG_TYPE_DEFAULT))
    {
      v418 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v450, "key"));
      *(_DWORD *)buf = 136446722;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      v536 = 1024;
      v537 = 1034;
      v538 = 2112;
      *(_QWORD *)v539 = v418;
      _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Submit complete: %@", buf, 0x1Cu);

    }
  }
  v419 = v395;

  return v419;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

- (SDRDiagnosticReporter)ABCReporter
{
  return self->_ABCReporter;
}

- (void)setABCReporter:(id)a3
{
  objc_storeStrong((id *)&self->_ABCReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ABCReporter, 0);
}

@end
