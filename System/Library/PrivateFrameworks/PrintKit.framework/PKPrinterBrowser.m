@implementation PKPrinterBrowser

+ (id)browserWithDelegate:(id)a3
{
  id v3;
  PKPrinterBrowser *v4;
  PKPrinterBrowser *v5;

  v3 = a3;
  v4 = [PKPrinterBrowser alloc];
  v5 = -[PKPrinterBrowser initWithDelegate:infoDictionary:provenance:](v4, "initWithDelegate:infoDictionary:provenance:", v3, MEMORY[0x24BDBD1B8], 0);

  return v5;
}

+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4
{
  id v5;
  id v6;
  PKPrinterBrowser *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[PKPrinterBrowser initWithDelegate:infoDictionary:provenance:]([PKPrinterBrowser alloc], "initWithDelegate:infoDictionary:provenance:", v5, v6, 0);

  return v7;
}

+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5
{
  id v7;
  id v8;
  PKPrinterBrowser *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPrinterBrowser initWithDelegate:infoDictionary:provenance:]([PKPrinterBrowser alloc], "initWithDelegate:infoDictionary:provenance:", v7, v8, a5);

  return v9;
}

- (PKPrinterBrowser)initWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5
{
  id v8;
  id v9;
  PKPrinterBrowser *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  PKPrintdRPC_BrowseClient *v18;
  PKPrintdRPC_BrowseClient *browserClient;
  objc_super v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBrowser;
  v10 = -[PKPrinterBrowser init](&v21, sel_init);
  if (v10)
  {
    v11 = SBSSpringBoardServerPort();
    MEMORY[0x227667728](v11, &v10->_originalCellFlag, &v10->_originalWifiFlag);
    v12 = SBSSpringBoardServerPort();
    MEMORY[0x227667740](v12, v10->_originalCellFlag, 2);
    v13 = SBSSpringBoardServerPort();
    MEMORY[0x22766774C](v13, 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrinterBrowser setPrinters:](v10, "setPrinters:", v14);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrinterBrowser setBtDevices:](v10, "setBtDevices:", v15);

    -[PKPrinterBrowser setDelegate:](v10, "setDelegate:", v8);
    v10->_delegateRespondsToProximityUpdate = objc_opt_respondsToSelector() & 1;
    v16 = +[PKPrinterBrowseInfo rollCacheGeneration](PKPrinterBrowseInfo, "rollCacheGeneration");
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v16;
      _os_log_impl(&dword_220F9A000, v17, OS_LOG_TYPE_DEFAULT, "Starting browse, flush cache from gen %d", buf, 8u);
    }

    v18 = -[PKPrintdRPC_BrowseClient initWithInfo:provenance:delegate:]([PKPrintdRPC_BrowseClient alloc], "initWithInfo:provenance:delegate:", v9, a5, v10);
    browserClient = v10->_browserClient;
    v10->_browserClient = v18;

    -[PKPrintdRPC_BrowseClient startBrowsing](v10->_browserClient, "startBrowsing");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  PKPrintdRPC_BrowseClient *browserClient;
  PKPrintdRPC_BrowseClient *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = SBSSpringBoardServerPort();
  MEMORY[0x227667740](v4, self->_originalCellFlag, self->_originalWifiFlag);
  browserClient = self->_browserClient;
  if (browserClient)
  {
    -[PKPrintdRPC_BrowseClient invalidate](browserClient, "invalidate");
    v6 = self->_browserClient;
    self->_browserClient = 0;

  }
  -[PKPrinterBrowser setDelegate:](self, "setDelegate:", 0);
  -[PKPrinterBrowser setPrinters:](self, "setPrinters:", 0);
  -[PKPrinterBrowser setBtDevices:](self, "setBtDevices:", 0);
  v7.receiver = self;
  v7.super_class = (Class)PKPrinterBrowser;
  -[PKPrinterBrowser dealloc](&v7, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  PKPrintdRPC_BrowseClient *browserClient;
  PKPrintdRPC_BrowseClient *v5;
  PKPrinterBrowserDelegate *v6;

  v6 = (PKPrinterBrowserDelegate *)a3;
  if (!v6)
  {
    browserClient = self->_browserClient;
    if (browserClient)
    {
      -[PKPrintdRPC_BrowseClient invalidate](browserClient, "invalidate");
      v5 = self->_browserClient;
      self->_browserClient = 0;

      self->_delegateRespondsToProximityUpdate = 0;
    }
  }
  self->_delegate = v6;
  self->_delegateRespondsToProximityUpdate = objc_opt_respondsToSelector() & 1;

}

- (void)btleRssiUpdated:(id)a3 rssi:(id)a4
{
  id v6;
  PKPrinterBrowser *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id obj;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = a4;
  if (self->_delegateRespondsToProximityUpdate)
  {
    -[PKPrinterBrowser printers](self, "printers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self;
    -[PKPrinterBrowser printers](self, "printers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v13, "btleUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v13, "btleUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v6);

            if (v16)
            {
              objc_msgSend(v13, "addRSSIValue:", v23);
              v24[0] = MEMORY[0x24BDAC760];
              v24[1] = 3221225472;
              v24[2] = __41__PKPrinterBrowser_btleRssiUpdated_rssi___block_invoke;
              v24[3] = &unk_24E6CE528;
              v24[4] = v7;
              objc_msgSend(v13, "resolveOnMainQueue:", v24);
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    objc_sync_exit(obj);
    -[PKPrinterBrowser btDevices](v7, "btDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v17);
    -[PKPrinterBrowser btDevices](v7, "btDevices");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "addObject:", v23);
      if ((unint64_t)objc_msgSend(v19, "count") >= 6)
        objc_msgSend(v19, "removeObjectAtIndex:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v23);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PKPrinterBrowser btDevices](v7, "btDevices");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v20, v6);

      v19 = (void *)v20;
    }

    objc_sync_exit(v17);
  }

}

void __41__PKPrinterBrowser_btleRssiUpdated_rssi___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proximityUpdatedForPrinter:", v4);

}

- (void)browserAdded:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id location;
  _BYTE buf[24];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _PKLogCategory(PKLogCategoryDiscovery[0]);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v17 = 0;
  v9 = objc_msgSend(v6, "count");
  v17 = objc_msgSend(v7, "count") + v9;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__PKPrinterBrowser_browserAdded_removed___block_invoke;
  v13[3] = &unk_24E6CE550;
  objc_copyWeak(&v14, &location);
  v13[4] = buf;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __41__PKPrinterBrowser_browserAdded_removed___block_invoke_2;
  v11[3] = &unk_24E6CE550;
  objc_copyWeak(&v12, &location);
  v11[4] = buf;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

void __41__PKPrinterBrowser_browserAdded_removed___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "printerAdded:more:", v4, v7 != 0);

}

void __41__PKPrinterBrowser_browserAdded_removed___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v6 + 24) - 1;
  *(_QWORD *)(v6 + 24) = v7;
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "printerRemoved:more:", v4, v7 != 0);

}

- (void)printerAdded:(id)a3 more:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t j;
  id obj;
  _QWORD v38[4];
  id v39;
  BOOL v40;
  BOOL v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PKPrinterBrowser printers](self, "printers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  -[PKPrinterBrowser printers](self, "printers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bonjourName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "btleUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "btleUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBtleUUID:", v10);

      objc_msgSend(v8, "setBtleMeasuredPower:", objc_msgSend(v5, "btleMeasuredPower"));
    }
    v11 = v8;

    v5 = v11;
  }
  else
  {
    objc_msgSend(v5, "btleUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v47 = 0u;
      -[PKPrinterBrowser printers](self, "printers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v48 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v5, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "uuid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "compare:", v20) == 0;

            if (v21)
            {
              objc_msgSend(v5, "btleUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setBtleUUID:", v22);

              objc_msgSend(v18, "setBtleMeasuredPower:", objc_msgSend(v5, "btleMeasuredPower"));
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v15);
      }

    }
    -[PKPrinterBrowser printers](self, "printers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bonjourName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v5, v24);

    v8 = 0;
  }

  objc_sync_exit(obj);
  objc_msgSend(v5, "btleUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v26)
  {
    v33 = 0;
  }
  else
  {
    -[PKPrinterBrowser btDevices](self, "btDevices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v27);
    -[PKPrinterBrowser btDevices](self, "btDevices");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "btleUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    v33 = v32 != 0;
    if (v32)
    {
      v34 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(v5, "addRSSIValue:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v32);
    }

    objc_sync_exit(v27);
  }
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __38__PKPrinterBrowser_printerAdded_more___block_invoke;
  v38[3] = &unk_24E6CE578;
  objc_copyWeak(&v39, &location);
  v40 = a4;
  v41 = v33;
  objc_msgSend(v5, "resolveOnMainQueue:", v38);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

void __38__PKPrinterBrowser_printerAdded_more___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addPrinter:moreComing:", v11, *(unsigned __int8 *)(a1 + 40));

    if (*(_BYTE *)(a1 + 41))
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 32));
      v8 = objc_msgSend(v7, "delegateRespondsToProximityUpdate");

      if (v8)
      {
        v9 = objc_loadWeakRetained(v3);
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "proximityUpdatedForPrinter:", v11);

      }
    }
  }

}

- (void)printerRemoved:(id)a3 more:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  id location;

  v6 = a3;
  -[PKPrinterBrowser printers](self, "printers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[PKPrinterBrowser printers](self, "printers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bonjourName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;

    -[PKPrinterBrowser printers](self, "printers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bonjourName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

  }
  else
  {
    v11 = v6;
  }

  objc_sync_exit(v7);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__PKPrinterBrowser_printerRemoved_more___block_invoke;
  v14[3] = &unk_24E6CE5A0;
  objc_copyWeak(&v15, &location);
  v16 = a4;
  objc_msgSend(v11, "resolveOnMainQueue:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __40__PKPrinterBrowser_printerRemoved_more___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removePrinter:moreGoing:", v6, *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)btlePrinterFound:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id obj;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "btleUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v31 = v4;
        -[PKPrinterBrowser printers](self, "printers");
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(obj);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[PKPrinterBrowser printers](self, "printers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v8;
        v10 = 0;
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v40 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v14, "uuid");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v14, "uuid");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "uuid");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqual:", v17);

                if (v18)
                {
                  v19 = v14;

                  objc_msgSend(v31, "btleUUID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setBtleUUID:", v20);

                  v10 = v19;
                  objc_msgSend(v19, "setBtleMeasuredPower:", objc_msgSend(v31, "btleMeasuredPower"));
                }
              }
            }
            v8 = v9;
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v11);
        }

        objc_sync_exit(obj);
        if (v10 && self->_delegateRespondsToProximityUpdate)
        {
          -[PKPrinterBrowser btDevices](self, "btDevices");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v21);
          -[PKPrinterBrowser btDevices](self, "btDevices");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "btleUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v36 != v27)
                  objc_enumerationMutation(v25);
                objc_msgSend(v10, "addRSSIValue:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v26);

            objc_sync_exit(v21);
            objc_initWeak(&location, self);
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __37__PKPrinterBrowser_btlePrinterFound___block_invoke;
            v32[3] = &unk_24E6CE5C8;
            objc_copyWeak(&v33, &location);
            objc_msgSend(v10, "resolveOnMainQueue:", v32);
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
          }
          else
          {

            objc_sync_exit(v21);
          }
        }

        v4 = v31;
      }
    }
  }

}

void __37__PKPrinterBrowser_btlePrinterFound___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proximityUpdatedForPrinter:", v7);

  }
}

- (PKPrinterBrowserDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableDictionary)printers
{
  return self->_printers;
}

- (void)setPrinters:(id)a3
{
  objc_storeStrong((id *)&self->_printers, a3);
}

- (NSMutableDictionary)btDevices
{
  return self->_btDevices;
}

- (void)setBtDevices:(id)a3
{
  objc_storeStrong((id *)&self->_btDevices, a3);
}

- (BOOL)delegateRespondsToProximityUpdate
{
  return self->_delegateRespondsToProximityUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btDevices, 0);
  objc_storeStrong((id *)&self->_printers, 0);
  objc_storeStrong((id *)&self->_browserClient, 0);
}

@end
