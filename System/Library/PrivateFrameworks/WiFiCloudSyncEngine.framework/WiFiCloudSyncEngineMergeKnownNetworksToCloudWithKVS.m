@implementation WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS

void __WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke(uint64_t a1)
{
  unint64_t v2;
  const __CFString *v3;
  NSObject *v4;
  void *v5;
  const void *ValueAtIndex;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  int *v25;
  uint64_t v26;
  char v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (*(uint64_t *)(a1 + 56) < 1)
    goto LABEL_40;
  v27 = 0;
  v2 = 0;
  v3 = CFSTR("SSID_STR");
  v4 = MEMORY[0x24BDACB70];
  while (v2 < objc_msgSend(*(id *)(a1 + 32), "count", v25, v26))
  {
    v5 = (void *)MEMORY[0x2199D8164]();
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 64), v2);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isKVSEncrypted"))
        v8 = CFSTR("SSID");
      else
        v8 = v3;
      v9 = objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      if (!v9)
        goto LABEL_28;
      v10 = v9;
      if (objc_msgSend(*(id *)(a1 + 40), "isKVSEncrypted"))
      {
        v11 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("addedAt"));
        v12 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("network."), v10));
        if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 136315906;
            v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            v30 = 2080;
            v31 = "WiFiCloudSyncEngine.m";
            v32 = 1024;
            v33 = 1585;
            v34 = 2112;
            v35 = v10;
            LODWORD(v26) = 38;
            v25 = &v28;
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        v14 = v3;
        v15 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("removedAt"));
        v16 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("addedAt"));
        objc_msgSend(v15, "timeIntervalSinceReferenceDate");
        v18 = v17;
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        if (v18 <= v19)
        {
          objc_msgSend(v16, "timeIntervalSinceReferenceDate");
          v21 = v20;
          objc_msgSend(v11, "timeIntervalSinceReferenceDate");
          v23 = v22;
          v24 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
          v3 = v14;
          if (v21 < v23)
          {
            if (v24)
            {
              v28 = 136315906;
              v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
              v30 = 2080;
              v31 = "WiFiCloudSyncEngine.m";
              v32 = 1024;
              v33 = 1578;
              v34 = 2112;
              v35 = v10;
              LODWORD(v26) = 38;
              v25 = &v28;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_27;
          }
          if (v24)
          {
            v28 = 136315906;
            v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            v30 = 2080;
            v31 = "WiFiCloudSyncEngine.m";
            v32 = 1024;
            v33 = 1574;
            v34 = 2112;
            v35 = v10;
            LODWORD(v26) = 38;
            v25 = &v28;
            goto LABEL_36;
          }
        }
        else
        {
          v3 = v14;
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 136315906;
            v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            v30 = 2080;
            v31 = "WiFiCloudSyncEngine.m";
            v32 = 1024;
            v33 = 1570;
            v34 = 2112;
            v35 = v10;
            LODWORD(v26) = 38;
            v25 = &v28;
LABEL_36:
            _os_log_send_and_compose_impl();
          }
        }
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v10)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v28 = 136315906;
            v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
            v30 = 2080;
            v31 = "WiFiCloudSyncEngine.m";
            v32 = 1024;
            v33 = 1599;
            v34 = 2112;
            v35 = v10;
            LODWORD(v26) = 38;
            v25 = &v28;
LABEL_26:
            _os_log_send_and_compose_impl();
          }
LABEL_27:
          __WiFiCloudSyncEngineAddNetworkToCloudAndPurge(*(_QWORD *)(a1 + 72), *(void **)(a1 + 40), ValueAtIndex, 0);
          v27 = 1;
          goto LABEL_28;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 136315906;
          v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
          v30 = 2080;
          v31 = "WiFiCloudSyncEngine.m";
          v32 = 1024;
          v33 = 1595;
          v34 = 2112;
          v35 = v10;
          LODWORD(v26) = 38;
          v25 = &v28;
          goto LABEL_17;
        }
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315650;
      v29 = "WiFiCloudSyncEngineMergeKnownNetworksToCloudWithKVS_block_invoke";
      v30 = 2080;
      v31 = "WiFiCloudSyncEngine.m";
      v32 = 1024;
      v33 = 1548;
      LODWORD(v26) = 28;
      v25 = &v28;
LABEL_17:
      _os_log_send_and_compose_impl();
    }
LABEL_28:
    objc_autoreleasePoolPop(v5);
    if ((int64_t)++v2 >= *(_QWORD *)(a1 + 56))
      break;
  }
  if ((v27 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "synchronizeKVS");
LABEL_40:
  CFRelease(*(CFTypeRef *)(a1 + 64));
}

@end
