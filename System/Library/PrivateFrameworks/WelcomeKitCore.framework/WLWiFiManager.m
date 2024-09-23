@implementation WLWiFiManager

- (WLWiFiManager)init
{
  WLWiFiManager *v2;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLWiFiManager;
  v2 = -[WLWiFiManager init](&v5, sel_init);
  if (v2)
  {
    -[WLWiFiManager setRef:](v2, "setRef:", WiFiManagerClientCreate());
    v4 = -[WLWiFiManager ref](v2, "ref");
    _WLLog();
    -[WLWiFiManager ref](v2, "ref", v4);
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WLWiFiManager ref](self, "ref"))
    CFRelease(-[WLWiFiManager ref](self, "ref"));
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiManager;
  -[WLWiFiManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isTetheringSupported
{
  -[WLWiFiManager ref](self, "ref");
  return WiFiManagerClientIsTetheringSupported() != 0;
}

- (void)disable
{
  -[WLWiFiManager ref](self, "ref");
  WiFiManagerClientDisable();
}

- (void)enable
{
  -[WLWiFiManager ref](self, "ref");
  WiFiManagerClientEnable();
}

- (id)createDeviceClient
{
  const __CFArray *v2;
  WLWiFiDeviceClient *Count;
  CFIndex v4;
  const void *ValueAtIndex;
  uint64_t InterfaceRoleIndex;

  -[WLWiFiManager ref](self, "ref");
  v2 = (const __CFArray *)WiFiManagerClientCopyDevices();
  _WLLog();
  if (v2)
  {
    Count = (WLWiFiDeviceClient *)CFArrayGetCount(v2);
    if (Count)
    {
      v4 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v4);
        InterfaceRoleIndex = WiFiDeviceClientGetInterfaceRoleIndex();
        _WLLog();
        if (!InterfaceRoleIndex)
          break;
        if (Count == (WLWiFiDeviceClient *)++v4)
        {
          Count = 0;
          goto LABEL_9;
        }
      }
      Count = -[WLWiFiDeviceClient initWithWiFiDeviceClientRef:]([WLWiFiDeviceClient alloc], "initWithWiFiDeviceClientRef:", ValueAtIndex, ValueAtIndex, 0);
    }
LABEL_9:
    CFRelease(v2);
  }
  else
  {
    Count = 0;
  }
  _WLLog();
  return Count;
}

- (void)scanNetwork:(id)a3
{
  id v4;
  uint64_t Device;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WLWiFiManager ref](self, "ref");
  Device = WiFiManagerClientGetDevice();
  if (Device)
  {
    v6 = (void *)Device;
    v15[0] = CFSTR("SCAN_BSS_TYPE");
    v15[1] = CFSTR("SCAN_DWELL_TIME");
    v16[0] = &unk_24E385898;
    v16[1] = &unk_24E3858B0;
    v15[2] = CFSTR("SCAN_NUM_SCANS");
    v15[3] = CFSTR("SCAN_PHY_MODE");
    v16[2] = &unk_24E3858C8;
    v16[3] = &unk_24E3858C8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __29__WLWiFiManager_scanNetwork___block_invoke;
    v11[3] = &unk_24E3762F0;
    objc_copyWeak(v13, &location);
    v13[1] = v6;
    v8 = v4;
    v12 = v8;
    v9 = (void *)MEMORY[0x2207BB4C4](v11);
    v10 = (id)MEMORY[0x2207BB4C4]();
    LODWORD(v6) = WiFiDeviceClientScanAsync();

    if ((_DWORD)v6)
    {
      _WLLog();
      if (v8)
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    }

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);

  }
  else
  {
    _WLLog();
    if (v4)
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __29__WLWiFiManager_scanNetwork___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "currentNetwork:channels:completion:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 32));

}

- (void)currentNetwork:(__WiFiDeviceClient *)a3 channels:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__WLWiFiManager_currentNetwork_channels_completion___block_invoke;
  v15[3] = &unk_24E376318;
  objc_copyWeak(v18, &location);
  v18[1] = a3;
  v10 = v8;
  v16 = v10;
  v11 = v9;
  v17 = v11;
  v12 = (void *)MEMORY[0x2207BB4C4](v15);
  v13 = MEMORY[0x24BDAC9B8];
  v14 = (id)MEMORY[0x2207BB4C4](v12);
  LODWORD(a3) = WiFiDeviceClientCopyCurrentNetworkAsync();

  if ((_DWORD)a3)
  {
    _WLLog();
    if (v11)
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __52__WLWiFiManager_currentNetwork_channels_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_preferredChannel:network:channels:completion:", *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_preferredChannel:(__WiFiDeviceClient *)a3 network:(__WiFiNetwork *)a4 channels:(id)a5 completion:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void (**v63)(_QWORD, _QWORD);
  uint64_t v64;
  void *v66;
  void *v67;
  _BOOL8 v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  id obj;
  id obja;
  id v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  void *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v70 = a6;
  WiFiNetworkGetChannel();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v9;
  if (a4)
    v78 = objc_msgSend(v9, "integerValue");
  else
    v78 = -1;
  v73 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v71 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v85 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v84 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v75 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v72 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = (void *)WiFiDeviceClientCopyProperty();
  v11 = (void *)WiFiDeviceClientCopyProperty();
  v74 = v8;
  if (v11)
  {
    v80 = v10;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v91 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_CH_NUM"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_INDOOR_RESTRICTED"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CHANNELINFO_PASSIVE"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();
          if (objc_msgSend(v18, "BOOLValue", v17, v18, v19))
            objc_msgSend(v85, "addObject:", v17);
          if (objc_msgSend(v19, "BOOLValue"))
            objc_msgSend(v84, "addObject:", v17);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      }
      while (v13);
    }

    CFRelease(obj);
    v8 = v74;
    v10 = v80;
  }
  if (!v10)
  {
    v44 = -1;
    v45 = -1;
    goto LABEL_57;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v79 = v10;
  obja = (id)objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  if (!obja)
  {
    v76 = -1;
    v77 = -1;
    goto LABEL_56;
  }
  v81 = *(_QWORD *)v87;
  v20 = CFSTR("SUP_CHANNEL");
  v76 = -1;
  v77 = -1;
  do
  {
    for (j = 0; j != obja; j = (char *)j + 1)
    {
      if (*(_QWORD *)v87 != v81)
        objc_enumerationMutation(v79);
      v22 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j);
      objc_msgSend(v22, "objectForKeyedSubscript:", v20, v66, v67, v68);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SUP_CHANNEL_FLAGS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");
      v26 = v25;
      v27 = (v25 & 0x100 | (v25 >> 7) & 1) ^ 1;
      v28 = objc_msgSend(v85, "containsObject:", v23);
      v29 = v27 | objc_msgSend(v84, "containsObject:", v23) | v28;
      v66 = v23;
      v67 = v24;
      v68 = v29 != 0;
      _WLLog();
      if (!v29)
      {
        v30 = v20;
        v31 = objc_msgSend(v23, "integerValue", v23, v24, v68);
        v32 = v31;
        if ((v26 & 8) != 0)
        {
          v33 = v31 >= 1 && v31 <= 14;
          if (v33 && v31 != v78)
          {
            v35 = v77;
            if (v77 <= v31)
              v35 = v31;
            v77 = v35;
            objc_msgSend(v8, "objectForKey:", v23);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v36, "integerValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "setObject:forKey:", v38, v39);

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "addObject:", v38);
            }
            goto LABEL_49;
          }
        }
        if ((v26 & 0x10) != 0 && v31 >= 32 && v31 <= 177 && v31 != v78)
        {
          v41 = v76;
          if (v76 <= v31)
            v41 = v31;
          v76 = v41;
          objc_msgSend(v8, "objectForKey:", v23);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v23);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v37, "integerValue"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setObject:forKey:", v38, v43);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v32);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "addObject:", v38);
          }
          v8 = v74;
LABEL_49:

        }
        v20 = v30;
      }

    }
    obja = (id)objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  }
  while (obja);
LABEL_56:

  CFRelease(v79);
  v44 = v76;
  v45 = v77;
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", 0, 0, v66, v67);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "sortedArrayUsingDescriptors:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "integerValue");

  objc_msgSend(v71, "sortedArrayUsingDescriptors:", v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "integerValue");

  objc_msgSend(v75, "keysSortedByValueUsingComparator:", &__block_literal_global_7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "integerValue");

  objc_msgSend(v75, "keysSortedByValueUsingComparator:", &__block_literal_global_53);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "firstObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "integerValue");

  if (v56 <= 0)
    v60 = v45;
  else
    v60 = v56;
  if (v50 > 0)
    v60 = v50;
  if (v59 <= 0)
    v61 = v44;
  else
    v61 = v59;
  if (v53 > 0)
    v61 = v53;
  if (v78 <= 0)
  {
    if (v60 <= 1)
      v60 = 1;
    if (v61 <= 31)
      v64 = v60;
    else
      v64 = v61;
    v62 = v74;
    v63 = (void (**)(_QWORD, _QWORD))v70;
  }
  else
  {
    v62 = v74;
    v63 = (void (**)(_QWORD, _QWORD))v70;
    if ((unint64_t)v78 > 0xE)
    {
      if (v60 <= 0 || (unint64_t)(v78 - 32) >= 0x92)
        v64 = 1;
      else
        v64 = v60;
    }
    else if (v61 <= 1)
    {
      v64 = 1;
    }
    else
    {
      v64 = v61;
    }
  }
  _WLLog();
  if (v63)
    v63[2](v63, v64);

}

uint64_t __63__WLWiFiManager__preferredChannel_network_channels_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __63__WLWiFiManager__preferredChannel_network_channels_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (__WiFiManagerClient)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiManagerClient *)a3
{
  self->_ref = a3;
}

@end
