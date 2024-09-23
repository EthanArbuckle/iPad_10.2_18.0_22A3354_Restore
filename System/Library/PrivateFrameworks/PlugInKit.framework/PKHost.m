@implementation PKHost

- (void)discoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *activity;
  _QWORD block[4];
  id v16;
  PKHost *v17;
  id v18;
  id v19;
  unint64_t v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  activity = _os_activity_create(&dword_1AF254000, "discovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF25740C;
  block[3] = &unk_1E5F40BE8;
  v16 = v8;
  v17 = self;
  v19 = v9;
  v20 = a4;
  v18 = v10;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  os_activity_apply(activity, block);

}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 56, 1);
}

- (NSMapTable)discoveryMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (PKDaemonClient)daemon
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 48, 1);
}

- (id)rewriteDiscoveryAttributes:(id)a3 flags:(unint64_t)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  int v22;
  const __CFString *v23;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NSExtensionPointName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v8)
    {
LABEL_22:

      v4 = v25;
      goto LABEL_23;
    }
    v9 = *(_QWORD *)v28;
    v10 = CFSTR("com.apple.version");
    v11 = CFSTR("NSExtensionIdentifier");
LABEL_6:
    v12 = 0;
    if (v8 <= 1)
      v13 = 1;
    else
      v13 = v8;
    v26 = v13;
    while (1)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v7);
      v18 = *(__CFString **)(*((_QWORD *)&v27 + 1) + 8 * v12);
      if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.identifier")))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v6;
        v16 = v14;
        v17 = v11;
      }
      else
      {
        if (!-[__CFString isEqualToString:](v18, "isEqualToString:", v10))
        {
          v19 = v9;
          v20 = v11;
          v21 = v10;
          v22 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("com.apple.protocol"));
          objc_msgSend(v7, "objectForKeyedSubscript:", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            v23 = CFSTR("NSExtensionPointName");
          else
            v23 = v18;
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v23);
          v10 = v21;
          v11 = v20;
          v9 = v19;
          v13 = v26;
          goto LABEL_12;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v6;
        v16 = v14;
        v17 = CFSTR("NSExtensionVersion");
      }
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v17);
LABEL_12:

      if (v13 == ++v12)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (!v8)
          goto LABEL_22;
        goto LABEL_6;
      }
    }
  }
  v6 = v4;
LABEL_23:

  return v6;
}

- (OS_dispatch_queue)hostQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (id)continuouslyDiscoverPlugInsForAttributes:(id)a3 flags:(unint64_t)a4 found:(id)a5
{
  id v8;
  id v9;
  PKDiscoveryDriver *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PKDiscoveryDriver initWithAttributes:flags:host:report:]([PKDiscoveryDriver alloc], "initWithAttributes:flags:host:report:", v9, a4, self, v8);

  -[PKDiscoveryDriver performWithPreviousResults:forceNotify:](v10, "performWithPreviousResults:forceNotify:", 0, 1);
  return v10;
}

+ (id)defaultHost
{
  if (qword_1ECDD6FF0 != -1)
    dispatch_once(&qword_1ECDD6FF0, &unk_1E5F404B8);
  return (id)qword_1ECDD6FE8;
}

- (void)setHostQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setDiscoveryMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setDaemon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setActivePlugIns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setActiveOneShots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PKHost)init
{
  PKDaemonClient *v3;
  void *v4;
  PKHost *v5;

  v3 = -[PKDaemonClient initWithServiceName:]([PKDaemonClient alloc], "initWithServiceName:", 0);
  v4 = (void *)objc_opt_new();
  v5 = -[PKHost initWithDaemon:externalProviders:](self, "initWithDaemon:externalProviders:", v3, v4);

  return v5;
}

- (PKHost)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6;
  id v7;
  PKHost *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKHost;
  v8 = -[PKHost init](&v15, sel_init);
  if (v8)
  {
    +[PKCapabilities frameworkQueueAttr](PKCapabilities, "frameworkQueueAttr");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("host", v9);
    -[PKHost setHostQueue:](v8, "setHostQueue:", v10);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHost setActivePlugIns:](v8, "setActivePlugIns:", v11);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHost setActiveOneShots:](v8, "setActiveOneShots:", v12);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKHost setDiscoveryMap:](v8, "setDiscoveryMap:", v13);

    -[PKHost setDaemon:](v8, "setDaemon:", v6);
    objc_storeStrong((id *)&v8->_external, a4);
  }

  return v8;
}

- (void)findPlugInByUUID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PKHost daemon](self, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF2636A4;
  v10[3] = &unk_1E5F40B70;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "findPlugInByUUID:reply:", v7, v10);

}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PKHost daemon](self, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF263B10;
  v10[3] = &unk_1E5F40B70;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "findPlugInByPathURL:reply:", v7, v10);

}

- (void)cancelPlugInDiscovery:(id)a3
{
  MEMORY[0x1E0DE7D20](a3, sel_cancel);
}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 extensions:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v9 = a6;
  v10 = a3;
  -[PKHost daemon](self, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1AF2645C8;
  v13[3] = &unk_1E5F40C10;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "accessPlugIns:synchronously:flags:reply:", v10, v6, 0, v13);

}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 environment:(id)a5 languages:(id)a6 persona:(id)a7 sandbox:(id)a8 ready:(id)a9
{
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  -[PKHost daemon](self, "daemon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1AF26475C;
  v24[3] = &unk_1E5F40C38;
  v24[4] = self;
  v25 = v16;
  v23 = v16;
  objc_msgSend(v22, "readyPlugIns:synchronously:flags:environment:languages:persona:sandbox:reply:", v21, v13, 0, v20, v19, v18, v17, v24);

}

- (void)setElection:(int64_t)a3 forPlugIn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("election"));

  objc_msgSend(v6, "bootInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("bootuuid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "annotationTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("timestamp"));

  -[PKHost daemon](self, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPluginAnnotations:annotations:reply:", v13, v7, &unk_1E5F405D8);

}

- (void)setExtensionState:(id)a3 forPlugIn:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA70];
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("extension"));
  objc_msgSend(v8, "bootInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("bootuuid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "annotationTimestamp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("timestamp"));

  -[PKHost daemon](self, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPluginAnnotations:annotations:reply:", v14, v9, &unk_1E5F40C78);

}

- (id)activePlugInForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("activePlugInForIdentifier: nil not allowed"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1AF263944;
  v16 = sub_1AF263954;
  v17 = 0;
  -[PKHost hostQueue](self, "hostQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF264CEC;
  block[3] = &unk_1E5F40B48;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)activatePlugIn:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  SEL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1AF263944;
  v18 = sub_1AF263954;
  v19 = 0;
  -[PKHost hostQueue](self, "hostQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF264E7C;
  v10[3] = &unk_1E5F40CA0;
  v10[4] = self;
  v11 = v5;
  v12 = &v14;
  v13 = a2;
  v7 = v5;
  dispatch_sync(v6, v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)deactivatePlugIn:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  PKHost *v10;
  SEL v11;

  v5 = a3;
  -[PKHost hostQueue](self, "hostQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF265304;
  block[3] = &unk_1E5F40CC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_sync(v6, block);

}

- (NSDictionary)hostInfoPlist
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF26569C;
  block[3] = &unk_1E5F40678;
  block[4] = self;
  if (qword_1EEE376A0 != -1)
    dispatch_once(&qword_1EEE376A0, block);
  return self->_hostInfoPlist;
}

- (NSMutableDictionary)activePlugIns
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)activeOneShots
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_hostQueue, 0);
  objc_storeStrong((id *)&self->_discoveryMap, 0);
  objc_storeStrong((id *)&self->_activeOneShots, 0);
  objc_storeStrong((id *)&self->_activePlugIns, 0);
  objc_storeStrong((id *)&self->_hostInfoPlist, 0);
}

@end
