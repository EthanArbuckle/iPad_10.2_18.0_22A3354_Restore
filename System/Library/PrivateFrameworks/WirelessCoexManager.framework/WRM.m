@implementation WRM

void __46__WRM_iRATInterface_processBTLQMNotification___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "WRMLinkPrefBTScore_LQMScore");
  NSLog(CFSTR("received LQM update message:%@"), *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96))
  {
    NSLog(CFSTR("Sending LQM score notificatione"));
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) + 16))();
  }
  else
  {
    NSLog(CFSTR("Discard LQM score notification"));
  }
}

uint64_t __66__WRM_iRATInterface_processLowPowerModePeriodicWakeUpNotification__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 104))
  {
    v1 = result;
    NSLog(CFSTR("processLowPowerModePeriodicWakeUpNotification"));
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 104) + 16))();
  }
  return result;
}

void __54__WRM_iRATInterface_processOperatingModeNotification___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "WRMCommCenterOperatingModeNotifcation_EnableTelephony");
  xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "WRMCommCenterOperatingModeNotifcation_SetBBState");
  NSLog(CFSTR("received operating mode notification message:%@"), *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
  {
    NSLog(CFSTR("Sending operating mode change notificatione"));
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 16))();
  }
  else
  {
    NSLog(CFSTR("Discard operating mode notification"));
  }
}

void __54__WRM_iRATInterface_processMetricsNotificationReport___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  WRM_iRATProximityRecommendationLogging *v14;

  v14 = objc_alloc_init(WRM_iRATProximityRecommendationLogging);
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRssi");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    -[WRM_iRATProximityRecommendationLogging setBtRSSI:](v14, "setBtRSSI:", xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRssi"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateTx");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateTx:](v14, "setBtRetransmissionRateTx:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateTx"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateRx");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateRx:](v14, "setBtRetransmissionRateRx:", xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtRetransmissionRateRx"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtTech");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[WRM_iRATProximityRecommendationLogging setBtTech:](v14, "setBtTech:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityBtTech"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiRssi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[WRM_iRATProximityRecommendationLogging setWifiRSSI:](v14, "setWifiRSSI:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiRssi"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiSnr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[WRM_iRATProximityRecommendationLogging setWifiSNR:](v14, "setWifiSNR:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiSnr"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiLSMBeRecommendation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[WRM_iRATProximityRecommendationLogging setLsmRecommendationBe:](v14, "setLsmRecommendationBe:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiLSMBeRecommendation"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiExpectedThroughputVIBE");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[WRM_iRATProximityRecommendationLogging setExpectedThroughputVIBE:](v14, "setExpectedThroughputVIBE:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiExpectedThroughputVIBE"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLifetimeVIBE");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[WRM_iRATProximityRecommendationLogging setPacketLifetimeVIBE:](v14, "setPacketLifetimeVIBE:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLifetimeVIBE"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLossRateVIBE");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[WRM_iRATProximityRecommendationLogging setPacketLossRateVIBE:](v14, "setPacketLossRateVIBE:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWRMProximityWifiPacketLossRateVIBE"));
  v12 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v12 + 118))
  {
    v13 = *(_QWORD *)(v12 + 88);
    if (v13)
    {
      (*(void (**)(uint64_t, WRM_iRATProximityRecommendationLogging *))(v13 + 16))(v13, v14);
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 118) = 0;
      NSLog(CFSTR("Sent metrics for submission"));
    }
  }

}

void __56__WRM_iRATInterface_processNotificationListForTerminus___block_invoke(uint64_t a1)
{
  uint64_t v1;
  size_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t uint64;
  void *v8;
  void *v9;
  int64_t int64;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = a1;
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = 0;
    v3 = 0x24C30C000uLL;
    do
    {
      xpc_array_get_value(*(xpc_object_t *)(v1 + 32), v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(*(Class *)(v3 + 3256));
      objc_msgSend(v5, "setRecommendationType:", xpc_dictionary_get_uint64(v4, "kWRMProximityLinkRecommendationType"));
      objc_msgSend(v5, "setLinkIsRecommended:", xpc_dictionary_get_BOOL(v4, "kWRMProximityLinkisRecommended"));
      objc_msgSend(v5, "setLinkRecommendationIsValid:", 1);
      if (objc_msgSend(v5, "RecommendationType") == 2)
      {
        xpc_dictionary_get_value(v4, "kWRMProximityBtRssi");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          uint64 = xpc_dictionary_get_uint64(v4, "kWRMProximityBtRssi");
          objc_msgSend(v5, "metrics");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBtRSSI:", uint64);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityBtRetransmissionRateTx");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          int64 = xpc_dictionary_get_int64(v4, "kWRMProximityBtRetransmissionRateTx");
          objc_msgSend(v5, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBtRetransmissionRateTx:", int64);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityBtRetransmissionRateRx");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = xpc_dictionary_get_uint64(v4, "kWRMProximityBtRetransmissionRateRx");
          objc_msgSend(v5, "metrics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBtRetransmissionRateRx:", v13);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityBtTech");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = xpc_dictionary_get_int64(v4, "kWRMProximityBtTech");
          objc_msgSend(v5, "metrics");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBtTech:", v16);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiRssi");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiRssi");
          objc_msgSend(v5, "metrics");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setWifiRSSI:", v19);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiSnr");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v1 = a1;
        if (v21)
        {
          v22 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiSnr");
          objc_msgSend(v5, "metrics");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setWifiSNR:", v22);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiLSMBeRecommendation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiLSMBeRecommendation");
          objc_msgSend(v5, "metrics");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setLsmRecommendationBe:", v25);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiExpectedThroughputVIBE");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiExpectedThroughputVIBE");
          objc_msgSend(v5, "metrics");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setExpectedThroughputVIBE:", v28);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiPacketLifetimeVIBE");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiPacketLifetimeVIBE");
          objc_msgSend(v5, "metrics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setPacketLifetimeVIBE:", v31);

        }
        xpc_dictionary_get_value(v4, "kWRMProximityWifiPacketLossRateVIBE");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = 0x24C30C000;
        if (v33)
        {
          v34 = xpc_dictionary_get_int64(v4, "kWRMProximityWifiPacketLossRateVIBE");
          objc_msgSend(v5, "metrics");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setPacketLossRateVIBE:", v34);

        }
      }
      objc_msgSend(*(id *)(v1 + 40), "addProximityLinkRecommendationType:", v5);

      ++v2;
    }
    while (*(_QWORD *)(v1 + 48) > v2);
  }
  v36 = *(_QWORD *)(v1 + 40);
  if (*(_BYTE *)(v36 + 117))
  {
    v37 = *(_QWORD *)(v36 + 80);
    if (v37)
    {
      (*(void (**)(uint64_t, _QWORD))(v37 + 16))(v37, *(_QWORD *)(v36 + 128));
      *(_BYTE *)(*(_QWORD *)(v1 + 40) + 117) = 0;
      NSLog(CFSTR("Count of recommendations being sent in GetLinkRecommendation is %lu "), objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 128), "count"));
      v36 = *(_QWORD *)(v1 + 40);
    }
  }
  if (*(_BYTE *)(v36 + 116))
  {
    v38 = *(_QWORD *)(v36 + 72);
    if (v38)
    {
      (*(void (**)(uint64_t, _QWORD))(v38 + 16))(v38, *(_QWORD *)(v36 + 128));
      NSLog(CFSTR("Count of recommendations being sent in SubscribeLinkRecommendation is %lu "), objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 128), "count"));
    }
  }
}

void __42__WRM_iRATInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNotification::", v8, a4);

}

void __53__WRM_iRATInterface_subscribeBtLqmScoreNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  xpc_object_t v8;
  uint64_t i;
  xpc_object_t v10[2];
  char *keys[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v2;

    v5 = xpc_dictionary_create(0, 0, 0);
    *(_OWORD *)keys = xmmword_24C30D218;
    v6 = xpc_uint64_create(0x1A5uLL);
    v10[0] = v6;
    v7 = v5;
    v10[1] = v7;
    v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v8);
    NSLog(CFSTR("XPC message sent: WCMBTLQMMetrics"), v10[0]);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("subscribeBtLqmScoreNotification error: Invalid XPC Connection"));
  }
}

void __58__WRM_iRATInterface_subscribeProximityLinkRecommendation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  WRM_iRATProximityRecommendation *v5;
  WRM_iRATProximityRecommendation *v6;
  WRM_iRATProximityRecommendation *v7;
  unsigned int v8;
  const char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  id v12;
  xpc_object_t v13;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) != 0;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 116))
    {
      v5 = objc_alloc_init(WRM_iRATProximityRecommendation);
      -[WRM_iRATProximityRecommendation setRecommendationType:](v5, "setRecommendationType:", 1);
      -[WRM_iRATProximityRecommendation setLinkRecommendationIsValid:](v5, "setLinkRecommendationIsValid:", 1);
      -[WRM_iRATProximityRecommendation setLinkIsRecommended:](v5, "setLinkIsRecommended:", 1);
      objc_msgSend(*(id *)(a1 + 32), "addProximityLinkRecommendationType:", v5);
      v6 = objc_alloc_init(WRM_iRATProximityRecommendation);
      -[WRM_iRATProximityRecommendation setRecommendationType:](v6, "setRecommendationType:", 0);
      -[WRM_iRATProximityRecommendation setLinkRecommendationIsValid:](v6, "setLinkRecommendationIsValid:", 1);
      -[WRM_iRATProximityRecommendation setLinkIsRecommended:](v6, "setLinkIsRecommended:", 1);
      objc_msgSend(*(id *)(a1 + 32), "addProximityLinkRecommendationType:", v6);
      v7 = objc_alloc_init(WRM_iRATProximityRecommendation);
      -[WRM_iRATProximityRecommendation setRecommendationType:](v7, "setRecommendationType:", 2);
      -[WRM_iRATProximityRecommendation setLinkRecommendationIsValid:](v7, "setLinkRecommendationIsValid:", 1);
      -[WRM_iRATProximityRecommendation setLinkIsRecommended:](v7, "setLinkIsRecommended:", 1);
      objc_msgSend(*(id *)(a1 + 32), "addProximityLinkRecommendationType:", v7);
      v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if (v8 < 0x2A && ((0x3EEEFFFFFFFuLL >> v8) & 1) != 0)
      {
        v9 = off_24C30D268[v8];
      }
      else if (v8 == 42)
      {
        v9 = "WRMSOS";
      }
      else
      {
        v9 = "INVALID_PROC_ID!!!";
      }
      NSLog(CFSTR("Sending Default ProximityLinkRecommendation to %s"), v9);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");

    }
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v10, "kWRMSubscriptionType", 0);
    xpc_dictionary_set_BOOL(v10, "kWRMProximityLinkRecommendationSubscriptionValid", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116));
    *(_OWORD *)keys = xmmword_24C30D218;
    v11 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getSubscribeMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    values[0] = v11;
    v12 = v10;
    values[1] = v12;
    v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v13);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("subscribeProximityLinkRecommendation error: Invalid XPC Connection"));
  }
}

void __50__WRM_iRATInterface_getLinkRecommendationMetrics___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  id v9;
  xpc_object_t v10;
  uint64_t i;
  xpc_object_t v12[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 88);
    if (v3)
    {
      *(_QWORD *)(v1 + 88) = 0;

    }
    v4 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 118) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) != 0;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityGetProximityGetMetrics", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 118));
    *(_OWORD *)keys = xmmword_24C30D218;
    v8 = xpc_uint64_create(0x19FuLL);
    v12[0] = v8;
    v9 = v7;
    v12[1] = v9;
    v10 = xpc_dictionary_create((const char *const *)keys, v12, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v10);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("getLinkRecommendationMetrics error: Invalid XPC Connection"));
  }
}

void __67__WRM_iRATInterface_getProximityLinkRecommendation_recommendation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  id v9;
  xpc_object_t v10;
  uint64_t i;
  xpc_object_t v12[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 80);
    if (v3)
    {
      *(_QWORD *)(v1 + 80) = 0;

    }
    v4 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 117) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) != 0;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v7, "kWRMSubscriptionType", 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityGetProximityLinkRecommendation", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 117));
    xpc_dictionary_set_BOOL(v7, "kWRMProximityLinkRecommendationIsRetry", *(_BYTE *)(a1 + 48));
    *(_OWORD *)keys = xmmword_24C30D218;
    v8 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getSubscribeMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    v12[0] = v8;
    v9 = v7;
    v12[1] = v9;
    v10 = xpc_dictionary_create((const char *const *)keys, v12, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v10);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("getProximityLinkRecommendation error: Invalid XPC Connection"));
  }
}

void __58__WRM_iRATInterface_statusUpdateAppLinkPreference_status___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  uint64_t i;
  xpc_object_t v7[2];
  char *keys[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "kWRMProximityLinkRecommendationType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_BOOL(v2, "kWRMProximityAppLinkPreferenceActive", *(_BYTE *)(a1 + 44));
    *(_OWORD *)keys = xmmword_24C30D218;
    v3 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getStatusUpdateMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    v7[0] = v3;
    v4 = v2;
    v7[1] = v4;
    v5 = xpc_dictionary_create((const char *const *)keys, v7, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v5);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("statusUpdateAppLinkPreference error: Invalid XPC Connection"));
  }
}

void __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v3;
  const char *v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  id v8;
  xpc_object_t v9;
  _xpc_connection_s *v10;
  id v11;
  uint64_t i;
  id v13;
  _QWORD handler[4];
  id v15;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(_DWORD *)(v1 + 16);
    if (v3 < 0x2A && ((0x3EEEFFFFFFFuLL >> v3) & 1) != 0)
    {
      v4 = off_24C30D268[v3];
    }
    else if (v3 == 42)
    {
      v4 = "WRMSOS";
    }
    else
    {
      v4 = "INVALID_PROC_ID!!!";
    }
    NSLog(CFSTR("Received getLinkRecommendationMetrics call from %s"), v4);
    if (*(_QWORD *)(a1 + 40) && (v5 = MEMORY[0x20BD2502C]()) != 0)
    {
      v13 = (id)v5;
      v6 = xpc_dictionary_create(0, 0, 0);
      if (v6)
      {
        v7 = v6;
        xpc_dictionary_set_uint64(v6, "WRMGetStreamingMetrics_linkType", *(unsigned int *)(a1 + 48));
        *(_OWORD *)keys = xmmword_24C30D218;
        values[0] = xpc_uint64_create(0x1A1uLL);
        v8 = v7;
        values[1] = v8;
        v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        v10 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke_2;
        handler[3] = &unk_24C30D018;
        v11 = v13;
        v15 = v11;
        xpc_connection_send_message_with_reply(v10, v9, 0, handler);

        for (i = 1; i != -1; --i)
      }
      else
      {

      }
    }
    else
    {
      NSLog(CFSTR("Received getLinkRecommendationMetrics called with invalid parameter"));
    }
  }
  else
  {
    NSLog(CFSTR("getStreamingInfo error: Invalid XPC Connection"));
  }
}

uint64_t __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t uint64;
  int v5;
  uint64_t v6;
  _BOOL8 v7;

  v3 = a2;
  uint64 = xpc_dictionary_get_uint64(v3, "MaxBW");
  v5 = xpc_dictionary_get_uint64(v3, "StallDetected");
  v6 = xpc_dictionary_get_uint64(v3, "AvgRTT");
  v7 = xpc_dictionary_get_BOOL(v3, "isValid");

  NSLog(CFSTR("received streaming notification message: BW: %d, Latecny: %d, isValid: %d"), uint64, v6, v7);
  return (*(uint64_t (**)(_QWORD, _BOOL8, uint64_t, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, uint64, v5 != 0, v6);
}

void __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v3;
  const char *v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  xpc_object_t v12;
  _xpc_connection_s *v13;
  id v14;
  uint64_t i;
  id v16;
  _QWORD handler[4];
  id v18;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    v3 = *(_DWORD *)(v1 + 16);
    if (v3 < 0x2A && ((0x3EEEFFFFFFFuLL >> v3) & 1) != 0)
    {
      v4 = off_24C30D268[v3];
    }
    else if (v3 == 42)
    {
      v4 = "WRMSOS";
    }
    else
    {
      v4 = "INVALID_PROC_ID!!!";
    }
    NSLog(CFSTR("Received getMLPredictedThroughput call from %s"), v4);
    if (*(_QWORD *)(a1 + 48)
      && (NSLog(CFSTR("Received mlPredictedThroughputNotification is not nil")),
          (v5 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 48))) != 0))
    {
      v16 = (id)v5;
      NSLog(CFSTR("Received notificationHandler is not nil"));
      v6 = xpc_dictionary_create(0, 0, 0);
      if (v6)
      {
        v7 = v6;
        NSLog(CFSTR("Received args is not nil"));
        v8 = *(void **)(a1 + 40);
        if (v8
          && (objc_msgSend(v8, "objectForKey:", CFSTR("linkType")),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v9,
              v9))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("linkType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_int64(v7, "WRMMLPredictedThroughput_linkType", (int)objc_msgSend(v10, "intValue"));

        }
        else
        {
          xpc_dictionary_set_int64(v7, "WRMMLPredictedThroughput_linkType", -1);
        }
        *(_OWORD *)keys = xmmword_24C30D218;
        values[0] = xpc_uint64_create(0x1A7uLL);
        v11 = v7;
        values[1] = v11;
        v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        v13 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke_2;
        handler[3] = &unk_24C30D018;
        v14 = v16;
        v18 = v14;
        xpc_connection_send_message_with_reply(v13, v12, 0, handler);

        for (i = 1; i != -1; --i)
      }
      else
      {

      }
    }
    else
    {
      NSLog(CFSTR("Received getMLPredictedThroughput called with invalid parameter"));
    }
  }
  else
  {
    NSLog(CFSTR("getMLPredictedThroughput error: Invalid XPC Connection"));
  }
}

uint64_t __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(xdict, "WRMMLPredictedThroughput_CoreMedia");
  NSLog(CFSTR("getMLPredictedThroughput received notification message: BW: %d"), uint64);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__WRM_iRATInterface_assertCommCenterBaseBandMode___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t v6[2];
  char *keys[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = v2;
    if (v2)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_DWORD *)(a1 + 40);
      xpc_dictionary_set_uint64(v2, "WRMTriggerCommCenterBasebandOperatingModeChange_AssertBasebandGPS", *(unsigned int *)(a1 + 40));
      *(_OWORD *)keys = xmmword_24C30D218;
      v6[0] = xpc_uint64_create(0x19AuLL);
      v6[1] = v3;
      v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v4);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("assertCommCenterBaseBandMode error: Invalid XPC Connection"));
  }
}

void __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  NSLog(CFSTR("expediteCellularForReason calling _expediteBBAssertionBGAppActive_sync, assertionFlag: %d"), *(unsigned __int8 *)(a1 + 48));
  v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke_2;
  v4[3] = &unk_24C30D1A8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_expediteBBAssertionBGAppActive_sync:handler:", v2, v4);

}

uint64_t __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __41__WRM_iRATInterface_setTelephonyEnabled___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t v6[2];
  char *keys[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    v3 = v2;
    if (v2)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = *(_BYTE *)(a1 + 40);
      xpc_dictionary_set_uint64(v2, "WRMTriggerCommCenterBasebandOperatingModeChange_AssertTelephony", *(unsigned __int8 *)(a1 + 40));
      *(_OWORD *)keys = xmmword_24C30D218;
      v6[0] = xpc_uint64_create(0x19AuLL);
      v6[1] = v3;
      v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v4);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("setTelephonyEnabled error: Invalid XPC Connection"));
  }
}

void __47__WRM_iRATInterface_subscribeAppType_observer___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  xpc_object_t v14[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", a1 + 48, "{?=iiii}");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
      objc_msgSend(*(id *)(a1 + 32), "addAppType:", v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
    v6 = xpc_array_create(0, 0);
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMApplicationType", *(unsigned int *)(a1 + 48));
    xpc_dictionary_set_uint64(v7, "kWRMSubscriptionType", *(unsigned int *)(a1 + 60));
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kWRMPolicyInfoHoAlgorithmType", *(unsigned int *)(a1 + 52));
    xpc_dictionary_set_uint64(v8, "kWRMPolicyInfoServiceType", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_value(v7, "kWRMPolicyInfo", v8);
    xpc_array_append_value(v6, v7);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v9, "kWRMApplicationTypeList", v6);
    *(_OWORD *)keys = xmmword_24C30D218;
    v10 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getSubscribeMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    v14[0] = v10;
    v11 = v9;
    v14[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)keys, v14, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v12);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("subscribeAppType error: Invalid XPC Connection"));
  }
}

void __56__WRM_iRATInterface_subscribeMultipleAppTypes_observer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  id v27;
  xpc_object_t v28;
  uint64_t m;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  xpc_object_t values[2];
  _BYTE v44[128];
  _BYTE v45[128];
  char *keys[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = MEMORY[0x20BD2502C](*(_QWORD *)(a1 + 48));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v2;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          keys[0] = 0;
          keys[1] = 0;
          objc_msgSend(v10, "getValue:", keys);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v7);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          keys[0] = 0;
          keys[1] = 0;
          objc_msgSend(v16, "getValue:", keys);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v13);
    }

    v17 = xpc_array_create(0, 0);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
          keys[0] = 0;
          keys[1] = 0;
          objc_msgSend(v22, "getValue:", keys);
          v23 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v23, "kWRMApplicationType", LODWORD(keys[0]));
          xpc_dictionary_set_uint64(v23, "kWRMSubscriptionType", HIDWORD(keys[1]));
          v24 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v24, "kWRMPolicyInfoHoAlgorithmType", HIDWORD(keys[0]));
          xpc_dictionary_set_uint64(v24, "kWRMPolicyInfoServiceType", LODWORD(keys[1]));
          xpc_dictionary_set_value(v23, "kWRMPolicyInfo", v24);
          xpc_array_append_value(v17, v23);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    v25 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v25, "kWRMApplicationTypeList", v17);
    *(_OWORD *)keys = xmmword_24C30D218;
    v26 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getSubscribeMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    values[0] = v26;
    v27 = v25;
    values[1] = v27;
    v28 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v28);

    for (m = 1; m != -1; --m)
  }
  else
  {
    NSLog(CFSTR("subscribeMultipleAppTypes error: Invalid XPC Connection"));
  }
}

void __64__WRM_iRATInterface_statusUpdateAppType_linkType_serviceStatus___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  id v6;
  xpc_object_t v7;
  uint64_t i;
  xpc_object_t v9[2];
  char *keys[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = xpc_array_create(0, 0);
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kWRMApplicationType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_uint64(v3, "kWRMLinkType", *(unsigned int *)(a1 + 40));
    xpc_dictionary_set_uint64(v3, "kWRMServiceStatus", *(unsigned __int8 *)(a1 + 44));
    xpc_array_append_value(v2, v3);
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v4, "kWRMApplicationTypeList", v2);
    *(_OWORD *)keys = xmmword_24C30D218;
    v5 = xpc_uint64_create(objc_msgSend(*(id *)(a1 + 32), "getStatusUpdateMessageType:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)));
    v9[0] = v5;
    v6 = v4;
    v9[1] = v6;
    v7 = xpc_dictionary_create((const char *const *)keys, v9, 2uLL);
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), v7);

    for (i = 1; i != -1; --i)
  }
  else
  {
    NSLog(CFSTR("statusUpdateAppType error: Invalid XPC Connection"));
  }
}

void __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  xpc_object_t v4;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  _QWORD handler[5];
  id v17;
  char v18;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 8))
  {
    if (*(unsigned __int8 *)(v1 + 136) == *(unsigned __int8 *)(a1 + 48))
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3)
        (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    }
    else
    {
      v4 = xpc_dictionary_create(0, 0, 0);
      v5 = v4;
      if (v4)
      {
        xpc_dictionary_set_uint64(v4, "WRMProcessIdKey", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
        xpc_dictionary_set_BOOL(v5, "WRMBBAssertionBGAppActiveKey", *(_BYTE *)(a1 + 48));
        *(_OWORD *)keys = xmmword_24C30D218;
        v6 = xpc_uint64_create(0x19BuLL);
        values[0] = v6;
        values[1] = v5;
        v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
        v8 = *(_QWORD *)(a1 + 40);
        if (v6 && v7)
        {
          v9 = (void *)MEMORY[0x20BD2502C](v8);
          NSLog(CFSTR("expediteBBAssertionBGAppActive_sync sending message to daemon"));
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(_xpc_connection_s **)(v10 + 8);
          v12 = *(NSObject **)(v10 + 24);
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke_2;
          handler[3] = &unk_24C30D230;
          v18 = *(_BYTE *)(a1 + 48);
          handler[4] = v10;
          v17 = v9;
          v13 = v9;
          xpc_connection_send_message_with_reply(v11, v7, v12, handler);

        }
        else if (v8)
        {
          (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
        }

        for (i = 1; i != -1; --i)
      }
      else
      {
        v14 = *(_QWORD *)(a1 + 40);
        if (v14)
          (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
      }

    }
  }
  else
  {
    NSLog(CFSTR("_expediteBBAssertionBGAppActive_sync error: Invalid XPC Connection"));
  }
}

void __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x20BD2523C]() == MEMORY[0x24BDACFA0])
  {
    if (*(_BYTE *)(a1 + 48))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = xpc_dictionary_get_BOOL(xdict, "WRMBBAssertionBGAppActiveResultKey");
    else
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);

}

void __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  NSLog(CFSTR("expediteBBAssertionBGAppActive:bbAssertionBGAppActive:%d"), *(unsigned __int8 *)(a1 + 48));
  v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke_2;
  v4[3] = &unk_24C30D1A8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_expediteBBAssertionBGAppActive_sync:handler:", v2, v4);

}

uint64_t __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __37__WRM_iRATInterface_unregisterClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 116) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 117) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (v5)
  {
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 56);
    if (v9)
    {
      *(_QWORD *)(v8 + 56) = 0;

    }
  }
}

void __41__WRM_UCMInterface_registerClient_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNotification::", v8, a4);

}

void __41__WRM_UCMInterface_registerClient_queue___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[2])
  {
    v5 = MEMORY[0x20BD2523C](v8);
    if (v5 == MEMORY[0x24BDACFA0])
    {
      v7 = *(void (**)(void))(v4[2] + 16);
    }
    else
    {
      if (v5 != MEMORY[0x24BDACFB8])
      {
        v6 = (void *)MEMORY[0x20BD251A0](v8);
        free(v6);
        goto LABEL_10;
      }
      NSLog(CFSTR("XPC error detected"));
      if (v8 != (id)MEMORY[0x24BDACF30])
        goto LABEL_10;
      NSLog(CFSTR("Connection interrupted: reconnecting"));
      v7 = *(void (**)(void))(v4[2] + 16);
    }
    v7();
  }
LABEL_10:

}

void __58__WRM_UCMInterface_subscribeBtConnectedLinksNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  id v7;
  xpc_object_t v8;
  uint64_t i;
  xpc_object_t v10[2];
  char *keys[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = xpc_dictionary_create(0, 0, 0);
  *(_OWORD *)keys = xmmword_24C30D4B8;
  v6 = xpc_uint64_create(0x8FCuLL);
  v10[0] = v6;
  v7 = v5;
  v10[1] = v7;
  v8 = xpc_dictionary_create((const char *const *)keys, v10, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 56), v8);
  NSLog(CFSTR("XPC message sent: WCMBTConnectedDevices"), v10[0]);

  for (i = 1; i != -1; --i)
}

void __56__WRM_UCMInterface_processBTConnectedLinksNotification___block_invoke(uint64_t a1)
{
  unsigned __int8 int64;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  NSLog(CFSTR("Received BT Connected Links message:%@"), *(_QWORD *)(a1 + 32));
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumA2DP");
  v3 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumSCO");
  v4 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumESCO");
  v5 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumHID");
  v6 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumLE");
  v7 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "kWCMBTNumLEA");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
  {
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", int64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("kWCMBTNumA2DP"), v11, CFSTR("kWCMBTNumSCO"), v12, CFSTR("kWCMBTNumESCO"), v13, CFSTR("kWCMBTNumHID"), v14, CFSTR("kWCMBTNumLE"), v15, CFSTR("kWCMBTNumLEA"), 0);

    NSLog(CFSTR("Sending BT Connected Links notification"));
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16))();

  }
  else
  {
    NSLog(CFSTR("Discard BT Connected Links notification"));
  }
}

void __31__WRM_UCMInterface_sendBtLoad___block_invoke(uint64_t a1)
{
  uint64_t uint64;
  unsigned int v3;
  void (*v4)(_QWORD);

  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "kWRMHomeKitBtLoad");
  v3 = uint64;
  NSLog(CFSTR("getWirelessRadioManagerReportLoad Sending BtLoad: %u"), uint64);
  v4 = *(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 24);
  if (v4)
    v4(v3);
}

void __34__WRM_UCMInterface_getInstantLoad__block_invoke(int8x16_t *a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  id v8;
  uint64_t i;
  int8x16_t v10;
  _QWORD handler[4];
  int8x16_t v12;
  uint64_t v13;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1[3].i64[0] + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      *(_OWORD *)keys = xmmword_24C30D4B8;
      v3 = xpc_uint64_create(0xAF2uLL);
      values[0] = v3;
      values[1] = 0;
      v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      v5 = a1[3].i64[1];
      v6 = *(_QWORD *)(a1[3].i64[0] + 8);
      handler[0] = MEMORY[0x24BDAC760];
      handler[2] = __34__WRM_UCMInterface_getInstantLoad__block_invoke_2;
      handler[3] = &unk_24C30D3F8;
      v7 = *(_xpc_connection_s **)(v6 + 40);
      handler[1] = 3221225472;
      v13 = v5;
      v10 = a1[2];
      v8 = (id)v10.i64[0];
      v12 = vextq_s8(v10, v10, 8uLL);
      xpc_connection_send_message_with_reply(v7, v4, 0, handler);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("Invalid XPC connection."));
    dispatch_semaphore_signal((dispatch_semaphore_t)a1[2].i64[0]);
  }
}

void __34__WRM_UCMInterface_getInstantLoad__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(CFSTR("getWirelessRadioManagerReportLoad Current BT Load: %u"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __29__WRM_UCMInterface_stopTimer__block_invoke(int8x16_t *a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  id v9;
  uint64_t i;
  int8x16_t v11;
  _QWORD handler[4];
  int8x16_t v13;
  uint64_t v14;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("getWirelessRadioManagerReportLoad Stop Timer"));
  if (*(_QWORD *)(*(_QWORD *)(a1[3].i64[0] + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      *(_OWORD *)keys = xmmword_24C30D4B8;
      v3 = xpc_uint64_create(0xAF4uLL);
      xpc_dictionary_set_BOOL(v2, "kWRMHomeKitEnable", 0);
      v4 = v3;
      values[0] = v4;
      values[1] = v2;
      v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      v6 = a1[3].i64[1];
      v7 = *(_QWORD *)(a1[3].i64[0] + 8);
      handler[0] = MEMORY[0x24BDAC760];
      handler[2] = __29__WRM_UCMInterface_stopTimer__block_invoke_2;
      handler[3] = &unk_24C30D3F8;
      v8 = *(_xpc_connection_s **)(v7 + 40);
      handler[1] = 3221225472;
      v14 = v6;
      v11 = a1[2];
      v9 = (id)v11.i64[0];
      v13 = vextq_s8(v11, v11, 8uLL);
      xpc_connection_send_message_with_reply(v8, v5, 0, handler);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("Invalid XPC connection."));
    dispatch_semaphore_signal((dispatch_semaphore_t)a1[2].i64[0]);
  }
}

void __29__WRM_UCMInterface_stopTimer__block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(CFSTR("getWirelessRadioManagerReportLoad Max BT Load: %u"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __31__WRM_UCMInterface_startTimer___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  id v9;
  uint64_t i;
  int8x16_t v11;
  _QWORD handler[4];
  int8x16_t v13;
  uint64_t v14;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("getWirelessRadioManagerReportLoad start Timer"));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(CFSTR("Received args is not nil"));
      *(_OWORD *)keys = xmmword_24C30D4B8;
      v3 = xpc_uint64_create(0xAF4uLL);
      xpc_dictionary_set_double(v2, "kWRMHomeKitDuration", *(double *)(a1 + 64));
      xpc_dictionary_set_BOOL(v2, "kWRMHomeKitEnable", 1);
      v4 = v3;
      values[0] = v4;
      values[1] = v2;
      v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      handler[0] = MEMORY[0x24BDAC760];
      handler[2] = __31__WRM_UCMInterface_startTimer___block_invoke_2;
      handler[3] = &unk_24C30D3F8;
      v8 = *(_xpc_connection_s **)(v7 + 40);
      handler[1] = 3221225472;
      v14 = v6;
      v11 = *(int8x16_t *)(a1 + 32);
      v9 = (id)v11.i64[0];
      v13 = vextq_s8(v11, v11, 8uLL);
      xpc_connection_send_message_with_reply(v8, v5, 0, handler);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("Invalid XPC connection."));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __31__WRM_UCMInterface_startTimer___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kWRMHomeKitBtLoad");
    NSLog(CFSTR("getWirelessRadioManagerReportLoad Max BT Load: %u"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __48__WRM_UCMInterface_sendNRFrequencyUpdateForMic___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  _BOOL8 v3;
  void (*v4)(void);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "kWRMNR41FreuquencyUpdate");
  v3 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "kWRMNR7xFreuquencyUpdate");
  NSLog(CFSTR("sendNR41Update: %d sendNR7xUpdate: %d"), v2, v3);
  v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 32);
  if (v4)
  {
    v8[0] = CFSTR("NRBand41Enabled");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = CFSTR("NRBand7xEnabled");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4();

  }
}

void __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  _xpc_connection_s *v5;
  id v6;
  uint64_t i;
  int8x16_t v8;
  _QWORD handler[4];
  int8x16_t v10;
  __int128 v11;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(CFSTR("Received args is not nil"));
      *(_OWORD *)keys = xmmword_24C30D4B8;
      v3 = xpc_uint64_create(0xAF5uLL);
      values[0] = v3;
      values[1] = v2;
      v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
      v5 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke_2;
      handler[3] = &unk_24C30D470;
      v11 = *(_OWORD *)(a1 + 56);
      v8 = *(int8x16_t *)(a1 + 32);
      v6 = (id)v8.i64[0];
      v10 = vextq_s8(v8, v8, 8uLL);
      xpc_connection_send_message_with_reply(v5, v4, 0, handler);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("Invalid XPC connection."));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "checkConnection:"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "kWRMNR41FreuquencyUpdate");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "kWRMNR7xFreuquencyUpdate");
    NSLog(CFSTR("getWirelessFrequencyBandUpdatesForMIC  sendNR41Update: %d sendNR7xUpdate: %d"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __42__WRM_UCMInterface_sendULFrequencyUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int64_t int64;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  NSLog(CFSTR("sendULFrequencyUpdate"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "kWRMULFrequencyUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    int64 = xpc_dictionary_get_int64(v2, "kWRMULBandInfoType");
    v5 = xpc_dictionary_get_double(v3, "kWRMULCenterFrequency");
    v6 = xpc_dictionary_get_double(v3, "kWRMULBandwidth");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", int64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("BandInfoType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("ULCenterFrequency"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("ULBandwidth"));

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (v10)
    {
      v11 = (void *)objc_msgSend(v12, "copy");
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    }
  }

}

void __54__WRM_UCMInterface_getWirelessULFrequencyBandUpdates___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t i;
  xpc_object_t v6[2];
  char *keys[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    if (v2)
    {
      NSLog(CFSTR("Received args is not nil"));
      *(_OWORD *)keys = xmmword_24C30D4B8;
      v3 = xpc_uint64_create(0xAF7uLL);
      v6[0] = v3;
      v6[1] = v2;
      v4 = xpc_dictionary_create((const char *const *)keys, v6, 2uLL);
      xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);

      for (i = 1; i != -1; --i)
    }

  }
  else
  {
    NSLog(CFSTR("Invalid XPC connection."));
  }
}

@end
