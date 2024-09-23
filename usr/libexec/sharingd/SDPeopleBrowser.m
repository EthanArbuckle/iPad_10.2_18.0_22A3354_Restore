@implementation SDPeopleBrowser

- (SDPeopleBrowser)init
{
  SDPeopleBrowser *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *nodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDPeopleBrowser;
  v2 = -[SDPeopleBrowser init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    nodes = v2->_nodes;
    v2->_nodes = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SDPeopleBrowser stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SDPeopleBrowser;
  -[SDPeopleBrowser dealloc](&v3, "dealloc");
}

- (void)start
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v5;
  CFStringRef v6;
  CFStringRef v7;
  uint64_t v8;
  _QWORD *v9;
  SDNetworkBrowser *v10;
  SDNetworkBrowser *networkBrowser;
  void *v12;
  void *v13;
  void *v14;
  SDNetworkBrowser *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  SDXPCHelperConnection *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  if (self->_networkBrowser)
  {
    v2 = daemon_log(self);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10006551C(v3);
  }
  else
  {
    v5 = (const __CFString *)kSFBrowserKindAirDrop;
    v6 = sub_1000CDAF0(kSFBrowserKindAirDrop);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100064B4C;
    v29[3] = &unk_100715590;
    v29[4] = v6;
    v3 = objc_retainBlock(v29);
    if (v6)
      v7 = v6;
    else
      v7 = v5;
    v8 = SFNodeCreate(0, v7, v5);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100064B5C;
    v28[3] = &unk_100715590;
    v28[4] = v8;
    v9 = objc_retainBlock(v28);
    SFNodeAddKind(v8, kSFNodeKindDomain);
    SFNodeAddKind(v8, v5);
    SFNodeAddDomain(v8, CFSTR("local"));
    if (v8)
      SFNodeAddKind(v8, kSFNodeKindRoot);
    v10 = -[SDNetworkBrowser initWithKind:rootNode:]([SDNetworkBrowser alloc], "initWithKind:rootNode:", v5, v8);
    networkBrowser = self->_networkBrowser;
    self->_networkBrowser = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
    -[SDNetworkBrowser setHelperConnection:](self->_networkBrowser, "setHelperConnection:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser bundleID](self, "bundleID"));
    -[SDNetworkBrowser setBundleID:](self->_networkBrowser, "setBundleID:", v13);

    -[SDNetworkBrowser setDelegate:](self->_networkBrowser, "setDelegate:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser options](self, "options"));
    -[SDNetworkBrowser setOptions:](self->_networkBrowser, "setOptions:", v14);

    v15 = self->_networkBrowser;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser sessionID](self, "sessionID"));
    -[SDNetworkBrowser openNode:forProtocol:flags:](v15, "openNode:forProtocol:flags:", v8, v16, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser sessionID](self, "sessionID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SDPeopleBrowser for session %@"), v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
    if (v19)
    {
      v21 = daemon_log(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        sub_1000654E0(v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
      objc_msgSend(v23, "invalidate");

    }
    v24 = -[SDXPCHelperConnection initWithQueue:]([SDXPCHelperConnection alloc], "initWithQueue:", 0);
    -[SDPeopleBrowser setHelperConnection:](self, "setHelperConnection:", v24);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100064B6C;
    v27[3] = &unk_1007146D8;
    v27[4] = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
    objc_msgSend(v25, "setInvalidationHandler:", v27);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
    objc_msgSend(v26, "activate");

    ((void (*)(_QWORD *))v9[2])(v9);
    ((void (*))v3[2].isa)(v3);
  }

}

- (void)stop
{
  SDNetworkBrowser *networkBrowser;
  void *v4;

  -[SDNetworkBrowser invalidate](self->_networkBrowser, "invalidate");
  networkBrowser = self->_networkBrowser;
  self->_networkBrowser = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDPeopleBrowser helperConnection](self, "helperConnection"));
  objc_msgSend(v4, "invalidate");

  -[SDPeopleBrowser setHelperConnection:](self, "setHelperConnection:", 0);
}

- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSMutableOrderedSet *v11;
  void *v12;
  NSArray *people;
  NSArray *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSMutableOrderedSet *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSArray *v47;
  NSArray *v48;
  NSArray *v49;
  id WeakRetained;
  void *v51;
  void *v52;
  NSArray *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];

  v8 = a3;
  v9 = magic_head_log();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000655D0(v10);

  v11 = objc_opt_new(NSMutableOrderedSet);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childrenForNode:", a4));
  people = self->_people;
  v52 = v8;
  if (people)
    v14 = people;
  else
    v14 = objc_opt_new(NSArray);
  v53 = v14;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v21 = (void *)SFNodeCopyRealName(v20, v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lowercaseString"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_nodes, "objectForKeyedSubscript:", v22));
        if (v23)
        {
          v24 = v23;
          objc_msgSend(v23, "updateWithSFNode:", v20);
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[SFAirDropNode nodeWithSFNode:](SFAirDropNode, "nodeWithSFNode:", v20));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "transportBundleID"));

          if (!v25)
            objc_msgSend(v24, "setTransportBundleID:", UIActivityTypeAirDrop);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nodes, "setObject:forKeyedSubscript:", v24, v22);
        }
        -[NSMutableOrderedSet addObject:](v11, "addObject:", v24);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v17);
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v27 = v53;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  v54 = v26;
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v63 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
        if (-[NSMutableOrderedSet containsObject:](v11, "containsObject:", v32))
        {
          objc_msgSend(v56, "addObject:", v32);
        }
        else
        {
          objc_msgSend(v26, "addObject:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contactIdentifier"));
          if (v33)
            objc_msgSend(v55, "addObject:", v33);

          v34 = magic_head_log();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "displayName"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "nodeIdentifier"));
            *(_DWORD *)buf = 138412546;
            v72 = v36;
            v73 = 2112;
            v74 = v37;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing person \"%@\" (%@)", buf, 0x16u);

            v26 = v54;
          }

        }
      }
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v29);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v38 = v11;
  v39 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v40; k = (char *)k + 1)
      {
        if (*(_QWORD *)v59 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
        if (!-[NSArray containsObject:](v27, "containsObject:", v43))
          objc_msgSend(v51, "addObject:", v43);
      }
      v40 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    }
    while (v40);
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "arrayByAddingObjectsFromArray:", v51));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "sortedArrayUsingComparator:", &stru_1007155D0));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100715610));
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "filteredArrayUsingPredicate:", v46));

  v48 = self->_people;
  self->_people = v47;
  v49 = v47;

  WeakRetained = objc_loadWeakRetained((id *)&self->_diffableDelegate);
  objc_msgSend(WeakRetained, "browser:didUpdatePeople:deletedContactIdentifiers:", self, self->_people, v55);

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SFAirDropNode)currentTopNode
{
  return self->_currentTopNode;
}

- (NSArray)people
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (SDPeopleBrowserDiffableDelegate)diffableDelegate
{
  return (SDPeopleBrowserDiffableDelegate *)objc_loadWeakRetained((id *)&self->_diffableDelegate);
}

- (void)setDiffableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_diffableDelegate, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SDXPCHelperConnection)helperConnection
{
  return self->_helperConnection;
}

- (void)setHelperConnection:(id)a3
{
  objc_storeStrong((id *)&self->_helperConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_diffableDelegate);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_currentTopNode, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_networkBrowser, 0);
}

@end
