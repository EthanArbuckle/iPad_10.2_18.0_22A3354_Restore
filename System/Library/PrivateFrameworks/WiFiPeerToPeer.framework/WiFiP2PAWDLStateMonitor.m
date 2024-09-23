@implementation WiFiP2PAWDLStateMonitor

- (WiFiP2PAWDLStateMonitor)init
{
  WiFiP2PAWDLStateMonitor *v2;
  WiFiP2PAWDLStateMonitor *v3;
  NSMutableArray *interestedUniqueIdentifiers;
  WiFiP2PXPCConnection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PAWDLStateMonitor;
  v2 = -[WiFiP2PAWDLStateMonitor init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    interestedUniqueIdentifiers = v2->_interestedUniqueIdentifiers;
    v2->_interestedUniqueIdentifiers = 0;

    v5 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PAWDLStateMonitor", 0, v6);
    v8 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v5, "initWithEndpointType:queue:retryTimeout:", 2, v7, -1);
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    -[WiFiP2PXPCConnection setDelegate:](v3->_xpcConnection, "setDelegate:", v3);
  }
  return v3;
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A35D0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_channelSequenceChangedEvent_, 0, 0);

  return v2;
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  WiFiP2PAWDLStateMonitorConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_alloc_init(WiFiP2PAWDLStateMonitorConfiguration);
  -[WiFiP2PAWDLStateMonitor stateUpdatedHandler](self, "stateUpdatedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 1);
  -[WiFiP2PAWDLStateMonitor statisticsUpdatedHandler](self, "statisticsUpdatedHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 2);
  -[WiFiP2PAWDLStateMonitor lowLatencyStatisticsUpdatedHandler](self, "lowLatencyStatisticsUpdatedHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 0x40);
  -[WiFiP2PAWDLStateMonitor realtimeModeUpdatedHandler](self, "realtimeModeUpdatedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 4);
  -[WiFiP2PAWDLStateMonitor threadCoexistenceEventHandler](self, "threadCoexistenceEventHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 8);
  -[WiFiP2PAWDLStateMonitor softAPChannelChangedEventHandler](self, "softAPChannelChangedEventHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 0x10);
  -[WiFiP2PAWDLStateMonitor channelSequenceUpdatedEventHandler](self, "channelSequenceUpdatedEventHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[WiFiP2PAWDLStateMonitorConfiguration setOptions:](v7, "setOptions:", -[WiFiP2PAWDLStateMonitorConfiguration options](v7, "options") | 0x20);
  -[WiFiP2PAWDLStateMonitor serviceAvailabilityUpdatedHandler](self, "serviceAvailabilityUpdatedHandler");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = -[NSMutableArray count](self->_interestedUniqueIdentifiers, "count");

    if (v17)
      -[WiFiP2PAWDLStateMonitorConfiguration setServicesRequiringAvailabilityNotification:](v7, "setServicesRequiringAvailabilityNotification:", self->_interestedUniqueIdentifiers);
  }
  objc_msgSend(v18, "startMonitoringAWDLStateWithConfiguration:completionHandler:", v7, v6);

}

- (void)registerAvailabilityUpdatesForService:(id)a3
{
  NSMutableArray *interestedUniqueIdentifiers;
  NSMutableArray *v5;
  NSMutableArray *v6;

  interestedUniqueIdentifiers = self->_interestedUniqueIdentifiers;
  if (interestedUniqueIdentifiers)
  {
    -[NSMutableArray addObject:](interestedUniqueIdentifiers, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_interestedUniqueIdentifiers;
    self->_interestedUniqueIdentifiers = v5;

  }
}

- (void)beginMonitoring
{
  -[WiFiP2PXPCConnection start](self->_xpcConnection, "start");
}

- (void)endMonitoring
{
  -[WiFiP2PXPCConnection invalidate](self->_xpcConnection, "invalidate");
}

- (void)updatedAWDLState:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WiFiP2PAWDLStateMonitor stateUpdatedHandler](self, "stateUpdatedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WiFiP2PAWDLStateMonitor stateUpdatedHandler](self, "stateUpdatedHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)updatedStatistics
{
  void *v3;
  void (**v4)(void);

  -[WiFiP2PAWDLStateMonitor statisticsUpdatedHandler](self, "statisticsUpdatedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WiFiP2PAWDLStateMonitor statisticsUpdatedHandler](self, "statisticsUpdatedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)updatedLowLatencyStatistics
{
  void *v3;
  void (**v4)(void);

  -[WiFiP2PAWDLStateMonitor lowLatencyStatisticsUpdatedHandler](self, "lowLatencyStatisticsUpdatedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WiFiP2PAWDLStateMonitor lowLatencyStatisticsUpdatedHandler](self, "lowLatencyStatisticsUpdatedHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)updatedRealtimeMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(id, _BOOL8);

  v3 = a3;
  -[WiFiP2PAWDLStateMonitor realtimeModeUpdatedHandler](self, "realtimeModeUpdatedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WiFiP2PAWDLStateMonitor realtimeModeUpdatedHandler](self, "realtimeModeUpdatedHandler");
    v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

  }
}

- (void)threadCoexistenceEvent:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WiFiP2PAWDLStateMonitor threadCoexistenceEventHandler](self, "threadCoexistenceEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WiFiP2PAWDLStateMonitor threadCoexistenceEventHandler](self, "threadCoexistenceEventHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)softAPChannelChangedEvent:(BOOL)a3 channelNumber:(unsigned __int16)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  void (**v8)(id, _BOOL8, _QWORD);

  v4 = a4;
  v5 = a3;
  -[WiFiP2PAWDLStateMonitor softAPChannelChangedEventHandler](self, "softAPChannelChangedEventHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WiFiP2PAWDLStateMonitor softAPChannelChangedEventHandler](self, "softAPChannelChangedEventHandler");
    v8 = (void (**)(id, _BOOL8, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, v5, v4);

  }
}

- (void)channelSequenceChangedEvent:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WiFiP2PAWDLStateMonitor channelSequenceUpdatedEventHandler](self, "channelSequenceUpdatedEventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WiFiP2PAWDLStateMonitor channelSequenceUpdatedEventHandler](self, "channelSequenceUpdatedEventHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)availabilityUpdatedForService:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WiFiP2PAWDLStateMonitor serviceAvailabilityUpdatedHandler](self, "serviceAvailabilityUpdatedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WiFiP2PAWDLStateMonitor serviceAvailabilityUpdatedHandler](self, "serviceAvailabilityUpdatedHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, BOOL, id))v8)[2](v8, v9, v6 == 0, v6);

  }
}

- (id)copyStatistics
{
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, 0, &__block_literal_global_310);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__WiFiP2PAWDLStateMonitor_copyStatistics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLStatisticsWithCompletionHandler:");
}

- (BOOL)updateLTERestrictedChannels:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__WiFiP2PAWDLStateMonitor_updateLTERestrictedChannels_error___block_invoke;
  v8[3] = &unk_1E6E1EDD8;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = +[WiFiP2PXPCConnection directRequestOnEndpointType:error:requesting:](WiFiP2PXPCConnection, "directRequestOnEndpointType:error:requesting:", 2, a4, v8);

  return (char)a4;
}

uint64_t __61__WiFiP2PAWDLStateMonitor_updateLTERestrictedChannels_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "updateAWDLLTERestrictedChannels:completionHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (id)lowLatencyStatisticsDifferenceBetweenPrevious:(id)a3 current:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  id obj;
  uint64_t v55;
  id v56;
  id v57;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _QWORD v78[18];
  _QWORD v79[40];
  _QWORD v80[16];
  _QWORD v81[4];

  v81[2] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v56 = a4;
  v81[0] = CFSTR("LL_STATS_ACTIVE_SERVICES_BITMAP");
  v81[1] = CFSTR("LL_STATS_REMOTE_CAMERA_ACTIVE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = CFSTR("LL_STATS_ISSDB");
  v80[1] = CFSTR("LL_STATS_COUNTRY_CODE");
  v80[2] = CFSTR("LL_STATS_PEERRSSI24G");
  v80[3] = CFSTR("LL_STATS_PEERRSSI5G");
  v80[4] = CFSTR("LL_STATS_TX_AVG_CCA");
  v80[5] = CFSTR("LL_STATS_SELF_INFRA_PRE_START");
  v80[6] = CFSTR("LL_STATS_SELF_INFRA_POST_START");
  v80[7] = CFSTR("LL_STATS_PEER_INFRA_PRE_START");
  v80[8] = CFSTR("LL_STATS_PEER_INFRA_POST_START");
  v80[9] = CFSTR("LL_STATS_LIMITED_TX_MIN_RATE");
  v80[10] = CFSTR("LL_STATS_PREF_5G_CHAN_COUNT");
  v80[11] = CFSTR("LL_STATS_PREF_2G_CHAN_COUNT");
  v80[12] = CFSTR("LL_STATS_IS_ODEON_ACTIVE");
  v80[13] = CFSTR("LL_STATS_2G_IN_CHAN_SEQ");
  v80[14] = CFSTR("LL_STATS_SIDECAR_SERV_TYPE_BITMAP");
  v80[15] = CFSTR("LL_STATS_RTG_ID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = CFSTR("LL_STATS_BSSSTEERING_ATTEMPT_COUNT");
  v79[1] = CFSTR("LL_STATS_BSSSTEERING_SUCCESS_COUNT");
  v79[2] = CFSTR("LL_STATS_BSSSTEERING_FAILURE_COUNT");
  v79[3] = CFSTR("LL_STATS_BSSSTEERING_TIMEOUT_COUNT");
  v79[4] = CFSTR("LL_STATS_INFRA_DISCONNECTED_POLICY_COUNT");
  v79[5] = CFSTR("LL_STATS_INFRA_DISCONNECTED_FAILURE_COUNT");
  v79[6] = CFSTR("LL_STATS_SESSION_DURATION");
  v79[7] = CFSTR("LL_STATS_IDLE_SLOTS_COUNT");
  v79[8] = CFSTR("LL_STATS_SYNC_ERRORS_COUNT");
  v79[9] = CFSTR("LL_STATS_CHANNEL_SEQ_MISMATCH_COUNT");
  v79[10] = CFSTR("LL_STATS_PARENT_NODE_CHANGE_COUNT");
  v79[11] = CFSTR("LL_STATS_ROOT_NODE_CHANGE_COUNT");
  v79[12] = CFSTR("LL_STATS_WATCHDOG_OR_CHIPTRAP_COUNT");
  v79[13] = CFSTR("LL_STATS_TXSUCCESSCOUNT");
  v79[14] = CFSTR("LL_STATS_TXEXPIREDCOUNT");
  v79[15] = CFSTR("LL_STATS_TXNOBUFFCOUNT");
  v79[16] = CFSTR("LL_STATS_TXNOACKCOUNT");
  v79[17] = CFSTR("LL_STATS_TXFAILCOUNT");
  v79[18] = CFSTR("LL_STATS_TXNORESOURCESCOUNT");
  v79[19] = CFSTR("LL_STATS_TXIOERRORCOUNT");
  v79[20] = CFSTR("LL_STATS_TXMBFREECOUNT");
  v79[21] = CFSTR("LL_STATS_TXCHIPMODEERRCOUNT");
  v79[22] = CFSTR("LL_STATS_TXNOREMOTEPEERCOUNT");
  v79[23] = CFSTR("LL_STATS_TXINTRERRCOUNT");
  v79[24] = CFSTR("LL_STATS_TXDRPCOUNT");
  v79[25] = CFSTR("LL_STATS_TXFWFREEPKTCOUNT");
  v79[26] = CFSTR("LL_STATS_TXMAXRETRIESCOUNT");
  v79[27] = CFSTR("LL_STATS_TXFORCELIFETIMEEXPIREDCOUNT");
  v79[28] = CFSTR("LL_STATS_TXERRORCOUNT");
  v79[29] = CFSTR("LL_STATS_TX_ON_5G_COUNT");
  v79[30] = CFSTR("LL_STATS_TX_ON_2G_COUNT");
  v79[31] = CFSTR("LL_STATS_TX_OVERRIDE_ON_5G_COUNT");
  v79[32] = CFSTR("LL_STATS_TX_NA_COUNT");
  v79[33] = CFSTR("LL_STATS_RX_PACKET_COUNT");
  v79[34] = CFSTR("LL_STATS_RX_ON_5G_COUNT");
  v79[35] = CFSTR("LL_STATS_RX_ON_2G_COUNT");
  v79[36] = CFSTR("LL_STATS_TX_REQUEUE_COUNT");
  v79[37] = CFSTR("LL_STATS_TX_REQUEUE_FAIL_COUNT");
  v79[38] = CFSTR("LL_STATS_TX_SWITCH_NAV_COUNT");
  v79[39] = CFSTR("LL_STATS_TX_SWITCH_HOF_COUNT");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = CFSTR("LL_STATS_TX_TOTAL_DELAY");
  v78[1] = CFSTR("LL_STATS_TX_COMPLETION_DELAY");
  v78[2] = CFSTR("LL_STATS_TX_IPCL_DELAY");
  v78[3] = CFSTR("LL_STATS_TX_FW_DELAY");
  v78[4] = CFSTR("LL_STATS_TX_HW_DELAY");
  v78[5] = CFSTR("LL_STATS_TX_DATA_RATE");
  v78[6] = CFSTR("LL_STATS_TX_RETRIES");
  v78[7] = CFSTR("LL_STATS_TX_PACKET_BURST_SIZE");
  v78[8] = CFSTR("LL_STATS_TX_PACKET_BURST_INTERVAL");
  v78[9] = CFSTR("LL_STATS_TX_PACKET_EXPIRY");
  v78[10] = CFSTR("LL_STATS_TX_CONSECUTIVE_ERRORS");
  v78[11] = CFSTR("LL_STATS_TX_CCA");
  v78[12] = CFSTR("LL_STATS_REQUEUE_COUNT");
  v78[13] = CFSTR("LL_STATS_RX_TOTAL_DELAY");
  v78[14] = CFSTR("LL_STATS_RX_IPC_DELAY");
  v78[15] = CFSTR("LL_STATS_RX_FW_DELAY");
  v78[16] = CFSTR("LL_STATS_RX_DATA_RATE");
  v78[17] = CFSTR("LL_STATS_RX_RSSI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v57, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v9, "setObject:forKey:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v12);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v67 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(v56, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v9, "setObject:forKey:", v23, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v19);
  }
  v51 = v17;
  v52 = v10;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v7;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v63 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * k);
        objc_msgSend(v57, "valueForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "integerValue");

        objc_msgSend(v56, "valueForKey:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32 - v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v33, v28);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v25);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v53 = v8;
  v34 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v34)
  {
    v35 = v34;
    v55 = *(_QWORD *)v59;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v59 != v55)
          objc_enumerationMutation(v53);
        v37 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m);
        objc_msgSend(v57, "objectForKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKey:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "count"))
        {
          v41 = 0;
          do
          {
            if (v41 >= objc_msgSend(v39, "count"))
              break;
            objc_msgSend(v38, "objectAtIndex:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "doubleValue");
            v44 = v43;

            objc_msgSend(v39, "objectAtIndex:", v41);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = v46;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47 - v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v48);

            ++v41;
          }
          while (v41 < objc_msgSend(v38, "count"));
        }
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v49, v37);

      }
      v35 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v35);
  }

  return v9;
}

- (id)copyLowLatencyStatistics
{
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 0, 0, &__block_literal_global_468);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__WiFiP2PAWDLStateMonitor_copyLowLatencyStatistics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLLowLatencyStatisticsWithCompletionHandler:");
}

- (id)copyActiveServiceUniqueIdentifiers
{
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 0, 0, &__block_literal_global_469);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__WiFiP2PAWDLStateMonitor_copyActiveServiceUniqueIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryActiveServiceUniqueIdentifiersWithCompletionHandler:");
}

- (int)queryAverageRSSIForPeer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke;
    v8[3] = &unk_1E6E1ECD8;
    v9 = v3;
    +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, 0, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke_2;
  v8[3] = &unk_1E6E1EE40;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "queryAverageRSSIForAWDLPeer:completionHandler:", v6, v8);

}

void __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)queryPeerDatabase
{
  void *v2;
  void *v3;
  id v4;

  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, 0, &__block_literal_global_470);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA60];
  v4 = v2;

  return v4;
}

void __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke_2;
  v6[3] = &unk_1E6E1EE88;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "queryPeersWithCompletionHandler:", v6);

}

uint64_t __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)fetchAWDLActiveServices:(id *)a3 withActivePorts:(id *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[6];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke;
  v12[3] = &unk_1E6E1EED8;
  v12[4] = &v20;
  v12[5] = &v14;
  +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 2, &v13, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (v9)
  {
    if (a3)
      *a3 = 0;
    if (a4)
      *a4 = 0;
    if (!a5)
      goto LABEL_13;
LABEL_12:
    *a5 = objc_retainAutorelease(v9);
    goto LABEL_13;
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v21[5]);
  if (a4)
  {
    v9 = (id)v15[5];
    a5 = a4;
    goto LABEL_12;
  }
LABEL_13:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10 == 0;
}

void __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke_2;
  v7[3] = &unk_1E6E1EEB0;
  v9 = *(_OWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "queryActiveServicesAndActivePortsWithCompletionHandler:", v7);

}

void __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (id)stateUpdatedHandler
{
  return self->_stateUpdatedHandler;
}

- (void)setStateUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)statisticsUpdatedHandler
{
  return self->_statisticsUpdatedHandler;
}

- (void)setStatisticsUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)lowLatencyStatisticsUpdatedHandler
{
  return self->_lowLatencyStatisticsUpdatedHandler;
}

- (void)setLowLatencyStatisticsUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)realtimeModeUpdatedHandler
{
  return self->_realtimeModeUpdatedHandler;
}

- (void)setRealtimeModeUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)threadCoexistenceEventHandler
{
  return self->_threadCoexistenceEventHandler;
}

- (void)setThreadCoexistenceEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)softAPChannelChangedEventHandler
{
  return self->_softAPChannelChangedEventHandler;
}

- (void)setSoftAPChannelChangedEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)channelSequenceUpdatedEventHandler
{
  return self->_channelSequenceUpdatedEventHandler;
}

- (void)setChannelSequenceUpdatedEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)serviceAvailabilityUpdatedHandler
{
  return self->_serviceAvailabilityUpdatedHandler;
}

- (void)setServiceAvailabilityUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceAvailabilityUpdatedHandler, 0);
  objc_storeStrong(&self->_channelSequenceUpdatedEventHandler, 0);
  objc_storeStrong(&self->_softAPChannelChangedEventHandler, 0);
  objc_storeStrong(&self->_threadCoexistenceEventHandler, 0);
  objc_storeStrong(&self->_realtimeModeUpdatedHandler, 0);
  objc_storeStrong(&self->_lowLatencyStatisticsUpdatedHandler, 0);
  objc_storeStrong(&self->_statisticsUpdatedHandler, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_interestedUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
