@implementation CLDurianMetricManager

- (CLDurianMetricManager)init
{
  -[CLDurianMetricManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLDurianMetricManager)initWithQueue:(id)a3
{
  CLDurianMetricManager *v3;
  NSString *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLDurianMetricManager;
  v3 = -[CLDurianMetricManager init](&v10, "init", a3);
  if (v3)
  {
    v4 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier");
    if (objc_opt_class(AKAppleIDSession, v5))
      -[CLDurianMetricManager setAuthSession:](v3, "setAuthSession:", objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v4));
    v6 = objc_msgSend(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"), "aa_primaryAppleAccount");
    v7 = objc_msgSend(v6, "aa_personID");
    v8 = objc_msgSend(v6, "credential");
    -[CLDurianMetricManager setAuthHeaderValue:](v3, "setAuthHeaderValue:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Basic %@"), -[NSData base64EncodedStringWithOptions:](-[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v7, objc_msgSend(v8, "credentialItemForKey:", ACSearchPartyTokenKey)), "dataUsingEncoding:", 4), "base64EncodedStringWithOptions:", 0)));
    v3->_maintenanceSubmissionCount = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianMetricManager;
  -[CLDurianMetricManager dealloc](&v3, "dealloc");
}

- (void)submitConnectionMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitCAConnectionMetrics:forDevice:](self, "submitCAConnectionMetrics:forDevice:");
  -[CLDurianMetricManager submitPowerLogConnectionMetrics:forDevice:](self, "submitPowerLogConnectionMetrics:forDevice:", a3, a4);
}

- (void)submitFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitCAFirmwareUpdateMetrics:forDevice:](self, "submitCAFirmwareUpdateMetrics:forDevice:", a3, a4);
}

- (int64_t)encodeTransmitPower:(double)a3
{
  int64_t v4;

  if (a3 < 0.0)
    return 0;
  if (a3 <= 5.0)
    return 5;
  if (a3 <= 8.0)
    return 8;
  v4 = 20;
  if (a3 > 20.0)
    v4 = 25;
  if (a3 > 10.0)
    return v4;
  else
    return 10;
}

- (id)assembleCommonConnectionEventDataWithMetrics:(id)a3 forDevice:(id)a4
{
  id v7;
  unsigned int v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  double v12;
  unsigned int v13;

  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("event")), CFSTR("type"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10221DEB0, CFSTR("triggerCount"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("reason")), CFSTR("reason"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(a4, "beacon"), "systemVersion"), CFSTR("firmwareVersion"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a4, "accessoryTypeName"), CFSTR("productName"));
  if (objc_msgSend(objc_msgSend(a4, "beacon"), "manufacturerName")
    && objc_msgSend(objc_msgSend(a4, "beacon"), "modelName"))
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(a4, "beacon"), "manufacturerName"), CFSTR("manufacturer"));
    v8 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "beacon"), "manufacturerName"), "isEqualToString:", CFSTR("Apple"));
    v9 = objc_msgSend(objc_msgSend(a4, "beacon"), "modelName");
    if (v8)
      v10 = CFSTR("firstPartyModelName");
    else
      v10 = CFSTR("thirdPartyModelName");
    if (v8)
      v11 = CFSTR("firstPartyFirmwareVersion");
    else
      v11 = CFSTR("thirdPartyFirmwareVersion");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(a4, "beacon"), "systemVersion"), v11);
    objc_msgSend(objc_msgSend(a4, "beacon"), "txPower");
    goto LABEL_12;
  }
  v13 = objc_msgSend(a4, "isAirTag");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Apple"), CFSTR("manufacturer"));
  if (v13)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("FindMyAccessory"), CFSTR("firstPartyModelName"));
    v12 = 4.0;
LABEL_12:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianMetricManager encodeTransmitPower:](self, "encodeTransmitPower:", v12)), CFSTR("transmitPower"));
  }
  return v7;
}

- (void)submitPowerLogConnectionMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitPowerLogEvent:data:](self, "submitPowerLogEvent:data:", CFSTR("DeviceConnection"), objc_msgSend(-[CLDurianMetricManager assembleCommonConnectionEventDataWithMetrics:forDevice:](self, "assembleCommonConnectionEventDataWithMetrics:forDevice:", a3, a4), "copy"));
}

- (void)submitCAConnectionMetrics:(id)a3 forDevice:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  v5 = -[CLDurianMetricManager assembleCommonConnectionEventDataWithMetrics:forDevice:](self, "assembleCommonConnectionEventDataWithMetrics:forDevice:", a3, a4);
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duration")))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("duration")), CFSTR("duration"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send connection event\", \"event\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1014F3D3C;
  v7[3] = &unk_10215F370;
  v7[4] = v5;
  AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.connection"), v7);
}

- (void)submitCAFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;

  v5 = -[CLDurianMetricManager assembleCommonConnectionEventDataWithMetrics:forDevice:](self, "assembleCommonConnectionEventDataWithMetrics:forDevice:", a3, a4);
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("disconnectReason")))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("disconnectReason")), CFSTR("DisconnectReason"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("firmwareUpdateblockingTask")))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("firmwareUpdateblockingTask")), CFSTR("blockingTask"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 68289283;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send FW Update event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.firmwareUpdate"), (SEL)v5, v7, v8, v9, v10, v11, v12, (id)v13);
}

- (void)submitCAMaintenanceMetrics:(id)a3
{
  double v5;
  double Current;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  unsigned int v13;
  signed int v14;
  unsigned int v15;
  signed int v16;
  int v17;
  BOOL v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  int64_t maintenanceSubmissionCount;
  id v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  id v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  int v38;
  _QWORD v39[7];
  int v40;
  int v41;
  signed int v42;
  int v43;
  signed int v44;
  int v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  id v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  signed int v79;
  __int16 v80;
  signed int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;

  objc_msgSend(a3, "referenceTime");
  if (v5 != 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a3, "referenceTime");
    v8 = Current - v7;
    objc_msgSend(a3, "timeBetweenTriggers");
    v10 = v9;
    if (v8 <= 1.0)
    {
      v11 = 1;
    }
    else if (v8 >= 6.0)
    {
      if (v8 >= 7.0)
      {
        if (v8 >= 10.0)
        {
          if (v8 >= 15.0)
          {
            if (v8 >= 20.0)
            {
              if (v8 >= 28.0)
              {
                if (v8 >= 45.0)
                {
                  if (v8 >= 90.0)
                  {
                    if (v8 >= 180.0)
                    {
                      if (v8 >= 300.0)
                      {
                        if (v8 >= 600.0)
                          v11 = 601;
                        else
                          v11 = 600;
                      }
                      else
                      {
                        v11 = 300;
                      }
                    }
                    else
                    {
                      v11 = 180;
                    }
                  }
                  else
                  {
                    v11 = 90;
                  }
                }
                else
                {
                  v11 = 45;
                }
              }
              else
              {
                v11 = 28;
              }
            }
            else
            {
              v11 = 20;
            }
          }
          else
          {
            v11 = 15;
          }
        }
        else
        {
          v11 = 10;
        }
      }
      else
      {
        v11 = 7;
      }
    }
    else
    {
      v11 = 6;
    }
    if (v9 >= 0.0)
    {
      if (v9 <= 700.0)
      {
        v12 = 700;
      }
      else if (v9 <= 800.0)
      {
        v12 = 800;
      }
      else if (v9 <= 840.0)
      {
        v12 = 840;
      }
      else if (v9 <= 870.0)
      {
        v12 = 900;
      }
      else if (v9 <= 928.0)
      {
        v12 = 928;
      }
      else if (v9 <= 932.0)
      {
        v12 = 932;
      }
      else if (v9 <= 1000.0)
      {
        v12 = 1000;
      }
      else if (v9 <= 3060.0)
      {
        v12 = 3060;
      }
      else if (v9 <= 3600.0)
      {
        v12 = 3600;
      }
      else if (v9 <= 3960.0)
      {
        v12 = 3960;
      }
      else if (v9 <= 5400.0)
      {
        v12 = 5400;
      }
      else
      {
        v12 = 5401;
      }
    }
    else
    {
      v12 = -1;
    }
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEC8), "intValue");
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEE0), "intValue")+ v13;
    v15 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEF8), "intValue");
    v16 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEE0), "intValue")+ v15;
    v17 = 10 * (100 * v14 / (int)objc_msgSend(a3, "devices") / 10);
    if (v17)
      v18 = 1;
    else
      v18 = v14 <= 0;
    if (v18)
      v19 = v17;
    else
      v19 = 1;
    v20 = 10 * (100 * v16 / (int)objc_msgSend(a3, "devices") / 10);
    if (v20)
      v21 = 1;
    else
      v21 = v16 <= 0;
    if (v21)
      v22 = v20;
    else
      v22 = 1;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC490);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a3, "timeBetweenTriggers");
      v37 = (int)v24;
      v36 = objc_msgSend(a3, "devices");
      v35 = objc_msgSend(a3, "leashable");
      v34 = objc_msgSend(a3, "deviceTypes");
      v33 = objc_msgSend(a3, "neededDiscovery");
      v32 = objc_msgSend(a3, "coex");
      objc_msgSend(a3, "assertionDuration");
      v31 = (int)v25;
      v30 = objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DF10);
      v38 = v19;
      v26 = objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEF8);
      v27 = objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEC8);
      v28 = objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_10221DEE0);
      maintenanceSubmissionCount = self->_maintenanceSubmissionCount;
      *(_DWORD *)buf = 68293890;
      v48 = 2082;
      v47 = 0;
      v49 = "";
      v50 = 1026;
      v51 = (int)v8;
      v52 = 1026;
      v53 = v11;
      v54 = 1026;
      v55 = v37;
      v56 = 1026;
      v57 = v12;
      v58 = 1026;
      v59 = v36;
      v60 = 1026;
      v61 = v35;
      v62 = 2114;
      v63 = v34;
      v64 = 1026;
      v65 = v33;
      v66 = 1026;
      v67 = v32;
      v68 = 1026;
      v69 = v31;
      v70 = 2114;
      v71 = v30;
      v72 = 2114;
      v73 = v26;
      v19 = v38;
      v74 = 2114;
      v75 = v27;
      v76 = 2114;
      v77 = v28;
      v78 = 1026;
      v79 = v14;
      v80 = 1026;
      v81 = v16;
      v82 = 1026;
      v83 = v38;
      v84 = 1026;
      v85 = v22;
      v86 = 1026;
      v87 = maintenanceSubmissionCount;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #maint metrics\", \"duration\":%{public}d, \"durationBin\":%{public}d, \"tbm\":%{public}d, \"tbmBin\":%{public}d, \"durians\":%{public}d, \"leashable\":%{public}d, \"types\":%{public, location:escape_only}@, \"discovery\":%{public}d, \"coex\":%{public}d, \"assertDuration\":%{public}d, \"skipped\":%{public, location:escape_only}@, \"failed\":%{public, location:escape_only}@, \"nearowner\":%{public, location:escape_only}@, \"connected\":%{public, location:escape_only}@, \"nearowner\":%{public}d, \"connectattempt\":%{public}d, \"nearownerPct\":%{public}d, \"connectattemptPct\":%{public}d, \"submission\":%{public}d}", buf, 0x98u);
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1014F44E0;
    v39[3] = &unk_1021B5168;
    v39[4] = a3;
    *(double *)&v39[5] = v8;
    *(double *)&v39[6] = v10;
    v40 = v11;
    v41 = v12;
    v42 = v14;
    v43 = v19;
    v44 = v16;
    v45 = v22;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.nom"), v39);
    ++self->_maintenanceSubmissionCount;
  }
}

- (void)submitPowerLogMaintenanceMetrics:(id)a3
{
  double v5;
  double Current;
  double v7;
  _QWORD v8[3];
  _QWORD v9[3];

  objc_msgSend(a3, "referenceTime");
  if (v5 != 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(a3, "referenceTime");
    v8[0] = CFSTR("duration");
    v9[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v7);
    v8[1] = CFSTR("numDevices");
    v9[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "devices"));
    v8[2] = CFSTR("maintainedReasonCountDictionary");
    v9[2] = objc_msgSend(a3, "maintainedReasonCountDictionary");
    -[CLDurianMetricManager submitPowerLogEvent:data:](self, "submitPowerLogEvent:data:", CFSTR("MaintainedAllDevices"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  }
}

- (void)submitMaintenanceMetrics:(id)a3
{
  -[CLDurianMetricManager submitCAMaintenanceMetrics:](self, "submitCAMaintenanceMetrics:");
  -[CLDurianMetricManager submitPowerLogMaintenanceMetrics:](self, "submitPowerLogMaintenanceMetrics:", a3);
}

- (void)submitMaintenanceMetrics:(id)a3 forDevice:(id)a4 withReason:(id)a5 andCategory:(unint64_t)a6 andDuration:(double)a7 leashable:(BOOL)a8
{
  int v14;
  const __CFString *v15;
  id v16;
  int v17;
  int v18;
  double v19;
  double v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  double v27;
  double v28;
  int64_t maintenanceSubmissionCount;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  unsigned int v36;
  id v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  id v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned int v48;
  const __CFString *v49;
  int v50;
  _BOOL4 v51;
  id v52;
  _QWORD v53[10];
  unsigned int v54;
  int v55;
  unsigned int v56;
  int v57;
  int v58;
  int v59;
  BOOL v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  _BYTE v68[20];
  _BYTE v69[6];
  _BYTE v70[6];
  _BYTE v71[6];
  _BYTE v72[6];
  id v73;
  _BYTE v74[6];
  _BYTE v75[6];
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  unsigned int v80;
  __int16 v81;
  id v82;
  __int16 v83;
  _BOOL4 v84;

  v51 = a8;
  if (a7 <= 1.0)
  {
    v14 = 1;
  }
  else if (a7 >= 6.0)
  {
    if (a7 >= 7.0)
    {
      if (a7 >= 10.0)
      {
        if (a7 >= 15.0)
        {
          if (a7 >= 20.0)
          {
            if (a7 >= 28.0)
            {
              if (a7 >= 45.0)
              {
                if (a7 >= 90.0)
                {
                  if (a7 >= 180.0)
                  {
                    if (a7 >= 300.0)
                    {
                      if (a7 >= 600.0)
                      {
                        if (a7 >= 615.0)
                          v14 = 616;
                        else
                          v14 = 615;
                      }
                      else
                      {
                        v14 = 600;
                      }
                    }
                    else
                    {
                      v14 = 300;
                    }
                  }
                  else
                  {
                    v14 = 180;
                  }
                }
                else
                {
                  v14 = 90;
                }
              }
              else
              {
                v14 = 45;
              }
            }
            else
            {
              v14 = 28;
            }
          }
          else
          {
            v14 = 20;
          }
        }
        else
        {
          v14 = 15;
        }
      }
      else
      {
        v14 = 10;
      }
    }
    else
    {
      v14 = 7;
    }
  }
  else
  {
    v14 = 6;
  }
  v50 = v14;
  if (a6 > 3)
    v15 = CFSTR("unknown");
  else
    v15 = off_1021BC4B0[a6];
  v49 = v15;
  if ((uint64_t)objc_msgSend(objc_msgSend(a4, "beacon"), "connectableDeviceCount") > 10)
    v48 = 10;
  else
    v48 = objc_msgSend(objc_msgSend(a4, "beacon"), "connectableDeviceCount");
  v16 = objc_msgSend(a4, "lastAdvertisementDelta");
  v17 = (int)v16;
  if (v16)
  {
    if ((unint64_t)v16 >= 7)
    {
      if ((unint64_t)v16 >= 0x3D)
      {
        if ((unint64_t)v16 >= 0x385)
        {
          if ((unint64_t)v16 >= 0xE11)
          {
            if ((unint64_t)v16 >= 0x1C21)
            {
              if ((unint64_t)v16 >= 0x7081)
              {
                if ((unint64_t)v16 >= 0x15181)
                  v18 = 86401;
                else
                  v18 = 86400;
              }
              else
              {
                v18 = 28800;
              }
            }
            else
            {
              v18 = 7200;
            }
          }
          else
          {
            v18 = 3600;
          }
        }
        else
        {
          v18 = 900;
        }
      }
      else
      {
        v18 = 60;
      }
    }
    else
    {
      v18 = 6;
    }
  }
  else
  {
    v18 = -1;
  }
  v47 = v18;
  objc_msgSend(a4, "lastGroupClassicDisconnectionDelta");
  v20 = v19;
  if (v19 < 0.0)
  {
    v21 = -1;
LABEL_53:
    v46 = v21;
    goto LABEL_56;
  }
  if (v19 != 0.0)
  {
    if (v19 <= 15.0)
    {
      v21 = 900;
    }
    else if (v19 <= 30.0)
    {
      v21 = 1800;
    }
    else if (v19 <= 60.0)
    {
      v21 = 3600;
    }
    else if (v19 <= 120.0)
    {
      v21 = 7200;
    }
    else if (v19 <= 180.0)
    {
      v21 = 10800;
    }
    else if (v19 <= 240.0)
    {
      v21 = 14400;
    }
    else if (v19 <= 360.0)
    {
      v21 = 21600;
    }
    else if (v19 <= 480.0)
    {
      v21 = 28800;
    }
    else if (v19 <= 720.0)
    {
      v21 = 43200;
    }
    else if (v19 <= 1440.0)
    {
      v21 = 86400;
    }
    else
    {
      v21 = 86401;
    }
    goto LABEL_53;
  }
  v46 = 0;
LABEL_56:
  v22 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "groupMaintDeltas"), "objectForKeyedSubscript:", objc_msgSend(a4, "groupUuid")), "intValue");
  v42 = v22;
  if ((int)v22 < 1)
  {
    v45 = 0;
  }
  else
  {
    if (v22 >= 0x385)
    {
      if (v22 >= 0x709)
      {
        if (v22 >= 0xE11)
        {
          if (v22 >= 0x1C21)
          {
            if (v22 >= 0x2A31)
            {
              if (v22 >= 0x3841)
              {
                if (v22 >= 0x5461)
                {
                  if (v22 >= 0x7081)
                  {
                    if (v22 >= 0xA8C1)
                    {
                      if (v22 >= 0x15181)
                        v23 = 86401;
                      else
                        v23 = 86400;
                    }
                    else
                    {
                      v23 = 43200;
                    }
                  }
                  else
                  {
                    v23 = 28800;
                  }
                }
                else
                {
                  v23 = 21600;
                }
              }
              else
              {
                v23 = 14400;
              }
            }
            else
            {
              v23 = 10800;
            }
          }
          else
          {
            v23 = 7200;
          }
        }
        else
        {
          v23 = 3600;
        }
      }
      else
      {
        v23 = 1800;
      }
    }
    else
    {
      v23 = 900;
    }
    v45 = v23;
  }
  v24 = objc_msgSend(a4, "isHeleAccessory") - 1;
  v25 = (int)(a7 + -6.0);
  v26 = objc_msgSend(a4, "isHeleAccessory");
  if (a6 == 3 && v26)
  {
    if ((int)v25 < 1)
    {
      v24 = 0;
    }
    else if (v25 >= 0x3D)
    {
      if (v25 >= 0x79)
      {
        if (v25 >= 0xB5)
        {
          if (v25 >= 0xF1)
          {
            if (v25 >= 0x12D)
            {
              if (v25 >= 0x259)
              {
                if (v25 >= 0x385)
                {
                  if (v25 >= 0x709)
                  {
                    if (v25 >= 0xE11)
                    {
                      if (v25 >= 0xF3D)
                        v24 = 99;
                      else
                        v24 = 65;
                    }
                    else
                    {
                      v24 = 60;
                    }
                  }
                  else
                  {
                    v24 = 30;
                  }
                }
                else
                {
                  v24 = 15;
                }
              }
              else
              {
                v24 = 10;
              }
            }
            else
            {
              v24 = 5;
            }
          }
          else
          {
            v24 = 4;
          }
        }
        else
        {
          v24 = 3;
        }
      }
      else
      {
        v24 = 2;
      }
    }
    else
    {
      v24 = 1;
    }
  }
  objc_msgSend(a4, "intervalSinceLastSearchPartyKeyObservation");
  v28 = v27;
  maintenanceSubmissionCount = self->_maintenanceSubmissionCount;
  v30 = (int)objc_msgSend(a3, "devices");
  v52 = a3;
  v43 = v17;
  v44 = a6;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v31 = maintenanceSubmissionCount % v30;
  v32 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68291587;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v65 = 2113;
    v66 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    v67 = 2113;
    *(_QWORD *)v68 = a5;
    *(_WORD *)&v68[8] = 2114;
    *(_QWORD *)&v68[10] = v49;
    *(_WORD *)&v68[18] = 1026;
    *(_DWORD *)v69 = (int)a7;
    *(_WORD *)&v69[4] = 1026;
    *(_DWORD *)v70 = v50;
    *(_WORD *)&v70[4] = 1026;
    *(_DWORD *)v71 = v48;
    *(_WORD *)&v71[4] = 1026;
    *(_DWORD *)v72 = objc_msgSend(a3, "coex");
    *(_WORD *)&v72[4] = 2114;
    v73 = objc_msgSend(a4, "accessoryTypeName");
    *(_WORD *)v74 = 1026;
    *(_DWORD *)&v74[2] = (int)v28;
    *(_WORD *)v75 = 1026;
    *(_DWORD *)&v75[2] = v31 == 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #maint metrics\", \"item\":%{private, location:escape_only}@, \"outcome\":%{private, location:escape_only}@, \"category\":%{public, location:escape_only}@, \"duration\":%{public}d, \"durationBin\":%{public}d, \"maintainers\":%{public}d, \"coex\":%{public}d, \"product\":%{public, location:escape_only}@, \"lastObservation\":%{public}d, \"submit\":%{public}d}", buf, 0x5Eu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC490);
  }
  v33 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v31;
    v35 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "uuid"), "description"), "substringToIndex:", 8);
    v36 = v24;
    v37 = a5;
    v38 = objc_msgSend(a4, "isHeleAccessory");
    v39 = objc_msgSend(a4, "numProactiveAttempts");
    v40 = objc_msgSend(a4, "numProactiveConnects");
    v41 = objc_msgSend(v52, "loiType");
    *(_DWORD *)buf = 68293123;
    v62 = 0;
    v63 = 2082;
    v64 = "";
    v65 = 2113;
    v66 = v35;
    v31 = v34;
    v67 = 1026;
    *(_DWORD *)v68 = v38;
    a5 = v37;
    v24 = v36;
    *(_WORD *)&v68[4] = 2113;
    *(_QWORD *)&v68[6] = a5;
    *(_WORD *)&v68[14] = 1025;
    *(_DWORD *)&v68[16] = v44;
    *(_WORD *)v69 = 1026;
    *(_DWORD *)&v69[2] = v39;
    *(_WORD *)v70 = 1026;
    *(_DWORD *)&v70[2] = v40;
    *(_WORD *)v71 = 1026;
    *(_DWORD *)&v71[2] = v43;
    *(_WORD *)v72 = 1026;
    *(_DWORD *)&v72[2] = v47;
    LOWORD(v73) = 1026;
    *(_DWORD *)((char *)&v73 + 2) = v42;
    HIWORD(v73) = 1026;
    *(_DWORD *)v74 = v45;
    *(_WORD *)&v74[4] = 1026;
    *(_DWORD *)v75 = (int)v20;
    *(_WORD *)&v75[4] = 1026;
    v76 = v46;
    v77 = 1026;
    v78 = (int)(a7 + -6.0);
    v79 = 1026;
    v80 = v36;
    v81 = 2114;
    v82 = v41;
    v83 = 1026;
    v84 = v51;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint metrics hele\", \"item\":%{private, location:escape_only}@, \"hele\":%{public}hhd, \"outcome\":%{private, location:escape_only}@, \"category\":%{private}d, \"proAtt\":%{public}d, \"proConn\":%{public}d, \"lastAdv\":%{public}d, \"lastAdvBin\":%{public}d, \"lastGroup\":%{public}d, \"lastGroupMaintBin\":%{public}d, \"lastClassic\":%{public}d, \"lastClassicBin\":%{public}d, \"heleconnect\":%{public}d, \"min\":%{public}d, \"loitype\":%{public, location:escape_only}@, \"leashable\":%{public}hhd}", buf, 0x7Eu);
  }
  if (!v31)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1014F5170;
    v53[3] = &unk_1021BC420;
    v53[4] = a5;
    v53[5] = v49;
    v54 = v48;
    v55 = v50;
    v53[6] = v52;
    v53[7] = a4;
    v56 = v24;
    v57 = v47;
    v58 = v45;
    v59 = v46;
    v60 = v51;
    *(double *)&v53[8] = a7;
    *(double *)&v53[9] = v28;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.maintenance"), v53);
  }
}

- (void)submitCustomerNordicCrash:(id)a3 roseCrashes:(id)a4 firmwareVersion:(id)a5
{
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  NSMutableDictionary *v33;
  _BYTE v34[128];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[6];
  _QWORD v38[6];

  v37[0] = CFSTR("softwareVersion");
  v38[0] = objc_msgSend(a5, "vanBurenVersion");
  v37[1] = CFSTR("hardwareVersion");
  v38[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a5, "hardwareVersion"));
  v37[2] = CFSTR("roseAPVersion");
  v38[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a5, "roseAPVersion"));
  v37[3] = CFSTR("roseDSPVersion");
  v38[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a5, "roseDSPVersion"));
  v37[4] = CFSTR("calDataVersion");
  v38[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a5, "calibrationDataVersion"));
  v37[5] = CFSTR("RTKitVersion");
  v38[5] = objc_msgSend(a5, "rtKitVersion");
  v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 6));
  if (a3)
  {
    v35[0] = CFSTR("nordicCrashPC");
    v36[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pc"));
    v35[1] = CFSTR("nordicCrashTruncatedReason");
    v36[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(a3, "truncatedReason"));
    v35[2] = CFSTR("nordicCrashReferenceWallTime");
    v36[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "referenceWallTime"));
    v35[3] = CFSTR("nordicCrashReferenceTicks");
    v36[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "referenceTicks"));
    v35[4] = CFSTR("nordicCrashCurrentTicks");
    v36[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "currentTicks"));
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 5));
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(a4);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "core");
        if ((_DWORD)v14)
        {
          if ((_DWORD)v14 == 1)
          {
            v15 = CFSTR("DSP");
          }
          else
          {
            v23 = v14;
            v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown%u"));
          }
        }
        else
        {
          v15 = CFSTR("AP");
        }
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", objc_msgSend(v13, "crashString"), v15);
      }
      v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v10);
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v16 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v29 = 0;
    v30 = 2082;
    v31 = "";
    v32 = 2114;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics sending #crash event\", \"metric\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.crash"), (SEL)v8, v17, v18, v19, v20, v21, v22, v23);
}

- (void)submitTaskMetricsForDevice:(id)a3 task:(id)a4 completed:(BOOL)a5 errorCode:(int64_t)a6
{
  _BOOL8 v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  if (a4 && (v9 = a5, v10 = objc_msgSend(a4, "command"), a3) && v10)
  {
    v11 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (!v9)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6), CFSTR("error"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9), CFSTR("success"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(a4, "translatedOpcode")), CFSTR("task"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_10221DEB0, CFSTR("taskCount"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(a3, "accessoryTypeName"), CFSTR("productName"));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC490);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 68289283;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send task event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
    }
    AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.tasks"), (SEL)v11, v13, v14, v15, v16, v17, v18, (id)v22);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC490);
    v19 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v22 = 68289795;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2114;
      v28 = a4;
      v29 = 2114;
      v30 = objc_msgSend(a4, "command");
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #metrics received nil task or command\", \"device\":%{private, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"task.command\":%{public, location:escape_only}@}", (uint8_t *)&v22, 0x30u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC490);
    }
    v20 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v21 = objc_msgSend(a4, "command");
      v22 = 68289795;
      v23 = 2082;
      v24 = "";
      v25 = 2113;
      v26 = a3;
      v27 = 2114;
      v28 = a4;
      v29 = 2114;
      v30 = v21;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #metrics received nil task or command", "{\"msg%{public}.0s\":\"#durian #metrics received nil task or command\", \"device\":%{private, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"task.command\":%{public, location:escape_only}@}", (uint8_t *)&v22, 0x30u);
    }
  }
}

- (void)submitBeaconLocationMetric:(id)a3 type:(int64_t)a4 timestampAdjusted:(BOOL)a5 forDevice:(id)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;

  v7 = a5;
  v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3 != 0), CFSTR("locationReceived"));
  objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7), CFSTR("timestampAdjusted"));
  if (objc_msgSend(objc_msgSend(a6, "beacon"), "systemVersion"))
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(objc_msgSend(a6, "beacon"), "systemVersion"), CFSTR("firmwareVersion"));
  objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4), CFSTR("beaconObservationType"));
  if (a3)
  {
    objc_msgSend(a3, "horizontalAccuracy");
    objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("horizontalAccuracy"));
    objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "signalEnvironmentType")), CFSTR("signalEnvironment"));
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 68289283;
    v19 = 2082;
    v20 = "";
    v21 = 2113;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric submitting location accuracy\", \"metric\":%{private, location:escape_only}@}", (uint8_t *)&v18, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.location"), (SEL)v10, v12, v13, v14, v15, v16, v17, (id)v18);
}

- (void)submitNonTimerMaintenanceMetricsForDevice:(id)a3 proactive:(unsigned int)a4
{
  NSObject *v6;
  _QWORD v7[4];
  unsigned int v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unsigned int v16;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "uuid"), "description"), "substringToIndex:", 8);
    v15 = 1026;
    v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric nontimer maint\", \"item\":%{private, location:escape_only}@, \"proactive\":%{public}d}", buf, 0x22u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1014F5E40;
  v7[3] = &unk_102146830;
  v8 = a4;
  AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.miscmaint"), v7);
}

- (void)submitMaintenanceTimerFiredMetrics:(double)a3 actualInterval:(double)a4
{
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("targetInterval");
  v6[1] = CFSTR("actualInterval");
  v7[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  v7[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
  -[CLDurianMetricManager submitPowerLogEvent:data:](self, "submitPowerLogEvent:data:", CFSTR("MaintenanceTimerFired"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
}

- (void)submitPowerLogEvent:(id)a3 data:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289539;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = a3;
    v12 = 2113;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian submitting PowerLog event\", \"event\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x26u);
  }
  PLLogRegisteredEvent(88, a3, a4, 0);
}

+ (void)submitKeyFetchEvent:(double)a3 numberMaterials:(unint64_t)a4 isDrift:(unsigned __int8)a5 deviceType:(id)a6
{
  int v7;
  uint32_t v10;
  NSObject *v11;
  _QWORD v12[7];
  char v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;

  v7 = a5;
  v10 = arc4random_uniform(4u);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 1026;
    v19 = (int)a3;
    v20 = 2050;
    v21 = a4;
    v22 = 1026;
    v23 = v7 != 0;
    v24 = 2114;
    v25 = a6;
    v26 = 1026;
    v27 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric keyFetchEvent\", \"lastObservation\":%{public}d, \"numberMaterials\":%{public}lu, \"isDrift\":%{public}hhd, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x38u);
  }
  if (!v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1014F623C;
    v12[3] = &unk_102184168;
    *(double *)&v12[5] = a3;
    v12[6] = a4;
    v13 = v7;
    v12[4] = a6;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.keyfetch"), v12);
  }
}

+ (void)submitConnectionAttemptEvent:(double)a3 numberBTConnectionAttempts:(unint64_t)a4 connectionReason:(id)a5 deviceType:(id)a6
{
  uint32_t v10;
  NSObject *v11;
  _QWORD v12[8];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;

  v10 = arc4random_uniform(4u);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 1026;
    v18 = (int)a3;
    v19 = 2050;
    v20 = a4;
    v21 = 2114;
    v22 = a5;
    v23 = 2114;
    v24 = a6;
    v25 = 1026;
    v26 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric connectionAttemptEvent \", \"lastObservation\":%{public}d, \"numberBTConnectionAttempts\":%{public}lu, \"connectionReason\":%{public, location:escape_only}@, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x3Cu);
  }
  if (!v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1014F64A4;
    v12[3] = &unk_102150D38;
    *(double *)&v12[6] = a3;
    v12[7] = a4;
    v12[4] = a5;
    v12[5] = a6;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.connectionattempt"), v12);
  }
}

+ (void)submitConnectionAttemptSuccessEvent:(double)a3 krMaterial:(unsigned __int8)a4 connectionReason:(id)a5 deviceType:(id)a6
{
  int v8;
  uint32_t v10;
  NSObject *v11;
  _QWORD v12[7];
  char v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;

  v8 = a4;
  v10 = arc4random_uniform(4u);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 1026;
    v19 = (int)a3;
    v20 = 1026;
    v21 = v8 == 0;
    v22 = 2114;
    v23 = a5;
    v24 = 2114;
    v25 = a6;
    v26 = 1026;
    v27 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric connectionAttemptEventSuccess \", \"lastObservation\":%{public}d, \"driftMaterial\":%{public}hhd, \"connectionReason\":%{public, location:escape_only}@, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x38u);
  }
  if (!v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1014F6700;
    v12[3] = &unk_1021BC448;
    *(double *)&v12[6] = a3;
    v13 = v8;
    v12[4] = a5;
    v12[5] = a6;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.durian.connectionattempt.success"), v12);
  }
}

- (void)submitUserStats:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  double v23;
  int v24;
  double v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  _QWORD v36[7];
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  unsigned int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;

  if (a4 && objc_msgSend(a4, "version") == (id)2)
  {
    v6 = +[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", objc_msgSend(a3, "buildNumber"));
    v7 = objc_msgSend(objc_msgSend(a3, "uuid"), "UUIDString");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC490);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(a4, "utAccelCount");
      v34 = objc_msgSend(a4, "bomSoundCount");
      objc_msgSend(a4, "bootR1Time");
      v33 = (int)v9;
      objc_msgSend(a4, "dualLeashedTime");
      v32 = (int)v10;
      objc_msgSend(a4, "dualConnTime");
      v31 = (int)v11;
      objc_msgSend(a4, "leashedTime");
      v30 = (int)v12;
      objc_msgSend(a4, "multiLeashedTime");
      v29 = (int)v13;
      objc_msgSend(a4, "multiTimeV2");
      v28 = (int)v14;
      objc_msgSend(a4, "nearOwnerTimeV2");
      v27 = (int)v15;
      v16 = objc_msgSend(a4, "ownerLongSoundCount");
      v17 = objc_msgSend(a4, "ownerShortSoundCount");
      v26 = objc_msgSend(a4, "utLongSoundCount");
      v18 = objc_msgSend(a4, "utShortSoundCount");
      objc_msgSend(a4, "rangingTime");
      v20 = (int)v19;
      objc_msgSend(a4, "singleConnTime");
      v22 = (int)v21;
      objc_msgSend(a4, "wildTime");
      v24 = (int)v23;
      objc_msgSend(a4, "lastClear");
      *(_DWORD *)buf = 68293890;
      v39 = 2082;
      v38 = 0;
      v40 = "";
      v41 = 1026;
      v42 = v35;
      v43 = 1026;
      v44 = v34;
      v45 = 1026;
      v46 = v33;
      v47 = 1026;
      v48 = v32;
      v49 = 1026;
      v50 = v31;
      v51 = 1026;
      v52 = v30;
      v53 = 1026;
      v54 = v29;
      v55 = 1026;
      v56 = v28;
      v57 = 1026;
      v58 = v27;
      v59 = 1026;
      v60 = v16;
      v61 = 1026;
      v62 = v17;
      v63 = 2114;
      v64 = v6;
      v65 = 2114;
      v66 = v7;
      v67 = 1026;
      v68 = v26;
      v69 = 1026;
      v70 = v18;
      v71 = 1026;
      v72 = v20;
      v73 = 1026;
      v74 = v22;
      v75 = 1026;
      v76 = v24;
      v77 = 1026;
      v78 = (int)v25;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric userstatsV2Submission\", \"BOMAccelCount\":%{public}d, \"BOMSoundCount\":%{public}d, \"bootR1Time\":%{public}d, \"dualConnectionLeashedTime\":%{public}d, \"dualConnectionTime\":%{public}d, \"leashedTime\":%{public}d, \"multiLeashedTime\":%{public}d, \"multiTime\":%{public}d, \"nearOwnerTime\":%{public}d, \"ownerPlaySoundLongCount\":%{public}d, \"ownerPlaySoundShortCount\":%{public}d, \"pairedDeviceFirmwareVersion\":%{public, location:escape_only}@, \"pairedDeviceID\":%{public, location:escape_only}@, \"playSoundLongUTCount\":%{public}d, \"playSoundShortUTCount\":%{public}d, \"rangingTime\":%{public}d, \"singleConnectionTime\":%{public}d, \"wildTime\":%{public}d, \"observationDurationFW\":%{public}d}", buf, 0x8Cu);
    }
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1014F6B08;
    v36[3] = &unk_1021BC470;
    v36[4] = a4;
    v36[5] = v6;
    v36[6] = v7;
    AnalyticsSendEventLazy(CFSTR("com.apple.proximity.airtag.userStats"), v36);
  }
}

- (void)submitCarMaintMetrics:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), CFSTR("scanCount"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 68289283;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send car maintenance scan count event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.carmaintenance"), (SEL)v4, v6, v7, v8, v9, v10, v11, (id)v12);
}

- (void)submitCarMaintConnectionMetrics:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), CFSTR("connectCount"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 68289283;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send car maintenance connection attempt count event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.carmaintenance"), (SEL)v4, v6, v7, v8, v9, v10, v11, (id)v12);
}

- (void)submitUnexpectedMissingBeaconMetrics:(id)a3 disconnected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a4;
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "accessoryTypeName"), CFSTR("productName"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "ownership") == (id)1), CFSTR("owned"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4), CFSTR("disconnected"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC490);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 68289283;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send unexpected missing beacon event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v14, 0x1Cu);
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.unexpectedmissingbeacon"), (SEL)v6, v8, v9, v10, v11, v12, v13, (id)v14);
}

- (AKAppleIDSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)authHeaderValue
{
  return self->_authHeaderValue;
}

- (void)setAuthHeaderValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)maintenanceSubmissionCount
{
  return self->_maintenanceSubmissionCount;
}

- (void)setMaintenanceSubmissionCount:(int64_t)a3
{
  self->_maintenanceSubmissionCount = a3;
}

@end
