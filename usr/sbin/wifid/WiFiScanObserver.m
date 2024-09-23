@implementation WiFiScanObserver

- (void)ingestScanResults:(id)a3 ofType:(unint64_t)a4 clientName:(id)a5 directed:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  WiFiScanObserverNetwork *v19;
  WiFiScanObserverNetwork *v20;
  id v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v6 = a6;
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)os_transaction_create("com.apple.wifid.WiFiScanObserver");
  if (a3 && -[NSMutableArray count](-[WiFiScanObserver callbacks](self, "callbacks"), "count"))
  {
    v28 = v6;
    v29 = v12;
    v30 = v11;
    v13 = objc_alloc_init((Class)NSMutableSet);
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ingested %lu networks", "-[WiFiScanObserver ingestScanResults:ofType:clientName:directed:]", objc_msgSend(a3, "count"));
    objc_autoreleasePoolPop(v14);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(a3);
          v19 = -[WiFiScanObserverNetwork initWithWiFiNetworkRef:]([WiFiScanObserverNetwork alloc], "initWithWiFiNetworkRef:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i));
          if (v19)
          {
            v20 = v19;
            objc_msgSend(v13, "addObject:", v19);
            CFRelease(v20);
          }
        }
        v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v16);
    }
    if (!v13)
    {
      v27 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no networks to provide", "-[WiFiScanObserver ingestScanResults:ofType:clientName:directed:]");
      objc_autoreleasePoolPop(v27);
      v11 = v30;
      if (v12)
        goto LABEL_30;
      goto LABEL_31;
    }
    v21 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4), CFSTR("resultType"));
    if (a5)
      objc_msgSend(v21, "setObject:forKey:", a5, CFSTR("clientName"));
    if (v28)
      objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("directed"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = -[WiFiScanObserver callbacks](self, "callbacks");
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j) + 16))();
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }
    if (v21)
      CFRelease(v21);
    CFRelease(v13);
    v12 = v29;
    v11 = v30;
  }
  if (v12)
LABEL_30:

LABEL_31:
  objc_autoreleasePoolPop(v11);
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (WiFiScanObserver)init
{
  WiFiScanObserver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WiFiScanObserver;
  v2 = -[WiFiScanObserver init](&v4, "init");
  if (v2)
    v2->_callbacks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v2;
}

- (void)addScanResultsCallback:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](-[WiFiScanObserver callbacks](self, "callbacks"), "addObject:", _Block_copy(a3));
}

- (void)removeScanResultsCallback:(id)a3
{
  if (a3)
    -[NSMutableArray removeObject:](-[WiFiScanObserver callbacks](self, "callbacks"), "removeObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiScanObserver;
  -[WiFiScanObserver dealloc](&v3, "dealloc");
}

- (id)scanResultsCallback
{
  return self->scanResultsCallback;
}

- (void)setScanResultsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCallbacks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
