@implementation CLAvengerScannerParser

+ (id)convertToObjectDiscoveryDataWithAdvertisementData:(id)a3 rssi:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  NSString *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  id v15;
  NSObject *v16;
  id v17;
  CBUUID *v18;
  CBUUID *v19;
  id v20;
  NSMutableData *v21;
  _BYTE *v22;
  _BYTE *v23;
  id v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  NSMutableData *v28;
  NSData *v29;
  id v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  unsigned __int8 *v36;
  int v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  unsigned __int8 *v42;
  unsigned int v43;
  NSData *v44;
  NSObject *v45;
  NSObject *v46;
  NSData *v47;
  NSObject *v48;
  unsigned __int8 *v49;
  NSObject *v50;
  const char *v51;
  const char *v52;
  int v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  NSObject *v56;
  int v57;
  NSMutableData *v58;
  NSDate *v59;
  _UNKNOWN **v60;
  char *v61;
  char v62;
  _BYTE *v63;
  id v64;
  BOOL v65;
  CLAvengerScannerClientObjectDiscoveryData *v66;
  NSData *v67;
  id v68;
  _UNKNOWN **v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  NSMutableData *v73;
  unsigned int v74;
  uint8_t buf[4];
  int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  NSMutableData *v88;
  __int16 v89;
  NSData *v90;

  if (!a3
    || !objc_msgSend(a3, "objectForKey:", CBAdvertisementDataDeviceAddress)
    || !objc_msgSend(a3, "objectForKey:", CBAdvertisementDataTimestamp))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC078);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
    }
    v7 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLAvengerScannerParser missing data", "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  if (!_os_feature_enabled_impl("CoreLocation", "StandardUT")
    || (v8 = CBAdvertisementDataManufacturerDataKey,
        objc_msgSend(a3, "objectForKey:", CBAdvertisementDataManufacturerDataKey))
    || (v9 = CBAdvertisementDataServiceDataKey, !objc_msgSend(a3, "objectForKey:", CBAdvertisementDataServiceDataKey)))
  {
    if (!_os_feature_enabled_impl("CoreLocation", "StandardUT")
      || (v8 = CBAdvertisementDataManufacturerDataKey,
          !objc_msgSend(a3, "objectForKey:", CBAdvertisementDataManufacturerDataKey))
      || (v9 = CBAdvertisementDataServiceDataKey, objc_msgSend(a3, "objectForKey:", CBAdvertisementDataServiceDataKey)))
    {
      if ((_os_feature_enabled_impl("CoreLocation", "StandardUT") & 1) != 0
        || (v8 = CBAdvertisementDataManufacturerDataKey,
            !objc_msgSend(a3, "objectForKey:", CBAdvertisementDataManufacturerDataKey))
        || (v9 = CBAdvertisementDataServiceDataKey, objc_msgSend(a3, "objectForKey:", CBAdvertisementDataServiceDataKey)))
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
        v10 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 2113;
          v80 = a3;
          v81 = 2113;
          v82 = a4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC078);
        }
        v11 = qword_1022A0038;
        if (!os_signpost_enabled((os_log_t)qword_1022A0038))
          return 0;
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        v12 = "CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabled";
        v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing data or Posh feature flag needs to be enabled/disabl"
              "ed\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
LABEL_26:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, buf, 0x26u);
        return 0;
      }
    }
  }
  if (!objc_msgSend(a3, "objectForKey:", v8))
  {
    if (!_os_feature_enabled_impl("CoreLocation", "StandardUT"))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
      v33 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser advertisement type check should not have allowed this else case\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
      }
      v11 = qword_1022A0038;
      if (!os_signpost_enabled((os_log_t)qword_1022A0038))
        return 0;
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      v12 = "CLAvengerScannerParser advertisement type check should not have allowed this else case";
      v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser advertisement type check should not have allowed this else cas"
            "e\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_26;
    }
    v17 = objc_msgSend(a3, "objectForKey:", v9);
    v18 = +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FCB2"));
    v19 = +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FEAA"));
    v20 = objc_msgSend(v17, "objectForKey:", v18);
    if (v20)
    {
      v21 = (NSMutableData *)objc_msgSend(v17, "objectForKey:", v18);
    }
    else
    {
      if (!objc_msgSend(v17, "objectForKey:", v19))
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
        v46 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 2113;
          v80 = a3;
          v81 = 2113;
          v82 = a4;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing posh service data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC078);
        }
        v11 = qword_1022A0038;
        if (!os_signpost_enabled((os_log_t)qword_1022A0038))
          return 0;
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        v12 = "CLAvengerScannerParser missing posh service data";
        v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser missing posh service data\", \"advertisementData\":%{private"
              ", location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        goto LABEL_26;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
      v34 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScannerParser parsing backwardsPosh service data\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      }
      v21 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &unk_101CC5C10, 1);
      -[NSMutableData appendData:](v21, "appendData:", objc_msgSend(v17, "objectForKey:", v19));
    }
    if (-[NSMutableData length](v21, "length") <= 1)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
      v35 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract posh preamble\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
      }
      v11 = qword_1022A0038;
      if (!os_signpost_enabled((os_log_t)qword_1022A0038))
        return 0;
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      v12 = "CLAvengerScannerParser length not long enough to extract posh preamble";
      v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract posh preamble\", \"advertise"
            "mentData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_26;
    }
    v36 = (unsigned __int8 *)-[NSMutableData bytes](v21, "bytes");
    v30 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", *v36);
    v37 = *v36;
    v38 = -[NSMutableData length](v21, "length");
    if (v37 == 1)
    {
      if (v38 != (id)4 && (id)-[NSMutableData length](v21, "length") != (id)27)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
        v39 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 2113;
          v80 = a3;
          v81 = 2113;
          v82 = a4;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized Apple Posh service data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC078);
        }
        v11 = qword_1022A0038;
        if (!os_signpost_enabled((os_log_t)qword_1022A0038))
          return 0;
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        v12 = "CLAvengerScannerParser unrecognized Apple Posh service data length";
        v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized Apple Posh service data length\", \"advertiseme"
              "ntData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
        goto LABEL_26;
      }
    }
    else if ((unint64_t)v38 >= 0x1C)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
      v40 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized non-Apple Posh service data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
      }
      v11 = qword_1022A0038;
      if (!os_signpost_enabled((os_log_t)qword_1022A0038))
        return 0;
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      v12 = "CLAvengerScannerParser unrecognized non-Apple Posh service data length";
      v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized non-Apple Posh service data length\", \"advertise"
            "mentData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_26;
    }
    if (v20)
      v31 = v36[1];
    else
      v31 = (v36[1] & 1) == 0;
    if (v37 == 1)
    {
      v41 = -[NSMutableData length](v21, "length");
      if ((v31 & 1) != 0)
      {
        if (v41 != (id)4)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC078);
          v70 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            v76 = 0;
            v77 = 2082;
            v78 = "";
            v79 = 2113;
            v80 = a3;
            v81 = 2113;
            v82 = a4;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple near owner type\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC078);
          }
          v11 = qword_1022A0038;
          if (!os_signpost_enabled((os_log_t)qword_1022A0038))
            return 0;
          *(_DWORD *)buf = 68289539;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 2113;
          v80 = a3;
          v81 = 2113;
          v82 = a4;
          v12 = "CLAvengerScannerParser incorrect posh service data length for Apple near owner type";
          v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple near owner ty"
                "pe\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
          goto LABEL_26;
        }
        v42 = (unsigned __int8 *)-[NSMutableData bytes](v21, "bytes");
        v43 = v42[2];
        v73 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v42 + 3, 1);
        v44 = +[NSData data](NSData, "data");
      }
      else
      {
        if (v41 != (id)27)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC078);
          v71 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68289539;
            v76 = 0;
            v77 = 2082;
            v78 = "";
            v79 = 2113;
            v80 = a3;
            v81 = 2113;
            v82 = a4;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple wild type\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC078);
          }
          v11 = qword_1022A0038;
          if (!os_signpost_enabled((os_log_t)qword_1022A0038))
            return 0;
          *(_DWORD *)buf = 68289539;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 2113;
          v80 = a3;
          v81 = 2113;
          v82 = a4;
          v12 = "CLAvengerScannerParser incorrect posh service data length for Apple wild type";
          v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser incorrect posh service data length for Apple wild type\", "
                "\"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
          goto LABEL_26;
        }
        v49 = (unsigned __int8 *)-[NSMutableData bytes](v21, "bytes");
        v43 = v49[2];
        v73 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v49 + 25, 2);
        v44 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v49 + 3, 22);
      }
      v47 = v44;
    }
    else
    {
      if ((v31 & 1) != 0 || (_os_feature_enabled_impl("CoreLocation", "StandardUTNonApple") & 1) == 0)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
        v48 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289283;
          v76 = 0;
          v77 = 2082;
          v78 = "";
          v79 = 1025;
          LODWORD(v80) = v31 & 1;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLAvengerScannerParser ignoring non apple posh\", \"isNearOwner\":%{private}hhd}", buf, 0x18u);
        }
        return 0;
      }
      v73 = (NSMutableData *)+[NSMutableData data](NSMutableData, "data");
      v47 = +[NSData data](NSData, "data");
      v43 = 0;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC078);
    v50 = qword_1022A0038;
    v74 = v43;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v51 = "NO";
      *(_DWORD *)buf = 68290562;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      if (v37 == 1)
        v52 = "YES";
      else
        v52 = "NO";
      v79 = 2114;
      if ((v31 & 1) != 0)
        v51 = "YES";
      v80 = v21;
      v81 = 2082;
      v82 = (id)v52;
      v83 = 2082;
      v84 = v51;
      v85 = 2050;
      v86 = v43;
      v87 = 2114;
      v88 = v73;
      v89 = 2114;
      v29 = v47;
      v90 = v47;
      v27 = 1;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLAvengerScannerParser posh\", \"data\":%{public, location:escape_only}@, \"isApple\":%{public, location:escape_only}s, \"isNearOwner\":%{public, location:escape_only}s, \"status\":%{public}lu, \"reserved\":%{public, location:escape_only}@, \"pubKey2\":%{public, location:escape_only}@}", buf, 0x4Eu);
      if (v37 != 1)
      {
        v53 = 0;
LABEL_174:
        v28 = v73;
        goto LABEL_148;
      }
    }
    else
    {
      v29 = v47;
      if (v37 != 1)
      {
        v53 = 0;
        v27 = 1;
        goto LABEL_174;
      }
    }
    v27 = 3;
    v28 = v73;
    goto LABEL_147;
  }
  v15 = objc_msgSend(a3, "objectForKeyedSubscript:", v8);
  if ((unint64_t)objc_msgSend(v15, "length") <= 3)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC078);
    v16 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract preamble\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
    }
    v11 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    *(_DWORD *)buf = 68289539;
    v76 = 0;
    v77 = 2082;
    v78 = "";
    v79 = 2113;
    v80 = a3;
    v81 = 2113;
    v82 = a4;
    v12 = "CLAvengerScannerParser length not long enough to extract preamble";
    v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser length not long enough to extract preamble\", \"advertisementDat"
          "a\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_26;
  }
  v22 = objc_msgSend(v15, "bytes");
  if (*(_WORD *)v22 != 76 || (v23 = v22, v22[2] != 18))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC078);
    v32 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser companyID and type mismatch\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
    }
    v11 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    *(_DWORD *)buf = 68289539;
    v76 = 0;
    v77 = 2082;
    v78 = "";
    v79 = 2113;
    v80 = a3;
    v81 = 2113;
    v82 = a4;
    v12 = "CLAvengerScannerParser companyID and type mismatch";
    v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser companyID and type mismatch\", \"advertisementData\":%{private, "
          "location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_26;
  }
  v24 = objc_msgSend(v15, "length");
  v25 = v23[3];
  if (v24 != (id)(v25 + 4))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC078);
    v45 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser stated length doesnt match actual data length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
    }
    v11 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    *(_DWORD *)buf = 68289539;
    v76 = 0;
    v77 = 2082;
    v78 = "";
    v79 = 2113;
    v80 = a3;
    v81 = 2113;
    v82 = a4;
    v12 = "CLAvengerScannerParser stated length doesnt match actual data length";
    v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser stated length doesnt match actual data length\", \"advertisement"
          "Data\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
    goto LABEL_26;
  }
  switch((_DWORD)v25)
  {
    case 2:
      v54 = (unsigned __int8 *)objc_msgSend(v15, "bytes");
      v74 = v54[4];
      v31 = 1;
      v28 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v54 + 5, 1);
      v29 = +[NSData data](NSData, "data");
      v30 = 0;
      break;
    case 0x18:
      v55 = (unsigned __int8 *)objc_msgSend(v15, "bytes");
      v74 = v55[4];
      v28 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v55 + 27, 1);
      v29 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v55 + 5, 22);
      v30 = 0;
      v31 = 0;
      break;
    case 0x19:
      v26 = (unsigned __int8 *)objc_msgSend(v15, "bytes");
      v74 = v26[4];
      v27 = 2;
      v28 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v26 + 27, 2);
      v29 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26 + 5, 22);
      v30 = 0;
      v31 = 0;
      goto LABEL_147;
    default:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC078);
      v56 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289539;
        v76 = 0;
        v77 = 2082;
        v78 = "";
        v79 = 2113;
        v80 = a3;
        v81 = 2113;
        v82 = a4;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized length\", \"advertisementData\":%{private, location:escape_only}@, \"rssi\":%{private, location:escape_only}@}", buf, 0x26u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC078);
      }
      v11 = qword_1022A0038;
      if (!os_signpost_enabled((os_log_t)qword_1022A0038))
        return 0;
      *(_DWORD *)buf = 68289539;
      v76 = 0;
      v77 = 2082;
      v78 = "";
      v79 = 2113;
      v80 = a3;
      v81 = 2113;
      v82 = a4;
      v12 = "CLAvengerScannerParser unrecognized length";
      v13 = "{\"msg%{public}.0s\":\"CLAvengerScannerParser unrecognized length\", \"advertisementData\":%{private, locati"
            "on:escape_only}@, \"rssi\":%{private, location:escape_only}@}";
      goto LABEL_26;
  }
  v27 = 2;
LABEL_147:
  v53 = 1;
LABEL_148:
  if ((v31 & 1) != 0)
    v57 = v27 | 4;
  else
    v57 = v27;
  v58 = +[NSMutableData dataWithData:](NSMutableData, "dataWithData:", objc_msgSend(a3, "objectForKeyedSubscript:", CBAdvertisementDataDeviceAddress));
  objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CBAdvertisementDataTimestamp), "doubleValue");
  v59 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  v60 = (_UNKNOWN **)objc_msgSend(a3, "objectForKeyedSubscript:", CBAdvertisementDataChannel);
  if (v53)
  {
    v61 = -[NSMutableData mutableBytes](v28, "mutableBytes");
    v62 = *v61;
    *v61 &= 0xFCu;
    v63 = -[NSMutableData mutableBytes](v58, "mutableBytes");
    *v63 = *v63 & 0x3F | (v62 << 6);
  }
  v64 = objc_msgSend(a3, "objectForKeyedSubscript:", CBAdvertisementDataHostWakeEvent);
  if (v64)
    v65 = (uint64_t)objc_msgSend(v64, "integerValue") > 0;
  else
    v65 = 0;
  v66 = [CLAvengerScannerClientObjectDiscoveryData alloc];
  v67 = +[NSData dataWithData:](NSData, "dataWithData:", v58);
  v68 = objc_msgSend(a4, "integerValue");
  v69 = &off_10221DD90;
  if (v60)
    v69 = v60;
  HIDWORD(v72) = v57;
  LOBYTE(v72) = v65;
  return -[CLAvengerScannerClientObjectDiscoveryData initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:](v66, "initWithAddress:advertisementData:status:reserved:rssi:scanDate:channel:didCauseWake:detailsBitmask:protocolID:", v67, v29, v74, v28, v68, v59, v69, v72, v30);
}

@end
