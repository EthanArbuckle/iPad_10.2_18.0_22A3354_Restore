@implementation WiFiCloudSyncEngineCore

- (WiFiCloudSyncEngineCore)initWithEncryptedKVS:(BOOL)a3
{
  _BOOL8 v3;
  WiFiCloudSyncEngineCore *v4;
  WiFiCloudSyncEngineCore *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WiFiCloudSyncEngineCore;
  v4 = -[WiFiCloudSyncEngineCore init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[WiFiCloudSyncEngineCore setIsKVSEncrypted:](v4, "setIsKVSEncrypted:", v3);
  return v5;
}

- (void)registerCallback:(void *)a3 context:(void *)a4
{
  -[WiFiCloudSyncEngineCore setContext:](self, "setContext:", a4);
  -[WiFiCloudSyncEngineCore setCallback:](self, "setCallback:", a3);
  -[WiFiCloudSyncEngineCore setClientThread:](self, "setClientThread:", objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"));
  -[WiFiCloudSyncEngineCore setClientQueue:](self, "setClientQueue:", 0);
  -[WiFiCloudSyncEngineCore setICloudSyncingEnabled:](self, "setICloudSyncingEnabled:", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();
}

- (void)registerCallback:(void *)a3 queue:(id)a4 context:(void *)a5
{
  -[WiFiCloudSyncEngineCore setContext:](self, "setContext:", a5);
  -[WiFiCloudSyncEngineCore setCallback:](self, "setCallback:", a3);
  -[WiFiCloudSyncEngineCore setClientThread:](self, "setClientThread:", 0);
  -[WiFiCloudSyncEngineCore setClientQueue:](self, "setClientQueue:", a4);
  -[WiFiCloudSyncEngineCore setICloudSyncingEnabled:](self, "setICloudSyncingEnabled:", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();
}

- (void)dealloc
{
  objc_super v3;

  -[WiFiCloudSyncEngineCore unSubscribeKVStoreNotfications](self, "unSubscribeKVStoreNotfications");
  v3.receiver = self;
  v3.super_class = (Class)WiFiCloudSyncEngineCore;
  -[WiFiCloudSyncEngineCore dealloc](&v3, sel_dealloc);
}

- (void)synchronizeKVS
{
  _BOOL4 v2;
  _BOOL4 v3;

  v2 = -[NSUbiquitousKeyValueStore synchronize](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "synchronize");
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v3)
      return;
  }
  else if (!v3)
  {
    return;
  }
  _os_log_send_and_compose_impl();
}

- (void)addToKVStore:(id)a3 synchronize:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  NSObject *global_queue;
  _QWORD *v43;
  uint64_t v44;
  int *v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL4 v55;
  _QWORD block[5];
  _QWORD v57[5];
  int v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 139;
    goto LABEL_51;
  }
  v4 = a4;
  if (!-[WiFiCloudSyncEngineCore iCloudSyncingEnabled](self, "iCloudSyncingEnabled"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 141;
    goto LABEL_51;
  }
  v7 = (void *)objc_msgSend(a3, "allKeys");
  if (!v7 || (v8 = v7, !objc_msgSend(v7, "count")))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 145;
    goto LABEL_51;
  }
  v9 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
  v10 = objc_msgSend(a3, "objectForKey:", v9);
  if (!v9 || (v11 = (void *)v10) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 150;
    goto LABEL_51;
  }
  v12 = objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4);
  v13 = -[NSUbiquitousKeyValueStore maximumKeyLength](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "maximumKeyLength");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v58 = 136316418;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 155;
    v64 = 2112;
    v65 = v9;
    v66 = 2048;
    v67 = v12;
    v68 = 2048;
    v69 = v13;
    LODWORD(v47) = 58;
    v45 = &v58;
    _os_log_send_and_compose_impl();
  }
  if (v12 >= v13 + 1)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v58 = 136315650;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 157;
    goto LABEL_51;
  }
  v14 = -[NSUbiquitousKeyValueStore objectForKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "objectForKey:", v9);
  if (!v14 || (v15 = v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[NSUbiquitousKeyValueStore setObject:forKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v45, v47), "setObject:forKey:", v11, v9);
    if (!v4)
      return;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke_44;
    block[3] = &unk_24D23E4C0;
    block[4] = self;
    v43 = block;
    goto LABEL_44;
  }
  v16 = (id)objc_msgSend(v15, "mutableCopy");
  if (!-[WiFiCloudSyncEngineCore isKVSEncrypted](self, "isKVSEncrypted"))
  {
    objc_msgSend(v16, "addEntriesFromDictionary:", v11);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WEP")), CFSTR("WEP"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WPA_IE")), CFSTR("WPA_IE"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RSN_IE")), CFSTR("RSN_IE"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WPA3_RSN_IE")), CFSTR("WPA3_RSN_IE"));
    v44 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("addedByVersion"));
    if (v44)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v44, CFSTR("addedByVersion"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("BSSID"), v45, v47);
    if ((objc_msgSend(v16, "isEqualToDictionary:", v15) & 1) != 0
      || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      return;
    }
    v58 = 136316418;
    v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
    v60 = 2080;
    v61 = "WiFiCloudSyncEngineCore.m";
    v62 = 1024;
    v63 = 288;
    v64 = 2112;
    v65 = v9;
    v66 = 2112;
    v67 = (unint64_t)v15;
    v68 = 2112;
    v69 = (uint64_t)v16;
LABEL_51:
    _os_log_send_and_compose_impl();
    return;
  }
  v55 = v4;
  v17 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("addedAt"));
  v50 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("lastJoinedByUserAt"));
  v52 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("lastJoinedBySystemAtWeek"));
  v54 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("removedAt"));
  v53 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("was6GHzOnlyAtWeek"));
  v18 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("addedAt"));
  v19 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lastJoinedByUserAt"));
  v49 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lastJoinedBySystemAtWeek"));
  v51 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("removedAt"));
  v20 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("was6GHzOnlyAtWeek"));
  objc_msgSend(v16, "addEntriesFromDictionary:", v11);
  if (v17 | v18)
  {
    v21 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)v17, "timeIntervalSinceReferenceDate");
    v23 = v22;
    objc_msgSend((id)v18, "timeIntervalSinceReferenceDate");
    if (v23 >= v24)
      v24 = v23;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:", v24, v45, v47), CFSTR("addedAt"));
  }
  if (v50 | v19)
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)v50, "timeIntervalSinceReferenceDate");
    v27 = v26;
    objc_msgSend((id)v19, "timeIntervalSinceReferenceDate");
    if (v27 >= v28)
      v28 = v27;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:", v28, v45, v47), CFSTR("lastJoinedByUserAt"));
  }
  if (v52 | v49)
  {
    v29 = (void *)MEMORY[0x24BDD16E0];
    v30 = objc_msgSend((id)v52, "unsignedIntegerValue");
    v31 = objc_msgSend((id)v49, "unsignedIntegerValue");
    if (v30 <= v31)
      v32 = v31;
    else
      v32 = v30;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithUnsignedInteger:", v32, v45, v47), CFSTR("lastJoinedBySystemAtWeek"));
  }
  if (v53 | v20)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    v34 = objc_msgSend((id)v53, "unsignedIntegerValue");
    v35 = objc_msgSend((id)v20, "unsignedIntegerValue");
    if (v34 <= v35)
      v36 = v35;
    else
      v36 = v34;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v33, "numberWithUnsignedInteger:", v36, v45, v47), CFSTR("was6GHzOnlyAtWeek"));
  }
  if (v54 | v51)
  {
    v37 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)v54, "timeIntervalSinceReferenceDate");
    v39 = v38;
    objc_msgSend((id)v51, "timeIntervalSinceReferenceDate");
    if (v39 >= v40)
      v40 = v39;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:", v40, v45, v47), CFSTR("removedAt"));
  }
  v41 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("addedByVersion"), v45, v47);
  if (v41)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v41, CFSTR("addedByVersion"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("BSSID"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isWEP")), CFSTR("isWEP"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isWAPI")), CFSTR("isWAPI"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isWPA")), CFSTR("isWPA"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isWPA2")), CFSTR("isWPA2"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isWPA3")), CFSTR("isWPA3"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isOpen")), CFSTR("isOpen"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isPSK")), CFSTR("isPSK"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isEAP")), CFSTR("isEAP"));
  if ((objc_msgSend(v16, "isEqualToDictionary:", v15) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v58 = 136316418;
      v59 = "-[WiFiCloudSyncEngineCore addToKVStore:synchronize:]";
      v60 = 2080;
      v61 = "WiFiCloudSyncEngineCore.m";
      v62 = 1024;
      v63 = 236;
      v64 = 2112;
      v65 = v9;
      v66 = 2112;
      v67 = (unint64_t)v15;
      v68 = 2112;
      v69 = (uint64_t)v16;
      LODWORD(v48) = 58;
      v46 = &v58;
      _os_log_send_and_compose_impl();
    }
    -[NSUbiquitousKeyValueStore setObject:forKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v46, v48), "setObject:forKey:", v16, v9);
    if (v55)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke;
      v57[3] = &unk_24D23E4C0;
      v57[4] = self;
      v43 = v57;
LABEL_44:
      dispatch_async(global_queue, v43);
    }
  }
}

uint64_t __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

uint64_t __52__WiFiCloudSyncEngineCore_addToKVStore_synchronize___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

- (void)removeFromKVStore:(id)a3
{
  BOOL v5;
  _BOOL4 v6;
  NSObject *global_queue;
  int *v8;
  uint64_t v9;
  _QWORD block[5];
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v11 = 136315650;
    v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    v13 = 2080;
    v14 = "WiFiCloudSyncEngineCore.m";
    v15 = 1024;
    v16 = 313;
    goto LABEL_11;
  }
  v5 = -[WiFiCloudSyncEngineCore iCloudSyncingEnabled](self, "iCloudSyncingEnabled");
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (!v6)
      return;
    v11 = 136315650;
    v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    v13 = 2080;
    v14 = "WiFiCloudSyncEngineCore.m";
    v15 = 1024;
    v16 = 315;
LABEL_11:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v6)
  {
    v11 = 136315906;
    v12 = "-[WiFiCloudSyncEngineCore removeFromKVStore:]";
    v13 = 2080;
    v14 = "WiFiCloudSyncEngineCore.m";
    v15 = 1024;
    v16 = 317;
    v17 = 2112;
    v18 = a3;
    LODWORD(v9) = 38;
    v8 = &v11;
    _os_log_send_and_compose_impl();
  }
  -[NSUbiquitousKeyValueStore removeObjectForKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v8, v9), "removeObjectForKey:", a3);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WiFiCloudSyncEngineCore_removeFromKVStore___block_invoke;
  block[3] = &unk_24D23E4C0;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __45__WiFiCloudSyncEngineCore_removeFromKVStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

- (void)readStoreValueForKey:(id)a3
{
  _BOOL4 v5;
  id v6;
  OS_dispatch_queue *v7;
  _QWORD *v8;
  int *v9;
  uint64_t v10;
  _QWORD block[6];
  _QWORD v12[6];
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!a3)
  {
    if (!v5)
      return;
    v13 = 136315650;
    v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    v15 = 2080;
    v16 = "WiFiCloudSyncEngineCore.m";
    v17 = 1024;
    v18 = 334;
LABEL_20:
    _os_log_send_and_compose_impl();
    return;
  }
  if (v5)
  {
    v13 = 136315906;
    v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    v15 = 2080;
    v16 = "WiFiCloudSyncEngineCore.m";
    v17 = 1024;
    v18 = 336;
    v19 = 2112;
    v20 = a3;
    LODWORD(v10) = 38;
    v9 = &v13;
    _os_log_send_and_compose_impl();
  }
  v6 = -[NSUbiquitousKeyValueStore objectForKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v9, v10), "objectForKey:", a3);
  if (!-[WiFiCloudSyncEngineCore clientThread](self, "clientThread")
    && !-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    v13 = 136315650;
    v14 = "-[WiFiCloudSyncEngineCore readStoreValueForKey:]";
    v15 = 2080;
    v16 = "WiFiCloudSyncEngineCore.m";
    v17 = 1024;
    v18 = 342;
    goto LABEL_20;
  }
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
      -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayReadStoreValueAction_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), v6, 1);
    if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      v7 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke;
      v12[3] = &unk_24D23E4E8;
      v12[4] = self;
      v12[5] = v6;
      v8 = v12;
LABEL_16:
      dispatch_sync((dispatch_queue_t)v7, v8);
    }
  }
  else
  {
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
      -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayReadStoreValueAction_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), a3, 1);
    if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      v7 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke_2;
      block[3] = &unk_24D23E4E8;
      block[4] = self;
      block[5] = a3;
      v8 = block;
      goto LABEL_16;
    }
  }
}

uint64_t __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayReadStoreValueAction:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__WiFiCloudSyncEngineCore_readStoreValueForKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayReadStoreValueAction:", *(_QWORD *)(a1 + 40));
}

- (void)relayReadStoreValueAction:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    v17 = 2080;
    v18 = "WiFiCloudSyncEngineCore.m";
    v19 = 1024;
    v20 = 373;
    LODWORD(v12) = 28;
    v11 = &v15;
    _os_log_send_and_compose_impl();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (-[WiFiCloudSyncEngineCore isKVSEncrypted](self, "isKVSEncrypted"))
      return;
    v13 = CFSTR("SSID_STR");
    v14 = a3;
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = 136315650;
    v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    v17 = 2080;
    v18 = "WiFiCloudSyncEngineCore.m";
    v19 = 1024;
    v20 = 399;
    LODWORD(v12) = 28;
    v11 = &v15;
    goto LABEL_11;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("removedAt"));
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("addedAt"));
  if (v5)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    if (v9 > v10)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        WiFiCloudSyncEngineRemoveNetworkFromKnownNetworksList((uint64_t)-[WiFiCloudSyncEngineCore context](self, "context", v11, v12), self, a3);
        return;
      }
      v15 = 136315650;
      v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
      v17 = 2080;
      v18 = "WiFiCloudSyncEngineCore.m";
      v19 = 1024;
      v20 = 383;
      LODWORD(v12) = 28;
      v11 = &v15;
LABEL_11:
      _os_log_send_and_compose_impl();
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[WiFiCloudSyncEngineCore relayReadStoreValueAction:]";
    v17 = 2080;
    v18 = "WiFiCloudSyncEngineCore.m";
    v19 = 1024;
    v20 = 389;
    LODWORD(v12) = 28;
    v11 = &v15;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineAddNetworkToKnownNetworksList((uint64_t)-[WiFiCloudSyncEngineCore context](self, "context", v11, v12), self, a3);
}

- (id)readCompleteKVStore
{
  int *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[WiFiCloudSyncEngineCore readCompleteKVStore]";
    v8 = 2080;
    v9 = "WiFiCloudSyncEngineCore.m";
    v10 = 1024;
    v11 = 408;
    LODWORD(v5) = 28;
    v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  return -[NSUbiquitousKeyValueStore dictionaryRepresentation](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v4, v5), "dictionaryRepresentation");
}

- (void)printCompleteKVStore
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSDictionary *v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v8[24];
  _BYTE v9[14];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSUbiquitousKeyValueStore synchronize](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "synchronize");
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4)
      goto LABEL_7;
    *(_DWORD *)v8 = 136315650;
    *(_QWORD *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(_QWORD *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)v9 = 419;
    LODWORD(v7) = 28;
    v6 = v8;
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    *(_DWORD *)v8 = 136315650;
    *(_QWORD *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(_QWORD *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)v9 = 422;
    LODWORD(v7) = 28;
    v6 = v8;
  }
  _os_log_send_and_compose_impl();
LABEL_7:
  v5 = -[NSUbiquitousKeyValueStore dictionaryRepresentation](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore", v6, v7, *(_OWORD *)v8, *(_QWORD *)&v8[16], *(_QWORD *)v9), "dictionaryRepresentation");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v8 = 136315906;
    *(_QWORD *)&v8[4] = "-[WiFiCloudSyncEngineCore printCompleteKVStore]";
    *(_WORD *)&v8[12] = 2080;
    *(_QWORD *)&v8[14] = "WiFiCloudSyncEngineCore.m";
    *(_WORD *)&v8[22] = 1024;
    *(_DWORD *)v9 = 426;
    *(_WORD *)&v9[4] = 2112;
    *(_QWORD *)&v9[6] = v5;
    _os_log_send_and_compose_impl();
  }
}

- (void)clearKVS
{
  _BOOL4 v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *global_queue;
  int *v11;
  uint64_t v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[WiFiCloudSyncEngineCore isKVSEncrypted](self, "isKVSEncrypted");
    v4 = "";
    v20 = "-[WiFiCloudSyncEngineCore clearKVS]";
    v22 = "WiFiCloudSyncEngineCore.m";
    v23 = 1024;
    v19 = 136315906;
    v24 = 434;
    v21 = 2080;
    if (v3)
      v4 = "Encrypted ";
    v25 = 2080;
    v26 = v4;
    LODWORD(v12) = 38;
    v11 = &v19;
    _os_log_send_and_compose_impl();
  }
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_msgSend(-[WiFiCloudSyncEngineCore readCompleteKVStore](self, "readCompleteKVStore", v11, v12), "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[NSUbiquitousKeyValueStore removeObjectForKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WiFiCloudSyncEngineCore_clearKVS__block_invoke;
  block[3] = &unk_24D23E4C0;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __35__WiFiCloudSyncEngineCore_clearKVS__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

- (void)dispatchUbiquitousKeyValueStoreDidChangeOnBackground:(id)a3
{
  NSThread *v5;
  OS_dispatch_queue *current_queue;
  NSObject *global_queue;
  _QWORD *v8;
  _QWORD block[6];
  _QWORD v10[6];
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread")
    || -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread")
      && (v5 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"),
          v5 == -[WiFiCloudSyncEngineCore clientThread](self, "clientThread")))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = "-[WiFiCloudSyncEngineCore dispatchUbiquitousKeyValueStoreDidChangeOnBackground:]";
        v13 = 2080;
        v14 = "WiFiCloudSyncEngineCore.m";
        v15 = 1024;
        v16 = 460;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke;
      v10[3] = &unk_24D23E4E8;
      v10[4] = self;
      v10[5] = a3;
      v8 = v10;
    }
    else
    {
      if (!-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue")
        || (current_queue = (OS_dispatch_queue *)dispatch_get_current_queue(),
            current_queue != -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue")))
      {
        -[WiFiCloudSyncEngineCore ubiquitousKeyValueStoreDidChange:](self, "ubiquitousKeyValueStoreDidChange:", a3);
        return;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = "-[WiFiCloudSyncEngineCore dispatchUbiquitousKeyValueStoreDidChangeOnBackground:]";
        v13 = 2080;
        v14 = "WiFiCloudSyncEngineCore.m";
        v15 = 1024;
        v16 = 468;
        _os_log_send_and_compose_impl();
      }
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke_51;
      block[3] = &unk_24D23E4E8;
      block[4] = self;
      block[5] = a3;
      v8 = block;
    }
    dispatch_async(global_queue, v8);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ubiquitousKeyValueStoreDidChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__WiFiCloudSyncEngineCore_dispatchUbiquitousKeyValueStoreDidChangeOnBackground___block_invoke_51(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ubiquitousKeyValueStoreDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)ubiquitousKeyValueStoreDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  OS_dispatch_queue *v7;
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  int *v11;
  uint64_t v12;
  _QWORD v13[6];
  _QWORD block[5];
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1368]), "intValue");
  v6 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1370]);
  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread")
    || -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    if (objc_msgSend(v6, "indexOfObject:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS")) == 0x7FFFFFFFFFFFFFFFLL
      || !-[NSUbiquitousKeyValueStore objectForKey:](-[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"), "objectForKey:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS")))
    {
      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316162;
      v16 = "-[WiFiCloudSyncEngineCore ubiquitousKeyValueStoreDidChange:]";
      v17 = 2080;
      v18 = "WiFiCloudSyncEngineCore.m";
      v19 = 1024;
      v20 = 496;
      v21 = 1024;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      LODWORD(v12) = 44;
      v11 = &v15;
      _os_log_send_and_compose_impl();
    }
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread", v11, v12))
      -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayCloudCleanUpEvent, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), 0, 0);
    if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      v7 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke;
      block[3] = &unk_24D23E4C0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)v7, block);
    }
    if (v5 >= 2)
    {
LABEL_12:
      v8 = objc_alloc(MEMORY[0x24BDBCE70]);
      v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5), CFSTR("reason"), v6, CFSTR("changedKeys"), 0);
      if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
        -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayCloudEvent_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), v9, 0);
      if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
      {
        v10 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke_2;
        v13[3] = &unk_24D23E4E8;
        v13[4] = self;
        v13[5] = v9;
        dispatch_async((dispatch_queue_t)v10, v13);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayCloudCleanUpEvent");
}

uint64_t __60__WiFiCloudSyncEngineCore_ubiquitousKeyValueStoreDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayCloudEvent:", *(_QWORD *)(a1 + 40));
}

- (void)enableIcloudSyncing:(BOOL)a3 ForBundleId:(id)a4
{
  _BOOL4 v5;

  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();
  if (v5)
  {
    -[WiFiCloudSyncEngineCore subscribeKVStoreNotficationsForBundleId:](self, "subscribeKVStoreNotficationsForBundleId:", a4);
    -[WiFiCloudSyncEngineCore setICloudSyncingEnabled:](self, "setICloudSyncingEnabled:", 1);
  }
  else
  {
    -[WiFiCloudSyncEngineCore unSubscribeKVStoreNotfications](self, "unSubscribeKVStoreNotfications");
  }
}

- (void)subscribeKVStoreNotficationsForBundleId:(id)a3
{
  _BOOL4 v5;
  id v6;
  NSObject *global_queue;
  void *v8;
  _QWORD block[5];
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = -[WiFiCloudSyncEngineCore isKVSEncrypted](self, "isKVSEncrypted");
  v6 = objc_alloc(MEMORY[0x24BDD1888]);
  if (v5)
  {
    self->keyValueStore = (NSUbiquitousKeyValueStore *)objc_msgSend(v6, "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.wifi.syncable-networks"), 1);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316162;
      v11 = "-[WiFiCloudSyncEngineCore subscribeKVStoreNotficationsForBundleId:]";
      v12 = 2080;
      v13 = "WiFiCloudSyncEngineCore.m";
      v14 = 1024;
      v15 = 546;
      v16 = 2112;
      v17 = a3;
      v18 = 2112;
      v19 = CFSTR("com.apple.wifi.syncable-networks");
LABEL_6:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    self->keyValueStore = (NSUbiquitousKeyValueStore *)objc_msgSend(v6, "initWithBundleIdentifier:", a3);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316162;
      v11 = "-[WiFiCloudSyncEngineCore subscribeKVStoreNotficationsForBundleId:]";
      v12 = 2080;
      v13 = "WiFiCloudSyncEngineCore.m";
      v14 = 1024;
      v15 = 556;
      v16 = 2112;
      v17 = a3;
      v18 = 2112;
      v19 = CFSTR("com.apple.wifid.known-networks");
      goto LABEL_6;
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WiFiCloudSyncEngineCore_subscribeKVStoreNotficationsForBundleId___block_invoke;
  block[3] = &unk_24D23E4C0;
  block[4] = self;
  dispatch_async(global_queue, block);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_dispatchUbiquitousKeyValueStoreDidChangeOnBackground_, *MEMORY[0x24BDD1378], -[WiFiCloudSyncEngineCore keyValueStore](self, "keyValueStore"));
}

uint64_t __67__WiFiCloudSyncEngineCore_subscribeKVStoreNotficationsForBundleId___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronizeKVS");
}

- (void)unSubscribeKVStoreNotfications
{
  int *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[WiFiCloudSyncEngineCore unSubscribeKVStoreNotfications]";
    v7 = 2080;
    v8 = "WiFiCloudSyncEngineCore.m";
    v9 = 1024;
    v10 = 572;
    LODWORD(v4) = 28;
    v3 = &v5;
    _os_log_send_and_compose_impl();
  }
  -[WiFiCloudSyncEngineCore setICloudSyncingEnabled:](self, "setICloudSyncingEnabled:", 0, v3, v4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);

  self->keyValueStore = 0;
}

- (void)relayPruneKVSStore:(id)a3
{
  NSThread *v5;
  OS_dispatch_queue *current_queue;
  int *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
  {
    v5 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    if (v5 != -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v9 = 136315650;
      v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
      v11 = 2080;
      v12 = "WiFiCloudSyncEngineCore.m";
      v13 = 1024;
      v14 = 589;
LABEL_9:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v9 = 136315650;
      v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
      v11 = 2080;
      v12 = "WiFiCloudSyncEngineCore.m";
      v13 = 1024;
      v14 = 594;
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[WiFiCloudSyncEngineCore relayPruneKVSStore:]";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngineCore.m";
    v13 = 1024;
    v14 = 598;
    LODWORD(v8) = 28;
    v7 = &v9;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEnginePruneNetworksInCloud((uint64_t)-[WiFiCloudSyncEngineCore context](self, "context", v7, v8), self, a3);
}

- (void)pruneKVSStore
{
  id v3;
  void *v4;
  void *v5;
  OS_dispatch_queue *v6;
  int *v7;
  uint64_t v8;
  _QWORD block[6];
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[WiFiCloudSyncEngineCore pruneKVSStore]";
    v12 = 2080;
    v13 = "WiFiCloudSyncEngineCore.m";
    v14 = 1024;
    v15 = 605;
    LODWORD(v8) = 28;
    v7 = &v10;
    _os_log_send_and_compose_impl();
  }
  v3 = -[WiFiCloudSyncEngineCore readCompleteKVStore](self, "readCompleteKVStore", v7, v8);
  if (v3)
  {
    v4 = v3;
    -[WiFiCloudSyncEngineCore removeFromKVStore:](self, "removeFromKVStore:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"));
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_NonNetworkContainer")), "objectForKey:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_KVSVersion"));
    if (!v5 || (int)objc_msgSend(v5, "intValue") <= 1)
    {
      if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
        -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayPruneKVSStore_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), v4, 1);
      if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
      {
        v6 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__WiFiCloudSyncEngineCore_pruneKVSStore__block_invoke;
        block[3] = &unk_24D23E4E8;
        block[4] = self;
        block[5] = v4;
        dispatch_sync((dispatch_queue_t)v6, block);
      }
    }
  }
}

uint64_t __40__WiFiCloudSyncEngineCore_pruneKVSStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayPruneKVSStore:", *(_QWORD *)(a1 + 40));
}

- (void)relayCloudEvent:(id)a3
{
  NSThread *v5;
  OS_dispatch_queue *current_queue;

  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
  {
    v5 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    if (v5 != -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
LABEL_8:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      goto LABEL_8;
    }
  }
  if (-[WiFiCloudSyncEngineCore callback](self, "callback"))
    ((void (*)(WiFiCloudSyncEngineCore *, id, void *))-[WiFiCloudSyncEngineCore callback](self, "callback"))(self, a3, -[WiFiCloudSyncEngineCore context](self, "context"));
}

- (void)relayCloudCleanUpEvent
{
  NSThread *v3;
  OS_dispatch_queue *current_queue;

  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
  {
    v3 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    if (v3 != -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      goto LABEL_8;
    }
  }
  if (!-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue")
    || (current_queue = (OS_dispatch_queue *)dispatch_get_current_queue(),
        current_queue == -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue")))
  {
    -[WiFiCloudSyncEngineCore removeFromKVStore:](self, "removeFromKVStore:", CFSTR("WiFiCloudSyncEngineNonSSIDKeyPrefix_cleaningKVS"));
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
LABEL_8:
    _os_log_send_and_compose_impl();
}

- (void)relayMergeNetworks:(id)a3
{
  NSThread *v5;
  OS_dispatch_queue *current_queue;
  int *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
  {
    v5 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    if (v5 != -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v9 = 136315650;
      v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
      v11 = 2080;
      v12 = "WiFiCloudSyncEngineCore.m";
      v13 = 1024;
      v14 = 666;
LABEL_9:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v9 = 136315650;
      v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
      v11 = 2080;
      v12 = "WiFiCloudSyncEngineCore.m";
      v13 = 1024;
      v14 = 671;
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[WiFiCloudSyncEngineCore relayMergeNetworks:]";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngineCore.m";
    v13 = 1024;
    v14 = 675;
    LODWORD(v8) = 28;
    v7 = &v9;
    _os_log_send_and_compose_impl();
  }
  WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS((_QWORD *)-[WiFiCloudSyncEngineCore context](self, "context", v7, v8), self, a3);
}

- (void)synchronizeAndCallMergeNetworks
{
  id v3;
  id v4;
  OS_dispatch_queue *v5;
  int *v6;
  uint64_t v7;
  _QWORD block[6];
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[WiFiCloudSyncEngineCore synchronizeAndCallMergeNetworks]";
    v11 = 2080;
    v12 = "WiFiCloudSyncEngineCore.m";
    v13 = 1024;
    v14 = 682;
    LODWORD(v7) = 28;
    v6 = &v9;
    _os_log_send_and_compose_impl();
  }
  -[WiFiCloudSyncEngineCore synchronizeKVS](self, "synchronizeKVS", v6, v7);
  v3 = -[WiFiCloudSyncEngineCore readCompleteKVStore](self, "readCompleteKVStore");
  if (v3)
  {
    v4 = v3;
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
      -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayMergeNetworks_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), v4, 1);
    if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      v5 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__WiFiCloudSyncEngineCore_synchronizeAndCallMergeNetworks__block_invoke;
      block[3] = &unk_24D23E4E8;
      block[4] = self;
      block[5] = v4;
      dispatch_sync((dispatch_queue_t)v5, block);
    }
  }
}

uint64_t __58__WiFiCloudSyncEngineCore_synchronizeAndCallMergeNetworks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayMergeNetworks:", *(_QWORD *)(a1 + 40));
}

- (void)queryKeychainSyncState
{
  uint64_t v3;
  OS_dispatch_queue *v4;
  _QWORD block[12];

  block[11] = *MEMORY[0x24BDAC8D0];
  if (-[WiFiCloudSyncEngineCore context](self, "context"))
  {
    v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WiFiCloudSyncEngineIsRunning() != 0);
    if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
      -[WiFiCloudSyncEngineCore performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_relayKeychainSyncState_, -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"), v3, 1);
    if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      v4 = -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__WiFiCloudSyncEngineCore_queryKeychainSyncState__block_invoke;
      block[3] = &unk_24D23E4E8;
      block[4] = self;
      block[5] = v3;
      dispatch_sync((dispatch_queue_t)v4, block);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    _os_log_send_and_compose_impl();
  }
}

uint64_t __49__WiFiCloudSyncEngineCore_queryKeychainSyncState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relayKeychainSyncState:", *(_QWORD *)(a1 + 40));
}

- (void)relayKeychainSyncState:(id)a3
{
  void *v5;
  NSThread *v6;
  OS_dispatch_queue *current_queue;
  int *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = -[WiFiCloudSyncEngineCore context](self, "context");
  if (a3)
    LODWORD(a3) = objc_msgSend(a3, "BOOLValue");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
    v12 = 2080;
    v13 = "WiFiCloudSyncEngineCore.m";
    v14 = 1024;
    v15 = 737;
    v16 = 1024;
    v17 = (int)a3;
    LODWORD(v9) = 34;
    v8 = &v10;
    _os_log_send_and_compose_impl();
  }
  if (-[WiFiCloudSyncEngineCore clientThread](self, "clientThread", v8, v9))
  {
    v6 = (NSThread *)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    if (v6 != -[WiFiCloudSyncEngineCore clientThread](self, "clientThread"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v10 = 136315650;
      v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
      v12 = 2080;
      v13 = "WiFiCloudSyncEngineCore.m";
      v14 = 1024;
      v15 = 740;
LABEL_13:
      _os_log_send_and_compose_impl();
      return;
    }
  }
  if (-[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
  {
    current_queue = (OS_dispatch_queue *)dispatch_get_current_queue();
    if (current_queue != -[WiFiCloudSyncEngineCore clientQueue](self, "clientQueue"))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      v10 = 136315650;
      v11 = "-[WiFiCloudSyncEngineCore relayKeychainSyncState:]";
      v12 = 2080;
      v13 = "WiFiCloudSyncEngineCore.m";
      v14 = 1024;
      v15 = 745;
      goto LABEL_13;
    }
  }
  if ((_DWORD)a3)
    WiFiCloudSyncEngineStartEngine((uint64_t)v5);
  else
    WiFiCloudSyncEngineStopEngine((uint64_t)v5);
}

- (NSUbiquitousKeyValueStore)keyValueStore
{
  return self->keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
  self->keyValueStore = (NSUbiquitousKeyValueStore *)a3;
}

- (void)context
{
  return self->context;
}

- (void)setContext:(void *)a3
{
  self->context = a3;
}

- (void)callback
{
  return self->callback;
}

- (void)setCallback:(void *)a3
{
  self->callback = a3;
}

- (NSThread)clientThread
{
  return self->clientThread;
}

- (void)setClientThread:(id)a3
{
  self->clientThread = (NSThread *)a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->clientQueue;
}

- (void)setClientQueue:(id)a3
{
  self->clientQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)iCloudSyncingEnabled
{
  return self->iCloudSyncingEnabled;
}

- (void)setICloudSyncingEnabled:(BOOL)a3
{
  self->iCloudSyncingEnabled = a3;
}

- (BOOL)isKVSEncrypted
{
  return self->isKVSEncrypted;
}

- (void)setIsKVSEncrypted:(BOOL)a3
{
  self->isKVSEncrypted = a3;
}

@end
