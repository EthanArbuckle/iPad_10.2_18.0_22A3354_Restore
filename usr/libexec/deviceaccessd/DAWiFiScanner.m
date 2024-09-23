@implementation DAWiFiScanner

- (DAWiFiScanner)init
{
  DAWiFiScanner *v2;
  CWFInterface *v3;
  CWFInterface *wifiInterface;
  uint64_t v5;
  NSMutableSet *reportedNetworks;
  DAWiFiScanner *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DAWiFiScanner;
  v2 = -[DAWiFiScanner init](&v9, "init");
  if (v2)
  {
    v3 = (CWFInterface *)objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 2);
    wifiInterface = v2->_wifiInterface;
    v2->_wifiInterface = v3;

    -[CWFInterface activate](v2->_wifiInterface, "activate");
    v2->_scanning = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    reportedNetworks = v2->_reportedNetworks;
    v2->_reportedNetworks = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startScanningWithDescriptors:(id)a3
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *SSIDs;
  NSMutableSet *v8;
  NSMutableSet *prefixes;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableSet *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableSet *v26;
  void *v27;
  void (**resultsHandler)(id, void *, _QWORD);
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v5 = a3;
  if (self->_scanning)
  {
    if (dword_10003F670 <= 30
      && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
    {
      LogPrintF(&dword_10003F670, "-[DAWiFiScanner startScanningWithDescriptors:]", 30, "[WiFi] scanning already in progress for descriptors = '%@'", self->_descriptors);
    }
  }
  else
  {
    self->_scanning = 1;
    objc_storeStrong((id *)&self->_descriptors, a3);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    SSIDs = self->_SSIDs;
    self->_SSIDs = v6;

    v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    prefixes = self->_prefixes;
    self->_prefixes = v8;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = self->_descriptors;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "SSID"));
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "SSID"));
            v19 = objc_msgSend(v18, "length");

            if (v19)
            {
              v20 = self->_SSIDs;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "SSID"));
              -[NSMutableSet addObject:](v20, "addObject:", v21);

            }
          }
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prefix"));
          if (v22)
          {
            v23 = (void *)v22;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prefix"));
            v25 = objc_msgSend(v24, "length");

            if (v25)
            {
              v26 = self->_prefixes;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "prefix"));
              -[NSMutableSet addObject:](v26, "addObject:", v27);

            }
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }

    if (-[NSMutableSet count](self->_SSIDs, "count") || -[NSMutableSet count](self->_prefixes, "count"))
    {
      -[DAWiFiScanner _performScan](self, "_performScan");
    }
    else
    {
      resultsHandler = (void (**)(id, void *, _QWORD))self->_resultsHandler;
      v29 = DAErrorF(350001, "Invalid scan descriptors");
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      resultsHandler[2](resultsHandler, v30, 0);

    }
  }

}

- (void)_performScan
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[7];
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  if (self->_scanning)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = sub_100019240;
    v9[4] = sub_100019250;
    v10 = 0;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = sub_100019240;
    v7[4] = sub_100019250;
    v8 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiScanner _defaultScanParameters](self, "_defaultScanParameters"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_SSIDs, "allObjects"));
    objc_msgSend(v3, "setSSIDList:", v4);

    if (dword_10003F670 <= 30
      && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
    {
      LogPrintF(&dword_10003F670, "-[DAWiFiScanner _performScan]", 30, "[WiFi] scanning for SSIDs='%@' prefixes='%@'", self->_SSIDs, self->_prefixes);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiScanner wifiInterface](self, "wifiInterface"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100019258;
    v6[3] = &unk_1000393D0;
    v6[5] = v7;
    v6[6] = v9;
    v6[4] = self;
    objc_msgSend(v5, "performScanWithParameters:reply:", v3, v6);

    _Block_object_dispose(v7, 8);
    _Block_object_dispose(v9, 8);

  }
  else if (dword_10003F670 <= 30
         && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
  {
    LogPrintF(&dword_10003F670, "-[DAWiFiScanner _performScan]", 30, "[WiFi] scanning stopped");
  }
}

- (void)_queueNextScan
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019594;
  block[3] = &unk_100038950;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopScanning
{
  self->_scanning = 0;
  -[NSMutableSet removeAllObjects](self->_reportedNetworks, "removeAllObjects");
}

- (id)_defaultScanParameters
{
  id v2;

  v2 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v2, "setMergeScanResults:", 1);
  return v2;
}

- (id)_coalesceResults:(id)a3 descriptors:(id)a4
{
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  DAWiFiNetwork *v19;
  void *v20;
  id v21;
  id obj;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
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

  v26 = a3;
  v6 = a4;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if (dword_10003F670 <= 30
          && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scanResultPredicate"));
          LogPrintF(&dword_10003F670, "-[DAWiFiScanner _coalesceResults:descriptors:]", 30, "[WiFi] descriptor='%@' predicate='%@'", v8, v9);

        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scanResultPredicate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "filteredArrayUsingPredicate:", v10));

        if (v11)
        {
          v30 = i;
          if (dword_10003F670 <= 30
            && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
          {
            LogPrintF(&dword_10003F670, "-[DAWiFiScanner _coalesceResults:descriptors:]", 30, "[WiFi] descriptor='%@' filtered results='%@'", v8, v11);
          }
          v29 = v8;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v28 = v11;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v32;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v32 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17);
                v19 = objc_alloc_init(DAWiFiNetwork);
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "networkName"));
                -[DAWiFiNetwork setSSID:](v19, "setSSID:", v20);

                -[DAWiFiNetwork setUnsecured:](v19, "setUnsecured:", objc_msgSend(v18, "isOpen"));
                if (dword_10003F670 <= 30
                  && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
                {
                  LogPrintF(&dword_10003F670, "-[DAWiFiScanner _coalesceResults:descriptors:]", 30, "[WiFi] reported networks = '%@'", self->_reportedNetworks);
                }
                if ((-[NSMutableSet containsObject:](self->_reportedNetworks, "containsObject:", v19) & 1) != 0)
                {
                  if (dword_10003F670 <= 30
                    && (dword_10003F670 != -1 || _LogCategory_Initialize(&dword_10003F670, 30)))
                  {
                    LogPrintF(&dword_10003F670, "-[DAWiFiScanner _coalesceResults:descriptors:]", 30, "[WiFi] not reporting already discovered network = '%@'", v19);
                  }
                }
                else
                {
                  objc_msgSend(v12, "addObject:", v19);
                  -[NSMutableSet addObject:](self->_reportedNetworks, "addObject:", v19);
                }

                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              v15 = v21;
            }
            while (v21);
          }

          objc_msgSend(v24, "setObject:forKey:", v12, v29);
          i = v30;
          v11 = v28;
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v27);
  }

  return v24;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wifiInterface, a3);
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

- (NSMutableSet)SSIDs
{
  return self->_SSIDs;
}

- (void)setSSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_SSIDs, a3);
}

- (NSMutableSet)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
  objc_storeStrong((id *)&self->_prefixes, a3);
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (NSMutableSet)reportedNetworks
{
  return self->_reportedNetworks;
}

- (void)setReportedNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_reportedNetworks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedNetworks, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_SSIDs, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
