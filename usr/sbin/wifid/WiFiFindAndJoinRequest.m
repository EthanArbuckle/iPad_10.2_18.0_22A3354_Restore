@implementation WiFiFindAndJoinRequest

- (WiFiFindAndJoinRequest)initWithNetworkName:(id)a3
{
  id v3;
  WiFiFindAndJoinRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  WiFiFindAndJoinRequest *v15;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WiFiFindAndJoinRequest;
  v3 = a3;
  v4 = -[WiFiFindAndJoinRequest init](&v25, "init");
  -[WiFiFindAndJoinRequest setNetworkName:](v4, "setNetworkName:", v3, v25.receiver, v25.super_class);

  -[WiFiFindAndJoinRequest setChannelNumber:](v4, "setChannelNumber:", 0);
  -[WiFiFindAndJoinRequest setChannelBand:](v4, "setChannelBand:", 0);
  -[WiFiFindAndJoinRequest setStartedAt:](v4, "setStartedAt:", 0);
  -[WiFiFindAndJoinRequest setTotalScanTime:](v4, "setTotalScanTime:", 0.0);
  -[WiFiFindAndJoinRequest setTotalJoinTime:](v4, "setTotalJoinTime:", 0.0);
  -[WiFiFindAndJoinRequest setTimeout:](v4, "setTimeout:", 60.0);
  -[WiFiFindAndJoinRequest setChipResetWaiter:](v4, "setChipResetWaiter:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[WiFiFindAndJoinRequest setScanFailureList:](v4, "setScanFailureList:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[WiFiFindAndJoinRequest setJoinFailureList:](v4, "setJoinFailureList:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiFindAndJoinRequest setSupported2GHzChannels:](v4, "setSupported2GHzChannels:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiFindAndJoinRequest setSupported5GHzChannels:](v4, "setSupported5GHzChannels:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiFindAndJoinRequest setSupported6GHzChannels:](v4, "setSupported6GHzChannels:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiFindAndJoinRequest setScannedChannels:](v4, "setScannedChannels:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  -[WiFiFindAndJoinRequest setJoinCandidates:](v4, "setJoinCandidates:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", v4, "_chipResetDidComplete:", CFSTR("WiFiChipResetCompleted"), 0);

  v13 = objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 1);
  -[WiFiFindAndJoinRequest setInterface:](v4, "setInterface:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](v4, "interface"));
  if (v14)
  {
    v15 = (WiFiFindAndJoinRequest *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](v4, "interface"));
    -[WiFiFindAndJoinRequest activate](v15, "activate");
  }
  else
  {
    v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17)
      sub_100186B5C(v17, v18, v19, v20, v21, v22, v23, v24);
    v15 = v4;
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("< %@:%p "), v5, self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));
  objc_msgSend(v6, "appendFormat:", CFSTR("SSID='%@' "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("Channel=%d "), -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Band=%d "), -[WiFiFindAndJoinRequest channelBand](self, "channelBand"));
  -[WiFiFindAndJoinRequest timeout](self, "timeout");
  objc_msgSend(v6, "appendFormat:", CFSTR("Timeout=%d "), (int)v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[WiFiFindAndJoinRequest setInterface:](self, "setInterface:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WiFiFindAndJoinRequest;
  -[WiFiFindAndJoinRequest dealloc](&v3, "dealloc");
}

- (BOOL)_canPerformRetry:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  char v13;
  void *v14;
  char *v15;
  void *v16;
  char *v17;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "code") == (id)82)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest startedAt](self, "startedAt"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest startedAt](self, "startedAt"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;
      -[WiFiFindAndJoinRequest timeout](self, "timeout");
      v13 = v11 > v12;

    }
    else
    {
      v13 = 0;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
    v15 = (char *)objc_msgSend(v14, "count");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    v17 = &v15[(_QWORD)objc_msgSend(v16, "count")];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100186BD0((uint64_t)v5, v13, (unint64_t)v17 < 0xB);
    v6 = ((unint64_t)v17 < 0xB) & ~v13;
  }

  return v6;
}

- (BOOL)_checkAndRequestChipResetIfNeeded
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  char *v12;
  void *v13;
  char *v14;
  void *v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  intptr_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  -[WiFiFindAndJoinRequest timeout](self, "timeout");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest startedAt](self, "startedAt"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
  if (v9 || (v10 = v4 - v8, v10 < 0.0))
  {

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
  v12 = (char *)objc_msgSend(v11, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
  v14 = &v12[(_QWORD)objc_msgSend(v13, "count")];

  if ((unint64_t)v14 < 3)
  {
LABEL_10:
    LOBYTE(v20) = 1;
    return v20;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100186D7C(self, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("WiFiChipResetRequested"), 0, 0);

  v16 = dispatch_semaphore_create(0);
  -[WiFiFindAndJoinRequest setChipResetWaiter:](self, "setChipResetWaiter:", v16);

  v17 = objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
  v18 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  v19 = dispatch_semaphore_wait(v17, v18);

  v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (!v19)
  {
    if (v20)
      sub_100186C94(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_10;
  }
  if (v20)
  {
    sub_100186D08(v20, v21, v22, v23, v24, v25, v26, v27);
    LOBYTE(v20) = 0;
  }
  return v20;
}

- (void)_chipResetDidComplete:(id)a3
{
  void *v4;
  NSObject *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter", a3));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
    dispatch_semaphore_signal(v5);

  }
}

- (void)_populateSupportedChannels
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](self, "interface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supportedChannelsWithCountryCode:", 0));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 136315650;
    v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend(v11, "width", v17, (_QWORD)v18) == 20)
        {
          if (objc_msgSend(v11, "band") == 1)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
LABEL_13:
            v13 = v12;
            objc_msgSend(v12, "addObject:", v11);

            goto LABEL_14;
          }
          if (objc_msgSend(v11, "band") == 2)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
            goto LABEL_13;
          }
          if (objc_msgSend(v11, "band") == 3)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
            goto LABEL_13;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            v14 = objc_msgSend(v11, "band");
            v15 = objc_msgSend(v11, "channel");
            *(_DWORD *)buf = v17;
            v23 = "-[WiFiFindAndJoinRequest _populateSupportedChannels]";
            v24 = 1024;
            v25 = v14;
            v26 = 1024;
            v27 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: unknown band %d for supported channel %d", buf, 0x18u);
          }
        }
LABEL_14:
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      v8 = v16;
    }
    while (v16);
  }

}

- (id)_printSupportedChannels
{
  void *v3;
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
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", CFSTR("6GHz:("));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("description")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("),"));
  objc_msgSend(v3, "appendFormat:", CFSTR("5GHz:("));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("description")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("),"));
  objc_msgSend(v3, "appendFormat:", CFSTR("2.4GHz:("));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("description")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(",")));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(")"));
  return v3;
}

- (BOOL)_runFindAndJoinOnInterface:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *k;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *m;
  uint64_t v46;
  void *v47;
  unsigned __int8 v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  WiFiFindAndJoinRequest *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  id v63;
  id v64;
  uint64_t v65;
  void *n;
  void *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  WiFiFindAndJoinRequest *v77;
  unsigned int v78;
  unsigned int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned __int8 v91;
  WiFiFindAndJoinRequest *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  unsigned int v103;
  WiFiFindAndJoinRequest *v104;
  void *v105;
  void *v106;
  unsigned int v107;
  uint64_t v108;
  _BOOL8 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  WiFiFindAndJoinRequest *v117;
  WiFiFindAndJoinRequest *v118;
  BOOL v119;
  WiFiFindAndJoinRequest *v121;
  void *v122;
  _BOOL8 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _BOOL8 v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  __int128 v139;
  id *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  WiFiFindAndJoinRequest *v149;
  void *v150;
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint8_t v169[4];
  uint64_t v170;
  uint8_t v171[4];
  uint64_t v172;
  uint8_t buf[4];
  const char *v174;
  __int16 v175;
  WiFiFindAndJoinRequest *v176;
  __int16 v177;
  _BYTE v178[10];
  __int16 v179;
  WiFiFindAndJoinRequest *v180;
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));

  v141 = v6;
  if (!v9)
  {
    v131 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v131)
      sub_100186E6C(v131, v132, v133, v134, v135, v136, v137, v138);
    v148 = 0;
    v149 = 0;
    v16 = 0;
    v142 = 0;
    v143 = 0;
    v74 = 0;
    goto LABEL_105;
  }
  -[WiFiFindAndJoinRequest _populateSupportedChannels](self, "_populateSupportedChannels");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest _printSupportedChannels](self, "_printSupportedChannels"));
    *(_DWORD *)buf = 136315650;
    v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
    v175 = 2112;
    v176 = self;
    v177 = 2112;
    *(_QWORD *)v178 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: request %@, supported channels:%@", buf, 0x20u);

  }
  if (!-[WiFiFindAndJoinRequest channelNumber](self, "channelNumber"))
    goto LABEL_17;
  if (!-[WiFiFindAndJoinRequest channelBand](self, "channelBand")
    && -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber") <= 0xE)
  {
    -[WiFiFindAndJoinRequest setChannelBand:](self, "setChannelBand:", 2);
  }
  v12 = -[WiFiFindAndJoinRequest channelBand](self, "channelBand");
  if (v12 == 2)
    goto LABEL_15;
  if (v12 == 6)
  {
    v13 = 3;
    goto LABEL_16;
  }
  if (v12 != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100187058(self);
LABEL_15:
    v13 = 1;
    goto LABEL_16;
  }
  v13 = 2;
LABEL_16:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CWFChannel channelWithNumber:band:width:](CWFChannel, "channelWithNumber:band:width:", -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber"), v13, 20));
  objc_msgSend(v7, "addObject:", v14);

LABEL_17:
  v149 = 0;
  v15 = 0;
  v16 = 0;
  v142 = 0;
  v143 = 0;
  v17 = 0;
  *(_QWORD *)&v11 = 136315394;
  v139 = v11;
  v150 = v7;
  v140 = a4;
  while (2)
  {
    v148 = v15;
    for (i = v17; ; i = v147)
    {
      if (!objc_msgSend(v7, "count", v139))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          v144 = i;
          v167 = 0u;
          v168 = 0u;
          v165 = 0u;
          v166 = 0u;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v165, v184, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v166;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(_QWORD *)v166 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)j);
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
                v28 = objc_msgSend(v27, "containsObject:", v26);

                if ((v28 & 1) == 0)
                  objc_msgSend(v150, "addObject:", v26);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v165, v184, 16);
            }
            while (v23);
          }

          v7 = v150;
          i = v144;
        }
      }
      if (!objc_msgSend(v7, "count"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
        v30 = objc_msgSend(v29, "count");

        if (v30)
        {
          v145 = i;
          v163 = 0u;
          v164 = 0u;
          v161 = 0u;
          v162 = 0u;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v161, v183, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v162;
            do
            {
              for (k = 0; k != v33; k = (char *)k + 1)
              {
                if (*(_QWORD *)v162 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)k);
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
                v38 = objc_msgSend(v37, "containsObject:", v36);

                if ((v38 & 1) == 0)
                  objc_msgSend(v150, "addObject:", v36);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v161, v183, 16);
            }
            while (v33);
          }

          v7 = v150;
          i = v145;
        }
      }
      if (!objc_msgSend(v7, "count"))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
        v40 = objc_msgSend(v39, "count");

        if (v40)
        {
          v146 = i;
          v160 = 0u;
          v158 = 0u;
          v159 = 0u;
          v157 = 0u;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v157, v182, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v158;
            do
            {
              for (m = 0; m != v43; m = (char *)m + 1)
              {
                if (*(_QWORD *)v158 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)m);
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
                v48 = objc_msgSend(v47, "containsObject:", v46);

                if ((v48 & 1) == 0)
                  objc_msgSend(v150, "addObject:", v46);
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v157, v182, 16);
            }
            while (v43);
          }

          v7 = v150;
          i = v146;
        }
      }
      v49 = objc_alloc_init((Class)CWFScanParameters);

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));
      objc_msgSend(v49, "setSSID:", v50);

      objc_msgSend(v49, "setBSSType:", 3);
      objc_msgSend(v49, "setPHYMode:", 1);
      objc_msgSend(v49, "setNumberOfScans:", 1);
      objc_msgSend(v49, "setIncludeHiddenNetworks:", 1);
      if (objc_msgSend(v7, "count"))
        v51 = v7;
      else
        v51 = 0;
      objc_msgSend(v49, "setChannels:", v51);
      if (objc_msgSend(v7, "count"))
        v52 = 110;
      else
        v52 = 45;
      objc_msgSend(v49, "setDwellTime:", v52);
      objc_msgSend(v49, "setScanFlags:", 2592);
      objc_msgSend(v49, "setScanType:", 1);
      v53 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](self, "interface"));
      v156 = 0;
      v148 = v49;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "performScanWithParameters:error:", v49, &v156));
      v56 = (WiFiFindAndJoinRequest *)v156;

      if (v56)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
        objc_msgSend(v57, "addObject:", v56);
LABEL_66:

        goto LABEL_67;
      }
      if (!v55 || !objc_msgSend(v55, "count"))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));
        objc_msgSend(v57, "addObject:", v58);

        goto LABEL_66;
      }
LABEL_67:
      v149 = v56;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v147 = (void *)v53;
      objc_msgSend(v59, "timeIntervalSinceDate:", v53);
      v61 = v60;
      -[WiFiFindAndJoinRequest totalScanTime](self, "totalScanTime");
      -[WiFiFindAndJoinRequest setTotalScanTime:](self, "setTotalScanTime:", v61 + v62);

      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v16 = v55;
      v63 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v152, v181, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v153;
        do
        {
          for (n = 0; n != v64; n = (char *)n + 1)
          {
            if (*(_QWORD *)v153 != v65)
              objc_enumerationMutation(v16);
            v67 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)n);
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "networkName"));
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));
            v70 = objc_msgSend(v68, "isEqualToString:", v69);

            if (v70)
              objc_msgSend(v8, "addObject:", v67);
          }
          v64 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v152, v181, 16);
        }
        while (v64);
      }

      v7 = v150;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "valueForKey:", CFSTR("description")));
        v77 = (WiFiFindAndJoinRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "componentsJoinedByString:", CFSTR(",")));
        v78 = objc_msgSend(v16, "count");
        v79 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 136316162;
        v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        v175 = 2112;
        v176 = v77;
        v177 = 1024;
        *(_DWORD *)v178 = v78;
        *(_WORD *)&v178[4] = 1024;
        *(_DWORD *)&v178[6] = v79;
        v179 = 2112;
        v180 = v149;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: scan completed, requested channels=%@, result count=%d, matches=%d, error=%@", buf, 0x2Cu);

      }
      if (objc_msgSend(v8, "count"))
        break;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "lastObject"));
      v73 = -[WiFiFindAndJoinRequest _canPerformRetry:](self, "_canPerformRetry:", v72);

      v74 = v147;
      if (!v73)
      {
        v109 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        a4 = v140;
        if (v109)
          sub_100186F28(v109, v110, v111, v112, v113, v114, v115, v116);
        goto LABEL_105;
      }
      -[WiFiFindAndJoinRequest _checkAndRequestChipResetIfNeeded](self, "_checkAndRequestChipResetIfNeeded");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100186EE0(v171, &v172, v75);
      objc_msgSend(v150, "removeAllObjects");
    }
    if (objc_msgSend(v150, "count"))
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
      objc_msgSend(v80, "addObjectsFromArray:", v150);

    }
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinCandidates](self, "joinCandidates"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    objc_msgSend(v81, "addObjectsFromArray:", v82);

    while (1)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinCandidates](self, "joinCandidates"));
      v84 = objc_msgSend(v83, "count");

      if (!v84)
        break;
      v85 = v142;
      v86 = objc_alloc_init((Class)CWFAssocParameters);

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinCandidates](self, "joinCandidates"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "allObjects"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "firstObject"));
      objc_msgSend(v86, "setScanResult:", v89);

      objc_msgSend(v86, "setForceBSSID:", 1);
      objc_msgSend(v86, "setPassword:", 0);
      objc_msgSend(v86, "setRememberUponSuccessfulAssociation:", 1);
      objc_msgSend(v86, "setKnownNetworkProfile:", 0);
      v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      v90 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](self, "interface"));
      v151 = 0;
      v143 = v86;
      v91 = objc_msgSend(v90, "associateWithParameters:error:", v86, &v151);
      v92 = (WiFiFindAndJoinRequest *)v151;

      v149 = v92;
      if (v92)
      {
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
        objc_msgSend(v93, "addObject:", v92);
        v74 = v147;
      }
      else
      {
        v74 = v147;
        if ((v91 & 1) != 0)
          goto LABEL_92;
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 97, 0));
        objc_msgSend(v93, "addObject:", v94);

      }
LABEL_92:
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v95, "timeIntervalSinceDate:", v142);
      v97 = v96;
      -[WiFiFindAndJoinRequest totalJoinTime](self, "totalJoinTime");
      -[WiFiFindAndJoinRequest setTotalJoinTime:](self, "setTotalJoinTime:", v97 + v98);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v104 = (WiFiFindAndJoinRequest *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "scanResult"));
        *(_DWORD *)buf = 136315650;
        v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        v175 = 2112;
        v176 = v104;
        v177 = 2112;
        *(_QWORD *)v178 = v92;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: join completed, candidate=%@, error=%@", buf, 0x20u);

      }
      v99 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinCandidates](self, "joinCandidates"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "scanResult"));
      objc_msgSend(v99, "removeObject:", v100);

      if ((v91 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v121 = (WiFiFindAndJoinRequest *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));
          *(_DWORD *)buf = 136315650;
          v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
          v175 = 2112;
          v176 = v121;
          v177 = 2112;
          *(_QWORD *)v178 = v92;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: join %@ succeeded (error=%@)", buf, 0x20u);

        }
        v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "scanResult"));
        -[WiFiFindAndJoinRequest setJoinedNetwork:](self, "setJoinedNetwork:", v122);

        v119 = 1;
        goto LABEL_110;
      }
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "lastObject"));
      v103 = -[WiFiFindAndJoinRequest _canPerformRetry:](self, "_canPerformRetry:", v102);

      if (!v103)
      {
        a4 = v140;
        goto LABEL_105;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v139;
        v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
        v175 = 2112;
        v176 = v92;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: encountered join error %@, performing join retry...", buf, 0x16u);
      }
    }
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "lastObject"));
    v107 = -[WiFiFindAndJoinRequest _canPerformRetry:](self, "_canPerformRetry:", v106);

    if (v107)
    {
      -[WiFiFindAndJoinRequest _checkAndRequestChipResetIfNeeded](self, "_checkAndRequestChipResetIfNeeded");
      v17 = v147;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100186F9C(v169, &v170, v108);
      objc_msgSend(v150, "removeAllObjects");
      v15 = v148;
      continue;
    }
    break;
  }
  v123 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  a4 = v140;
  v74 = v147;
  if (v123)
    sub_100186FE4(v123, v124, v125, v126, v127, v128, v129, v130);
LABEL_105:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v117 = (WiFiFindAndJoinRequest *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest networkName](self, "networkName"));
    *(_DWORD *)buf = 136315650;
    v174 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
    v175 = 2112;
    v176 = v117;
    v177 = 2112;
    *(_QWORD *)v178 = v149;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: find and join %@ failed with error %@", buf, 0x20u);

  }
  if (a4)
  {
    v118 = v149;
    v119 = 0;
    *a4 = -[WiFiFindAndJoinRequest copy](v149, "copy");
  }
  else
  {
    v119 = 0;
LABEL_110:
    v118 = v149;
  }
  -[WiFiFindAndJoinRequest submitMetric](self, "submitMetric");

  return v119;
}

- (void)submitMetric
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  id v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;

  if (&_AnalyticsSendEventLazy)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
    if (v4)
      v5 = CFSTR("Success");
    else
      v5 = CFSTR("Fail");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Status"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
    if (v6)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DidPerformChipReset"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest startedAt](self, "startedAt"));
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)(v10 * 1000.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("CompletionTimeMillisecs"));

    -[WiFiFindAndJoinRequest totalScanTime](self, "totalScanTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)(v12 * 1000.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ScanTimeMillisecs"));

    -[WiFiFindAndJoinRequest totalJoinTime](self, "totalJoinTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", (unint64_t)(v14 * 1000.0)));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("JoinTimeMillisecs"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("Supported2GHzChannelCount"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("Supported5GHzChannelCount"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("Supported6GHzChannelCount"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ScannedChannelCount"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("ScanFailureCount"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("JoinFailureCount"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("RequestedChannel"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiFindAndJoinRequest channelBand](self, "channelBand")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("RequestedBand"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "channel"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "channel")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("JoinedChannel"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("JoinedChannel"));
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "channel"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "band")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("JoinedBand"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("JoinedBand"));
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
    if (objc_msgSend(v38, "count"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "valueForKey:", CFSTR("description")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "componentsJoinedByString:", CFSTR(",")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("ScanFailures"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("ScanFailures"));
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    if (objc_msgSend(v42, "count"))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "valueForKey:", CFSTR("description")));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "componentsJoinedByString:", CFSTR(",")));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("JoinFailures"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("JoinFailures"));
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[WiFiFindAndJoinRequest submitMetric]";
      v51 = 2112;
      v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000827EC;
    v47[3] = &unk_1002305D0;
    v48 = v3;
    v46 = v3;
    AnalyticsSendEventLazy(CFSTR("com.apple.wifi.findandjoinnetwork"), v47);

  }
}

- (BOOL)runSynchronouslyOnQueue:(id)a3 onInterface:(id)a4 outError:(id *)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  _QWORD *v16;
  id *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10002FA58;
  v18[4] = sub_10002F970;
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[WiFiFindAndJoinRequest setStartedAt:](self, "setStartedAt:", v10);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008295C;
  block[3] = &unk_1002305F8;
  block[4] = self;
  v14 = v9;
  v15 = &v20;
  v16 = v18;
  v17 = a5;
  v11 = v9;
  dispatch_sync(v8, block);
  LOBYTE(self) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return (char)self;
}

- (BOOL)runAsynchronouslyOnQueue:(id)a3 onInterface:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[WiFiFindAndJoinRequest setStartedAt:](self, "setStartedAt:", v11);

  global_queue = dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue(global_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100082AF8;
  v18[3] = &unk_100230648;
  v18[4] = self;
  v19 = v9;
  v20 = v8;
  v21 = v10;
  v14 = v8;
  v15 = v10;
  v16 = v9;
  dispatch_async(v13, v18);

  return 0;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (unint64_t)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CWFScanResult)joinedNetwork
{
  return self->_joinedNetwork;
}

- (void)setJoinedNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_joinedNetwork, a3);
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_storeStrong((id *)&self->_startedAt, a3);
}

- (NSMutableArray)scanFailureList
{
  return self->_scanFailureList;
}

- (void)setScanFailureList:(id)a3
{
  objc_storeStrong((id *)&self->_scanFailureList, a3);
}

- (NSMutableArray)joinFailureList
{
  return self->_joinFailureList;
}

- (void)setJoinFailureList:(id)a3
{
  objc_storeStrong((id *)&self->_joinFailureList, a3);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (OS_dispatch_semaphore)chipResetWaiter
{
  return self->_chipResetWaiter;
}

- (void)setChipResetWaiter:(id)a3
{
  objc_storeStrong((id *)&self->_chipResetWaiter, a3);
}

- (NSMutableSet)supported6GHzChannels
{
  return self->_supported6GHzChannels;
}

- (void)setSupported6GHzChannels:(id)a3
{
  objc_storeStrong((id *)&self->_supported6GHzChannels, a3);
}

- (NSMutableSet)supported5GHzChannels
{
  return self->_supported5GHzChannels;
}

- (void)setSupported5GHzChannels:(id)a3
{
  objc_storeStrong((id *)&self->_supported5GHzChannels, a3);
}

- (NSMutableSet)supported2GHzChannels
{
  return self->_supported2GHzChannels;
}

- (void)setSupported2GHzChannels:(id)a3
{
  objc_storeStrong((id *)&self->_supported2GHzChannels, a3);
}

- (NSMutableSet)scannedChannels
{
  return self->_scannedChannels;
}

- (void)setScannedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_scannedChannels, a3);
}

- (NSMutableSet)joinCandidates
{
  return self->_joinCandidates;
}

- (void)setJoinCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_joinCandidates, a3);
}

- (double)totalScanTime
{
  return self->_totalScanTime;
}

- (void)setTotalScanTime:(double)a3
{
  self->_totalScanTime = a3;
}

- (double)totalJoinTime
{
  return self->_totalJoinTime;
}

- (void)setTotalJoinTime:(double)a3
{
  self->_totalJoinTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCandidates, 0);
  objc_storeStrong((id *)&self->_scannedChannels, 0);
  objc_storeStrong((id *)&self->_supported2GHzChannels, 0);
  objc_storeStrong((id *)&self->_supported5GHzChannels, 0);
  objc_storeStrong((id *)&self->_supported6GHzChannels, 0);
  objc_storeStrong((id *)&self->_chipResetWaiter, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_joinFailureList, 0);
  objc_storeStrong((id *)&self->_scanFailureList, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_joinedNetwork, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
