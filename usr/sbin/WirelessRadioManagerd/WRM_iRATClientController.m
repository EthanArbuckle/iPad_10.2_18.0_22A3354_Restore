@implementation WRM_iRATClientController

- (void)handleStallCM:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from CM client"));
}

- (void)handleMessage:(id)a3
{
  int64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Received message-id: %lld from iRAT Client, params are %@"), uint64, a3);
  if (uint64 > 599)
  {
    if (uint64 > 2099)
    {
      if (uint64 != 2100)
      {
        if (uint64 == 2500)
        {
          -[WRM_iRATClientController setLowPowerModePeriodicWakeUpNotificationSubscribed:](self, "setLowPowerModePeriodicWakeUpNotificationSubscribed:", 1);
          return;
        }
        goto LABEL_14;
      }
    }
    else if ((unint64_t)(uint64 - 2000) >= 3)
    {
      if (uint64 == 600)
      {
        -[WRM_iRATClientController handleMetricsReportIDS:](self, "handleMetricsReportIDS:", a3);
        return;
      }
LABEL_14:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Received unsupported iRAT client message"));
      return;
    }
    -[WRM_iRATClientController handleBasebandMetricsInterfaceRequest:](self, "handleBasebandMetricsInterfaceRequest:", a3);
    return;
  }
  switch(uint64)
  {
    case 400:
      -[WRM_iRATClientController handleLinkPrefSubscribe:](self, "handleLinkPrefSubscribe:", a3);
      break;
    case 401:
      -[WRM_iRATClientController handleSubscribeStatusUpdate:](self, "handleSubscribeStatusUpdate:", a3);
      break;
    case 402:
      -[WRM_iRATClientController handleLinkPrefSubscribeIDS:](self, "handleLinkPrefSubscribeIDS:", a3);
      break;
    case 403:
      -[WRM_iRATClientController handleSubscribeStatusUpdateIDS:](self, "handleSubscribeStatusUpdateIDS:", a3);
      break;
    case 404:
      -[WRM_iRATClientController handleLinkPrefSubscribeCM:](self, "handleLinkPrefSubscribeCM:", a3);
      break;
    case 405:
      -[WRM_iRATClientController handleSubscribeStatusUpdateCM:](self, "handleSubscribeStatusUpdateCM:", a3);
      break;
    case 406:
      -[WRM_iRATClientController handleLinkPrefSubscribeFaceTimeCalling:](self, "handleLinkPrefSubscribeFaceTimeCalling:", a3);
      break;
    case 407:
      -[WRM_iRATClientController handleSubscribeStatusUpdateFaceTimeCalling:](self, "handleSubscribeStatusUpdateFaceTimeCalling:", a3);
      break;
    case 408:
    case 409:
    case 413:
    case 414:
    case 421:
    case 422:
      goto LABEL_14;
    case 410:
      -[WRM_iRATClientController handleCommCenterBasebandOperatingChange:](self, "handleCommCenterBasebandOperatingChange:", a3);
      break;
    case 411:
      -[WRM_iRATClientController handleBBAssertBGAppActive:](self, "handleBBAssertBGAppActive:", a3);
      break;
    case 412:
    case 418:
      -[WRM_iRATClientController handleStallCM:](self, "handleStallCM:", a3);
      break;
    case 415:
      -[WRM_iRATClientController handleLinkPrefGetMetrics:](self, "handleLinkPrefGetMetrics:", a3);
      break;
    case 416:
      -[WRM_iRATClientController handleIWLANMetrics:](self, "handleIWLANMetrics:", a3);
      break;
    case 417:
      -[WRM_iRATClientController handleGetStreamingMetrics:](self, "handleGetStreamingMetrics:", a3);
      break;
    case 419:
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "handleDataPlanUpdate:", a3);
      break;
    case 420:
      -[WRM_iRATClientController handleSIPStalledMetrics:](self, "handleSIPStalledMetrics:", a3);
      break;
    case 423:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("MLPredictedThroughput: WRMMLPredictedThroughput: handleMessage"));
      objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "handleGetMLPredictedThroughput:", a3);
      break;
    default:
      if ((unint64_t)(uint64 - 201) >= 2)
        goto LABEL_14;
      -[WRM_iRATClientController handleMetricsReportFaceTimeCalling:](self, "handleMetricsReportFaceTimeCalling:", a3);
      break;
  }
}

- (void)handleSubscribeStatusUpdateCM:(id)a3
{
  xpc_object_t value;
  xpc_object_t v5;
  void *v6;
  size_t count;
  size_t v8;
  size_t i;
  xpc_object_t v10;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    v6 = v5;
    count = xpc_array_get_count(v5);
    if (count)
    {
      v8 = count;
      for (i = 0; i != v8; ++i)
      {
        v10 = xpc_array_get_value(v6, i);
        uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Application Type=%llu, LinkType=%llu "), uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType"));
      }
    }
    objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from CM client"));
  }
}

- (void)handleLinkPreferenceNotificationCM:(BOOL)a3
{
  xpc_object_t v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  xpc_object_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  xpc_object_t v22;
  size_t count;
  size_t v24;
  size_t i;
  xpc_object_t value;
  WRM_iRATClientController *v27;
  uint64_t v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d"), objc_msgSend(*(id *)((char *)&self->mQueue + 4), "count"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v5)
    goto LABEL_25;
  v6 = v5;
  v27 = self;
  v7 = 0;
  v8 = *(_QWORD *)v32;
  v28 = *(_QWORD *)v32;
  do
  {
    v9 = 0;
    v29 = v6;
    do
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v9);
      if (objc_msgSend(v10, "linkPreferenceNotificationRequired"))
      {
        v11 = objc_msgSend(v10, "getConnectedLinkType");
        v12 = objc_msgSend(v10, "getApplicationType");
        v13 = objc_msgSend(v10, "getMinEvalBW");
        v14 = objc_msgSend(v10, "getMaxEvalBW");
        v15 = v4;
        v16 = objc_msgSend(v10, "getMinMovEvalBW");
        v17 = objc_msgSend(v10, "getMaxMovEvalBW");
        v18 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v18, "kWRMApplicationType", (uint64_t)v12);
        xpc_dictionary_set_uint64(v18, "kWRMLinkType", v11);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkBandwidthEstimateMin", (uint64_t)v13);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkBandwidthEstimateMax", (uint64_t)v14);
        v19 = (uint64_t)v16;
        v4 = v15;
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkMovBandwidthEstimateMin", v19);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkMovBandwidthEstimateMax", (uint64_t)v17);
        xpc_dictionary_set_uint64(v18, "kWRMCellLoad", (int)objc_msgSend(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"), "getDataSlotLoad"));
        xpc_array_append_value(v15, v18);
        v20 = "UNKNOWN_APP!!!";
        if (v12 == (id)2)
          v20 = "CT_Th_Call";
        if (v12 == (id)1)
          v20 = "CT_VOICE";
        if (!v12)
          v20 = "CT_DATA";
        if (v11 >= 3)
        {
          v21 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
          if ((_DWORD)v11 == 3)
            v21 = "WRM_IWLAN_BLUETOOTH";
        }
        else
        {
          v21 = off_100203210[(int)v11];
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)"), v20, v12, v11, v21);
        objc_msgSend(v10, "setLinkPreferenceNotificationRequired:", 0);
        v7 = 1;
        v8 = v28;
        v6 = v29;
      }
      v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v22, "kWRMApplicationTypeList", v4);
    -[WCM_Controller sendMessage:withArgs:](v27, "sendMessage:withArgs:", 1302, v22);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Sending Link Preference Notification."));
    count = xpc_array_get_count(v4);
    if (count)
    {
      v24 = count;
      for (i = 0; i != v24; ++i)
      {
        value = xpc_array_get_value(v4, i);
        xpc_release(value);
      }
    }
    xpc_release(v22);
  }
  else
  {
LABEL_25:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("No need to send link preference notification."));
  }
  xpc_release(v4);
}

- (int64_t)getActiveSlot
{
  return *(int64_t *)((char *)&self->mHandoverContexts + 4);
}

- (void)handleLinkPreferenceNotification:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  id v16;
  xpc_object_t v17;
  const char *v18;
  const char *v19;
  xpc_object_t v20;
  size_t count;
  size_t v22;
  size_t j;
  xpc_object_t value;
  id v25;
  WRM_iRATClientController *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31[128];
  char string[128];

  v3 = a3;
  v25 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v5 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d"), objc_msgSend(*(id *)((char *)&self->mQueue + 4), "count"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = self;
  v6 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v7)
  {
LABEL_29:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("No need to send link preference notification."));
    if (!v3)
      goto LABEL_31;
LABEL_30:
    -[WRM_iRATClientController purgeStaleMobilityContexts](v26, "purgeStaleMobilityContexts");
    -[WRM_iRATClientController deactivateMobilityContexts](v26, "deactivateMobilityContexts");
    goto LABEL_31;
  }
  v8 = v7;
  v9 = v5;
  v10 = 0;
  v11 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      if (v3)
      {
        if ((objc_msgSend(v13, "mobilityContextStale") & 1) != 0)
          continue;
      }
      else if (!objc_msgSend(v13, "linkPreferenceNotificationRequired"))
      {
        continue;
      }
      v14 = objc_msgSend(v13, "getConnectedLinkType");
      v15 = objc_msgSend(v13, "getMappedApplicationType");
      v16 = objc_msgSend(v13, "getHandoverReasonType");
      objc_msgSend(v25, "getReasonStr::", v16, string);
      v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v17, "kWRMApplicationType", (uint64_t)v15);
      xpc_dictionary_set_uint64(v17, "kWRMLinkType", v14);
      xpc_dictionary_set_uint64(v17, "kWRMSubscribeSlotInfo", -[WRM_iRATClientController getActiveSlot](v26, "getActiveSlot"));
      xpc_dictionary_set_uint64(v17, "kWRMLinkTypeChangeReasonCode", v16);
      xpc_dictionary_set_string(v17, "kWRMLinkTypeChangeReasonString", string);
      xpc_array_append_value(v9, v17);
      v18 = "UNKNOWN_APP!!!";
      if (v15 == (id)2)
        v18 = "CT_Th_Call";
      if (v15 == (id)1)
        v18 = "CT_VOICE";
      if (!v15)
        v18 = "CT_DATA";
      if (v14 >= 3)
      {
        v19 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if ((_DWORD)v14 == 3)
          v19 = "WRM_IWLAN_BLUETOOTH";
      }
      else
      {
        v19 = off_100203210[(int)v14];
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)"), v18, v15, v14, v19);
      v10 = 1;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v8);
  v5 = v9;
  if ((v10 & 1) == 0)
    goto LABEL_29;
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v20, "kWRMApplicationTypeList", v5);
  -[WCM_Controller sendMessage:withArgs:](v26, "sendMessage:withArgs:", 1300, v20);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Sending Link Preference Notification."));
  count = xpc_array_get_count(v5);
  if (count)
  {
    v22 = count;
    for (j = 0; j != v22; ++j)
    {
      value = xpc_array_get_value(v5, j);
      xpc_release(value);
    }
  }
  xpc_release(v20);
  if (v3)
    goto LABEL_30;
LABEL_31:
  xpc_release(v5);
}

- (int)getMyClientType
{
  unsigned int v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("getMyClientType, myProcessID: %d"), -[WCM_Controller getProcessId](self, "getProcessId"));
  v3 = -[WCM_Controller getProcessId](self, "getProcessId") - 7;
  if (v3 < 0x1C && ((0xE2FFFF3u >> v3) & 1) != 0)
    return dword_1001DBA48[v3];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("myClientType = ClientUnknown"));
  return 0;
}

- (int)getHandoverAlgorithmType:(unint64_t)a3
{
  return *(&self->super.mProcessId + 1);
}

- (id)getHandoverContexts
{
  return *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
}

- (WRM_iRATClientController)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientController;
  v2 = -[WCM_Controller init](&v4, "init");
  if (v2)
  {
    *(_QWORD *)(v2 + 52) = dispatch_queue_create("com.apple.WirelessRadioManager.iRATClient", 0);
    v2[44] = 1;
    *((_DWORD *)v2 + 5) = 0;
    *((_DWORD *)v2 + 6) = 0;
    v2[28] = 0;
    *((_DWORD *)v2 + 8) = 2;
    *(_QWORD *)(v2 + 36) = 1;
    *(_QWORD *)(v2 + 68) = 0;
    *(_QWORD *)(v2 + 60) = objc_alloc_init((Class)NSMutableArray);
    v2[76] = 0;
  }
  return (WRM_iRATClientController *)v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WRM_iRATClientController dealloc"));
  v3 = *(NSObject **)(&self->mActive + 4);
  if (v3)
    dispatch_release(v3);
  *(_QWORD *)(&self->mActive + 4) = 0;
  if (*(OS_dispatch_queue **)((char *)&self->mQueue + 4))
  {
    -[WRM_iRATClientController removeAllMobilityContextsFromList](self, "removeAllMobilityContextsFromList");

    *(OS_dispatch_queue **)((char *)&self->mQueue + 4) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientController;
  -[WCM_Controller dealloc](&v4, "dealloc");
}

- (void)handleDisconnection:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  v6 = -[WCM_Controller getProcessId](self, "getProcessId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("handleDisconnection from client %d, pid %d"), v5, v6);
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "handleDisconnection:pid:", a3, v6);
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  uint64_t v4;
  xpc_object_t value;
  xpc_object_t v6;
  void *v7;
  size_t count;
  size_t v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t uint64;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  if (v6)
  {
    v7 = v6;
    v18 = a3;
    count = xpc_array_get_count(v6);
    if (count)
    {
      v9 = count;
      v10 = 0;
      if ((_DWORD)v4 == 22)
        v11 = "ClientCoreMediaStreaming";
      else
        v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      v12 = (int)v4 - 1;
      do
      {
        v13 = xpc_array_get_value(v7, v10);
        uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
        v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
        v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
        v17 = (char *)v11;
        if (v12 <= 0x14)
          v17 = off_100203168[v12];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)"), "-[WRM_iRATClientController handleLinkPrefSubscribe:]", v10++, uint64, v15, v16, v4, v17);
      }
      while (v9 != v10);
    }
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v18);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid Subscribe message from CT client"));
  }
}

- (void)handleLinkPrefSubscribeIDS:(id)a3
{
  uint64_t v4;
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  void *v8;
  size_t count;
  size_t v10;
  size_t v11;
  const char *v12;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t uint64;
  id v21;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v6 = value, (v7 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0))
  {
    v8 = v7;
    v21 = a3;
    uint64 = xpc_dictionary_get_uint64(v6, "kWRMSubscriptionType");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("handleLinkPrefSubscribeIDS: Subscription Type: %llu"), uint64);
    count = xpc_array_get_count(v8);
    if (count)
    {
      v10 = count;
      v11 = 0;
      if ((_DWORD)v4 == 22)
        v12 = "ClientCoreMediaStreaming";
      else
        v12 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      v13 = (int)v4 - 1;
      do
      {
        v14 = xpc_array_get_value(v8, v11);
        v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
        v16 = xpc_dictionary_get_uint64(v14, "kWRMDesiredLinkQoS");
        v17 = xpc_dictionary_get_uint64(v14, "kWRMDesiredBandwidth");
        v18 = (char *)v12;
        if (v13 <= 0x14)
          v18 = off_100203168[v13];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)"), "-[WRM_iRATClientController handleLinkPrefSubscribeIDS:]", v11++, v15, v16, v17, v4, v18);
      }
      while (v10 != v11);
    }
    if (uint64 == 1)
      v19 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton");
    else
      v19 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton");
    objc_msgSend(v19, "updateControllerState:", v21);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid Subscribe message from IDS client"));
  }
}

- (void)handleLinkPrefGetMetrics:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid Subscribe message from SIRI client"));
}

- (void)handleLinkPrefSubscribeFaceTimeCalling:(id)a3
{
  uint64_t v4;
  xpc_object_t value;
  xpc_object_t v6;
  void *v7;
  size_t count;
  size_t v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t uint64;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    v7 = v6;
    v18 = a3;
    count = xpc_array_get_count(v6);
    if (count)
    {
      v9 = count;
      v10 = 0;
      if ((_DWORD)v4 == 22)
        v11 = "ClientCoreMediaStreaming";
      else
        v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      v12 = (int)v4 - 1;
      do
      {
        v13 = xpc_array_get_value(v7, v10);
        uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
        v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
        v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
        v17 = (char *)v11;
        if (v12 <= 0x14)
          v17 = off_100203168[v12];
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)"), "-[WRM_iRATClientController handleLinkPrefSubscribeFaceTimeCalling:]", v10++, uint64, v15, v16, v4, v17);
      }
      while (v9 != v10);
    }
    objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", v18);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid Subscribe message from FaceTime Calling client"));
  }
}

- (void)handleMetricsReportIDS:(id)a3
{
  id v4;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  if (xpc_dictionary_get_uint64(a3, "kWRMSubscriptionType") == 1)
    v4 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton");
  else
    v4 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton");
  objc_msgSend(v4, "updateControllerState:", a3);
}

- (void)handleMetricsReportFaceTimeCalling:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", a3);
}

- (void)handleGetStreamingMetrics:(id)a3
{
  objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", a3);
}

- (void)handleLinkPrefSubscribeCM:(id)a3
{
  uint64_t v4;
  xpc_object_t value;
  xpc_object_t v6;
  void *v7;
  size_t count;
  size_t v9;
  size_t v10;
  const char *v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t uint64;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  const __CFString *v18;
  id v19;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v18 = CFSTR("Discarding invalid Subscribe message from CM  client");
LABEL_14:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, v18);
    return;
  }
  v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  if (!v6)
  {
    v18 = CFSTR("Discarding invalid Subscribe message from CM client");
    goto LABEL_14;
  }
  v7 = v6;
  v19 = a3;
  count = xpc_array_get_count(v6);
  if (count)
  {
    v9 = count;
    v10 = 0;
    if ((_DWORD)v4 == 22)
      v11 = "ClientCoreMediaStreaming";
    else
      v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    v12 = (int)v4 - 1;
    do
    {
      v13 = xpc_array_get_value(v7, v10);
      uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
      v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
      v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
      v17 = (char *)v11;
      if (v12 <= 0x14)
        v17 = off_100203168[v12];
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)"), "-[WRM_iRATClientController handleLinkPrefSubscribeCM:]", v10++, uint64, v15, v16, v4, v17);
    }
    while (v9 != v10);
  }
  objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", v19);
}

- (void)handleSubscribeStatusUpdateTerminus:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    uint64 = xpc_dictionary_get_uint64(value, "kWRMProximityLinkRecommendationType");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Application link preference %d active %d"), uint64, xpc_dictionary_get_BOOL(v5, "kWRMProximityAppLinkPreferenceActive"));
    objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from Terminus client"));
  }
}

- (void)handleSubscribeStatusUpdateIDS:(id)a3
{
  xpc_object_t value;
  void *v5;
  xpc_object_t v6;
  void *v7;
  size_t count;
  size_t v9;
  size_t i;
  xpc_object_t v11;
  uint64_t v12;
  id v13;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v5 = value, (v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0))
  {
    v7 = v6;
    uint64 = xpc_dictionary_get_uint64(v5, "kWRMSubscriptionType");
    count = xpc_array_get_count(v7);
    if (count)
    {
      v9 = count;
      for (i = 0; i != v9; ++i)
      {
        v11 = xpc_array_get_value(v7, i);
        v12 = xpc_dictionary_get_uint64(v11, "kWRMApplicationType");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Application Type=%llu, LinkType=%llu "), v12, xpc_dictionary_get_uint64(v11, "kWRMLinkType"));
      }
    }
    if (uint64 == 1)
      v13 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton");
    else
      v13 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton");
    objc_msgSend(v13, "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from IDS client"));
  }
}

- (void)handleSubscribeStatusUpdateFaceTimeCalling:(id)a3
{
  xpc_object_t value;
  xpc_object_t v5;
  void *v6;
  size_t count;
  size_t v8;
  size_t i;
  xpc_object_t v10;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    v6 = v5;
    count = xpc_array_get_count(v5);
    if (count)
    {
      v8 = count;
      for (i = 0; i != v8; ++i)
      {
        v10 = xpc_array_get_value(v6, i);
        uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Application Type=%llu, LinkType=%llu "), uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType"));
      }
    }
    objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from FaceTimeCalling client"));
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3
{
  xpc_object_t value;
  xpc_object_t v5;
  void *v6;
  size_t count;
  size_t v8;
  size_t i;
  xpc_object_t v10;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    v6 = v5;
    count = xpc_array_get_count(v5);
    if (count)
    {
      v8 = count;
      for (i = 0; i != v8; ++i)
      {
        v10 = xpc_array_get_value(v6, i);
        uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Application Type=%llu, LinkType=%llu "), uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType"));
      }
    }
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from CommCenter client"));
  }
}

- (void)handleSIPStalledMetrics:(id)a3
{
  uint64_t v4;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid WRMIWLANWiFiCallTunnelStalled message from client : %d"), v4);
}

- (void)handleIWLANMetrics:(id)a3
{
  uint64_t v4;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid WRMiWLANMetricsReport message from client : %d"), v4);
}

- (void)handleCommCenterBasebandOperatingChange:(id)a3
{
  uint64_t v4;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateProximityState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid CommCenterBasebandOperatingChange message from client : %d"), v4);
}

- (void)handleBBAssertBGAppActive:(id)a3
{
  uint64_t v4;

  v4 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("handleBBAssertBGAppActive message from client : %d"), v4);
  objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
}

- (void)handleBasebandMetricsInterfaceRequest:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid message from WirelessCoexManager client in iRATClientController::handleBasebandMetricsInterfaceRequest because message is nil"));
}

- (BOOL)isCallActive
{
  return BYTE4(self->mApplicationType);
}

- (void)setCallState:(BOOL)a3
{
  BYTE4(self->mApplicationType) = a3;
}

- (int)getBufferedLinkType
{
  return *(_DWORD *)&self->mBufferStatusUpdateMsg;
}

- (void)setBufferedLinkType:(int)a3
{
  *(_DWORD *)&self->mBufferStatusUpdateMsg = a3;
}

- (BOOL)isStatusUpdateMsgBuffered
{
  return self->mRxClientType;
}

- (void)setStatusUpdateMsgBuffered:(BOOL)a3
{
  LOBYTE(self->mRxClientType) = a3;
}

- (unint64_t)getBufferedAppType
{
  return *(_QWORD *)&self->mBufferedLinkType;
}

- (void)setBufferedAppType:(unint64_t)a3
{
  *(_QWORD *)&self->mBufferedLinkType = a3;
}

- (void)setActiveSlot:(int64_t)a3
{
  *(NSMutableArray **)((char *)&self->mHandoverContexts + 4) = (NSMutableArray *)a3;
}

- (void)setHandoverAlgorithmType:(int)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("setHandoverAlgorithmType= %u"), *(_QWORD *)&a3);
  *(&self->super.mProcessId + 1) = a3;
}

- (void)addMobilityContextToList:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->mQueue + 4), "addObject:", a3);
  -[WRM_iRATClientController existingContexts](self, "existingContexts");
}

- (void)removeMobilityContextFromList:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->mQueue + 4), "removeObject:", a3);
  -[WRM_iRATClientController existingContexts](self, "existingContexts");
}

- (void)removeAllMobilityContextsFromList
{
  objc_msgSend(*(id *)((char *)&self->mQueue + 4), "removeAllObjects");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Released all mobility contests from iRAT Client"));
}

- (void)deleteMobilityContext:(unint64_t)a3
{
  id v4;
  id v5;

  v4 = -[WRM_iRATClientController getMobilityContextFromList:](self, "getMobilityContextFromList:", a3);
  if (v4)
  {
    v5 = v4;
    -[WRM_iRATClientController removeMobilityContextFromList:](self, "removeMobilityContextFromList:", v4);

  }
}

- (id)getMobilityContextFromList:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "getApplicationType") == (id)a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)getStaleContextFromList
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v10;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v10 != v5)
      objc_enumerationMutation(v2);
    v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
    if ((objc_msgSend(v7, "mobilityContextStale") & 1) != 0)
      return v7;
    if (v4 == (id)++v6)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)purgeStaleMobilityContexts
{
  id v3;
  id v4;

  v3 = -[WRM_iRATClientController getStaleContextFromList](self, "getStaleContextFromList");
  if (v3)
  {
    v4 = v3;
    do
    {
      -[WRM_iRATClientController removeMobilityContextFromList:](self, "removeMobilityContextFromList:", v4);
      v4 = -[WRM_iRATClientController getStaleContextFromList](self, "getStaleContextFromList");
    }
    while (v4);
  }
}

- (void)deactivateMobilityContexts
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "activateMobilityContext:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)existingContexts
{
  uint64_t v3;
  const char *v4;

  v3 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  if ((v3 - 1) >= 0x15)
  {
    if ((_DWORD)v3 == 22)
      v4 = "ClientCoreMediaStreaming";
    else
      v4 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
  }
  else
  {
    v4 = off_100203168[(int)v3 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Client Type: %d(%s), Number of active sessions: %lu"), v3, v4, objc_msgSend(*(id *)((char *)&self->mQueue + 4), "count"));
}

- (void)sendPrivateNwVsMacroRecommendation:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  xpc_object_t v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWRMiWLANMetricsReport_SlotId", a3);
  xpc_dictionary_set_uint64(v9, "kWRMCbrsCurrentDataSlotQuality", v6);
  xpc_dictionary_set_uint64(v9, "kWRMAnyCallState", v5);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1350, v9);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("send PrivateNwVsMacroRecommendation slot=%ld, quality=%u, state=%u"), a3, v6, v5);
  xpc_release(v9);
}

- (void)handleLinkPreferenceNotificationIDS:(BOOL)a3
{
  xpc_object_t v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  xpc_object_t v15;
  const char *v16;
  const char *v17;
  xpc_object_t v18;
  size_t count;
  size_t v20;
  size_t j;
  xpc_object_t value;
  WRM_iRATClientController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d"), objc_msgSend(*(id *)((char *)&self->mQueue + 4), "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v6)
    goto LABEL_25;
  v7 = v6;
  v23 = self;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v12, "linkPreferenceNotificationRequired"))
      {
        v13 = objc_msgSend(v12, "getConnectedLinkType");
        v14 = objc_msgSend(v12, "getApplicationType");
        v9 = objc_msgSend(v12, "getSubscriptionType");
        v15 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v15, "kWRMApplicationType", (uint64_t)v14);
        xpc_dictionary_set_uint64(v15, "kWRMLinkType", v13);
        xpc_array_append_value(v4, v15);
        v16 = "UNKNOWN_APP!!!";
        if (v14 == (id)2)
          v16 = "CT_Th_Call";
        if (v14 == (id)1)
          v16 = "CT_VOICE";
        if (!v14)
          v16 = "CT_DATA";
        if (v13 >= 3)
        {
          v17 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
          if ((_DWORD)v13 == 3)
            v17 = "WRM_IWLAN_BLUETOOTH";
        }
        else
        {
          v17 = off_100203210[(int)v13];
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)"), v16, v14, v13, v17);
        objc_msgSend(v12, "setLinkPreferenceNotificationRequired:", 0);
        v8 = 1;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v7);
  if ((v8 & 1) != 0)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "kWRMApplicationTypeList", v4);
    xpc_dictionary_set_uint64(v18, "kWRMSubscriptionType", (uint64_t)v9);
    -[WCM_Controller sendMessage:withArgs:](v23, "sendMessage:withArgs:", 1301, v18);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Sending Link Preference Notification."));
    count = xpc_array_get_count(v4);
    if (count)
    {
      v20 = count;
      for (j = 0; j != v20; ++j)
      {
        value = xpc_array_get_value(v4, j);
        xpc_release(value);
      }
    }
    xpc_release(v18);
  }
  else
  {
LABEL_25:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("No need to send link preference notification."));
  }
  xpc_release(v4);
}

- (void)handleLinkPreferenceNotificationInternetDataVoiceVideo:(BOOL)a3 :(id)a4 :(id)a5
{
  _BOOL8 v7;
  uint64_t v9;

  v7 = a3;
  v9 = -[WRM_iRATClientController getMyClientType](self, "getMyClientType");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("handleLinkPreferenceNotificationInternetDataVoiceVideo: ClientType: %d, Subscription type: %d"), v9, v7);
  if ((_DWORD)v9 == 14 || (_DWORD)v9 == 7)
    -[WRM_iRATClientController handleLinkPreferenceNotificationFaceTimeCalling:::](self, "handleLinkPreferenceNotificationFaceTimeCalling:::", v7, a4, a5);
  else
    -[WRM_iRATClientController handleLinkPreferenceNotificationIDS:](self, "handleLinkPreferenceNotificationIDS:", v7);
}

- (void)handleLinkPreferenceNotificationFaceTimeCalling:(BOOL)a3 :(id)a4 :(id)a5
{
  _BOOL4 v7;
  xpc_object_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  id v19;
  id v20;
  xpc_object_t v21;
  const char *v22;
  const char *v23;
  xpc_object_t v24;
  unsigned int v25;
  unsigned int v26;
  double v27;
  double v28;
  size_t count;
  size_t v30;
  size_t j;
  xpc_object_t value;
  id v33;
  id v34;
  WRM_iRATClientController *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41[128];
  char string[128];

  v7 = a3;
  v36 = +[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton");
  v9 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d"), objc_msgSend(*(id *)((char *)&self->mQueue + 4), "count"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v11)
  {
LABEL_28:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("No need to send link preference notification."));
    if (!v7)
      goto LABEL_30;
LABEL_29:
    -[WRM_iRATClientController purgeStaleMobilityContexts](self, "purgeStaleMobilityContexts");
    -[WRM_iRATClientController deactivateMobilityContexts](self, "deactivateMobilityContexts");
    goto LABEL_30;
  }
  v12 = v11;
  v33 = a4;
  v34 = a5;
  v13 = v9;
  v35 = self;
  v14 = 0;
  v15 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      if (v7)
      {
        if ((objc_msgSend(v17, "mobilityContextStale") & 1) != 0)
          continue;
      }
      else if (!objc_msgSend(v17, "linkPreferenceNotificationRequired"))
      {
        continue;
      }
      v18 = objc_msgSend(v17, "getConnectedLinkType");
      v19 = objc_msgSend(v17, "getApplicationType");
      v20 = objc_msgSend(v17, "getHandoverReasonType");
      objc_msgSend(v36, "getReasonStr::", v20, string);
      v21 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v21, "kWRMApplicationType", (uint64_t)v19);
      xpc_dictionary_set_uint64(v21, "kWRMLinkType", v18);
      xpc_dictionary_set_uint64(v21, "kWRMLinkTypeChangeReasonCode", v20);
      xpc_dictionary_set_string(v21, "kWRMLinkTypeChangeReasonString", string);
      xpc_array_append_value(v13, v21);
      v22 = "UNKNOWN_APP!!!";
      if (v19 == (id)2)
        v22 = "CT_Th_Call";
      if (v19 == (id)1)
        v22 = "CT_VOICE";
      if (!v19)
        v22 = "CT_DATA";
      if (v18 >= 3)
      {
        v23 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if ((_DWORD)v18 == 3)
          v23 = "WRM_IWLAN_BLUETOOTH";
      }
      else
      {
        v23 = off_100203210[(int)v18];
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)"), v22, v19, v18, v23);
      v14 = 1;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v12);
  self = v35;
  v9 = v13;
  if ((v14 & 1) == 0)
    goto LABEL_28;
  v24 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v24, "kWRMApplicationTypeList", v9);
  v25 = objc_msgSend(v33, "getServingCellType");
  v26 = v25;
  switch(v25)
  {
    case 9u:
      objc_msgSend(v33, "getNrRSRP");
LABEL_33:
      xpc_dictionary_set_int64(v24, "kcSigStrength", (uint64_t)v27);
      break;
    case 2u:
      objc_msgSend(v33, "getServingCellRSCP");
      goto LABEL_33;
    case 1u:
      objc_msgSend(v33, "getServingCellRSRP");
      goto LABEL_33;
  }
  xpc_dictionary_set_int64(v24, "kcSignalBar", (int64_t)objc_msgSend(v33, "getCurrentSignalBars"));
  xpc_dictionary_set_int64(v24, "kcServingCellType", v26);
  if (objc_msgSend(v34, "isWiFiPrimaryInterface"))
  {
    xpc_dictionary_set_int64(v24, "kwRSSI", (int64_t)objc_msgSend(v34, "getRSSI"));
    xpc_dictionary_set_int64(v24, "kwSNR", (int64_t)objc_msgSend(v34, "getSNR"));
    objc_msgSend(v34, "getTxPer");
    xpc_dictionary_set_int64(v24, "kwPER", (uint64_t)(v28 * 100.0));
    xpc_dictionary_set_int64(v24, "kwCCA", (int64_t)objc_msgSend(v34, "getCCA"));
  }
  -[WCM_Controller sendMessage:withArgs:](v35, "sendMessage:withArgs:", 1303, v24);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Sending Link Preference Notification."));
  count = xpc_array_get_count(v9);
  if (count)
  {
    v30 = count;
    for (j = 0; j != v30; ++j)
    {
      value = xpc_array_get_value(v9, j);
      xpc_release(value);
    }
  }
  xpc_release(v24);
  if (v7)
    goto LABEL_29;
LABEL_30:
  xpc_release(v9);
}

- (void)alertWRMClient:(BOOL)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v9;
  xpc_object_t v11;
  unsigned int v12;
  id v13;
  double v14;
  double v15;
  uint64_t v16;

  v6 = a6;
  v9 = a3;
  v11 = xpc_dictionary_create(0, 0, 0);
  v12 = objc_msgSend(a4, "getServingCellType");
  v13 = objc_msgSend(a4, "getCurrentSignalBars");
  switch(v12)
  {
    case 9u:
      objc_msgSend(a4, "getNrRSRP");
      break;
    case 2u:
      objc_msgSend(a4, "getServingCellRSCP");
      break;
    case 1u:
      objc_msgSend(a4, "getServingCellRSRP");
      break;
    default:
      goto LABEL_8;
  }
  xpc_dictionary_set_int64(v11, "kcSigStrength", (uint64_t)v14);
LABEL_8:
  xpc_dictionary_set_int64(v11, "kWRMLinkType", v6);
  xpc_dictionary_set_int64(v11, "kcSignalBar", (int64_t)v13);
  xpc_dictionary_set_int64(v11, "kcServingCellType", v12);
  if (v6)
  {
    xpc_dictionary_set_int64(v11, "kwRSSI", (int64_t)objc_msgSend(a5, "getRSSI"));
    xpc_dictionary_set_int64(v11, "kwSNR", (int64_t)objc_msgSend(a5, "getSNR"));
    objc_msgSend(a5, "getTxPer");
    xpc_dictionary_set_int64(v11, "kwPER", (uint64_t)(v15 * 100.0));
    xpc_dictionary_set_int64(v11, "kwCCA", (int64_t)objc_msgSend(a5, "getCCA"));
  }
  if (v9)
    v16 = 1306;
  else
    v16 = 1307;
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", v16, v11);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Sending FaceTimeAlert: %d"), v9);
  xpc_release(v11);
}

- (void)postiRATNotificationToEnableDisableCellData:(unint64_t)a3 :(BOOL)a4
{
  _BOOL4 v4;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  xpc_object_t v10;
  size_t count;
  size_t v12;
  size_t i;
  xpc_object_t value;

  v4 = a4;
  v7 = xpc_array_create(0, 0);
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kWRMApplicationType", a3);
  v9 = !v4;
  xpc_dictionary_set_uint64(v8, "kWRMLinkType", v9);
  xpc_array_append_value(v7, v8);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v10, "kWRMApplicationTypeList", v7);
  -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1300, v10);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Sending Link Preference notification, triggered by networking agent, %d"), v9);
  count = xpc_array_get_count(v7);
  if (count)
  {
    v12 = count;
    for (i = 0; i != v12; ++i)
    {
      value = xpc_array_get_value(v7, i);
      xpc_release(value);
    }
  }
  xpc_release(v10);
  xpc_release(v7);
}

- (BOOL)isLowPowerModePeriodicWakeUpNotificationSubscribed
{
  NSObject *v2;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *(NSObject **)(&self->mActive + 4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100070408;
  v5[3] = &unk_100201B90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLowPowerModePeriodicWakeUpNotificationSubscribed:(BOOL)a3
{
  NSObject *v3;
  _QWORD v4[5];
  BOOL v5;

  v3 = *(NSObject **)(&self->mActive + 4);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100070488;
  v4[3] = &unk_100201E38;
  v5 = a3;
  v4[4] = self;
  dispatch_async(v3, v4);
}

@end
