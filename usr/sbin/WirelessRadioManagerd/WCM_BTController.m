@implementation WCM_BTController

- (BOOL)powerState
{
  return BYTE4(self->mBTCtlQueue);
}

- (BOOL)isBtAntennaDesensed
{
  return 0;
}

- (WCM_BTController)init
{
  char *v2;
  char *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WCM_BTController;
  v2 = -[WCM_Controller init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2[36] = 0;
    *((_DWORD *)v2 + 10) = 0;
    *(_QWORD *)(v2 + 148) = objc_alloc_init((Class)NSMutableArray);
    *(_QWORD *)(v3 + 44) = 0;
    *(_QWORD *)(v3 + 52) = 0;
    *(_QWORD *)(v3 + 60) = 0;
    *(_QWORD *)(v3 + 68) = 0;
    *(_QWORD *)(v3 + 76) = 0;
    *(_QWORD *)(v3 + 84) = 0;
    *(_QWORD *)(v3 + 92) = 0;
    *(_QWORD *)(v3 + 100) = 0;
    *(_QWORD *)(v3 + 108) = 0;
    qword_100270FB8 = 0;
    qword_100270FB0 = 0;
    *(_QWORD *)(v3 + 116) = 0;
    *(_QWORD *)(v3 + 124) = 0;
    *(_QWORD *)(v3 + 132) = 0;
    *(_QWORD *)(v3 + 140) = 0;
    if (objc_opt_class(AADeviceManager))
    {
      *(_QWORD *)(v3 + 156) = objc_alloc_init((Class)NSString);
      *(_QWORD *)(v3 + 28) = dispatch_queue_create("com.apple.WirelessRadioManager.BTCtl", 0);
      v4 = objc_alloc_init((Class)AADeviceManager);
      *(_QWORD *)(v3 + 20) = v4;
      objc_msgSend(v4, "setDispatchQueue:", *(_QWORD *)(v3 + 28));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10008A348;
      v9[3] = &unk_100203A98;
      v9[4] = v3;
      objc_msgSend(*(id *)(v3 + 20), "setDeviceFoundHandler:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10008A354;
      v8[3] = &unk_100203A98;
      v8[4] = v3;
      objc_msgSend(*(id *)(v3 + 20), "setDeviceLostHandler:", v8);
      v5 = *(void **)(v3 + 20);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10008A360;
      v7[3] = &unk_100203B00;
      v7[4] = v3;
      objc_msgSend(v5, "activateWithCompletion:", v7);
    }
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BTController Init"));
  return (WCM_BTController *)v3;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BTController Dealloc"));
  -[NSMutableArray removeAllObjects](-[WCM_BTController btConnections](self, "btConnections"), "removeAllObjects");

  objc_msgSend(*(id *)(&self->super.mProcessId + 1), "invalidate");
  dispatch_release(*(dispatch_object_t *)((char *)&self->deviceManager + 4));
  *(AADeviceManager **)((char *)&self->deviceManager + 4) = 0;
  if (qword_100270FB8)
    xpc_release((xpc_object_t)qword_100270FB8);
  if (qword_100270FB0)
    xpc_release((xpc_object_t)qword_100270FB0);
  v3.receiver = self;
  v3.super_class = (Class)WCM_BTController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)handleLocalDeviceState:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    uint64 = xpc_dictionary_get_uint64(value, "kWCMBTLocalDeviceState");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("BT powerState(%d -> %d)"), -[WCM_BTController powerState](self, "powerState"), uint64 != 0);
    if (uint64 != -[WCM_BTController powerState](self, "powerState"))
    {
      -[WCM_BTController handlePowerState:](self, "handlePowerState:", uint64 != 0);
      objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 506);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error Getting Args"));
  }
}

- (void)handleConnectionConfig:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;
  uint64_t v6;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(value, "kWCMBTConnectionConfiguration_EventId");
  v6 = xpc_dictionary_get_uint64(value, "kWCMBTConnectionConfiguration_Result");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received BT connection indication eventId(%llu) result(%llu)"), uint64, v6);
  if (uint64 == 12)
  {
    if (v6 == 307)
      objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleErrorReport:", 0);
    -[WCM_BTController removeBTConnection:](self, "removeBTConnection:", value);
  }
  else if (uint64 == 11 && !v6)
  {
    -[WCM_BTController addBTConnection:](self, "addBTConnection:", value);
  }
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 500);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1300);
}

- (void)handleAudioConfig:(id)a3
{
  xpc_object_t value;
  uint64_t uint64;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  uint64 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_Type");
  v7 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_PacketType");
  v8 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_ConnectionState");
  v9 = xpc_dictionary_get_uint64(value, "kWCMBTAudioConfiguration_Role");
  v10 = (xpc_object_t)qword_100270FB8;
  if (!qword_100270FB8)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    qword_100270FB8 = (uint64_t)v10;
  }
  if (xpc_equal(v10, a3))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Discard the same message %@"), qword_100270FB8);
  }
  else
  {
    xpc_release((xpc_object_t)qword_100270FB8);
    qword_100270FB8 = (uint64_t)xpc_copy(a3);
    switch(uint64)
    {
      case 1uLL:
        -[WCM_BTController setAudioType:](self, "setAudioType:", 3);
        if (v7)
        {
          if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            -[WCM_BTController setAudioType:](self, "setAudioType:", 2);
            v11 = *(unint64_t *)((char *)&self->numSCODevice + 4);
            if (v8)
            {
              v12 = v11 + 1;
              *(unint64_t *)((char *)&self->numSCODevice + 4) = v12;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig : Received eSCO connection increase with count %lu"), v12);
            }
            else if (v11)
            {
              v27 = v11 - 1;
              *(unint64_t *)((char *)&self->numSCODevice + 4) = v27;
              +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig : Received eSCO connection drop with count %lu"), v27);
            }
          }
        }
        else
        {
          -[WCM_BTController setAudioType:](self, "setAudioType:", 1);
          v20 = *(_QWORD *)&self->_audioType;
          if (v8)
          {
            v21 = v20 + 1;
            *(_QWORD *)&self->_audioType = v21;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received SCO connection increase with count %lu"), v21);
          }
          else if (v20)
          {
            v26 = v20 - 1;
            *(_QWORD *)&self->_audioType = v26;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received SCO connection drop with count %lu"), v26);
          }
        }
        goto LABEL_34;
      case 2uLL:
        -[WCM_BTController setAudioType:](self, "setAudioType:", 4);
        v15 = *(unint64_t *)((char *)&self->numeSCODevice + 4);
        if (v8)
        {
          v16 = v15 + 1;
          *(unint64_t *)((char *)&self->numeSCODevice + 4) = v16;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig : Received A2DP connection increase with count %lu"), v16);
        }
        else if (v15)
        {
          v22 = v15 - 1;
          *(unint64_t *)((char *)&self->numeSCODevice + 4) = v22;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig : Received A2DP connection drop with count %lu"), v22);
        }
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateGpsbandsInfoForBB");
        goto LABEL_34;
      case 3uLL:
        -[WCM_BTController setAudioType:](self, "setAudioType:", 5);
        v17 = *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4);
        if (v8)
        {
          v18 = v17 + 1;
          *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = v18;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received LEA connection increase with count %lu"), v18);
        }
        else if (v17)
        {
          v23 = v17 - 1;
          *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = v23;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received LEA connection drop with count %lu"), v23);
        }
        goto LABEL_34;
      case 4uLL:
        if (v7 == 2)
        {
          v24 = *(unint64_t *)((char *)&self->numLEDevice + 4);
          if (v24)
          {
            v25 = v24 - 1;
            *(unint64_t *)((char *)&self->numLEDevice + 4) = v25;
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received LLA connection drop with count %lu"), v25);
          }
        }
        else if (v7 == 1)
        {
          v19 = *(unint64_t *)((char *)&self->numLEDevice + 4) + 1;
          *(unint64_t *)((char *)&self->numLEDevice + 4) = v19;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Received LLA connection increase with count %lu"), v19);
        }
        else
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HandleAudioConfig: Incorrect LLA pktType state received %llu"), v7);
        }
LABEL_34:
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Audio config: role(%llu) state(%llu) type(%llu) pktType(%llu) audioType(%d) coexAudioStateChange(%d)"), v9, v8, uint64, v7, -[WCM_BTController audioType](self, "audioType"), 1);
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 501);
        -[WCM_BTController printBTConnections](self, "printBTConnections");
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
        v13 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
        v14 = 1300;
        break;
      default:
        if (!v8)
          -[WCM_BTController setAudioType:](self, "setAudioType:", 0);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Audio config: role(%llu) state(%llu) type(%llu) pktType(%llu) audioType(%d) coexAudioStateChange(%d)"), v9, v8, uint64, v7, -[WCM_BTController audioType](self, "audioType"), 0);
        v13 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
        v14 = 501;
        break;
    }
    objc_msgSend(v13, "updateControllerState:", v14);
  }
}

- (void)addBTConnection:(id)a3
{
  NSString *v5;
  NSString *v6;
  __int16 uint64;
  uint64_t v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  WCM_BTConnection *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a3, "kWCMBTConnectionConfiguration_Address"));
  if (!v5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("no BT address specified"));
    return;
  }
  v6 = v5;
  uint64 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ServiceId");
  v8 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_RequiresRC2CoExType");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = -[WCM_BTController btConnections](self, "btConnections");
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_4:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
      if (-[NSString compare:](v6, "compare:", objc_msgSend(v14, "getAddress")) == NSOrderedSame)
        break;
      if (v11 == (id)++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
    objc_msgSend(v14, "updateConnectionInfo:", a3);
    if (v14)
      goto LABEL_21;
  }
LABEL_12:
  v15 = [WCM_BTConnection alloc];
  -[WCM_BTConnection initWithAddress:](v15, "initWithAddress:", v6);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Adding New BT Connection"));
  -[NSMutableArray addObject:](-[WCM_BTController btConnections](self, "btConnections"), "addObject:", v15);
  -[WCM_BTConnection updateConnectionInfo:](v15, "updateConnectionInfo:", a3);
  -[WCM_BTConnection manageServiceConnection](v15, "manageServiceConnection");

  if ((uint64 & 0x20) != 0)
  {
    -[WCM_BTController setNumHIDDevice:](self, "setNumHIDDevice:", (char *)-[WCM_BTController numHIDDevice](self, "numHIDDevice") + 1);
    if (v8 == 2)
    {
      -[WCM_BTController setNumGameCtrlDev10ms:](self, "setNumGameCtrlDev10ms:", (char *)-[WCM_BTController numGameCtrlDev10ms](self, "numGameCtrlDev10ms") + 1);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Adding 10 ms Game controller connection device count - total %lu"), -[WCM_BTController numGameCtrlDev10ms](self, "numGameCtrlDev10ms"));
    }
    else if (v8 == 1)
    {
      -[WCM_BTController setNumGameCtrlDev75ms:](self, "setNumGameCtrlDev75ms:", (char *)-[WCM_BTController numGameCtrlDev75ms](self, "numGameCtrlDev75ms") + 1);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Adding 7.5 ms Game controller connection device count - total %lu"), -[WCM_BTController numGameCtrlDev75ms](self, "numGameCtrlDev75ms"));
    }
    goto LABEL_20;
  }
  if (uint64 < 0)
  {
    -[WCM_BTController setNumLEDevice:](self, "setNumLEDevice:", (char *)-[WCM_BTController numLEDevice](self, "numLEDevice") + 1);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Adding new LE device - total %lu"), -[WCM_BTController numLEDevice](self, "numLEDevice"));
LABEL_20:
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
    -[WCM_BTController printBTConnections](self, "printBTConnections");
  }
LABEL_21:
  -[WCM_BTController printBTConnInfo](self, "printBTConnInfo");
}

- (void)removeBTConnection:(id)a3
{
  NSString *v5;
  NSString *v6;
  __int16 uint64;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a3, "kWCMBTConnectionConfiguration_Address"));
  if (v5)
  {
    v6 = v5;
    uint64 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_ServiceId");
    v8 = xpc_dictionary_get_uint64(a3, "kWCMBTConnectionConfiguration_RequiresRC2CoExType");
    if ((uint64 & 0x20) != 0)
    {
      v9 = v8;
      if (-[WCM_BTController numHIDDevice](self, "numHIDDevice"))
      {
        -[WCM_BTController setNumHIDDevice:](self, "setNumHIDDevice:", (char *)-[WCM_BTController numHIDDevice](self, "numHIDDevice") - 1);
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
        -[WCM_BTController printBTConnections](self, "printBTConnections");
      }
      if (v9 == 2)
      {
        if (-[WCM_BTController numGameCtrlDev10ms](self, "numGameCtrlDev10ms"))
        {
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Removing 10ms Game controller connection device count"));
          -[WCM_BTController setNumGameCtrlDev10ms:](self, "setNumGameCtrlDev10ms:", (char *)-[WCM_BTController numGameCtrlDev10ms](self, "numGameCtrlDev10ms") - 1);
        }
      }
      else if (v9 == 1 && -[WCM_BTController numGameCtrlDev75ms](self, "numGameCtrlDev75ms"))
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Removing 7.5ms Game controller connection device count"));
        -[WCM_BTController setNumGameCtrlDev75ms:](self, "setNumGameCtrlDev75ms:", (char *)-[WCM_BTController numGameCtrlDev75ms](self, "numGameCtrlDev75ms") - 1);
      }
    }
    else if (uint64 < 0 && -[WCM_BTController numLEDevice](self, "numLEDevice"))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Removing LE Device"));
      -[WCM_BTController setNumLEDevice:](self, "setNumLEDevice:", (char *)-[WCM_BTController numLEDevice](self, "numLEDevice") - 1);
      objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
      -[WCM_BTController printBTConnections](self, "printBTConnections");
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = -[WCM_BTController btConnections](self, "btConnections");
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (-[NSString compare:](v6, "compare:", objc_msgSend(v15, "getAddress")) == NSOrderedSame)
          {
            if (v15)
            {
              objc_msgSend(v15, "manageServiceDisconnection");
              if (!objc_msgSend(v15, "getServiceCount"))
              {
                +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Removing BT Connection %@"), v15);
                -[NSMutableArray removeObject:](-[WCM_BTController btConnections](self, "btConnections"), "removeObject:", v15);
              }
            }
            goto LABEL_27;
          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_27:
    -[WCM_BTController printBTConnections](self, "printBTConnections");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
    -[WCM_BTController printBTConnInfo](self, "printBTConnInfo");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("no BT address specified"));
  }
}

- (void)printBTConnInfo
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT has %lu connections"), -[NSMutableArray count](-[WCM_BTController btConnections](self, "btConnections"), "count"));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[WCM_BTController btConnections](self, "btConnections");
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)handlePowerState:(BOOL)a3
{
  BYTE4(self->mBTCtlQueue) = a3;
  if (!a3)
  {
    *(_DWORD *)&self->_powerState = 0;
    *(unint64_t *)((char *)&self->numSCODevice + 4) = 0;
    *(unint64_t *)((char *)&self->numeSCODevice + 4) = 0;
    *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = 0;
    *(unint64_t *)((char *)&self->numLEADevice + 4) = 0;
    *(_QWORD *)&self->_audioType = 0;
    *(unint64_t *)((char *)&self->numA2DPDevice + 4) = 0;
    *(unint64_t *)((char *)&self->numLEDevice + 4) = 0;
    *(unint64_t *)((char *)&self->numLLADevice + 4) = 0;
    *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = 0;
    *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = 0;
    *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = 0;
    *(NSMutableArray **)((char *)&self->_btConnections + 4) = (NSMutableArray *)&stru_100219FA0;
    if (qword_100270FB8)
    {
      xpc_release((xpc_object_t)qword_100270FB8);
      qword_100270FB8 = 0;
    }
    if (qword_100270FB0)
    {
      xpc_release((xpc_object_t)qword_100270FB0);
      qword_100270FB0 = 0;
    }
    -[NSMutableArray removeAllObjects](-[WCM_BTController btConnections](self, "btConnections"), "removeAllObjects");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
    -[WCM_BTController printBTConnections](self, "printBTConnections");
  }
}

- (void)handleAADeviceFound:(id)a3
{
  unsigned __int8 v5;
  unsigned int v6;
  char *v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  int *v11;
  unsigned int v12;
  char *v13;
  const __CFString *v14;
  unsigned int v15;
  unsigned int v16;
  const __CFString *v17;
  int *v18;
  WCM_BTController *v19;
  uint64_t v20;
  WCM_BTController *v21;
  uint64_t v22;

  v5 = -[NSString isEqualToString:](-[WCM_BTController AoSDeviceID](self, "AoSDeviceID"), "isEqualToString:", objc_msgSend(a3, "identifier"));
  v6 = objc_msgSend(a3, "streamStateAoS");
  if ((v5 & 1) != 0)
  {
    if (v6 != 2)
    {
      v12 = objc_msgSend(a3, "streamStateAoS");
      if (v12 != 3)
      {
        -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", &stru_100219FA0);
        -[WCM_BTController clearAoSDeviceCounts](self, "clearAoSDeviceCounts");
        -[WCM_BTController setAudioType:](self, "setAudioType:", 0);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BTController: Dropping AoS Link"));
LABEL_42:
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
        -[WCM_BTController printBTConnections](self, "printBTConnections");
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 501);
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
        objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1300);
        return;
      }
      if (objc_msgSend(a3, "frequencyBand") == 2)
      {
        v13 = (char *)&self->num2GHzAoSBiAudioDevice + 4;
        if (!*(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4))
        {
          v14 = CFSTR("BTController: Updating link to 5GHz AoS Bi-Dir");
LABEL_39:
          -[WCM_BTController clearAoSDeviceCounts](self, "clearAoSDeviceCounts");
          *(_QWORD *)v13 = 1;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v14);
LABEL_40:
          v21 = self;
          v22 = 7;
          goto LABEL_41;
        }
      }
      else
      {
        v13 = (char *)&self->num5GHzAoSUniAudioDevice + 4;
        if (!*(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4))
        {
          v14 = CFSTR("BTController: Updating link to 2GHz AoS Bi-Dir");
          goto LABEL_39;
        }
      }
      v19 = self;
      v20 = 7;
LABEL_34:
      -[WCM_BTController setAudioType:](v19, "setAudioType:", v20);
      return;
    }
    if (objc_msgSend(a3, "frequencyBand") == 2)
    {
      v7 = (char *)&self->num2GHzAoSUniAudioDevice + 4;
      if (!*(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4))
      {
        v8 = CFSTR("BTController: Updating link to 5GHz AoS Uni-Dir");
LABEL_36:
        -[WCM_BTController clearAoSDeviceCounts](self, "clearAoSDeviceCounts");
        *(_QWORD *)v7 = 1;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v8);
LABEL_37:
        v21 = self;
        v22 = 6;
LABEL_41:
        -[WCM_BTController setAudioType:](v21, "setAudioType:", v22);
        goto LABEL_42;
      }
    }
    else
    {
      v7 = (char *)&self->numLLADevice + 4;
      if (!*(unint64_t *)((char *)&self->numLLADevice + 4))
      {
        v8 = CFSTR("BTController: Updating link to 2GHz AoS Uni-Dir");
        goto LABEL_36;
      }
    }
    v19 = self;
    v20 = 6;
    goto LABEL_34;
  }
  if (v6 == 2)
  {
    v9 = objc_msgSend(a3, "frequencyBand");
    if (v9 == 2)
      v10 = CFSTR("BTController: New 5GHz Uni-Dir AoS session started");
    else
      v10 = CFSTR("BTController: New 2GHz Uni-Dir AoS session started");
    if (v9 == 2)
      v11 = &OBJC_IVAR___WCM_BTController_num5GHzAoSUniAudioDevice;
    else
      v11 = &OBJC_IVAR___WCM_BTController_num2GHzAoSUniAudioDevice;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v10);
    *(Class *)((char *)&self->super.super.isa + *v11) = (Class)1;
    -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", objc_msgSend(a3, "identifier"));
    goto LABEL_37;
  }
  v15 = objc_msgSend(a3, "streamStateAoS");
  if (v15 == 3)
  {
    v16 = objc_msgSend(a3, "frequencyBand");
    if (v16 == 2)
      v17 = CFSTR("BTController: New 5GHz Bi-Dir AoS session started");
    else
      v17 = CFSTR("BTController: New 2GHz Bi-Dir AoS session started");
    if (v16 == 2)
      v18 = &OBJC_IVAR___WCM_BTController_num5GHzAoSBiAudioDevice;
    else
      v18 = &OBJC_IVAR___WCM_BTController_num2GHzAoSBiAudioDevice;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v17);
    *(Class *)((char *)&self->super.super.isa + *v18) = (Class)1;
    -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", objc_msgSend(a3, "identifier"));
    goto LABEL_40;
  }
}

- (void)handleAADeviceLost:(id)a3
{
  if (-[NSString isEqualToString:](-[WCM_BTController AoSDeviceID](self, "AoSDeviceID"), "isEqualToString:", objc_msgSend(a3, "identifier")))
  {
    -[WCM_BTController setAoSDeviceID:](self, "setAoSDeviceID:", &stru_100219FA0);
    -[WCM_BTController clearAoSDeviceCounts](self, "clearAoSDeviceCounts");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("AudioAccessory Device Lost"));
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateWiFiBTConnectionReport");
    -[WCM_BTController printBTConnections](self, "printBTConnections");
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 501);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1000);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 1300);
  }
}

- (void)printBTConnections
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("BT Connections: SCO:%lu eSCO:%lu ACL-A2DP:%lu HID:%lu LE:%lu LEA:%lu 2GAoSUni:%lu 2GAoSBi:%lu 5GAoSUni:%lu 5GAoSBi:%lu"), *(_QWORD *)&self->_audioType, *(unint64_t *)((char *)&self->numSCODevice + 4), -[WCM_BTController getNum2GHzAclA2DPDevices](self, "getNum2GHzAclA2DPDevices"), *(unint64_t *)((char *)&self->numA2DPDevice + 4), *(unint64_t *)((char *)&self->numLEADevice + 4), *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4), *(unint64_t *)((char *)&self->numLLADevice + 4), *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4), *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4), *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4));
}

- (void)clearAoSDeviceCounts
{
  *(unint64_t *)((char *)&self->numLLADevice + 4) = 0;
  *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = 0;
  *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = 0;
  *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = 0;
}

- (int)getBTState
{
  return 0;
}

- (int)getBTRole
{
  return 3;
}

- (unint64_t)getNumberOfBTGameCtrlDev
{
  unint64_t v3;

  v3 = -[WCM_BTController numGameCtrlDev75ms](self, "numGameCtrlDev75ms");
  return -[WCM_BTController numGameCtrlDev10ms](self, "numGameCtrlDev10ms") + v3;
}

- (unint64_t)getNum2GHzAclA2DPDevices
{
  if (*(unint64_t *)((char *)&self->numLLADevice + 4)
    || *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4))
  {
    return 0;
  }
  else
  {
    return *(unint64_t *)((char *)&self->numeSCODevice + 4);
  }
}

- (BOOL)getAny2GHzBTDevicesConnected
{
  unint64_t v2;

  v2 = *(unint64_t *)((char *)&self->numSCODevice + 4) + *(_QWORD *)&self->_audioType;
  return (char *)-[WCM_BTController getNum2GHzAclA2DPDevices](self, "getNum2GHzAclA2DPDevices")
       + *(unint64_t *)((char *)&self->numA2DPDevice + 4)
       + v2
       + *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
       + *(unint64_t *)((char *)&self->numLEADevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getAny5GHzBTDevicesConnected
{
  return *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4)
       + *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) != 0;
}

- (BOOL)getAnyAoSLinkActive
{
  return *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4)
       + *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getAny2GHzBTDevicesConnectedIgnoreLE
{
  unint64_t v2;

  v2 = *(unint64_t *)((char *)&self->numSCODevice + 4) + *(_QWORD *)&self->_audioType;
  return (char *)-[WCM_BTController getNum2GHzAclA2DPDevices](self, "getNum2GHzAclA2DPDevices")
       + *(unint64_t *)((char *)&self->numA2DPDevice + 4)
       + v2
       + *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)getOverLEDeviceSingleConnection
{
  unint64_t v3;

  if (*(unint64_t *)((char *)&self->numLEADevice + 4) > 1)
    return 1;
  v3 = *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4)
     + *(unint64_t *)((char *)&self->numA2DPDevice + 4);
  return (char *)-[WCM_BTController getNum2GHzAclA2DPDevices](self, "getNum2GHzAclA2DPDevices")
       + *(_QWORD *)&self->_audioType
       + v3
       + *(unint64_t *)((char *)&self->numSCODevice + 4)
       + *(unint64_t *)((char *)&self->numLLADevice + 4)
       + *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) != 0;
}

- (BOOL)get2GHzSub15msAudioDevicesConnected
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4)
      || *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4)
      || *(_QWORD *)&self->_audioType
      || *(unint64_t *)((char *)&self->numSCODevice + 4) != 0;
}

- (BOOL)get2GHzSub15msNonSCOConnected
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4)
      || *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4)
      || *(unint64_t *)((char *)&self->numSCODevice + 4) != 0;
}

- (unint64_t)getLeConnDutyCycle
{
  return 0;
}

- (unint64_t)getLeConnReason
{
  return 0;
}

- (unint64_t)getLeConnBand
{
  return 0;
}

- (unint64_t)getLeConnDuration
{
  return 0;
}

- (int64_t)getLeDiscoveryScanState
{
  return -1;
}

- (int64_t)getLeDiscoveryScanUseCase
{
  return -1;
}

- (void)update5GHzHostAP:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBT5GHzHostAPActive", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1436, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current 5GHz Host AP State: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about 5GHz Host AP State"));
  }
}

- (void)updateLowWiFi5GRates:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBT5GHzWiFiRatesLow", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1442, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about low 5G Rates: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about low 5G Rates:"));
  }
}

- (void)updateAWDLActive:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTAWDLActive", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1437, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current AWDL Active State: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about AWDL Active State"));
  }
}

- (void)updateNANActive:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTNANActive", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1438, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current NAN Active State: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about NAN Active State"));
  }
}

- (void)updateUWB5GHzActive:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTUWB5GHzActive", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1440, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current UWB 5GHz State: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about UWB 5GHz State"));
  }
}

- (void)updateAWDLRTGActive:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_uint64(v5, "kWCMBTAWDLRTGActive", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1439, v6);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current AWDL RTG Active State: %d"), v3);
    xpc_release(v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about AWDL RTG Active State"));
  }
}

- (void)updateWiFiChannelInfo:(unsigned int)a3 bandwidth:(unsigned int)a4 regBand:(int)a5
{
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v9;
  void *v10;
  const char *v11;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    v10 = v9;
    xpc_dictionary_set_uint64(v9, "kWCMBTWiFiChannel", v7);
    xpc_dictionary_set_uint64(v10, "kWCMBTWiFiChannelBandwidth", v6);
    xpc_dictionary_set_uint64(v10, "kWCMBTWiFiRegulatoryBand", a5);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1441, v10);
    if (a5 >= 0xD)
    {
      v11 = "Invalid Freq Band";
      if (a5 == 13)
        v11 = "UNII-8";
    }
    else
    {
      v11 = off_100203B20[a5];
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Sent message to BT about current WiFi Channel Info: Channel %d Bandwidth %d FreqBand %s"), v7, v6, v11);
    xpc_release(v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Failed to send message to BT about WiFi channel info"));
  }
}

- (unint64_t)getMovingAvgBTRssi
{
  return 128;
}

- (unint64_t)getBtMaxPhyRate
{
  return 0;
}

- (unint64_t)getBtActivePhy
{
  return 0;
}

- (BOOL)isBTMetricsValid
{
  return 0;
}

- (double)getBtTxPer
{
  return 0.0;
}

- (double)getBtRxPer
{
  return 0.0;
}

- (unint64_t)numSCODevice
{
  return *(_QWORD *)&self->_audioType;
}

- (void)setNumSCODevice:(unint64_t)a3
{
  *(_QWORD *)&self->_audioType = a3;
}

- (unint64_t)numeSCODevice
{
  return *(unint64_t *)((char *)&self->numSCODevice + 4);
}

- (void)setNumeSCODevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numSCODevice + 4) = a3;
}

- (unint64_t)numA2DPDevice
{
  return *(unint64_t *)((char *)&self->numeSCODevice + 4);
}

- (void)setNumA2DPDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numeSCODevice + 4) = a3;
}

- (unint64_t)numHIDDevice
{
  return *(unint64_t *)((char *)&self->numA2DPDevice + 4);
}

- (void)setNumHIDDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numA2DPDevice + 4) = a3;
}

- (unint64_t)numGameCtrlDev75ms
{
  return *(unint64_t *)((char *)&self->numHIDDevice + 4);
}

- (void)setNumGameCtrlDev75ms:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numHIDDevice + 4) = a3;
}

- (unint64_t)numGameCtrlDev10ms
{
  return *(unint64_t *)((char *)&self->numGameCtrlDev75ms + 4);
}

- (void)setNumGameCtrlDev10ms:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numGameCtrlDev75ms + 4) = a3;
}

- (unint64_t)numLEADevice
{
  return *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4);
}

- (void)setNumLEADevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numGameCtrlDev10ms + 4) = a3;
}

- (unint64_t)numLEDevice
{
  return *(unint64_t *)((char *)&self->numLEADevice + 4);
}

- (void)setNumLEDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLEADevice + 4) = a3;
}

- (unint64_t)numLLADevice
{
  return *(unint64_t *)((char *)&self->numLEDevice + 4);
}

- (void)setNumLLADevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLEDevice + 4) = a3;
}

- (unint64_t)num2GHzAoSUniAudioDevice
{
  return *(unint64_t *)((char *)&self->numLLADevice + 4);
}

- (void)setNum2GHzAoSUniAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->numLLADevice + 4) = a3;
}

- (unint64_t)num5GHzAoSUniAudioDevice
{
  return *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4);
}

- (void)setNum5GHzAoSUniAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num2GHzAoSUniAudioDevice + 4) = a3;
}

- (unint64_t)num2GHzAoSBiAudioDevice
{
  return *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4);
}

- (void)setNum2GHzAoSBiAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num5GHzAoSUniAudioDevice + 4) = a3;
}

- (unint64_t)num5GHzAoSBiAudioDevice
{
  return *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4);
}

- (void)setNum5GHzAoSBiAudioDevice:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->num2GHzAoSBiAudioDevice + 4) = a3;
}

- (NSMutableArray)btConnections
{
  return *(NSMutableArray **)((char *)&self->num5GHzAoSBiAudioDevice + 4);
}

- (int)audioType
{
  return *(_DWORD *)&self->_powerState;
}

- (void)setAudioType:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (NSString)AoSDeviceID
{
  return *(NSString **)((char *)&self->_btConnections + 4);
}

- (void)setAoSDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 156);
}

@end
