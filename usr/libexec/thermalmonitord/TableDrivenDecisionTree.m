@implementation TableDrivenDecisionTree

- (void)actionComponentControl
{
  uint64_t v3;
  unsigned __int8 *maxLoadIndexForComponent;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  _BYTE v45[17];

  if (byte_1000A2E29)
  {
    if (byte_1000A1D88)
      v11 = 0;
    else
      v11 = 10;
    byte_1000A1D88 = BYTE5(qword_1000A2E18) - self->releaseMaxLoadIndexForComponent[5] > v11;
  }
  v3 = 0;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  do
  {
    v5 = -[TableDrivenDecisionTree findCC:](self, "findCC:", -[TableDrivenDecisionTree getMTypeFromComponent:](self, "getMTypeFromComponent:", v3));
    if (v5)
    {
      v6 = v5;
      if (v3 == 3 && objc_msgSend(v5, "shouldSuppressMitigations"))
      {
        v7 = v6;
        v8 = 100;
        v9 = 100;
      }
      else
      {
        if (!byte_1000A2E29 || (byte_1000A1D88 & 1) != 0)
        {
          objc_msgSend(v6, "setMaxLoadingIndex:releaseIndex:", maxLoadIndexForComponent[v3], maxLoadIndexForComponent[v3 + 17]);
          v45[v3] = objc_msgSend(v6, "getReleaseMaxLI");
          goto LABEL_13;
        }
        v8 = *((unsigned __int8 *)&qword_1000A2E18 + v3);
        v7 = v6;
        v9 = v8;
      }
      objc_msgSend(v7, "setMaxLoadingIndex:releaseIndex:", v8, v9);
    }
    else
    {
      v45[v3] = 101;
    }
LABEL_13:
    ++v3;
  }
  while (v3 != 17);
  if (byte_1000A2480)
  {
    v10 = qword_1000A28A0;
    if (os_log_type_enabled((os_log_t)qword_1000A28A0, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67113216;
      v12[1] = v45[3];
      v13 = 1024;
      v14 = v45[4];
      v15 = 1024;
      v16 = v45[0];
      v17 = 1024;
      v18 = v45[1];
      v19 = 1024;
      v20 = v45[2];
      v21 = 1024;
      v22 = v45[5];
      v23 = 1024;
      v24 = v45[6];
      v25 = 1024;
      v26 = v45[7];
      v27 = 1024;
      v28 = v45[8];
      v29 = 1024;
      v30 = v45[9];
      v31 = 1024;
      v32 = v45[10];
      v33 = 1024;
      v34 = v45[11];
      v35 = 1024;
      v36 = v45[12];
      v37 = 1024;
      v38 = v45[13];
      v39 = 1024;
      v40 = v45[15];
      v41 = 1024;
      v42 = v45[14];
      v43 = 1024;
      v44 = v45[16];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> ReleaseMaxLI DT: BL %d Charge %d CPU %d SOC %d Radio %d ThermalLevel %d RefreshRate %d Fan %d WiFi %d AudioAmp %d Arc %d Speaker %d Package %d RadioModemBand %d RadioFR2RFCG %d RadioFR2RFBC %d RadioFR2RFBand %d", (uint8_t *)v12, 0x68u);
    }
  }
}

- (id)findCC:(int)a3
{
  uint64_t v3;
  NSArray *componentControllers;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  componentControllers = self->_componentControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](componentControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(componentControllers);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "isEqualMType:", v3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](componentControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (int)getMTypeFromComponent:(int)a3
{
  if (a3 > 0x10)
    return -1;
  else
    return dword_100061598[a3];
}

- (void)evaluateDecisionTree
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  id v8;
  signed int v9;
  signed int v10;
  unsigned __int8 *releaseMaxLoadIndexForComponent;
  unsigned __int8 *maxLoadIndexForComponent;

  v3 = 0;
  releaseMaxLoadIndexForComponent = self->releaseMaxLoadIndexForComponent;
  maxLoadIndexForComponent = self->maxLoadIndexForComponent;
  v4 = -[NSArray count](self->_hotspotControllers, "count");
  do
  {
    if (v4 < 1)
    {
      LOBYTE(v7) = 101;
      LOBYTE(v6) = 101;
    }
    else
    {
      v5 = 0;
      v6 = 101;
      v7 = 101;
      do
      {
        v8 = -[NSArray objectAtIndex:](self->_hotspotControllers, "objectAtIndex:", v5, releaseMaxLoadIndexForComponent, maxLoadIndexForComponent);
        v9 = objc_msgSend(v8, "maxLIForComponent:", v3);
        v10 = objc_msgSend(v8, "releaseMaxLIForComponent:releaseRate:", v3, self->releaseRateForComponent[v3]);
        if (v7 >= v9)
          v7 = v9;
        if (v6 >= v10)
          v6 = v10;
        ++v5;
      }
      while (v4 != v5);
    }
    maxLoadIndexForComponent[v3] = v7;
    releaseMaxLoadIndexForComponent[v3++] = v6;
  }
  while (v3 != 17);
  -[TableDrivenDecisionTree actionComponentControl](self, "actionComponentControl");
}

- (TableDrivenDecisionTree)initWithComponentControllers:(id)a3 hotspotControllers:(id)a4 decisionTreeTable:(id)a5
{
  char *v8;
  TableDrivenDecisionTree *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TableDrivenDecisionTree;
  v8 = -[TableDrivenDecisionTree init](&v11, "init");
  v9 = (TableDrivenDecisionTree *)v8;
  if (v8)
  {
    *((_QWORD *)v8 + 1) = a3;
    *((_QWORD *)v8 + 2) = a4;
    *((_QWORD *)v8 + 3) = 0;
    *((_QWORD *)v8 + 4) = 0;
    v8[40] = 0;
    *(_QWORD *)(v8 + 49) = 0;
    *(_QWORD *)(v8 + 41) = 0;
    v8[57] = 0;
    objc_msgSend(v8, "initDecisionTable:", a5);
  }
  return v9;
}

- (int)getReleaseRateForComponent:(int)a3
{
  return objc_msgSend(-[TableDrivenDecisionTree findCC:](self, "findCC:", -[TableDrivenDecisionTree getMTypeFromComponent:](self, "getMTypeFromComponent:", *(_QWORD *)&a3)), "getReleaseRate");
}

- (void)readReleaseRateForAllComponents
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026060;
  block[3] = &unk_10007D248;
  block[4] = self;
  if (qword_1000A1D90 != -1)
    dispatch_once(&qword_1000A1D90, block);
}

- (void)initDecisionTable:(__CFDictionary *)a3
{
  uint64_t v5;
  CFIndex v6;
  CFStringRef v7;
  CFStringRef v8;
  const void *Value;

  if (a3 && CFDictionaryGetCount(a3) >= 1)
  {
    v5 = 0;
    do
    {
      v6 = v5 + 1;
      v7 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("HotSpotDecisionTableNormal%d"), v5 + 1);
      if (v7)
      {
        v8 = v7;
        Value = CFDictionaryGetValue(a3, v7);
        if (Value)
        {
          objc_msgSend(-[NSArray objectAtIndex:](self->_hotspotControllers, "objectAtIndex:", v5), "setDecisionTableSection:", Value);
          -[TableDrivenDecisionTree readReleaseRateForAllComponents](self, "readReleaseRateForAllComponents");
        }
        CFRelease(v8);
      }
      ++v5;
    }
    while (CFDictionaryGetCount(a3) > v6);
  }
}

@end
