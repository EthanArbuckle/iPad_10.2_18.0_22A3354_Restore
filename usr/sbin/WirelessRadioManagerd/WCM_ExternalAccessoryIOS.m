@implementation WCM_ExternalAccessoryIOS

- (WCM_ExternalAccessoryIOS)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCM_ExternalAccessoryIOS;
  v2 = -[WCM_ExternalAccessory init](&v4, "init");
  if (v2)
  {
    *(_QWORD *)(v2 + 12) = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", -[EAAccessoryManager connectedAccessories](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "connectedAccessories"));
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "_accessoryConnected:", EAAccessoryDidConnectNotification, 0);
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "_accessoryDisconnected:", EAAccessoryDidDisconnectNotification, 0);
    -[EAAccessoryManager registerForLocalNotifications](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "registerForLocalNotifications");
  }
  return (WCM_ExternalAccessoryIOS *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, EAAccessoryDidConnectNotification, 0);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, EAAccessoryDidDisconnectNotification, 0);
  -[EAAccessoryManager unregisterForLocalNotifications](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "unregisterForLocalNotifications");

  v3.receiver = self;
  v3.super_class = (Class)WCM_ExternalAccessoryIOS;
  -[WCM_ExternalAccessory dealloc](&v3, "dealloc");
}

- (void)_accessoryConnected:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int v10;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("External AccessoryConnected"));
  v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
  objc_msgSend(*(id *)(&self->super._eaConnection + 1), "addObject:", v5);
  v6 = objc_msgSend(v5, "name");
  v7 = objc_msgSend(v5, "manufacturer");
  v8 = objc_msgSend(v5, "modelNumber");
  v9 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:accessory connected [%@] [%@] [%@]"), v6, v7, v8);
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Medtronic")))
    goto LABEL_12;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Model 24970A")))
  {
    if ((unint64_t)objc_msgSend(v6, "length") >= 0x15)
    {
      if (objc_msgSend(objc_msgSend(v6, "substringToIndex:", 16), "isEqualToString:", objc_msgSend(CFSTR("Model 24970A SPMxxxxxxA"), "substringToIndex:", 16)))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Medtronic Base connected"));
        ++dword_100271404;
        if (!v9)
          byte_100271408 = 1;
      }
    }
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Model 24967"))
    && (unint64_t)objc_msgSend(v6, "length") >= 0x15
    && objc_msgSend(objc_msgSend(v6, "substringToIndex:", 15), "isEqualToString:", objc_msgSend(CFSTR("Model 24967 RFAxxxxxxA"), "substringToIndex:", 15)))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Medtronic Tele connected"));
    v10 = ++dword_100271404;
    if (!v9)
      byte_100271408 = 1;
  }
  else
  {
LABEL_12:
    v10 = dword_100271404;
  }
  if (v10 == 1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Send Medtrionic Connected btc"));
    -[WCM_ExternalAccessory setEaConnection:](self, "setEaConnection:", 0);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1200);
  }
}

- (void)_accessoryDisconnected:(id)a3
{
  id v5;
  WCM_ExternalAccessoryIOS *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _BOOL4 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("External AccessoryDisConnected"));
  v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self;
  v20 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  v7 = *(void **)(&self->super._eaConnection + 1);
  v8 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      v12 = 0;
      v13 = &v9[(_QWORD)v10];
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v15 = objc_msgSend(v14, "connectionID");
        if (v15 == objc_msgSend(v5, "connectionID"))
        {
          v16 = objc_msgSend(v14, "name");
          v17 = objc_msgSend(v14, "manufacturer");
          v18 = objc_msgSend(v14, "modelNumber");
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:accessory disconnected [%@] [%@] [%@]"), v16, v17, v18);
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("Medtronic")))
          {
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("Model 24970A"))
              && (unint64_t)objc_msgSend(v16, "length") >= 0x15
              && objc_msgSend(objc_msgSend(v16, "substringToIndex:", 16), "isEqualToString:", objc_msgSend(CFSTR("Model 24970A SPMxxxxxxA"), "substringToIndex:", 16))&& (+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Medtronic Base Disconnected")), dword_100271404 >= 1))
            {
              --dword_100271404;
              v19 = 1;
              if (!v20)
                byte_100271408 = 1;
            }
            else
            {
              v19 = 0;
            }
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("Model 24967"))
              && (unint64_t)objc_msgSend(v16, "length") >= 0x15)
            {
              if (objc_msgSend(objc_msgSend(v16, "substringToIndex:", 15), "isEqualToString:", objc_msgSend(CFSTR("Model 24967 RFAxxxxxxA"), "substringToIndex:", 15)))
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Medtronic Tele Disconnected"));
                if (dword_100271404 >= 1)
                {
                  --dword_100271404;
                  v19 = 1;
                  if (!v20)
                    byte_100271408 = 1;
                }
              }
              v19 = v19;
            }
            if (v19 && !dword_100271404)
            {
              -[WCM_ExternalAccessory setEaConnection:](v6, "setEaConnection:", 1);
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_ExternalAccessory:Send Medtronic Disconnected btc"));
              objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1200);
            }
          }
          objc_msgSend(*(id *)(&v6->super._eaConnection + 1), "removeObjectAtIndex:", &v12[(_QWORD)v10]);
          return;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = (char *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 = v13;
      if (v9)
        continue;
      break;
    }
  }
}

- (void)accessoryReconnect
{
  _BOOL8 v3;
  const __CFString *v4;

  if (byte_100271408 == 1)
  {
    v3 = dword_100271404 < 1;
    if (dword_100271404 >= 1)
      v4 = CFSTR("WCM_ExternalAccessory: Medtronic reset btc_param c due to WiFi was off");
    else
      v4 = CFSTR("WCM_ExternalAccessory: Medtronic reset btc_param d due to WiFi was off");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v4);
    -[WCM_ExternalAccessory setEaConnection:](self, "setEaConnection:", v3);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1200);
  }
  byte_100271408 = 0;
}

- (NSArray)connectedAccessories
{
  return *(NSArray **)(&self->super._eaConnection + 1);
}

@end
