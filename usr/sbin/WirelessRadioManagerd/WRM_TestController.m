@implementation WRM_TestController

- (WRM_TestController)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_TestController;
  v2 = -[WCM_Controller init](&v4, "init");
  *(_QWORD *)(v2 + 20) = objc_alloc_init((Class)NSMutableArray);
  *(_QWORD *)(v2 + 28) = objc_alloc_init((Class)NSMutableArray);
  return (WRM_TestController *)v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_TestController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (void)addConrollerToExisitngList:(id)a3
{
  objc_msgSend(*(id *)(&self->super.mProcessId + 1), "addObject:", a3);
}

- (void)removeControllerFromExistingList:(id)a3
{
  objc_msgSend(*(id *)(&self->super.mProcessId + 1), "removeObject:", a3);
}

- (void)addConrollerToNewList:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->existingControllersList + 4), "addObject:", a3);
}

- (void)removeControllerFromNewList:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->existingControllersList + 4), "removeObject:", a3);
}

- (id)getControllerForProcessId:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *(void **)(&self->super.mProcessId + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      if (objc_msgSend(v10, "getProcessId") == a3)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    if (v10)
      return v10;
  }
LABEL_11:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *(NSMutableArray **)((char *)&self->existingControllersList + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = *(_QWORD *)v18;
LABEL_13:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v14)
      objc_enumerationMutation(v11);
    v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
    if (objc_msgSend(v10, "getProcessId") == a3)
      return v10;
    if (v13 == (id)++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v10 = 0;
      if (v13)
        goto LABEL_13;
      return v10;
    }
  }
}

- (void)handleProcessRegistration:(id)a3
{
  uint64_t uint64;
  id v5;
  id v6;
  id v7;
  WCM_WiFiController *v8;
  WCM_WiFiController *v9;
  __objc2_class *v10;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageArgs");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Registering Process %d"), uint64);
  v5 = objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getSessionFor:", uint64);
  if (v5 && (v6 = objc_msgSend(v5, "getController")) != 0)
  {
    v7 = v6;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Adding Controller %@ to existingList"), v6);
    -[WRM_TestController addConrollerToExisitngList:](self, "addConrollerToExisitngList:", v7);
  }
  else
  {
    v8 = +[WCM_Controller newTestControllerForProcessId:](WCM_Controller, "newTestControllerForProcessId:", uint64);
    v9 = v8;
    switch((int)uint64)
    {
      case 1:
        qword_100271020 = (uint64_t)v8;
        v9 = objc_opt_new(WCM_WiFiController);
        qword_100271020 = (uint64_t)v9;
        if (v9)
          goto LABEL_15;
        goto LABEL_16;
      case 2:
        v10 = WCM_FTController;
        goto LABEL_10;
      case 3:
        v10 = WCM_CellularController;
        goto LABEL_10;
      case 4:
        v10 = WCM_BTController;
LABEL_10:
        v9 = (WCM_WiFiController *)objc_opt_new(v10);
        if (!v9)
          goto LABEL_16;
        goto LABEL_15;
      case 7:
        qword_100271018 = (uint64_t)v8;
        v9 = objc_opt_new(WRM_iRATClientController);
        qword_100271018 = (uint64_t)v9;
        if (v9)
          goto LABEL_15;
        goto LABEL_16;
      default:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Invalid ProcessId"), uint64);
        if (!v9)
          goto LABEL_16;
LABEL_15:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Adding Controller %@ to newList"), v9);
        -[WCM_Controller initWithConnection:processId:](v9, "initWithConnection:processId:", 0, uint64);
        -[WRM_TestController addConrollerToNewList:](self, "addConrollerToNewList:", v9);

LABEL_16:
        if ((_DWORD)uint64 != 7)
          objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerSession:ofId:", v9, uint64);
        if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported")&& uint64 <= 7&& ((1 << uint64) & 0xE2) != 0)
        {
          NSLog(CFSTR("WCM_TestController received registration message from process id=%d"), uint64);
          objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerSession:ofId:", v9, uint64);
        }
        break;
    }
  }
}

- (void)sendMessageToController:(id)a3 forProcess:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = -[WRM_TestController getControllerForProcessId:](self, "getControllerForProcessId:", a4);
  if (v6)
    objc_msgSend(v6, "handleMessage:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Controller not found for Pid %d"), v4);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WRM_TestController: Rx messages: %@"), a3);
  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Received test messageId: %llu"), uint64);
  if (uint64 - 400 >= 2)
  {
    if (uint64)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Not handled"));
    else
      -[WRM_TestController handleProcessRegistration:](self, "handleProcessRegistration:", a3);
  }
  else
  {
    objc_msgSend((id)qword_100271018, "handleMessage:", a3);
  }
}

@end
