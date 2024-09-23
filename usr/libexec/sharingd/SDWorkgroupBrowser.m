@implementation SDWorkgroupBrowser

+ (id)sharedBrowser
{
  if (qword_1007C68E0 != -1)
    dispatch_once(&qword_1007C68E0, &stru_100717508);
  return (id)qword_1007C68E8;
}

- (SDWorkgroupBrowser)init
{
  SDWorkgroupBrowser *v2;
  SDWorkgroupBrowser *v3;
  SDBonjourBrowser *browser;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDWorkgroupBrowser;
  v2 = -[SDWorkgroupBrowser init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    browser = v2->_browser;
    v2->_browser = 0;

    v3->_clientCount = 0;
  }
  return v3;
}

- (NSArray)nodes
{
  return -[SDBonjourBrowser nodes](self->_browser, "nodes");
}

- (NSSet)workgroups
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDWorkgroupBrowser nodes](self, "nodes"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v2, "count")));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = (void *)SFNodeCopyRealName(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), v7);
          objc_msgSend(v4, "addObject:", v11, (_QWORD)v13);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v4 = 0;
  }

  return (NSSet *)v4;
}

- (void)bonjourNodesDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.WorkgroupsChanged"), 0, 0);

}

- (void)start
{
  int clientCount;
  SDBonjourBrowser *v4;
  void *v5;
  SDBonjourBrowser *v6;
  SDBonjourBrowser *browser;
  const __CFString *v8;

  clientCount = self->_clientCount;
  self->_clientCount = clientCount + 1;
  if (!clientCount)
  {
    v4 = [SDBonjourBrowser alloc];
    v8 = CFSTR("_workgroups._udp.");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    v6 = -[SDBonjourBrowser initWithDomain:types:](v4, "initWithDomain:types:", CFSTR("local"), v5);
    browser = self->_browser;
    self->_browser = v6;

    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", self);
    -[SDBonjourBrowser start](self->_browser, "start");
  }
}

- (void)stop
{
  int v2;
  SDBonjourBrowser *browser;

  v2 = self->_clientCount - 1;
  self->_clientCount = v2;
  if (!v2)
  {
    -[SDBonjourBrowser setDelegate:](self->_browser, "setDelegate:", 0);
    -[SDBonjourBrowser invalidate](self->_browser, "invalidate");
    browser = self->_browser;
    self->_browser = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
