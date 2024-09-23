@implementation _DASDataCollectionTasks

+ (void)loadParameters
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[3];
  _QWORD v66[2];
  _QWORD v67[2];
  void *v68;
  _UNKNOWN **v69;
  _QWORD v70[2];
  _QWORD v71[2];

  v2 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.minimumDays"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v4)
  {
    v5 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      objc_msgSend(v4, "doubleValue");
      qword_1001AA728 = v6;
    }
  }
  v7 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.timestampPrecision"), v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v9)
  {
    v10 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      objc_msgSend(v9, "doubleValue");
      qword_1001AA730 = v11;
    }
  }
  v12 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.maxcorrelation"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v14)
  {
    v15 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      qword_1001AA738 = v16;
    }
  }
  v17 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.maxampusageevents"), v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v19)
  {
    v20 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
    {
      objc_msgSend(v19, "doubleValue");
      qword_1001AA740 = v21;
    }
  }
  v22 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.chargePopulationDenom"), v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    dword_1001AA748 = objc_msgSend(v23, "unsignedIntValue");
  v60 = v19;
  v61 = v14;
  v62 = v9;
  v63 = v4;
  v26 = OSAGetDATaskingValue(CFSTR("com.apple.dasd.tasking.minDaysBetweenCollection"), v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (v27)
  {
    v28 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
      qword_1001AA750 = (uint64_t)objc_msgSend(v27, "integerValue");
  }
  v59 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
  v70[0] = v30;
  v70[1] = CFSTR("/dasd/focus");
  v71[0] = &off_10016EA98;
  v71[1] = &off_10016EAB0;
  v31 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 2));
  v32 = (void *)qword_1001ABB78;
  qword_1001ABB78 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "name"));
  v68 = v34;
  v69 = &off_10016EAC8;
  v35 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
  v36 = (void *)qword_1001ABB80;
  qword_1001ABB80 = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
  v66[0] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey name](_DKBluetoothMetadataKey, "name"));
  v65[0] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey address](_DKBluetoothMetadataKey, "address"));
  v65[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey isAppleAudioDevice](_DKBluetoothMetadataKey, "isAppleAudioDevice"));
  v65[2] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 3));
  v66[1] = CFSTR("/clock/alarm");
  v67[0] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAlarmMetadataKey alarmID](_DKAlarmMetadataKey, "alarmID"));
  v64[0] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAlarmMetadataKey isSleep](_DKAlarmMetadataKey, "isSleep"));
  v64[1] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
  v67[1] = v45;
  v46 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
  v47 = (void *)qword_1001ABB88;
  qword_1001ABB88 = v46;

  v48 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.datacollectiontasks"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("dateOfChoosing")));
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "doubleValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v52, "timeIntervalSinceDate:", v51);
    v54 = v53;

    v56 = v60;
    v55 = v61;
    v57 = v23;
    if (v54 > 86400.0)
      objc_msgSend(v48, "setObject:forKey:", &off_10016EAE0, CFSTR("chosenForSubmission"));

    v58 = v62;
  }
  else
  {
    objc_msgSend(v48, "setObject:forKey:", &off_10016EAE0, CFSTR("chosenForSubmission"));
    v55 = v61;
    v58 = v62;
    v57 = v23;
    v56 = v60;
  }

}

+ (id)handleForFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0
    || (v5 = 0, objc_msgSend(v4, "createFileAtPath:contents:attributes:", v3, 0, 0)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForUpdatingAtPath:](NSFileHandle, "fileHandleForUpdatingAtPath:", v3));
    objc_msgSend(v5, "truncateFileAtOffset:", 0);
  }

  return v5;
}

+ (id)experimentsToWrite
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
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
  id v17;
  uint32_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint32_t v49;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  NSObject *v66;
  void *v67;
  id v69;
  id obj;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v81;
  int v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  uint64_t v97;
  uint8_t v98[4];
  uint64_t v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _QWORD v102[14];
  void *v103;

  v2 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)qword_1001ABB90;
  qword_1001ABB90 = v2;

  objc_msgSend((id)qword_1001ABB90, "setObject:forKeyedSubscript:", &off_10016F560, CFSTR("dasdDataCollection"));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)qword_1001ABB98;
  qword_1001ABB98 = (uint64_t)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/activityprofile")));
  v103 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
  objc_msgSend((id)qword_1001ABB98, "setObject:forKeyedSubscript:", v7, CFSTR("activityprofiling"));

  v83 = (id)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream"));
  v102[0] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceBatteryPercentageStream](_DKSystemEventStreams, "deviceBatteryPercentageStream"));
  v102[1] = v81;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"));
  v102[2] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams doNotDisturbStream](_DKSystemEventStreams, "doNotDisturbStream"));
  v102[3] = v78;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/charging/smartTopOffCheckpoint")));
  v102[4] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/charging/accessoryChargingEvents")));
  v102[5] = v75;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/dasd/controlEffort")));
  v102[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/system/TLC")));
  v102[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/clock/alarm")));
  v102[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceLowPowerModeStream](_DKSystemEventStreams, "deviceLowPowerModeStream"));
  v102[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsLockedImputedStream](_DKSystemEventStreams, "deviceIsLockedImputedStream"));
  v102[10] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams defaultPairedDeviceNearbyStream](_DKSystemEventStreams, "defaultPairedDeviceNearbyStream"));
  v102[11] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams motionStream](_DKSystemEventStreams, "motionStream"));
  v102[12] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
  v102[13] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 14));
  objc_msgSend((id)qword_1001ABB98, "setObject:forKeyedSubscript:", v16, CFSTR("dasdDataCollection"));

  v69 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.datacollectiontasks"));
  v17 = objc_msgSend(v69, "integerForKey:", CFSTR("chosenForSubmission"));
  if (v17 == (id)2)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E588C();
    goto LABEL_19;
  }
  if (v17 == (id)1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5860();
    if (byte_1001ABBA8 != 1)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_ERROR))
      sub_1000E5834();
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }
  if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
    v18 = 7;
  else
    v18 = dword_1001AA748;
  v19 = arc4random_uniform(v18);
  if ((_DWORD)v19 == 1)
    v20 = &off_10016EAF8;
  else
    v20 = &off_10016EB10;
  objc_msgSend(v69, "setObject:forKey:", v20, CFSTR("chosenForSubmission"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v69, "setObject:forKey:", v21, CFSTR("dateOfChoosing"));

LABEL_20:
  if ((byte_1001ABBA8 & 1) != 0)
  {
LABEL_21:
    v22 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Forcing device to be picked for data collection", buf, 2u);
    }
    goto LABEL_24;
  }
  if ((_DWORD)v19 == 1)
  {
LABEL_24:
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100082468;
    v93[3] = &unk_10015EFE0;
    v93[4] = a1;
    objc_msgSend((id)qword_1001ABB90, "enumerateKeysAndObjectsUsingBlock:", v93);
    v82 = 1;
    v19 = 1;
    goto LABEL_25;
  }
  v82 = 0;
LABEL_25:
  v71 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E57C4(v23, v24, v25, v26, v27, v28, v29, v30);
  v31 = qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E5760(v19, v31, v32, v33, v34, v35, v36, v37);
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = (id)qword_1001ABB98;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
  if (v73)
  {
    v72 = *(_QWORD *)v90;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v90 != v72)
        {
          v39 = v38;
          objc_enumerationMutation(obj);
          v38 = v39;
        }
        v74 = v38;
        v77 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABB98, "objectForKey:"));
        v41 = objc_alloc_init((Class)NSMutableArray);
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v84 = v40;
        v42 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(_QWORD *)v86 != v43)
                objc_enumerationMutation(v84);
              v45 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
              v46 = (void *)qword_1001ABB80;
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v47));

              if (v48)
              {
                v49 = arc4random_uniform((uint32_t)objc_msgSend(v48, "unsignedIntValue"));
                if ((uint64_t)objc_msgSend(v48, "integerValue") >= 2 && v49 == 1)
                {
                  if (byte_1001ABBA8 == 1)
                    goto LABEL_51;
                }
                else
                {
                  v51 = objc_msgSend(v48, "integerValue");
                  if ((byte_1001ABBA8 & 1) == 0)
                  {
                    if (v51 != (id)1)
                      goto LABEL_60;
                    goto LABEL_53;
                  }
LABEL_51:
                  v55 = (void *)qword_1001ABBA0;
                  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO))
                  {
                    v56 = v55;
                    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
                    *(_DWORD *)buf = 138412290;
                    v95 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Forcing stream collection %@", buf, 0xCu);

                  }
                }
LABEL_53:
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
                v59 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "name"));
                v61 = objc_msgSend(v58, "isEqualToString:", v60);

                if (v61
                  && (v62 = (void *)objc_opt_class(a1),
                      v63 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore")), objc_msgSend(v62, "computeUsageCorrelationBetweenAirPodsAMPStreamsWithStore:", v63), v65 = v64, v63, v65 > *(double *)&qword_1001AA738))
                {
                  v66 = (id)qword_1001ABBA0;
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                  {
                    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
                    sub_1000E5714(v67, v98, &v99, v66);
                  }

                }
                else
                {
                  objc_msgSend(v41, "addObject:", v45);
                  v52 = (void *)qword_1001ABBA0;
                  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
                    goto LABEL_49;
                }
                goto LABEL_60;
              }
              if (v82)
              {
                objc_msgSend(v41, "addObject:", v45);
                v52 = (void *)qword_1001ABBA0;
                if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
                {
LABEL_49:
                  v53 = v52;
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
                  *(_DWORD *)buf = 138412546;
                  v95 = v54;
                  v96 = 2112;
                  v97 = v77;
                  _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "experimentsToWrite: Added stream: %@ to experiment %@", buf, 0x16u);

                }
              }
LABEL_60:

            }
            v42 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
          }
          while (v42);
        }

        if (objc_msgSend(v41, "count"))
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v41, v77);

        v38 = v74 + 1;
      }
      while ((id)(v74 + 1) != v73);
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    }
    while (v73);
  }

  return v71;
}

+ (char)writeExperiments:(id)a3 atFileName:(id)a4 withTask:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  _BOOL4 v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *m;
  uint64_t v65;
  NSObject *v66;
  __int128 v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  id obj;
  id obja;
  void *v84;
  uint64_t v85;
  void *context;
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[5];
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  uint8_t v109[4];
  uint64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  const __CFString *v113;
  void *v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  _BYTE v119[128];
  _BYTE v120[128];

  v73 = a3;
  v8 = a4;
  v74 = a5;
  v80 = a1;
  v71 = v8;
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "handleForFilename:", v8));
  if (v84)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("["), "dataUsingEncoding:", 4));
    objc_msgSend(v84, "writeData:", v70);
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("{"), "dataUsingEncoding:", 4));
    objc_msgSend(v84, "writeData:", v69);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4));
    v105 = 0;
    v106 = &v105;
    v107 = 0x2020000000;
    v108 = 0;
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100083160;
    v104[3] = &unk_10015D610;
    v104[4] = &v105;
    objc_msgSend(v74, "setExpirationHandler:", v104);
    v72 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.datacollectiontasks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKey:", CFSTR("lastWritten")));
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = (void *)qword_1001ABBB0;
    qword_1001ABBB0 = (uint64_t)v10;

    v12 = qword_1001ABBB0;
    v13 = qword_1001ABBA0;
    v14 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v116 = qword_1001ABBB0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Last written info found: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Last written info not found, proceeding", buf, 2u);
      }
      v15 = objc_alloc_init((Class)NSMutableDictionary);
      v16 = (void *)qword_1001ABBB0;
      qword_1001ABBB0 = (uint64_t)v15;

    }
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v73;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
    if (v17)
    {
      v85 = 0;
      v78 = *(_QWORD *)v101;
      *(_QWORD *)&v18 = 138412290;
      v68 = v18;
      while (2)
      {
        v76 = v17;
        for (i = 0; i != v76; i = (char *)i + 1)
        {
          if (*(_QWORD *)v101 != v78)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);
          context = objc_autoreleasePoolPush();
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "writeExperiment:withStreams:toFileHandle:withLastWrittenInfo:", v20, v21, v84, qword_1001ABBB0));

          objc_msgSend(v81, "addObjectsFromArray:", v22);
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v119, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v97;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(_QWORD *)v97 != v25)
                  objc_enumerationMutation(v23);
                v27 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)j);
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("writeState"), v68));
                if (v28)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("writeState")));
                  v30 = objc_msgSend(v29, "unsignedIntValue") == 0;

                  if (v30)
                  {

                    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                    objc_msgSend((id)qword_1001ABBB0, "setObject:forKeyedSubscript:", v32, v20);
                    v33 = qword_1001ABBA0;
                    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      v116 = v20;
                      v117 = 2112;
                      v118 = qword_1001ABBB0;
                      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Wrote experiment %@, updating lastWrittenInfo : %@", buf, 0x16u);
                    }
                    if ((v85 & 0x8000000000000000) == 0)
                      objc_msgSend(v84, "writeData:", v75);

                    ++v85;
                    goto LABEL_32;
                  }
                }
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v119, 16);
              if (v24)
                continue;
              break;
            }
          }

          v31 = qword_1001ABBA0;
          if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v68;
            v116 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Couldn't write experiment %@", buf, 0xCu);
          }
LABEL_32:

          objc_autoreleasePoolPop(context);
          if (*((_BYTE *)v106 + 24))
          {
            if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
              sub_1000E5A98();
            goto LABEL_39;
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v85 = 0;
    }
LABEL_39:

    if (*((_BYTE *)v106 + 24) || !v85)
    {
      objc_msgSend(v84, "truncateFileAtOffset:", 0, v68);
      objc_msgSend(v84, "closeFile");
      if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
        sub_1000E595C();
      if (!*((_BYTE *)v106 + 24))
        objc_msgSend(v72, "setObject:forKey:", &off_10016EAE0, CFSTR("chosenForSubmission"));
      LOBYTE(v85) = 0;
    }
    else
    {
      objc_msgSend(v80, "replaceJSONDataWithNull:atWriteHandle:", v75, v84);
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("},"), "dataUsingEncoding:", 4));
      objc_msgSend(v84, "writeData:", v34);
      v79 = (void *)v34;
      v35 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", &off_10016F588, 0, 0));
      objc_msgSend(v84, "writeData:", v35);
      v77 = (void *)v35;
      obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("]"), "dataUsingEncoding:", 4));
      objc_msgSend(v84, "writeData:", obja);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4));
      objc_msgSend(v84, "writeData:", v36);

      objc_msgSend(v84, "closeFile");
      objc_msgSend(v72, "setObject:forKey:", &off_10016EAE0, CFSTR("chosenForSubmission"));
      v37 = (void *)objc_opt_class(v80);
      v113 = CFSTR("context");
      v114 = v81;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
      v39 = (unint64_t)objc_msgSend(v37, "writeToFileWithContextDictionary:", v38);

      v40 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG);
      if ((v39 & 0xFFFFFFFFFFFFFFFELL) == 0x50)
      {
        if (v40)
          sub_1000E5A40();
        v41 = qword_1001ABBA0;
        if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
          sub_1000E59D0(v41, v42, v43, v44, v45, v46, v47, v48);
        objc_msgSend(v72, "setObject:forKey:", qword_1001ABBB0, CFSTR("lastWritten"), v68);
        v49 = (id)qword_1001ABBA0;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKey:", CFSTR("lastWritten")));
          sub_1000E5988(v50, (uint64_t)buf, v49);
        }

      }
      else
      {
        if (v40)
          sub_1000E5A6C();
        LOBYTE(v85) = 0;
      }
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v51 = v81;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v93;
        do
        {
          for (k = 0; k != v52; k = (char *)k + 1)
          {
            if (*(_QWORD *)v93 != v53)
              objc_enumerationMutation(v51);
            v55 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)k);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "valueForKey:", CFSTR("writeState"), v68));
            v57 = objc_msgSend(v56, "integerValue") == 0;

            if (v57)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v39));
              objc_msgSend(v55, "setObject:forKeyedSubscript:", v58, CFSTR("writeState"));

            }
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
        }
        while (v52);
      }

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(v59, "setObject:forKeyedSubscript:", CFSTR("METAINFO"), CFSTR("streamName"));
      objc_msgSend(v59, "setObject:forKeyedSubscript:", CFSTR("METAINFO"), CFSTR("experimentName"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v39));
      objc_msgSend(v59, "setObject:forKeyedSubscript:", v60, CFSTR("writeState"));

      objc_msgSend(v51, "addObject:", v59);
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v61 = v51;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v89;
        do
        {
          for (m = 0; m != v62; m = (char *)m + 1)
          {
            if (*(_QWORD *)v89 != v63)
              objc_enumerationMutation(v61);
            v65 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)m);
            v66 = qword_1001ABBA0;
            if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v109 = 138412290;
              v110 = v65;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "sending stream analytics to CA: %@", v109, 0xCu);
            }
            v87[0] = _NSConcreteStackBlock;
            v87[1] = 3221225472;
            v87[2] = sub_100083180;
            v87[3] = &unk_10015DA30;
            v87[4] = v65;
            AnalyticsSendEventLazy(CFSTR("com.apple.dasd.dataCollectionMetrics"), v87);
          }
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v88, v111, 16);
        }
        while (v62);
      }

    }
    _Block_object_dispose(&v105, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_ERROR))
      sub_1000E5930();
    LOBYTE(v85) = 0;
  }

  return v85;
}

+ (id)writeExperiment:(id)a3 withStreams:(id)a4 toFileHandle:(id)a5 withLastWrittenInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _UNKNOWN **v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  id v59;
  id v60;
  void *v62;
  NSObject *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  NSObject *log;
  void *v76;
  uint64_t v77;
  id obja;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;
  __int16 v99;
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  void *v103;
  _QWORD v104[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  v13 = objc_autoreleasePoolPush();
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithMinimumDuration:](_DKQuery, "predicateForEventsWithMinimumDuration:", 0.0));
  v82 = v9;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));
  v15 = (id)v14;
  v72 = v13;
  if (byte_1001ABBA8 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5CC4();

  }
  else if (v14)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5D50();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v15);
    if (v17 >= (double)(86400 * qword_1001AA750))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStartDateAfter:](_DKQuery, "predicateForEventsWithStartDateAfter:", v15));
      v104[0] = v18;
      v104[1] = v81;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 2));
      v20 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v19));

      v21 = &unk_1001AB000;
      v81 = (void *)v20;
      v13 = v72;
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5D24();
    v52 = v83;
    v60 = v83;
    goto LABEL_61;
  }
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E5C64();
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
  v103 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v81, v10, 0, 1, v23));

  v92 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "executeQuery:error:", v16, &v92));
  v15 = v92;
  if (v15 || !objc_msgSend(v19, "count"))
  {
    v24 = (void *)qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_ERROR))
    {
      v63 = v24;
      v64 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 138412802;
      v94 = v16;
      v95 = 2112;
      v96 = v15;
      v97 = 2048;
      v98 = v64;
      _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "writeExperiment: query for oldest event %@ failed with err: %@ and event count %lu", buf, 0x20u);

    }
  }
  else
  {
    v54 = v19;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "startDate"));
    objc_msgSend(v56, "timeIntervalSinceNow");
    v58 = v57;

    if (*(double *)&qword_1001AA728 * 24.0 * 3600.0 < -v58)
    {
      v19 = v54;
      v13 = v72;
      if (byte_1001ABBA8 != 1)
      {
        v18 = v16;
        v16 = 0;
        v15 = 0;
        v21 = &unk_1001AB000;
        goto LABEL_19;
      }
LABEL_16:
      v21 = &unk_1001AB000;
      if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
        sub_1000E5B98();
      v18 = v16;
      v16 = v15;
      v15 = 0;
LABEL_19:

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\":{"), v82));
      v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 4));
      objc_msgSend(v11, "writeData:");
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4));
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v25 = v10;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
      if (v26)
      {
        v27 = v26;
        v67 = v16;
        v68 = v12;
        v65 = v15;
        v70 = v10;
        v77 = 0;
        v28 = *(_QWORD *)v85;
        v73 = v11;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v85 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
            v31 = objc_autoreleasePoolPush();
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "writeStream:toFileHandle:withEventPredicate:withStore:", v30, v11, v81, v80));
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v82, CFSTR("experimentName"));
            v33 = *((_QWORD *)v21 + 372);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              log = v33;
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("writeState")));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("numberOfWrittenEvents")));
              *(_DWORD *)buf = 138413058;
              v94 = v82;
              v95 = 2112;
              v96 = v74;
              v97 = 2112;
              v98 = v39;
              v99 = 2112;
              v100 = v40;
              _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "writeExperiment: %@ : stream %@ written status: %@ written events: %@", buf, 0x2Au);

              v11 = v73;
            }
            objc_msgSend(v83, "addObject:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("writeState")));
            v35 = objc_msgSend(v34, "unsignedIntValue");

            if (v35)
            {
              v21 = &unk_1001AB000;
              v36 = (void *)qword_1001ABBA0;
              if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
              {
                v37 = v36;
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
                *(_DWORD *)buf = 138412546;
                v94 = v82;
                v95 = 2112;
                v96 = v38;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "writeExperiment: %@ : stream %@ wasn't written", buf, 0x16u);

                v21 = &unk_1001AB000;
              }
            }
            else
            {
              v21 = &unk_1001AB000;
              if (v77 == -1)
              {
                v77 = 0;
              }
              else
              {
                ++v77;
                objc_msgSend(v11, "writeData:", v76);
              }
            }

            objc_autoreleasePoolPop(v31);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
        }
        while (v27);

        v12 = v68;
        v10 = v70;
        v13 = v72;
        v15 = v65;
        v16 = v67;
        if (v77)
        {
          objc_msgSend(a1, "replaceJSONDataWithNull:atWriteHandle:", v76, v11);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("}"), "dataUsingEncoding:", 4));
          objc_msgSend(v11, "writeData:", v41);
          if (os_log_type_enabled(*((os_log_t *)v21 + 372), OS_LOG_TYPE_DEBUG))
            sub_1000E5B24();

          v42 = (void *)v66;
LABEL_57:
          v52 = v83;
          v59 = v83;

          goto LABEL_61;
        }
      }
      else
      {

      }
      v42 = (void *)v66;
      objc_msgSend(a1, "replaceJSONDataWithNull:atWriteHandle:", v66, v11);
      if (os_log_type_enabled(*((os_log_t *)v21 + 372), OS_LOG_TYPE_DEBUG))
        sub_1000E5AC4();
      goto LABEL_57;
    }
    v62 = (void *)qword_1001ABBA0;
    v19 = v54;
    v13 = v72;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5BC4(v62, v19);
  }
  if ((byte_1001ABBA8 & 1) != 0)
    goto LABEL_16;
  v69 = v12;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v71 = v10;
  obja = v10;
  v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(_QWORD *)v89 != v45)
          objc_enumerationMutation(obja);
        v47 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)j);
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v82, CFSTR("experimentName"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, CFSTR("streamName"));

        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, CFSTR("enoughHistory"));

        v51 = &off_10016EB40;
        if (!v15)
        {
          if (objc_msgSend(v19, "count", &off_10016EB40))
            v51 = &off_10016EB58;
          else
            v51 = &off_10016EB40;
        }
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v51, CFSTR("writeState"));
        objc_msgSend(v48, "setObject:forKeyedSubscript:", &off_10016EB70, CFSTR("numberOfWrittenEvents"));
        objc_msgSend(v83, "addObject:", v48);

      }
      v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
    }
    while (v44);
  }

  v52 = v83;
  v53 = v83;

  v12 = v69;
  v10 = v71;
  v13 = v72;
LABEL_61:

  objc_autoreleasePoolPop(v13);
  return v52;
}

+ (void)addCurrentStateToEvents:(id)a3 forEventStream:(id)a4
{
  id v5;
  void *v6;
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
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;

  v33 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceBatteryPercentageStream](_DKSystemEventStreams, "deviceBatteryPercentageStream"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForDoNotDisturbStatus](_CDContextQueries, "keyPathForDoNotDisturbStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams doNotDisturbStream](_DKSystemEventStreams, "doNotDisturbStream"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/charging/topOffCheckpoint")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("/charging/smartTopOffCheckpoint"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v21));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v23));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastObject"));
    v27 = v26;
    if (v26)
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
    else
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dateByAddingTimeInterval:", -2592000.0));
    v29 = (void *)v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v24));
    v31 = objc_msgSend(v30, "integerValue");

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", v5, v29, v25, v31, 0));
    if (v32)
      objc_msgSend(v33, "addObject:", v32);

  }
}

+ (id)writeStream:(id)a3 toFileHandle:(id)a4 withEventPredicate:(id)a5 withStore:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  void *context;
  id v66;
  void *v68;
  id v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t *v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[4];
  id v86;
  _BYTE v87[32];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];

  v9 = a3;
  v69 = a4;
  v10 = a5;
  v66 = a6;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v11, CFSTR("streamName"));

  objc_msgSend(v70, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("enoughHistory"));
  objc_msgSend(v70, "setObject:forKeyedSubscript:", &off_10016EB88, CFSTR("writeState"));
  objc_msgSend(v70, "setObject:forKeyedSubscript:", &off_10016EB70, CFSTR("numberOfWrittenEvents"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v15 = objc_msgSend(v12, "isEqualToString:", v14);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 0")));
    v93[0] = v16;
    v93[1] = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v17));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5E08();
LABEL_19:

    goto LABEL_20;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsLockedImputedStream](_DKSystemEventStreams, "deviceIsLockedImputedStream"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  v22 = objc_msgSend(v19, "isEqualToString:", v21);

  if (v22)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 0")));
    v92[0] = v16;
    v92[1] = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v23));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5E94();
    goto LABEL_19;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceLowPowerModeStream](_DKSystemEventStreams, "deviceLowPowerModeStream"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
  v27 = objc_msgSend(v24, "isEqualToString:", v26);

  if (v27)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 0")));
    v91[0] = v16;
    v91[1] = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v28));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5F20();
    goto LABEL_19;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams defaultPairedDeviceNearbyStream](_DKSystemEventStreams, "defaultPairedDeviceNearbyStream"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
  v32 = objc_msgSend(v29, "isEqualToString:", v31);

  if (v32)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 1")));
    v90[0] = v16;
    v90[1] = v10;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v33));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E5FAC();
    goto LABEL_19;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("/system/TLC"));

  if (v35)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 0")));
    v89[0] = v16;
    v89[1] = v10;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v36));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E6038();
    goto LABEL_19;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams motionStream](_DKSystemEventStreams, "motionStream"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "name"));
  v40 = objc_msgSend(v37, "isEqualToString:", v39);

  if (v40)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value.integerValue != 1")));
    v88[0] = v16;
    v88[1] = v10;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v41));

    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E60C4();
    goto LABEL_19;
  }
  v18 = v10;
LABEL_20:
  context = objc_autoreleasePoolPush();
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\":[]"), v42));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "dataUsingEncoding:", 4));
  objc_msgSend(v69, "writeData:", v43);
  v44 = objc_alloc((Class)BMDKEventStream);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  v46 = objc_msgSend(v44, "initWithDKStreamIdentifier:contentProtection:", v45, NSFileProtectionCompleteUntilFirstUserAuthentication);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "publisherFromStartTime:", 0.0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mapWithTransform:", &stru_10015F020));

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1000848D0;
  v85[3] = &unk_10015F048;
  v49 = v18;
  v86 = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "filterWithIsIncluded:", v85));

  v51 = objc_alloc((Class)BPSCountWindowAssigner);
  v52 = objc_msgSend(objc_alloc((Class)BPSAggregator), "initWithAccumulator:closure:", &__NSArray0__struct, &stru_10015F088);
  v53 = objc_msgSend(v51, "initWithCapacity:aggregator:", 128, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "windowWithAssigner:", v53));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mapWithTransform:", &stru_10015F0C8));

  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_1000848F0;
  v71[3] = &unk_10015F110;
  v75 = &v81;
  v76 = a1;
  v74 = &v77;
  v56 = v69;
  v72 = v56;
  v57 = v9;
  v73 = v57;
  v58 = objc_msgSend(v55, "sinkWithCompletion:receiveInput:", &stru_10015F0E8, v71);
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v82[3]));
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v59, CFSTR("numberOfWrittenEvents"));

  if (v82[3])
  {
    v60 = (id)qword_1001ABBA0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v82[3]));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "name"));
      sub_1000E5DB8(v61, v62, (uint64_t)v87);
    }

    objc_msgSend(v70, "setObject:forKeyedSubscript:", &off_10016EBA0, CFSTR("writeState"));
  }
  else
  {
    if (v78[3])
      objc_msgSend(v70, "setObject:forKeyedSubscript:", &off_10016EBB8, CFSTR("writeState"));
    objc_msgSend(a1, "replaceJSONDataWithNull:atWriteHandle:", v43, v56);
  }
  v63 = v70;

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  objc_autoreleasePoolPop(context);
  return v63;
}

+ (void)replaceJSONDataWithNull:(id)a3 atWriteHandle:(id)a4
{
  id v5;
  _BYTE *v6;
  void *v7;
  _BYTE *v8;
  char *v9;
  char v10;

  v5 = a4;
  v6 = objc_msgSend(a3, "length");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v10 = 0;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_msgSend(v7, "appendBytes:length:", &v10, 1);
      --v8;
    }
    while (v8);
  }
  v9 = (char *)((_BYTE *)objc_msgSend(v5, "offsetInFile") - v6);
  objc_msgSend(v5, "seekToFileOffset:", v9);
  objc_msgSend(v5, "writeData:", v7);
  objc_msgSend(v5, "seekToFileOffset:", v9);

}

+ (void)extendJSONArrayWithAnotherArray:(id)a3 toFileHandler:(id)a4 isPreviouslyEmpty:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4));
  objc_msgSend(v11, "seekToFileOffset:", (char *)objc_msgSend(v11, "offsetInFile") - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readDataOfLength:", 1));
  objc_msgSend(v11, "seekToFileOffset:", (char *)objc_msgSend(v11, "offsetInFile") - 1);
  if (!a5)
    objc_msgSend(v11, "writeData:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", 1, (char *)objc_msgSend(v7, "length") - 2));

  objc_msgSend(v11, "writeData:", v10);
  objc_msgSend(v11, "writeData:", v9);

}

+ (id)fuzzedDateFromDate:(id)a3 forStreamName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABB78, "objectForKeyedSubscript:", a4));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
  }
  else
  {
    v9 = *(double *)&qword_1001AA730;
  }
  objc_msgSend(v5, "timeIntervalSince1970");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v9 * floor(v10 / v9)));

  return v11;
}

+ (id)metadataWitDisallowedKeysRemoveForMedatata:(id)a3 forStreamName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ABB88, "objectForKeyedSubscript:", a4));
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), (_QWORD)v15);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v13 = objc_msgSend(v7, "copy");
  }
  else
  {
    v13 = v5;
  }

  return v13;
}

+ (BOOL)shouldExcludeEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue") == (id)8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stream"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceActivityLevelStream](_DKSystemEventStreams, "deviceActivityLevelStream"));
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      v9 = v8;

      if (v9 <= 1.0)
      {
        LOBYTE(v10) = 1;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stream"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey isAppleAudioDevice](_DKBluetoothMetadataKey, "isAppleAudioDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
    v10 = objc_msgSend(v15, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

LABEL_10:
  return v10;
}

+ (id)processEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSDateInterval *v14;
  void *v15;
  void *v16;
  NSDateInterval *v17;
  void *v18;
  id v19;
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
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v70;
  uint64_t v71;
  id v72;
  id obj;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[3];
  _QWORD v93[3];
  _BYTE v94[128];
  _BYTE v95[128];

  v3 = a3;
  v72 = objc_alloc_init((Class)NSMutableArray);
  if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stream")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream")), v7 = objc_msgSend(v5, "isEqual:", v6), v6, v5, v4, v7))
  {
    objc_msgSend(v3, "sortUsingComparator:", &stru_10015F150);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v84;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v84 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_new(NSDateInterval);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endDate"));
          v17 = -[NSDateInterval initWithStartDate:endDate:](v14, "initWithStartDate:endDate:", v15, v16);

          objc_msgSend(v8, "addObject:", v17);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v10);
    }

    v88 = 0;
    v89 = &v88;
    v90 = 0x2050000000;
    v18 = (void *)qword_1001ABBB8;
    v91 = qword_1001ABBB8;
    if (!qword_1001ABBB8)
    {
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_100089008;
      v87[3] = &unk_10015D610;
      v87[4] = &v88;
      sub_100089008((uint64_t)v87);
      v18 = (void *)v89[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v88, 8);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "loIAtBeginningAndEndOfIntervals:", v8));

  }
  else
  {
    v70 = 0;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v3;
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  if (v75)
  {
    v71 = 0;
    v74 = *(_QWORD *)v80;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v80 != v74)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)v20);
        v22 = objc_autoreleasePoolPush();
        if ((objc_msgSend((id)objc_opt_class(a1), "shouldExcludeEvent:", v21) & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stream"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));

          v25 = (void *)objc_opt_class(a1);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fuzzedDateFromDate:forStreamName:", v26, v24));

          v27 = (void *)objc_opt_class(a1);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fuzzedDateFromDate:forStreamName:", v28, v24));

          v92[0] = CFSTR("start");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone"));
          objc_msgSend(v77, "timeIntervalSince1970WithTimeZoneOffset:", (double)(uint64_t)objc_msgSend(v29, "secondsFromGMT"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v93[0] = v30;
          v92[1] = CFSTR("end");
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone"));
          objc_msgSend(v76, "timeIntervalSince1970WithTimeZoneOffset:", (double)(uint64_t)objc_msgSend(v31, "secondsFromGMT"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v92[2] = CFSTR("stream");
          v93[1] = v32;
          v93[2] = v24;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 3));
          v34 = objc_msgSend(v33, "mutableCopy");

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stream"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams nextEventForTopOffProtectionStream](_DKSystemEventStreams, "nextEventForTopOffProtectionStream"));
          LODWORD(v30) = objc_msgSend(v35, "isEqual:", v36);

          if ((_DWORD)v30)
          {
            objc_msgSend(v21, "doubleValue");
            v38 = v37;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeZone"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38 + (double)(uint64_t)objc_msgSend(v39, "secondsFromGMT")));
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("value"));

LABEL_38:
            goto LABEL_39;
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stream"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams nextEventForTopOffProtectionStream](_DKSystemEventStreams, "nextEventForTopOffProtectionStream"));
          v43 = objc_msgSend(v41, "isEqual:", v42);

          if (v43)
          {
            objc_msgSend(v21, "doubleValue");
            v44 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          }
          else
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stream"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "name"));
            v47 = objc_msgSend(v46, "isEqual:", CFSTR("/dasd/activityprofile"));

            if (v47)
              v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringValue"));
            else
              v44 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v21, "integerValue")));
          }
          v48 = (void *)v44;
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v44, CFSTR("value"));

          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metadata"));
          if (v49)
          {
            v50 = (void *)objc_opt_class(a1);
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "metadata"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "metadataWitDisallowedKeysRemoveForMedatata:forStreamName:", v51, v24));

            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stream"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "name"));
            LODWORD(v51) = objc_msgSend(v54, "isEqual:", CFSTR("/dasd/activityprofile"));

            if ((_DWORD)v51)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("metadata")));
              v56 = v55 == 0;

              if (!v56)
              {
                v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("metadata")));

                v58 = 0;
                v52 = (void *)v57;
                goto LABEL_36;
              }
LABEL_35:
              v58 = 0;
            }
            else
            {
              if (!+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
                goto LABEL_35;
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stream"));
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams deviceIsPluggedInStream](_DKSystemEventStreams, "deviceIsPluggedInStream"));
              v62 = objc_msgSend(v60, "isEqual:", v61);

              if (!v62)
                goto LABEL_35;
              v63 = objc_msgSend(v52, "mutableCopy");
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndexedSubscript:", v71));

              if (v64)
              {
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndexedSubscript:", v71));
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("loi")));
                objc_msgSend(v63, "setObject:forKeyedSubscript:", v66, CFSTR("loi"));

              }
              else
              {
                objc_msgSend(v63, "setObject:forKeyedSubscript:", &stru_1001617C8, CFSTR("loi"));
              }
              v58 = v63;

              ++v71;
              v52 = v58;
            }
LABEL_36:
            objc_msgSend(v34, "addEntriesFromDictionary:", v52);

          }
          objc_msgSend(v72, "addObject:", v34);
          goto LABEL_38;
        }
LABEL_39:
        objc_autoreleasePoolPop(v22);
        v20 = (char *)v20 + 1;
      }
      while (v75 != v20);
      v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      v75 = v67;
    }
    while (v67);
  }

  v68 = (void *)qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E61F8(v68, v72);

  return v72;
}

+ (unint64_t)writeToFileWithContextDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint32_t v21;
  id v22;
  unsigned int v23;
  _BOOL4 v24;
  unint64_t v25;
  int v26;
  void *v27;
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](_DASTrialManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "factorWithName:", off_1001AA720));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "doubleValue"), v8 > 0.0) && (objc_msgSend(v7, "doubleValue"), v9 < 100.0))
  {
    objc_msgSend(v7, "doubleValue");
    v11 = v10;
    v12 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E6450(v11, v12);
  }
  else
  {
    v13 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E63E4(v13, v14, v15, v16, v17, v18, v19, v20);
    v11 = 10;
  }
  v21 = arc4random_uniform(v11);
  if (byte_1001ABBA8 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E6334();
    if ((byte_1001ABBA8 & 1) != 0)
    {
      v22 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v29 = 0;
    v26 = DRSubmitLog(CFSTR("com.apple.osintelligence"), CFSTR("ResourceUsage"), CFSTR("MediumReport"), v4, CFSTR("resourceUsageDB"), CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json"), 1, &v29);
    v22 = v29;
    if (!v26)
    {
      v27 = (void *)qword_1001ABBA0;
      if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
        sub_1000E62A8(v27, v22);
      v25 = 85;
      goto LABEL_28;
    }
LABEL_22:
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E627C();
    v25 = 80;
LABEL_28:

    goto LABEL_29;
  }
  if (!v21)
    goto LABEL_21;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E63B8();
  v23 = objc_msgSend((id)objc_opt_class(a1), "generateCRFile");
  v24 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG);
  if (v23)
  {
    if (v24)
      sub_1000E6360();
    v25 = 81;
  }
  else
  {
    if (v24)
      sub_1000E638C();
    v25 = 86;
  }
LABEL_29:

  return v25;
}

+ (BOOL)generateCRFile
{
  off_t st_size;
  int v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[6];
  stat v35;

  memset(&v35, 0, sizeof(v35));
  if (stat((const char *)objc_msgSend(CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json"), "UTF8String"), &v35)|| (st_size = v35.st_size, v35.st_size <= 0))
  {
    v9 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E64D0(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  v3 = open((const char *)objc_msgSend(CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json"), "UTF8String"), 0);
  if (v3 < 0)
  {
LABEL_9:
    unlink((const char *)objc_msgSend(CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json"), "UTF8String"));
LABEL_10:
    LOBYTE(v8) = 0;
    return v8;
  }
  v4 = v3;
  v5 = mmap(0, st_size, 1, 1, v3, 0);
  if (!v5)
  {
    v17 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
      sub_1000E6540(v17, v18, v19, v20, v21, v22, v23, v24);
    close(v4);
    goto LABEL_9;
  }
  v6 = v5;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100085DAC;
  v34[3] = &unk_10015F170;
  v34[4] = v5;
  v34[5] = st_size;
  v7 = OSAWriteLogForSubmission(CFSTR("158"), CFSTR("dasd_data_collection"), 0, 0, v34);
  munmap(v6, st_size);
  close(v4);
  if ((v7 & 1) == 0)
  {
    v25 = qword_1001ABBA0;
    v8 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG);
    if (!v8)
      return v8;
    sub_1000E65B0(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_10;
  }
  LOBYTE(v8) = 1;
  return v8;
}

+ (void)generateUsageVectorRepresentationWithStreamAUsage:(id)a3 streamBUsage:(id)a4 outputRepresentationA:(id)a5 outputRepresentationB:(id)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _UNKNOWN **v26;
  _UNKNOWN **v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  BOOL v42;
  void *i;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;

  v55 = a3;
  v9 = a4;
  v49 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v52 = v9;
  if (objc_msgSend(v55, "count"))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v56 = v10;
    while (v13 < (unint64_t)objc_msgSend(v9, "count", v49))
    {
      v51 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectAtIndexedSubscript:", v12));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v13));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "startDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "earlierDate:", v18));

      objc_msgSend(v11, "timeIntervalSinceDate:", v19);
      v53 = v19;
      if (v20 < 0.0)
      {
        v21 = v19;

        v11 = v21;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "earlierDate:", v23));

      do
      {
        v25 = v11;
        if (objc_msgSend(v15, "containsDate:", v11))
          v26 = &off_10016EB28;
        else
          v26 = &off_10016EB70;
        objc_msgSend(v49, "addObject:", v26);
        if (objc_msgSend(v16, "containsDate:", v11))
          v27 = &off_10016EB28;
        else
          v27 = &off_10016EB70;
        objc_msgSend(v56, "addObject:", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 300.0));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
        objc_msgSend(v11, "timeIntervalSinceDate:", v28);
        v30 = v29;

        if (v30 >= 0.0)
          ++v12;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
        objc_msgSend(v11, "timeIntervalSinceDate:", v31);
        v33 = v32;

        if (v33 >= 0.0)
          ++v13;
        objc_msgSend(v11, "timeIntervalSinceDate:", v24);
      }
      while (v34 < 0.0);

      v14 = v24;
      v9 = v52;
      v10 = v56;
      if (v12 >= (unint64_t)objc_msgSend(v55, "count"))
        goto LABEL_22;
    }
    v24 = v14;
  }
  else
  {
    v24 = 0;
    v13 = 0;
    v12 = 0;
  }
LABEL_22:
  if (v12 >= (unint64_t)objc_msgSend(v55, "count", v49))
  {
    v36 = v50;
  }
  else
  {
    v35 = v55;
    v36 = v50;
    do
    {
      v54 = v24;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v12));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "startDate"));
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laterDate:", v38));

      v57 = v37;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "endDate"));

      v11 = (void *)v39;
      do
      {
        v40 = v11;
        objc_msgSend(v50, "addObject:", &off_10016EB28);
        objc_msgSend(v10, "addObject:", &off_10016EB70);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 300.0));

        objc_msgSend(v11, "timeIntervalSinceDate:", v24);
      }
      while (v41 < 0.0);
      ++v12;

      v42 = v12 >= (unint64_t)objc_msgSend(v55, "count");
      v35 = v55;
    }
    while (!v42);
  }
  for (i = v52; v13 < (unint64_t)objc_msgSend(v52, "count"); i = v52)
  {
    v58 = v24;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "objectAtIndexedSubscript:", v13));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "laterDate:", v45));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
    v11 = (void *)v46;
    do
    {
      v47 = v11;
      objc_msgSend(v36, "addObject:", &off_10016EB70);
      objc_msgSend(v10, "addObject:", &off_10016EB28);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", 300.0));

      objc_msgSend(v11, "timeIntervalSinceDate:", v24);
    }
    while (v48 < 0.0);
    ++v13;

  }
}

+ (void)convertFocusModeStream:(id)a3 toKnowledgeStoreStream:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];

  v5 = a3;
  v6 = a4;
  v7 = (uint64_t)+[BMPublicStreamUtilities streamForStreamIdentifier:](BMPublicStreamUtilities, "streamForStreamIdentifier:", v5);
  if (v7 && v7 < 40)
  {
    v8 = objc_msgSend(objc_alloc((Class)BMStoreStream), "initWithPublicStream:", v7);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_1000865A4;
    v28[4] = sub_1000865B4;
    v29 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisherFromStartTime:", 0.0));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000865BC;
    v23[3] = &unk_10015F198;
    v24 = v11;
    v25 = v9;
    v26 = v5;
    v27 = v30;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100086638;
    v17[3] = &unk_10015F1C0;
    v21 = v30;
    v22 = v28;
    v13 = v10;
    v18 = v13;
    v14 = v25;
    v19 = v14;
    v15 = v24;
    v20 = v15;
    v16 = objc_msgSend(v12, "sinkWithCompletion:receiveInput:", v23, v17);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);

  }
  else if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_ERROR))
  {
    sub_1000E6620();
  }

}

+ (BOOL)convertBiomeStream:(id)a3 toKnowledgeStoreStream:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("UserFocusComputedMode"));
  if (v8)
  {
    objc_msgSend(a1, "deleteEventsFromStream:", v7);
    objc_msgSend(a1, "convertFocusModeStream:toKnowledgeStoreStream:", v6, v7);
  }

  return v8;
}

+ (void)deleteConvertedStreams
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100086958;
  v2[3] = &unk_10015EFE0;
  v2[4] = a1;
  objc_msgSend((id)qword_1001ABB90, "enumerateKeysAndObjectsUsingBlock:", v2);
}

+ (void)deleteEventsFromStream:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *context;
  void *v12;
  void *v13;

  v3 = a3;
  v12 = (void *)os_transaction_create("delete-events");
  context = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
  while (1)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", v3));
    v13 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v6, v8, 0, 32, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeQuery:error:", v9, 0));
    if (!objc_msgSend(v10, "count"))
      break;
    objc_msgSend(v4, "deleteObjects:error:", v10, 0);

    objc_autoreleasePoolPop(v5);
  }

  objc_autoreleasePoolPop(v5);
  objc_autoreleasePoolPop(context);

}

+ (void)submitSystemTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", v5));

  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v12 = 0;
    v11 = objc_msgSend(v10, "submitTaskRequest:error:", v3, &v12);
    v8 = v12;

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_ERROR))
      sub_1000E6700();
    goto LABEL_7;
  }
  v7 = (void *)qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ task request already exists, backing out of resubmission", buf, 0xCu);

LABEL_7:
  }

}

+ (void)registerForDataCollectionTestNotification
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD v5[5];
  int out_token;

  if (+[_DASConfig isInternalBuild](_DASConfig, "isInternalBuild"))
  {
    out_token = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100086D74;
    v5[3] = &unk_10015F200;
    v5[4] = a1;
    notify_register_dispatch("com.apple.dasd.dataCollectionTasks.testModeRun", &out_token, v4, v5);

  }
}

+ (void)schedule
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
  v5 = (void *)qword_1001ABBA0;
  qword_1001ABBA0 = v4;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100087274;
  v22[3] = &unk_10015F220;
  v22[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dataCollection"), 0, v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000872B8;
  v21[3] = &unk_10015F220;
  v21[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.analyticsReporting"), 0, v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000872FC;
  v20[3] = &unk_10015F220;
  v20[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicBackgroundAppRefreshReporting"), 0, v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100087340;
  v19[3] = &unk_10015F220;
  v19[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicBasic"), 0, v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100087394;
  v18[3] = &unk_10015F220;
  v18[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicNetworking"), 0, v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000873E8;
  v17[3] = &unk_10015F220;
  v17[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicPlugin"), 0, v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008743C;
  v16[3] = &unk_10015F220;
  v16[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicPluginWiFi"), 0, v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100087490;
  v15[3] = &unk_10015F220;
  v15[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicInactivity"), 0, v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000874E4;
  v14[3] = &unk_10015F220;
  v14[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicInactivityPlugin"), 0, v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100087538;
  v13[3] = &unk_10015F220;
  v13[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicInactivityPluginWiFi"), 0, v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008758C;
  v12[3] = &unk_10015F220;
  v12[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityBasic"), 0, v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000875E0;
  v11[3] = &unk_10015F220;
  v11[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityNetworking"), 0, v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100087634;
  v10[3] = &unk_10015F220;
  v10[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityPlugin"), 0, v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100087688;
  v9[3] = &unk_10015F220;
  v9[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityPluginWiFi"), 0, v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000876DC;
  v8[3] = &unk_10015F220;
  v8[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityInactivity"), 0, v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087730;
  v7[3] = &unk_10015F220;
  v7[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityInactivityPlugin"), 0, v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100087784;
  v6[3] = &unk_10015F220;
  v6[4] = a1;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.dailyPeriodicUtilityInactivityPluginWiFi"), 0, v6);
  objc_msgSend(a1, "scheduleDASTelemetryActivities");

}

+ (void)scheduleDASTelemetryActivities
{
  id v2;
  id v3;

  v2 = +[_DASDataCollectionSUTask taskWithName:intervalDuration:withLogger:](_DASDataCollectionSUTask, "taskWithName:intervalDuration:withLogger:", CFSTR("com.apple.dasd.dataCollectiontask.dummyAutoSU"), qword_1001ABBA0, 900.0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyDataCollection sharedInstance](_DASPolicyDataCollection, "sharedInstance"));
  objc_msgSend(v3, "scheduleTelemetry");

}

+ (void)reportDataOnExperiments:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _BYTE v17[24];

  v4 = a3;
  v5 = qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "schedule: Running data collection background task", v17, 2u);
  }
  objc_msgSend((id)objc_opt_class(a1), "loadParameters");
  v6 = objc_msgSend((id)objc_opt_class(a1), "experimentsToWrite");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "count");
  v9 = qword_1001ABBA0;
  v10 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)v17 = 138412290;
      *(_QWORD *)&v17[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "schedule: attempting to write experiments: %@", v17, 0xCu);
    }
    v11 = objc_msgSend(a1, "writeExperiments:atFileName:withTask:", v7, CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json"), v4);
    v12 = qword_1001ABBA0;
    v13 = os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO);
    if (v11 < 1)
    {
      if (v13)
      {
        *(_WORD *)v17 = 0;
        v14 = "schedule: didn't write any experiment to crash reporter (CR)";
        v15 = v12;
        v16 = 2;
        goto LABEL_13;
      }
    }
    else if (v13)
    {
      *(_DWORD *)v17 = 134218242;
      *(_QWORD *)&v17[4] = v11;
      *(_WORD *)&v17[12] = 2112;
      *(_QWORD *)&v17[14] = CFSTR("/var/mobile/Library/DuetActivityScheduler/dasd_data.json");
      v14 = "schedule: wrote %lld experiments to crash reporter (CR) and %@";
      v15 = v12;
      v16 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, v17, v16);
    }
    objc_msgSend(a1, "deleteConvertedStreams", *(_OWORD *)v17, *(_QWORD *)&v17[16]);
    goto LABEL_15;
  }
  if (v10)
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "schedule: no experiments to write post sampling", v17, 2u);
  }
LABEL_15:

}

+ (void)reportBackgroundAppRefreshAnalytics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];

  v17 = a3;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E6880();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBARMetricRecorder sharedInstance](_DASBARMetricRecorder, "sharedInstance", v17));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchLatestBARMetric"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgRefreshSubmissionCount")));
  if (v5)
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgRefreshSubmissionCount")));
  else
    v6 = &off_10016EB70;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgRefreshCompletionCount")));
  if (v7)
    v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgRefreshCompletionCount")));
  else
    v8 = &off_10016EB70;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PushLaunchSubmissionCount")));
  if (v9)
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PushLaunchSubmissionCount")));
  else
    v10 = &off_10016EB70;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PushLaunchCompletionCount")));
  if (v11)
    v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PushLaunchCompletionCount")));
  else
    v12 = &off_10016EB70;

  v23[0] = CFSTR("BgRefreshSubmissionCount");
  v23[1] = CFSTR("BgRefreshCompletionCount");
  v24[0] = v6;
  v24[1] = v8;
  v23[2] = CFSTR("PushLaunchSubmissionCount");
  v23[3] = CFSTR("PushLaunchCompletionCount");
  v24[2] = v10;
  v24[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
  v14 = qword_1001ABBA0;
  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending BackgroundAppRefreshActivity analytics to CA: %@", buf, 0xCu);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100087D2C;
  v19[3] = &unk_10015DA30;
  v20 = v13;
  v15 = v13;
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.BackgroundAppRefreshActivityStats"), v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBARMetricRecorder sharedInstance](_DASBARMetricRecorder, "sharedInstance"));
  objc_msgSend(v16, "resetBARMetric");

}

+ (void)reportWakeAnalytics:(id)a3
{
  id v3;
  _QWORD v4[4];
  unsigned int v5;

  if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEBUG))
    sub_1000E68AC();
  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.appResume"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100087DE4;
  v4[3] = &unk_10015F240;
  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BGAppKillDemo"));
  AnalyticsSendEventLazy(CFSTR("com.apple.dasd.developerSetting"), v4);

}

+ (int)boundedDurationFromDuration:(double)a3
{
  double v4;

  if (a3 < 1.0)
    return 0;
  v4 = a3 / 60.0;
  if (v4 <= 5.0)
    return 5;
  if (v4 <= 15.0)
    return 15;
  if (v4 <= 30.0)
    return 30;
  if (v4 <= 60.0)
    return 60;
  if (v4 <= 120.0)
    return 120;
  if (v4 <= 240.0)
    return 240;
  if (v4 <= 480.0)
    return 480;
  if (v4 <= 720.0)
    return 720;
  if (v4 <= 1440.0)
    return 1440;
  if (v4 <= 2880.0)
    return 2880;
  if (v4 <= 10080.0)
    return 10080;
  return 20160;
}

+ (void)reportAnalyticsForActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _UNKNOWN **v18;
  void *v19;
  _UNKNOWN **v20;
  _UNKNOWN **v21;
  _UNKNOWN **v22;
  _UNKNOWN **v23;
  _UNKNOWN **v24;
  _UNKNOWN **v25;
  _UNKNOWN **v26;
  _UNKNOWN **v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *context;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  _QWORD v37[6];
  _QWORD v38[6];

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  if (v3)
  {
    context = v4;
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.dasd.dailyPeriodic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v3));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v12 = floor((v8 - v11) / 3600.0);
      if (v12 > 2.0)
        v12 = 100.0;
    }
    else
    {
      v12 = 0.0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    objc_msgSend(v5, "setObject:forKey:", v13, v3);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

    v31 = v5;
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10 * vcvtmd_s64_f64(v17 / 10.0)));

    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
    v20 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19));

    v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v14)));
    v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v14)));
    v38[0] = v3;
    v37[0] = CFSTR("Name");
    v37[1] = CFSTR("HoursSinceLastRun");
    if (v10)
      v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    else
      v23 = &off_10016EBD0;
    if (v18)
      v24 = v18;
    else
      v24 = &off_10016EBD0;
    v38[1] = v23;
    v38[2] = v24;
    v37[2] = CFSTR("BatteryLevel");
    v37[3] = CFSTR("PluginStatus");
    if (v20)
      v25 = v20;
    else
      v25 = &off_10016EBD0;
    if (v21)
      v26 = v21;
    else
      v26 = &off_10016EBD0;
    v38[3] = v25;
    v38[4] = v26;
    v37[4] = CFSTR("WiFiQuality");
    v37[5] = CFSTR("CellQuality");
    if (v22)
      v27 = v22;
    else
      v27 = &off_10016EBD0;
    v38[5] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 6));
    if (v10)

    v29 = qword_1001ABBA0;
    if (os_log_type_enabled((os_log_t)qword_1001ABBA0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Reporting: %@", buf, 0xCu);
    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100088360;
    v33[3] = &unk_10015DA30;
    v34 = v28;
    v30 = v28;
    AnalyticsSendEventLazy(CFSTR("com.apple.dasd.analyticsControl"), v33);

    v4 = context;
  }
  objc_autoreleasePoolPop(v4);

}

+ (double)computeUsageCorrelationBetweenAirPodsAMPStreamsWithStore:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  double v37;
  void *v38;
  NSObject *v39;
  double v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  char *v62;
  id v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  id v71;
  id v72;
  unint64_t v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  double v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v109;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *context;
  char contexta;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  id v129;
  const __CFString *v130;
  void *v131;
  _BYTE v132[128];
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  _QWORD v137[2];
  _QWORD v138[2];

  v118 = a3;
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1));
  context = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKNowPlayingMetadataKey playing](_DKNowPlayingMetadataKey, "playing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery predicateForObjectsWithMetadataKey:andIntegerValue:](_DKEventQuery, "predicateForObjectsWithMetadataKey:andIntegerValue:", v4, 1));
  v138[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", CFSTR("com.apple.Music")));
  v137[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", CFSTR("com.apple.tv")));
  v137[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v8));
  v138[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v138, 2));
  v11 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams nowPlayingStream](_DKSystemEventStreams, "nowPlayingStream"));
  v136 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1));
  v113 = (void *)v3;
  v135 = v3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v135, 1));
  v120 = (void *)v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v11, v13, 0, 0, v14));

  objc_msgSend(v15, "setResultType:", 2);
  v129 = 0;
  v116 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "executeQuery:error:", v15, &v129));
  v114 = v129;
  if (v114)
  {
    v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000E69CC();

  }
  else if (objc_msgSend(v16, "count"))
  {
    v18 = 0;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
      objc_msgSend(v20, "timeIntervalSince1970");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v21 / 300.0) * 300.0));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
      objc_msgSend(v24, "timeIntervalSince1970");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v25 / 300.0) * 300.0));

      if (++v18 < (unint64_t)objc_msgSend(v16, "count"))
      {
        while (1)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
          objc_msgSend(v28, "timeIntervalSince1970");
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v29 / 300.0) * 300.0));

          objc_msgSend(v30, "timeIntervalSinceDate:", v26);
          if (v31 >= 5.0)
            break;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "endDate"));
          objc_msgSend(v33, "timeIntervalSince1970");
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v34 / 300.0) * 300.0));

          ++v18;
          v26 = v35;
          if (v18 >= (unint64_t)objc_msgSend(v16, "count"))
            goto LABEL_13;
        }

      }
      v35 = v26;
LABEL_13:
      v36 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v22, v35);
      objc_msgSend(v119, "addObject:", v36);

    }
    while (v18 < (unint64_t)objc_msgSend(v16, "count"));
  }

  objc_autoreleasePoolPop(context);
  if (v114)
  {
    v37 = 1.79769313e308;
    v38 = v111;
  }
  else
  {
    v39 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
    v38 = v111;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      sub_1000E6A2C();

    v40 = (double)(unint64_t)objc_msgSend(v119, "count");
    if (*(double *)&qword_1001AA740 <= v40)
    {
      v109 = objc_autoreleasePoolPush();
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[_DKQuery predicateForEventsWithIntegerValue:](_DKQuery, "predicateForEventsWithIntegerValue:", 1));
      v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v42 = 0;
      contexta = 0;
      do
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams bluetoothIsConnectedStream](_DKSystemEventStreams, "bluetoothIsConnectedStream"));
        v134 = v43;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v134, 1));
        v133 = v113;
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v133, 1));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v112, v44, v42, 256, v45));

        v128 = 0;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "executeQuery:error:", v46, &v128));
        v48 = v128;
        if (v48)
        {
          v106 = v48;
          v107 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
          v38 = v111;
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            sub_1000E69CC();

          objc_autoreleasePoolPop(v109);
          v37 = 1.79769313e308;
          goto LABEL_62;
        }
        v115 = v46;
        v117 = v42;
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v49 = v47;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v125;
          do
          {
            for (i = 0; i != v51; i = (char *)i + 1)
            {
              if (*(_QWORD *)v125 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)i);
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "metadata"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey isAppleAudioDevice](_DKBluetoothMetadataKey, "isAppleAudioDevice"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v56));
              v58 = objc_msgSend(v57, "BOOLValue");

              if (v58)
              {
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "metadata"));
                v60 = (void *)objc_claimAutoreleasedReturnValue(+[_DKBluetoothMetadataKey productID](_DKBluetoothMetadataKey, "productID"));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v60));
                v62 = (char *)objc_msgSend(v61, "unsignedIntegerValue");

                if ((unint64_t)(v62 - 8194) <= 0xD && ((1 << (v62 - 2)) & 0x3001) != 0)
                {
                  v64 = objc_alloc((Class)NSDateInterval);
                  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "startDate"));
                  objc_msgSend(v65, "timeIntervalSince1970");
                  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v66 / 300.0) * 300.0));
                  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "endDate"));
                  objc_msgSend(v68, "timeIntervalSince1970");
                  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v69 / 300.0) * 300.0));
                  v71 = objc_msgSend(v64, "initWithStartDate:endDate:", v67, v70);
                  objc_msgSend(v121, "addObject:", v71);

                }
                contexta = 1;
              }
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
          }
          while (v51);
        }

        v72 = objc_msgSend(v49, "count");
        v42 = v117 + 256;
      }
      while (v72 == (id)256);
      v38 = v111;
      if (objc_msgSend(v121, "count"))
      {
        v73 = 0;
        do
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectAtIndexedSubscript:", v73));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "startDate"));
          objc_msgSend(v75, "timeIntervalSince1970");
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v76 / 300.0) * 300.0));

          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectAtIndexedSubscript:", v73));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "endDate"));
          objc_msgSend(v79, "timeIntervalSince1970");
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v80 / 300.0) * 300.0));

          if (++v73 < (unint64_t)objc_msgSend(v121, "count"))
          {
            while (1)
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectAtIndexedSubscript:", v73));
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "startDate"));
              objc_msgSend(v83, "timeIntervalSince1970");
              v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v84 / 300.0) * 300.0));

              objc_msgSend(v85, "timeIntervalSinceDate:", v81);
              if (v86 >= 5.0)
                break;
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectAtIndexedSubscript:", v73));
              v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "endDate"));
              objc_msgSend(v88, "timeIntervalSince1970");
              v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", floor(v89 / 300.0) * 300.0));

              ++v73;
              v81 = v90;
              if (v73 >= (unint64_t)objc_msgSend(v121, "count"))
                goto LABEL_47;
            }

          }
          v90 = v81;
LABEL_47:
          v91 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v77, v90);
          objc_msgSend(v111, "addObject:", v91);

        }
        while (v73 < (unint64_t)objc_msgSend(v121, "count"));
      }

      objc_autoreleasePoolPop(v109);
      if (objc_msgSend(v111, "count"))
      {
        v92 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          sub_1000E696C();

        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_msgSend((id)objc_opt_class(a1), "generateUsageVectorRepresentationWithStreamAUsage:streamBUsage:outputRepresentationA:outputRepresentationB:", v119, v111, v93, v94);
        v37 = 1.0;
        if ((objc_msgSend(v93, "isEqual:", v94) & 1) == 0)
        {
          objc_msgSend(v93, "cooccurrencesWith:", v94);
          v37 = v95;
          v96 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection")));
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            sub_1000E6904(v96, v97, v98, v99, v100, v101, v102, v103);

          v130 = CFSTR("Correlation");
          v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37));
          v131 = v104;
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
          AnalyticsSendEvent(CFSTR("com.apple.dasd.airpods"), v105);

        }
      }
      else if ((contexta & 1) != 0)
      {
        v37 = 0.0;
      }
      else
      {
        v37 = 1.79769313e308;
      }
    }
    else
    {
      v41 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("dataCollection"), v40, *(double *)&qword_1001AA740));
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        sub_1000E68D8();

      v37 = 0.0;
    }
  }
LABEL_62:

  return v37;
}

@end
