@implementation WiFiCWFInterface

+ (id)sharedWiFiCWFInterfaceInstance
{
  if (qword_10026D598 != -1)
    dispatch_once(&qword_10026D598, &stru_10022EF68);
  return (id)qword_10026D590;
}

- (WiFiCWFInterface)init
{
  WiFiCWFInterface *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiCWFInterface;
  v2 = -[WiFiCWFInterface init](&v5, "init");
  if (v2)
  {
    if ((MGGetBoolAnswer(CFSTR("InternalBuild")) & 1) != 0)
    {
      if ((_os_feature_enabled_impl("WiFiManager", "Sensing") & 1) != 0)
      {
        -[WiFiCWFInterface set_eventHandlers:](v2, "set_eventHandlers:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        -[WiFiCWFInterface set_homeManager:](v2, "set_homeManager:", +[CWFHomeManager cwfHomeManagerWithDelegate:](CWFHomeManager, "cwfHomeManagerWithDelegate:", v2));
        v3 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:CWFHomeManager instance %p", "-[WiFiCWFInterface init]", -[WiFiCWFInterface _homeManager](v2, "_homeManager"));
        goto LABEL_6;
      }
      v3 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: OS does not support sensing, don't create this interface\n", "-[WiFiCWFInterface init]");
    }
    else
    {
      v3 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Non internal build, don't create this interface\n", "-[WiFiCWFInterface init]");
    }
    v2 = 0;
LABEL_6:
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (id)startMonitoringSupportedEvents:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableDictionary objectForKey:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "objectForKey:", v9))
        {
          v11 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: event already exists in handler", "-[WiFiCWFInterface startMonitoringSupportedEvents:]");
          objc_autoreleasePoolPop(v11);
          return (id)-3900;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v9), v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CWFHomeKitErrorDomain"), 0, 0);
}

- (id)stopMonitoringSupportedEvents:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        -[NSMutableDictionary removeObjectForKey:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CWFHomeKitErrorDomain"), 0, 0);
}

- (int)performSensingFor:(id)a3
{
  uint64_t (**v4)(id, id);

  v4 = -[WiFiCWFInterface performSensing](self, "performSensing");
  return v4[2](v4, a3);
}

- (id)getServiceFor:(id)a3 withServiceKey:(id)a4
{
  uint64_t (**v7)(id, id);
  NSError *v8;
  void *v9;
  uint64_t v11;

  if (-[NSMutableDictionary objectForKey:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "objectForKey:", a4))
  {
    v7 = (uint64_t (**)(id, id))-[NSMutableDictionary objectForKeyedSubscript:](-[WiFiCWFInterface _eventHandlers](self, "_eventHandlers"), "objectForKeyedSubscript:", a4);
    v8 = (NSError *)v7[2](v7, a3);
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:Start data collect for sensing params %@ with erorr %@", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a3, v8);
  }
  else
  {
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CWFManagerErrorDomain, -3907, 0);
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:%@ service doesn't exist", "-[WiFiCWFInterface getServiceFor:withServiceKey:]", a4, v11);
  }
  objc_autoreleasePoolPop(v9);
  return v8;
}

- (id)performSensing
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPerformSensing:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (CWFHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableDictionary)_eventHandlers
{
  return self->__eventHandlers;
}

- (void)set_eventHandlers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
