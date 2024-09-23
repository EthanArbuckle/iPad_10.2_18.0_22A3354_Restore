@implementation _TVPagePerformanceTemplateEntry

- (_TVPagePerformanceTemplateEntry)initWithPagePerformanceController:(id)a3 forTemplateElement:(id)a4
{
  id v6;
  id v7;
  _TVPagePerformanceTemplateEntry *v8;
  _TVPagePerformanceTemplateEntry *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TVPagePerformanceTemplateEntry;
  v8 = -[_TVPagePerformanceTemplateEntry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_TVPagePerformanceTemplateEntry setPerformanceController:](v8, "setPerformanceController:", v6);
    -[_TVPagePerformanceTemplateEntry setTemplateElement:](v9, "setTemplateElement:", v7);
    objc_msgSend(v7, "elementName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVPagePerformanceTemplateEntry setTemplateElementName:](v9, "setTemplateElementName:", v10);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[_TVPagePerformanceTemplateEntry _stopListeningForInitialImageProxyLoadNotifications](self, "_stopListeningForInitialImageProxyLoadNotifications");
  v3.receiver = self;
  v3.super_class = (Class)_TVPagePerformanceTemplateEntry;
  -[_TVPagePerformanceTemplateEntry dealloc](&v3, sel_dealloc);
}

- (void)markTemplateWillRender
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (IsPerformanceLoggingEnabled())
  {
    v3 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateWillRender", (uint8_t *)&v6, 0xCu);

    }
  }
  -[_TVPagePerformanceTemplateEntry setTemplateWillRender:](self, "setTemplateWillRender:", mach_absolute_time());
  -[_TVPagePerformanceTemplateEntry _beginListeningForInitialImageProxyLoadNotifications](self, "_beginListeningForInitialImageProxyLoadNotifications");
}

- (void)markTemplateDidRender
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (IsPerformanceLoggingEnabled())
  {
    v3 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateDidRender", (uint8_t *)&v6, 0xCu);

    }
  }
  -[_TVPagePerformanceTemplateEntry setTemplateDidRender:](self, "setTemplateDidRender:", mach_absolute_time());
}

- (void)markTemplateWillTransition
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceTemplateEntry templateWillTransition](self, "templateWillTransition"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateWillTransition", (uint8_t *)&v6, 0xCu);

      }
    }
    -[_TVPagePerformanceTemplateEntry setTemplateWillTransition:](self, "setTemplateWillTransition:", mach_absolute_time());
  }
}

- (void)markTemplateDidTransition
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceTemplateEntry templateDidTransition](self, "templateDidTransition"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ markTemplateDidTransition", (uint8_t *)&v6, 0xCu);

      }
    }
    -[_TVPagePerformanceTemplateEntry setTemplateDidTransition:](self, "setTemplateDidTransition:", mach_absolute_time());
  }
  -[_TVPagePerformanceTemplateEntry _maybeStopListeningForInitialImageProxyLoadNotifications](self, "_maybeStopListeningForInitialImageProxyLoadNotifications");
}

- (unint64_t)templateRenderDuration
{
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(-[_TVPagePerformanceTemplateEntry templateWillRender](self, "templateWillRender"), -[_TVPagePerformanceTemplateEntry templateDidRender](self, "templateDidRender"));
}

- (unint64_t)templateResourcesDuration
{
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(-[_TVPagePerformanceTemplateEntry templateWillLoadResources](self, "templateWillLoadResources"), -[_TVPagePerformanceTemplateEntry templateDidLoadResources](self, "templateDidLoadResources"));
}

- (unint64_t)templateTransitionDuration
{
  return _TVPagePerformanceConvertMachAbsoluteTimeToMicroseconds(-[_TVPagePerformanceTemplateEntry templateWillTransition](self, "templateWillTransition"), -[_TVPagePerformanceTemplateEntry templateDidTransition](self, "templateDidTransition"));
}

- (void)_beginListeningForInitialImageProxyLoadNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSHashTable *v6;
  NSHashTable *initialOnScreenImageProxies;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!-[_TVPagePerformanceTemplateEntry templateDidLoadResources](self, "templateDidLoadResources"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ beginListeningForImageProxyLoadNotifications", (uint8_t *)&v10, 0xCu);

      }
    }
    -[_TVPagePerformanceTemplateEntry setTemplateWillLoadResources:](self, "setTemplateWillLoadResources:", mach_absolute_time());
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    initialOnScreenImageProxies = self->_initialOnScreenImageProxies;
    self->_initialOnScreenImageProxies = v6;

    *(_WORD *)&self->_listeningForImageProxyWillLoad = 257;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__receivedImageProxyWillLoadNotification_, CFSTR("_TVPagePerformanceImageProxyWillLoadNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__receivedImageProxyDidLoadNotification_, CFSTR("_TVPagePerformanceImageProxyDidLoadNotification"), 0);

  }
}

- (void)_stopListeningForInitialImageProxyLoadNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_listeningForImageProxyWillLoad || self->_listeningForImageProxyDidLoad)
  {
    if (IsPerformanceLoggingEnabled())
    {
      v3 = (void *)TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v4 = v3;
        -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_222D98000, v4, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ stopListeningForInitialImageProxyLoadNotifications", (uint8_t *)&v8, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("_TVPagePerformanceImageProxyWillLoadNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_TVPagePerformanceImageProxyDidLoadNotification"), 0);

    -[NSHashTable removeAllObjects](self->_initialOnScreenImageProxies, "removeAllObjects");
    *(_WORD *)&self->_listeningForImageProxyWillLoad = 0;
  }
}

- (void)_maybeStopListeningForInitialImageProxyLoadNotifications
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[_TVPagePerformanceTemplateEntry performanceController](self, "performanceController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "viewDidAppear")
    || !-[_TVPagePerformanceTemplateEntry templateDidTransition](self, "templateDidTransition"))
  {
LABEL_22:

    return;
  }
  v3 = -[_TVPagePerformanceTemplateEntry templateWillLoadResources](self, "templateWillLoadResources");

  if (!v3)
    return;
  if (!self->_listeningForImageProxyWillLoad && !self->_listeningForImageProxyDidLoad)
  {
    if (!-[_TVPagePerformanceTemplateEntry templateUpdateCount](self, "templateUpdateCount"))
      return;
    -[_TVPagePerformanceTemplateEntry performanceController](self, "performanceController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_maybeDeliverMetrics");
    goto LABEL_22;
  }
  if (IsPerformanceLoggingEnabled())
  {
    v4 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_222D98000, v5, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ maybeStopListeningForInitialImageProxyLoadNotifications", buf, 0xCu);

    }
  }
  if (-[NSHashTable count](self->_initialOnScreenImageProxies, "count"))
  {
    if (IsPerformanceLoggingEnabled())
    {
      v7 = TVMLKitPerformanceLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222D98000, v7, OS_LOG_TYPE_DEFAULT, "[DEBUG] Stop listening for TVImageProxyWillLoadNotification", buf, 2u);
      }
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("_TVPagePerformanceImageProxyWillLoadNotification"), 0);

    self->_listeningForImageProxyWillLoad = 0;
  }
  else
  {
    if (!-[_TVPagePerformanceTemplateEntry templateDidLoadResources](self, "templateDidLoadResources"))
    {
      if (IsPerformanceLoggingEnabled())
      {
        v9 = TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222D98000, v9, OS_LOG_TYPE_DEFAULT, "[DEBUG] No initial on-screen resources left to load.", buf, 2u);
        }
      }
      if (-[_TVPagePerformanceTemplateEntry templateDidLoadLastImageProxy](self, "templateDidLoadLastImageProxy"))
        v10 = -[_TVPagePerformanceTemplateEntry templateDidLoadLastImageProxy](self, "templateDidLoadLastImageProxy");
      else
        v10 = -[_TVPagePerformanceTemplateEntry templateWillLoadResources](self, "templateWillLoadResources");
      -[_TVPagePerformanceTemplateEntry setTemplateDidLoadResources:](self, "setTemplateDidLoadResources:", v10);
      -[_TVPagePerformanceTemplateEntry _stopListeningForInitialImageProxyLoadNotifications](self, "_stopListeningForInitialImageProxyLoadNotifications");
    }
    -[_TVPagePerformanceTemplateEntry performanceController](self, "performanceController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_maybeDeliverMetrics");

  }
}

- (void)_receivedImageProxyWillLoadNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("_TVPagePerformanceImageProxyNotificationTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  if (IsPerformanceLoggingEnabled())
  {
    v9 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_222D98000, v10, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ receivedImageProxyWillLoadNotification: %@", (uint8_t *)&v12, 0x16u);

    }
  }
  if (!-[_TVPagePerformanceTemplateEntry templateWillLoadFirstImageProxy](self, "templateWillLoadFirstImageProxy")
    || v8 < -[_TVPagePerformanceTemplateEntry templateWillLoadFirstImageProxy](self, "templateWillLoadFirstImageProxy"))
  {
    -[_TVPagePerformanceTemplateEntry setTemplateWillLoadFirstImageProxy:](self, "setTemplateWillLoadFirstImageProxy:", v8);
  }
  -[NSHashTable addObject:](self->_initialOnScreenImageProxies, "addObject:", v5);

}

- (void)_receivedImageProxyDidLoadNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("_TVPagePerformanceImageProxyNotificationTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  if (IsPerformanceLoggingEnabled())
  {
    v9 = (void *)TVMLKitPerformanceLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[_TVPagePerformanceTemplateEntry templateElementName](self, "templateElementName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_222D98000, v10, OS_LOG_TYPE_DEFAULT, "[DEBUG] %@ receivedImageProxyDidLoadNotification %@", (uint8_t *)&v14, 0x16u);

    }
  }
  if (-[NSHashTable containsObject:](self->_initialOnScreenImageProxies, "containsObject:", v5))
  {
    if (!-[_TVPagePerformanceTemplateEntry templateDidLoadLastImageProxy](self, "templateDidLoadLastImageProxy")
      || v8 > -[_TVPagePerformanceTemplateEntry templateDidLoadLastImageProxy](self, "templateDidLoadLastImageProxy"))
    {
      -[_TVPagePerformanceTemplateEntry setTemplateDidLoadLastImageProxy:](self, "setTemplateDidLoadLastImageProxy:", v8);
    }
    -[NSHashTable removeObject:](self->_initialOnScreenImageProxies, "removeObject:", v5);
    if (!self->_listeningForImageProxyWillLoad && !-[NSHashTable count](self->_initialOnScreenImageProxies, "count"))
    {
      if (IsPerformanceLoggingEnabled())
      {
        v12 = TVMLKitPerformanceLogObject;
        if (os_log_type_enabled((os_log_t)TVMLKitPerformanceLogObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_222D98000, v12, OS_LOG_TYPE_DEFAULT, "[DEBUG] All initial on-screen resources have finished loading.", (uint8_t *)&v14, 2u);
        }
      }
      -[_TVPagePerformanceTemplateEntry setTemplateDidLoadResources:](self, "setTemplateDidLoadResources:", -[_TVPagePerformanceTemplateEntry templateDidLoadLastImageProxy](self, "templateDidLoadLastImageProxy"));
      -[_TVPagePerformanceTemplateEntry _stopListeningForInitialImageProxyLoadNotifications](self, "_stopListeningForInitialImageProxyLoadNotifications");
      -[_TVPagePerformanceTemplateEntry performanceController](self, "performanceController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_maybeDeliverMetrics");

    }
  }

}

- (IKViewElement)templateElement
{
  return (IKViewElement *)objc_loadWeakRetained((id *)&self->_templateElement);
}

- (void)setTemplateElement:(id)a3
{
  objc_storeWeak((id *)&self->_templateElement, a3);
}

- (NSString)templateElementName
{
  return self->_templateElementName;
}

- (void)setTemplateElementName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)templateUpdateCount
{
  return self->_templateUpdateCount;
}

- (void)setTemplateUpdateCount:(unint64_t)a3
{
  self->_templateUpdateCount = a3;
}

- (unint64_t)templateWillRender
{
  return self->_templateWillRender;
}

- (void)setTemplateWillRender:(unint64_t)a3
{
  self->_templateWillRender = a3;
}

- (unint64_t)templateDidRender
{
  return self->_templateDidRender;
}

- (void)setTemplateDidRender:(unint64_t)a3
{
  self->_templateDidRender = a3;
}

- (unint64_t)templateWillTransition
{
  return self->_templateWillTransition;
}

- (void)setTemplateWillTransition:(unint64_t)a3
{
  self->_templateWillTransition = a3;
}

- (unint64_t)templateDidTransition
{
  return self->_templateDidTransition;
}

- (void)setTemplateDidTransition:(unint64_t)a3
{
  self->_templateDidTransition = a3;
}

- (unint64_t)templateWillLoadResources
{
  return self->_templateWillLoadResources;
}

- (void)setTemplateWillLoadResources:(unint64_t)a3
{
  self->_templateWillLoadResources = a3;
}

- (unint64_t)templateDidLoadResources
{
  return self->_templateDidLoadResources;
}

- (void)setTemplateDidLoadResources:(unint64_t)a3
{
  self->_templateDidLoadResources = a3;
}

- (unint64_t)templateWillLoadFirstImageProxy
{
  return self->_templateWillLoadFirstImageProxy;
}

- (void)setTemplateWillLoadFirstImageProxy:(unint64_t)a3
{
  self->_templateWillLoadFirstImageProxy = a3;
}

- (unint64_t)templateDidLoadLastImageProxy
{
  return self->_templateDidLoadLastImageProxy;
}

- (void)setTemplateDidLoadLastImageProxy:(unint64_t)a3
{
  self->_templateDidLoadLastImageProxy = a3;
}

- (_TVPagePerformanceController)performanceController
{
  return (_TVPagePerformanceController *)objc_loadWeakRetained((id *)&self->_performanceController);
}

- (void)setPerformanceController:(id)a3
{
  objc_storeWeak((id *)&self->_performanceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_performanceController);
  objc_storeStrong((id *)&self->_templateElementName, 0);
  objc_destroyWeak((id *)&self->_templateElement);
  objc_storeStrong((id *)&self->_initialOnScreenImageProxies, 0);
}

@end
