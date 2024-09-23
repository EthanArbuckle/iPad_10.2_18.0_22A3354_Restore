@implementation WiFiTimeDeferredNetworksAJManager

- (void)setScanResultsWithAutoJoinSessionCompletion:(id)a3 complete:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSMutableArray *networks;
  id v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a4;
  v7 = objc_autoreleasePoolPush();
  if (!a3)
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: scanResults NULL", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]");
    goto LABEL_15;
  }
  if (!objc_msgSend(a3, "count"))
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: no scan results", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]");
LABEL_15:
    objc_autoreleasePoolPop(v12);
    goto LABEL_10;
  }
  -[NSMutableArray addObjectsFromArray:](self->_cumulativeAutoJoinScanResults, "addObjectsFromArray:", a3);
  if (v4)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = sub_10002FAF8;
    v24 = sub_10002F9DC;
    v25 = (id)0xAAAAAAAAAAAAAAAALL;
    v25 = objc_alloc_init((Class)NSMutableString);
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = sub_10002FAF8;
    v18 = sub_10002F9DC;
    v19 = (id)0xAAAAAAAAAAAAAAAALL;
    v19 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
    networks = self->_networks;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001653C0;
    v13[3] = &unk_1002330A0;
    v13[4] = self;
    v13[5] = &v14;
    v13[6] = &v20;
    -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v13);
    v9 = objc_msgSend((id)v15[5], "count");
    v10 = v21;
    if (v9 && v21[5])
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Removing networks not found in cumulative AJ scan from time-deferred list: %@", "-[WiFiTimeDeferredNetworksAJManager setScanResultsWithAutoJoinSessionCompletion:complete:]", v21[5]);
      objc_autoreleasePoolPop(v11);
      -[NSMutableArray removeObjectsAtIndexes:](self->_networks, "removeObjectsAtIndexes:", v15[5]);
      -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
      v10 = v21;
    }

    -[NSMutableArray removeAllObjects](self->_cumulativeAutoJoinScanResults, "removeAllObjects");
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
LABEL_10:
  objc_autoreleasePoolPop(v7);
}

- (WiFiTimeDeferredNetworksAJManager)initWithArgs:(__WiFiDeviceManager *)a3
{
  void *v5;
  WiFiTimeDeferredNetworksAJManager *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v5 = objc_autoreleasePoolPush();
  v10.receiver = self;
  v10.super_class = (Class)WiFiTimeDeferredNetworksAJManager;
  v6 = -[WiFiTimeDeferredNetworksAJManager init](&v10, "init");
  if (!v6)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: self", "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]");
    goto LABEL_11;
  }
  if (!a3)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: delegate", "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]");
LABEL_11:
    objc_autoreleasePoolPop(v9);

    v6 = 0;
    goto LABEL_6;
  }
  v6->_networks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v6->_cumulativeAutoJoinScanResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v6->_deviceManager = a3;
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: initialized WiFiTimeDeferredNetworksAJManager", "-[WiFiTimeDeferredNetworksAJManager initWithArgs:]");
  objc_autoreleasePoolPop(v7);
LABEL_6:
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (void)dealloc
{
  void *v3;
  __WiFiNetwork *currentNetwork;
  objc_super v5;

  v3 = objc_autoreleasePoolPush();
  -[NSMutableArray removeAllObjects](self->_networks, "removeAllObjects");

  -[NSMutableArray removeAllObjects](self->_cumulativeAutoJoinScanResults, "removeAllObjects");
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiTimeDeferredNetworksAJManager;
  -[WiFiTimeDeferredNetworksAJManager dealloc](&v5, "dealloc");
  objc_autoreleasePoolPop(v3);
}

- (BOOL)canDeferNetwork:(__WiFiNetwork *)a3 withUsageRank:(unint64_t)a4 andMotionState:(int)a5
{
  void *v9;
  double v10;
  const __CFArray *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSMutableArray *networks;
  unsigned int v16;
  void *v17;
  void *v18;
  const void *v19;
  double v20;
  char v21;
  unint64_t v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v27[9];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v9 = objc_autoreleasePoolPush();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (!self->_deviceManager)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: manager object is NULL", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
    goto LABEL_53;
  }
  if (!a3)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: network object is NULL", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
    goto LABEL_53;
  }
  if (!-[WiFiTimeDeferredNetworksAJManager usageRankForDeferral](self, "usageRankForDeferral"))
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: usageRankForDeferral is not correctly initialized", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
    goto LABEL_53;
  }
  -[WiFiTimeDeferredNetworksAJManager deferIntervalSecs](self, "deferIntervalSecs");
  if (v10 == 0.0)
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: deferIntervalSecs is not correctly initialized", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
    goto LABEL_53;
  }
  if (!-[WiFiTimeDeferredNetworksAJManager numDaysSinceAssocOverrideDeferral](self, "numDaysSinceAssocOverrideDeferral"))
  {
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: numDaysSinceAssocOverrideDeferral is not correctly initialized", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]");
LABEL_53:
    objc_autoreleasePoolPop(v26);
    goto LABEL_31;
  }
  v11 = sub_100103568((uint64_t)self->_deviceManager, a3);
  if (v11)
  {
    if (sub_1000CB8DC((CFDictionaryRef *)a3))
      v12 = 1;
    else
      v12 = objc_msgSend(+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager"), "isMovingNetwork:", a3);
    if (sub_1000CB87C((CFDictionaryRef *)a3))
      v13 = 1;
    else
      v13 = objc_msgSend(+[WiFiAnalyticsManager sharedWiFiAnalyticsManager](WiFiAnalyticsManager, "sharedWiFiAnalyticsManager"), "isOmnipresentNetwork:", a3);
    v14 = sub_100104C60((uint64_t)self->_deviceManager, a3);
    if (!(_DWORD)v14)
      goto LABEL_20;
    if (sub_1000CBE60((uint64_t)v11) == 1
      || sub_1000C3F88((uint64_t)v11) == 1
      || (v13 & 1) == 0
      && (-[WiFiTimeDeferredNetworksAJManager usageRankForDeferral](self, "usageRankForDeferral") > a4
       || (v12 & 1) == 0 && (a5 > 6 || ((1 << a5) & 0x58) == 0)))
    {
LABEL_30:
      CFRelease(v11);
      goto LABEL_31;
    }
    if (sub_1000C475C((uint64_t)a3)
      || sub_1000137D8((uint64_t)a3)
      || sub_10002DA5C((_BOOL8)a3)
      || (v23 = sub_10002E000(v11)) == 0
      || (-[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", v23),
          -[WiFiTimeDeferredNetworksAJManager numDaysSinceAssocOverrideDeferral](self, "numDaysSinceAssocOverrideDeferral") < (unint64_t)(v24 / 86400.0)))
    {
LABEL_20:
      *((_BYTE *)v37 + 24) = 1;
    }
    else
    {
      v25 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: not deferring %@ because it was recently joined", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", sub_10002B088(v11));
      objc_autoreleasePoolPop(v25);
      if (!*((_BYTE *)v37 + 24))
        goto LABEL_30;
    }
    v32 = 0;
    v33 = (double *)&v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    networks = self->_networks;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100165114;
    v27[3] = &unk_100233078;
    v27[7] = &v28;
    v27[8] = a3;
    v27[4] = self;
    v27[5] = &v32;
    v27[6] = &v36;
    -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v27);
    if (*((_BYTE *)v37 + 24))
    {
      v16 = -[WiFiTimeDeferredNetworksAJManager deferNetwork:](self, "deferNetwork:", a3);
      *((_BYTE *)v37 + 24) = v16;
      if (v16 && v33[3] != 0.0)
      {
        v17 = objc_autoreleasePoolPush();
        v18 = (void *)qword_10026DD20;
        if (qword_10026DD20)
        {
          v19 = sub_10002B088(a3);
          -[WiFiTimeDeferredNetworksAJManager deferIntervalSecs](self, "deferIntervalSecs");
          objc_msgSend(v18, "WFLog:message:", 4, "%s: time-deferring %@ (isMoving:%d isOmnipresent:%d usageRank:%lu isSuitableAfterTd:%d) from auto join for another %2.1f seconds", "-[WiFiTimeDeferredNetworksAJManager canDeferNetwork:withUsageRank:andMotionState:]", v19, v12, v13, a4, v14, v20 - v33[3]);
        }
        objc_autoreleasePoolPop(v17);
      }
    }
    else if (v29[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
      -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    goto LABEL_30;
  }
LABEL_31:
  v21 = *((_BYTE *)v37 + 24);
  _Block_object_dispose(&v36, 8);
  objc_autoreleasePoolPop(v9);
  return v21;
}

- (BOOL)deferNetwork:(__WiFiNetwork *)a3
{
  void *v5;
  NSMutableArray *networks;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned int v13;
  DeferredNetwork *v14;
  DeferredNetwork *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_autoreleasePoolPush();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  networks = self->_networks;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networks, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
    goto LABEL_12;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(networks);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v12, "doesContain:", a3))
      {
        objc_msgSend(v12, "setDeferredNetwork:", a3);
        v9 = 1;
      }
    }
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](networks, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v8);
  if ((v9 & 1) != 0)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
LABEL_12:
    v14 = objc_alloc_init(DeferredNetwork);
    if (v14)
    {
      v15 = v14;
      v13 = -[DeferredNetwork setDeferredNetwork:](v14, "setDeferredNetwork:", a3);
      if (v13)
        -[NSMutableArray addObject:](self->_networks, "addObject:", v15);

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  objc_autoreleasePoolPop(v5);
  return v13;
}

- (void)clearScanResultsForAutoJoinSessionReset
{
  -[NSMutableArray removeAllObjects](self->_cumulativeAutoJoinScanResults, "removeAllObjects");
}

- (void)setLinkUpForNetwork:(__WiFiNetwork *)a3
{
  void *v5;
  NSMutableArray *networks;
  __WiFiNetwork *currentNetwork;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_autoreleasePoolPush();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100165680;
  v8[3] = &unk_100230A30;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v8);
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  self->_currentNetwork = (__WiFiNetwork *)sub_10002B2DC((uint64_t)kCFAllocatorDefault, (uint64_t)a3);
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v5);
}

- (void)setLinkDown
{
  void *v3;
  NSMutableArray *networks;
  __WiFiNetwork *currentNetwork;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_autoreleasePoolPush();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  networks = self->_networks;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001657C4;
  v6[3] = &unk_100230A58;
  v6[4] = self;
  v6[5] = &v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v6);
  if (v8[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_networks, "removeObjectAtIndex:");
    -[WiFiTimeDeferredNetworksAJManager printDeferredNetworks](self, "printDeferredNetworks");
  }
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    CFRelease(currentNetwork);
    self->_currentNetwork = 0;
  }
  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isTimeDeferredNetworksPresent
{
  return -[NSMutableArray count](self->_networks, "count") != 0;
}

- (void)printDeferredNetworks
{
  void *v3;
  NSMutableArray *networks;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;

  v3 = objc_autoreleasePoolPush();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = (id)0xAAAAAAAAAAAAAAAALL;
  v17 = -[NSMutableArray count](self->_networks, "count");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_10002FAF8;
  v12 = sub_10002F9DC;
  v13 = (id)0xAAAAAAAAAAAAAAAALL;
  v13 = objc_alloc_init((Class)NSMutableString);
  if (v15[3])
  {
    if (v9[5])
    {
      networks = self->_networks;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100165A10;
      v7[3] = &unk_1002330C8;
      v7[4] = &v8;
      v7[5] = &v14;
      -[NSMutableArray enumerateObjectsUsingBlock:](networks, "enumerateObjectsUsingBlock:", v7);
      v5 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: time-deferred networks list: %@", "-[WiFiTimeDeferredNetworksAJManager printDeferredNetworks]", v9[5]);
    }
    else
    {
      v5 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: logString alloc failed", "-[WiFiTimeDeferredNetworksAJManager printDeferredNetworks]");
    }
    objc_autoreleasePoolPop(v5);
  }
  v6 = (void *)v9[5];
  if (v6)

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);
  objc_autoreleasePoolPop(v3);
}

- (unint64_t)usageRankForDeferral
{
  return self->_usageRankForDeferral;
}

- (void)setUsageRankForDeferral:(unint64_t)a3
{
  self->_usageRankForDeferral = a3;
}

- (double)deferIntervalSecs
{
  return self->_deferIntervalSecs;
}

- (void)setDeferIntervalSecs:(double)a3
{
  self->_deferIntervalSecs = a3;
}

- (unint64_t)numDaysSinceAssocOverrideDeferral
{
  return self->_numDaysSinceAssocOverrideDeferral;
}

- (void)setNumDaysSinceAssocOverrideDeferral:(unint64_t)a3
{
  self->_numDaysSinceAssocOverrideDeferral = a3;
}

@end
