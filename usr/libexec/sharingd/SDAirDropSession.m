@implementation SDAirDropSession

- (SDAirDropSession)initWithPerson:(__SFNode *)a3 items:(id)a4 sandboxExtensions:(id)a5
{
  id v9;
  id v10;
  SDAirDropSession *v11;
  NSMutableArray *v12;
  NSMutableArray *airDropClients;
  uint64_t v14;
  NSProgress *conversionProgress;
  NSMutableArray *v16;
  NSMutableArray *currentNames;
  uint64_t v18;
  NSDictionary *discoveryMetrics;
  uint64_t Copy;
  NSProgress *progress;
  NSMutableDictionary *v22;
  NSMutableDictionary *properties;
  NSMutableDictionary *v24;
  NSMutableDictionary *results;
  uint64_t v26;
  uint64_t v27;
  NSString *rootNodeName;
  NSMutableArray *v29;
  NSMutableArray *sandboxExtensionHandles;
  void *v31;
  NSMutableArray *v32;
  NSMutableArray *siblingNodes;
  NSProgress *v34;
  NSProgress *transferProgress;
  objc_super v37;

  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SDAirDropSession;
  v11 = -[SDAirDropSession init](&v37, "init");
  if (v11)
  {
    v12 = objc_opt_new(NSMutableArray);
    airDropClients = v11->_airDropClients;
    v11->_airDropClients = v12;

    v11->_clientPid = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 0));
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v14;

    v16 = objc_opt_new(NSMutableArray);
    currentNames = v11->_currentNames;
    v11->_currentNames = v16;

    objc_storeWeak((id *)&v11->_delegate, 0);
    v18 = objc_claimAutoreleasedReturnValue(+[SDAirDropDiscoveryLogger discoverabilityMetricsForNode:](SDAirDropDiscoveryLogger, "discoverabilityMetricsForNode:", a3));
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)v18;

    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1;
    Copy = SFNodeCreateCopy(0, a3);
    progress = v11->_progress;
    v11->_person = (__SFNode *)Copy;
    v11->_progress = 0;

    v22 = objc_opt_new(NSMutableDictionary);
    properties = v11->_properties;
    v11->_properties = v22;

    v24 = objc_opt_new(NSMutableDictionary);
    results = v11->_results;
    v11->_results = v24;

    v27 = SFNodeCopyRealName(a3, v26);
    rootNodeName = v11->_rootNodeName;
    v11->_rootNodeName = (NSString *)v27;

    objc_storeStrong((id *)&v11->_sandboxExtensions, a5);
    v29 = objc_opt_new(NSMutableArray);
    sandboxExtensionHandles = v11->_sandboxExtensionHandles;
    v11->_sandboxExtensionHandles = v29;

    v31 = (void *)SFNodeCopySiblingNodes(a3);
    v32 = (NSMutableArray *)objc_msgSend(v31, "mutableCopy");
    siblingNodes = v11->_siblingNodes;
    v11->_siblingNodes = v32;

    v34 = (NSProgress *)objc_alloc_init((Class)NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v34;

  }
  return v11;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", a4);
}

- (void)consumeSandboxExtensions
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSMutableArray *sandboxExtensionHandles;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_sandboxExtensions, "allValues"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 67109378;
    v19 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8));
        v10 = sandbox_extension_consume(objc_msgSend(v9, "bytes"));
        if (v10 < 0)
        {
          v13 = airdrop_log(v10);
          v12 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v14 = *__error();
            *(_DWORD *)buf = v19;
            v25 = v14;
            v26 = 2112;
            v27 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "sandbox_extension_consume failed with error %d for tokenData \"%@\", buf, 0x12u);
          }
        }
        else
        {
          sandboxExtensionHandles = self->_sandboxExtensionHandles;
          v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
          -[NSMutableArray addObject:](sandboxExtensionHandles, "addObject:", v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }
  v15 = -[NSMutableArray count](self->_sandboxExtensionHandles, "count", v19);
  if (v15)
  {
    v16 = airdrop_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[NSMutableArray count](self->_sandboxExtensionHandles, "count");
      *(_DWORD *)buf = 67109120;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Consumed %d sandbox extensions", buf, 8u);
    }

  }
}

- (void)releaseSandboxExtensions
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sandboxExtensionHandles;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        sandbox_extension_release(objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "integerValue", (_QWORD)v7));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)start
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __SFNode *person;
  void *v9;
  NSMutableArray *siblingNodes;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  __SFNode *v25;

  v3 = (OS_os_transaction *)os_transaction_create("SDAirDropSession");
  transaction = self->_transaction;
  self->_transaction = v3;

  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    v25 = person;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start AirDrop session with %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.sharingd.AirDropTransferInitiated"), 0);

  -[SDAirDropSession consumeSandboxExtensions](self, "consumeSandboxExtensions");
  siblingNodes = self->_siblingNodes;
  if (siblingNodes)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = siblingNodes;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          -[SDAirDropSession addClientForNode:shouldPublishProgress:](self, "addClientForNode:shouldPublishProgress:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15), 0, (_QWORD)v19);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.AirDropChanged"), 0);

    -[SDAirDropSession serversChanged:](self, "serversChanged:", 0);
    -[SDAirDropSession postNotificationForTransferStatus:progress:](self, "postNotificationForTransferStatus:progress:", 11, 0.0);
  }
  else
  {
    -[SDAirDropSession addClientForNode:shouldPublishProgress:](self, "addClientForNode:shouldPublishProgress:", self->_person, 1);
  }
  if (!-[NSMutableArray count](self->_airDropClients, "count", (_QWORD)v19))
  {
    v17 = airdrop_log(0);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No session clients started at the moment, most likely we have not discovered the node over Bonjour yet", buf, 2u);
    }

  }
}

- (BOOL)send
{
  NSMutableArray *v2;
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_airDropClients;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "send", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)serversChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSMutableArray *currentNames;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "airDropNodesForDomain:", CFSTR("local")));

  v20 = (void *)SFNodeCopyComputerName(self->_person);
  v6 = (void *)SFNodeCopyContactIdentifiers(self->_person);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_siblingNodes, "objectAtIndexedSubscript:", 0));
    v8 = sub_10004E380((uint64_t)v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (sub_10004E26C(v14))
        {
          v15 = (void *)SFNodeCopyComputerName(v14);
          if (!objc_msgSend(v15, "isEqualToString:", v20))
            goto LABEL_14;
        }
        else
        {
          v17 = sub_10004E380(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if (!objc_msgSend(v15, "intersectsSet:", v6))
            goto LABEL_14;
        }
        currentNames = self->_currentNames;
        v19 = (void *)SFNodeCopyRealName(v14, v16);
        LOBYTE(currentNames) = -[NSMutableArray containsObject:](currentNames, "containsObject:", v19);

        if ((currentNames & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_siblingNodes, "addObject:", v14);
          -[SDAirDropSession addClientForNode:shouldPublishProgress:](self, "addClientForNode:shouldPublishProgress:", v14, 0);
        }
LABEL_14:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

}

- (void)addClientForNode:(__SFNode *)a3 shouldPublishProgress:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  SDAirDropClient *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  NSMutableArray *currentNames;
  uint64_t v25;
  void *v26;
  _OWORD v27[2];
  uint8_t buf[4];
  __SFNode *v29;

  v4 = a4;
  v7 = (void *)SFNodeCopyKinds(a3);
  v8 = objc_msgSend(v7, "containsObject:", kSFNodeKindRapport);
  v9 = (int)v8;
  v10 = airdrop_log(v8);
  v11 = (SDAirDropClient *)objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "SDAirDropSession: skip Rapport node %@", buf, 0xCu);
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "Start session client for %@", buf, 0xCu);
    }

    v11 = -[SDAirDropClient initWithPerson:items:forDiscovery:]([SDAirDropClient alloc], "initWithPerson:items:forDiscovery:", a3, self->_items, 0);
    v13 = kSFOperationFileIconKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFileIconKey));
    -[SDAirDropClient setProperty:forKey:](v11, "setProperty:forKey:", v14, v13);

    v15 = kSFOperationSessionIDKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
    -[SDAirDropClient setProperty:forKey:](v11, "setProperty:forKey:", v16, v15);

    v17 = kSFOperationSmallFileIconKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSmallFileIconKey));
    -[SDAirDropClient setProperty:forKey:](v11, "setProperty:forKey:", v18, v17);

    v19 = kSFOperationItemsDescriptionKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationItemsDescriptionKey));
    -[SDAirDropClient setProperty:forKey:](v11, "setProperty:forKey:", v20, v19);

    v21 = kSFOperationFromShareSheet;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationFromShareSheet));
    -[SDAirDropClient setProperty:forKey:](v11, "setProperty:forKey:", v22, v21);

    v23 = *(_OWORD *)&self->_auditToken.val[4];
    v27[0] = *(_OWORD *)self->_auditToken.val;
    v27[1] = v23;
    -[SDAirDropClient setAuditToken:](v11, "setAuditToken:", v27);
    -[SDAirDropClient setClientBundleID:](v11, "setClientBundleID:", self->_clientBundleID);
    -[SDAirDropClient setDiscoveryMetrics:](v11, "setDiscoveryMetrics:", self->_discoveryMetrics);
    -[SDAirDropClient setShouldPublishProgress:](v11, "setShouldPublishProgress:", v4);
    if (self->_clientPid)
      -[SDAirDropClient setClientPid:](v11, "setClientPid:");
    -[SDAirDropClient setDelegate:](v11, "setDelegate:", self);
    -[SDAirDropClient activate](v11, "activate");
    -[NSMutableArray addObject:](self->_airDropClients, "addObject:", v11);
    currentNames = self->_currentNames;
    v26 = (void *)SFNodeCopyRealName(a3, v25);
    -[NSMutableArray addObject:](currentNames, "addObject:", v26);

  }
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  __SFNode *person;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *airDropClients;
  NSMutableArray *currentNames;
  SDAirDropClient *responseClient;
  OS_os_transaction *transaction;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  __SFNode *v22;

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    v22 = person;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop AirDrop session with %@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_airDropClients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10), "invalidate", (_QWORD)v16);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.AirDropChanged"), 0);

  airDropClients = self->_airDropClients;
  self->_airDropClients = 0;

  currentNames = self->_currentNames;
  self->_currentNames = 0;

  responseClient = self->_responseClient;
  self->_responseClient = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)dealloc
{
  objc_super v3;

  if (self->_conversionObserver)
    -[NSProgress removeObserver:forKeyPath:](self->_conversionProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
  -[SDAirDropSession releaseSandboxExtensions](self, "releaseSandboxExtensions");
  -[NSProgress _unpublish](self->_progress, "_unpublish");
  CFRelease(self->_person);
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropSession;
  -[SDAirDropSession dealloc](&v3, "dealloc");
}

- (void)removeClientAlerts
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  SDAirDropClient *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_airDropClients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(SDAirDropClient **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7);
        if (v8 != self->_responseClient)
          -[SDAirDropClient invalidate](v8, "invalidate", (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  NSProgress *progress;
  void *v17;
  double v18;
  SDAirDropSession *v19;
  uint64_t v20;
  id WeakRetained;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_signpost_id_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  os_signpost_id_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSProgress *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;

  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = objc_msgSend(v11, "addEntriesFromDictionary:", self->_results);
  if (a4 == 7)
  {
LABEL_2:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationBytesCopiedKey));
    -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", objc_msgSend(v13, "longLongValue"));

    LODWORD(v13) = self->_hadConversion;
    -[NSProgress fractionCompleted](self->_transferProgress, "fractionCompleted");
    v15 = v14 * 100.0;
    if ((_DWORD)v13)
      v15 = v15 * 0.8 + 20.0;
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)v15);
    progress = self->_progress;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationTimeRemainingKey));
    -[NSProgress setUserInfoObject:forKey:](progress, "setUserInfoObject:forKey:", v17, NSProgressEstimatedTimeRemainingKey);

    v18 = (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
    v19 = self;
    v20 = 7;
  }
  else
  {
    v22 = airdrop_log(v12);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      sub_100018174(a4, (uint64_t)v11, v23);

    switch(a4)
    {
      case 3:
        if (self->_conversionActive)
          goto LABEL_6;
        self->_allowedWaiting = 1;
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2);
        v18 = 0.0;
        v19 = self;
        v20 = 3;
        break;
      case 4:
        objc_storeStrong((id *)&self->_responseClient, a3);
        -[SDAirDropSession removeClientAlerts](self, "removeClientAlerts");
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 4);
        v18 = 0.0;
        v19 = self;
        v20 = 4;
        break;
      case 5:
        objc_storeStrong((id *)&self->_responseClient, a3);
        -[SDAirDropSession removeClientAlerts](self, "removeClientAlerts");
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          -[NSProgress removeObserver:forKeyPath:](self->_conversionProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
        }
        if (self->_hadConversion)
          v25 = 20;
        else
          v25 = 0;
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v25);
        v26 = airdrop_log(-[NSProgress cancel](self->_conversionProgress, "cancel"));
        v27 = objc_claimAutoreleasedReturnValue(v26);
        v28 = os_signpost_id_make_with_pointer(v27, self);

        v29 = kSFOperationTotalBytesKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationTotalBytesKey));
        v31 = (uint64_t)objc_msgSend(v30, "longLongValue");

        v33 = airdrop_log(v32);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        v35 = v34;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, v28, "TransferTime", ", (uint8_t *)&v56, 2u);
        }

        v37 = airdrop_log(v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        v39 = v38;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          v56 = 134349056;
          v57 = 102400 * (v31 / 102400);
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v28, "TransferTimeBytes", "totalBytes=%{public, signpost.telemetry:number1}lld", (uint8_t *)&v56, 0xCu);
        }

        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v29));
        -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", objc_msgSend(v40, "longLongValue"));

        -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", 0);
        *(_WORD *)&self->_conversionActive = 0;
        goto LABEL_6;
      case 7:
        goto LABEL_2;
      case 9:
        v41 = airdrop_log(v24);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        v43 = os_signpost_id_make_with_pointer(v42, self);

        v45 = airdrop_log(v44);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        v47 = v46;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, v43, "TransferTime", " enableTelemetry=YES ", (uint8_t *)&v56, 2u);
        }

        v49 = airdrop_log(v48);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        v51 = v50;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_INTERVAL_END, v43, "TransferTimeBytes", " enableTelemetry=YES ", (uint8_t *)&v56, 2u);
        }

        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 6);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](self->_progress, "sf_personRealName"));

        if (!v52)
          goto LABEL_6;
        v18 = 0.0;
        v19 = self;
        v20 = 9;
        break;
      case 10:
        v53 = self->_progress;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kSFOperationErrorKey));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedDescription"));
        -[NSProgress sf_failedWithError:](v53, "sf_failedWithError:", v55);

        v18 = 0.0;
        v19 = self;
        v20 = 10;
        break;
      case 11:
        if (self->_conversionActive)
          goto LABEL_6;
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2);
        v18 = 0.0;
        v19 = self;
        v20 = 11;
        break;
      case 15:
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 1);
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 0);
        goto LABEL_6;
      default:
        goto LABEL_6;
    }
  }
  -[SDAirDropSession postNotificationForTransferStatus:progress:](v19, "postNotificationForTransferStatus:progress:", v20, v18);
LABEL_6:
  self->_lastEvent = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "airDropSession:event:withResults:", self, a4, v11);

}

- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4
{
  void *v6;
  NSProgress *progress;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  progress = self->_progress;
  if (progress)
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](progress, "sf_personRealName"));
  else
    v8 = self->_rootNodeName;
  v9 = v8;
  v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
  v11 = (void *)v10;
  if (self->_siblingNodes)
  {
    if (v6)
      v12 = v9 == 0;
    else
      v12 = 1;
    if (!v12 && v10 != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v17[0] = CFSTR("TransferProgress");
      v17[1] = CFSTR("RealName");
      v18[0] = v6;
      v18[1] = v9;
      v18[2] = v11;
      v17[2] = CFSTR("SessionID");
      v17[3] = CFSTR("TransferText");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3));
      v18[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("TransferUpdated"), self, v16);

    }
  }

}

- (void)startProgress
{
  NSString *v3;
  void *v4;
  id v5;
  NSProgress *v6;
  NSProgress *progress;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  if (!self->_progress && self->_clientBundleID)
  {
    v3 = self->_rootNodeName;
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationSessionIDKey));
      if (v4)
      {
        location = 0;
        objc_initWeak(&location, self);
        v5 = objc_alloc((Class)NSProgress);
        v6 = (NSProgress *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sf_initWithAppBundle:sessionID:andPersonRealName:", self->_clientBundleID, v4, v3));
        progress = self->_progress;
        self->_progress = v6;

        -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 100);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100017C84;
        v10[3] = &unk_100714468;
        objc_copyWeak(&v12, &location);
        v11 = v4;
        -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v10);
        -[NSProgress _publish](self->_progress, "_publish");

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else
      {
        v8 = airdrop_log(0);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_10001821C(v9);

      }
    }

  }
}

- (void)handleConversionProgress:(id)a3
{
  NSProgress *conversionProgress;
  NSProgress *v5;
  NSProgress *v6;
  id v7;

  v7 = a3;
  conversionProgress = self->_conversionProgress;
  if (!conversionProgress)
  {
    v5 = (NSProgress *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 0));
    v6 = self->_conversionProgress;
    self->_conversionProgress = v5;

    conversionProgress = self->_conversionProgress;
  }
  self->_conversionActive = 1;
  -[NSProgress setTotalUnitCount:](conversionProgress, "setTotalUnitCount:", (char *)-[NSProgress totalUnitCount](conversionProgress, "totalUnitCount") + 100);
  -[NSProgress addChild:withPendingUnitCount:](self->_conversionProgress, "addChild:withPendingUnitCount:", v7, 100);
  if (!self->_conversionObserver && !self->_allowedWaiting)
  {
    self->_conversionObserver = 1;
    -[NSProgress addObserver:forKeyPath:options:context:](self->_conversionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, 0);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  NSProgress *conversionProgress;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](NSThread, "mainThread"));

  if (v13)
  {
    v15 = objc_opt_class(NSProgress, v14);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      v16 = v11;
      v17 = v16;
      if (!self->_conversionNotified
        && (objc_msgSend(v16, "isCancelled") & 1) == 0
        && self->_conversionActive)
      {
        self->_conversionNotified = 1;
        -[SDAirDropSession airDropClient:event:withResults:](self, "airDropClient:event:withResults:", 0, 15, 0);
      }
      if ((objc_msgSend(v17, "isCancelled") & 1) == 0 && !self->_hadConversion)
      {
        objc_msgSend(v17, "fractionCompleted");
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)(v18 * 100.0 * 0.2));
        -[SDAirDropSession postNotificationForTransferStatus:progress:](self, "postNotificationForTransferStatus:progress:", 15, (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount"));
      }
      objc_msgSend(v17, "fractionCompleted");
      if (v19 == 1.0 || objc_msgSend(v17, "isCancelled"))
      {
        self->_hadConversion = 1;
        *(_WORD *)&self->_conversionActive = 0;
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          -[NSProgress removeObserver:forKeyPath:](self->_conversionProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
          conversionProgress = self->_conversionProgress;
          self->_conversionProgress = 0;

        }
      }

    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018008;
    block[3] = &unk_100714490;
    block[4] = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = a6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (SDAirDropSessionDelegate)delegate
{
  return (SDAirDropSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_siblingNodes, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_rootNodeName, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_responseClient, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_discoveryMetrics, 0);
  objc_storeStrong((id *)&self->_currentNames, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_airDropClients, 0);
}

@end
