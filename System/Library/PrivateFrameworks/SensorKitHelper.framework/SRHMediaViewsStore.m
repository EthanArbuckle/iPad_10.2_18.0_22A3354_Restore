@implementation SRHMediaViewsStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _MergedGlobals_2 = (uint64_t)os_log_create("com.apple.SensorKit", "SRHMediaViewsStore");
}

- (SRHMediaViewsStore)initWithScrollView:(id)a3
{
  SRHMediaViewsStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRHMediaViewsStore;
  v4 = -[SRHMediaViewsStore init](&v6, sel_init);
  if (v4)
  {
    v4->_scrollView = (UIScrollView *)a3;
    v4->_offScreenMediaViews = (NSMapTable *)(id)objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v4->_onScreenMediaViews = (NSMapTable *)(id)objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v4->_q = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SensorKit.SKMediaEventsHelper.XPCConnection", 0);
    -[SRHMediaViewsStore setupConnection](v4, "setupConnection");
  }
  return v4;
}

- (void)setupConnection
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  id location;

  self->_connection = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SensorKit.SKMediaEventsHelper"));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25751BF40));
  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_q);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SRHMediaViewsStore_setupConnection__block_invoke;
  v5[3] = &unk_2516F0F60;
  objc_copyWeak(&v6, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __37__SRHMediaViewsStore_setupConnection__block_invoke_38;
  v4[3] = &unk_2516F0F88;
  v4[4] = self;
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v4);
  self->_connectionDidInvalidate = 0;
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __37__SRHMediaViewsStore_setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_245CD0000, v2, OS_LOG_TYPE_INFO, "Connection to SKMediaEventsHelper has been invalidated.", v4, 2u);
  }
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "setConnectionDidInvalidate:", 1);
}

void __37__SRHMediaViewsStore_setupConnection__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_245CD0000, v2, OS_LOG_TYPE_INFO, "Connection to SKMediaEventsHelper has been interrupted. %p", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSMapTable removeAllObjects](self->_offScreenMediaViews, "removeAllObjects");

  self->_offScreenMediaViews = 0;
  -[NSMapTable removeAllObjects](self->_onScreenMediaViews, "removeAllObjects");

  self->_onScreenMediaViews = 0;
  self->_scrollView = 0;
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  dispatch_release((dispatch_object_t)self->_q);

  v3.receiver = self;
  v3.super_class = (Class)SRHMediaViewsStore;
  -[SRHMediaViewsStore dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)connection
{
  if (-[SRHMediaViewsStore connectionDidInvalidate](self, "connectionDidInvalidate"))
  {

    -[SRHMediaViewsStore setupConnection](self, "setupConnection");
  }
  return self->_connection;
}

- (void)addViewToStore:(id)a3
{
  SRHMediaView *v5;

  if (!-[NSMapTable objectForKey:](self->_offScreenMediaViews, "objectForKey:"))
  {
    v5 = objc_alloc_init(SRHMediaView);
    -[NSMapTable setObject:forKey:](self->_offScreenMediaViews, "setObject:forKey:", v5, a3);

  }
}

- (void)removeViewFromStore:(id)a3
{
  id v5;
  NSMapTable **p_offScreenMediaViews;
  id v7;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  p_offScreenMediaViews = &self->_offScreenMediaViews;
  if (!-[NSMapTable objectForKey:](self->_offScreenMediaViews, "objectForKey:", a3))
  {
    p_offScreenMediaViews = &self->_onScreenMediaViews;
    v7 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", a3);
    if (!v7)
      return;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v7, "uuid"), "UUIDString"));
    -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5));
  }
  -[NSMapTable removeObjectForKey:](*p_offScreenMediaViews, "removeObjectForKey:", a3);
}

- (void)markViewsAsOffScreen
{
  id v3;
  NSEnumerator *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  NSObject *v12;
  UIScrollView *scrollView;
  __int128 v14;
  NSEnumerator *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  UIScrollView *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[NSMapTable keyEnumerator](self->_onScreenMediaViews, "keyEnumerator");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 134218499;
    v14 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", v10, v14);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v11, "uuid"), "UUIDString"));
        v12 = _MergedGlobals_2;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
        {
          scrollView = self->_scrollView;
          *(_DWORD *)buf = v14;
          v21 = v10;
          v22 = 2113;
          v23 = v11;
          v24 = 2048;
          v25 = scrollView;
          _os_log_impl(&dword_245CD0000, v12, OS_LOG_TYPE_INFO, "OffScreen event for view:%p, %{private}@, scrollView:%p (mark all visible media as offScreen)", buf, 0x20u);
        }
      }
      v7 = -[NSEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v7);
  }
  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3));
}

- (void)markViewsAsOnScreen
{
  id v3;
  NSEnumerator *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  UIScrollView *scrollView;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  UIScrollView *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[NSMapTable keyEnumerator](self->_onScreenMediaViews, "keyEnumerator");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138478083;
    v13 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), v13);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), objc_msgSend((id)objc_msgSend(v10, "uuid"), "UUIDString"));
        v11 = _MergedGlobals_2;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
        {
          scrollView = self->_scrollView;
          *(_DWORD *)buf = v13;
          v19 = v10;
          v20 = 2048;
          v21 = scrollView;
          _os_log_impl(&dword_245CD0000, v11, OS_LOG_TYPE_INFO, "OnScreen event for %{private}@, scrollView:%p (app is active)", buf, 0x16u);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v7);
  }
  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3));
}

- (CGRect)scrollViewVisibleArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  v4 = v3;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v6 = v4 + v5;
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  v8 = v7;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v10 = v8 + v9;
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  v12 = v11;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v14 = v13;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v16 = v12 - (v14 + v15);
  objc_msgSend((id)-[UIScrollView superview](self->_scrollView, "superview"), "bounds");
  v18 = v17;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v20 = v19;
  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v22 = v18 - (v20 + v21);
  v23 = v6;
  v24 = v10;
  v25 = v16;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)processScrollViewOffset
{
  void *v3;
  NSEnumerator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double width;
  double height;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  UIScrollView *scrollView;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  NSMapTable *onScreenMediaViews;
  NSMapTable *offScreenMediaViews;
  NSEnumerator *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  NSObject *v75;
  UIScrollView *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t k;
  uint64_t v85;
  __int128 v86;
  id v87;
  id v88;
  uint64_t v89;
  NSEnumerator *obj;
  uint64_t v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _QWORD v122[16];
  _BYTE buf[24];
  void (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  uint64_t v126;
  uint64_t v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  v127 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v124 = __Block_byref_object_copy__0;
  v125 = __Block_byref_object_dispose__0;
  v3 = (void *)qword_254419A98;
  v126 = qword_254419A98;
  if (!qword_254419A98)
  {
    v122[0] = MEMORY[0x24BDAC760];
    v122[1] = 3221225472;
    v122[2] = __getUIApplicationClass_block_invoke;
    v122[3] = &unk_2516F0E60;
    v122[4] = buf;
    __getUIApplicationClass_block_invoke((uint64_t)v122);
    v3 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  _Block_object_dispose(buf, 8);
  v89 = objc_msgSend((id)objc_msgSend(v3, "sharedApplication"), "applicationState");
  v87 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = -[NSMapTable keyEnumerator](self->_onScreenMediaViews, "keyEnumerator");
  v92 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v107 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        v9 = -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", v8);
        objc_msgSend(v8, "bounds");
        objc_msgSend(v8, "convertPoint:toView:", -[UIScrollView superview](self->_scrollView, "superview"), v10, v11);
        v13 = v12;
        v15 = v14;
        objc_msgSend(v8, "bounds");
        v17 = v16;
        objc_msgSend(v8, "bounds");
        v19 = v18;
        objc_msgSend(v9, "setPosition:", v13, v15, v17);
        -[SRHMediaViewsStore scrollViewVisibleArea](self, "scrollViewVisibleArea");
        v132.origin.x = v20;
        v132.origin.y = v21;
        v132.size.width = v22;
        v132.size.height = v23;
        v128.origin.x = v13;
        v128.origin.y = v15;
        v128.size.width = v17;
        v128.size.height = v19;
        v129 = CGRectIntersection(v128, v132);
        width = v129.size.width;
        height = v129.size.height;
        if (CGRectIsNull(v129))
          v26 = 0.0;
        else
          v26 = width * height;
        objc_msgSend(v8, "bounds");
        v28 = v27;
        objc_msgSend(v8, "bounds");
        if (v26 < v28 * v29 * 0.5)
        {
          objc_msgSend(v92, "addObject:", v8);
          if (!v89)
          {
            objc_msgSend(v87, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0), objc_msgSend((id)objc_msgSend(v9, "uuid"), "UUIDString"));
            v30 = _MergedGlobals_2;
            if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
            {
              scrollView = self->_scrollView;
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2113;
              *(_QWORD *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2048;
              v124 = (void (*)(uint64_t, uint64_t))scrollView;
              _os_log_impl(&dword_245CD0000, v30, OS_LOG_TYPE_INFO, "OffScreen event for view:%p, %{private}@, scrollView:%p", buf, 0x20u);
            }
          }
        }
      }
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    }
    while (v5);
  }
  v93 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  obj = -[NSMapTable keyEnumerator](self->_offScreenMediaViews, "keyEnumerator");
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v32 = -[NSEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
  if (v32)
  {
    v91 = *(_QWORD *)v103;
    *(_QWORD *)&v33 = 134218499;
    v86 = v33;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v103 != v91)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v34);
        objc_msgSend(v35, "bounds", v86);
        if (v36 > 67.0)
        {
          objc_msgSend(v35, "bounds");
          if (v37 > 67.0)
          {
            v88 = -[NSMapTable objectForKey:](self->_offScreenMediaViews, "objectForKey:", v35);
            objc_msgSend(v35, "bounds");
            objc_msgSend(v35, "convertPoint:toView:", -[UIScrollView superview](self->_scrollView, "superview"), v38, v39);
            v41 = v40;
            v43 = v42;
            objc_msgSend(v35, "bounds");
            v45 = v44;
            objc_msgSend(v35, "bounds");
            v47 = v46;
            -[SRHMediaViewsStore scrollViewVisibleArea](self, "scrollViewVisibleArea");
            v133.origin.x = v48;
            v133.origin.y = v49;
            v133.size.width = v50;
            v133.size.height = v51;
            v130.origin.x = v41;
            v130.origin.y = v43;
            v130.size.width = v45;
            v130.size.height = v47;
            v131 = CGRectIntersection(v130, v133);
            v52 = v131.size.width;
            v53 = v131.size.height;
            v54 = CGRectIsNull(v131) ? 0.0 : v52 * v53;
            objc_msgSend(v35, "bounds");
            v56 = v55;
            objc_msgSend(v35, "bounds");
            if (v54 >= v56 * v57 * 0.5)
            {
              offScreenMediaViews = self->_offScreenMediaViews;
              onScreenMediaViews = self->_onScreenMediaViews;
              v60 = -[NSMapTable keyEnumerator](onScreenMediaViews, "keyEnumerator");
              v116 = 0u;
              v117 = 0u;
              v114 = 0u;
              v115 = 0u;
              v61 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v114, buf, 16);
              if (v61)
              {
                v62 = *(_QWORD *)v115;
LABEL_32:
                v63 = 0;
                while (1)
                {
                  if (*(_QWORD *)v115 != v62)
                    objc_enumerationMutation(v60);
                  objc_msgSend(-[NSMapTable objectForKey:](onScreenMediaViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v63)), "position");
                  if (isAreaOccupied(v64, v65, v66, v67, v41, v43, v45, v47))
                    break;
                  if (v61 == ++v63)
                  {
                    v61 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v114, buf, 16);
                    if (v61)
                      goto LABEL_32;
                    goto LABEL_38;
                  }
                }
              }
              else
              {
LABEL_38:
                v112 = 0u;
                v113 = 0u;
                v110 = 0u;
                v111 = 0u;
                v68 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
                if (v68)
                {
                  v69 = *(_QWORD *)v111;
LABEL_40:
                  v70 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v111 != v69)
                      objc_enumerationMutation(v93);
                    objc_msgSend(-[NSMapTable objectForKey:](offScreenMediaViews, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v70)), "position");
                    if (isAreaOccupied(v71, v72, v73, v74, v41, v43, v45, v47))
                      break;
                    if (v68 == ++v70)
                    {
                      v68 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
                      if (v68)
                        goto LABEL_40;
                      goto LABEL_46;
                    }
                  }
                }
                else
                {
LABEL_46:
                  objc_msgSend(v93, "addObject:", v35);
                  objc_msgSend(v88, "setPosition:", v41, v43, v45, v47);
                  if (!v89)
                  {
                    objc_msgSend(v87, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), objc_msgSend((id)objc_msgSend(v88, "uuid"), "UUIDString"));
                    v75 = _MergedGlobals_2;
                    if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_INFO))
                    {
                      v76 = self->_scrollView;
                      *(_DWORD *)buf = v86;
                      *(_QWORD *)&buf[4] = v35;
                      *(_WORD *)&buf[12] = 2113;
                      *(_QWORD *)&buf[14] = v88;
                      *(_WORD *)&buf[22] = 2048;
                      v124 = (void (*)(uint64_t, uint64_t))v76;
                      _os_log_impl(&dword_245CD0000, v75, OS_LOG_TYPE_INFO, "OnScreen event for view:%p, %{private}@, scrollView:%p", buf, 0x20u);
                    }
                  }
                }
              }
            }
          }
        }
        ++v34;
      }
      while (v34 != v32);
      v77 = -[NSEnumerator countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
      v32 = v77;
    }
    while (v77);
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v78 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
  if (v78)
  {
    v79 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v78; ++j)
      {
        if (*(_QWORD *)v99 != v79)
          objc_enumerationMutation(v92);
        v81 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
        -[NSMapTable setObject:forKey:](self->_offScreenMediaViews, "setObject:forKey:", -[NSMapTable objectForKey:](self->_onScreenMediaViews, "objectForKey:", v81), v81);
        -[NSMapTable removeObjectForKey:](self->_onScreenMediaViews, "removeObjectForKey:", v81);
      }
      v78 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    }
    while (v78);
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v82 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v82; ++k)
      {
        if (*(_QWORD *)v95 != v83)
          objc_enumerationMutation(v93);
        v85 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * k);
        -[NSMapTable setObject:forKey:](self->_onScreenMediaViews, "setObject:forKey:", -[NSMapTable objectForKey:](self->_offScreenMediaViews, "objectForKey:", v85), v85);
        -[NSMapTable removeObjectForKey:](self->_offScreenMediaViews, "removeObjectForKey:", v85);
      }
      v82 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
    }
    while (v82);
  }

  -[SRHMediaViewsStore _writeMediaEventsToBiome:](self, "_writeMediaEventsToBiome:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v87));
}

- (void)removeAllViews
{
  -[SRHMediaViewsStore markViewsAsOffScreen](self, "markViewsAsOffScreen");
  -[NSMapTable removeAllObjects](self->_onScreenMediaViews, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_offScreenMediaViews, "removeAllObjects");
}

- (void)_writeMediaEventsToBiome:(id)a3
{
  if (objc_msgSend(a3, "count"))
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](-[SRHMediaViewsStore connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1), "writeMediaEvents:withTimestamp:reply:", a3, &__block_literal_global_46, CFAbsoluteTimeGetCurrent());
}

void __47__SRHMediaViewsStore__writeMediaEventsToBiome___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = _MergedGlobals_2;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_ERROR))
  {
    v4 = 138477827;
    v5 = a2;
    _os_log_error_impl(&dword_245CD0000, v3, OS_LOG_TYPE_ERROR, "Failed to set up connection with mediaEventsHelper sevice because of %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void __47__SRHMediaViewsStore__writeMediaEventsToBiome___block_invoke_45(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = _MergedGlobals_2;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_2, OS_LOG_TYPE_ERROR))
    {
      v4 = 138477827;
      v5 = a2;
      _os_log_error_impl(&dword_245CD0000, v3, OS_LOG_TYPE_ERROR, "Failed to write to Biome because of %{private}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)connectionDidInvalidate
{
  return self->_connectionDidInvalidate;
}

- (void)setConnectionDidInvalidate:(BOOL)a3
{
  self->_connectionDidInvalidate = a3;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
