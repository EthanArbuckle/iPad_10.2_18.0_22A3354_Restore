@implementation AnalyticsReader

- (AnalyticsReader)initWithAnalyticsStore:(id)a3
{
  id v5;
  AnalyticsReader *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AnalyticsReader;
  v6 = -[AnalyticsReader init](&v15, sel_init);
  if (v6)
  {
    if (v5)
    {
      objc_msgSend(v5, "persistenceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "persistenceManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "persistenceCoordinator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_storeStrong((id *)&v6->_managedObjectHandler, a3);
          -[AnalyticsReader managedObjectHandler](v6, "managedObjectHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "persistenceManager");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject persistenceCoordinator](v11, "persistenceCoordinator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSManagedObjectContext setPersistentStoreCoordinator:](v6->_backgroundReadingMOC, "setPersistentStoreCoordinator:", v12);

LABEL_6:
          goto LABEL_7;
        }
        WALogCategoryDefaultHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
          v18 = 1024;
          v19 = 47;
          v14 = "%{public}s::%d:persistenceCoordinator nil";
          goto LABEL_14;
        }
LABEL_15:
        v10 = v6;
        v6 = 0;
        goto LABEL_6;
      }
      WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
      v18 = 1024;
      v19 = 46;
      v14 = "%{public}s::%d:persistenceManager nil";
    }
    else
    {
      WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsReader initWithAnalyticsStore:]";
      v18 = 1024;
      v19 = 45;
      v14 = "%{public}s::%d:storeMOHandler nil managedObjectHandler";
    }
LABEL_14:
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    goto LABEL_15;
  }
LABEL_7:

  return v6;
}

- (id)neighborsForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__AnalyticsReader_neighborsForBSS_ssid___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __40__AnalyticsReader_neighborsForBSS_ssid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446466;
      v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      v19 = 1024;
      v20 = 74;
      v15 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446466;
      v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      v19 = 1024;
      v20 = 75;
      v15 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446722;
      v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
      v19 = 1024;
      v20 = 80;
      v21 = 2112;
      v22 = v2;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v17, 0x1Cu);
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "neighborBSSIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v17 = 136447234;
    v18 = "-[AnalyticsReader neighborsForBSS:ssid:]_block_invoke";
    v19 = 1024;
    v20 = 84;
    v21 = 2112;
    v22 = v2;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborBSSIDs for bssid[%@] ssid[%@] : %@", (uint8_t *)&v17, 0x30u);
  }

LABEL_7:
}

- (id)neighborChannelsForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__AnalyticsReader_neighborChannelsForBSS_ssid___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __47__AnalyticsReader_neighborChannelsForBSS_ssid___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  NSObject *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 136446466;
    v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
    v17 = 1024;
    v18 = 103;
    v13 = "%{public}s::%d:bssid nil";
LABEL_12:
    _os_log_impl(&dword_212581000, v2, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x12u);
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 136446466;
    v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
    v17 = 1024;
    v18 = 104;
    v13 = "%{public}s::%d:ssid nil";
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v6, 0, "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v15 = 136447234;
      v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
      v17 = 1024;
      v18 = 112;
      v19 = 2112;
      v20 = v2;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborChannels for bssid[%@] ssid[%@] : %@", (uint8_t *)&v15, 0x30u);
    }

    v2 = v6;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136446722;
      v16 = "-[AnalyticsReader neighborChannelsForBSS:ssid:]_block_invoke";
      v17 = 1024;
      v18 = 109;
      v19 = 2112;
      v20 = v2;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v15, 0x1Cu);
    }

  }
LABEL_7:

}

- (int64_t)rssiRoamTriggerForBSS:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__AnalyticsReader_rssiRoamTriggerForBSS_ssid___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __46__AnalyticsReader_rssiRoamTriggerForBSS_ssid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 129;
      v11 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 130;
      v11 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 135;
      v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v12, 0x1Cu);
    }
    goto LABEL_14;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)objc_msgSend(v6, "roamTriggerRssi");
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v12 = 136447234;
    v13 = "-[AnalyticsReader rssiRoamTriggerForBSS:ssid:]_block_invoke";
    v14 = 1024;
    v15 = 139;
    v16 = 2112;
    v17 = v2;
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:triggerRssi for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v12, 0x30u);
  }

LABEL_7:
}

- (int64_t)autoLeaveRssiForBss:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__AnalyticsReader_autoLeaveRssiForBss_ssid___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __44__AnalyticsReader_autoLeaveRssiForBss_ssid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446466;
      v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      v15 = 1024;
      v16 = 157;
      v11 = "%{public}s::%d:bssid nil";
LABEL_14:
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x12u);
    }
LABEL_15:
    v2 = 0;
LABEL_16:

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446466;
      v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      v15 = 1024;
      v16 = 158;
      v11 = "%{public}s::%d:ssid nil";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446722;
      v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      v15 = 1024;
      v16 = 163;
      v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v13, 0x1Cu);
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "isEdgeForLeave") & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)objc_msgSend(v6, "autoLeaveRssi");
    WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v13 = 136447234;
      v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      v15 = 1024;
      v16 = 169;
      v17 = 2112;
      v18 = v2;
      v19 = 2112;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:autoLeaveRssi for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v13, 0x30u);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446722;
      v14 = "-[AnalyticsReader autoLeaveRssiForBss:ssid:]_block_invoke";
      v15 = 1024;
      v16 = 165;
      v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid:%@ is not an edgeBSS for leave", (uint8_t *)&v13, 0x1Cu);
    }

  }
LABEL_9:

}

- (unint64_t)manualLeaveCountForBss:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__AnalyticsReader_manualLeaveCountForBss_ssid___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __47__AnalyticsReader_manualLeaveCountForBss_ssid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 187;
      v11 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 188;
      v11 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446722;
      v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
      v14 = 1024;
      v15 = 193;
      v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v12, 0x1Cu);
    }
    goto LABEL_14;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)objc_msgSend(v6, "disUsrForcedInWeakRssiCount");
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v12 = 136447234;
    v13 = "-[AnalyticsReader manualLeaveCountForBss:ssid:]_block_invoke";
    v14 = 1024;
    v15 = 197;
    v16 = 2112;
    v17 = v2;
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:manualLeaveCount for bssid[%@] ssid[%@] : %ld", (uint8_t *)&v12, 0x30u);
  }

LABEL_7:
}

- (BOOL)parsedBeaconInfoIsStored:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  AnalyticsReader *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__AnalyticsReader_parsedBeaconInfoIsStored_ssid___block_invoke;
  v13[3] = &unk_24CDDCD70;
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v16 = self;
  v17 = &v18;
  objc_msgSend(v9, "performBlockAndWait:", v13);

  LOBYTE(self) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)self;
}

void __49__AnalyticsReader_parsedBeaconInfoIsStored_ssid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      v13 = 1024;
      v14 = 216;
      v10 = "%{public}s::%d:bssid nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x12u);
    }
LABEL_13:
    v2 = 0;
LABEL_14:

    v6 = 0;
    v8 = 1;
    goto LABEL_6;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      v13 = 1024;
      v14 = 217;
      v10 = "%{public}s::%d:ssid nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend((id)objc_opt_class(), "formattedMACAddressNotation:octetCount:", *(_QWORD *)(a1 + 32), 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446722;
      v12 = "-[AnalyticsReader parsedBeaconInfoIsStored:ssid:]_block_invoke";
      v13 = 1024;
      v14 = 222;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", (uint8_t *)&v11, 0x1Cu);
    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "parsedBeacon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = 0;
LABEL_6:
    v7 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  }

}

- (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 count:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;
  id v20;
  AnalyticsReader *v21;
  uint64_t *v22;
  uint64_t *v23;
  double v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__AnalyticsReader_isNetworkWithinRangeOfLocation_range_location_count___block_invoke;
  v18[3] = &unk_24CDDE728;
  v14 = v10;
  v19 = v14;
  v15 = v11;
  v24 = a4;
  v20 = v15;
  v21 = self;
  v22 = &v29;
  v23 = &v25;
  objc_msgSend(v13, "performBlockAndWait:", v18);

  if (a6)
    *a6 = v26[3];
  v16 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

void __71__AnalyticsReader_isNetworkWithinRangeOfLocation_range_location_count___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = *(double *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = +[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:](GeoTagMO, "isNetworkWithinRangeOfLocation:range:location:moc:count:", v2, v3, v6, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, v4);

      goto LABEL_4;
    }
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446466;
      v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
      v15 = 1024;
      v16 = 245;
      v12 = "%{public}s::%d:location nil";
      goto LABEL_14;
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446466;
      v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
      v15 = 1024;
      v16 = 244;
      v12 = "%{public}s::%d:ssid nil";
LABEL_14:
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x12u);
    }
  }

LABEL_4:
  WALogCategoryDefaultHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v9 = "IS";
    else
      v9 = "NOT";
    v10 = *(_QWORD *)(a1 + 72);
    v13 = 136447234;
    v14 = "-[AnalyticsReader isNetworkWithinRangeOfLocation:range:location:count:]_block_invoke";
    v15 = 1024;
    v16 = 250;
    v17 = 2112;
    v18 = v8;
    v19 = 2080;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ %s within %f of given location", (uint8_t *)&v13, 0x30u);
  }

}

- (id)copyGeoTagsForNetwork:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  AnalyticsReader *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__AnalyticsReader_copyGeoTagsForNetwork_location___block_invoke;
  v14[3] = &unk_24CDDCD70;
  v10 = v6;
  v15 = v10;
  v11 = v7;
  v16 = v11;
  v17 = self;
  v18 = &v19;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __50__AnalyticsReader_copyGeoTagsForNetwork_location___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[6];
  _QWORD v59[6];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BYTE v67[18];
  _BYTE v68[128];
  uint64_t v69;

  v1 = a1;
  v69 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136446466;
    v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
    v62 = 1024;
    v63 = 267;
    v47 = "%{public}s::%d:ssid nil";
    goto LABEL_35;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GeoTagMO geoTagsForNetwork:moc:](GeoTagMO, "geoTagsForNetwork:moc:", v2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (!v7)
      goto LABEL_27;
    v8 = v7;
    v9 = *(_QWORD *)v55;
    v53 = v6;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        if (v11)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v10), "latitude");
          if (v12 == 0.0
            || (objc_msgSend(v11, "longitude"), v13 == 0.0)
            || (objc_msgSend(v11, "date"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
          {
            WALogCategoryDefaultHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              goto LABEL_16;
            objc_msgSend(v11, "latitude");
            v16 = v15;
            objc_msgSend(v11, "longitude");
            v18 = v17;
            objc_msgSend(v11, "date");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136447234;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            v62 = 1024;
            v63 = 279;
            v64 = 2048;
            v65 = v16;
            v66 = 2048;
            *(_QWORD *)v67 = v18;
            *(_WORD *)&v67[8] = 2112;
            *(_QWORD *)&v67[10] = v19;
            _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.latitude %f  geoTag.longitude %f geoTag.date %@", buf, 0x30u);
            goto LABEL_13;
          }
          objc_msgSend(v11, "bss");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v11, "bss");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "channel"))
            {
              objc_msgSend(v11, "bss");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "bssid");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                v26 = objc_alloc(MEMORY[0x24BDBFA78]);
                objc_msgSend(v11, "latitude");
                v28 = v27;
                objc_msgSend(v11, "longitude");
                v14 = objc_msgSend(v26, "initWithLatitude:longitude:", v28, v29);
                -[NSObject distanceFromLocation:](v14, "distanceFromLocation:", *(_QWORD *)(a1 + 40));
                v31 = v30;
                objc_msgSend(v11, "bss");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (int)objc_msgSend(v32, "channel") < 15;

                v58[0] = CFSTR("bssid");
                objc_msgSend(v11, "bss");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "bssid");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v59[0] = v50;
                v58[1] = CFSTR("is5Ghz");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v59[1] = v49;
                v58[2] = CFSTR("date");
                objc_msgSend(v11, "date");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v59[2] = v48;
                v58[3] = CFSTR("latitude");
                v34 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v11, "latitude");
                objc_msgSend(v34, "numberWithDouble:");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v59[3] = v35;
                v58[4] = CFSTR("longitude");
                v36 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v11, "longitude");
                objc_msgSend(v36, "numberWithDouble:");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v59[4] = v37;
                v58[5] = CFSTR("distance");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)v31);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v59[5] = v38;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 6);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                v6 = v53;
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v39);

                goto LABEL_16;
              }
            }
            else
            {

            }
          }
          WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "bss");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "bss");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "channel");
            objc_msgSend(v11, "bss");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "bssid");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136447234;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            v62 = 1024;
            v63 = 284;
            v64 = 2112;
            v65 = v19;
            v66 = 1024;
            *(_DWORD *)v67 = v41;
            *(_WORD *)&v67[4] = 2112;
            *(_QWORD *)&v67[6] = v43;
            _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.bss  %@ geoTag.bss.channel %d geoTag.bss.bssid %@", buf, 0x2Cu);

            v6 = v53;
LABEL_13:

          }
        }
        else
        {
          WALogCategoryDefaultHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
            v62 = 1024;
            v63 = 274;
            _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
          }
        }
LABEL_16:

        ++v10;
      }
      while (v8 != v10);
      v44 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      v8 = v44;
      if (!v44)
      {
LABEL_27:

        v1 = a1;
        goto LABEL_28;
      }
    }
  }
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v61 = "-[AnalyticsReader copyGeoTagsForNetwork:location:]_block_invoke";
    v62 = 1024;
    v63 = 268;
    v47 = "%{public}s::%d:location nil";
LABEL_35:
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, v47, buf, 0x12u);
  }
LABEL_28:

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "count"))
  {
    v45 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = 0;

  }
}

- (id)copyNetworksAvailableAtLocationWithinDistanceInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  AnalyticsReader *v16;
  uint64_t *v17;
  double v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__AnalyticsReader_copyNetworksAvailableAtLocationWithinDistanceInBand_distance_band___block_invoke;
  v14[3] = &unk_24CDDE750;
  v11 = v8;
  v18 = a4;
  v19 = a5;
  v15 = v11;
  v16 = self;
  v17 = &v20;
  objc_msgSend(v10, "performBlockAndWait:", v14);

  v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __85__AnalyticsReader_copyNetworksAvailableAtLocationWithinDistanceInBand_distance_band___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v1 = a1;
  v58 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
      v49 = 1024;
      v50 = 319;
      _os_log_impl(&dword_212581000, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
    }
    v7 = 0;
    goto LABEL_30;
  }
  v3 = *(double *)(a1 + 56);
  v4 = *(unsigned int *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:](GeoTagMO, "geoTagsAtLocationInBand:distance:band:moc:", v2, v4, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_21;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v38 = v7;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (!v8)
    goto LABEL_20;
  v9 = v8;
  v10 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v42 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      if (v12)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "bss");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v12, "bss");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "network");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v12, "bss");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "network");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "ssid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v45[0] = CFSTR("ssid");
              objc_msgSend(v12, "bss");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "network");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "ssid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v45[1] = CFSTR("authFlags");
              v46[0] = v23;
              v24 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v12, "bss");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "network");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "numberWithInt:", objc_msgSend(v26, "authFlags"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v46[1] = v27;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
              v28 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v28);
              goto LABEL_18;
            }
          }
          else
          {

          }
        }
        WALogCategoryDefaultHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "bss");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bss");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "network");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bss");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "network");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "ssid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136447234;
          v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
          v49 = 1024;
          v50 = 331;
          v51 = 2112;
          v52 = v29;
          v53 = 2112;
          v54 = v31;
          v55 = 2112;
          v56 = v34;
          _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil - geoTag.bss  %@ geoTag.bss.network %@ geoTag.bss.network.ssid %@", buf, 0x30u);

        }
      }
      else
      {
        WALogCategoryDefaultHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
          v49 = 1024;
          v50 = 326;
          _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
        }
      }
LABEL_18:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  }
  while (v9);
LABEL_20:

  v7 = v38;
LABEL_21:
  v1 = a1;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count", v38))
  {
    WALogCategoryDefaultHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "-[AnalyticsReader copyNetworksAvailableAtLocationWithinDistanceInBand:distance:band:]_block_invoke";
      v49 = 1024;
      v50 = 341;
      _os_log_impl(&dword_212581000, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:No networks", buf, 0x12u);
    }
LABEL_30:

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 40), "count"))
  {
    v35 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = 0;

  }
}

- (id)copyScoreSortedNetworksAvailableAtLocationWithinDistance:(id)a3 distance:(double)a4 authComparator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  AnalyticsReader *v19;
  _QWORD *v20;
  uint64_t *v21;
  double v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__44;
  v25[4] = __Block_byref_object_dispose__45;
  v10 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke;
  v23[3] = &unk_24CDDE778;
  v11 = v9;
  v24 = v11;
  v26 = (id)MEMORY[0x212BEF618](v23);
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_55;
  v17[3] = &unk_24CDDE7C8;
  v14 = v8;
  v22 = a4;
  v18 = v14;
  v19 = self;
  v20 = v25;
  v21 = &v27;
  objc_msgSend(v13, "performBlockAndWait:", v17);

  v15 = (id)v28[5];
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&v27, 8);
  return v15;
}

uint64_t __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _BYTE v35[20];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v3 = -1;
  else
    v3 = a3 != 0;
  if (a2 && a3)
  {
    v6 = a3;
    v7 = a2;
    objc_msgSend(v7, "objectForKey:", CFSTR("score"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("score"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("ssid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("ssid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("authFlags"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("authFlags"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("geoTagDate"));
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("geoTagDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
      v30 = 1024;
      v31 = 379;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      *(_QWORD *)v35 = v13;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_INFO, "%{public}s::%d:Comparing %@ %@", buf, 0x26u);
    }

    if (v9 == v11)
    {
      WALogCategoryDefaultHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447490;
        v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
        v30 = 1024;
        v31 = 382;
        v32 = 2112;
        v33 = v12;
        v34 = 1024;
        *(_DWORD *)v35 = v15;
        *(_WORD *)&v35[4] = 2112;
        *(_QWORD *)&v35[6] = v13;
        *(_WORD *)&v35[14] = 1024;
        *(_DWORD *)&v35[16] = v17;
        _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_INFO, "%{public}s::%d:Using security type as tie breaker between %@ (%d) and %@ (%d)", buf, 0x32u);
      }

      v21 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v22 = (void *)v27;
      if (v21 == -1)
      {
        v3 = 1;
      }
      else if (v21 == 1)
      {
        v3 = -1;
      }
      else
      {
        WALogCategoryDefaultHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136447490;
          v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          v30 = 1024;
          v31 = 391;
          v32 = 2112;
          v33 = v12;
          v34 = 2112;
          *(_QWORD *)v35 = v27;
          *(_WORD *)&v35[8] = 2112;
          *(_QWORD *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2112;
          v36 = (uint64_t)v18;
          _os_log_impl(&dword_212581000, v25, OS_LOG_TYPE_INFO, "%{public}s::%d:Using last geotag date as tie breaker between %@ (%@) and %@ (%@)", buf, 0x3Au);
        }

        v3 = objc_msgSend(v18, "compare:", v27);
      }
    }
    else
    {
      WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v9 >= v11)
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447490;
          v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          v30 = 1024;
          v31 = 399;
          v32 = 2112;
          v33 = v12;
          v34 = 2048;
          *(_QWORD *)v35 = v9;
          *(_WORD *)&v35[8] = 2112;
          *(_QWORD *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2048;
          v36 = v11;
          _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_INFO, "%{public}s::%d:%@ (%lld) > %@ (%lld)", buf, 0x3Au);
        }

        v3 = -1;
      }
      else
      {
        if (v24)
        {
          *(_DWORD *)buf = 136447490;
          v29 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke";
          v30 = 1024;
          v31 = 396;
          v32 = 2112;
          v33 = v12;
          v34 = 2048;
          *(_QWORD *)v35 = v9;
          *(_WORD *)&v35[8] = 2112;
          *(_QWORD *)&v35[10] = v13;
          *(_WORD *)&v35[18] = 2048;
          v36 = v11;
          _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_INFO, "%{public}s::%d:%@ (%lld) < %@ (%lld)", buf, 0x3Au);
        }

        v3 = 1;
      }
      v22 = (void *)v27;
    }

  }
  return v3;
}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_55(uint64_t a1)
{
  uint64_t v1;
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _QWORD v65[2];
  _QWORD v66[2];
  uint8_t v67[128];
  uint8_t v68[4];
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  uint64_t v73;
  _BYTE buf[32];
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[4];
  _QWORD v78[4];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__6;
  v63 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v64 = (id)objc_claimAutoreleasedReturnValue();
  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
  {
    WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompa"
                           "rator:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 410;
      _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
    }
    v44 = 0;
    v29 = 0;
    goto LABEL_36;
  }
  v2 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:](GeoTagMO, "geoTagsAtLocationInBand:distance:band:moc:", v1, 0, v4, v2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
LABEL_33:
    v29 = 0;
    goto LABEL_34;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v44;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
  if (!v5)
    goto LABEL_18;
  v6 = *(_QWORD *)v56;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v56 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      if (v8)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "bss");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v8, "bss");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "network");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (!v13)
            {
              objc_msgSend(v8, "bss");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "network");
              v15 = objc_claimAutoreleasedReturnValue();

              -[NSObject ssid](v15, "ssid");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "managedObjectContext");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = +[NetworkMO getTotalScore:moc:](NetworkMO, "getTotalScore:moc:", v16, v18);

              v77[0] = CFSTR("ssid");
              -[NSObject ssid](v15, "ssid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v78[0] = v20;
              v77[1] = CFSTR("authFlags");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSObject authFlags](v15, "authFlags"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v78[1] = v21;
              v77[2] = CFSTR("geoTagDate");
              objc_msgSend(v8, "date");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v78[2] = v22;
              v77[3] = CFSTR("score");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v78[3] = v23;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v45, "addObject:", v24);
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
      }
      WALogCategoryDefaultHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCom"
                             "parator:]_block_invoke";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 417;
        _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag/geoTag.date nil or geoTag.bss nil or geoTag.bss.network nil", buf, 0x12u);
      }
LABEL_16:

    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
  }
  while (v5);
LABEL_18:

  if (!v45)
    goto LABEL_33;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__6;
  v75 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v76 = v25;
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_58;
  v54[3] = &unk_24CDDE7A0;
  v54[4] = buf;
  objc_msgSend(v45, "enumerateObjectsUsingBlock:", v54);
  WALogCategoryDefaultHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v68 = 136446722;
    v69 = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authComparator:]_block_invoke_2";
    v70 = 1024;
    v71 = 439;
    v72 = 2112;
    v73 = v28;
    _os_log_impl(&dword_212581000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Unsorted networks: %@", v68, 0x1Cu);
  }

  objc_msgSend(v45, "sortedArrayUsingComparator:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(buf, 8);

  if (v29 && objc_msgSend(v29, "count"))
  {
    v53[0] = v26;
    v53[1] = 3221225472;
    v53[2] = __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_62;
    v53[3] = &unk_24CDDE7A0;
    v53[4] = &v59;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v53);
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v60[5];
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompa"
                           "rator:]_block_invoke_2";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 452;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v31;
      _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Score sorted networks: %@", buf, 0x1Cu);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v46 = v29;
    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v50 != v33)
            objc_enumerationMutation(v46);
          v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v35, "objectForKey:", CFSTR("ssid"), v44);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKey:", CFSTR("authFlags"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "intValue");

          v65[1] = CFSTR("authFlags");
          v66[0] = v36;
          v65[0] = CFSTR("ssid");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v39;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v40);
        }
        v32 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
      }
      while (v32);
    }

    v29 = 0;
    v44 = obj;
    v41 = v46;
    goto LABEL_36;
  }
LABEL_34:
  WALogCategoryDefaultHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[AnalyticsReader copyScoreSortedNetworksAvailableAtLocationWithinDistance:distance:authCompara"
                         "tor:]_block_invoke";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 445;
    _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:No score sorted networks", buf, 0x12u);
  }
LABEL_36:

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v43 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = 0;

  }
  _Block_object_dispose(&v59, 8);

}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_58(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("ssid"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("authFlags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  objc_msgSend(v3, "objectForKey:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  objc_msgSend(v3, "objectForKey:", CFSTR("geoTagDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendFormat:", CFSTR("%@ {%d, %lld, %@}, "), v9, v5, v7, v8);
}

void __100__AnalyticsReader_copyScoreSortedNetworksAvailableAtLocationWithinDistance_distance_authComparator___block_invoke_62(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("ssid"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("authFlags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  objc_msgSend(v3, "objectForKey:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");
  objc_msgSend(v3, "objectForKey:", CFSTR("geoTagDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendFormat:", CFSTR("%@ {%d, %lld, %@}, "), v9, v5, v7, v8);
}

- (id)copyPreferenceScoreDictionaryForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  AnalyticsReader *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__AnalyticsReader_copyPreferenceScoreDictionaryForNetwork___block_invoke;
  v10[3] = &unk_24CDDCD20;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __59__AnalyticsReader_copyPreferenceScoreDictionaryForNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v23 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "ssid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithLongLong:", +[NetworkMO getTotalScore:moc:](NetworkMO, "getTotalScore:moc:", v25, v24));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isMoving"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isOmnipresent"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v5, "switchedAwayFromCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v5, "switchedToCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "authFlags") != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isTCPGood"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isLongTermNetwork"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v23, "initWithObjectsAndKeys:", v22, CFSTR("TotalScore"), v21, CFSTR("isMoving"), v20, CFSTR("isOmniPresent"), v7, CFSTR("switchedAwayFromCount"), v8, CFSTR("switchedToCount"), v9, CFSTR("isSecured"), v10, CFSTR("isTCPGood"), v11, CFSTR("isLongTermNetwork"), 0);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      v28 = "-[AnalyticsReader copyPreferenceScoreDictionaryForNetwork:]_block_invoke";
      v29 = 1024;
      v30 = 479;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
    }

  }
  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      v17 = "available";
    else
      v17 = "NOT available";
    *(_DWORD *)buf = 136446978;
    v28 = "-[AnalyticsReader copyPreferenceScoreDictionaryForNetwork:]_block_invoke";
    v29 = 1024;
    v30 = 493;
    v31 = 2112;
    v32 = v16;
    v33 = 2080;
    v34 = v17;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ prefscores: %s", buf, 0x26u);
  }

}

- (BOOL)isMovingNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AnalyticsReader *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__AnalyticsReader_isMovingNetwork___block_invoke;
  v9[3] = &unk_24CDDCD20;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  LOBYTE(self) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __35__AnalyticsReader_isMovingNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isMoving");
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136446722;
      v12 = "-[AnalyticsReader isMovingNetwork:]_block_invoke";
      v13 = 1024;
      v14 = 506;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }

  }
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v8 = "Moving";
    else
      v8 = "NOT Moving";
    v11 = 136446978;
    v12 = "-[AnalyticsReader isMovingNetwork:]_block_invoke";
    v13 = 1024;
    v14 = 511;
    v15 = 2112;
    v16 = v7;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }

}

- (BOOL)isOmnipresentNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AnalyticsReader *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__AnalyticsReader_isOmnipresentNetwork___block_invoke;
  v9[3] = &unk_24CDDCD20;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  LOBYTE(self) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __40__AnalyticsReader_isOmnipresentNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isOmnipresent");
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136446722;
      v12 = "-[AnalyticsReader isOmnipresentNetwork:]_block_invoke";
      v13 = 1024;
      v14 = 524;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }

  }
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v8 = "Omnipresent";
    else
      v8 = "NOT Omnipresent";
    v11 = 136446978;
    v12 = "-[AnalyticsReader isOmnipresentNetwork:]_block_invoke";
    v13 = 1024;
    v14 = 529;
    v15 = 2112;
    v16 = v7;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }

}

- (BOOL)isHistoricallyBadLinkQualityNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  AnalyticsReader *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__AnalyticsReader_isHistoricallyBadLinkQualityNetwork___block_invoke;
  v9[3] = &unk_24CDDCD20;
  v7 = v4;
  v10 = v7;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  LOBYTE(self) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __55__AnalyticsReader_isHistoricallyBadLinkQualityNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isTCPGood") ^ 1;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136446722;
      v12 = "-[AnalyticsReader isHistoricallyBadLinkQualityNetwork:]_block_invoke";
      v13 = 1024;
      v14 = 542;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&v11, 0x1Cu);
    }

  }
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v8 = "HistoricallyBad";
    else
      v8 = "NOT HistoricallyBad";
    v11 = 136446978;
    v12 = "-[AnalyticsReader isHistoricallyBadLinkQualityNetwork:]_block_invoke";
    v13 = 1024;
    v14 = 547;
    v15 = 2112;
    v16 = v7;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ trait: %s", (uint8_t *)&v11, 0x26u);
  }

}

- (id)copyLocationsForNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  AnalyticsReader *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__AnalyticsReader_copyLocationsForNetwork___block_invoke;
  v10[3] = &unk_24CDDCD20;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __43__AnalyticsReader_copyLocationsForNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GeoTagMO geoTagsForNetwork:moc:](GeoTagMO, "geoTagsForNetwork:moc:", v2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v11)
          {
            v12 = objc_alloc(MEMORY[0x24BDBFA78]);
            objc_msgSend(v11, "latitude");
            v14 = v13;
            objc_msgSend(v11, "longitude");
            v16 = objc_msgSend(v12, "initWithLatitude:longitude:", v14, v15);
            if (v16)
            {
              v17 = v16;
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v16);
            }
            else
            {
              WALogCategoryDefaultHandle();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
                v28 = 1024;
                v29 = 572;
                _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:location nil", buf, 0x12u);
              }

              v17 = 0;
            }
          }
          else
          {
            WALogCategoryDefaultHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
              v28 = 1024;
              v29 = 566;
              _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
            }
          }

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[AnalyticsReader copyLocationsForNetwork:]_block_invoke";
      v28 = 1024;
      v29 = 560;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;

  }
}

- (id)copyAllStoredNetworkSsids
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__AnalyticsReader_copyAllStoredNetworkSsids__block_invoke;
  v7[3] = &unk_24CDDDEF0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__AnalyticsReader_copyAllStoredNetworkSsids__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO allStoredSsids:](NetworkMO, "allStoredSsids:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136446466;
      v10 = "-[AnalyticsReader copyAllStoredNetworkSsids]_block_invoke";
      v11 = 1024;
      v12 = 595;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs", (uint8_t *)&v9, 0x12u);
    }

  }
}

- (id)copyAllStoredNetworkSsidsWithTrait:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__AnalyticsReader_copyAllStoredNetworkSsidsWithTrait___block_invoke;
  v9[3] = &unk_24CDDE7F0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__AnalyticsReader_copyAllStoredNetworkSsidsWithTrait___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[NetworkMO copyAllSsidsWithTrait:trait:](NetworkMO, "copyAllSsidsWithTrait:trait:", v3, *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 136446722;
      v11 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithTrait:]_block_invoke";
      v12 = 1024;
      v13 = 611;
      v14 = 2048;
      v15 = v9;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs with trait: %lu", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (id)copyAllStoredNetworkSsidsWithColocatedScopeId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  AnalyticsReader *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__AnalyticsReader_copyAllStoredNetworkSsidsWithColocatedScopeId___block_invoke;
  v10[3] = &unk_24CDDE818;
  v7 = v4;
  v12 = self;
  v13 = &v14;
  v11 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __65__AnalyticsReader_copyAllStoredNetworkSsidsWithColocatedScopeId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[NetworkMO copyAllSsidsWithColocatedScopeIdStr:moc:](NetworkMO, "copyAllSsidsWithColocatedScopeIdStr:moc:", v2, v4);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446466;
      v13 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithColocatedScopeId:]_block_invoke";
      v14 = 1024;
      v15 = 624;
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:colocatedScopeIdStr nil", (uint8_t *)&v12, 0x12u);
    }

  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 136446722;
      v13 = "-[AnalyticsReader copyAllStoredNetworkSsidsWithColocatedScopeId:]_block_invoke";
      v14 = 1024;
      v15 = 630;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No known network SSIDs for colocatedScopeIdStr:%@", (uint8_t *)&v12, 0x1Cu);
    }

  }
}

- (id)copyColocatedScopeIdForSsid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  AnalyticsReader *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__AnalyticsReader_copyColocatedScopeIdForSsid___block_invoke;
  v10[3] = &unk_24CDDCD20;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v8 = (void *)objc_msgSend((id)v15[5], "copy");
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__AnalyticsReader_copyColocatedScopeIdForSsid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446466;
      v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
      v23 = 1024;
      v24 = 646;
      v17 = "%{public}s::%d:ssid nil";
      v18 = v16;
      v19 = 18;
LABEL_12:
      _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, v19);
    }
LABEL_13:

    v5 = 0;
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = 136446722;
      v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
      v23 = 1024;
      v24 = 649;
      v25 = 2112;
      v26 = v20;
      v17 = "%{public}s::%d:networkMO nil for ssid %@";
      v18 = v16;
      v19 = 28;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v5, "colocatedScopeId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
LABEL_5:
  WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v21 = 136446978;
    v22 = "-[AnalyticsReader copyColocatedScopeIdForSsid:]_block_invoke";
    v23 = 1024;
    v24 = 658;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ colocatedScopeIdStr: %@", (uint8_t *)&v21, 0x26u);
  }

}

- (id)copyColocatedScopeTransitionInfo:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  AnalyticsReader *v23;
  uint64_t *v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = 0;
  -[AnalyticsReader managedObjectHandler](self, "managedObjectHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __79__AnalyticsReader_copyColocatedScopeTransitionInfo_bssid_minRssi_maxRssi_band___block_invoke;
  v20[3] = &unk_24CDDE840;
  v16 = v12;
  v21 = v16;
  v17 = v13;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v22 = v17;
  v23 = self;
  v24 = &v28;
  objc_msgSend(v15, "performBlockAndWait:", v20);

  v18 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __79__AnalyticsReader_copyColocatedScopeTransitionInfo_bssid_minRssi_maxRssi_band___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  const char *v25;
  id v26;
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int128 v48;
  const __CFString *v49;
  _QWORD v50[4];

  v50[3] = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      v32 = 1024;
      v33 = 676;
      v25 = "%{public}s::%d:ssid nil";
LABEL_16:
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
    }
LABEL_17:
    v11 = 0;
    v10 = 0;
    v9 = 0;
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      v32 = 1024;
      v33 = 677;
      v25 = "%{public}s::%d:bssid nil";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v4 = *(unsigned int *)(a1 + 64);
  v5 = *(unsigned int *)(a1 + 68);
  v6 = *(unsigned int *)(a1 + 72);
  v27 = 0;
  v28 = 0;
  v26 = 0;
  objc_msgSend(*(id *)(a1 + 48), "managedObjectHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = +[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:transitionBssid:transitionRssi:authFlags:moc:](ScanMO, "getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:transitionBssid:transitionRssi:authFlags:moc:", v2, v3, v4, v5, v6, &v28, &v27, &v29, &v26, v8);
  v9 = v28;
  v10 = v27;
  v11 = v26;

  if (!(_DWORD)v4)
    goto LABEL_7;
  v48 = WADeviceAnalyticsNetworkTransitionInfo;
  v50[0] = v9;
  v50[1] = v10;
  v49 = CFSTR("authFlags");
  v50[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v48, 3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v19 = *(_DWORD *)(a1 + 64);
    v18 = *(_DWORD *)(a1 + 68);
    *(_DWORD *)buf = 136448258;
    v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
    v32 = 1024;
    v33 = 692;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    v38 = 1024;
    v39 = v29;
    v40 = 2112;
    v41 = v16;
    v42 = 2112;
    v43 = v17;
    v44 = 1024;
    v45 = v18;
    v46 = 1024;
    v47 = v19;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Results contains %@[%@ (%d)] for %@[%@] in [%d,%d)", buf, 0x4Cu);
  }
LABEL_6:

LABEL_7:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = *(void **)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v24 = *(_DWORD *)(a1 + 64);
      v23 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 136447490;
      v31 = "-[AnalyticsReader copyColocatedScopeTransitionInfo:bssid:minRssi:maxRssi:band:]_block_invoke";
      v32 = 1024;
      v33 = 697;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v22;
      v38 = 1024;
      v39 = v23;
      v40 = 1024;
      LODWORD(v41) = v24;
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Nothing to transition away from %@[%@] in [%d,%d)", buf, 0x32u);
    }

  }
}

- (id)copyNetworkUsageDictionary:(id)a3
{
  return -[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:](self, "_copyNetworkUsageDictionaryWithMOC:moc:", a3, 0);
}

- (id)_copyNetworkUsageDictionaryWithMOC:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    -[AnalyticsReader backgroundReadingMOC](self, "backgroundReadingMOC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__AnalyticsReader__copyNetworkUsageDictionaryWithMOC_moc___block_invoke;
  v13[3] = &unk_24CDDCD20;
  v9 = v6;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v10, "performBlockAndWait:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __58__AnalyticsReader__copyNetworkUsageDictionaryWithMOC_moc___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24CE01C50, &unk_24CE01C68, &unk_24CE01C80, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  if (!v3)
  {
    WALogCategoryDefaultHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 136446466;
    v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
    v50 = 1024;
    v51 = 725;
    v36 = "%{public}s::%d:ssid nil";
    v37 = v30;
    v38 = 18;
    goto LABEL_27;
  }
  +[NetworkMO getInstance:moc:](NetworkMO, "getInstance:moc:", v3, a1[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v40 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = v2;
    obj = v2;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (!v8)
      goto LABEL_17;
    v9 = v8;
    v10 = *(_QWORD *)v44;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(obj);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "unsignedIntegerValue");
        v13 = (void *)MEMORY[0x212BEF45C]();
        v14 = +[JoinMO joinCount:bssid:maxAgeInDays:success:moc:](JoinMO, "joinCount:bssid:maxAgeInDays:success:moc:", a1[4], 0, v12, 1, a1[5]);
        v15 = +[JoinMO joinCount:bssid:maxAgeInDays:success:moc:](JoinMO, "joinCount:bssid:maxAgeInDays:success:moc:", a1[4], 0, v12, 0, a1[5]);
        switch(v12)
        {
          case 30:
            v26 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("joinSuccessCountInLastMonth"));

            v28 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v28;
            v21 = v19;
            v22 = CFSTR("joinFailCountInLastMonth");
            break;
          case 7:
            v23 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setValue:forKey:", v24, CFSTR("joinSuccessCountInLastWeek"));

            v25 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v25;
            v21 = v19;
            v22 = CFSTR("joinFailCountInLastWeek");
            break;
          case 1:
            v16 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("joinSuccessCountInLastDay"));

            v18 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v18;
            v21 = v19;
            v22 = CFSTR("joinFailCountInLastDay");
            break;
          default:
            goto LABEL_15;
        }
        objc_msgSend(v20, "setValue:forKey:", v21, v22);

LABEL_15:
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (!v9)
      {
LABEL_17:

        v29 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        v30 = v40;
        -[NSObject ssid](v40, "ssid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setValue:forKey:", v31, CFSTR("ssid"));

        v32 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSObject authFlags](v40, "authFlags"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setValue:forKey:", v33, CFSTR("authFlags"));

        v2 = v41;
        goto LABEL_18;
      }
    }
  }
  WALogCategoryDefaultHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v39 = a1[4];
    *(_DWORD *)buf = 136446722;
    v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
    v50 = 1024;
    v51 = 728;
    v52 = 2112;
    v53 = v39;
    v36 = "%{public}s::%d:networkMO nil for ssid %@";
    v37 = v30;
    v38 = 28;
LABEL_27:
    _os_log_impl(&dword_212581000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
  }
LABEL_18:

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    WALogCategoryDefaultHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = a1[4];
      *(_DWORD *)buf = 136446722;
      v49 = "-[AnalyticsReader _copyNetworkUsageDictionaryWithMOC:moc:]_block_invoke";
      v50 = 1024;
      v51 = 829;
      v52 = 2112;
      v53 = v35;
      _os_log_impl(&dword_212581000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No usage info for %@", buf, 0x1Cu);
    }

  }
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectHandler, a3);
}

- (NSManagedObjectContext)backgroundReadingMOC
{
  return self->_backgroundReadingMOC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundReadingMOC, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end
