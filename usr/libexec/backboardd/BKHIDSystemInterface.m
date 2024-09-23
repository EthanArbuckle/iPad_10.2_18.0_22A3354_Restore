@implementation BKHIDSystemInterface

- (BKHIDEventDeliveryManager)deliveryManager
{
  return (BKHIDEventDeliveryManager *)-[BKHIDSystem deliveryManager](self->_system, "deliveryManager");
}

+ (BKHIDSystemInterface)sharedInstance
{
  if (qword_100117618 != -1)
    dispatch_once(&qword_100117618, &stru_1000ED030);
  return (BKHIDSystemInterface *)(id)qword_100117610;
}

- (id)dispatcherForEvent:(__IOHIDEvent *)a3
{
  int Type;
  BKHIDSystemInterface *v6;
  unsigned int IntegerValue;
  uint64_t v8;

  Type = IOHIDEventGetType(a3);
  v6 = self;
  if (Type == 39)
  {
    IntegerValue = IOHIDEventGetIntegerValue(a3, 2555904);
    if (IntegerValue < 2
      || IntegerValue == 5 && !-[BKHIDSystemInterface _routeSqueezeEventToSystem](v6, "_routeSqueezeEventToSystem"))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[BKTouchDeliveryGenericGestureFocusObserver sharedInstance](BKTouchDeliveryGenericGestureFocusObserver, "sharedInstance"));

      v6 = (BKHIDSystemInterface *)v8;
    }
  }
  return v6;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  if (!v8)
  {
    v9 = a4;
    v10 = objc_msgSend(v9, "senderDescriptorForEventType:", IOHIDEventGetType(a3));
    v8 = (id)objc_claimAutoreleasedReturnValue(v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystem deliveryManager](self->_system, "deliveryManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationsForEvent:sender:", a3, v8));

  return v12;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return -[BKHIDSystemInterface destinationsForEvent:fromSender:overrideSenderDescriptor:](self, "destinationsForEvent:fromSender:overrideSenderDescriptor:", a3, a4, 0);
}

- (BKHIDEventSenderCache)senderCache
{
  return (BKHIDEventSenderCache *)-[BKHIDSystem senderCache](self->_system, "senderCache");
}

- (BKHIDSystemInterface)init
{
  BKHIDSystemInterface *v2;
  uint64_t v3;
  BKHIDSystem *system;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHIDSystemInterface;
  v2 = -[BKHIDSystemInterface init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[BKHIDSystem sharedInstance](BKHIDSystem, "sharedInstance"));
    system = v2->_system;
    v2->_system = (BKHIDSystem *)v3;

    -[BKHIDSystem setDelegate:](v2->_system, "setDelegate:", v2);
  }
  return v2;
}

- (void)startHIDSystem
{
  -[BKHIDSystem startHIDSystem](self->_system, "startHIDSystem");
}

- (void)startEventRouting
{
  -[BKHIDSystem startEventRouting](self->_system, "startEventRouting");
}

- (void)startEventProcessing
{
  id v3;
  uint64_t v4;
  void *v5;
  BKMainDisplayObserver *v6;
  id v7;
  id v8;
  BKHIDEventDeliveryManagerServer *v9;
  BKHIDEventDeliveryManagerServer *deliveryManagerServer;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance"));
  v3 = objc_alloc_init((Class)BKHIDEventProcessorCreationContext);
  objc_msgSend(v3, "setSystemInterface:", self);
  objc_msgSend(v3, "setEventDispatcher:", self);
  objc_msgSend(v3, "setServiceMatcherDataProvider:", self);
  objc_msgSend(v3, "setEventProcessorRegistry:", v11);
  v4 = BKHIDCreatePrimaryEventProcessor(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init(BKMainDisplayObserver);
  v7 = objc_alloc_init((Class)BKHIDEventDeliveryObserverService);
  v8 = objc_msgSend(objc_alloc((Class)BKHIDEventDeliveryManager), "initWithObserverService:", v7);
  v9 = (BKHIDEventDeliveryManagerServer *)objc_msgSend(objc_alloc((Class)BKHIDEventDeliveryManagerServer), "initWithDeliveryManager:ruleChangeAuthority:", v8, self);
  deliveryManagerServer = self->_deliveryManagerServer;
  self->_deliveryManagerServer = v9;

  -[BKHIDSystem startEventProcessor:mainDisplayObserver:deliveryManager:dispatcherProvider:](self->_system, "startEventProcessor:mainDisplayObserver:deliveryManager:dispatcherProvider:", v5, v6, v8, self);
}

- (void)startServer
{
  id v3;
  OS_dispatch_mach *v4;
  OS_dispatch_mach *HIDSystemChannel;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = sub_10003D218("BKHIDSystem MiG server", (uint64_t)"com.apple.backboard.hid.services", (uint64_t)&off_1000ED2C0);
  v4 = (OS_dispatch_mach *)objc_claimAutoreleasedReturnValue(v3);
  HIDSystemChannel = self->_HIDSystemChannel;
  self->_HIDSystemChannel = v4;

  v7 = BKLogCommon(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "starting HID server...", v9, 2u);
  }

  -[BKHIDSystem startServerWithChannel:](self->_system, "startServerWithChannel:", self->_HIDSystemChannel);
}

- (unint64_t)permittedRuleChangeMaskForAuditToken:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __int128 v7;
  __int128 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
  v7 = 0u;
  v8 = 0u;
  if (v3)
    objc_msgSend(v3, "realToken", v7, v8);
  if (objc_msgSend(v4, "auditTokenRepresentsSystemApp:", &v7))
    v5 = 63;
  else
    v5 = 58;

  return v5;
}

- (BKHIDClientConnectionManager)clientConnectionManager
{
  return (BKHIDClientConnectionManager *)-[BKHIDSystem clientConnectionManager](self->_system, "clientConnectionManager");
}

- (id)systemPropertyForKey:(id)a3
{
  return -[BKHIDSystem systemPropertyForKey:](self->_system, "systemPropertyForKey:", a3);
}

- (void)setSystemProperty:(id)a3 forKey:(id)a4
{
  -[BKHIDSystem setSystemProperty:forKey:](self->_system, "setSystemProperty:forKey:", a3, a4);
}

- (void)injectHIDEvent:(__IOHIDEvent *)a3
{
  -[BKHIDSystem injectHIDEvent:](self->_system, "injectHIDEvent:", a3);
}

- (void)injectGSEvent:(__GSEvent *)a3
{
  -[BKHIDSystem injectGSEvent:](self->_system, "injectGSEvent:", a3);
}

- (__IOHIDEvent)systemEventOfType:(unsigned int)a3 matchingEvent:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  return (__IOHIDEvent *)-[BKHIDSystem systemEventOfType:matchingEvent:options:](self->_system, "systemEventOfType:matchingEvent:options:", *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

- (BOOL)_routeSqueezeEventToSystem
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController](BKIOHIDServicePersistentPropertyController, "digitizerServicePersistentPropertyController"));
  v11 = CFSTR("SqueezeIsSystemShortcut");
  v3 = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer](BKSHIDEventSenderDescriptor, "stylusOpaqueTouchDigitizer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentPropertiesForKeys:forSenderDescriptor:", v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("SqueezeIsSystemShortcut")));
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](BKSDefaults, "localDefaults"));
    v3 = objc_msgSend(v9, "isSqueezeForSystemShortcutEnabled");

  }
  return v3;
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
  BKSendHIDEventToClientWithDestination(a3, a4);
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterface destinationsForEvent:fromSender:](self, "destinationsForEvent:fromSender:", a3, a4));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        BKSendHIDEventToClientWithDestination(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)IOHIDServicesMatching:(id)a3
{
  return -[BKHIDSystem IOHIDServicesMatching:](self->_system, "IOHIDServicesMatching:", a3);
}

- (void)registerIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  -[BKHIDSystem registerIOHIDServicesCallback:matchingDictionary:target:refCon:](self->_system, "registerIOHIDServicesCallback:matchingDictionary:target:refCon:", a3, a4, a5, a6);
}

- (void)unregisterIOHIDServicesCallback:(void *)a3 matchingDictionary:(id)a4 target:(void *)a5 refCon:(void *)a6
{
  -[BKHIDSystem unregisterIOHIDServicesCallback:matchingDictionary:target:refCon:](self->_system, "unregisterIOHIDServicesCallback:matchingDictionary:target:refCon:", a3, a4, a5, a6);
}

- (void)hidSystem:(id)a3 receivedUpdatedDeviceOrientation:(int64_t)a4
{
  id v5;
  id v6;

  v5 = sub_10001A7F4();
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  sub_10008BB0C((uint64_t)v6, a4);

}

- (void)registerWatchdog
{
  wd_endpoint_add_work_processor(sub_100002E34, "BKHIDSystem server runloop");
}

- (OS_dispatch_mach)HIDSystemChannel
{
  return (OS_dispatch_mach *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHIDSystemChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BKHIDSystem)system
{
  return self->_system;
}

- (BKHIDEventDeliveryManagerServer)deliveryManagerServer
{
  return self->_deliveryManagerServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryManagerServer, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_HIDSystemChannel, 0);
}

@end
