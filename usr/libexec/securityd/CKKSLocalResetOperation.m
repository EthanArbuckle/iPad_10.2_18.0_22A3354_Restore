@implementation CKKSLocalResetOperation

- (CKKSLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKKSLocalResetOperation *v12;
  CKKSLocalResetOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSLocalResetOperation;
  v12 = -[CKKSResultOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
    -[CKKSLocalResetOperation setName:](v13, "setName:", CFSTR("ckks-local-reset"));
  }

  return v13;
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BD9F4;
  v5[3] = &unk_1002EA880;
  v5[4] = self;
  objc_msgSend(v4, "dispatchSyncWithSQLTransaction:", v5);

}

- (void)onqueuePerformLocalReset
{
  AAFAnalyticsEventSecurity *v3;
  void *v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  AAFAnalyticsEventSecurity *v102;
  id v103;
  NSObject *v104;
  void *v105;
  void *v106;
  AAFAnalyticsEventSecurity *v107;
  id obj;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t buf[4];
  id v125;
  _BYTE v126[128];
  const __CFString *v127;
  void *v128;

  v3 = [AAFAnalyticsEventSecurity alloc];
  v127 = CFSTR("numViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "views"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  v128 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "altDSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v107 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:](v3, "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:", v7, v10, CFSTR("com.apple.security.ckks.localReset"), 0, &off_10030AF70, objc_msgSend(v11, "sendMetric"));

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "views"));

  obj = v13;
  v110 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  v14 = 0;
  if (v110)
  {
    v109 = *(_QWORD *)v121;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v121 != v109)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v15);
      objc_msgSend(v16, "setViewKeyHierarchyState:", CFSTR("resetlocal"), v107);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSZoneStateEntry contextID:zoneName:](CKKSZoneStateEntry, "contextID:zoneName:", v18, v20));

      objc_msgSend(v21, "setCkzonecreated:", 0);
      objc_msgSend(v21, "setCkzonesubscribed:", 0);
      objc_msgSend(v21, "setChangeToken:", 0);
      objc_msgSend(v21, "setMoreRecordsInCloudKit:", 0);
      objc_msgSend(v21, "setLastFetchTime:", 0);
      objc_msgSend(v21, "setLastLocalKeychainScanTime:", 0);
      v119 = v14;
      objc_msgSend(v21, "saveToDatabase:", &v119);
      v22 = v119;

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneName"));
          v26 = sub_10000BDF4(CFSTR("local-reset"), v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "couldn't reset zone status: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v22);
          v22 = 0;
        }
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contextID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v118 = v22;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSMirrorEntry, "deleteAllWithContextID:zoneID:error:", v29, v30, &v118);
      v31 = v118;

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "zoneName"));
          v35 = sub_10000BDF4(CFSTR("local-reset"), v34);
          v36 = objc_claimAutoreleasedReturnValue(v35);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v31;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSMirrorEntry: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v31);
          v31 = 0;
        }
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contextID"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v117 = v31;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSOutgoingQueueEntry, "deleteAllWithContextID:zoneID:error:", v38, v39, &v117);
      v40 = v117;

      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneName"));
          v44 = sub_10000BDF4(CFSTR("local-reset"), v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v40;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSOutgoingQueueEntry: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v40);
          v40 = 0;
        }
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contextID"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v116 = v40;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSIncomingQueueEntry, "deleteAllWithContextID:zoneID:error:", v47, v48, &v116);
      v49 = v116;

      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v50)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "zoneName"));
          v53 = sub_10000BDF4(CFSTR("local-reset"), v52);
          v54 = objc_claimAutoreleasedReturnValue(v53);

          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v49;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSIncomingQueueEntry: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v49);
          v49 = 0;
        }
      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "contextID"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v115 = v49;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSKey, "deleteAllWithContextID:zoneID:error:", v56, v57, &v115);
      v58 = v115;

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v59)
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "zoneName"));
          v62 = sub_10000BDF4(CFSTR("local-reset"), v61);
          v63 = objc_claimAutoreleasedReturnValue(v62);

          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v58;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSKey: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v58);
          v58 = 0;
        }
      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contextID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v114 = v58;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSTLKShareRecord, "deleteAllWithContextID:zoneID:error:", v65, v66, &v114);
      v67 = v114;

      if (v67)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v68)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "zoneName"));
          v71 = sub_10000BDF4(CFSTR("local-reset"), v70);
          v72 = objc_claimAutoreleasedReturnValue(v71);

          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v67;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSTLKShare: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v67);
          v67 = 0;
        }
      }
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "contextID"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v113 = v67;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSCurrentKeyPointer, "deleteAllWithContextID:zoneID:error:", v74, v75, &v113);
      v76 = v113;

      if (v76)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "zoneName"));
          v80 = sub_10000BDF4(CFSTR("local-reset"), v79);
          v81 = objc_claimAutoreleasedReturnValue(v80);

          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v76;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSCurrentKeyPointer: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v76);
          v76 = 0;
        }
      }
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "contextID"));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v112 = v76;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSCurrentItemPointer, "deleteAllWithContextID:zoneID:error:", v83, v84, &v112);
      v85 = v112;

      if (v85)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v86)
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "zoneName"));
          v89 = sub_10000BDF4(CFSTR("local-reset"), v88);
          v90 = objc_claimAutoreleasedReturnValue(v89);

          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v85;
            _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSCurrentItemPointer: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v85);
          v85 = 0;
        }
      }
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "contextID"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
      v111 = v85;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:zoneID:error:](CKKSDeviceStateEntry, "deleteAllWithContextID:zoneID:error:", v92, v93, &v111);
      v14 = v111;

      if (v14)
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

        if (!v94)
        {
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "zoneID"));
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "zoneName"));
          v97 = sub_10000BDF4(CFSTR("local-reset"), v96);
          v98 = objc_claimAutoreleasedReturnValue(v97);

          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v125 = v14;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSDeviceStateEntry: %@", buf, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v14);
          v14 = 0;
        }
      }
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));

      if (v99)
        break;
      if (v110 == (id)++v15)
      {
        v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
        if (v110)
          goto LABEL_3;
        break;
      }
    }
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
  if (v100)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
    v102 = v107;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v107, 0, v101);
  }
  else
  {
    v103 = sub_10000BDF4(CFSTR("local-reset"), 0);
    v104 = objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation deps](self, "deps"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "views"));
      *(_DWORD *)buf = 138412290;
      v125 = v106;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Successfully deleted all local data for zones: %@", buf, 0xCu);

    }
    v102 = v107;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v107, 1, 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSLocalResetOperation intendedState](self, "intendedState"));
    -[CKKSLocalResetOperation setNextState:](self, "setNextState:", v101);
  }

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
