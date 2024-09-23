@implementation WiFiScanResultsPreparer

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6
{
  return -[WiFiScanResultsPreparer initWithManager:availabilityEngine:scanResults:disableProminentFiltering:blacklistedSSIDs:](self, "initWithManager:availabilityEngine:scanResults:disableProminentFiltering:blacklistedSSIDs:", a3, a4, a5, a6, 0);
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5
{
  return -[WiFiScanResultsPreparer initWithManager:availabilityEngine:scanResults:disableProminentFiltering:](self, "initWithManager:availabilityEngine:scanResults:disableProminentFiltering:", a3, a4, a5, 0);
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6 blacklistedSSIDs:(id)a7
{
  WiFiScanResultsPreparer *v12;
  WiFiScanResultsPreparer *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WiFiScanResultsPreparer;
  v12 = -[WiFiScanResultsPreparer init](&v15, "init");
  v13 = v12;
  if (!a3 || !v12)
  {
    if (!v12)
      return v13;
LABEL_7:
    CFRelease(v13);
    return 0;
  }
  v12->_manager = a3;
  CFRetain(a3);
  if (!a4)
    goto LABEL_7;
  v13->_engine = (WiFiAvailabilityEngine *)a4;
  v13->_disableProminentFiltering = a6;
  v13->_blacklistedSSIDs = (NSArray *)a7;
  -[WiFiScanResultsPreparer _prepareScanResults:](v13, "_prepareScanResults:", a5);
  return v13;
}

- (void)dealloc
{
  __WiFiDeviceManager *manager;
  objc_super v4;

  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)WiFiScanResultsPreparer;
  -[WiFiScanResultsPreparer dealloc](&v4, "dealloc");
}

- (void)_prepareScanResults:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  WiFiScanObserverNetwork *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  WiFiScanResultsPreparer *v33;
  id v34;
  uint64_t v35;
  WiFiScanObserverNetwork *v36;
  const void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v5 = objc_autoreleasePoolPush();
  v6 = (void *)os_transaction_create("com.apple.wifid.WiFiScanResultsPreparer");
  if (a3 && objc_msgSend(a3, "count"))
  {
    v29 = v6;
    v30 = v5;
    v7 = objc_msgSend(a3, "mutableCopy");
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Find recommendations for %lu networks (disableProminentFiltering: %d)", "-[WiFiScanResultsPreparer _prepareScanResults:]", objc_msgSend(v7, "count"), -[WiFiScanResultsPreparer disableProminentFiltering](self, "disableProminentFiltering"));
    objc_autoreleasePoolPop(v8);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v34)
    {
      v9 = *(_QWORD *)v43;
      v32 = v7;
      v33 = self;
      v31 = *(_QWORD *)v43;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v43 != v9)
            objc_enumerationMutation(v7);
          v35 = v10;
          v11 = *(const void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
          if (v11)
          {
            if (sub_1000FE338(-[WiFiScanResultsPreparer manager](self, "manager"), v11))
              sub_10002C478((uint64_t)v11, CFSTR("WiFiNetworkAttributeIsKnown"), kCFBooleanTrue);
            if (!sub_10001F440(v11))
            {
              v12 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]([WiFiScanObserverNetwork alloc], "initWithWiFiNetworkRef:", v11);
              if (v12)
              {
                v36 = v12;
                v13 = -[WiFiAvailabilityEngine findRecommendationForScannedNetwork:](-[WiFiScanResultsPreparer engine](self, "engine"), "findRecommendationForScannedNetwork:", v12);
                if (v13)
                {
                  v14 = v13;
                  v15 = objc_autoreleasePoolPush();
                  if (qword_10026DD20)
                    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: recommendation for %@ (network %@)", "-[WiFiScanResultsPreparer _prepareScanResults:]", objc_msgSend(v14, "scannedNetwork"), objc_msgSend(v14, "network"));
                  objc_autoreleasePoolPop(v15);
                  if (objc_msgSend(v14, "unwantedNetworkName"))
                  {
                    v16 = objc_autoreleasePoolPush();
                    if (qword_10026DD20)
                      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ contains unwantedNetworkName", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v36, "SSID"));
                    objc_autoreleasePoolPop(v16);
                  }
                  if (objc_msgSend(objc_msgSend(v14, "network"), "attributes"))
                  {
                    v40 = 0u;
                    v41 = 0u;
                    v38 = 0u;
                    v39 = 0u;
                    v17 = objc_msgSend(objc_msgSend(v14, "network"), "attributes");
                    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                    if (v18)
                    {
                      v19 = v18;
                      v20 = *(_QWORD *)v39;
                      v37 = v11;
LABEL_25:
                      v21 = 0;
                      while (2)
                      {
                        if (*(_QWORD *)v39 != v20)
                          objc_enumerationMutation(v17);
                        switch(objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v21), "intValue"))
                        {
                          case 1u:
                            v22 = (uint64_t)v11;
                            v23 = CFSTR("WiFiNetworkAttributeIsPotentiallyCaptive");
                            goto LABEL_39;
                          case 2u:
                            v22 = (uint64_t)v11;
                            v23 = CFSTR("WiFiNetworkAttributeIsSuspicious");
                            goto LABEL_39;
                          case 4u:
                            v22 = (uint64_t)v11;
                            v23 = CFSTR("WiFiNetworkAttributeIsTCPGood");
                            goto LABEL_39;
                          case 5u:
                            v22 = (uint64_t)v11;
                            v23 = CFSTR("WiFiNetworkAttributeIsPotentiallyMoving");
                            goto LABEL_39;
                          case 6u:
                            if ((objc_msgSend(v14, "unwantedNetworkName") & 1) != 0)
                            {
                              v24 = objc_autoreleasePoolPush();
                              if (qword_10026DD20)
                                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ contains unwantedNetworkName, discarding public flag", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v36, "SSID"));
                              objc_autoreleasePoolPop(v24);
                              v11 = v37;
                            }
                            else
                            {
                              v22 = (uint64_t)v11;
                              v23 = CFSTR("WiFiNetworkAttributeIsPublic");
LABEL_39:
                              sub_10002C478(v22, v23, kCFBooleanTrue);
                            }
LABEL_40:
                            if (v19 != (id)++v21)
                              continue;
                            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                            if (!v19)
                              goto LABEL_42;
                            goto LABEL_25;
                          case 7u:
                            v22 = (uint64_t)v11;
                            v23 = CFSTR("WiFiNetworkAttributeIsLowQuality");
                            goto LABEL_39;
                          default:
                            goto LABEL_40;
                        }
                      }
                    }
                  }
LABEL_42:
                  self = v33;
                  if (objc_msgSend(objc_msgSend(v14, "network"), "type") == (id)1
                    || objc_msgSend(objc_msgSend(v14, "network"), "type") == (id)2
                    || objc_msgSend(objc_msgSend(v14, "network"), "type") == (id)3)
                  {
                    v25 = objc_autoreleasePoolPush();
                    if (qword_10026DD20)
                      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ contains a network type (%lu) that is not recommendable", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v36, "SSID"), objc_msgSend(objc_msgSend(v14, "network"), "type"));
                    objc_autoreleasePoolPop(v25);
                    sub_10002C478((uint64_t)v11, CFSTR("WiFiNetworkAttributeIsNotRecommendable"), kCFBooleanTrue);
                  }
                  v26 = objc_msgSend(objc_msgSend(v14, "network"), "popularityScore");
                  if (v26)
                  {
                    v27 = v26;
                    sub_10002B698((uint64_t)v11, CFSTR("WiFiNetworkAttributePopularityScore"), (uint64_t)objc_msgSend(v26, "score"));
                    if ((unint64_t)objc_msgSend(v27, "score") <= 0x3E7)
                      v28 = CFSTR("WiFiNetworkAttributeLowPopularity");
                    else
                      v28 = CFSTR("WiFiNetworkAttributeHighPopularity");
                    sub_10002C478((uint64_t)v11, v28, kCFBooleanTrue);
                  }
                  sub_10002B698((uint64_t)v11, CFSTR("WiFiNetworkAttributeSource"), (uint64_t)objc_msgSend(objc_msgSend(v14, "network"), "source"));
                  v9 = v31;
                  v7 = v32;
LABEL_54:
                  if (-[WiFiScanResultsPreparer disableProminentFiltering](self, "disableProminentFiltering")
                    || +[WiFiScanResultsPreparer wifiNetworkShouldBeProminentlyDisplayed:](WiFiScanResultsPreparer, "wifiNetworkShouldBeProminentlyDisplayed:", v11))
                  {
                    sub_10002C478((uint64_t)v11, CFSTR("WiFiNetworkAttributeProminentDisplay"), kCFBooleanTrue);
                    -[WiFiScanResultsPreparer setProminentScanResultsCount:](self, "setProminentScanResultsCount:", (char *)-[WiFiScanResultsPreparer prominentScanResultsCount](self, "prominentScanResultsCount")+ 1);
                  }
                }
                else if (!sub_10001F440(v11))
                {
                  goto LABEL_54;
                }

              }
            }
          }
          v10 = v35 + 1;
        }
        while ((id)(v35 + 1) != v34);
        v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v34);
    }
    -[WiFiScanResultsPreparer setPreparedScanResults:](self, "setPreparedScanResults:", v7);
    v6 = v29;
    v5 = v30;
  }
  else
  {
    v7 = 0;
  }

  if (v6)
  objc_autoreleasePoolPop(v5);
}

+ (BOOL)wifiNetworkShouldBeProminentlyDisplayed:(__WiFiNetwork *)a3
{
  const void *v4;

  if (sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeIsKnown"))
    || sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeIsPublic")))
  {
    goto LABEL_9;
  }
  if (sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeLowPopularity"))
    || sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeIsSuspicious")))
  {
    goto LABEL_12;
  }
  if (sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeHighQuality")))
  {
LABEL_9:
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  if (sub_1000CB93C((uint64_t)a3) == 1)
  {
LABEL_12:
    LOBYTE(v4) = 0;
    return (char)v4;
  }
  LODWORD(v4) = sub_1000C5C14((uint64_t)a3);
  if ((_DWORD)v4)
  {
    if ((v4 & 1) == 0)
      goto LABEL_9;
    v4 = sub_10002BE64((uint64_t)a3, CFSTR("WiFiNetworkAttributeLowPopularity"));
    if (v4)
      goto LABEL_9;
  }
  return (char)v4;
}

- (id)topRecommendableNetwork
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const void *v11;
  const void *v12;
  void *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  id v17;
  void *v18;
  WiFiScanObserverNetwork *v19;
  WiFiScanObserverNetwork *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v32;
  const void *v33;
  const __CFNumber *v34;
  const __CFNumber *v35;
  WiFiScanResultsPreparer *v36;
  const __CFNumber *v37;
  const void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  if (!-[WiFiScanResultsPreparer prominentScanResultsCount](self, "prominentScanResultsCount"))
    return 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = -[WiFiScanResultsPreparer preparedScanResults](self, "preparedScanResults");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (!v4)
    goto LABEL_58;
  v5 = v4;
  v36 = self;
  v37 = 0;
  v38 = 0;
  v6 = *(_QWORD *)v44;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v44 != v6)
        objc_enumerationMutation(v3);
      v8 = *(const void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v7);
      if (v8)
      {
        if (!sub_1000C5C14(*(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v7))
          && (int)sub_100017A54((uint64_t)v8, CFSTR("RSSI")) >= -75
          && !sub_1000CAA40((uint64_t)v8))
        {
          if (sub_10002BE64((uint64_t)v8, CFSTR("WiFiNetworkAttributeProminentDisplay")))
          {
            if (!sub_10002BE64((uint64_t)v8, CFSTR("WiFiNetworkAttributeIsKnown"))
              && !sub_10002BE64((uint64_t)v8, CFSTR("WiFiNetworkAttributeIsNotRecommendable")))
            {
              v9 = sub_100017A54((uint64_t)v8, CFSTR("WiFiNetworkAttributeSource"));
              if (v9)
              {
                v10 = v9;
                v11 = sub_10002B088(v8);
                if (v11
                  && (v12 = v11,
                      -[NSArray containsObject:](-[WiFiScanResultsPreparer blacklistedSSIDs](v36, "blacklistedSSIDs"), "containsObject:", v11)))
                {
                  v13 = objc_autoreleasePoolPush();
                  if (qword_10026DD20)
                    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: skipping %@ as it's blacklisted from recommendation", "-[WiFiScanResultsPreparer topRecommendableNetwork]", v12);
                  objc_autoreleasePoolPop(v13);
                }
                else if (v10 == (const __CFNumber *)1)
                {
                  if (!v38)
                    goto LABEL_37;
                  if (sub_100017A54((uint64_t)v8, CFSTR("WiFiNetworkAttributeSource")) != (const __CFNumber *)1)
                    goto LABEL_37;
                  v14 = sub_100017A54((uint64_t)v38, CFSTR("RSSI"));
                  if ((uint64_t)v14 <= (uint64_t)sub_100017A54((uint64_t)v8, CFSTR("RSSI")))
                    goto LABEL_37;
                }
                else
                {
                  v15 = sub_100017A54((uint64_t)v8, CFSTR("WiFiNetworkAttributePopularityScore"));
                  if ((uint64_t)v15 >= (uint64_t)v37)
                  {
                    if ((v16 = v15, !v38)
                      || !v37
                      || v15 != v37
                      || (sub_1000C5C14((uint64_t)v38)
                       || sub_1000C5C14((uint64_t)v8)
                       || (v35 = sub_100017A54((uint64_t)v38, CFSTR("RSSI")),
                           (uint64_t)v35 <= (uint64_t)sub_100017A54((uint64_t)v8, CFSTR("RSSI"))))
                      && (sub_1000C5C14((uint64_t)v38) || !sub_1000C5C14((uint64_t)v8)))
                    {
                      v37 = v16;
LABEL_37:
                      v38 = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }
      v7 = (char *)v7 + 1;
    }
    while (v5 != v7);
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    v5 = v17;
  }
  while (v17);
  if (!v38)
  {
LABEL_58:
    v27 = objc_autoreleasePoolPush();
    v28 = (void *)qword_10026DD20;
    if (!qword_10026DD20)
    {
LABEL_61:
      objc_autoreleasePoolPop(v27);
      return 0;
    }
    v29 = "%s: no prominent network found";
LABEL_60:
    objc_msgSend(v28, "WFLog:message:", 3, v29, "-[WiFiScanResultsPreparer topRecommendableNetwork]", v33, v34);
    goto LABEL_61;
  }
  if (sub_100017A54((uint64_t)v38, CFSTR("WiFiNetworkAttributeSource")) != (const __CFNumber *)2)
    goto LABEL_45;
  if (sub_1000C5C14((uint64_t)v38))
  {
    v27 = objc_autoreleasePoolPush();
    v32 = qword_10026DD20;
    if (!qword_10026DD20)
      goto LABEL_61;
    v33 = sub_10002B088(v38);
    v34 = v37;
    v29 = "%s: prominent network (%@) is not open (score %ld)";
    goto LABEL_79;
  }
  if (!v37)
  {
    v27 = objc_autoreleasePoolPush();
    v32 = qword_10026DD20;
    if (!qword_10026DD20)
      goto LABEL_61;
    v33 = sub_10002B088(v38);
    v34 = 0;
    v29 = "%s: prominent network (%@) has no popularity score (score %ld)";
LABEL_79:
    v28 = (void *)v32;
    goto LABEL_60;
  }
LABEL_45:
  v18 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: found prominent open network (%@) with highest popularity score %ld", "-[WiFiScanResultsPreparer topRecommendableNetwork]", sub_10002B088(v38), v37);
  objc_autoreleasePoolPop(v18);
  v19 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]([WiFiScanObserverNetwork alloc], "initWithWiFiNetworkRef:", v38);
  if (!v19)
    return 0;
  v20 = v19;
  v21 = -[WiFiAvailabilityEngine findRecommendationsForScannedNetwork:](-[WiFiScanResultsPreparer engine](v36, "engine"), "findRecommendationsForScannedNetwork:", v19);
  if ((unint64_t)objc_msgSend(v21, "count") < 2)
  {
    v26 = objc_msgSend(v21, "anyObject");
    if (v26)
      goto LABEL_66;
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (!v22)
    {
LABEL_70:
      v30 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: found matches (%lu) in availability engine but SSIDs didn't match with %@", "-[WiFiScanResultsPreparer topRecommendableNetwork]", objc_msgSend(v21, "count"), -[WiFiScanObserverNetwork SSID](v20, "SSID"));
      goto LABEL_72;
    }
    v23 = v22;
    v24 = *(_QWORD *)v40;
LABEL_51:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v24)
        objc_enumerationMutation(v21);
      v26 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v25);
      if ((objc_msgSend(objc_msgSend(v26, "SSID"), "isEqualToString:", -[WiFiScanObserverNetwork SSID](v20, "SSID")) & 1) != 0)break;
      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v23)
          goto LABEL_51;
        goto LABEL_70;
      }
    }
    if (!v26)
      goto LABEL_70;
LABEL_66:
    if (objc_msgSend(objc_msgSend(v26, "network"), "source") == (id)2
      && objc_msgSend(v26, "unwantedNetworkName"))
    {
      v30 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: recommendation (%@) found but network name (%@) is considered unwanted", "-[WiFiScanResultsPreparer topRecommendableNetwork]", v26, objc_msgSend(v26, "SSID"));
LABEL_72:
      objc_autoreleasePoolPop(v30);
      v26 = 0;
    }
  }

  return v26;
}

- (__WiFiDeviceManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiDeviceManager *)a3
{
  self->_manager = a3;
}

- (NSArray)preparedScanResults
{
  return self->_preparedScanResults;
}

- (void)setPreparedScanResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)prominentScanResultsCount
{
  return self->_prominentScanResultsCount;
}

- (void)setProminentScanResultsCount:(unint64_t)a3
{
  self->_prominentScanResultsCount = a3;
}

- (NSArray)blacklistedSSIDs
{
  return self->_blacklistedSSIDs;
}

- (void)setBlacklistedSSIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (WiFiAvailabilityEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)disableProminentFiltering
{
  return self->_disableProminentFiltering;
}

- (void)setDisableProminentFiltering:(BOOL)a3
{
  self->_disableProminentFiltering = a3;
}

@end
