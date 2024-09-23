@implementation WiFiPerfPerAssocSession

- (WiFiPerfPerAssocSession)initWithNetworkRecord:(void *)a3 managerRef:(void *)a4 andManagerQueue:(id)a5
{
  id v9;
  WiFiPerfPerAssocSession *v10;
  const void *v11;
  NSString *v12;
  uint64_t v13;
  NSString *scorecardIdentifier;
  const void *v15;
  uint64_t v16;
  NSString *connectedBSSID;
  const void *v18;
  uint64_t v19;
  NSString *connectedSSID;
  NSMutableArray *v21;
  NSMutableArray *scanResults;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)WiFiPerfPerAssocSession;
  v10 = -[WiFiPerfPerAssocSession init](&v26, "init");
  if (!a3)
  {
    v24 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s initWithNetworkRecord: without networkRecord", "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    goto LABEL_14;
  }
  if (!a4)
  {
    v24 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s initWithNetworkRecord: without managerRef", "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    goto LABEL_14;
  }
  if (!v9)
  {
    v24 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s initWithNetworkRecord: without manager queue", "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    goto LABEL_14;
  }
  qword_10026D730 = (uint64_t)a4;
  objc_storeStrong((id *)&qword_10026D728, a5);
  v11 = sub_10002B088(a3);
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, sub_10002BE64((uint64_t)a3, CFSTR("BSSID")));
  v13 = objc_claimAutoreleasedReturnValue(v12);
  scorecardIdentifier = v10->_scorecardIdentifier;
  v10->_scorecardIdentifier = (NSString *)v13;

  v15 = sub_10002BE64((uint64_t)a3, CFSTR("BSSID"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v16;

  v18 = sub_10002B088(a3);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v19;

  v10->_rttMinActiveSession = 3.40282347e38;
  v10->_rttVarianceActiveSession = -3.40282347e38;
  v10->_accuracyOfBestReading = 3.40282347e38;
  v10->_hasBeenFinalized = 0;
  v10->_ssidHarvestStatus = 1;
  v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  scanResults = v10->_scanResults;
  v10->_scanResults = v21;

  if (!v10->_scanResults)
  {
    v24 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "couldn't init an array for _scanResults", v25);
LABEL_14:
    objc_autoreleasePoolPop(v24);

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  __WiFiNetwork *networkRecord;
  objc_super v4;

  networkRecord = self->_networkRecord;
  if (networkRecord)
  {
    CFRelease(networkRecord);
    self->_networkRecord = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiPerfPerAssocSession;
  -[WiFiPerfPerAssocSession dealloc](&v4, "dealloc");
}

- (id)_deltaStartScorecard:(id)a3 fromEndScorecard:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  void *v23;
  void *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  void *v31;
  void *v32;
  _BYTE *v33;
  void *v34;
  void *v35;
  void *v36;
  _BYTE *v37;
  void *v38;
  void *v39;
  void *v40;
  _BYTE *v41;
  void *v42;
  void *v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  void *v47;
  void *v48;
  _BYTE *v49;
  void *v50;
  void *v51;
  void *v52;
  _BYTE *v53;
  void *v54;
  void *v55;
  void *v56;
  _BYTE *v57;
  void *v58;
  void *v59;
  void *v60;
  _BYTE *v61;
  void *v62;
  void *v63;
  void *v64;
  _BYTE *v65;
  void *v66;
  void *v67;
  void *v68;
  _BYTE *v69;
  void *v70;
  void *v71;
  void *v72;
  _BYTE *v73;
  void *v74;
  void *v75;
  void *v76;
  _BYTE *v77;
  void *v78;
  void *v79;
  void *v80;
  _BYTE *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "mutableCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("adminDisables")));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adminDisables")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9 - (_BYTE *)objc_msgSend(v10, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("adminDisables"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesIn")));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bytesIn")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13 - (_BYTE *)objc_msgSend(v14, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("bytesIn"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesOut")));
  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bytesOut")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17 - (_BYTE *)objc_msgSend(v18, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("bytesOut"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connAttempts")));
  v21 = objc_msgSend(v20, "unsignedIntegerValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connAttempts")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21 - (_BYTE *)objc_msgSend(v22, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("connAttempts"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("connSuccesses")));
  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connSuccesses")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v25 - (_BYTE *)objc_msgSend(v26, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("connSuccesses"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("certErrors")));
  v29 = objc_msgSend(v28, "unsignedIntegerValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certErrors")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29 - (_BYTE *)objc_msgSend(v30, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("certErrors"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataStalls")));
  v33 = objc_msgSend(v32, "unsignedIntegerValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataStalls")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33 - (_BYTE *)objc_msgSend(v34, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("dataStalls"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("epochs")));
  v37 = objc_msgSend(v36, "unsignedIntegerValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("epochs")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37 - (_BYTE *)objc_msgSend(v38, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("epochs"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("faultyStay")));
  v41 = objc_msgSend(v40, "unsignedIntegerValue");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faultyStay")));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41 - (_BYTE *)objc_msgSend(v42, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v43, CFSTR("faultyStay"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowLqmStay")));
  v45 = objc_msgSend(v44, "unsignedIntegerValue");
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lowLqmStay")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v45 - (_BYTE *)objc_msgSend(v46, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v47, CFSTR("lowLqmStay"));

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lowqStay")));
  v49 = objc_msgSend(v48, "unsignedIntegerValue");
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lowqStay")));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v49 - (_BYTE *)objc_msgSend(v50, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v51, CFSTR("lowqStay"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lqmTranCount")));
  v53 = objc_msgSend(v52, "unsignedIntegerValue");
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lqmTranCount")));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v53 - (_BYTE *)objc_msgSend(v54, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v55, CFSTR("lqmTranCount"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lqmTransitionRate")));
  v57 = objc_msgSend(v56, "unsignedIntegerValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lqmTransitionRate")));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v57 - (_BYTE *)objc_msgSend(v58, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, CFSTR("lqmTransitionRate"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("overallStay")));
  v61 = objc_msgSend(v60, "unsignedIntegerValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("overallStay")));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v61 - (_BYTE *)objc_msgSend(v62, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v63, CFSTR("overallStay"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("packetsIn")));
  v65 = objc_msgSend(v64, "unsignedIntegerValue");
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packetsIn")));
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v65 - (_BYTE *)objc_msgSend(v66, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v67, CFSTR("packetsIn"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("packetsOut")));
  v69 = objc_msgSend(v68, "unsignedIntegerValue");
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("packetsOut")));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v69 - (_BYTE *)objc_msgSend(v70, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v71, CFSTR("packetsOut"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reTxBytes")));
  v73 = objc_msgSend(v72, "unsignedIntegerValue");
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reTxBytes")));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v73 - (_BYTE *)objc_msgSend(v74, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v75, CFSTR("reTxBytes"));

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("receivedDupes")));
  v77 = objc_msgSend(v76, "unsignedIntegerValue");
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("receivedDupes")));
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v77 - (_BYTE *)objc_msgSend(v78, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v79, CFSTR("receivedDupes"));

  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rxOutOfOrderBytes")));
  v81 = objc_msgSend(v80, "unsignedIntegerValue");
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rxOutOfOrderBytes")));
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v81 - (_BYTE *)objc_msgSend(v82, "unsignedIntegerValue")));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v83, CFSTR("rxOutOfOrderBytes"));

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("topDownloadRate")));
  v85 = objc_msgSend(v84, "unsignedIntegerValue");
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topDownloadRate")));

  v87 = objc_msgSend(v86, "unsignedIntegerValue");
  if (v85 == v87)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_100254178, CFSTR("topDownloadRate"));
  return v7;
}

- (void)accumulateActiveUsageWithScorecard:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;

  v56 = a3;
  if (v56)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));
      v11 = objc_msgSend(v9, "hasSuffix:", v10);

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allValues"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bytesIn")));
        -[WiFiPerfPerAssocSession setBytesInTotalActiveUsageSession:](self, "setBytesInTotalActiveUsageSession:", (char *)-[WiFiPerfPerAssocSession bytesInTotalActiveUsageSession](self, "bytesInTotalActiveUsageSession")+ (_BYTE *)objc_msgSend(v15, "unsignedIntegerValue")- (_BYTE *)-[WiFiPerfPerAssocSession lastBytesInSample](self, "lastBytesInSample"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allValues"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("bytesOut")));
        -[WiFiPerfPerAssocSession setBytesOutTotalActiveUsageSession:](self, "setBytesOutTotalActiveUsageSession:", (char *)-[WiFiPerfPerAssocSession bytesOutTotalActiveUsageSession](self, "bytesOutTotalActiveUsageSession")+ (_BYTE *)objc_msgSend(v19, "unsignedIntegerValue")- (_BYTE *)-[WiFiPerfPerAssocSession lastBytesOutSample](self, "lastBytesOutSample"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allValues"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", 0));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bytesIn")));
        -[WiFiPerfPerAssocSession setLastBytesInSample:](self, "setLastBytesInSample:", objc_msgSend(v23, "unsignedIntegerValue"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allValues"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", 0));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("bytesOut")));
        -[WiFiPerfPerAssocSession setLastBytesOutSample:](self, "setLastBytesOutSample:", objc_msgSend(v27, "unsignedIntegerValue"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allValues"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", 0));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("rttAvg")));
        objc_msgSend(v31, "doubleValue");
        v33 = v32;

        if (v33 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttAverageAtBeginActiveSession](self, "rttAverageAtBeginActiveSession");
          if (v34 != 0.0)
          {
            -[WiFiPerfPerAssocSession rttAverageAtBeginActiveSession](self, "rttAverageAtBeginActiveSession");
            v33 = (v33 + v35) * 0.5;
          }
          -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
          if (v36 != 0.0)
          {
            -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
            v33 = (v33 + v37) * 0.5;
          }
          -[WiFiPerfPerAssocSession setRttAverageActiveSession:](self, "setRttAverageActiveSession:", v33);
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "allValues"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndex:", 0));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rttMin")));
        objc_msgSend(v41, "doubleValue");
        v43 = v42;

        -[WiFiPerfPerAssocSession rttMinAtBeginActiveSession](self, "rttMinAtBeginActiveSession");
        if (v44 != 0.0 && v43 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttMinAtBeginActiveSession](self, "rttMinAtBeginActiveSession");
          if (v43 < v45)
          {
            -[WiFiPerfPerAssocSession rttMinActiveSession](self, "rttMinActiveSession");
            if (v43 < v46)
              -[WiFiPerfPerAssocSession setRttMinActiveSession:](self, "setRttMinActiveSession:", v43);
          }
        }
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("instant")));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "allValues"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndex:", 0));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("rttVar")));
        objc_msgSend(v50, "doubleValue");
        v52 = v51;

        -[WiFiPerfPerAssocSession rttVarianceAtBeginActiveSession](self, "rttVarianceAtBeginActiveSession");
        if (v53 != 0.0 && v52 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttVarianceAtBeginActiveSession](self, "rttVarianceAtBeginActiveSession");
          if (v52 > v54)
          {
            -[WiFiPerfPerAssocSession rttVarianceActiveSession](self, "rttVarianceActiveSession");
            if (v52 > v55)
              -[WiFiPerfPerAssocSession setRttVarianceActiveSession:](self, "setRttVarianceActiveSession:", v52);
          }
        }
      }
    }
  }

}

- (id)finalizeWithEndScorecard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WiFiPerfPerAssocSession *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  int v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v117;
  void *v118;
  id v119;
  id obj;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession historicalScorecardAtAssoc](self, "historicalScorecardAtAssoc"));
    if (v6)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession historicalScorecardAtAssoc](self, "historicalScorecardAtAssoc"));
      v8 = (id)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession _deltaStartScorecard:fromEndScorecard:](self, "_deltaStartScorecard:fromEndScorecard:", v7, v4));

    }
    else
    {
      v7 = objc_msgSend(v4, "mutableCopy");
      v8 = v7;
    }

    -[WiFiPerfPerAssocSession rttMinActiveSession](self, "rttMinActiveSession");
    if (v9 != 3.40282347e38)
    {
      -[WiFiPerfPerAssocSession rttMinActiveSession](self, "rttMinActiveSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("ppaActiveUseRttMin"));

    }
    -[WiFiPerfPerAssocSession rttVarianceActiveSession](self, "rttVarianceActiveSession");
    if (v11 > 0.0)
    {
      -[WiFiPerfPerAssocSession rttVarianceActiveSession](self, "rttVarianceActiveSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("ppaAactiveUseRttVar"));

    }
    -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
    if (v13 != 0.0)
    {
      -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("ppaActiveUseRttAvg"));

    }
    if (-[WiFiPerfPerAssocSession ccaAverage](self, "ccaAverage"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[WiFiPerfPerAssocSession ccaAverage](self, "ccaAverage")));
      objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("ppaCCA"));

    }
    if (-[WiFiPerfPerAssocSession rssiAverage](self, "rssiAverage"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[WiFiPerfPerAssocSession rssiAverage](self, "rssiAverage")));
      objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("ppaRSSI"));

    }
    if (-[WiFiPerfPerAssocSession snrAverage](self, "snrAverage"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[WiFiPerfPerAssocSession snrAverage](self, "snrAverage")));
      objc_msgSend(v8, "setObject:forKey:", v17, CFSTR("ppaSNR"));

    }
    v118 = v5;
    v119 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));
      objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("ppaBSSIDConnected"));

    }
    v117 = v8;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v22 = self;
    obj = (id)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession scanResults](self, "scanResults"));
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          v27 = v21;
          v28 = v20;
          if (*(_QWORD *)v122 != v25)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "SSID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](v22, "connectedSSID"));
          v32 = objc_msgSend(v30, "isEqualToString:", v31);

          v20 = v28;
          v21 = v27;
          if (v32)
            v33 = v20;
          else
            v33 = v27;
          objc_msgSend(v33, "addObject:", v29);
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
      }
      while (v24);
    }

    if (objc_msgSend(v20, "count"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v20));
      objc_msgSend(v117, "setObject:forKey:", v34, CFSTR("ppaBSSIDsMatchingSSID"));

    }
    if (objc_msgSend(v21, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v21));
      objc_msgSend(v117, "setObject:forKey:", v35, CFSTR("ppaBSSIDsNotMatchSSID"));

    }
    -[WiFiPerfPerAssocSession bestLatitudeReading](v22, "bestLatitudeReading");
    if (v36 != 0.0)
    {
      -[WiFiPerfPerAssocSession bestLongitudeReading](v22, "bestLongitudeReading");
      if (v37 != 0.0)
      {
        v38 = objc_alloc((Class)CLLocation);
        -[WiFiPerfPerAssocSession bestLatitudeReading](v22, "bestLatitudeReading");
        v40 = v39;
        -[WiFiPerfPerAssocSession bestLongitudeReading](v22, "bestLongitudeReading");
        v42 = objc_msgSend(v38, "initWithLatitude:longitude:", v40, v41);
        objc_msgSend(v42, "roundCoordinateValuesToGeohashOfLength:", 7);
        v44 = v43;
        v46 = v45;
        -[WiFiPerfPerAssocSession bestLatitudeReading](v22, "bestLatitudeReading");
        if (v47 != 0.0)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v44));
          objc_msgSend(v117, "setObject:forKey:", v48, CFSTR("ppaLat"));

        }
        -[WiFiPerfPerAssocSession bestLongitudeReading](v22, "bestLongitudeReading");
        if (v49 != 0.0)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v46));
          objc_msgSend(v117, "setObject:forKey:", v50, CFSTR("ppaLon"));

        }
        -[WiFiPerfPerAssocSession rttVarianceAsPolledViaInstantaneousScorecard](v22, "rttVarianceAsPolledViaInstantaneousScorecard");
        if (v51 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttVarianceAsPolledViaInstantaneousScorecard](v22, "rttVarianceAsPolledViaInstantaneousScorecard");
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v117, "setObject:forKey:", v52, CFSTR("rttVar"));

        }
        -[WiFiPerfPerAssocSession rttAverageAsPolledViaInstantaneousScorecard](v22, "rttAverageAsPolledViaInstantaneousScorecard");
        if (v53 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttAverageAsPolledViaInstantaneousScorecard](v22, "rttAverageAsPolledViaInstantaneousScorecard");
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v117, "setObject:forKey:", v54, CFSTR("rttAvg"));

        }
      }
    }
    if (-[WiFiPerfPerAssocSession securityType](v22, "securityType"))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession securityType](v22, "securityType")));
      objc_msgSend(v117, "setObject:forKey:", v55, CFSTR("ppaSecType"));

    }
    if (-[WiFiPerfPerAssocSession captiveFlag](v22, "captiveFlag"))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession captiveFlag](v22, "captiveFlag")));
      objc_msgSend(v117, "setObject:forKey:", v56, CFSTR("ppaCaptiveFlag"));

    }
    if (-[WiFiPerfPerAssocSession colocatedState](v22, "colocatedState"))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession colocatedState](v22, "colocatedState")));
      objc_msgSend(v117, "setObject:forKey:", v57, CFSTR("ppaColoState"));

    }
    if (-[WiFiPerfPerAssocSession isHS2](v22, "isHS2"))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession isHS2](v22, "isHS2")));
      objc_msgSend(v117, "setObject:forKey:", v58, CFSTR("ppaHS2"));

    }
    if (-[WiFiPerfPerAssocSession band](v22, "band"))
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession band](v22, "band")));
      objc_msgSend(v117, "setObject:forKey:", v59, CFSTR("ppaBand"));

    }
    if (-[WiFiPerfPerAssocSession channel](v22, "channel"))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[WiFiPerfPerAssocSession channel](v22, "channel")));
      objc_msgSend(v117, "setObject:forKey:", v60, CFSTR("ppaChannel"));

    }
    if (-[WiFiPerfPerAssocSession channelWidth](v22, "channelWidth"))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession channelWidth](v22, "channelWidth")));
      objc_msgSend(v117, "setObject:forKey:", v61, CFSTR("ppaChWidth"));

    }
    if (-[WiFiPerfPerAssocSession phyMode](v22, "phyMode"))
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession phyMode](v22, "phyMode")));
      objc_msgSend(v117, "setObject:forKey:", v62, CFSTR("ppaPhyMode"));

    }
    if (-[WiFiPerfPerAssocSession timeOfDay](v22, "timeOfDay"))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession timeOfDay](v22, "timeOfDay")));
      objc_msgSend(v117, "setObject:forKey:", v63, CFSTR("ppaTimeOfDay"));

    }
    if (-[WiFiPerfPerAssocSession associatedTime](v22, "associatedTime"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession associatedTime](v22, "associatedTime")));
      objc_msgSend(v117, "setObject:forKey:", v64, CFSTR("ppaAssociatedTime"));

    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession disAssocReason](v22, "disAssocReason")));
    objc_msgSend(v117, "setObject:forKey:", v65, CFSTR("ppaDisassocReason"));

    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[WiFiPerfPerAssocSession _assocReasonToGeoAssocReason:](v22, "_assocReasonToGeoAssocReason:", -[WiFiPerfPerAssocSession assocReason](v22, "assocReason"))));
    objc_msgSend(v117, "setObject:forKey:", v66, CFSTR("ppaAssocReason"));

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[WiFiPerfPerAssocSession wasCaptive](v22, "wasCaptive")));
    objc_msgSend(v117, "setObject:forKey:", v67, CFSTR("ppaWasCaptive"));

    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[WiFiPerfPerAssocSession assocIsToNoMap](v22, "assocIsToNoMap")));
    objc_msgSend(v117, "setObject:forKey:", v68, CFSTR("ppaIsNoMap"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[WiFiPerfPerAssocSession assocIsToApplePH](v22, "assocIsToApplePH")));
    objc_msgSend(v117, "setObject:forKey:", v69, CFSTR("ppaIsApplePH"));

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WiFiPerfPerAssocSession networkType](v22, "networkType")));
    objc_msgSend(v117, "setObject:forKey:", v70, CFSTR("ppaAdvertisedNetworkType"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[WiFiPerfPerAssocSession networkOriginator](v22, "networkOriginator")));
    objc_msgSend(v117, "setObject:forKey:", v71, CFSTR("ppaNetworkOriginator"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[WiFiPerfPerAssocSession isEdgeBSS](v22, "isEdgeBSS")));
    objc_msgSend(v117, "setObject:forKey:", v72, CFSTR("ppaIsEdgeBSS"));

    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("bytesIn")));
    v74 = objc_msgSend(v73, "integerValue");

    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("bytesIn")));
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", objc_msgSend(v75, "integerValue"))));
      objc_msgSend(v117, "setObject:forKey:", v76, CFSTR("bytesIn"));

    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("bytesOut")));
    v78 = objc_msgSend(v77, "integerValue");

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("bytesOut")));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", objc_msgSend(v79, "integerValue"))));
      objc_msgSend(v117, "setObject:forKey:", v80, CFSTR("bytesOut"));

    }
    if (-[WiFiPerfPerAssocSession bytesInTotalActiveUsageSession](v22, "bytesInTotalActiveUsageSession"))
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", -[WiFiPerfPerAssocSession bytesInTotalActiveUsageSession](v22, "bytesInTotalActiveUsageSession"))));
      objc_msgSend(v117, "setObject:forKey:", v81, CFSTR("ppaActiveUseBytesIn"));

    }
    if (-[WiFiPerfPerAssocSession bytesOutTotalActiveUsageSession](v22, "bytesOutTotalActiveUsageSession"))
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundByteCount:](v22, "_roundByteCount:", -[WiFiPerfPerAssocSession bytesOutTotalActiveUsageSession](v22, "bytesOutTotalActiveUsageSession"))));
      objc_msgSend(v117, "setObject:forKey:", v82, CFSTR("ppaActiveUseBytesOut"));

    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("packetsIn")));
    v84 = objc_msgSend(v83, "integerValue");

    if (v84)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("packetsIn")));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundPacketCount:](v22, "_roundPacketCount:", objc_msgSend(v85, "integerValue"))));
      objc_msgSend(v117, "setObject:forKey:", v86, CFSTR("packetsIn"));

    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("packetsOut")));
    v88 = objc_msgSend(v87, "integerValue");

    if (v88)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("packetsOut")));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[WiFiPerfPerAssocSession _roundPacketCount:](v22, "_roundPacketCount:", objc_msgSend(v89, "integerValue"))));
      objc_msgSend(v117, "setObject:forKey:", v90, CFSTR("packetsOut"));

    }
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("receivedDupes")));
    v92 = objc_msgSend(v91, "integerValue");

    if (v92)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("receivedDupes")));
      objc_msgSend(v93, "doubleValue");
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v94 / 100.0) * 100.0));
      objc_msgSend(v117, "setObject:forKey:", v95, CFSTR("receivedDupes"));

    }
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("rxOutOfOrderBytes")));
    v97 = objc_msgSend(v96, "integerValue");

    if (v97)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("rxOutOfOrderBytes")));
      objc_msgSend(v98, "doubleValue");
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v99 / 100.0) * 100.0));
      objc_msgSend(v117, "setObject:forKey:", v100, CFSTR("rxOutOfOrderBytes"));

    }
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("reTxBytes")));
    v102 = objc_msgSend(v101, "integerValue");

    if (v102)
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("reTxBytes")));
      objc_msgSend(v103, "doubleValue");
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", round(v104 / 100.0) * 100.0));
      objc_msgSend(v117, "setObject:forKey:", v105, CFSTR("reTxBytes"));

    }
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession avgDLSpeed](v22, "avgDLSpeed"));

    if (v106)
    {
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession avgDLSpeed](v22, "avgDLSpeed"));
      objc_msgSend(v117, "setObject:forKey:", v107, CFSTR("ppaDLSpeed"));

    }
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession apMode](v22, "apMode"));

    if (v108)
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession apMode](v22, "apMode"));
      objc_msgSend(v117, "setObject:forKey:", v109, CFSTR("ppaAPMode"));

    }
    v110 = MGGetBoolAnswer(CFSTR("InternalBuild"));
    if (-[WiFiPerfPerAssocSession ssidHarvestStatus](v22, "ssidHarvestStatus") == 2)
      goto LABEL_87;
    v112 = -[WiFiPerfPerAssocSession ssidHarvestStatus](v22, "ssidHarvestStatus") == 3 ? v110 : 0;
    if (v112 == 1)
    {
      v113 = arc4random_uniform(0x63u);
      v114 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ssid sampling (%u > %d)", "-[WiFiPerfPerAssocSession finalizeWithEndScorecard:]", v113, 1);
      objc_autoreleasePoolPop(v114);
      if (v113 <= 1)
      {
LABEL_87:
        v111 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](v22, "connectedSSID"));
        objc_msgSend(v117, "setObject:forKey:", v111, CFSTR("ppaSSID"));

      }
    }
    v115 = v117;

    objc_autoreleasePoolPop(v118);
    v4 = v119;
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without scorecard argument. Perhaps one wasn't received from Symptoms.", "-[WiFiPerfPerAssocSession finalizeWithEndScorecard:]");
    objc_autoreleasePoolPop(v5);
    v115 = 0;
  }

  return v115;
}

- (void)ingestCurrentNetwork:(void *)a3
{
  WiFiPerfPerAssocSession *v4;
  BOOL v5;
  WiFiPerfPerAssocSession *v6;
  CFAllocatorRef Default;
  void *v8;
  _QWORD block[5];
  _QWORD v10[5];
  WiFiPerfPerAssocSession *v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_10002FA98;
  v10[4] = sub_10002F99C;
  v11 = (WiFiPerfPerAssocSession *)0xAAAAAAAAAAAAAAAALL;
  v4 = self;
  v11 = v4;
  if (qword_10026D730)
    v5 = qword_10026D728 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Don't have WiFiManagerRef or the master queue, exit early", "-[WiFiPerfPerAssocSession ingestCurrentNetwork:]");
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v6 = v4;
    if (-[WiFiPerfPerAssocSession networkRecord](v4, "networkRecord"))
    {
      CFRelease(-[WiFiPerfPerAssocSession networkRecord](v6, "networkRecord"));
      -[WiFiPerfPerAssocSession setNetworkRecord:](v6, "setNetworkRecord:", 0);
    }
    Default = CFAllocatorGetDefault();
    -[WiFiPerfPerAssocSession setNetworkRecord:](v6, "setNetworkRecord:", sub_10002B2DC((uint64_t)Default, (uint64_t)a3));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D26F8;
    block[3] = &unk_100230858;
    block[4] = v10;
    dispatch_sync((dispatch_queue_t)qword_10026DD40, block);
  }
  _Block_object_dispose(v10, 8);

}

- (void)_updateNetworkOnManagerQueue:(id)a3
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  id v8;
  CFIndex FirstIndexOfValue;
  const void *ValueAtIndex;
  const void *v11;
  const void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFArray *v16;
  const __CFArray *v17;
  const void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  CFRange v35;

  v34 = a3;
  if (objc_msgSend(v34, "networkRecord"))
  {
    v4 = (const __CFArray *)sub_10008674C(qword_10026D730);
    if (v4)
    {
      v5 = v4;
      Count = CFArrayGetCount(v4);
      if (Count)
      {
        v7 = Count;
        v8 = objc_msgSend(v34, "networkRecord");
        v35.location = 0;
        v35.length = v7;
        FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v35, v8);
        if ((FirstIndexOfValue & 0x8000000000000000) == 0)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, FirstIndexOfValue);
          objc_msgSend(v34, "setSecurityType:", sub_1000C5C14((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setCaptiveFlag:", sub_1000C4820((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setIsHS2:", sub_10002DA5C((_BOOL8)ValueAtIndex));
          objc_msgSend(v34, "setBand:", sub_10003153C((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setChannel:", objc_msgSend((id)sub_1000316E0((uint64_t)ValueAtIndex), "integerValue"));
          objc_msgSend(v34, "setChannelWidth:", sub_100008CEC((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setPhyMode:", sub_1000C6B54((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setWasCaptive:", sub_1000C47AC((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setNetworkType:", sub_1000CB93C((uint64_t)ValueAtIndex));
          objc_msgSend(v34, "setNetworkOriginator:", sub_1000CB2D0((uint64_t)ValueAtIndex));
          v11 = sub_10002BE64((uint64_t)ValueAtIndex, CFSTR("BSSID"));
          objc_msgSend(v34, "setIsEdgeBSS:", sub_1000C86EC(ValueAtIndex, v11) != 0);
          objc_msgSend(v34, "setSsidHarvestStatus:", sub_1000CC884((uint64_t)ValueAtIndex));
          v12 = sub_10002B088(ValueAtIndex);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          objc_msgSend(v34, "setAssocIsToNoMap:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));
          v15 = objc_msgSend(v14, "hasSuffix:", CFSTR("_nomap"));

          if (v15)
            objc_msgSend(v34, "setAssocIsToNoMap:", 1);
          objc_msgSend(v34, "setAssocIsToApplePH:", sub_10001395C((uint64_t)ValueAtIndex) != 0);
          v16 = (const __CFArray *)sub_10002BE64((uint64_t)ValueAtIndex, CFSTR("lastTputMeasurementResults"));
          if (v16)
          {
            v17 = v16;
            if (CFArrayGetCount(v16) >= 1)
              objc_msgSend(v34, "setAvgDLSpeed:", CFArrayGetValueAtIndex(v17, 0));
          }
          v18 = sub_10002BE64((uint64_t)ValueAtIndex, CFSTR("AP_MODE"));
          if (v18)
            objc_msgSend(v34, "setApMode:", v18);
          v19 = objc_autoreleasePoolPush();
          v20 = (void *)qword_10026DD20;
          if (qword_10026DD20)
          {
            v32 = objc_msgSend(v34, "securityType");
            v31 = objc_msgSend(v34, "captiveFlag");
            v33 = v13;
            v21 = objc_msgSend(v34, "channel");
            v22 = objc_msgSend(v34, "phyMode");
            v23 = objc_msgSend(v34, "networkType");
            v24 = objc_msgSend(v34, "networkOriginator");
            v25 = objc_msgSend(v34, "ssidHarvestStatus");
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "avgDLSpeed"));
            v30 = v21;
            v13 = v33;
            objc_msgSend(v20, "WFLog:message:", 3, "%s: %@: securityType: %lu captiveFlag: %lu channel: %ld phyMode: %lu networkType: %d originator: %d ssid-harvest: %d avgDLSpeed: %@", "-[WiFiPerfPerAssocSession _updateNetworkOnManagerQueue:]", v33, v32, v31, v30, v22, v23, v24, v25, v26);

          }
          objc_autoreleasePoolPop(v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager"));
          v28 = objc_msgSend(v27, "copyPreferenceScoreDictionaryForNetwork:", ValueAtIndex);

          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager"));
            -[WiFiPerfPerAssocSession setColocatedState:](self, "setColocatedState:", objc_msgSend(v29, "getColocatedStateFromPreferenceScoreDictionary:", v28));

          }
          else
          {
            -[WiFiPerfPerAssocSession setColocatedState:](self, "setColocatedState:", 0);
          }

        }
      }
    }
  }

}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  double v9;
  double v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  -[WiFiPerfPerAssocSession bestLatitudeReading](self, "bestLatitudeReading");
  if (v9 == 0.0 || (-[WiFiPerfPerAssocSession bestLongitudeReading](self, "bestLongitudeReading"), v10 == 0.0))
  {
    if (a3 == 0.0 || a4 == 0.0 || a5 == 0.0)
    {
      v12 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid location (lat: %f, lng: %f) or accuracy (%f)", "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    }
    else
    {
      if (a5 < 100.1)
      {
        -[WiFiPerfPerAssocSession setAccuracyOfBestReading:](self, "setAccuracyOfBestReading:", a5);
        -[WiFiPerfPerAssocSession setBestLatitudeReading:](self, "setBestLatitudeReading:", a3);
        -[WiFiPerfPerAssocSession setBestLongitudeReading:](self, "setBestLongitudeReading:", a4);
        return 1;
      }
      v12 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid location accuracy %f", "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]", *(_QWORD *)&a5, v13, v14);
    }
    objc_autoreleasePoolPop(v12);
  }
  return 0;
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  WiFiPerfPerAssocNearbyNetwork *v25;
  void *v26;
  WiFiPerfPerAssocNearbyNetwork *v27;
  void *v28;
  void *v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  WiFiPerfPerAssocSession *v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CCA")));
    v7 = (uint64_t)objc_msgSend(v6, "integerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RSSI")));
    v9 = (uint64_t)objc_msgSend(v8, "integerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SNR")));
    v11 = (uint64_t)objc_msgSend(v10, "integerValue");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ROAM_STATE")));
    v13 = v12;
    if (v12)
    {
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ROAM_CACHE")));
      if (obj)
      {
        v37 = v7;
        v38 = v9;
        v39 = v13;
        v40 = v5;
        v41 = self;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v45;
          do
          {
            v17 = 0;
            v42 = v15;
            do
            {
              if (*(_QWORD *)v45 != v16)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BSSID")));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("RSSI")));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CHANNEL")));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CHANNEL_FLAGS")));
              if (v19)
                v23 = v20 == 0;
              else
                v23 = 1;
              if (!v23 && v21 != 0)
              {
                v25 = [WiFiPerfPerAssocNearbyNetwork alloc];
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](v41, "connectedSSID"));
                v27 = -[WiFiPerfPerAssocNearbyNetwork initWithSSID:rssi:bssid:channel:channelFlags:andOrigin:](v25, "initWithSSID:rssi:bssid:channel:channelFlags:andOrigin:", v26, v20, v19, v21, v22, 1);

                v28 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession scanResults](v41, "scanResults"));
                objc_msgSend(v28, "addObject:", v27);

                v15 = v42;
              }

              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v15);
        }

        v5 = v40;
        self = v41;
        v13 = v39;
        v7 = v37;
        v9 = v38;
      }
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CCA")));

    if (v29)
    {
      if (-[WiFiPerfPerAssocSession ccaAverage](self, "ccaAverage"))
      {
        v30 = -[WiFiPerfPerAssocSession ccaAverage](self, "ccaAverage");
        v31 = v30 + v7;
        if (v30 + v7 < 0 != __OFADD__(v30, v7))
          ++v31;
        v7 = v31 >> 1;
      }
      -[WiFiPerfPerAssocSession setCcaAverage:](self, "setCcaAverage:", v7);
    }
    if (v9)
    {
      if (-[WiFiPerfPerAssocSession rssiAverage](self, "rssiAverage"))
      {
        v32 = -[WiFiPerfPerAssocSession rssiAverage](self, "rssiAverage");
        v33 = v32 + v9;
        if (v32 + v9 < 0 != __OFADD__(v32, v9))
          ++v33;
        v9 = v33 >> 1;
      }
      -[WiFiPerfPerAssocSession setRssiAverage:](self, "setRssiAverage:", v9);
    }
    if (v11)
    {
      if (-[WiFiPerfPerAssocSession snrAverage](self, "snrAverage"))
      {
        v34 = -[WiFiPerfPerAssocSession snrAverage](self, "snrAverage");
        v35 = v34 + v11;
        if (v34 + v11 < 0 != __OFADD__(v34, v11))
          ++v35;
        v11 = v35 >> 1;
      }
      -[WiFiPerfPerAssocSession setSnrAverage:](self, "setSnrAverage:", v11);
    }

  }
  else
  {
    v36 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without argument!", "-[WiFiPerfPerAssocSession ingestLQMUpdate:]");
    objc_autoreleasePoolPop(v36);
  }

}

- (void)ingestInstantaneousScorecardFromPolling:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("instant")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rttVar")));
  objc_msgSend(v7, "doubleValue");
  -[WiFiPerfPerAssocSession setRttVarianceAsPolledViaInstantaneousScorecard:](self, "setRttVarianceAsPolledViaInstantaneousScorecard:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("instant")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rttAvg")));
  objc_msgSend(v11, "doubleValue");
  -[WiFiPerfPerAssocSession setRttAverageAsPolledViaInstantaneousScorecard:](self, "setRttAverageAsPolledViaInstantaneousScorecard:");

  -[WiFiPerfPerAssocSession accumulateActiveUsageWithScorecard:](self, "accumulateActiveUsageWithScorecard:", v12);
}

- (void)ingestScanResults:(id)a3 currentSSID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  WiFiPerfPerAssocNearbyNetwork *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  WiFiPerfPerAssocSession *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  v30 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](self, "connectedSSID"));
  LOBYTE(self) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((self & 1) != 0)
  {
    v27 = v7;
    v28 = v6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SSID_STR")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BSSID")));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RSSI")));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CHANNEL")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CHANNEL_FLAGS")));
          if (v14)
          {
            if (objc_msgSend(v14, "length"))
              v19 = v15 == 0;
            else
              v19 = 1;
            if (!v19 && v16 != 0 && v17 != 0)
            {
              v22 = -[WiFiPerfPerAssocNearbyNetwork initWithSSID:rssi:bssid:channel:channelFlags:andOrigin:]([WiFiPerfPerAssocNearbyNetwork alloc], "initWithSSID:rssi:bssid:channel:channelFlags:andOrigin:", v14, v16, v15, v17, v18, 2);
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession scanResults](v30, "scanResults"));
              objc_msgSend(v23, "addObject:", v22);

            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

    v7 = v27;
    v6 = v28;
  }
  else
  {
    v24 = objc_autoreleasePoolPush();
    v25 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](v30, "connectedSSID"));
      objc_msgSend(v25, "WFLog:message:", 3, "%s told to ingest scan results but the current SSID (%@) indicated with the scan results differs from that which WiFiPerfPerAssoc session was initialized with (%@)", "-[WiFiPerfPerAssocSession ingestScanResults:currentSSID:]", v7, v26);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)beginTrackingActiveUsageWithScorecard:(id)a3
{
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
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesIn")));
  -[WiFiPerfPerAssocSession setBytesInAtBeginActiveUsageSession:](self, "setBytesInAtBeginActiveUsageSession:", objc_msgSend(v8, "unsignedIntegerValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bytesOut")));
  -[WiFiPerfPerAssocSession setBytesOutAtBeginActiveUsageSession:](self, "setBytesOutAtBeginActiveUsageSession:", objc_msgSend(v12, "unsignedIntegerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allValues"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rttAvg")));
  objc_msgSend(v16, "doubleValue");
  -[WiFiPerfPerAssocSession setRttAverageAtBeginActiveSession:](self, "setRttAverageAtBeginActiveSession:");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allValues"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("rttMin")));
  objc_msgSend(v20, "doubleValue");
  -[WiFiPerfPerAssocSession setRttMinAtBeginActiveSession:](self, "setRttMinAtBeginActiveSession:");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allValues"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rttVar")));
  objc_msgSend(v24, "doubleValue");
  -[WiFiPerfPerAssocSession setRttVarianceAtBeginActiveSession:](self, "setRttVarianceAtBeginActiveSession:");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allValues"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndex:", 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("bytesIn")));
  -[WiFiPerfPerAssocSession setLastBytesInSample:](self, "setLastBytesInSample:", objc_msgSend(v28, "unsignedIntegerValue"));

  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instant")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allValues"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", 0));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("bytesOut")));
  -[WiFiPerfPerAssocSession setLastBytesOutSample:](self, "setLastBytesOutSample:", objc_msgSend(v31, "unsignedIntegerValue"));

}

- (void)resetActiveUsageStats
{
  -[WiFiPerfPerAssocSession setRttMinAtBeginActiveSession:](self, "setRttMinAtBeginActiveSession:", 0.0);
  -[WiFiPerfPerAssocSession setRttAverageAtBeginActiveSession:](self, "setRttAverageAtBeginActiveSession:", 0.0);
  -[WiFiPerfPerAssocSession setRttVarianceAtBeginActiveSession:](self, "setRttVarianceAtBeginActiveSession:", 0.0);
  -[WiFiPerfPerAssocSession setBytesInAtBeginActiveUsageSession:](self, "setBytesInAtBeginActiveUsageSession:", 0);
  -[WiFiPerfPerAssocSession setBytesOutAtBeginActiveUsageSession:](self, "setBytesOutAtBeginActiveUsageSession:", 0);
  -[WiFiPerfPerAssocSession setLastBytesInSample:](self, "setLastBytesInSample:", 0);
  -[WiFiPerfPerAssocSession setLastBytesOutSample:](self, "setLastBytesOutSample:", 0);
}

- (void)calculateTimes
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  -[WiFiPerfPerAssocSession epochAtAssoc](self, "epochAtAssoc");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6 - v4;

  -[WiFiPerfPerAssocSession epochAtAssoc](self, "epochAtAssoc");
  if (v4 == 0.0)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: epochAtAssoc is invalid, using current date for midpoint", "-[WiFiPerfPerAssocSession calculateTimes]");
    objc_autoreleasePoolPop(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;

  }
  else
  {
    v12 = v8 + v7 * 0.5;
  }
  -[WiFiPerfPerAssocSession _roundTimeInterval:toNearestNumberOfHours:](self, "_roundTimeInterval:toNearestNumberOfHours:", 3, v12);
  -[WiFiPerfPerAssocSession setTimeOfDay:](self, "setTimeOfDay:", (unint64_t)v13);
  if (v7 >= 60.0)
  {
    if (v7 >= 300.0)
    {
      if (v7 >= 1200.0)
      {
        if (v7 >= 3600.0 || v7 < 1200.0)
          -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 5);
        else
          -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 4);
      }
      else
      {
        -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 3);
      }
    }
    else
    {
      -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 2);
    }
  }
  else
  {
    -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 1);
  }
}

- (double)_roundTimeInterval:(double)a3 toNearestNumberOfHours:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "components:fromDate:", 124, v5));

  v8 = (uint64_t)objc_msgSend(v7, "hour");
  v9 = v8 % a4;
  if (a4 >= 0)
    v10 = a4;
  else
    v10 = a4 + 1;
  if (v9 >= v10 >> 1 && (v9 != v10 >> 1 || (uint64_t)objc_msgSend(v7, "minute") >= 30))
    v8 += a4;
  objc_msgSend(v7, "setHour:", v8 - v9);
  objc_msgSend(v7, "setMinute:", 0);
  objc_msgSend(v7, "setSecond:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateFromComponents:", v7));
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;

  return v14;
}

- (unint64_t)_roundPacketCount:(unint64_t)a3
{
  unint64_t v3;

  v3 = 100000000;
  if (a3 > 0x5F5E100)
    return v3;
  if (a3 < 0x64)
    return 0;
  return -[WiFiPerfPerAssocSession _getSingleSigFigForValue:](self, "_getSingleSigFigForValue:");
}

- (unint64_t)_roundByteCount:(unint64_t)a3
{
  if (a3 > 0x2541B263FLL)
    return 10000;
  if (a3 >= 0xF4240)
    return -[WiFiPerfPerAssocSession _getSingleSigFigForValue:](self, "_getSingleSigFigForValue:", a3 / 0xF4240);
  return 0;
}

- (unint64_t)_getSingleSigFigForValue:(unint64_t)a3
{
  double v4;
  double v5;

  if (!a3)
    return 0;
  v4 = log10((double)a3);
  v5 = __exp10(floor(v4));
  return a3 / (unint64_t)v5 * (unint64_t)v5;
}

- (int)_assocReasonToGeoAssocReason:(int)a3
{
  if (a3 < 3)
    return a3 + 1;
  else
    return 0;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession scorecardIdentifier](self, "scorecardIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WiFiPerfPerAssocSession with identifier: %@"), v2));

  return v3;
}

- (double)doNotFinalizePriorToEpoch
{
  return self->_doNotFinalizePriorToEpoch;
}

- (void)setDoNotFinalizePriorToEpoch:(double)a3
{
  self->_doNotFinalizePriorToEpoch = a3;
}

- (NSString)scorecardIdentifier
{
  return self->_scorecardIdentifier;
}

- (void)setScorecardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scorecardIdentifier, a3);
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_connectedBSSID, a3);
}

- (NSDictionary)historicalScorecardAtAssoc
{
  return self->_historicalScorecardAtAssoc;
}

- (void)setHistoricalScorecardAtAssoc:(id)a3
{
  objc_storeStrong((id *)&self->_historicalScorecardAtAssoc, a3);
}

- (double)epochAtAssoc
{
  return self->_epochAtAssoc;
}

- (void)setEpochAtAssoc:(double)a3
{
  self->_epochAtAssoc = a3;
}

- (unint64_t)assocReason
{
  return self->_assocReason;
}

- (void)setAssocReason:(unint64_t)a3
{
  self->_assocReason = a3;
}

- (unint64_t)disAssocReason
{
  return self->_disAssocReason;
}

- (void)setDisAssocReason:(unint64_t)a3
{
  self->_disAssocReason = a3;
}

- (BOOL)hasBeenFinalized
{
  return self->_hasBeenFinalized;
}

- (void)setHasBeenFinalized:(BOOL)a3
{
  self->_hasBeenFinalized = a3;
}

- (unint64_t)bytesInAtBeginActiveUsageSession
{
  return self->_bytesInAtBeginActiveUsageSession;
}

- (void)setBytesInAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesInAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesOutAtBeginActiveUsageSession
{
  return self->_bytesOutAtBeginActiveUsageSession;
}

- (void)setBytesOutAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesInTotalActiveUsageSession
{
  return self->_bytesInTotalActiveUsageSession;
}

- (void)setBytesInTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesInTotalActiveUsageSession = a3;
}

- (unint64_t)bytesOutTotalActiveUsageSession
{
  return self->_bytesOutTotalActiveUsageSession;
}

- (void)setBytesOutTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutTotalActiveUsageSession = a3;
}

- (unint64_t)lastBytesInSample
{
  return self->_lastBytesInSample;
}

- (void)setLastBytesInSample:(unint64_t)a3
{
  self->_lastBytesInSample = a3;
}

- (unint64_t)lastBytesOutSample
{
  return self->_lastBytesOutSample;
}

- (void)setLastBytesOutSample:(unint64_t)a3
{
  self->_lastBytesOutSample = a3;
}

- (double)rttMinActiveSession
{
  return self->_rttMinActiveSession;
}

- (void)setRttMinActiveSession:(double)a3
{
  self->_rttMinActiveSession = a3;
}

- (double)rttMinAtBeginActiveSession
{
  return self->_rttMinAtBeginActiveSession;
}

- (void)setRttMinAtBeginActiveSession:(double)a3
{
  self->_rttMinAtBeginActiveSession = a3;
}

- (double)rttAverageActiveSession
{
  return self->_rttAverageActiveSession;
}

- (void)setRttAverageActiveSession:(double)a3
{
  self->_rttAverageActiveSession = a3;
}

- (double)rttAverageAtBeginActiveSession
{
  return self->_rttAverageAtBeginActiveSession;
}

- (void)setRttAverageAtBeginActiveSession:(double)a3
{
  self->_rttAverageAtBeginActiveSession = a3;
}

- (double)rttVarianceActiveSession
{
  return self->_rttVarianceActiveSession;
}

- (void)setRttVarianceActiveSession:(double)a3
{
  self->_rttVarianceActiveSession = a3;
}

- (double)rttVarianceAtBeginActiveSession
{
  return self->_rttVarianceAtBeginActiveSession;
}

- (void)setRttVarianceAtBeginActiveSession:(double)a3
{
  self->_rttVarianceAtBeginActiveSession = a3;
}

- (int64_t)ccaAverage
{
  return self->_ccaAverage;
}

- (void)setCcaAverage:(int64_t)a3
{
  self->_ccaAverage = a3;
}

- (int64_t)rssiAverage
{
  return self->_rssiAverage;
}

- (void)setRssiAverage:(int64_t)a3
{
  self->_rssiAverage = a3;
}

- (int64_t)snrAverage
{
  return self->_snrAverage;
}

- (void)setSnrAverage:(int64_t)a3
{
  self->_snrAverage = a3;
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
  objc_storeStrong((id *)&self->_connectedSSID, a3);
}

- (NSMutableArray)scanResults
{
  return self->_scanResults;
}

- (void)setScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_scanResults, a3);
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (unint64_t)captiveFlag
{
  return self->_captiveFlag;
}

- (void)setCaptiveFlag:(unint64_t)a3
{
  self->_captiveFlag = a3;
}

- (unint64_t)colocatedState
{
  return self->_colocatedState;
}

- (void)setColocatedState:(unint64_t)a3
{
  self->_colocatedState = a3;
}

- (unint64_t)isHS2
{
  return self->_isHS2;
}

- (void)setIsHS2:(unint64_t)a3
{
  self->_isHS2 = a3;
}

- (unint64_t)band
{
  return self->_band;
}

- (void)setBand:(unint64_t)a3
{
  self->_band = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(unint64_t)a3
{
  self->_phyMode = a3;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)associatedTime
{
  return self->_associatedTime;
}

- (void)setAssociatedTime:(unint64_t)a3
{
  self->_associatedTime = a3;
}

- (BOOL)wasCaptive
{
  return self->_wasCaptive;
}

- (void)setWasCaptive:(BOOL)a3
{
  self->_wasCaptive = a3;
}

- (BOOL)assocIsToApplePH
{
  return self->_assocIsToApplePH;
}

- (void)setAssocIsToApplePH:(BOOL)a3
{
  self->_assocIsToApplePH = a3;
}

- (BOOL)assocIsToNoMap
{
  return self->_assocIsToNoMap;
}

- (void)setAssocIsToNoMap:(BOOL)a3
{
  self->_assocIsToNoMap = a3;
}

- (int)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (NSString)bssidOfNetworkForLastReceivedAssocIndication
{
  return self->_bssidOfNetworkForLastReceivedAssocIndication;
}

- (void)setBssidOfNetworkForLastReceivedAssocIndication:(id)a3
{
  objc_storeStrong((id *)&self->_bssidOfNetworkForLastReceivedAssocIndication, a3);
}

- (double)rttVarianceAsPolledViaInstantaneousScorecard
{
  return self->_rttVarianceAsPolledViaInstantaneousScorecard;
}

- (void)setRttVarianceAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttVarianceAsPolledViaInstantaneousScorecard = a3;
}

- (double)rttAverageAsPolledViaInstantaneousScorecard
{
  return self->_rttAverageAsPolledViaInstantaneousScorecard;
}

- (void)setRttAverageAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttAverageAsPolledViaInstantaneousScorecard = a3;
}

- (NSString)bssidAtPollingStart
{
  return self->_bssidAtPollingStart;
}

- (void)setBssidAtPollingStart:(id)a3
{
  self->_bssidAtPollingStart = (NSString *)a3;
}

- (int)networkOriginator
{
  return self->_networkOriginator;
}

- (void)setNetworkOriginator:(int)a3
{
  self->_networkOriginator = a3;
}

- (BOOL)isEdgeBSS
{
  return self->_isEdgeBSS;
}

- (void)setIsEdgeBSS:(BOOL)a3
{
  self->_isEdgeBSS = a3;
}

- (__WiFiNetwork)networkRecord
{
  return self->_networkRecord;
}

- (void)setNetworkRecord:(__WiFiNetwork *)a3
{
  self->_networkRecord = a3;
}

- (NSNumber)avgDLSpeed
{
  return self->_avgDLSpeed;
}

- (void)setAvgDLSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_avgDLSpeed, a3);
}

- (NSNumber)apMode
{
  return self->_apMode;
}

- (void)setApMode:(id)a3
{
  objc_storeStrong((id *)&self->_apMode, a3);
}

- (int)ssidHarvestStatus
{
  return self->_ssidHarvestStatus;
}

- (void)setSsidHarvestStatus:(int)a3
{
  self->_ssidHarvestStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apMode, 0);
  objc_storeStrong((id *)&self->_avgDLSpeed, 0);
  objc_storeStrong((id *)&self->_bssidOfNetworkForLastReceivedAssocIndication, 0);
  objc_storeStrong((id *)&self->_scanResults, 0);
  objc_storeStrong((id *)&self->_connectedSSID, 0);
  objc_storeStrong((id *)&self->_historicalScorecardAtAssoc, 0);
  objc_storeStrong((id *)&self->_connectedBSSID, 0);
  objc_storeStrong((id *)&self->_scorecardIdentifier, 0);
}

@end
