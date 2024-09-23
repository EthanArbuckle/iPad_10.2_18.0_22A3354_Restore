@implementation SDNodeBrowser

- (SDNodeBrowser)initWithNode:(__SFNode *)a3 protocol:(id)a4 flags:(unint64_t)a5 kind:(id)a6
{
  id v10;
  id v11;
  SDNodeBrowser *v12;
  SDNodeBrowser *v13;
  SDNodeCoalescer *v14;
  SDNodeCoalescer *nodeCoalescer;
  SDAirDropDiscoveryLogger *airDropDiscoveryLogger;
  CUCoalescer *coalescer;
  OS_xpc_object *connection;
  NSMutableSet *odiskDomains;
  NSMutableSet *airDropDomains;
  NSMutableSet *bonjourDomains;
  SDDomainBrowser *domainBrowser;
  SDManagedBrowser *managedBrowser;
  SDClassroomBrowser *classroomBrowser;
  SDWorkgroupBrowser *workgroupBrowser;
  SDConnectedBrowser *connectedBrowser;
  SDSharePointBrowser *sharePointBrowser;
  NSMutableDictionary *managedURLTable;
  NSMutableDictionary *commentHashTable;
  NSMutableSet *windowsWorkgroups;
  NSMutableDictionary *originalNodes;
  uint64_t v32;
  SDStatusMonitor *monitor;
  uint64_t v34;
  NSArray *protocols;
  NSMutableDictionary *contactIdentifierMap;
  uint64_t v37;
  uint64_t v38;
  NSMutableDictionary *v39;
  NSMutableDictionary *cachedFakeMeasurements;
  objc_super v42;

  v10 = a4;
  v11 = a6;
  v42.receiver = self;
  v42.super_class = (Class)SDNodeBrowser;
  v12 = -[SDNodeBrowser init](&v42, "init");
  v13 = v12;
  if (v12)
  {
    v12->_mode = 0;
    objc_storeStrong((id *)&v12->_kind, a6);
    v14 = objc_alloc_init(SDNodeCoalescer);
    nodeCoalescer = v13->_nodeCoalescer;
    v13->_nodeCoalescer = v14;

    airDropDiscoveryLogger = v13->_airDropDiscoveryLogger;
    v13->_airDropDiscoveryLogger = 0;

    v13->_startTime = 0.0;
    v13->_shouldCollectNodeCoalescerMetrics = 1;
    coalescer = v13->_coalescer;
    v13->_coalescer = 0;

    connection = v13->_connection;
    v13->_connection = 0;

    objc_storeStrong((id *)&v13->_protocol, a4);
    odiskDomains = v13->_odiskDomains;
    v13->_odiskDomains = 0;

    airDropDomains = v13->_airDropDomains;
    v13->_airDropDomains = 0;

    bonjourDomains = v13->_bonjourDomains;
    v13->_bonjourDomains = 0;

    domainBrowser = v13->_domainBrowser;
    v13->_domainBrowser = 0;

    managedBrowser = v13->_managedBrowser;
    v13->_managedBrowser = 0;

    classroomBrowser = v13->_classroomBrowser;
    v13->_classroomBrowser = 0;

    workgroupBrowser = v13->_workgroupBrowser;
    v13->_workgroupBrowser = 0;

    connectedBrowser = v13->_connectedBrowser;
    v13->_connectedBrowser = 0;

    sharePointBrowser = v13->_sharePointBrowser;
    v13->_sharePointBrowser = 0;

    managedURLTable = v13->_managedURLTable;
    v13->_managedURLTable = 0;

    commentHashTable = v13->_commentHashTable;
    v13->_commentHashTable = 0;

    v13->_combineWorkgroups = 0;
    windowsWorkgroups = v13->_windowsWorkgroups;
    v13->_windowsWorkgroups = 0;

    originalNodes = v13->_originalNodes;
    v13->_originalNodes = 0;

    v13->_error = 0;
    objc_storeStrong((id *)&v13->_queue, &_dispatch_main_q);
    v13->_parent = (__SFNode *)CFRetain(a3);
    v32 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    monitor = v13->_monitor;
    v13->_monitor = (SDStatusMonitor *)v32;

    v34 = SFNodeCopyProtocols(a3);
    protocols = v13->_protocols;
    v13->_protocols = (NSArray *)v34;

    contactIdentifierMap = v13->_contactIdentifierMap;
    v13->_contactIdentifierMap = 0;

    if (IsAppleInternalBuild(v37, v38))
    {
      v13->_showAllKnownPeopleInMagicHead = sub_1000CE8D0(CFSTR("ShowKnownInMagicHead"), 0) != 0;
      v39 = objc_opt_new(NSMutableDictionary);
      cachedFakeMeasurements = v13->_cachedFakeMeasurements;
      v13->_cachedFakeMeasurements = v39;

    }
  }

  return v13;
}

- (void)dealloc
{
  __SFNode *parent;
  objc_super v4;

  -[SDNodeBrowser stop](self, "stop");
  parent = self->_parent;
  if (parent)
    CFRelease(parent);
  v4.receiver = self;
  v4.super_class = (Class)SDNodeBrowser;
  -[SDNodeBrowser dealloc](&v4, "dealloc");
}

- (void)notifyClient
{
  -[CUCoalescer trigger](self->_coalescer, "trigger");
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (void)setUserName:(id)a3
{
  SFNodeSetUserName(self->_parent, a3);
}

- (void)setConnectionState:(int)a3
{
  SFNodeSetConnectionState(self->_parent, *(_QWORD *)&a3);
}

- (void)notifyClientAboutWorkgroups
{
  const __CFSet *v3;
  const __CFSet *v4;
  const __CFSet *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  _BOOL4 combineWorkgroups;
  BOOL *p_combineWorkgroups;
  size_t v11;
  char *v12;
  __CFSet *Mutable;
  uint64_t i;
  CFSetRef v15;
  char v16;
  __CFSet *v17;
  const __CFSet *v18;
  const __CFSet *v19;
  CFIndex v20;
  uint64_t v21;
  size_t v22;
  uint64_t *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];
  CFIndex v27;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
  {
    -[SDNodeBrowser notifyClient](self, "notifyClient");
    return;
  }
  v3 = (const __CFSet *)SFNodeCopyWorkgroups(self->_parent);
  v4 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser workgroups](self->_workgroupBrowser, "workgroups"));
  v5 = v4;
  if (v3)
  {
    Count = CFSetGetCount(v3);
    if (v5)
    {
      v7 = CFSetGetCount(v5);
      v8 = v7;
      p_combineWorkgroups = &self->_combineWorkgroups;
      combineWorkgroups = self->_combineWorkgroups;
      if (Count < 1)
      {
        Mutable = 0;
      }
      else
      {
        v27 = v7;
        __chkstk_darwin(v7);
        v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v12, v11);
        CFSetGetValues(v3, (const void **)v12);
        Mutable = CFSetCreateMutable(0, 0, &kCFCopyStringSetCallBacks);
        for (i = 0; i != Count; ++i)
        {
          if (!CFSetContainsValue(v5, *(const void **)&v12[8 * i]))
            CFSetSetValue(Mutable, *(const void **)&v12[8 * i]);
        }
        v8 = v27;
      }
      goto LABEL_15;
    }
    p_combineWorkgroups = &self->_combineWorkgroups;
    combineWorkgroups = self->_combineWorkgroups;
    Mutable = CFSetCreateMutableCopy(0, 0, v3);
  }
  else
  {
    if (v4)
    {
      v8 = CFSetGetCount(v4);
      Count = 0;
      Mutable = 0;
      p_combineWorkgroups = &self->_combineWorkgroups;
      combineWorkgroups = self->_combineWorkgroups;
LABEL_15:
      SFNodeSetWorkgroups(self->_parent, v5);
      CFRelease(v5);
      goto LABEL_18;
    }
    Count = 0;
    Mutable = 0;
    p_combineWorkgroups = &self->_combineWorkgroups;
    combineWorkgroups = self->_combineWorkgroups;
  }
  v15 = CFSetCreate(0, 0, 0, &kCFCopyStringSetCallBacks);
  SFNodeSetWorkgroups(self->_parent, v15);
  CFRelease(v15);
  v8 = 0;
LABEL_18:
  if (v8 >= -[SDStatusMonitor workgroupThreshold](self->_monitor, "workgroupThreshold"))
  {
    if (v8 <= -[SDStatusMonitor workgroupThreshold](self->_monitor, "workgroupThreshold"))
      goto LABEL_23;
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  *p_combineWorkgroups = v16;
LABEL_23:
  if (combineWorkgroups)
  {
    if (*p_combineWorkgroups)
    {
      v17 = Mutable;
      if (!Mutable)
        goto LABEL_35;
    }
    else
    {
      v17 = v3;
      if (!v3)
        goto LABEL_38;
    }
    v18 = (const __CFSet *)CFRetain(v17);
    if (v18)
    {
      v19 = v18;
      v20 = CFSetGetCount(v18);
      if (v20)
      {
        v21 = v20;
        v26[1] = v26;
        v27 = v8;
        __chkstk_darwin(v20);
        v23 = (_QWORD *)((char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
        bzero(v23, v22);
        CFSetGetValues(v19, (const void **)v23);
        if (v21 >= 1)
        {
          do
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v25 = *v23++;
            objc_msgSend(v24, "stopBrowsingWorkgroup:", v25);

            --v21;
          }
          while (v21);
        }
        v8 = v27;
      }
      CFRelease(v19);
    }
  }
  if (!*p_combineWorkgroups)
    goto LABEL_38;
LABEL_35:
  if (v8 < 1)
  {
    if (Count < 1)
      goto LABEL_39;
LABEL_38:
    -[SDNodeBrowser notifyClient](self, "notifyClient");
    goto LABEL_39;
  }
  -[SDNodeBrowser loadWindows](self, "loadWindows");
LABEL_39:
  if (Mutable)
    CFRelease(Mutable);
  if (v3)
    CFRelease(v3);
}

- (void)takeActionOnServerChanged:(id)a3 neighborhood:(id)a4
{
  id v6;
  NSMutableSet *bonjourDomains;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sharingd.BonjourChanged"))
     || (bonjourDomains = self->_bonjourDomains) == 0)
    && (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sharingd.WindowsChanged"))
     || (bonjourDomains = self->_windowsWorkgroups) == 0)
    && (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sharingd.ODisksChanged"))
     || (bonjourDomains = self->_odiskDomains) == 0)
    && (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sharingd.AirDropChanged"))
     || (bonjourDomains = self->_airDropDomains) == 0))
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sharingd.RapportChanged")))
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((-[NSMutableSet containsObject:](bonjourDomains, "containsObject:", v6) & 1) != 0)
  {
LABEL_10:
    -[SDNodeBrowser setError:](self, "setError:", 0);
    -[SDNodeBrowser notifyClient](self, "notifyClient");
  }
LABEL_11:

}

- (void)serversChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NeighborhoodName")));
  -[SDNodeBrowser takeActionOnServerChanged:neighborhood:](self, "takeActionOnServerChanged:neighborhood:", v7, v6);

}

- (void)domainsChanged:(id)a3
{
  -[SDNodeBrowser setError:](self, "setError:", 0);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)workgroupsChanged:(id)a3
{
  -[SDNodeBrowser setError:](self, "setError:", 0);
  -[SDNodeBrowser notifyClientAboutWorkgroups](self, "notifyClientAboutWorkgroups");
}

- (void)sharePointBrowser:(id)a3 nodesDidChangeWithError:(int)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userName"));
  -[SDNodeBrowser setUserName:](self, "setUserName:", v6);

  v7 = objc_msgSend(v5, "connectionState");
  -[SDNodeBrowser setConnectionState:](self, "setConnectionState:", v7);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)connectedChanged:(id)a3
{
  -[SDNodeBrowser setError:](self, "setError:", 0);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)managedChanged:(id)a3
{
  -[SDNodeBrowser setError:](self, "setError:", 0);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)sidebarPrefsChanged:(id)a3
{
  -[SDNodeBrowser setError:](self, "setError:", 0);
  -[SDNodeBrowser notifyClient](self, "notifyClient");
}

- (void)setMode:(int64_t)a3
{
  id v5;

  if (self->_mode != a3)
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
    {
      self->_mode = a3;
      v5 = (id)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
      objc_msgSend(v5, "setBonjourBrowserMode:", a3);

    }
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)loadBonjour
{
  const __CFSet *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *bonjourDomains;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v4 = (void *)SFNodeCopyDomains(self->_parent);
    if (objc_msgSend(v4, "count"))
    {
      v19 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
      if (!self->_bonjourDomains)
      {
        v6 = objc_opt_new(NSMutableSet);
        bonjourDomains = self->_bonjourDomains;
        self->_bonjourDomains = v6;

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.BonjourChanged"), 0);

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
            -[NSMutableSet addObject:](self->_bonjourDomains, "addObject:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            objc_msgSend(v15, "startBrowsingDomain:", v14);

            if (objc_msgSend(v14, "isEqual:", CFSTR("local")))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
              objc_msgSend(v16, "setBonjourBrowserMode:", self->_mode);

            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bonjourNodesForDomain:", v14));

            if (objc_msgSend(v18, "count"))
              -[SDNodeBrowser notifyClient](self, "notifyClient");

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }

      v4 = v19;
    }

  }
  CFRelease(v3);
}

- (void)loadWindows
{
  const __CFSet *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *windowsWorkgroups;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindWorkgroup))
  {
    v4 = (void *)SFNodeCopyWorkgroups(self->_parent);
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
      if (!self->_windowsWorkgroups)
      {
        v6 = objc_opt_new(NSMutableSet);
        windowsWorkgroups = self->_windowsWorkgroups;
        self->_windowsWorkgroups = v6;

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.WindowsChanged"), 0);

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            -[NSMutableSet addObject:](self->_windowsWorkgroups, "addObject:", v14, (_QWORD)v18);
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            objc_msgSend(v15, "startBrowsingWorkgroup:", v14);

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowsNodesForWorkgroup:", v14));

            if (objc_msgSend(v17, "count"))
              -[SDNodeBrowser notifyClient](self, "notifyClient");

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

    }
  }
  CFRelease(v3);
}

- (void)loadDomains
{
  void *v3;
  SDDomainBrowser *v4;
  SDDomainBrowser *domainBrowser;
  id v6;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "domainsChanged:", CFSTR("com.apple.sharingd.DomainsChanged"), 0);

    v4 = (SDDomainBrowser *)objc_claimAutoreleasedReturnValue(+[SDDomainBrowser sharedBrowser](SDDomainBrowser, "sharedBrowser"));
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = v4;

    -[SDDomainBrowser start](self->_domainBrowser, "start");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDDomainBrowser childrenForNode:](self->_domainBrowser, "childrenForNode:", self->_parent));
    if (objc_msgSend(v6, "count"))
      -[SDNodeBrowser notifyClient](self, "notifyClient");

  }
}

- (void)loadWorkgroups
{
  void *v3;
  SDWorkgroupBrowser *v4;
  SDWorkgroupBrowser *workgroupBrowser;
  id v6;

  if ((-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork) & 1) != 0
    || -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "workgroupsChanged:", CFSTR("com.apple.sharingd.WorkgroupsChanged"), 0);

    v4 = (SDWorkgroupBrowser *)objc_claimAutoreleasedReturnValue(+[SDWorkgroupBrowser sharedBrowser](SDWorkgroupBrowser, "sharedBrowser"));
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = v4;

    -[SDWorkgroupBrowser start](self->_workgroupBrowser, "start");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](self->_workgroupBrowser, "nodes"));
    if (objc_msgSend(v6, "count"))
      -[SDNodeBrowser notifyClientAboutWorkgroups](self, "notifyClientAboutWorkgroups");

  }
}

- (BOOL)onlySupportsADisk:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;

  v3 = kSFNodeProtocolAFP;
  v4 = a3;
  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v3);
  v5 = objc_msgSend(v4, "containsObject:", kSFNodeProtocolSMB);
  v6 = objc_msgSend(v4, "containsObject:", kSFNodeProtocolADisk);

  return v6 & ((v3 | v5) ^ 1);
}

- (void)loadConnected
{
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  SDConnectedBrowser *v6;
  SDConnectedBrowser *connectedBrowser;
  unsigned __int8 v8;
  SDConnectedBrowser *v9;
  void *v10;
  id v11;

  v3 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork);
  v4 = kSFBrowserKindRemoteDisc;
  if ((v3 & 1) != 0
    || (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc) & 1) != 0
    || -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "connectedChanged:", CFSTR("com.apple.sharingd.ConnectedChanged"), 0);

    v6 = (SDConnectedBrowser *)objc_claimAutoreleasedReturnValue(+[SDConnectedBrowser sharedBrowser](SDConnectedBrowser, "sharedBrowser"));
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = v6;

    -[SDConnectedBrowser start](self->_connectedBrowser, "start");
    v8 = -[NSString isEqual:](self->_kind, "isEqual:", v4);
    v9 = self->_connectedBrowser;
    if ((v8 & 1) != 0)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser odiskNodes](v9, "odiskNodes"));
    else
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser nodes](v9, "nodes"));
    v11 = v10;
    if (objc_msgSend(v10, "count"))
      -[SDNodeBrowser notifyClient](self, "notifyClient");

  }
}

- (void)loadManaged
{
  void *v3;
  SDManagedBrowser *v4;
  SDManagedBrowser *managedBrowser;
  id v6;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "managedChanged:", CFSTR("com.apple.sharingd.ManagedChanged"), 0);

    v4 = (SDManagedBrowser *)objc_claimAutoreleasedReturnValue(+[SDManagedBrowser sharedBrowser](SDManagedBrowser, "sharedBrowser"));
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = v4;

    -[SDManagedBrowser start](self->_managedBrowser, "start");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDManagedBrowser nodes](self->_managedBrowser, "nodes"));
    if (objc_msgSend(v6, "count"))
      -[SDNodeBrowser notifyClient](self, "notifyClient");

  }
}

- (void)loadODisk
{
  const __CFSet *v3;
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *odiskDomains;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
  {
    v4 = (void *)SFNodeCopyDomains(self->_parent);
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
      if (!self->_odiskDomains)
      {
        v6 = objc_opt_new(NSMutableSet);
        odiskDomains = self->_odiskDomains;
        self->_odiskDomains = v6;

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.ODisksChanged"), 0);

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            -[NSMutableSet addObject:](self->_odiskDomains, "addObject:", v14, (_QWORD)v18);
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            objc_msgSend(v15, "startODiskBrowsing:", v14);

            v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "odiskNodesForDomain:", v14));

            if (objc_msgSend(v17, "count"))
              -[SDNodeBrowser notifyClient](self, "notifyClient");

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

    }
  }
  CFRelease(v3);
}

- (void)loadClassroom
{
  void *v3;
  unsigned int v4;
  const __CFSet *v5;
  void *v6;
  SDClassroomBrowser *v7;
  SDClassroomBrowser *classroomBrowser;
  OS_xpc_object *connection;
  id v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isClassroomEnabled");

  if (v4)
  {
    v5 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v6, "addObserver:selector:name:object:", self, "classroomChanged:", CFSTR("com.apple.sharingd.ClassroomChanged"), 0);

      v7 = (SDClassroomBrowser *)objc_claimAutoreleasedReturnValue(+[SDClassroomBrowser sharedBrowser](SDClassroomBrowser, "sharedBrowser"));
      classroomBrowser = self->_classroomBrowser;
      self->_classroomBrowser = v7;

      connection = self->_connection;
      if (connection)
      {
        v10 = sub_10019CD60(connection);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        -[SDClassroomBrowser setClientBundleID:](self->_classroomBrowser, "setClientBundleID:", v11);

      }
      -[SDClassroomBrowser start](self->_classroomBrowser, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser nodes](self->_classroomBrowser, "nodes"));
      if (objc_msgSend(v12, "count"))
        -[SDNodeBrowser notifyClient](self, "notifyClient");

    }
    if (v5)
      CFRelease(v5);
  }
}

- (void)loadAirDrop
{
  void *v3;
  unsigned int v4;
  const __CFSet *v5;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  NSMutableSet *airDropDomains;
  void *v10;
  id v11;
  id v12;
  void *i;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  NSString *bundleID;
  NSString *protocol;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFSet *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = objc_msgSend(v3, "isAirDropAllowed");

  if (v4)
  {
    v5 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    if (CFSetContainsValue(v5, kSFNodeKindDomain)
      && -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
    {
      v6 = (void *)SFNodeCopyDomains(self->_parent);
      if (objc_msgSend(v6, "count"))
      {
        v23 = v6;
        v24 = v5;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
        if (!self->_airDropDomains)
        {
          v8 = objc_opt_new(NSMutableSet);
          airDropDomains = self->_airDropDomains;
          self->_airDropDomains = v8;

        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v10, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.AirDropChanged"), 0);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = v7;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v11)
        {
          v12 = v11;
          v27 = *(_QWORD *)v29;
          v26 = kSFBrowserOptionsDelayBonjourUntilTransferKey;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v29 != v27)
                objc_enumerationMutation(obj);
              v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
              -[NSMutableSet addObject:](self->_airDropDomains, "addObject:", v14);
              if (self->_bundleID)
              {
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser options](self, "options"));
                v16 = CFDictionaryGetInt64(v15, v26, 0) != 0;

                v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
                bundleID = self->_bundleID;
                protocol = self->_protocol;
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser helperConnection](self, "helperConnection"));
                objc_msgSend(v17, "startAirDropBrowsing:bundleID:sessionID:helperConnection:delayBonjour:", v14, bundleID, protocol, v20, v16);

              }
              else
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
                objc_msgSend(v17, "startAirDropBrowsing:connection:sessionID:", v14, self->_connection, self->_protocol);
              }

              v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "airDropNodesForDomain:", v14));

              if (objc_msgSend(v22, "count"))
                -[SDNodeBrowser notifyClient](self, "notifyClient");

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v12);
        }

        v6 = v23;
        v5 = v24;
      }

    }
    CFRelease(v5);
  }
}

- (void)loadSidebarPrefsMonitor
{
  id v3;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "sidebarPrefsChanged:", CFSTR("com.apple.sharingd.FinderPrefsChanged"), 0);

  }
}

- (void)loadRapport
{
  const __CFSet *v3;
  void *v4;
  SDRapportBrowser *v5;
  SDRapportBrowser *rapportBrowser;
  void *v7;
  void *v8;

  v3 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
  if (CFSetContainsValue(v3, kSFNodeKindDomain)
    && -[NSString isEqual:](self->_kind, "isEqual:", kSFNodeKindAirDrop))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "serversChanged:", CFSTR("com.apple.sharingd.RapportChanged"), 0);

    v5 = (SDRapportBrowser *)objc_claimAutoreleasedReturnValue(+[SDRapportBrowser sharedRapportBrowser](SDRapportBrowser, "sharedRapportBrowser"));
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser helperConnection](self, "helperConnection"));
    -[SDRapportBrowser setHelperConnection:](self->_rapportBrowser, "setHelperConnection:", v7);

    -[SDRapportBrowser start](self->_rapportBrowser, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser nodes](self->_rapportBrowser, "nodes"));
    if (objc_msgSend(v8, "count"))
      -[SDNodeBrowser notifyClient](self, "notifyClient");

  }
  if (v3)
    CFRelease(v3);
}

- (id)domainChildren
{
  return -[SDDomainBrowser childrenForNode:](self->_domainBrowser, "childrenForNode:", self->_parent);
}

- (id)workgroupChildren
{
  SDWorkgroupBrowser *workgroupBrowser;

  workgroupBrowser = self->_workgroupBrowser;
  if (workgroupBrowser)
  {
    if (self->_combineWorkgroups)
    {
      if (!-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter))
      {
        workgroupBrowser = 0;
        return workgroupBrowser;
      }
      workgroupBrowser = self->_workgroupBrowser;
    }
    workgroupBrowser = (SDWorkgroupBrowser *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](workgroupBrowser, "nodes"));
  }
  return workgroupBrowser;
}

- (void)copyOverBonjourInfo:(__SFNode *)a3 source:(__SFNode *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t SupportedMedia;

  v6 = (id)SFNodeCopyModel(a4, a2);
  SFNodeSetModel(a3, v6);
  v7 = (id)SFNodeCopyColor(a4);
  SFNodeSetColor(a3, v7);
  v8 = (id)SFNodeCopySiblingNodes(a4);
  SFNodeSetSiblingNodes(a3, v8);
  v9 = (id)SFNodeCopyDomain(a4);
  SFNodeSetDomain(a3, v9);
  v10 = (id)SFNodeCopyAppleID(a4);
  SFNodeSetAppleID(a3, v10);
  v11 = (id)SFNodeCopyIconData(a4);
  SFNodeSetIconData(a3, v11);
  v12 = (id)SFNodeCopyIconHash(a4);
  SFNodeSetIconHash(a3, v12);
  v13 = (id)SFNodeCopyLastName(a4);
  SFNodeSetLastName(a3, v13);
  v14 = (id)SFNodeCopyFirstName(a4);
  SFNodeSetFirstName(a3, v14);
  v15 = (id)SFNodeCopyContactIdentifier(a4);
  SFNodeSetContactIdentifier(a3, v15);
  v16 = (id)SFNodeCopyContactIdentifiers(a4);
  SFNodeSetContactIdentifiers(a3, v16);
  v17 = (id)SFNodeCopyComputerName(a4);
  SFNodeSetComputerName(a3, v17);
  v18 = (id)SFNodeCopySecondaryName(a4);
  SFNodeSetSecondaryName(a3, v18);
  v19 = (id)SFNodeCopyTransportBundleID(a4);
  SFNodeSetTransportBundleID(a3, v19);
  v20 = (id)SFNodeCopyBonjourProtocols(a4);
  SFNodeSetBonjourProtocols(a3, v20);
  v21 = (id)SFNodeCopyRapportFlags(a4);
  SFNodeSetRapportFlags(a3, v21);
  SupportedMedia = SFNodeGetSupportedMedia(a4);
  SFNodeSetSupportedMedia(a3, SupportedMedia);
}

- (void)addBonjourChildrenFromCache:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  const __CFSet *v8;
  const __CFSet *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *commentHashTable;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *Copy;
  const void *v29;
  const void *v30;
  const void *v31;
  const __CFSet *cf;
  id v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  SDNodeBrowser *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v4 = a3;
  v38 = kSFBrowserKindRemoteDisc;
  if ((-[NSString isEqual:](self->_kind, "isEqual:") & 1) != 0)
  {
    v5 = 112;
  }
  else
  {
    v6 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop);
    v5 = 128;
    if (v6)
      v5 = 120;
  }
  v7 = *(id *)((char *)&self->super.isa + v5);
  if (objc_msgSend(v7, "count"))
  {
    v8 = (const __CFSet *)SFNodeCopyKinds(self->_parent);
    v9 = v8;
    if (!self->_commentHashTable && CFSetContainsValue(v8, kSFNodeKindWorkgroup))
    {
      v10 = objc_opt_new(NSMutableDictionary);
      commentHashTable = self->_commentHashTable;
      self->_commentHashTable = v10;

    }
    cf = v9;
    v33 = v7;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v39)
    {
      v36 = *(_QWORD *)v46;
      v34 = kSFBrowserKindAirDrop;
      v37 = self;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v46 != v36)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v12);
          v40 = v12;
          if (-[NSString isEqual:](self->_kind, "isEqual:", v38))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "odiskNodesForDomain:", v13));
          }
          else
          {
            v16 = -[NSString isEqual:](self->_kind, "isEqual:", v34);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
            v14 = v17;
            if (v16)
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "airDropNodesForDomain:", v13));
            else
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bonjourNodesForDomain:", v13));
          }
          v18 = (void *)v15;

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v20)
          {
            v22 = v20;
            v23 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v42 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
                v26 = (void *)SFNodeCopyRealName(v25, v21);
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
                Copy = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v27));

                if (!Copy)
                {
                  Copy = (void *)SFNodeCreateCopy(0, v25);
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", Copy, v27);
                  CFRelease(Copy);
                }
                v29 = (const void *)SFNodeCopyKinds(Copy);
                v30 = (const void *)SFNodeCopyKinds(v25);
                v31 = (const void *)SFNodeCopyDomain(v25);
                CFRelease(v29);
                CFRelease(v31);
                CFRelease(v30);

              }
              v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v22);
          }

          v12 = v40 + 1;
          self = v37;
        }
        while ((id)(v40 + 1) != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v39);
    }
    CFRelease(cf);

    v7 = v33;
  }
  if (self->_commentHashTable && !objc_msgSend(v4, "count"))
    -[NSMutableDictionary removeAllObjects](self->_commentHashTable, "removeAllObjects");

}

- (void)addWindowsChildrenFromCache:(id)a3
{
  NSMutableArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  SDNodeBrowser *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFSet *v20;
  const void *v21;
  const void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const void *v25;
  void *v26;
  NSMutableArray *v27;
  const __CFSet *Copy;
  const __CFArray *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  SDNodeBrowser *v37;
  id v38;
  id v39;
  void *value;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  CFRange v51;

  v39 = a3;
  if (self->_windowsWorkgroups && (!self->_workgroupBrowser || self->_combineWorkgroups))
  {
    v4 = objc_opt_new(NSMutableArray);
    v37 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_windowsWorkgroups, "allObjects"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowsNodesForWorkgroup:", v10));

          if (v12)
            -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v7);
    }
    v30 = v5;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = v4;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    v15 = v37;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v42;
      value = (void *)kSFNodeKindBonjour;
      v35 = (void *)kSFNodeProtocolSMB;
      v34 = kSFNodeKindWindows;
      v33 = kSFNodeKindRecent;
      v32 = kSFNodeKindManaged;
      v31 = kSFNodeKindConnected;
      v36 = *(_QWORD *)v42;
      do
      {
        v18 = 0;
        v38 = v16;
        do
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v18);
          v20 = (const __CFSet *)SFNodeCopyKinds(v19);
          if (!CFSetContainsValue(v20, value))
          {
            v21 = (const void *)SFNodeCopyNetbiosName(v19);
            v22 = (const void *)SFNodeCopyWorkgroup(v19);
            v23 = (const __CFString *)SFNodeCopySecondaryName(v19);
            v24 = v23;
            if (v15->_commentHashTable
              && v23
              && CFStringGetLength(v23)
              && (v25 = CFDictionaryGetValue((CFDictionaryRef)v15->_commentHashTable, v24)) != 0
              && (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v25)),
                  v26,
                  v26)
              || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v21)),
                  v26,
                  v26))
            {
              v27 = v13;
              Copy = (const __CFSet *)SFNodeCopyKinds(v26);
              v29 = (const __CFArray *)SFNodeCopyProtocols(v26);
              if (CFSetContainsValue(Copy, value)
                && (v51.length = CFArrayGetCount(v29), v51.location = 0, CFArrayContainsValue(v29, v51, v35)))
              {
                SFNodeAddKind(v19, value);
              }
              else
              {
                SFNodeSetMountPoint(v26, 0);
                SFNodeSetSecondaryName(v26, v24);
                SFNodeSetNetbiosName(v26, v21);
                SFNodeSetWorkgroup(v26, v22);
                SFNodeAddKind(v26, v34);
                SFNodeRemoveKind(v26, v33);
                SFNodeRemoveKind(v26, v32);
                SFNodeRemoveKind(v26, v31);
              }
              CFRelease(v29);
              v13 = v27;
              v17 = v36;
            }
            else
            {
              Copy = (const __CFSet *)SFNodeCreateCopy(0, v19);
              objc_msgSend(v39, "setObject:forKeyedSubscript:", Copy, v21);
            }
            v16 = v38;
            CFRelease(Copy);
            if (v24)
              CFRelease(v24);
            CFRelease(v22);
            CFRelease(v21);
            v15 = v37;
          }
          CFRelease(v20);
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v16);
    }

  }
}

- (void)addClassroomChildrenFromCache:(id)a3
{
  id v4;
  SDClassroomBrowser *classroomBrowser;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  classroomBrowser = self->_classroomBrowser;
  if (classroomBrowser)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDClassroomBrowser nodes](classroomBrowser, "nodes"));
    v7 = v6;
    if (v6)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v7);
            v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            v14 = (void *)SFNodeCopyRealName(v13, v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString"));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v15);

          }
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }
    }

  }
}

- (void)addManagedChildrenFromCache:(id)a3
{
  id v4;
  SDManagedBrowser *managedBrowser;
  void *v6;
  NSMutableDictionary *managedURLTable;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *Copy;
  uint64_t v20;
  const void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  managedBrowser = self->_managedBrowser;
  if (managedBrowser)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDManagedBrowser nodes](managedBrowser, "nodes"));
    if (v6)
    {
      managedURLTable = self->_managedURLTable;
      if (managedURLTable)
      {
        -[NSMutableDictionary removeAllObjects](managedURLTable, "removeAllObjects");
      }
      else
      {
        v8 = objc_opt_new(NSMutableDictionary);
        v9 = self->_managedURLTable;
        self->_managedURLTable = v8;

      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = v6;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v26;
        v24 = kSFNodeKindManaged;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v10);
            v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v17 = (void *)SFNodeCopyRealName(v16, v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));
            if (v18)
            {
              Copy = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v18));

              if (Copy)
              {
                v20 = SFNodeCopyURL(v16);
                SFNodeAddKind(Copy, v24);
                SFNodeSetURL(Copy, v20);
                objc_msgSend(v4, "setObject:forKeyedSubscript:", Copy, v18);
                if (v20)
                {
                  v21 = (const void *)v20;
                  goto LABEL_16;
                }
              }
              else
              {
                Copy = (void *)SFNodeCreateCopy(0, v16);
                objc_msgSend(v4, "setObject:forKeyedSubscript:", Copy, v18);
                v21 = Copy;
LABEL_16:
                CFRelease(v21);
              }
              v22 = (void *)SFNodeCopyURL(Copy);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_managedURLTable, "setObject:forKeyedSubscript:", v18, v22);

            }
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v6 = v23;
    }

  }
}

- (void)addConnectedChildrenFromCache:(id)a3
{
  void *v4;
  unsigned int v5;
  SDConnectedBrowser *connectedBrowser;
  uint64_t v7;
  uint64_t v8;
  const __CFURL *v9;
  const __CFSet *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *managedURLTable;
  void *v16;
  void *v17;
  unsigned int v18;
  CFStringRef v19;
  const void *v20;
  const void *v21;
  uint64_t Copy;
  const void *v23;
  id v24;
  id v25;
  void *v26;
  CFIndex Count;
  int v28;
  CFStringRef v29;
  CFSetRef theSet;
  id obj;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *value;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  CFRange v42;

  v34 = a3;
  if (self->_connectedBrowser)
  {
    if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser odiskNodes](self->_connectedBrowser, "odiskNodes"));
      if (!v4)
      {
LABEL_45:

        goto LABEL_46;
      }
    }
    else
    {
      v5 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop);
      connectedBrowser = self->_connectedBrowser;
      if (v5)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser airDropNodes](connectedBrowser, "airDropNodes"));
        if (!v4)
          goto LABEL_45;
      }
      else
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser nodes](connectedBrowser, "nodes"));
        if (!v4)
          goto LABEL_45;
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = v4;
    obj = v4;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (!v33)
      goto LABEL_44;
    v32 = *(_QWORD *)v38;
    value = (void *)kSFNodeKindRecent;
    v35 = (void *)kSFNodeKindConnected;
    v26 = (void *)kSFNodeKindBonjour;
LABEL_11:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v32)
        objc_enumerationMutation(obj);
      v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v7);
      v9 = (const __CFURL *)SFNodeCopyURL(v8);
      v10 = (const __CFSet *)SFNodeCopyKinds(v8);
      v11 = CFSetContainsValue(v10, value);
      v12 = CFSetContainsValue(v10, v35);
      v14 = (void *)SFNodeCopyRealName(v8, v13);
      managedURLTable = self->_managedURLTable;
      if (!managedURLTable
        || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](managedURLTable, "objectForKeyedSubscript:", v9))) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lowercaseString", v25));
        if (!v16)
          goto LABEL_40;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v16, v25));

      if (v11)
      {
        v18 = sub_10019D434((uint64_t)v9);
        if (!v17)
          goto LABEL_28;
        if (!v18)
          goto LABEL_33;
        v19 = CFURLCopyScheme(v9);
        theSet = (CFSetRef)SFNodeCopyKinds(v17);
        v20 = (const void *)SFNodeCopyProtocols(v17);
        v29 = v19;
        if (!v19)
        {
          CFRelease(v20);
          CFRelease(theSet);
LABEL_33:
          SFNodeSetURL(v17, v9);
          SFNodeSetRealName(v17, v14);
          if (v11)
            SFNodeAddKind(v17, value);
          else
            SFNodeRemoveKind(v17, value);
          if (v12)
            SFNodeAddKind(v17, v35);
          else
            SFNodeRemoveKind(v17, v35);
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v17, v16);
          goto LABEL_40;
        }
        v21 = v20;
        Count = CFArrayGetCount((CFArrayRef)v20);
        if (!CFSetContainsValue(theSet, v26))
        {
          CFRelease(v29);
          CFRelease(v21);
          v23 = theSet;
          goto LABEL_31;
        }
        v42.location = 0;
        v42.length = Count;
        v28 = CFArrayContainsValue((CFArrayRef)v21, v42, v29);
        CFRelease(v29);
        CFRelease(v21);
        CFRelease(theSet);
        if (v28)
          goto LABEL_33;
      }
      else
      {
        if (!v17)
        {
          LOBYTE(v18) = 1;
LABEL_28:
          if (!v12 && (v18 & 1) != 0)
            goto LABEL_40;
          Copy = SFNodeCreateCopy(0, v8);
          objc_msgSend(v34, "setObject:forKeyedSubscript:", Copy, v16);
          v23 = (const void *)Copy;
LABEL_31:
          CFRelease(v23);
          goto LABEL_40;
        }
        if (v12)
          goto LABEL_33;
      }
LABEL_40:
      CFRelease(v9);
      CFRelease(v10);

      if (v33 == (id)++v7)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v33 = v24;
        if (!v24)
        {
LABEL_44:

          v4 = v25;
          goto LABEL_45;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_46:

}

- (void)addRapportChildrenFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser nodes](self->_rapportBrowser, "nodes"));
  v6 = v5;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v13 = (void *)SFNodeCopyRealName(v12, v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v14);

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }

}

- (void)addFakeRangingMeasurementIfAppropriateToNodesInCache:(id)a3
{
  _QWORD v3[5];

  if (self->_showAllKnownPeopleInMagicHead)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100184C38;
    v3[3] = &unk_100719470;
    v3[4] = self;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
  }
}

- (void)updateSelectionReasonInNodes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  unsigned __int8 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];

  v3 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v39;
    v9 = 200.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v3);
        v11 = (void *)SFNodeCopyRealName(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), v5);
        v12 = sub_100195DF4();
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = magic_head_log();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v13;
          v45 = 2112;
          v46 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Evaluating %@ for %@", buf, 0x16u);
        }

        if ((objc_msgSend(v13, "flags") & 2) != 0)
        {
          objc_msgSend(v13, "horizontalAngle");
          v17 = v16;
          objc_msgSend(v13, "horizontalAngle");
          v19 = v17 >= 0.0 ? v18 : -v18;
          if (v19 < v9)
          {
            v20 = v11;

            v9 = v19;
            v7 = v20;
          }
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = v3;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v21);
        v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        v28 = (void *)SFNodeCopyRealName(v27, v23);
        v29 = v7;
        v30 = v28;
        if (v29 == v30)
        {

LABEL_28:
          v33 = 1;
          goto LABEL_31;
        }
        v31 = v30;
        if ((v7 == 0) != (v30 != 0))
        {
          v32 = objc_msgSend(v29, "isEqual:", v30);

          if ((v32 & 1) != 0)
            goto LABEL_28;
        }
        else
        {

        }
        v33 = 0;
LABEL_31:
        SFNodeSetSelectionReason(v27, v33);
      }
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v24);
  }

}

- (id)sidebarNodesFromServerNodes:(id)a3 nonServerCount:(unint64_t)a4 addAllNode:(BOOL *)a5
{
  id v8;
  NSMutableArray *v9;
  unsigned int v10;
  unint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  id v14;
  char *v15;
  const void *v16;
  const void *v17;
  void *v18;
  const __CFSet *v19;
  const __CFSet *v20;
  int v21;
  NSMutableArray *v22;
  int v23;
  int v24;
  id v25;
  id v26;
  id v27;
  signed int v28;
  unint64_t v29;
  void *v30;
  char v31;
  SDNodeBrowser *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  id v36;
  unint64_t v37;
  BOOL *v38;
  void *value;
  NSMutableArray *v40;
  unsigned int v41;

  v8 = a3;
  v9 = objc_opt_new(NSMutableArray);
  v10 = -[SDStatusMonitor connectedEnabled](self->_monitor, "connectedEnabled");
  v41 = -[SDStatusMonitor bonjourEnabled](self->_monitor, "bonjourEnabled");
  v11 = (unint64_t)objc_msgSend(v8, "count");
  if (v11)
  {
    v33 = self;
    v35 = v9;
    v37 = a4;
    v38 = a5;
    v12 = objc_opt_new(NSMutableArray);
    v40 = objc_opt_new(NSMutableArray);
    v34 = objc_opt_new(NSMutableArray);
    v13 = objc_opt_new(NSMutableArray);
    v36 = v8;
    v14 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v14, "sortUsingComparator:", &stru_1007194B0);
    v15 = 0;
    v16 = (const void *)kSFNodeKindConnected;
    v17 = (const void *)kSFNodeKindManaged;
    value = (void *)kSFNodeKindRecent;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v15));

      v19 = (const __CFSet *)SFNodeCopyKinds(v18);
      v20 = v19;
      if (v10 && (v21 = CFSetContainsValue(v19, v16), v22 = v13, v21)
        || (v23 = CFSetContainsValue(v20, v17), v22 = v12, v23)
        || v41 && (v24 = CFSetContainsValue(v20, value), v22 = v40, v24))
      {
        -[NSMutableArray addObject:](v22, "addObject:", v18);
      }
      CFRelease(v20);
      ++v15;
    }
    while ((char *)v11 != v15);
    v25 = -[NSMutableArray count](v12, "count");
    v26 = -[NSMutableArray count](v13, "count");
    v27 = -[NSMutableArray count](v40, "count");
    v28 = -[SDStatusMonitor sidebarMaxCount](v33->_monitor, "sidebarMaxCount");
    if ((unint64_t)v27 >= v28 - ((unint64_t)v25 + (unint64_t)v26))
      v29 = v28 - ((unint64_t)v25 + (_QWORD)v26);
    else
      v29 = (unint64_t)v27;
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v40, "subarrayWithRange:", 0));
      -[NSMutableArray addObjectsFromArray:](v34, "addObjectsFromArray:", v30);

    }
    -[NSMutableArray sortUsingComparator:](v34, "sortUsingComparator:", &stru_1007194D0);
    v9 = v35;
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v13);
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v12);
    -[NSMutableArray addObjectsFromArray:](v35, "addObjectsFromArray:", v34);

    a4 = v37;
    a5 = v38;
    v8 = v36;
  }
  v31 = v10 | v41;
  if (!(v11 | a4))
    v31 = 0;
  *a5 = v31;

  return v9;
}

- (id)neighborhoodNodes
{
  NSMutableArray *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser domainChildren](self, "domainChildren"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser workgroupChildren](self, "workgroupChildren"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  return v3;
}

- (id)sharePointNodes
{
  unsigned __int8 v3;
  SDSharePointBrowser *sharePointBrowser;
  void *v5;

  v3 = -[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindPrinter);
  sharePointBrowser = self->_sharePointBrowser;
  if ((v3 & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSharePointBrowser printerNodes](sharePointBrowser, "printerNodes"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDSharePointBrowser fileNodes](sharePointBrowser, "fileNodes"));
  return v5;
}

- (id)odiskNodes
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = objc_opt_new(NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v3);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v3, "allValues"));

  return v4;
}

- (id)airDropNodes
{
  NSMutableDictionary *v3;
  SDNodeCoalescer *nodeCoalescer;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v3);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v3);
  -[SDNodeBrowser addClassroomChildrenFromCache:](self, "addClassroomChildrenFromCache:", v3);
  -[SDNodeBrowser addRapportChildrenFromCache:](self, "addRapportChildrenFromCache:", v3);
  -[SDNodeBrowser addFakeRangingMeasurementIfAppropriateToNodesInCache:](self, "addFakeRangingMeasurementIfAppropriateToNodesInCache:", v3);
  nodeCoalescer = self->_nodeCoalescer;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v3, "allValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeCoalescer coalescedNodesForNewAvailableNodes:](nodeCoalescer, "coalescedNodesForNewAvailableNodes:", v5));

  -[SDAirDropDiscoveryLogger updateWithAirDropNodes:](self->_airDropDiscoveryLogger, "updateWithAirDropNodes:", v6);
  -[SDNodeBrowser updateSelectionReasonInNodes:](self, "updateSelectionReasonInNodes:", v6);

  return v6;
}

- (void)unloadBonjour
{
  NSMutableSet *bonjourDomains;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  bonjourDomains = self->_bonjourDomains;
  if (bonjourDomains)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](bonjourDomains, "allObjects"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          objc_msgSend(v10, "stopBrowsingDomain:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.BonjourChanged"), 0);

    v12 = self->_bonjourDomains;
    self->_bonjourDomains = 0;

  }
}

- (void)unloadWindows
{
  NSMutableSet *windowsWorkgroups;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  windowsWorkgroups = self->_windowsWorkgroups;
  if (windowsWorkgroups)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](windowsWorkgroups, "allObjects"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          objc_msgSend(v10, "stopBrowsingWorkgroup:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.WindowsChanged"), 0);

    v12 = self->_windowsWorkgroups;
    self->_windowsWorkgroups = 0;

  }
}

- (void)unloadDomains
{
  void *v3;
  SDDomainBrowser *domainBrowser;

  if (self->_domainBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.DomainsChanged"), 0);

    -[SDDomainBrowser stop](self->_domainBrowser, "stop");
    domainBrowser = self->_domainBrowser;
    self->_domainBrowser = 0;

  }
}

- (void)unloadWorkgroups
{
  void *v3;
  SDWorkgroupBrowser *workgroupBrowser;

  if (self->_workgroupBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.WorkgroupsChanged"), 0);

    -[SDWorkgroupBrowser stop](self->_workgroupBrowser, "stop");
    workgroupBrowser = self->_workgroupBrowser;
    self->_workgroupBrowser = 0;

  }
}

- (void)unloadSharePoints
{
  SDSharePointBrowser *sharePointBrowser;
  SDSharePointBrowser *v4;

  sharePointBrowser = self->_sharePointBrowser;
  if (sharePointBrowser)
  {
    -[SDSharePointBrowser setDelegate:](sharePointBrowser, "setDelegate:", 0);
    -[SDSharePointBrowser stop](self->_sharePointBrowser, "stop");
    v4 = self->_sharePointBrowser;
    self->_sharePointBrowser = 0;

  }
}

- (void)unloadConnected
{
  void *v3;
  SDConnectedBrowser *connectedBrowser;

  if (self->_connectedBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ConnectedChanged"), 0);

    -[SDConnectedBrowser stop](self->_connectedBrowser, "stop");
    connectedBrowser = self->_connectedBrowser;
    self->_connectedBrowser = 0;

  }
}

- (void)unloadManaged
{
  void *v3;
  SDManagedBrowser *managedBrowser;

  if (self->_managedBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ManagedChanged"), 0);

    -[SDManagedBrowser stop](self->_managedBrowser, "stop");
    managedBrowser = self->_managedBrowser;
    self->_managedBrowser = 0;

  }
}

- (void)unloadClassroom
{
  void *v3;
  SDClassroomBrowser *classroomBrowser;

  if (self->_classroomBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ClassroomChanged"), 0);

    -[SDClassroomBrowser stop](self->_classroomBrowser, "stop");
    classroomBrowser = self->_classroomBrowser;
    self->_classroomBrowser = 0;

  }
}

- (void)unloadODisk
{
  NSMutableSet *odiskDomains;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  odiskDomains = self->_odiskDomains;
  if (odiskDomains)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](odiskDomains, "allObjects"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          objc_msgSend(v10, "stopODiskBrowsing:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ODisksChanged"), 0);

    v12 = self->_odiskDomains;
    self->_odiskDomains = 0;

  }
}

- (void)unloadAirDrop
{
  NSMutableSet *airDropDomains;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  airDropDomains = self->_airDropDomains;
  if (airDropDomains)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](airDropDomains, "allObjects"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](SDServerBrowser, "sharedBrowser"));
          objc_msgSend(v10, "stopAirDropBrowsing:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.AirDropChanged"), 0);

    v12 = self->_airDropDomains;
    self->_airDropDomains = 0;

  }
}

- (void)unloadSidebarPrefsMonitor
{
  id v3;

  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindNetwork))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.FinderPrefsChanged"), 0);

  }
}

- (void)unloadRapport
{
  void *v3;
  SDRapportBrowser *rapportBrowser;

  if (self->_rapportBrowser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.RapportChanged"), 0);

    -[SDRapportBrowser stop](self->_rapportBrowser, "stop");
    rapportBrowser = self->_rapportBrowser;
    self->_rapportBrowser = 0;

  }
}

- (void)start
{
  CUCoalescer *v3;
  CUCoalescer *coalescer;
  SDAirDropDiscoveryLogger *v5;
  SDAirDropDiscoveryLogger *airDropDiscoveryLogger;
  void *v7;
  unsigned int v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (!self->_coalescer)
  {
    location = 0;
    objc_initWeak(&location, self);
    v3 = objc_opt_new(CUCoalescer);
    coalescer = self->_coalescer;
    self->_coalescer = v3;

    -[CUCoalescer setDispatchQueue:](self->_coalescer, "setDispatchQueue:", self->_queue);
    -[CUCoalescer setMaxDelay:](self->_coalescer, "setMaxDelay:", 0.05);
    -[CUCoalescer setMinDelay:](self->_coalescer, "setMinDelay:", 0.02);
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100186160;
    v12 = &unk_1007145D0;
    objc_copyWeak(&v13, &location);
    -[CUCoalescer setActionHandler:](self->_coalescer, "setActionHandler:", &v9);
    if (SFNodeIsNeighborhood(self->_parent))
    {
      -[SDNodeBrowser loadBonjour](self, "loadBonjour", v9, v10, v11, v12);
      -[SDNodeBrowser loadWindows](self, "loadWindows");
      -[SDNodeBrowser loadDomains](self, "loadDomains");
    }
    else if (SFNodeIsServer(self->_parent))
    {
      -[SDNodeBrowser loadSharePoints](self, "loadSharePoints", v9, v10, v11, v12);
    }
    if (SFNodeIsRoot(self->_parent))
    {
      -[SDNodeBrowser loadWorkgroups](self, "loadWorkgroups");
      -[SDNodeBrowser loadConnected](self, "loadConnected");
      -[SDNodeBrowser loadManaged](self, "loadManaged");
      -[SDNodeBrowser loadClassroom](self, "loadClassroom");
      -[SDNodeBrowser loadODisk](self, "loadODisk");
      -[SDNodeBrowser loadRapport](self, "loadRapport");
      -[SDNodeBrowser loadAirDrop](self, "loadAirDrop");
      -[SDNodeBrowser loadSidebarPrefsMonitor](self, "loadSidebarPrefsMonitor");
    }
    -[CUCoalescer trigger](self->_coalescer, "trigger", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (!self->_airDropDiscoveryLogger)
  {
    v5 = objc_alloc_init(SDAirDropDiscoveryLogger);
    airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    self->_airDropDiscoveryLogger = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", kSFBrowserOptionsShouldDisableDiscoveryMetricsKey));
    v8 = objc_msgSend(v7, "BOOLValueSafe");

    if (v8)
      self->_shouldCollectNodeCoalescerMetrics = 0;
    self->_startTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)stop
{
  CUCoalescer *coalescer;
  SDAirDropDiscoveryLogger *airDropDiscoveryLogger;

  if (self->_coalescer)
  {
    -[SDNodeBrowser unloadBonjour](self, "unloadBonjour");
    -[SDNodeBrowser unloadWindows](self, "unloadWindows");
    -[SDNodeBrowser unloadDomains](self, "unloadDomains");
    -[SDNodeBrowser unloadSharePoints](self, "unloadSharePoints");
    -[SDNodeBrowser unloadWorkgroups](self, "unloadWorkgroups");
    -[SDNodeBrowser unloadConnected](self, "unloadConnected");
    -[SDNodeBrowser unloadManaged](self, "unloadManaged");
    -[SDNodeBrowser unloadClassroom](self, "unloadClassroom");
    -[SDNodeBrowser unloadODisk](self, "unloadODisk");
    -[SDNodeBrowser unloadAirDrop](self, "unloadAirDrop");
    -[SDNodeBrowser unloadRapport](self, "unloadRapport");
    if (SFNodeIsRoot(self->_parent))
      -[SDNodeBrowser unloadSidebarPrefsMonitor](self, "unloadSidebarPrefsMonitor");
    SFNodeSetConnectionState(self->_parent, 0);
    -[CUCoalescer invalidate](self->_coalescer, "invalidate");
    coalescer = self->_coalescer;
    self->_coalescer = 0;

  }
  airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
  if (airDropDiscoveryLogger)
  {
    if (self->_shouldCollectNodeCoalescerMetrics)
    {
      -[SDAirDropDiscoveryLogger logMetricsWithSessionTime:](airDropDiscoveryLogger, "logMetricsWithSessionTime:", CFAbsoluteTimeGetCurrent() - self->_startTime);
      airDropDiscoveryLogger = self->_airDropDiscoveryLogger;
    }
    self->_airDropDiscoveryLogger = 0;

    self->_startTime = 0.0;
  }
}

- (void)appendAllNode:(id)a3
{
  CFStringRef v3;
  CFStringRef v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  if (!qword_1007C6B68)
  {
    v3 = sub_1000CDAF0(CFSTR("All..."));
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = CFSTR("All...");
    qword_1007C6B68 = SFNodeCreate(0, v5, CFSTR("All..."));
    SFNodeAddKind(qword_1007C6B68, kSFNodeKindAll);
    if (v4)
      CFRelease(v4);
  }
  objc_msgSend(v6, "addObject:", qword_1007C6B68);

}

- (id)nodesInternal:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSMutableArray *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v15;

  v3 = a3;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser neighborhoodNodes](self, "neighborhoodNodes"));
  v6 = objc_msgSend(v5, "count");
  v7 = objc_opt_new(NSMutableArray);
  if (SFNodeIsRoot(self->_parent))
    v8 = v3;
  else
    v8 = 0;
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindRemoteDisc))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDNodeBrowser odiskNodes](self, "odiskNodes"));
LABEL_8:
    v10 = (NSMutableDictionary *)v9;
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v9);
    goto LABEL_12;
  }
  if (-[NSString isEqual:](self->_kind, "isEqual:", kSFBrowserKindAirDrop))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDNodeBrowser airDropNodes](self, "airDropNodes"));
    goto LABEL_8;
  }
  v10 = objc_opt_new(NSMutableDictionary);
  -[SDNodeBrowser addBonjourChildrenFromCache:](self, "addBonjourChildrenFromCache:", v10);
  -[SDNodeBrowser addWindowsChildrenFromCache:](self, "addWindowsChildrenFromCache:", v10);
  -[SDNodeBrowser addManagedChildrenFromCache:](self, "addManagedChildrenFromCache:", v10);
  -[SDNodeBrowser addConnectedChildrenFromCache:](self, "addConnectedChildrenFromCache:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v10, "allValues"));
  if (v8)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SDNodeBrowser sidebarNodesFromServerNodes:nonServerCount:addAllNode:](self, "sidebarNodesFromServerNodes:nonServerCount:addAllNode:", v11, v6, &v15));

    v11 = (void *)v12;
  }
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v11);

LABEL_12:
  if (self->_sharePointBrowser)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDNodeBrowser sharePointNodes](self, "sharePointNodes"));
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v13);

  }
  if (v8)
  {
    if (v15 && -[SDStatusMonitor allEnabled](self->_monitor, "allEnabled"))
      -[SDNodeBrowser appendAllNode:](self, "appendAllNode:", v7);
  }
  else if (v6)
  {
    -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v5);
  }

  return v7;
}

- (NSArray)nodes
{
  return (NSArray *)-[SDNodeBrowser nodesInternal:](self, "nodesInternal:", 0);
}

- (NSArray)sidebarNodes
{
  return (NSArray *)-[SDNodeBrowser nodesInternal:](self, "nodesInternal:", 1);
}

- (int)addNode:(__SFNode *)a3
{
  SDConnectedBrowser *connectedBrowser;

  connectedBrowser = self->_connectedBrowser;
  if (connectedBrowser)
    return -[SDConnectedBrowser addNode:](connectedBrowser, "addNode:", a3);
  else
    return -1;
}

- (int)removeNode:(__SFNode *)a3
{
  const __CFSet *v5;
  const __CFSet *v6;
  int v7;
  SDConnectedBrowser *connectedBrowser;

  v5 = (const __CFSet *)SFNodeCopyKinds(a3);
  if (!v5)
    return -1;
  v6 = v5;
  if (CFSetContainsValue(v5, kSFNodeKindPerson) || (connectedBrowser = self->_connectedBrowser) == 0)
    v7 = -1;
  else
    v7 = -[SDConnectedBrowser removeNode:](connectedBrowser, "removeNode:", a3);
  CFRelease(v6);
  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
  objc_storeWeak((id *)&self->_helperConnection, a3);
}

- (SDNodeBrowserDelegate)delegate
{
  return (SDNodeBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 280, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_cachedFakeMeasurements, 0);
  objc_storeStrong((id *)&self->_contactIdentifierMap, 0);
  objc_storeStrong((id *)&self->_originalNodes, 0);
  objc_storeStrong((id *)&self->_commentHashTable, 0);
  objc_storeStrong((id *)&self->_managedURLTable, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_sharePointBrowser, 0);
  objc_storeStrong((id *)&self->_workgroupBrowser, 0);
  objc_storeStrong((id *)&self->_connectedBrowser, 0);
  objc_storeStrong((id *)&self->_classroomBrowser, 0);
  objc_storeStrong((id *)&self->_managedBrowser, 0);
  objc_storeStrong((id *)&self->_domainBrowser, 0);
  objc_storeStrong((id *)&self->_windowsWorkgroups, 0);
  objc_storeStrong((id *)&self->_bonjourDomains, 0);
  objc_storeStrong((id *)&self->_airDropDomains, 0);
  objc_storeStrong((id *)&self->_odiskDomains, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_airDropDiscoveryLogger, 0);
  objc_storeStrong((id *)&self->_nodeCoalescer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
