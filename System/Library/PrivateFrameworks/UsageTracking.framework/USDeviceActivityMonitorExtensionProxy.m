@implementation USDeviceActivityMonitorExtensionProxy

- (USDeviceActivityMonitorExtensionProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  USDeviceActivityMonitorExtensionProxy *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD0C30];
  v12[0] = *MEMORY[0x24BDD0C48];
  v12[1] = v6;
  v13[0] = CFSTR("com.apple.deviceactivity.monitor-extension");
  v13[1] = a3;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[USDeviceActivityMonitorExtensionProxy initWithExtensionsMatchingAttributes:error:](self, "initWithExtensionsMatchingAttributes:error:", v9, a4);
  return v10;
}

- (USDeviceActivityMonitorExtensionProxy)initWithClientIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  USDeviceActivityMonitorExtensionProxy *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", v6, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[USDeviceActivityMonitorExtensionProxy initWithClientIdentifier:error:].cold.1((uint64_t)v6, (uint64_t)v8);
      if (a4)
        goto LABEL_5;
    }
    else if (a4)
    {
LABEL_5:
      +[USUsageTrackingBundle usageTrackingBundle](USUsageTrackingBundle, "usageTrackingBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ExtensionMatchingError"), &stru_24C7DBBC0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithFormat:locale:", v16, v18, 0);

      v20 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      v28[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("UsageTrackingErrorDomain"), 200, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      *a4 = v22;
      goto LABEL_8;
    }
    v14 = 0;
    goto LABEL_8;
  }
  v9 = *MEMORY[0x24BDD0C48];
  v26[0] = CFSTR("com.apple.deviceactivity.monitor-extension");
  v10 = *MEMORY[0x24BDD0C00];
  v25[0] = v9;
  v25[1] = v10;
  objc_msgSend(v7, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[USDeviceActivityMonitorExtensionProxy initWithExtensionsMatchingAttributes:error:](self, "initWithExtensionsMatchingAttributes:error:", v13, a4);
  v14 = self;
LABEL_8:

  return v14;
}

- (USDeviceActivityMonitorExtensionProxy)initWithExtensionsMatchingAttributes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char *v8;
  qos_class_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v22.receiver = self;
    v22.super_class = (Class)USDeviceActivityMonitorExtensionProxy;
    v8 = -[USDeviceActivityMonitorExtensionProxy init](&v22, sel_init);
    objc_storeStrong((id *)v8 + 3, v7);
    *(_OWORD *)(v8 + 8) = xmmword_20D8BC800;
    v9 = qos_class_self();
    dispatch_get_global_queue(v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v10;

  }
  else
  {

    v8 = 0;
    if (a4 && v7)
    {
      v12 = v6;
      +[USUsageTrackingBundle usageTrackingBundle](USUsageTrackingBundle, "usageTrackingBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ExtensionMatchingError"), &stru_24C7DBBC0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithFormat:locale:", v14, v16, v12);

      v18 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("UsageTrackingErrorDomain"), 200, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
      *a4 = v20;
    }
  }

  return (USDeviceActivityMonitorExtensionProxy *)v8;
}

- (void)intervalDidStartForActivity:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __82__USDeviceActivityMonitorExtensionProxy_intervalDidStartForActivity_replyHandler___block_invoke;
        v15[3] = &unk_24C7DABE0;
        v16 = v6;
        v17 = v7;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

uint64_t __82__USDeviceActivityMonitorExtensionProxy_intervalDidStartForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "intervalDidStartForActivity:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)intervalDidEndForActivity:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __80__USDeviceActivityMonitorExtensionProxy_intervalDidEndForActivity_replyHandler___block_invoke;
        v15[3] = &unk_24C7DABE0;
        v16 = v6;
        v17 = v7;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

uint64_t __80__USDeviceActivityMonitorExtensionProxy_intervalDidEndForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "intervalDidEndForActivity:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)eventDidReachThreshold:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __86__USDeviceActivityMonitorExtensionProxy_eventDidReachThreshold_activity_replyHandler___block_invoke;
        v17[3] = &unk_24C7DAC08;
        v18 = v8;
        v19 = v9;
        v20 = v10;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

uint64_t __86__USDeviceActivityMonitorExtensionProxy_eventDidReachThreshold_activity_replyHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "eventDidReachThreshold:activity:replyHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)intervalWillStartWarningForActivity:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __90__USDeviceActivityMonitorExtensionProxy_intervalWillStartWarningForActivity_replyHandler___block_invoke;
        v15[3] = &unk_24C7DABE0;
        v16 = v6;
        v17 = v7;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

uint64_t __90__USDeviceActivityMonitorExtensionProxy_intervalWillStartWarningForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "intervalWillStartWarningForActivity:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)intervalWillEndWarningForActivity:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __88__USDeviceActivityMonitorExtensionProxy_intervalWillEndWarningForActivity_replyHandler___block_invoke;
        v15[3] = &unk_24C7DABE0;
        v16 = v6;
        v17 = v7;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

uint64_t __88__USDeviceActivityMonitorExtensionProxy_intervalWillEndWarningForActivity_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "intervalWillEndWarningForActivity:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)eventWillReachThresholdWarning:(id)a3 activity:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[USDeviceActivityMonitorExtensionProxy extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __94__USDeviceActivityMonitorExtensionProxy_eventWillReachThresholdWarning_activity_replyHandler___block_invoke;
        v17[3] = &unk_24C7DAC08;
        v18 = v8;
        v19 = v9;
        v20 = v10;
        -[USDeviceActivityMonitorExtensionProxy _requestExtensionVendorProxyForExtension:proxyHandler:](self, "_requestExtensionVendorProxyForExtension:proxyHandler:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

uint64_t __94__USDeviceActivityMonitorExtensionProxy_eventWillReachThresholdWarning_activity_replyHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "eventWillReachThresholdWarning:activity:replyHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_requestExtensionVendorProxyForExtension:(id)a3 proxyHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(id, _QWORD, void *);
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[USDeviceActivityMonitorExtensionProxy timeoutInSeconds](self, "timeoutInSeconds");
  v10 = -[USDeviceActivityMonitorExtensionProxy timeoutLeewayInSeconds](self, "timeoutLeewayInSeconds");
  v11 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke;
  v45[3] = &unk_24C7DAB88;
  v12 = v6;
  v46 = v12;
  -[USDeviceActivityMonitorExtensionProxy _scheduleTimerWithIntervalInSeconds:leewayInSeconds:handler:](self, "_scheduleTimerWithIntervalInSeconds:leewayInSeconds:handler:", v9, v10, v45);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v12, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;
  -[USDeviceActivityMonitorExtensionProxy _cancelTimer:](self, "_cancelTimer:", v13);
  if (v14)
  {
    v39 = v15;
    v16 = -[USDeviceActivityMonitorExtensionProxy timeoutInSeconds](self, "timeoutInSeconds");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v19 = v17;
    v40 = v18;
    objc_msgSend(v17, "timeIntervalSinceDate:");
    v21 = v16 - (unint64_t)v20;

    v22 = objc_msgSend(v12, "pidForRequestIdentifier:", v14);
    v23 = -[USDeviceActivityMonitorExtensionProxy timeoutLeewayInSeconds](self, "timeoutLeewayInSeconds");
    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_8;
    v41[3] = &unk_24C7DAC30;
    v24 = v12;
    v42 = v24;
    v25 = v14;
    v43 = v25;
    -[USDeviceActivityMonitorExtensionProxy _scheduleTimerWithIntervalInSeconds:leewayInSeconds:extensionPID:handler:](self, "_scheduleTimerWithIntervalInSeconds:leewayInSeconds:extensionPID:handler:", v21, v23, v22, v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "_extensionContextForUUID:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_auxiliaryConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[USXPCRemoteObjectProxy synchronousProxyFromConnection:withRetryCount:proxyHandler:](USXPCRemoteObjectProxy, "synchronousProxyFromConnection:withRetryCount:proxyHandler:", v28, 1, v7);
    }
    else
    {
      +[USUsageTrackingBundle usageTrackingBundle](USUsageTrackingBundle, "usageTrackingBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ExtensionConnectionError"), &stru_24C7DBBC0, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v7;

      v30 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v30, "initWithFormat:locale:", v37, v31, v32);

      v34 = (void *)MEMORY[0x24BDD1540];
      v47 = *MEMORY[0x24BDD0FC8];
      v48[0] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("UsageTrackingErrorDomain"), 201, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2](v38, 0, v36);

      v7 = v38;
    }
    -[USDeviceActivityMonitorExtensionProxy _cancelTimer:](self, "_cancelTimer:", v26);

    v15 = v39;
    v8 = v40;
  }
  else
  {
    v7[2](v7, 0, v15);
    v26 = v13;
  }

}

uint64_t __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_cold_1(a1);
  return objc_msgSend(*(id *)(a1 + 32), "_kill:", 9);
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_8(uint64_t a1)
{
  void *v2;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_8_cold_1(a1);
  objc_msgSend(*(id *)(a1 + 32), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("DidCancelDeviceActivityMonitorExtensionRequest"), 0);

}

- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 extensionPID:(int)a5 handler:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  if ((BSPIDIsBeingDebugged() & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[USDeviceActivityMonitorExtensionProxy _scheduleTimerWithIntervalInSeconds:leewayInSeconds:handler:](self, "_scheduleTimerWithIntervalInSeconds:leewayInSeconds:handler:", a3, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_scheduleTimerWithIntervalInSeconds:(unint64_t)a3 leewayInSeconds:(unint64_t)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;

  v8 = a5;
  -[USDeviceActivityMonitorExtensionProxy timeoutQueue](self, "timeoutQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v9);

  v11 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * a4);
  dispatch_source_set_event_handler(v10, v8);

  dispatch_resume(v10);
  return v10;
}

- (void)_cancelTimer:(id)a3
{
  if (a3)
    dispatch_source_cancel((dispatch_source_t)a3);
}

- (unint64_t)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(unint64_t)a3
{
  self->_timeoutInSeconds = a3;
}

- (unint64_t)timeoutLeewayInSeconds
{
  return self->_timeoutLeewayInSeconds;
}

- (void)setTimeoutLeewayInSeconds:(unint64_t)a3
{
  self->_timeoutLeewayInSeconds = a3;
}

- (NSArray)extensions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue_global)timeoutQueue
{
  return (OS_dispatch_queue_global *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

- (void)initWithClientIdentifier:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = a2;
  _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get bundle for client %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v2, "Killing %{public}@ because it took too long to start.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

void __95__USDeviceActivityMonitorExtensionProxy__requestExtensionVendorProxyForExtension_proxyHandler___block_invoke_8_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20D894000, MEMORY[0x24BDACB70], v2, "Canceling request to %{public}@ because it exceeded its allowed time.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1();
}

@end
