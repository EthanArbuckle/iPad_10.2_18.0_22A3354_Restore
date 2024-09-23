@implementation WiFiUsageMonitor

- (void)setScanningState:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6 withChannelInfoList:(id)a7 withRequest:(id)a8 forInterface:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *internalQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  WiFiUsageMonitor *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  BOOL v34;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  internalQueue = self->_internalQueue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __110__WiFiUsageMonitor_setScanningState_client_neighborBSS_otherBSS_withChannelInfoList_withRequest_forInterface___block_invoke;
  v26[3] = &unk_1E881D1C8;
  v27 = v19;
  v28 = self;
  v34 = a3;
  v29 = v15;
  v30 = v16;
  v32 = v17;
  v33 = a4;
  v31 = v18;
  v21 = v17;
  v22 = v18;
  v23 = v16;
  v24 = v15;
  v25 = v19;
  dispatch_async(internalQueue, v26);

}

void __162__WiFiUsageMonitor_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "samples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "updateWithChQualScore:txLatencyScore:rxLatencyScore:txLossScore:rxLossScore:txLatencyP95:linkRecommendationFlags:rtTrafficStatus:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  if (!objc_msgSend(*(id *)(a1 + 32), "isBSPActive")
    || (objc_msgSend(v5, "numberForKeyPath:", CFSTR("bspTriggerCount")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "submitLqmToCA:forInterface:", v5, *(_QWORD *)(a1 + 40));
  }

}

- (void)submitLqmToCA:(id)a3 forInterface:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_xctest_disableSampling
    || +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableDictionary valueForKey:](self->_usageSessions, "valueForKey:", v7, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v14, "type") == 9)
          {
            v15 = v14;

            v11 = v15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v16 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "appendTDStateToDict:from:", v16, v11);
    -[WiFiUsageMonitor appendUsbStatsToDict:](self, "appendUsbStatsToDict:", v16);
    -[WiFiUsageMonitor appendBTStatsToDict:](self, "appendBTStatsToDict:", v16);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = v6;
    objc_msgSend(v6, "mloSamples");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "asDictionaryInto:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v19);
    }

    v6 = v27;
    v28 = v27;
    v25 = v16;
    AnalyticsSendEventLazy();

    v7 = v26;
  }

}

- (BOOL)isBSPActive
{
  return self->_isBSPActive;
}

- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_setCurrentApplicationName_withAttributes___block_invoke;
  block[3] = &unk_1E881CF98;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __61__WiFiUsageMonitor_setCurrentApplicationName_withAttributes___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12++), "applicationStateDidChange:withAttributes:", a1[5], a1[6]);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v4);
  }

  v13 = a1[4];
  if (*(_BYTE *)(v13 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("CurrentApplicationName"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotification:", v15);

    v13 = a1[4];
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(v13 + 120), "allValues", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "setCurrentApplicationName:withAttributes:", a1[5], a1[6]);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

void __79__WiFiUsageMonitor_updateLinkQuality_forInterface_supportsLinkRecommendations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  WiFiUsageInterfaceCapabilities *v30;
  void *v31;
  void *v32;
  WiFiUsageLQMWindowAnalysisDataTriggered *v33;
  int v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  WiFiUsageLQMWindowAnalysisDataTriggered *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  WiFiUsageLQMWindowAnalysisDataTriggered *v61;
  void *v62;
  void *v63;
  unsigned __int8 *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  WiFiUsageLQMWindowAnalysisInCall *v68;
  void *v69;
  double v70;
  WiFiUsageLQMWindowAnalysisInCall *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184);
    +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v2)
    {
      +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "updateWithTxBytes:RxBytes:TxL3Packets:RxL3Packets:txBytesSecondary:rxBytesSecondary:", objc_msgSend(v4, "txBytes") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "txBytes"), objc_msgSend(v4, "rxBytes") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "rxBytes"), objc_msgSend(v4, "txL3Packets") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "txL3Packets"), objc_msgSend(v4, "rxL3Packets") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "rxL3Packets"), objc_msgSend(v5, "txBytes") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "txBytes"), objc_msgSend(v5, "rxBytes") - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "rxBytes"));
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 184);
      *(_QWORD *)(v6 + 184) = v4;
      v8 = v4;

      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 192);
      *(_QWORD *)(v9 + 192) = v5;

    }
    else
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 184);
      *(_QWORD *)(v12 + 184) = v3;

      +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v8 = *(id *)(v15 + 192);
      *(_QWORD *)(v15 + 192) = v14;
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v77 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          if (objc_msgSend(v21, "expectsLQMUpdates"))
            objc_msgSend(v21, "linkQualityDidChange:", *(_QWORD *)(a1 + 48));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v18);
    }

    v22 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v22 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("UpdateLinkQuality"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotification:", v24);

      v22 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v22 + 120), "valueForKey:", *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "capabilities");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26
      || (v27 = (void *)v26,
          objc_msgSend(v25, "capabilities"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v29 = objc_msgSend(v28, "maxInterfacePHYRate"),
          v28,
          v27,
          !v29))
    {
      v30 = -[WiFiUsageInterfaceCapabilities initWithInterfaceName:]([WiFiUsageInterfaceCapabilities alloc], "initWithInterfaceName:", *(_QWORD *)(a1 + 32));
      if (v30)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "setValue:forKey:", v30, *(_QWORD *)(a1 + 32));
        objc_msgSend(v25, "setCapabilities:", v30);
      }

    }
    v31 = *(void **)(a1 + 48);
    objc_msgSend(v25, "capabilities");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateWithInterfaceCapabilities:AndNetworkDetails:", v32, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264));

    objc_msgSend(v25, "triggerCriteriaFilterList");
    v33 = (WiFiUsageLQMWindowAnalysisDataTriggered *)objc_claimAutoreleasedReturnValue();
    if (-[WiFiUsageLQMWindowAnalysisDataTriggered count](v33, "count"))
    {
      v34 = objc_msgSend(v25, "checkCriteriaBSSIDWithSample:", *(_QWORD *)(a1 + 48));

      if (!v34)
        goto LABEL_27;
      v35 = *(unsigned __int8 **)(a1 + 40);
      v36 = v35[13];
      v37 = v35[15];
      v38 = v35[16];
      v39 = [WiFiUsageLQMWindowAnalysisDataTriggered alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:](v39, "initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:", v25, CFSTR("BSSID Change"), v36 | (v37 << 8) | (v38 << 16), v40, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));

      objc_msgSend(*(id *)(a1 + 40), "startLQMAnalysis:", v33);
      objc_msgSend(v25, "cleanUpStashedMedians");
      objc_msgSend(v25, "clearOngoingCriteriaDates");
    }

LABEL_27:
    objc_msgSend(v25, "addSample:", *(_QWORD *)(a1 + 48));
    if (!*(_BYTE *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 40), "isBSPActive") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "submitLqmToCA:forInterface:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v41 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 208), "copy");
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v73 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "updateWithLQMSample:", *(_QWORD *)(a1 + 48));
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v43);
    }

    objc_msgSend(v25, "triggerCriteriaFilterList");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47)
    {
      objc_msgSend(v25, "evaluateCriteriaWithStopUponFirstMatch:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "matched"))
      {
        objc_msgSend(v48, "firstTriggered");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "currentSample");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

      }
      else
      {
        v51 = 0;
      }
      if (objc_msgSend(v48, "matched"))
      {
        v52 = 0;
        v53 = &stru_1E881F240;
        v54 = CFSTR("Match Start");
        if (!v51)
          v54 = &stru_1E881F240;
        v55 = &stru_1E881F240;
      }
      else
      {
        objc_msgSend(v48, "firstTriggered");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = &stru_1E881F240;
        v54 = CFSTR("Match Start");
        if (!v51)
          v54 = &stru_1E881F240;
        v52 = v56 != 0;
        v55 = CFSTR("Match End");
        if (!v56)
          v55 = &stru_1E881F240;
        if ((v51 & v52) != 0)
          v53 = CFSTR("&");
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v54, v53, v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v51 | v52) == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          objc_msgSend(*(id *)(a1 + 40), "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("Match Start"), v57, v25);
          v59 = objc_claimAutoreleasedReturnValue();

          v58 = (void *)v59;
        }
        v60 = *(_QWORD *)(a1 + 40);
        v61 = -[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:]([WiFiUsageLQMWindowAnalysisDataTriggered alloc], "initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:", v25, v57, *(unsigned __int8 *)(v60 + 13) | ((unint64_t)*(unsigned __int8 *)(v60 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v60 + 16) << 16), v58, *(_QWORD *)(v60 + 144));
        objc_msgSend(*(id *)(a1 + 40), "startLQMAnalysis:", v61);

      }
      objc_msgSend(v25, "cleanUpStashedMedians");
      if (v52)
        objc_msgSend(v25, "clearOngoingCriteriaDates");

    }
    if (+[WiFiUsageLQMWindowAnalysis isInCallAnalysisDue:](WiFiUsageLQMWindowAnalysis, "isInCallAnalysisDue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKey:", *(_QWORD *)(a1 + 32));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("InCall"), CFSTR("in Call"), v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        v64 = *(unsigned __int8 **)(a1 + 40);
        v65 = v64[13];
        v66 = v64[15];
        v67 = v64[16];
        v68 = [WiFiUsageLQMWindowAnalysisInCall alloc];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKey:", *(_QWORD *)(a1 + 32));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "timeIntervalSinceNow");
        v71 = -[WiFiUsageLQMWindowAnalysisInCall initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:](v68, "initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:", v69, CFSTR("in Call"), v65 | (v66 << 8) | (v67 << 16), v63, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), -v70);

        objc_msgSend(*(id *)(a1 + 40), "startLQMAnalysis:", v71);
      }

    }
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v83 = "-[WiFiUsageMonitor updateLinkQuality:forInterface:supportsLinkRecommendations:]_block_invoke";
    v84 = 2112;
    v85 = v11;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

void __110__WiFiUsageMonitor_setScanningState_client_neighborBSS_otherBSS_withChannelInfoList_withRequest_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned __int8 *)(a1 + 88);
    if (*(unsigned __int8 *)(v2 + 22) != v3 || *(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56))
    {
      *(_BYTE *)(v2 + 22) = v3;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "scanningStateDidChange:client:neighborBSS:otherBSS:", *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }

      v2 = *(_QWORD *)(a1 + 40);
    }
    v9 = *(void **)(a1 + 64);
    if (v9)
    {
      objc_storeStrong((id *)(v2 + 256), v9);
      v2 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v2 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setScanningState"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotification:", v11);

      v2 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend((id)v2, "submitScanResultWithNeighborBSS:withOtherBSS:withChannelInfoList:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[WiFiUsageMonitor setScanningState:client:neighborBSS:otherBSS:withChannelInfoList:withRequest:forInterface:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)submitScanResultWithNeighborBSS:(id)a3 withOtherBSS:(id)a4 withChannelInfoList:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id obj;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1)&& (v7 && objc_msgSend(v7, "count") || v8 && objc_msgSend(v8, "count")))
  {
    v10 = objc_opt_new();
    v11 = objc_opt_new();
    v50 = v7;
    -[WiFiUsageMonitor updateBssPerChannelWith:into:and:withChannelInfoList:](self, "updateBssPerChannelWith:into:and:withChannelInfoList:", v7, v10, v11, v9);
    v49 = v8;
    v52 = (void *)v10;
    v47 = (void *)v11;
    -[WiFiUsageMonitor updateBssPerChannelWith:into:and:withChannelInfoList:](self, "updateBssPerChannelWith:into:and:withChannelInfoList:", v8, v10, v11, v9);
    v12 = (void *)objc_opt_new();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v48 = v9;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          +[WiFiUsageChannel channelWithChannelInfo:](WiFiUsageChannel, "channelWithChannelInfo:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v15);
    }

    v19 = (void *)objc_opt_new();
    -[NSDictionary objectForKeyedSubscript:](self->_lastScanRequest, "objectForKeyedSubscript:", CFSTR("SCAN_CHANNELS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v12;
    if (v20)
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      -[NSDictionary objectForKeyedSubscript:](self->_lastScanRequest, "objectForKeyedSubscript:", CFSTR("SCAN_CHANNELS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v59 != v25)
              objc_enumerationMutation(v22);
            +[WiFiUsageChannel channelWithScanChannel:](WiFiUsageChannel, "channelWithScanChannel:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "updateDFSInfoFromSupportedChannels:", v12);
            objc_msgSend(v19, "addObject:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v24);
      }

      v21 = v19;
    }
    v28 = v21;

    v57 = 0u;
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
    obj = v28;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          v34 = (void *)objc_opt_new();
          v35 = (void *)MEMORY[0x1E0CB37E8];
          -[NSDictionary objectForKeyedSubscript:](self->_lastScanRequest, "objectForKeyedSubscript:", CFSTR("SCAN_TYPE"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "unsignedIntegerValue") == 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, CFSTR("isActive"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "channel"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, CFSTR("channel"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "isDFSChannel"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v39, CFSTR("isDFSChannel"));

          +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", objc_msgSend(v33, "band"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("band"));

          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v52, "objectForKeyedSubscript:", v33);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "count"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v43, CFSTR("PerChannelUniqueBSSCount"));

          v44 = v34;
          AnalyticsSendEventLazy();

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v30);
    }

    v45 = v47;
    v46 = obj;
    AnalyticsSendEventLazy();

    v8 = v49;
    v7 = v50;
    v9 = v48;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_144);
  return (id)sharedInstance_sharedWiFiUsageMonitor;
}

- (void)updateLinkQuality:(id)a3 forInterface:(id)a4 supportsLinkRecommendations:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  WiFiUsageMonitor *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__WiFiUsageMonitor_updateLinkQuality_forInterface_supportsLinkRecommendations___block_invoke;
  v13[3] = &unk_1E881D010;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a5;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10 forInterface:(id)a11
{
  id v17;
  NSObject *internalQueue;
  id v19;
  _QWORD block[5];
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v17 = a11;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __162__WiFiUsageMonitor_updateWithChQualScore_txLatencyScore_rxLatencyScore_txLossScore_rxLossScore_txLatencyP95_linkRecommendationFlags_rtTrafficStatus_forInterface___block_invoke;
  block[3] = &unk_1E881D3A8;
  block[4] = self;
  v21 = v17;
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v27 = a9;
  v28 = a10;
  v19 = v17;
  dispatch_async(internalQueue, block);

}

- (void)setDeviceChargingState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__WiFiUsageMonitor_setDeviceChargingState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __43__WiFiUsageMonitor_setDeviceChargingState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 11) != v2)
  {
    *(_BYTE *)(v1 + 11) = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "chargingStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 11));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("DeviceChargingState"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v16);

  }
}

void __54__WiFiUsageMonitor_setRoamingARCriteria_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE buf[32];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      v6 = (_OWORD *)(a1 + 48);
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          v9 = v6[1];
          *(_OWORD *)buf = *v6;
          *(_OWORD *)&buf[16] = v9;
          objc_msgSend(v8, "roamingARConfigurationDidChange:", buf);
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WiFiUsageMonitor setRoamingARCriteria:forInterface:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

void __49__WiFiUsageMonitor_updateWithRoamingSuppression___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
              objc_msgSend(v13, "updateWithRoamingSuppression:", *(unsigned __int8 *)(a1 + 40));
              if (objc_msgSend(v13, "type") == 4)
              {
                objc_msgSend(v13, "currentBssSession");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "updateWithRoamingSuppression:", *(unsigned __int8 *)(a1 + 40));

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__WiFiUsageMonitor_updateWithRoamingSuppression___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

- (void)setRoamingARCriteria:(id *)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  __int128 v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WiFiUsageMonitor *v12;
  __int128 v13;
  __int128 v14;

  v6 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__WiFiUsageMonitor_setRoamingARCriteria_forInterface___block_invoke;
  v10[3] = &unk_1E881D178;
  v11 = v6;
  v12 = self;
  v8 = *(_OWORD *)&a3->var5;
  v13 = *(_OWORD *)&a3->var0;
  v14 = v8;
  v9 = v6;
  dispatch_async(internalQueue, v10);

}

void __34__WiFiUsageMonitor_sharedInstance__block_invoke()
{
  WiFiUsageMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiUsageMonitor);
  v1 = (void *)sharedInstance_sharedWiFiUsageMonitor;
  sharedInstance_sharedWiFiUsageMonitor = (uint64_t)v0;

}

- (WiFiUsageMonitor)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  WiFiSoftError *v16;
  void *v17;
  WiFiSoftError *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageMonitor;
  v2 = -[WiFiUsageMonitor init](&v32, sel_init);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v3;

  *((_QWORD *)v2 + 41) = getpid();
  *((_QWORD *)v2 + 42) = 0;
  *((_BYTE *)v2 + 36) = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v2 + 13);
  *((_QWORD *)v2 + 13) = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.wifi.usage-monitor", v11);
  v13 = (void *)*((_QWORD *)v2 + 18);
  *((_QWORD *)v2 + 18) = v12;

  *((_WORD *)v2 + 16) = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)*((_QWORD *)v2 + 26);
  *((_QWORD *)v2 + 26) = v14;

  *((_QWORD *)v2 + 35) = 0x7FFFFFFFFFFFFFFFLL;
  v16 = -[WiFiSoftError initWithName:]([WiFiSoftError alloc], "initWithName:", CFSTR("Trigger Disconnect"));
  v17 = (void *)*((_QWORD *)v2 + 36);
  *((_QWORD *)v2 + 36) = v16;

  v18 = -[WiFiSoftError initWithName:]([WiFiSoftError alloc], "initWithName:", CFSTR("Cellular Fallback"));
  v19 = (void *)*((_QWORD *)v2 + 37);
  *((_QWORD *)v2 + 37) = v18;

  v20 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = 0;

  objc_initWeak(&location, v2);
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __24__WiFiUsageMonitor_init__block_invoke;
  v29 = &unk_1E881CE60;
  objc_copyWeak(&v30, &location);
  v21 = MEMORY[0x1D17AC9EC](&v26);
  v22 = (void *)*((_QWORD *)v2 + 27);
  *((_QWORD *)v2 + 27) = v21;

  dispatch_async(*((dispatch_queue_t *)v2 + 18), &__block_literal_global_160);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel_faultEventDetected_, CFSTR("SessionNotificationFaultEventDetected"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel_brokenLinkDetected_, CFSTR("SessionNotificationBrokenLinkDetected"), 0);

  objc_msgSend(v2, "getMobileAssets");
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return (WiFiUsageMonitor *)v2;
}

void __24__WiFiUsageMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(v3, "canSubmitToCA"))
  {
    v14 = WeakRetained;
    objc_msgSend(v3, "summary");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    if (v17)
    {
      v16 = *(_QWORD *)v26;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(obj);
          v19 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v5);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v7, "count");
            *(_DWORD *)buf = 136315650;
            v31 = "-[WiFiUsageMonitor init]_block_invoke";
            v32 = 2112;
            v33 = v6;
            v34 = 2048;
            v35 = v8;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: calling AnalyticsSendEventLazy for LQM window analysis as %@ (%lu metrics)", buf, 0x20u);

          }
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v18, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v22;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v22 != v12)
                  objc_enumerationMutation(v9);
                v20 = v3;
                AnalyticsSendEventLazy();

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v11);
          }

          v5 = v19 + 1;
        }
        while (v19 + 1 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
      }
      while (v17);
    }

    WeakRetained = v14;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[WiFiUsageMonitor init]_block_invoke_2";
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - not submitting this analysis to CA (downsampled)", buf, 0xCu);
  }
  objc_msgSend(WeakRetained[26], "removeObject:", v3);

}

uint64_t __24__WiFiUsageMonitor_init__block_invoke_155(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metricCallbackForMetric:AndField:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __24__WiFiUsageMonitor_init__block_invoke_159()
{
  void *v0;
  id v1;
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v0 = (void *)objc_opt_class();
    v1 = v0;
    v3 = 136315650;
    v4 = "-[WiFiUsageMonitor init]_block_invoke";
    v5 = 2112;
    v6 = v0;
    v7 = 2112;
    v8 = (id)objc_opt_class();
    v2 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: started configuration of %@ and %@", (uint8_t *)&v3, 0x20u);

  }
}

- (void)faultEventDetected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionNotificationFaultType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SessionNotificationInterfaceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[WiFiUsageMonitor faultEventDetected:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fault event %@ detected on interface %@", (uint8_t *)&v9, 0x20u);
  }
  if (v6 && v8)
    -[WiFiUsageMonitor addFaultEvent:forInterface:](self, "addFaultEvent:forInterface:", (int)objc_msgSend(v6, "intValue"), v8);

}

- (void)brokenLinkDetected:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WiFiUsageMonitor *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__WiFiUsageMonitor_brokenLinkDetected___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __39__WiFiUsageMonitor_brokenLinkDetected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SessionNotificationBrokenLinkReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SessionNotificationInterfaceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 160))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = "-[WiFiUsageMonitor brokenLinkDetected:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: handling broken link with reason %@ detected on interface %@", (uint8_t *)&v10, 0x20u);
    }
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160);
    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SessionNotificationBrokenLinkReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  }
}

- (void)initializeDeviceLockState:(BOOL)a3 displayState:(BOOL)a4 motionState:(id)a5 callState:(BOOL)a6 mediaState:(BOOL)a7 chargingState:(BOOL)a8 companionConnectionState:(BOOL)a9 andSecondaryInterfaceName:(id)a10 compatibilityMode:(BOOL)a11 badLinkRssi:(int64_t)a12 goodLinkRssi:(int64_t)a13
{
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v17;
  _BOOL8 v18;
  id v20;
  id v21;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v17 = a4;
  v18 = a3;
  v21 = a10;
  v20 = a5;
  -[WiFiUsageMonitor setDeviceLockState:](self, "setDeviceLockState:", v18);
  -[WiFiUsageMonitor setDisplayState:](self, "setDisplayState:", v17);
  -[WiFiUsageMonitor setMotionState:](self, "setMotionState:", v20);

  -[WiFiUsageMonitor setCallState:](self, "setCallState:", v15);
  -[WiFiUsageMonitor setMediaState:](self, "setMediaState:", v14);
  -[WiFiUsageMonitor setDeviceChargingState:](self, "setDeviceChargingState:", v13);
  -[WiFiUsageMonitor setCompanionConnectionState:](self, "setCompanionConnectionState:", a9);
  -[WiFiUsageMonitor setCompatibilityModeEnabled:](self, "setCompatibilityModeEnabled:", a11);
  -[WiFiUsageMonitor setTdLogic_badRssiThreshold:](self, "setTdLogic_badRssiThreshold:", a12);
  -[WiFiUsageMonitor setTdLogic_goodRssiThreshold:](self, "setTdLogic_goodRssiThreshold:", a13);
  -[WiFiUsageMonitor setSecondaryInterfaceName:](self, "setSecondaryInterfaceName:", v21);

}

- (void)setCompletionHandler:(id)a3 withContext:(void *)a4 onQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  void *v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__WiFiUsageMonitor_setCompletionHandler_withContext_onQueue___block_invoke;
  v13[3] = &unk_1E881CEA8;
  v15 = v8;
  v16 = a4;
  v13[4] = self;
  v14 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __61__WiFiUsageMonitor_setCompletionHandler_withContext_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1D17AC9EC](*(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = *(_QWORD *)(a1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
}

- (void)setFaultEventHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__WiFiUsageMonitor_setFaultEventHandler___block_invoke;
  v7[3] = &unk_1E881CED0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __41__WiFiUsageMonitor_setFaultEventHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1D17AC9EC](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

}

- (void)startMonitoringWiFiInterface:(id)a3 withLinkSessionOnly:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  BOOL v12;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke;
  block[3] = &unk_1E881CF48;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  WiFiUsageInterfaceCapabilities *v4;
  void *v5;
  WiFiUsageLinkSession *v6;
  WiFiUsageLinkSession *v7;
  WiFiUsageNetworkSession *v8;
  WiFiUsageApplicationSession *v9;
  WiFiUsageSoftApSession *v10;
  WiFiUsageBatterySaveSession *v11;
  WiFiUsageRealTimeCoexSession *v12;
  WiFiUsagePoorLinkSession *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  WiFiUsageLQMRollingWindow *v23;
  uint64_t v24;
  void *v25;
  WiFiUsageLinkSession *v26;
  WiFiUsageDeviceSession *v27;
  WiFiUsageInterfaceCapabilities *v28;
  _QWORD v29[4];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v2, "containsObject:") & 1) == 0)
    {
      v4 = -[WiFiUsageInterfaceCapabilities initWithInterfaceName:]([WiFiUsageInterfaceCapabilities alloc], "initWithInterfaceName:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "setValue:forKey:", v4, *(_QWORD *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WiFiUsageLinkSession initWithInterfaceName:andCapabilities:]([WiFiUsageLinkSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
      v7 = v6;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
        -[WiFiUsageSession enableXCTestNotifications](v6, "enableXCTestNotifications");
      objc_msgSend(v5, "addObject:", v7);
      v26 = v7;
      if (!*(_BYTE *)(a1 + 48))
      {
        v27 = -[WiFiUsageDeviceSession initWithInterfaceName:andCapabilities:]([WiFiUsageDeviceSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v8 = -[WiFiUsageNetworkSession initWithInterfaceName:andCapabilities:]([WiFiUsageNetworkSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v9 = -[WiFiUsageApplicationSession initWithInterfaceName:andCapabilities:]([WiFiUsageApplicationSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v10 = -[WiFiUsageSoftApSession initWithInterfaceName:andCapabilities:]([WiFiUsageSoftApSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v11 = -[WiFiUsageBatterySaveSession initWithInterfaceName:andCapabilities:]([WiFiUsageBatterySaveSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v12 = -[WiFiUsageRealTimeCoexSession initWithInterfaceName:andCapabilities:]([WiFiUsageRealTimeCoexSession alloc], "initWithInterfaceName:andCapabilities:", *(_QWORD *)(a1 + 32), v4);
        v13 = -[WiFiUsagePoorLinkSession initWithInterfaceName:andCapabilities:onQueue:]([WiFiUsagePoorLinkSession alloc], "initWithInterfaceName:andCapabilities:onQueue:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144));
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
        {
          -[WiFiUsageSession enableXCTestNotifications](v27, "enableXCTestNotifications");
          if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
          {
            -[WiFiUsageSession enableXCTestNotifications](v8, "enableXCTestNotifications");
            if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
            {
              -[WiFiUsageSession enableXCTestNotifications](v9, "enableXCTestNotifications");
              if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
              {
                -[WiFiUsageSession enableXCTestNotifications](v10, "enableXCTestNotifications");
                if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
                {
                  -[WiFiUsageSession enableXCTestNotifications](v11, "enableXCTestNotifications");
                  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
                  {
                    -[WiFiUsageSession enableXCTestNotifications](v12, "enableXCTestNotifications");
                    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
                      -[WiFiUsageSession enableXCTestNotifications](v13, "enableXCTestNotifications");
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v5, "addObject:", v27, v3);
        objc_msgSend(v5, "addObject:", v8);
        objc_msgSend(v5, "addObject:", v9);
        objc_msgSend(v5, "addObject:", v10);
        objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(v5, "addObject:", v12);
        objc_msgSend(v5, "addObject:", v13);

        v3 = v25;
      }
      v28 = v4;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v5;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        v18 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v29[0] = v18;
            v29[1] = 3221225472;
            v29[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_177;
            v29[3] = &unk_1E881CF20;
            v30 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v20, "setCompletionHandler:withContext:onQueue:", v29, v30, *(_QWORD *)(v30 + 144));
            objc_msgSend(v20, "systemWakeStateDidChange:wokenByWiFi:", 1, 0);
            objc_msgSend(v20, "lockStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9));
            objc_msgSend(v20, "displayStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10));
            objc_msgSend(v20, "motionStateDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
            objc_msgSend(v20, "callStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 13));
            objc_msgSend(v20, "mediaStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 14));
            objc_msgSend(v20, "chargingStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11));
            objc_msgSend(v20, "companionStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12));
            objc_msgSend(v20, "secondaryInterfaceNameDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
            objc_msgSend(v20, "setPrivacyRestrictionDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32));
            objc_msgSend(v20, "setProcessInitTime:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
            objc_msgSend(v20, "tdLogic_badRssi:goodRSSI:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v16);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "setValue:forKey:", v14, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setValue:forKey:", v26, *(_QWORD *)(a1 + 32));
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("interface usage session was set"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "postNotification:", v22);

      }
      v23 = -[WiFiUsageLQMRollingWindow initWithInterfaceName:andInterfaceCapabilities:]([WiFiUsageLQMRollingWindow alloc], "initWithInterfaceName:andInterfaceCapabilities:", *(_QWORD *)(a1 + 32), v28);
      -[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria](v23, "configureDataTriggeredCriteria");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKey:", v23, *(_QWORD *)(a1 + 32));

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v37 = "-[WiFiUsageMonitor startMonitoringWiFiInterface:withLinkSessionOnly:]_block_invoke";
    v38 = 2112;
    v39 = v24;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName:%@", buf, 0x16u);
  }
}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (objc_msgSend(v6, "type") == 9)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v7, "usageSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v14, "type") != 9 && objc_msgSend(v14, "isSessionActive"))
            objc_msgSend(v14, "poorLinkSessionStats:", v6);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v11);
    }

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v15 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v15 + 152))
    goto LABEL_16;
  if (!*(_QWORD *)(v15 + 176))
    goto LABEL_16;
  v16 = (void *)MEMORY[0x1D17AC818]();
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(NSObject **)(v17 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_2;
  block[3] = &unk_1E881CEF8;
  v26 = &v27;
  block[4] = v17;
  v25 = v6;
  dispatch_sync(v18, block);

  objc_autoreleasePoolPop(v16);
  if (!*((_BYTE *)v28 + 24))
  {
LABEL_16:
    v19 = (void *)MEMORY[0x1D17AC818]();
    objc_msgSend(v7, "submitAnalytics:", v6);
    objc_autoreleasePoolPop(v19);
  }
  +[WiFiSoftApUsageMonitor sharedInstance](WiFiSoftApUsageMonitor, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_msgSend(v6, "type") == 6;

    if (v21)
    {
      +[WiFiSoftApUsageMonitor sharedInstance](WiFiSoftApUsageMonitor, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sessionSummary:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "updateStats:", v23);

    }
  }
  _Block_object_dispose(&v27, 8);

}

void __69__WiFiUsageMonitor_startMonitoringWiFiInterface_withLinkSessionOnly___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 152);
  v4 = *(_QWORD *)(v2 + 168);
  v5 = objc_msgSend(*(id *)(a1 + 40), "type");
  objc_msgSend(*(id *)(a1 + 40), "sessionSummary:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5, v6);

}

- (void)setPrivacyRestrictionDisabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  self->_privacyRestrictionDisabled = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WiFiUsageMonitor_setPrivacyRestrictionDisabled___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __50__WiFiUsageMonitor_setPrivacyRestrictionDisabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "setPrivacyRestrictionDisabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setPrivacyRestrictionDisabled"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotification:", v14);

  }
}

- (void)setSystemWakeState:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  NSObject *internalQueue;
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WiFiUsageMonitor_setSystemWakeState_wokenByWiFi___block_invoke;
  v5[3] = &unk_1E881CF70;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(internalQueue, v5);
}

void __51__WiFiUsageMonitor_setSystemWakeState_wokenByWiFi___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "systemWakeStateDidChange:wokenByWiFi:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 41));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setSystemWakeState"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v16);

  }
}

- (void)setDeviceLockState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__WiFiUsageMonitor_setDeviceLockState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __39__WiFiUsageMonitor_setDeviceLockState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v21;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14++), "lockStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

    v1 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v1 + 9) && !*(_QWORD *)(v1 + 344) && *(_QWORD *)(v1 + 328) <= 0x64uLL)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 344);
      *(_QWORD *)(v16 + 344) = v15;

      v1 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("DeviceLockState"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotification:", v19);

  }
}

- (void)setDisplayState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__WiFiUsageMonitor_setDisplayState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __36__WiFiUsageMonitor_setDisplayState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 10) != v2)
  {
    *(_BYTE *)(v1 + 10) = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "displayStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setDisplayState"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v16);

  }
}

- (void)setMotionState:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__WiFiUsageMonitor_setMotionState___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __35__WiFiUsageMonitor_setMotionState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v20;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v20 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v16;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v16 != v11)
                  objc_enumerationMutation(v8);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "motionStateDidChange:", *(_QWORD *)(a1 + 40));
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v10);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v4);
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setMotionState"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotification:", v14);

  }
}

- (void)setSmartCoverState:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__WiFiUsageMonitor_setSmartCoverState___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __39__WiFiUsageMonitor_setSmartCoverState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "smartCoverStateDidChange:", *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setSmartCoverState"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotification:", v14);

  }
}

- (void)setCallState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__WiFiUsageMonitor_setCallState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __33__WiFiUsageMonitor_setCallState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t k;
  uint64_t v20;
  _BYTE *v21;
  const __CFString *v22;
  void *v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  WiFiUsageLQMWindowAnalysisInCall *v27;
  uint64_t v28;
  const __CFString *v29;
  double v30;
  WiFiUsageLQMWindowAnalysisInCall *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 13) != v2)
  {
    *(_BYTE *)(v1 + 13) = v2;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v48 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v44 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "callStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 13));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v12);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v6);
    }

    v15 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v15 + 13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 224);
      *(_QWORD *)(v17 + 224) = v16;

      v15 = *(_QWORD *)(a1 + 32);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(v15 + 120), "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v36; ++k)
        {
          if (*(_QWORD *)v40 != v35)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
          v21 = *(_BYTE **)(a1 + 32);
          if (v21[13])
            v22 = CFSTR("Call Start");
          else
            v22 = CFSTR("Call End");
          objc_msgSend(v21, "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("InCall"), v22, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = *(unsigned __int8 **)(a1 + 32);
            v37 = v24[13];
            v25 = v24[15];
            v26 = v24[16];
            v27 = [WiFiUsageLQMWindowAnalysisInCall alloc];
            v28 = *(_QWORD *)(a1 + 32);
            if (*(_BYTE *)(v28 + 13))
              v29 = CFSTR("Call Start");
            else
              v29 = CFSTR("Call End");
            objc_msgSend(*(id *)(v28 + 224), "timeIntervalSinceNow");
            v38 = v38 & 0xFFFFFFFFFF000000 | v37 | (v25 << 8) | (v26 << 16);
            v31 = -[WiFiUsageLQMWindowAnalysisInCall initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:](v27, "initWithRollingWindow:andCallStatus:andCallDuration:andContext:andTimestamp:onQueue:", v20, v29, -v30);
            objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v31);

          }
        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v36);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setCallState"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotification:", v33);

  }
}

- (void)setMediaState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__WiFiUsageMonitor_setMediaState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __34__WiFiUsageMonitor_setMediaState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 14) != v2)
  {
    *(_BYTE *)(v1 + 14) = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "mediaStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 14));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setMediaState"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v16);

  }
}

- (void)setCompanionConnectionState:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_setCompanionConnectionState___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __48__WiFiUsageMonitor_setCompanionConnectionState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 12) != v2)
  {
    *(_BYTE *)(v1 + 12) = v2;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "companionStateDidChange:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

  }
}

- (void)setCompatibilityModeEnabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_setCompatibilityModeEnabled___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __48__WiFiUsageMonitor_setCompatibilityModeEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
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
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 28) != v2)
  {
    *(_BYTE *)(v1 + 28) = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
                objc_msgSend(v15, "updateWithCompatibilityMode:", *(unsigned __int8 *)(a1 + 40));
                if (objc_msgSend(v15, "type") == 4)
                {
                  objc_msgSend(v15, "currentBssSession");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "updateWithCompatibilityMode:", *(unsigned __int8 *)(a1 + 40));

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }

  }
}

- (void)setSecondaryInterfaceName:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WiFiUsageMonitor *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WiFiUsageMonitor_setSecondaryInterfaceName___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __46__WiFiUsageMonitor_setSecondaryInterfaceName___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    if (v3)
    {
      if ((objc_msgSend(v3, "isEqualToString:") & 1) != 0)
      {
LABEL_20:
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("secondary interface name set"), 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "postNotification:", v19);

        }
        return;
      }
      v1 = *(void **)(a1 + 32);
    }
    v4 = objc_msgSend(v1, "copy");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v21;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17++), "secondaryInterfaceNameDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v15);
          }

          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    goto LABEL_20;
  }
}

- (void)updateLQMWindowCriteria
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WiFiUsageMonitor_updateLQMWindowCriteria__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __43__WiFiUsageMonitor_updateLQMWindowCriteria__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "configureDataTriggeredCriteria");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)setJoinEvent:(BOOL)a3 withReason:(unint64_t)a4 lastDisconnectReason:(unint64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7 forInterface:(id)a8
{
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  BOOL v25;

  v14 = a7;
  v15 = a8;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__WiFiUsageMonitor_setJoinEvent_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_forInterface___block_invoke;
  block[3] = &unk_1E881CFC0;
  block[4] = self;
  v20 = v15;
  v25 = a3;
  v21 = v14;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v17 = v14;
  v18 = v15;
  dispatch_async(internalQueue, block);

}

void __112__WiFiUsageMonitor_setJoinEvent_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_forInterface___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  WiFiUsageLQMWindowAnalysisJoin *v21;
  void *v22;
  void *v23;
  WiFiUsageLQMWindowAnalysisJoin *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "valueForKey:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
        v9 = *(unsigned __int8 *)(a1 + 80);
        if (*(_BYTE *)(a1 + 80))
        {
          objc_msgSend(*(id *)(a1 + 48), "networkName");
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v1;
        }
        else
        {
          v10 = 0;
        }
        objc_msgSend(v8, "joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:", v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
        if (v9)

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v5);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("SetJoinEvent"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotification:", v12);

  }
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    +[WiFiUsageSession joinReasonString:](WiFiUsageSession, "joinReasonString:", *(_QWORD *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("Join"), v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *(unsigned __int8 **)(a1 + 32);
      v18 = v17[13];
      v19 = v17[15];
      v20 = v17[16];
      v21 = [WiFiUsageLQMWindowAnalysisJoin alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageSession joinReasonString:](WiFiUsageSession, "joinReasonString:", *(_QWORD *)(a1 + 56));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[WiFiUsageLQMWindowAnalysisJoin initWithRollingWindow:andReasonString:andContext:andTimestamp:onQueue:](v21, "initWithRollingWindow:andReasonString:andContext:andTimestamp:onQueue:", v22, v23, v18 | (v19 << 8) | (v20 << 16), v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

      objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v24);
    }
    v25 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v25 + 328) <= 0x64uLL)
    {
      if (*(_QWORD *)(v25 + 408) || *(_QWORD *)(v25 + 448))
      {
        *(_BYTE *)(v25 + 36) = 1;
      }
      else
      {
        ++*(_QWORD *)(v25 + 336);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(void **)(v27 + 352);
        *(_QWORD *)(v27 + 352) = v26;

        v29 = (void *)MEMORY[0x1E0CB37E8];
        +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
        objc_msgSend(v29, "numberWithDouble:");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(void **)(v31 + 360);
        *(_QWORD *)(v31 + 360) = v30;

        v33 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v33 + 344))
        {
          v34 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(v33 + 352), "timeIntervalSinceDate:");
          objc_msgSend(v34, "numberWithDouble:");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(void **)(v36 + 368);
          *(_QWORD *)(v36 + 368) = v35;

        }
      }
    }

  }
}

- (void)setForgetNetworkEvent:(id)a3 forInterface:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl())
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WiFiUsageMonitor_setForgetNetworkEvent_forInterface___block_invoke;
    block[3] = &unk_1E881CF98;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(internalQueue, block);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor setForgetNetworkEvent:forInterface:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s Do Nothing as WiFiDirectDonation Feature Flag Disabled! details:%@", buf, 0x16u);
  }

}

void __55__WiFiUsageMonitor_setForgetNetworkEvent_forInterface___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[WiFiUsageMonitor setForgetNetworkEvent:forInterface:]_block_invoke";
    v16 = 2112;
    v17 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s details:%@", buf, 0x16u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1[5] + 104), "valueForKey:", a1[6], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "type") == 3)
          objc_msgSend(v8, "processForgetNetwork:", a1[4]);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setLinkEvent:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7 forInterface:(id)a8
{
  id v14;
  id v15;
  NSObject *internalQueue;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  BOOL v24;
  BOOL v25;

  v14 = a7;
  v15 = a8;
  internalQueue = self->_internalQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __116__WiFiUsageMonitor_setLinkEvent_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_forInterface___block_invoke;
  v19[3] = &unk_1E881CFE8;
  v19[4] = self;
  v20 = v15;
  v24 = a3;
  v25 = a4;
  v21 = v14;
  v22 = a5;
  v23 = a6;
  v17 = v14;
  v18 = v15;
  dispatch_async(internalQueue, v19);

}

void __116__WiFiUsageMonitor_setLinkEvent_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  WiFiUsageLQMWindowAnalysisLinkDown *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  unint64_t v29;
  const __CFString *v30;
  WiFiUsageLQMWindowAnalysisLinkDown *v31;
  void *v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  WiFiUsageLQMWindowAnalysisDataTriggered *v38;
  void *v39;
  WiFiUsageLQMWindowAnalysisDataTriggered *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("YES");
    v4 = *(_QWORD *)(a1 + 48);
    if (!*(_BYTE *)(a1 + 72))
      v3 = CFSTR("NO");
    *(_DWORD *)buf = 136315651;
    v70 = "-[WiFiUsageMonitor setLinkEvent:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:forInter"
          "face:]_block_invoke";
    v71 = 2112;
    v72 = v3;
    v73 = 2113;
    v74 = v4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - isUp:%@ details:%{private}@", buf, 0x20u);
  }
  if (*(_BYTE *)(a1 + 72))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 48);
    v7 = *(void **)(v5 + 264);
    *(_QWORD *)(v5 + 264) = v6;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v8 + 264);
    *(_QWORD *)(v8 + 264) = 0;
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "valueForKey:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  v11 = v10;
  if (v10)
  {
    v12 = *(_QWORD *)v65;
    v13 = v10;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v65 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:", *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
      }
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v13);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("SetLinkEvent"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotification:", v16);

  }
  if (!v11)
  {
LABEL_32:
    if (!*(_BYTE *)(a1 + 72))
    {
      if (v2)
      {
        objc_msgSend(v2, "sessionDuration");
        v42 = v41;
      }
      else
      {
        v42 = 9.22337204e18;
      }
      objc_msgSend(*(id *)(a1 + 48), "connectedBss");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bssid");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[WiFiUsageAccessPointProfile updateWithAssocTime:forBssid:](WiFiUsageAccessPointProfile, "updateWithAssocTime:forBssid:", v44, v42);

      if (!*(_BYTE *)(a1 + 72))
        goto LABEL_41;
    }
    goto LABEL_37;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 32);
      +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:", *(_QWORD *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("LinkDown"), v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = *(unsigned __int8 **)(a1 + 32);
        v63 = v21[13];
        v62 = v21[15];
        v22 = v21[16];
        v23 = [WiFiUsageLQMWindowAnalysisLinkDown alloc];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(unsigned __int8 *)(a1 + 73);
        v26 = *(_QWORD *)(a1 + 56);
        v27 = *(_QWORD *)(a1 + 64);
        if (v2)
        {
          objc_msgSend(v2, "sessionDuration");
          v29 = (unint64_t)v28;
        }
        else
        {
          v29 = 0x8000000000000000;
        }
        v31 = -[WiFiUsageLQMWindowAnalysisLinkDown initWithRollingWindow:WithIsInvoluntary:AndLinkChangeReason:AndLinkChangeSubreason:AndDuration:andContext:AndTimestamp:onQueue:](v23, "initWithRollingWindow:WithIsInvoluntary:AndLinkChangeReason:AndLinkChangeSubreason:AndDuration:andContext:AndTimestamp:onQueue:", v24, v25 != 0, v26, v27, v29, v63 | (v62 << 8) | (v22 << 16), v20, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

        objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v31);
      }
      if (v17)
      {
        objc_msgSend(v17, "triggerCriteriaFilterList");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        if (v33)
        {
          if (objc_msgSend(v17, "endOngoingCriteria"))
          {
            v34 = *(unsigned __int8 **)(a1 + 32);
            v35 = v34[13];
            v36 = v34[15];
            v37 = v34[16];
            v38 = [WiFiUsageLQMWindowAnalysisDataTriggered alloc];
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:](v38, "initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:", v17, CFSTR("LinkDown"), v35 | (v36 << 8) | (v37 << 16), v39, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));

            objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v40);
            objc_msgSend(v17, "cleanUpStashedMedians");
            objc_msgSend(v17, "clearOngoingCriteriaDates");

          }
        }
      }

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v70 = "-[WiFiUsageMonitor setLinkEvent:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:forInt"
            "erface:]_block_invoke";
      v71 = 2112;
      v72 = v30;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName:%@", buf, 0x16u);
    }
    goto LABEL_32;
  }
LABEL_37:
  v45 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v45 + 328) <= 0x64uLL)
  {
    if (*(_QWORD *)(v45 + 408) || *(_QWORD *)(v45 + 448))
    {
      *(_BYTE *)(v45 + 36) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(a1 + 32);
      v48 = *(void **)(v47 + 376);
      *(_QWORD *)(v47 + 376) = v46;

      v49 = (void *)MEMORY[0x1E0CB37E8];
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
      objc_msgSend(v49, "numberWithDouble:");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = *(_QWORD *)(a1 + 32);
      v52 = *(void **)(v51 + 384);
      *(_QWORD *)(v51 + 384) = v50;

      v53 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v53 + 344))
      {
        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        objc_msgSend(v54, "numberWithDouble:");
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = *(_QWORD *)(a1 + 32);
        v57 = *(void **)(v56 + 392);
        *(_QWORD *)(v56 + 392) = v55;

        v53 = *(_QWORD *)(a1 + 32);
      }
      if (*(_QWORD *)(v53 + 352))
      {
        v58 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v53 + 376), "timeIntervalSinceDate:");
        objc_msgSend(v58, "numberWithDouble:");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = *(_QWORD *)(a1 + 32);
        v61 = *(void **)(v60 + 400);
        *(_QWORD *)(v60 + 400) = v59;

      }
    }
  }
LABEL_41:

}

+ (void)appendTDStateToDict:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  unsigned int v95;
  uint64_t v96;
  unsigned __int8 v97;
  unsigned __int8 v98;
  unsigned __int8 v99;
  unsigned __int8 v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  unsigned __int8 v103;
  unsigned __int8 v104;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("TD_inTDEval");
LABEL_18:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isSessionActive"))
    v9 = objc_msgSend(v7, "isInTDEval");
  else
    v9 = 0;
  objc_msgSend(v8, "numberWithBool:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("TD_inTDEval"));

  if (objc_msgSend(v7, "isSessionActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "tdConfirmed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("TD_Triggered"));

    if (objc_msgSend(v7, "isLastDecisionStateValid"))
    {
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v14, "numberWithBool:", v104);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("TD_Decision_TxPER"));

      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v16, "numberWithBool:", v103);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("TD_Decision_FWTxPER"));

      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v18, "numberWithBool:", v102);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("TD_Decision_BeaconPER"));

      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v20, "numberWithBool:", v101);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("TD_Decision_GatewayARPFailure"));

      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v22, "numberWithBool:", v100);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("TD_Decision_SymptomsDNSError"));

      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v24, "numberWithBool:", v99);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("TD_Decision_AutoLeave"));

      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v26, "numberWithBool:", v98);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("TD_Decision_ActiveProbe"));

      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v28, "numberWithBool:", v97);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("TD_Decision_FastTD"));

      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v30, "numberWithInteger:", v96);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("TD_AutoLeaveRSSIthreshold"));

    }
    if (objc_msgSend(v7, "isLastFastTdVotesValid"))
    {
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v32, "numberWithBool:", v33 & 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("TD_VoteFastTD_LinkRecommendation"));

      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v35, "numberWithBool:", (v36 >> 8) & 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("TD_VoteFastTD_TXPER"));

      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v38, "numberWithBool:", (v39 >> 24) & 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("TD_VoteFastTD_FWTXPER"));

      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v41, "numberWithBool:", (v42 >> 16) & 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("TD_VoteFastTD_BeaconPER"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "last_FastTdVotes"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("TD_VoteFastTD_VoteCount"));

      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v45, "numberWithBool:", HIDWORD(v46) & 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("TD_StateFastTD_RTApp"));

      v48 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_FastTdVotes");
      objc_msgSend(v48, "numberWithBool:", (v49 >> 40) & 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("TD_StateFastTD_Cheap5G"));

    }
    objc_msgSend(v7, "lastTDEval_ConfirmedAt");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      v52 = (void *)v51;
      v53 = objc_msgSend(v7, "isLastSuppressStateValid");

      if (v53)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 24) & 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("TD_Suppress_SymptomsNODataStall"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 32) & 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("TD_Suppress_SymptomsAppPolicy"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 40) & 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("TD_Suppress_FastCheapCellular"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 48) & 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("TD_Suppress_2dBGuard"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 56) & 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("TD_Suppress_NoFGnetwApp"));

        v59 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "last_SuppressState");
        objc_msgSend(v59, "numberWithBool:", v60 & 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("TD_Suppress_TTR"));

        v62 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "last_SuppressState");
        objc_msgSend(v62, "numberWithBool:", (v63 >> 8) & 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("TD_Suppress_UserInput"));

        v65 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "last_SuppressState");
        objc_msgSend(v65, "numberWithBool:", (v66 >> 16) & 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("TD_Suppress_GoodAfterRoam"));

        v68 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "last_SuppressState");
        objc_msgSend(v68, "numberWithBool:", (v69 >> 24) & 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("TD_Suppress_ActiveProbing"));

        v71 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "last_SuppressState");
        objc_msgSend(v71, "numberWithBool:", HIDWORD(v72) & 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("TD_Suppress_Roam"));

      }
    }
    if (objc_msgSend(v7, "isLastDecisionStateValid"))
    {
      objc_msgSend(v7, "last_DecisionState");
      +[WiFiUsagePrivacyFilter getLabelForTDMode:](WiFiUsagePrivacyFilter, "getLabelForTDMode:", v95);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v74, CFSTR("TD_Mode"));

      v75 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v75, "numberWithBool:", v94);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v76, CFSTR("TD_EdgeBSS"));

      v77 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v77, "numberWithBool:", v93);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("TD_MotionDetected"));

      v79 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v79, "numberWithBool:", v92);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, CFSTR("TD_WalkoutDetected"));

      v81 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v81, "numberWithBool:", v91);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("TD_WaitForRoam"));

      v83 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v83, "numberWithBool:", v90);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("TD_AppsUsingWiFi"));

      v85 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "last_DecisionState");
      objc_msgSend(v85, "numberWithBool:", v89);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("TD_monitorOnly"));

    }
    if (objc_msgSend(v7, "isLastSuppressStateValid"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 16) & 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v87, CFSTR("TD_FastTDEvaluation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "last_SuppressState") & 1);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("TD_AggressiveTD"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)objc_msgSend(v7, "last_SuppressState") >> 8) & 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("TD_RNF_allowed");
      goto LABEL_18;
    }
  }
LABEL_19:

}

- (void)appendUsbStatsToDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAnyUsbInserted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("isUsbInserted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSArray count](self->_usbDevices, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("usbDevicesCount"));

  if (-[NSArray count](self->_usbDevices, "count"))
  {
    -[NSArray firstObject](self->_usbDevices, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    +[WiFiUsagePrivacyFilter getLabelForUsbVendor:](WiFiUsagePrivacyFilter, "getLabelForUsbVendor:", objc_msgSend((id)v7, "vid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("usbVendor"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usbVendor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", CFSTR("Other"));

    if ((v7 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[NSArray firstObject](self->_usbDevices, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "vid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("usbVendorID"));

    }
  }
  v25 = v4;
  v13 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_usbDevices;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v20, "vidIsApple"))
          v17 = objc_msgSend(v20, "vidIsApple");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "controllerID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 & 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v22, CFSTR("isAnyUSBDeviceVendorApple"));

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "anyObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, CFSTR("usbController"));

  }
  if (-[NSArray count](self->_usbDevices, "count") && self->_noiseDeltaUponUSBInsertion != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("noiseDeltaUponUSBInsertion"));

  }
}

- (void)appendBTStatsToDict:(id)a3
{
  void *v4;
  _BOOL8 inActiveSco;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  inActiveSco = self->_inActiveSco;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", inActiveSco);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("isSCOActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inActiveA2dp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("isA2dpActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inActiveCall);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("inCall"));

  if (self->_curBTAudioBand)
    v10 = CFSTR("5");
  else
    v10 = CFSTR("2.4");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("BTBand"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inActiveUniAoS);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("isUniAoSActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inActiveBiAoS);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("isBiAoSActive"));

}

- (void)updateBeaconInfo:(id)a3 andParsedIE:(id)a4 forInterface:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  WiFiUsageMonitor *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = (void *)objc_msgSend(v9, "copy");
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WiFiUsageMonitor_updateBeaconInfo_andParsedIE_forInterface___block_invoke;
    block[3] = &unk_1E881D038;
    v17 = v8;
    v18 = v11;
    v19 = v12;
    v20 = self;
    v21 = v10;
    v14 = v12;
    v15 = v11;
    dispatch_async(internalQueue, block);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[WiFiUsageMonitor updateBeaconInfo:andParsedIE:forInterface:]";
    v24 = 2112;
    v25 = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }

}

void __62__WiFiUsageMonitor_updateBeaconInfo_andParsedIE_forInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    +[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:](WiFiUsageAccessPointProfile, "profileFromBeaconData:andParsedIE:", a1[5], a1[6]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1[7] + 104), "valueForKey:", a1[8], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSessionActive"))
          objc_msgSend(v8, "updateApProfile:", v2);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)updateWPSInfo:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__WiFiUsageMonitor_updateWPSInfo___block_invoke;
  block[3] = &unk_1E881C8E8;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

uint64_t __34__WiFiUsageMonitor_updateWPSInfo___block_invoke(uint64_t a1)
{
  return +[WiFiUsageAccessPointProfile updateWithWPS:](WiFiUsageAccessPointProfile, "updateWithWPS:", *(_QWORD *)(a1 + 32));
}

- (void)setPowerBudget:(int64_t)a3 andThermalIndex:(int64_t)a4 forInterface:(id)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  WiFiUsageMonitor *v13;
  int64_t v14;
  int64_t v15;

  v8 = a5;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WiFiUsageMonitor_setPowerBudget_andThermalIndex_forInterface___block_invoke;
  v11[3] = &unk_1E881D060;
  v12 = v8;
  v13 = self;
  v14 = a3;
  v15 = a4;
  v10 = v8;
  dispatch_async(internalQueue, v11);

}

void __64__WiFiUsageMonitor_setPowerBudget_andThermalIndex_forInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1[5] + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "powerBudgetDidChange:andThermalIndex:", a1[6], a1[7]);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    if (*(_BYTE *)(a1[5] + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("SetPowerBudgetAndThermalIndex"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotification:", v8);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[WiFiUsageMonitor setPowerBudget:andThermalIndex:forInterface:]_block_invoke";
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setBluetoothState:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9
{
  NSObject *internalQueue;
  _QWORD block[6];
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__WiFiUsageMonitor_setBluetoothState_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand___block_invoke;
  block[3] = &unk_1E881D088;
  v11 = a5;
  v12 = a6;
  block[4] = self;
  block[5] = a4;
  v13 = a7;
  v14 = a8;
  v15 = a9;
  v16 = a3;
  dispatch_async(internalQueue, block);
}

void __101__WiFiUsageMonitor_setBluetoothState_connectedDeviceCount_inA2dp_inSco_inUniAoS_inBiAoS_btAudioBand___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned __int8 *)(v2 + 15) != v3
    || *(unsigned __int8 *)(v2 + 16) != *(unsigned __int8 *)(a1 + 49)
    || *(_QWORD *)(v2 + 56) != *(_QWORD *)(a1 + 40)
    || *(unsigned __int8 *)(v2 + 17) != *(unsigned __int8 *)(a1 + 50)
    || *(unsigned __int8 *)(v2 + 18) != *(unsigned __int8 *)(a1 + 51)
    || *(unsigned __int8 *)(v2 + 19) != *(unsigned __int8 *)(a1 + 52))
  {
    *(_BYTE *)(v2 + 15) = v3;
    v4 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 49);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = *(_BYTE *)(a1 + 50);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = *(_BYTE *)(a1 + 51);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = *(_BYTE *)(a1 + 52);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                LOBYTE(v18) = *(_BYTE *)(a1 + 52);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "bluetoothStateDidChange:connectedDeviceCount:inA2dp:inSco:inUniAoS:inBiAoS:btAudioBand:", *(unsigned __int8 *)(a1 + 53), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(unsigned __int8 *)(a1 + 51), v18);
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("SetBluetoothStateAndConnectedDeviceCountAndInA2dpAndInSco"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotification:", v17);

  }
}

- (void)setAwdlState:(BOOL)a3 inMode:(int64_t)a4
{
  NSObject *internalQueue;
  _QWORD block[6];
  BOOL v6;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WiFiUsageMonitor_setAwdlState_inMode___block_invoke;
  block[3] = &unk_1E881D0B0;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(internalQueue, block);
}

void __40__WiFiUsageMonitor_setAwdlState_inMode___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v2[20] != v3)
  {
    v2[20] = v3;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "awdlStateDidChange:inMode:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    v2 = *(_BYTE **)(a1 + 32);
    if (v2[20])
    {
      objc_msgSend(v2, "rangingSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rangingLinkUp");

      v2 = *(_BYTE **)(a1 + 32);
    }
  }
  if (v2[33])
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setAwdlState"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotification:", v17);

  }
}

- (void)setSoftApState:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  id v21;
  id v22;
  id v23;
  NSObject *internalQueue;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;

  v21 = a4;
  v22 = a5;
  v23 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __184__WiFiUsageMonitor_setSoftApState_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency___block_invoke;
  block[3] = &unk_1E881D0D8;
  v37 = a3;
  block[4] = self;
  v30 = v21;
  v31 = v22;
  v32 = v23;
  v33 = a7;
  v34 = a8;
  v38 = a9;
  v39 = a10;
  v40 = a11;
  v41 = a13;
  v35 = a12;
  v36 = a14;
  v25 = v23;
  v26 = v22;
  v27 = v21;
  dispatch_async(internalQueue, block);

}

void __184__WiFiUsageMonitor_setSoftApState_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              LODWORD(v13) = *(_DWORD *)(a1 + 97);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:", *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v13);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8
{
  id v14;
  NSObject *internalQueue;
  id v16;
  _QWORD block[5];
  id v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v14 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__WiFiUsageMonitor_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden___block_invoke;
  block[3] = &unk_1E881D100;
  v19 = a3;
  block[4] = self;
  v18 = v14;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v16 = v14;
  dispatch_async(internalQueue, block);

}

void __106__WiFiUsageMonitor_addSoftApClientEvent_identifier_isAppleClient_isInstantHotspot_isAutoHotspot_isHidden___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
              if (objc_msgSend(v13, "type") == 6)
                objc_msgSend(v13, "addSoftApClientEvent:identifier:isAppleClient:isInstantHotspot:isAutoHotspot:isHidden:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(unsigned __int8 *)(a1 + 51), *(unsigned __int8 *)(a1 + 52));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7
{
  NSObject *internalQueue;
  _QWORD v8[10];

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __129__WiFiUsageMonitor_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap___block_invoke;
  v8[3] = &unk_1E881D128;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = a5;
  v8[8] = a6;
  v8[9] = a7;
  dispatch_async(internalQueue, v8);
}

void __129__WiFiUsageMonitor_addSoftApCoexEvent_deniedUnii1ChannelMap_deniedUnii2aChannelMap_deniedUnii2cChannelMap_deniedUnii3ChannelMap___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
              if (objc_msgSend(v13, "type") == 6)
                objc_msgSend(v13, "addSoftApCoexEvent:deniedUnii1ChannelMap:deniedUnii2aChannelMap:deniedUnii2cChannelMap:deniedUnii3ChannelMap:", a1[5], a1[6], a1[7], a1[8], a1[9]);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)setRoamingState:(BOOL)a3 withReason:(unint64_t)a4 asString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andPingPongSequence:(id)a10 forInterface:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *internalQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v29;
  WiFiUsageMonitor *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  BOOL v38;

  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__WiFiUsageMonitor_setRoamingState_withReason_asString_andStatus_asString_andLatency_andRoamData_andPingPongSequence_forInterface___block_invoke;
  block[3] = &unk_1E881D150;
  v29 = v19;
  v30 = self;
  v38 = a3;
  v35 = a4;
  v36 = a6;
  v37 = a8;
  v31 = v20;
  v32 = v18;
  v33 = v16;
  v34 = v17;
  v22 = v17;
  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v19;
  dispatch_async(internalQueue, block);

}

void __131__WiFiUsageMonitor_setRoamingState_withReason_asString_andStatus_asString_andLatency_andRoamData_andPingPongSequence_forInterface___block_invoke(uint64_t a1)
{
  WiFiUsageSessionPingPongStats *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  WiFiUsageLQMWindowAnalysisRoaming *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    v2 = -[WiFiUsageSessionPingPongStats initWithPingPongSequence:]([WiFiUsageSessionPingPongStats alloc], "initWithPingPongSequence:", *(_QWORD *)(a1 + 32));
  else
    v2 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 104);
  if (*(unsigned __int8 *)(v3 + 21) == v4)
  {
    v5 = 0;
    goto LABEL_21;
  }
  *(_BYTE *)(v3 + 21) = v4;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {
    v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v8 = v7;
  v5 = 0;
  v9 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v11, "roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:", *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v2);
      if (objc_msgSend(v11, "type") == 4)
      {
        objc_msgSend(v11, "currentBssSession");
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v12;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v8);

  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("Roaming"), *(_QWORD *)(a1 + 64), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = -[WiFiUsageLQMWindowAnalysisRoaming initWithRollingWindow:WithRoamingState:andReasonString:andStatus:asString:andLatency:andRoamData:andCurrentBSSSession:andContext:andPingPongStats:andTimestamp:onQueue:]([WiFiUsageLQMWindowAnalysisRoaming alloc], "initWithRollingWindow:WithRoamingState:andReasonString:andStatus:asString:andLatency:andRoamData:andCurrentBSSSession:andContext:andPingPongStats:andTimestamp:onQueue:", v6, *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v5, *(unsigned __int8 *)(v14 + 13) | ((unint64_t)*(unsigned __int8 *)(v14 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v14 + 16) << 16), v2, v13, *(_QWORD *)(v14 + 144));
      objc_msgSend(*(id *)(a1 + 40), "startLQMAnalysis:", v15);

    }
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(v5, "roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:", *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), -[WiFiUsageSessionPingPongStats pingPongNth](v2, "pingPongNth") != 0);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setRoamingState"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotification:", v17);

  }
}

- (void)setRoamingConfiguration:(int64_t)a3 withChannelList:(id)a4 forInterface:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  WiFiUsageMonitor *v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__WiFiUsageMonitor_setRoamingConfiguration_withChannelList_forInterface___block_invoke;
  v13[3] = &unk_1E881CD30;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a3;
  v11 = v8;
  v12 = v9;
  dispatch_async(internalQueue, v13);

}

void __73__WiFiUsageMonitor_setRoamingConfiguration_withChannelList_forInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1[5] + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "roamingConfigurationDidChange:withChannelList:", a1[7], a1[6]);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor setRoamingConfiguration:withChannelList:forInterface:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateRoamCache:(id)a3 forInterface:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WiFiUsageMonitor_updateRoamCache_forInterface___block_invoke;
  block[3] = &unk_1E881C8E8;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, block);

}

void __49__WiFiUsageMonitor_updateRoamCache_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = 136315394;
    v4 = "-[WiFiUsageMonitor updateRoamCache:forInterface:]_block_invoke";
    v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", (uint8_t *)&v3, 0x16u);
  }
}

- (void)updateBeaconCache:(id)a3 afterRoamAttempt:(id)a4 whileCurrentBSSID:(id)a5 forInterface:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  WiFiUsageMonitor *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__WiFiUsageMonitor_updateBeaconCache_afterRoamAttempt_whileCurrentBSSID_forInterface___block_invoke;
  block[3] = &unk_1E881D038;
  v20 = v13;
  v21 = v11;
  v22 = v12;
  v23 = v10;
  v24 = self;
  v15 = v10;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  dispatch_async(internalQueue, block);

}

void __86__WiFiUsageMonitor_updateBeaconCache_afterRoamAttempt_whileCurrentBSSID_forInterface___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  id v45;
  int v46;
  const __CFString *v47;
  NSObject *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  int v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id obj;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  id v91;
  id v92;
  BOOL v93;
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
  int v110;
  __int16 v111;
  uint8_t v112[128];
  uint8_t buf[4];
  const char *v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  id v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  id v128;
  __int16 v129;
  const __CFString *v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("ROAMEDEVENT_REASON"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectForKey:", CFSTR("ROAMEDEVENT_STATUS"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectForKey:", CFSTR("ROAMEDEVENT_ORIGIN_CHANNEL_FLAGS"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectForKey:", CFSTR("ROAMEDEVENT_ORIGIN_CHANNEL"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectForKey:", CFSTR("ROAMEDEVENT_TARGET_CHANNEL_FLAGS"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "objectForKey:", CFSTR("ROAMEDEVENT_TARGET_CHANNEL"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[WiFiUsagePrivacyFilter bandFromFlags:OrChannel:](WiFiUsagePrivacyFilter, "bandFromFlags:OrChannel:", v68, v67);
    v4 = +[WiFiUsagePrivacyFilter bandFromFlags:OrChannel:](WiFiUsagePrivacyFilter, "bandFromFlags:OrChannel:", v66, v65);
    v5 = (void *)MEMORY[0x1E0CB3940];
    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@GHz->%@GHz"), v6, v7);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = objc_msgSend(v64, "intValue") & 0x1FF;
    v8 = objc_msgSend(v63, "unsignedIntegerValue");
    if (v8 != 3766619137)
    {
      v14 = v8;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
        v115 = 2048;
        v116 = v14;
        v10 = MEMORY[0x1E0C81028];
        v11 = "%s - ignoring beaconCache for CandidatesStats (reason(%lu) is not LowRssi)";
        v12 = 22;
        goto LABEL_10;
      }
LABEL_79:

      return;
    }
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "length") <= 5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
        v115 = 2160;
        v116 = 1752392040;
        v117 = 2112;
        v118 = v9;
        v10 = MEMORY[0x1E0C81028];
        v11 = "%s - currentBSSID (%{mask.hash}@) too short";
        v12 = 32;
LABEL_10:
        _os_log_impl(&dword_1CC44E000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_79;
      }
      goto LABEL_79;
    }
    v111 = 0;
    v110 = 0;
    objc_msgSend(*(id *)(a1 + 48), "getBytes:length:", &v110, 6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x:%02x:%02x:%02x:%02x:%02x"), v110, BYTE1(v110), BYTE2(v110), HIBYTE(v110), v111, HIBYTE(v111));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v106, v133, 16);
    if (v16)
    {
      v80 = 0;
      v17 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v107 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKey:", CFSTR("BSSID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", CFSTR("SSID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqualToString:", v82))
          {
            v22 = v21;

            v80 = v22;
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v106, v133, 16);
      }
      while (v16);

      if (v80)
      {
        v77 = (void *)objc_opt_new();
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v23 = *(id *)(a1 + 56);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v102, v132, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v103 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
              objc_msgSend(v27, "objectForKey:", CFSTR("AGE"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKey:", CFSTR("SSID"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v28, "unsignedIntegerValue") <= 0x1388
                && objc_msgSend(v29, "isEqualToData:", v80))
              {
                objc_msgSend(v77, "addObject:", v27);
              }

            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v102, v132, 16);
          }
          while (v24);
        }

        v79 = objc_msgSend(v77, "count");
        v81 = (void *)objc_opt_new();
        v69 = v62;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        obj = v77;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v131, 16);
        if (v30)
        {
          v76 = -95;
          v75 = 3;
          v71 = *(_QWORD *)v99;
          v78 = -95;
          v74 = -95;
          v72 = 3;
          v73 = 3;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v99 != v71)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
              objc_msgSend(v32, "objectForKey:", CFSTR("BSSID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", CFSTR("CHANNEL_FLAGS"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", CFSTR("CHANNEL"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", CFSTR("RSSI"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = +[WiFiUsagePrivacyFilter bandFromFlags:OrChannel:](WiFiUsagePrivacyFilter, "bandFromFlags:OrChannel:", v34, v35);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "objectForKeyedSubscript:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39 == 0;

              if (v40)
              {
                v41 = (void *)objc_opt_new();
                objc_msgSend(v81, "setObject:forKeyedSubscript:", v41, v38);

              }
              objc_msgSend(v81, "objectForKeyedSubscript:", v38);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v33);

              if (v79)
              {
                if (v36 && objc_msgSend(v36, "integerValue") >= v78)
                {
                  v78 = objc_msgSend(v36, "integerValue");
                  v73 = v37;
                }
                if (objc_msgSend(v33, "isEqualToString:", v82))
                {
                  v76 = objc_msgSend(v36, "integerValue");
                  v75 = v37;
                }
                else if (v36 && objc_msgSend(v36, "integerValue") >= v74)
                {
                  v74 = objc_msgSend(v36, "integerValue");
                  v72 = v37;
                }
                v43 = MEMORY[0x1E0C81028];
                v44 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v37);
                  v45 = (id)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v33, "isEqualToString:", v82);
                  *(_DWORD *)buf = 136316418;
                  v47 = &stru_1E881F240;
                  if (v46)
                    v47 = CFSTR("(current BSSID)");
                  v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
                  v115 = 2160;
                  v116 = 1752392040;
                  v117 = 2112;
                  v118 = (uint64_t)v33;
                  v119 = 2112;
                  v120 = v45;
                  v121 = 2112;
                  v122 = (uint64_t)v36;
                  v123 = 2112;
                  v124 = (uint64_t)v47;
                  _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - bssid:%{mask.hash}@ %@Ghz rssi:%@dBm %@", buf, 0x3Eu);

                }
              }

            }
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v131, 16);
          }
          while (v30);
        }
        else
        {
          v76 = -95;
          v75 = 3;
          v78 = -95;
          v74 = -95;
          v72 = 3;
          v73 = 3;
        }

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
          v115 = 2112;
          v116 = (uint64_t)v81;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - roamCandidatesByBand:%@", buf, 0x16u);
        }
        if (v79)
        {
          v48 = MEMORY[0x1E0C81028];
          v49 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v73);
            v50 = (id)objc_claimAutoreleasedReturnValue();
            +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v72);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = (void *)v51;
            v53 = CFSTR("NO");
            *(_DWORD *)buf = 136317186;
            v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
            v115 = 2048;
            v116 = v76;
            if (!v60)
              v53 = CFSTR("YES");
            v117 = 2048;
            v118 = v78;
            v119 = 2112;
            v120 = v50;
            v121 = 2048;
            v122 = v74;
            v123 = 2112;
            v124 = v51;
            v125 = 2048;
            v126 = v79;
            v127 = 2112;
            v128 = v69;
            v129 = 2112;
            v130 = v53;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - \ncurrentBSSrssi:%lddBm strongestRSSI:%lddBm strongestRssiBand:%@ strongestRssiExcludingCurrent:%lddBm strongestRSSIbandExcludingCurrent:%@Ghz candidatesCount:%lu roamBandTransition:%@ roamSuccessful:%@", buf, 0x5Cu);

          }
        }
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 104), "valueForKey:", *(_QWORD *)(a1 + 32));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
        v56 = v69;
        if (v55)
        {
          v57 = *(_QWORD *)v95;
          do
          {
            for (m = 0; m != v55; ++m)
            {
              if (*(_QWORD *)v95 != v57)
                objc_enumerationMutation(v54);
              v59 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
              v83 = v76;
              v84 = v75;
              v85 = 0;
              v86 = v78;
              v87 = v74;
              v88 = v73;
              v89 = v72;
              v90 = v79;
              v91 = v81;
              v92 = v56;
              v93 = v60 == 0;
              if (v59)
              {
                objc_msgSend(v59, "roamCandidatesStatsDidUpdate:", &v83);
              }
              else
              {

                v56 = v69;
              }
            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v94, v112, 16);
          }
          while (v55);
        }

LABEL_78:
        goto LABEL_79;
      }
    }
    else
    {

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
      v115 = 2160;
      v116 = 1752392040;
      v117 = 2112;
      v118 = (uint64_t)v82;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - currentBSSID (%{mask.hash}@) not in beaconCache", buf, 0x20u);
    }
    goto LABEL_78;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v114 = "-[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]_block_invoke";
    v115 = 2112;
    v116 = v13;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateBssPerChannelWith:(id)a3 into:(id)a4 and:(id)a5 withChannelInfoList:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *lastChannelInfoList;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v34 = a5;
  v12 = a6;
  v13 = (NSArray *)objc_msgSend(v12, "copy");
  lastChannelInfoList = self->_lastChannelInfoList;
  self->_lastChannelInfoList = v13;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        +[WiFiUsageChannel channelWithChannelInfo:](WiFiUsageChannel, "channelWithChannelInfo:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v22 = (void *)objc_opt_new();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v20);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v17);
  }
  v33 = v15;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        +[WiFiUsageChannel channelWithBssDetails:](WiFiUsageChannel, "channelWithBssDetails:", v28, v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bssid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v31);

        objc_msgSend(v28, "bssid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v32);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v25);
  }

}

id __85__WiFiUsageMonitor_submitScanResultWithNeighborBSS_withOtherBSS_withChannelInfoList___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __85__WiFiUsageMonitor_submitScanResultWithNeighborBSS_withOtherBSS_withChannelInfoList___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("All");
  v6[0] = CFSTR("band");
  v6[1] = CFSTR("scannedChannels");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  v6[2] = CFSTR("PerChannelUniqueBSSCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPowerState:(BOOL)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  BOOL v12;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WiFiUsageMonitor_setPowerState_forInterface___block_invoke;
  block[3] = &unk_1E881CF48;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __47__WiFiUsageMonitor_setPowerState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 23) != v3)
    {
      *(_BYTE *)(v2 + 23) = v3;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "powerStateDidChange:", *(unsigned __int8 *)(a1 + 48));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

      v2 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v2 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setPowerState"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotification:", v10);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v18 = "-[WiFiUsageMonitor setPowerState:forInterface:]_block_invoke";
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setControlCenterState:(BOOL)a3 withKnownLocation:(BOOL)a4 forInterface:(id)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD block[4];
  id v12;
  WiFiUsageMonitor *v13;
  BOOL v14;
  BOOL v15;

  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WiFiUsageMonitor_setControlCenterState_withKnownLocation_forInterface___block_invoke;
  block[3] = &unk_1E881D1F0;
  v12 = v8;
  v13 = self;
  v14 = a3;
  v15 = a4;
  v10 = v8;
  dispatch_async(internalQueue, block);

}

void __73__WiFiUsageMonitor_setControlCenterState_withKnownLocation_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 24) != v3)
    {
      *(_BYTE *)(v2 + 24) = v3;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "controlCenterStateDidChange:withKnownLocation:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

      v2 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v2 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("setControlCenterState"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotification:", v10);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v18 = "-[WiFiUsageMonitor setControlCenterState:withKnownLocation:forInterface:]_block_invoke";
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setCellularDataStatus:(id)a3 inAirplaneMode:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  BOOL v12;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WiFiUsageMonitor_setCellularDataStatus_inAirplaneMode___block_invoke;
  block[3] = &unk_1E881CF48;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __57__WiFiUsageMonitor_setCellularDataStatus_inAirplaneMode___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  v3 = *(_QWORD *)(a1 + 40);
  if (!(_DWORD)result || *(unsigned __int8 *)(v3 + 25) != *(unsigned __int8 *)(a1 + 48))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(v3 + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "cellularDataStatusDidChange:inAirplaneMode:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 40), "setCurrentCellularStatus:", *(_QWORD *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "setAirplaneModeEnabled:", *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)setCellularFallbackState:(BOOL)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  BOOL v12;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WiFiUsageMonitor_setCellularFallbackState_forInterface___block_invoke;
  block[3] = &unk_1E881CF48;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __58__WiFiUsageMonitor_setCellularFallbackState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 26) != v3)
    {
      *(_BYTE *)(v2 + 26) = v3;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "cellularFallbackStateDidChange:", *(unsigned __int8 *)(a1 + 48));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

      v2 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v2 + 264))
      {
        objc_msgSend((id)v2, "pushRNFEventToHUD:", *(unsigned __int8 *)(a1 + 48));
        v2 = *(_QWORD *)(a1 + 40);
      }
    }
    if (*(_BYTE *)(v2 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("CellularFallbackState"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotification:", v10);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v18 = "-[WiFiUsageMonitor setCellularFallbackState:forInterface:]_block_invoke";
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setCellularOutrankingState:(BOOL)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  BOOL v12;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WiFiUsageMonitor_setCellularOutrankingState_forInterface___block_invoke;
  block[3] = &unk_1E881CF48;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __60__WiFiUsageMonitor_setCellularOutrankingState_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned __int8 *)(v2 + 27) != v3)
    {
      *(_BYTE *)(v2 + 27) = v3;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v13;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "cellularOutrankingStateDidChange:", *(unsigned __int8 *)(a1 + 48));
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v6);
      }

      v2 = *(_QWORD *)(a1 + 40);
    }
    if (*(_BYTE *)(v2 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("CellularOutrankingState"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotification:", v10);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v18 = "-[WiFiUsageMonitor setCellularOutrankingState:forInterface:]_block_invoke";
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)notifyNetworkQualityResults:(id)a3 forInterface:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WiFiUsageMonitor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_notifyNetworkQualityResults_forInterface___block_invoke;
  block[3] = &unk_1E881CF98;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __61__WiFiUsageMonitor_notifyNetworkQualityResults_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  WiFiUsageLQMWindowAnalysisNetworkQuality *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", *(_QWORD *)(a1 + 32), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("networkQualityResponsiveness"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setResponsivenessScore:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKey:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("NetworkQuality"), 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("networkQualityResponsiveness"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsageLQMTransformations getBinNetworkQualityResponsiveness:As:](WiFiUsageLQMTransformations, "getBinNetworkQualityResponsiveness:As:", objc_msgSend(v13, "unsignedLongValue"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v14, CFSTR("networkQualityResponsiveness"));

        v15 = *(_QWORD *)(a1 + 40);
        v16 = -[WiFiUsageLQMWindowAnalysisNetworkQuality initWithRollingWindow:AndDictionary:andContext:andTimestamp:onQueue:]([WiFiUsageLQMWindowAnalysisNetworkQuality alloc], "initWithRollingWindow:AndDictionary:andContext:andTimestamp:onQueue:", v11, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(v15 + 13) | ((unint64_t)*(unsigned __int8 *)(v15 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v15 + 16) << 16), v12, *(_QWORD *)(v15 + 144));
        objc_msgSend(*(id *)(a1 + 40), "startLQMAnalysis:", v16);

      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v24 = "-[WiFiUsageMonitor notifyNetworkQualityResults:forInterface:]_block_invoke";
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

+ (id)LQMAnalysisReasonForFault:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if (a3 - 1 <= 0x1A && ((0x707023Fu >> v3) & 1) != 0)
    v4 = *off_1E881D5C8[v3];
  else
    v4 = 0;
  return v4;
}

- (void)sendFaultToDB:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0DD9960], "sharedAnalyticsProcessor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processWAMessageMetric:data:", *MEMORY[0x1E0DD99B0], v4);

  }
}

- (void)addFaultEvent:(unint64_t)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WiFiUsageMonitor_addFaultEvent_forInterface___block_invoke;
  block[3] = &unk_1E881D218;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __47__WiFiUsageMonitor_addFaultEvent_forInterface___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  WiFiUsageLQMWindowAnalysis *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class())
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0DD9970]);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 320);
      *(_QWORD *)(v3 + 320) = v2;

    }
    v5 = (__CFString *)*(id *)(a1 + 40);
    v6 = *(void **)(a1 + 40);
    if (!v6 || !objc_msgSend(v6, "length"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(const __CFString **)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        v46 = "-[WiFiUsageMonitor addFaultEvent:forInterface:]_block_invoke";
        v47 = 2112;
        v48 = v7;
        v49 = 2048;
        v50 = v8;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Invalid interfaceName %@ reason %lu", buf, 0x20u);
      }

      v5 = CFSTR("UnkownInterface");
    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DD9990]);
      WiFiUsageFaultReasonStringMap(*(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        WiFiUsageFaultReasonStringMap(*(_QWORD *)(a1 + 48));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DD99A0]);

      }
      if (v5)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DD9998]);
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
      if (v13)
      {
        objc_msgSend(v13, "connectedBss");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "connectedBss");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bssid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "connectedBss");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "bssid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DD9988]);

          }
        }
      }
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 264);
      if (v20)
      {
        objc_msgSend(v20, "networkName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "networkName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DD99A8]);

        }
      }
      if (objc_msgSend(v9, "count"))
        objc_msgSend(*(id *)(a1 + 32), "sendFaultToDB:", v9);

    }
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "valueForKey:", *(_QWORD *)(a1 + 40), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v25 = v24;
  if (v24)
  {
    v26 = *(_QWORD *)v41;
    v27 = v24;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "faultEventDetected:", *(_QWORD *)(a1 + 48));
      }
      v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v27);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AddFaultEvent"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotification:", v30);

  }
  if (v25)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageMonitor LQMAnalysisReasonForFault:](WiFiUsageMonitor, "LQMAnalysisReasonForFault:", *(_QWORD *)(a1 + 48));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "canStartLQMAnalysisforTrigger:andReason:onWindow:", v32, 0, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 48) == 18)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
        {
          objc_msgSend(v34, "timeIntervalSinceDate:");
          if (v36 <= 60.0)
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v35);

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
              *(_DWORD *)buf = 136315650;
              v46 = "-[WiFiUsageMonitor addFaultEvent:forInterface:]_block_invoke";
              v47 = 2112;
              v48 = CFSTR("SlowWiFiDnsFailure");
              v49 = 2112;
              v50 = v37;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Not starting LQM window analysis triggered by %@. Last triggered: %@", buf, 0x20u);
            }
            v33 = 0;
          }
        }

      }
      if (v33)
      {
        v38 = *(_QWORD *)(a1 + 32);
        v39 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]([WiFiUsageLQMWindowAnalysis alloc], "initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:", v31, v32, *(unsigned __int8 *)(v38 + 13) | ((unint64_t)*(unsigned __int8 *)(v38 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v38 + 16) << 16), v33, *(_QWORD *)(v38 + 144));
        objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v39);

      }
    }

  }
}

- (void)linkTestEvent:(id)a3 withReason:(id)a4 forInterface:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__WiFiUsageMonitor_linkTestEvent_withReason_forInterface___block_invoke;
  v15[3] = &unk_1E881D240;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(internalQueue, v15);

}

void __58__WiFiUsageMonitor_linkTestEvent_withReason_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  WiFiUsageLQMWindowAnalysisLinkTest *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(*(id *)(a1 + 32), "canStartLQMAnalysisforTrigger:andReason:onWindow:", CFSTR("LinkTest"), *(_QWORD *)(a1 + 48), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = -[WiFiUsageLQMWindowAnalysisLinkTest initWithRollingWindow:andReason:withWFMeasureResults:andContext:andTimestamp:onQueue:]([WiFiUsageLQMWindowAnalysisLinkTest alloc], "initWithRollingWindow:andReason:withWFMeasureResults:andContext:andTimestamp:onQueue:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(v4 + 13) | ((unint64_t)*(unsigned __int8 *)(v4 + 15) << 8) | ((unint64_t)*(unsigned __int8 *)(v4 + 16) << 16), v3, *(_QWORD *)(v4 + 144));
      objc_msgSend(*(id *)(a1 + 32), "startLQMAnalysis:", v5);

    }
    v2 = v6;
  }

}

- (void)addTriggerDisconnectEvent:(id)a3 isAlerted:(BOOL)a4 isConfirmed:(BOOL)a5 isExecuted:(BOOL)a6
{
  id v10;
  NSObject *internalQueue;
  id v12;
  _QWORD block[4];
  id v14;
  WiFiUsageMonitor *v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WiFiUsageMonitor_addTriggerDisconnectEvent_isAlerted_isConfirmed_isExecuted___block_invoke;
  block[3] = &unk_1E881D268;
  v14 = v10;
  v15 = self;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v12 = v10;
  dispatch_async(internalQueue, block);

}

void __79__WiFiUsageMonitor_addTriggerDisconnectEvent_isAlerted_isConfirmed_isExecuted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "triggerDisconnectAlerted:confirmed:executed:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50));
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

    v7 = *(_BYTE **)(a1 + 40);
    if (*(_BYTE *)(a1 + 49) && !v7[30])
    {
      objc_msgSend(v7, "setLastTDEvalConfirmed:", 1);
      v7 = *(_BYTE **)(a1 + 40);
    }
    if (*(_BYTE *)(a1 + 50) && !v7[31])
    {
      v7[31] = 1;
      objc_msgSend(*(id *)(a1 + 40), "setLastTDEvalStartedBy:", 0);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TD evaluation complete: disconnected the link"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushTDEventToHUD:", v9);

      v7 = *(_BYTE **)(a1 + 40);
    }
    if (v7[33])
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AddTriggerDisconnectEvent"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotification:", v11);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[WiFiUsageMonitor addTriggerDisconnectEvent:isAlerted:isConfirmed:isExecuted:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_badRssiThreshold:(int64_t)a3 goodRssiThreshold:(int64_t)a4
{
  NSObject *internalQueue;
  _QWORD block[7];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WiFiUsageMonitor_setTdLogic_badRssiThreshold_goodRssiThreshold___block_invoke;
  block[3] = &unk_1E881D290;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(internalQueue, block);
}

void __66__WiFiUsageMonitor_setTdLogic_badRssiThreshold_goodRssiThreshold___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  if (*(_QWORD *)(v2 + 64) != v3 || *(_QWORD *)(v2 + 72) != a1[6])
  {
    *(_QWORD *)(v2 + 64) = v3;
    *(_QWORD *)(a1[4] + 72) = a1[6];
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1[4] + 104), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v16;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v16 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "tdLogic_badRssi:goodRSSI:", *(_QWORD *)(a1[4] + 64), *(_QWORD *)(a1[4] + 72));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

  }
}

- (void)setTdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)a4
{
  NSObject *internalQueue;
  _QWORD block[7];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WiFiUsageMonitor_setTdLogic_deferJoin_perBSSID___block_invoke;
  block[3] = &unk_1E881D290;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(internalQueue, block);
}

void __50__WiFiUsageMonitor_setTdLogic_deferJoin_perBSSID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "tdLogic_deferJoin:perBSSID:", a1[5], a1[6]);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)setTdLogic_alertedBy:(int)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  int v12;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WiFiUsageMonitor_setTdLogic_alertedBy_forInterface___block_invoke;
  block[3] = &unk_1E881C988;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __54__WiFiUsageMonitor_setTdLogic_alertedBy_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6++), "tdLogic_alertedBy:", *(unsigned int *)(a1 + 48));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v7 + 80))
    {
      *(_BYTE *)(v7 + 30) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 31) = 0;
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 304);
      *(_QWORD *)(v8 + 304) = 0;

      v10 = *(void **)(a1 + 40);
      +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", *(unsigned int *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLastTDEvalStartedBy:", v11);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[WiFiUsageMonitor setTdLogic_alertedBy:forInterface:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_decisionState:(id *)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  __int128 v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WiFiUsageMonitor *v12;
  __int128 v13;
  __int128 v14;

  v6 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__WiFiUsageMonitor_setTdLogic_decisionState_forInterface___block_invoke;
  v10[3] = &unk_1E881D178;
  v11 = v6;
  v12 = self;
  v8 = *(_OWORD *)&a3->var13;
  v13 = *(_OWORD *)&a3->var0;
  v14 = v8;
  v9 = v6;
  dispatch_async(internalQueue, v10);

}

void __58__WiFiUsageMonitor_setTdLogic_decisionState_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE buf[32];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v8 = *(_OWORD *)(a1 + 64);
          *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
          *(_OWORD *)&buf[16] = v8;
          objc_msgSend(v7, "tdLogic_decisionState:", buf);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v4);
    }

    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 30))
    {
      v9 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
      *(_OWORD *)&buf[16] = v9;
      +[WiFiUsageMonitor getTDConfirmedEventStringForDisplay:](WiFiUsageMonitor, "getTDConfirmedEventStringForDisplay:", buf);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if ((objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304)) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "setLastTDConfirmedDisplayStr:", v11);
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WiFiUsageMonitor setTdLogic_decisionState:forInterface:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_fastTdState:(id)a3 forInterface:(id)a4
{
  uint64_t v4;
  unint64_t var0;
  id v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WiFiUsageMonitor *v12;
  unint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  v7 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__WiFiUsageMonitor_setTdLogic_fastTdState_forInterface___block_invoke;
  v10[3] = &unk_1E881D060;
  v11 = v7;
  v12 = self;
  v13 = var0;
  v14 = v4;
  v9 = v7;
  dispatch_async(internalQueue, v10);

}

void __56__WiFiUsageMonitor_setTdLogic_fastTdState_forInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1[5] + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "tdLogic_fastTdState:", a1[6], a1[7]);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor setTdLogic_fastTdState:forInterface:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_execState:(id)a3 forInterface:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WiFiUsageMonitor *v12;
  uint64_t v13;
  int v14;
  char v15;

  v4 = *(_QWORD *)&a3.var8;
  v5 = *(_QWORD *)&a3.var0;
  v7 = a4;
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__WiFiUsageMonitor_setTdLogic_execState_forInterface___block_invoke;
  v10[3] = &unk_1E881D2B8;
  v11 = v7;
  v12 = self;
  v13 = v5;
  v14 = v4;
  v15 = BYTE4(v4);
  v9 = v7;
  dispatch_async(internalQueue, v10);

}

void __54__WiFiUsageMonitor_setTdLogic_execState_forInterface___block_invoke(uint64_t a1)
{
  unint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v1 = v1 & 0xFFFFFF0000000000 | *(unsigned int *)(a1 + 56) | ((unint64_t)*(unsigned __int8 *)(a1 + 60) << 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "tdLogic_execState:", *(_QWORD *)(a1 + 48), v1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[WiFiUsageMonitor setTdLogic_execState:forInterface:]_block_invoke";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6 forInterface:(id)a7
{
  id v12;
  NSObject *internalQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  WiFiUsageMonitor *v17;
  double v18;
  int64_t v19;
  double v20;
  int v21;

  v12 = a7;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__WiFiUsageMonitor_setTdLogic_end_evalTime_rssi_roamTime_forInterface___block_invoke;
  v15[3] = &unk_1E881D2E0;
  v16 = v12;
  v17 = self;
  v21 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v14 = v12;
  dispatch_async(internalQueue, v15);

}

void __71__WiFiUsageMonitor_setTdLogic_end_evalTime_rssi_roamTime_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6++), "tdLogic_end:evalTime:rssi:roamTime:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56), *(double *)(a1 + 48), *(double *)(a1 + 64));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    v7 = *(_QWORD **)(a1 + 40);
    if (v7[10])
    {
      objc_msgSend(v7, "setLastTDEvalStartedBy:", 0);
      +[WiFiUsageMonitor getTDEvalCompleteEventStringForDisplay:](WiFiUsageMonitor, "getTDEvalCompleteEventStringForDisplay:", *(unsigned int *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(*(id *)(a1 + 40), "setLastTDEvalStartedBy:", 0);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v16 = "-[WiFiUsageMonitor setTdLogic_end:evalTime:rssi:roamTime:forInterface:]_block_invoke";
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setTdLogic_waitForRoamTime:(double)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WiFiUsageMonitor *v11;
  double v12;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WiFiUsageMonitor_setTdLogic_waitForRoamTime_forInterface___block_invoke;
  block[3] = &unk_1E881D218;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __60__WiFiUsageMonitor_setTdLogic_waitForRoamTime_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "tdLogic_waitForRoamTime:", *(double *)(a1 + 48));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor setTdLogic_waitForRoamTime:forInterface:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)updateWithMLORuntimeConfig:(id *)a3 forInterface:(id)a4
{
  __int128 v4;
  NSObject *internalQueue;
  _QWORD block[5];
  __int128 v7;
  __int128 v8;

  block[1] = 3221225472;
  v4 = *(_OWORD *)&a3->var1[2];
  v7 = *(_OWORD *)&a3->var0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __60__WiFiUsageMonitor_updateWithMLORuntimeConfig_forInterface___block_invoke;
  block[3] = &unk_1E881D308;
  v8 = v4;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __60__WiFiUsageMonitor_updateWithMLORuntimeConfig_forInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[2];

  v2 = *(_QWORD *)(a1 + 40);
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", *(unsigned int *)(a1 + 52));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", *(unsigned int *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", *(unsigned int *)(a1 + 60));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (*(_BYTE *)(a1 + 64))
    v8 = CFSTR("trafficSwitchEnabled");
  else
    v8 = &stru_1E881F240;
  NSLog(CFSTR("%s numLinks:%lu %@%@%@preferred:%@ trafficSwitch:%@"), "-[WiFiUsageMonitor updateWithMLORuntimeConfig:forInterface:]_block_invoke", v2, v3, v4, v5, v6, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "connectedBss");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v10;
  objc_msgSend(v9, "updateMLORuntimeConfig:", v11);

}

- (BOOL)submitAnalytics:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  int v8;
  int v9;
  _BOOL4 v10;
  id v11;
  _BOOL4 xctest_disableSampling;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  id v17;
  int i;
  void *v19;
  void *v20;
  void *v21;
  char v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_xctest_disableSampling)
  {
    v6 = 1;
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v4, "sessionDuration");
  v6 = v7 >= 10.0 || objc_msgSend(v5, "type") == 4;
  if (self->_xctest_disableSampling)
    goto LABEL_7;
  v8 = objc_msgSend(v5, "canSubmitToCA");
LABEL_8:
  v9 = v8 & v6;
  v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    v23 = v9;
    if (v10)
    {
      objc_msgSend(v5, "sessionName");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      xctest_disableSampling = self->_xctest_disableSampling;
      if (self->_xctest_disableSampling)
      {
        v13 = CFSTR("xctest_disableSampling");
      }
      else
      {
        objc_msgSend(v5, "describeCAConfig");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 136315650;
      v26 = "-[WiFiUsageMonitor submitAnalytics:]";
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: submitting analytics for session type %@ (%@)", buf, 0x20u);
      if (!xctest_disableSampling)

    }
    objc_msgSend(v5, "recordCAsubmission");
    objc_msgSend(v5, "metricName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    AnalyticsSendEventLazy();

    for (i = 0; i != 3; ++i)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v17, "metricName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.durationByBand"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      AnalyticsSendEventLazy();

    }
    LOBYTE(v9) = v23;
  }
  else if (v10)
  {
    objc_msgSend(v5, "sessionName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "describeCAConfig");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "-[WiFiUsageMonitor submitAnalytics:]";
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: NOT submitting analytics for session type %@ (%@)", buf, 0x20u);

  }
  return v9;
}

id __36__WiFiUsageMonitor_submitAnalytics___block_invoke(uint64_t a1)
{
  void *v2;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "metricName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136315394;
    v5 = "-[WiFiUsageMonitor submitAnalytics:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: AnalyticsSendEventLazy callback for %@", (uint8_t *)&v4, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "sessionSummary:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __36__WiFiUsageMonitor_submitAnalytics___block_invoke_451(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionByBand:isFirst:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
}

- (id)summaryForInterface:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WiFiUsageMonitor_summaryForInterface___block_invoke;
    block[3] = &unk_1E881CF98;
    block[4] = self;
    v14 = v4;
    v7 = v5;
    v15 = v7;
    dispatch_sync(internalQueue, block);
    if (self->_xctest)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("summaryForInterface"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotification:", v9);

    }
    v10 = v15;
    v11 = v7;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WiFiUsageMonitor summaryForInterface:]";
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

void __40__WiFiUsageMonitor_summaryForInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "valueForKey:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1D17AC818]();
        if (objc_msgSend(v7, "isSessionActive"))
        {
          objc_msgSend(v7, "sessionSummary:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)a1[6];
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SessionName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setValue:forKey:", v9, v11);

        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)rangingSessionRequestedWithSelfPreferredChannel:(unint64_t)a3 selfMainChannel:(unint64_t)a4 selfChannelFlags:(unint64_t)a5 peerPreferredChannel:(unint64_t)a6 peerMainChannel:(unint64_t)a7 peerChannelFlags:(unint64_t)a8 requester:(id)a9
{
  id v16;
  WiFiUsageRangingSession *v17;

  v16 = a9;
  v17 = objc_alloc_init(WiFiUsageRangingSession);
  -[WiFiUsageRangingSession rangingSessionRequestedWithSelfPreferredChannel:selfMainChannel:selfChannelFlags:peerPreferredChannel:peerMainChannel:peerChannelFlags:requester:](v17, "rangingSessionRequestedWithSelfPreferredChannel:selfMainChannel:selfChannelFlags:peerPreferredChannel:peerMainChannel:peerChannelFlags:requester:", a3, a4, a5, a6, a7, a8, v16);

  -[WiFiUsageMonitor setRangingSession:](self, "setRangingSession:", v17);
}

- (void)rangingStartedWithNumMeasurements:(unint64_t)a3
{
  void *v5;
  WiFiUsageRangingSession *v6;
  id v7;

  -[WiFiUsageMonitor rangingSession](self, "rangingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(WiFiUsageRangingSession);
    -[WiFiUsageMonitor setRangingSession:](self, "setRangingSession:", v6);

  }
  -[WiFiUsageMonitor rangingSession](self, "rangingSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangingStartedWithNumMeasurements:", a3);

}

- (void)rangingCompletedWithValidCount:(unint64_t)a3 resultStatus:(int64_t)a4 resultFlags:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *internalQueue;
  _QWORD v19[9];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[WiFiUsageMonitor rangingSession](self, "rangingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WiFiUsageMonitor rangingSession](self, "rangingSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rangingCompletedWithValidCount:resultStatus:resultFlags:", a3, a4, a5);

    -[WiFiUsageMonitor rangingSession](self, "rangingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionSummary:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    -[WiFiUsageMonitor rangingSession](self, "rangingSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metricName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = MEMORY[0x1E0C809B0];
    if (v13 && v16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[WiFiUsageMonitor rangingCompletedWithValidCount:resultStatus:resultFlags:]";
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: submitting analytics for ranging session", buf, 0xCu);
      }
      v19[5] = v17;
      v19[6] = 3221225472;
      v19[7] = __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke;
      v19[8] = &unk_1E881CCB8;
      v20 = v13;
      AnalyticsSendEventLazy();

    }
    internalQueue = self->_internalQueue;
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke_2;
    v19[3] = &unk_1E881C8E8;
    v19[4] = self;
    dispatch_async(internalQueue, v19);

  }
}

id __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __76__WiFiUsageMonitor_rangingCompletedWithValidCount_resultStatus_resultFlags___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v13;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v13 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "rangingCompleted");
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v3);
  }

}

- (void)addRangingRttSampleWithRssi:(int64_t)a3 rtt:(int64_t)a4 snr:(unint64_t)a5 flags:(unint64_t)a6 channel:(unint64_t)a7 coreId:(unint64_t)a8 bitErrorRate:(unint64_t)a9 phyError:(unint64_t)a10 andPeerSnr:(unint64_t)a11 andPeerCoreId:(unint64_t)a12 andPeerBitErrorRate:(unint64_t)a13 andPeerPhyError:(unint64_t)a14
{
  void *v17;
  id v18;

  -[WiFiUsageMonitor rangingSession](self, "rangingSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[WiFiUsageMonitor rangingSession](self, "rangingSession");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addRangingRttSampleWithRssi:rtt:snr:flags:channel:coreId:bitErrorRate:phyError:andPeerSnr:andPeerCoreId:andPeerBitErrorRate:andPeerPhyError:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);

  }
}

- (id)lastRangingSessionMetric
{
  void *v2;
  void *v3;

  -[WiFiUsageMonitor rangingSession](self, "rangingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionSummary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lastBssSessionInfoForInterface:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMutableDictionary valueForKey:](self->_usageSessions, "valueForKey:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "type") == 4)
          {
            objc_msgSend(v10, "lastBssSessionInfo");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[WiFiUsageMonitor lastBssSessionInfoForInterface:]";
    v20 = 2112;
    v21 = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (void)enableXCTestNotifications
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (!self->_xctest)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__WiFiUsageMonitor_enableXCTestNotifications__block_invoke;
    block[3] = &unk_1E881C8E8;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
  self->_xctest = 1;
}

void __45__WiFiUsageMonitor_enableXCTestNotifications__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v13;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v13 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "enableXCTestNotifications");
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v3);
  }

}

- (void)enableSubmitAnalyticsNoSampling:(BOOL)a3
{
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_xctest_disableSampling = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    if (!self->_xctest_disableSampling)
      v4 = CFSTR("NO");
    v5 = 136315394;
    v6 = "-[WiFiUsageMonitor enableSubmitAnalyticsNoSampling:]";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - _xctest_disableSampling:%@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)canStartLQMAnalysisforTrigger:(id)a3 andReason:(id)a4 onWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WiFiUsageLQMRelatedTrigger *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WiFiUsageLQMRelatedTrigger initWithTrigger:andReason:andTimestamp:]([WiFiUsageLQMRelatedTrigger alloc], "initWithTrigger:andReason:andTimestamp:", v8, v9, v11);
  objc_msgSend(v10, "addTrigger:", v12);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_pendingLqmAnalysis;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17++), "updateWithSubsequentTrigger:", v12, (_QWORD)v23);
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v15);
  }

  v18 = -[NSMutableArray count](self->_pendingLqmAnalysis, "count");
  if (v18 >= +[WiFiUsageLQMWindowAnalysis maxConcurrentAnalysis](WiFiUsageLQMWindowAnalysis, "maxConcurrentAnalysis"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v20 = +[WiFiUsageLQMWindowAnalysis maxConcurrentAnalysis](WiFiUsageLQMWindowAnalysis, "maxConcurrentAnalysis");
      v21 = -[NSMutableArray count](self->_pendingLqmAnalysis, "count");
      *(_DWORD *)buf = 136315906;
      v28 = "-[WiFiUsageMonitor canStartLQMAnalysisforTrigger:andReason:onWindow:]";
      v29 = 2112;
      v30 = v9;
      v31 = 2048;
      v32 = v20;
      v33 = 1024;
      v34 = v21;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Cannot start WiFiUsageLQMWindowAnalysis for %@ (max number of concurrent analysis (%lu) reached: %u)", buf, 0x26u);
    }
    v19 = 0;
  }
  else
  {
    v19 = v11;
  }

  return v19;
}

- (void)startLQMAnalysis:(id)a3
{
  void *v4;
  int v5;
  NSDate *v6;
  NSDate *lastInCallAnalysis;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setCompletionHandler:", self->_lqmAnalysisCompletionHandler);
  if (v8)
  {
    if ((objc_msgSend(v8, "isDone") & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_pendingLqmAnalysis, "addObject:", v8);
      objc_msgSend(v8, "reason");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("InCall"));

      if (v5)
      {
        objc_msgSend(v8, "timestamp");
        v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastInCallAnalysis = self->_lastInCallAnalysis;
        self->_lastInCallAnalysis = v6;

      }
    }
  }

}

- (void)receiveKernelLQMRollingWindow:(id)a3 ForInterface:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315394;
    v15 = "-[WiFiUsageMonitor receiveKernelLQMRollingWindow:ForInterface:]";
    v16 = 2112;
    v17 = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s - Invalid interfaceName: %@";
    v11 = 22;
LABEL_8:
    _os_log_impl(&dword_1CC44E000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if (!+[WiFiUsageLQMWindowAnalysis isKernerlParsingEnabled](WiFiUsageLQMWindowAnalysis, "isKernerlParsingEnabled"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v15 = "-[WiFiUsageMonitor receiveKernelLQMRollingWindow:ForInterface:]";
    v9 = MEMORY[0x1E0C81028];
    v10 = "%s - kernel parsing not enabled";
    v11 = 12;
    goto LABEL_8;
  }
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__WiFiUsageMonitor_receiveKernelLQMRollingWindow_ForInterface___block_invoke;
  v12[3] = &unk_1E881C8C0;
  v12[4] = self;
  v13 = v6;
  dispatch_async(internalQueue, v12);

LABEL_9:
}

void __63__WiFiUsageMonitor_receiveKernelLQMRollingWindow_ForInterface___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "copy");
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v6, "windowBeforeTrigger");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lqmWindowsFeatures");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:](WiFiUsageLQMKernelRollingWindow, "kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:", v7, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLqmWindowsFeatures:", v10);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (void)receivedBssTransitionRequest:(id)a3 candidateListIncluded:(BOOL)a4 isAbridged:(BOOL)a5 disassociationImminent:(BOOL)a6 bssTerminationIncluded:(BOOL)a7 essDisassociationImminent:(BOOL)a8
{
  id v14;
  NSObject *internalQueue;
  id v16;
  _QWORD block[4];
  id v18;
  WiFiUsageMonitor *v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;

  v14 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __154__WiFiUsageMonitor_receivedBssTransitionRequest_candidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent___block_invoke;
  block[3] = &unk_1E881D100;
  v18 = v14;
  v19 = self;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v16 = v14;
  dispatch_async(internalQueue, block);

}

void __154__WiFiUsageMonitor_receivedBssTransitionRequest_candidateListIncluded_isAbridged_disassociationImminent_bssTerminationIncluded_essDisassociationImminent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "receivedBssTransitionRequestWithCandidateListIncluded:isAbridged:disassociationImminent:bssTerminationIncluded:essDisassociationImminent:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(unsigned __int8 *)(a1 + 51), *(unsigned __int8 *)(a1 + 52));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor receivedBssTransitionRequest:candidateListIncluded:isAbridged:disassociationImminent:bssTer"
          "minationIncluded:essDisassociationImminent:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)sentBssTransitionResponse:(id)a3 status:(int64_t)a4 terminationDelayRequested:(BOOL)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  WiFiUsageMonitor *v13;
  int64_t v14;
  BOOL v15;

  v8 = a3;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__WiFiUsageMonitor_sentBssTransitionResponse_status_terminationDelayRequested___block_invoke;
  v11[3] = &unk_1E881D358;
  v12 = v8;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v10 = v8;
  dispatch_async(internalQueue, v11);

}

void __79__WiFiUsageMonitor_sentBssTransitionResponse_status_terminationDelayRequested___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v12[128];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "valueForKey:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "sentBssTransitionResponseWithStatus:terminationDelayRequested:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[WiFiUsageMonitor sentBssTransitionResponse:status:terminationDelayRequested:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Invalid interfaceName: %@", buf, 0x16u);
  }
}

- (void)setDeviceInitializationFailureReason:(id)a3 timeSinceBoot:(double)a4
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = CFSTR("Success");
  if (a3)
    v6 = (__CFString *)a3;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("WiFiDeviceInitializationFailureReason"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("WiFiTimeSinceBoot"));

  v13 = v10;
  v12 = v10;
  AnalyticsSendEventLazy();

}

id __71__WiFiUsageMonitor_setDeviceInitializationFailureReason_timeSinceBoot___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  NSObject *internalQueue;
  _QWORD v7[5];
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;

  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__WiFiUsageMonitor_updateWowState_lpasState_lowPowerState_batterySaverState___block_invoke;
  v7[3] = &unk_1E881D380;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  dispatch_async(internalQueue, v7);
}

void __77__WiFiUsageMonitor_updateWowState_lpasState_lowPowerState_batterySaverState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateWowState:lpasState:lowPowerState:batterySaverState:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42), *(unsigned __int8 *)(a1 + 43));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6
{
  NSObject *internalQueue;
  _QWORD block[9];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__WiFiUsageMonitor_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration___block_invoke;
  block[3] = &unk_1E881D308;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  *(double *)&block[7] = a5;
  *(double *)&block[8] = a6;
  dispatch_async(internalQueue, block);
}

void __98__WiFiUsageMonitor_updateSleepPowerStats_unassociatedDuration_associatedDuration_roamingDuration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateSleepPowerStats:unassociatedDuration:associatedDuration:roamingDuration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

uint64_t __47__WiFiUsageMonitor_submitLqmToCA_forInterface___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "asDictionaryInto:", *(_QWORD *)(a1 + 40));
}

- (void)submitBootLatenciesToCA
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSNumber *bootToLastJoin;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSNumber *firstUnlockToLastJoin;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSNumber *bootToLastLinkUp;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSNumber *firstUnlockToLastLinkUp;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSNumber *lastJoinToLastLinkUp;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSNumber *bootToIPv4;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSNumber *firstUnlockToIPv4;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  NSNumber *lastJoinToIPv4;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  NSNumber *lastLinkUpToIPv4;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  NSNumber *bootToIPv6;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  NSNumber *firstUnlockToIPv6;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  NSNumber *lastJoinToIPv6;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  NSNumber *lastLinkUpToIPv6;
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  uint8_t buf[4];
  const char *v118;
  __int16 v119;
  uint64_t v120;
  _QWORD v121[3];
  _QWORD v122[6];

  v122[3] = *MEMORY[0x1E0C80C00];
  if (self->_numberOfJoins && !self->_detectedJoinAfterIPConfig)
  {
    if (self->_bootToLastJoin)
    {
      v121[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v3;
      v121[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_bootToLastJoin, "integerValue"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v122[1] = v4;
      v121[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v122[2] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "description");
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = objc_msgSend(v7, "UTF8String");
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToLastJoin: %s\n", buf, 0x16u);

      }
      bootToLastJoin = self->_bootToLastJoin;
      self->_bootToLastJoin = 0;

    }
    if (self->_firstUnlockToLastJoin)
    {
      v115[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v9;
      v115[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToLastJoin, "integerValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v10;
      v115[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "description");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v13, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v14;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToLastJoin: %s\n", buf, 0x16u);

      }
      firstUnlockToLastJoin = self->_firstUnlockToLastJoin;
      self->_firstUnlockToLastJoin = 0;

    }
    if (self->_bootToLastLinkUp)
    {
      v113[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = v16;
      v113[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_bootToLastLinkUp, "integerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v17;
      v113[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v114[2] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "description");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = objc_msgSend(v20, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v21;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToLastLinkUp: %s\n", buf, 0x16u);

      }
      bootToLastLinkUp = self->_bootToLastLinkUp;
      self->_bootToLastLinkUp = 0;

    }
    if (self->_firstUnlockToLastLinkUp)
    {
      v111[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v23;
      v111[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToLastLinkUp, "integerValue"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v112[1] = v24;
      v111[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v112[2] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v26, "description");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v28 = objc_msgSend(v27, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v28;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToLastLinkUp: %s\n", buf, 0x16u);

      }
      firstUnlockToLastLinkUp = self->_firstUnlockToLastLinkUp;
      self->_firstUnlockToLastLinkUp = 0;

    }
    if (self->_lastJoinToLastLinkUp)
    {
      v109[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v30;
      v109[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToLastLinkUp, "integerValue"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v31;
      v109[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v33, "description");
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = objc_msgSend(v34, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v35;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToLastLinkUp: %s\n", buf, 0x16u);

      }
      lastJoinToLastLinkUp = self->_lastJoinToLastLinkUp;
      self->_lastJoinToLastLinkUp = 0;

    }
    if (self->_bootToIPv4)
    {
      v107[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v37;
      v107[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_bootToIPv4, "integerValue"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v38;
      v107[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v108[2] = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v40, "description");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v41, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v42;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToIPv4: %s\n", buf, 0x16u);

      }
      bootToIPv4 = self->_bootToIPv4;
      self->_bootToIPv4 = 0;

    }
    if (self->_firstUnlockToIPv4)
    {
      v105[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v106[0] = v44;
      v105[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToIPv4, "integerValue"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v106[1] = v45;
      v105[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v106[2] = v46;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v47, "description");
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49 = objc_msgSend(v48, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v49;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToIPv4: %s\n", buf, 0x16u);

      }
      firstUnlockToIPv4 = self->_firstUnlockToIPv4;
      self->_firstUnlockToIPv4 = 0;

    }
    if (self->_lastJoinToIPv4)
    {
      v103[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = v51;
      v103[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToIPv4, "integerValue"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v52;
      v103[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v104[2] = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v54, "description");
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v56 = objc_msgSend(v55, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v56;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToIPv4: %s\n", buf, 0x16u);

      }
      lastJoinToIPv4 = self->_lastJoinToIPv4;
      self->_lastJoinToIPv4 = 0;

    }
    if (self->_lastLinkUpToIPv4)
    {
      v101[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v58;
      v101[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_lastLinkUpToIPv4, "integerValue"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v102[1] = v59;
      v101[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v102[2] = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v61, "description");
        v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v63 = objc_msgSend(v62, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v63;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_lastLinkUpToIPv4: %s\n", buf, 0x16u);

      }
      lastLinkUpToIPv4 = self->_lastLinkUpToIPv4;
      self->_lastLinkUpToIPv4 = 0;

    }
    if (self->_bootToIPv6)
    {
      v99[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 9);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v65;
      v99[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_bootToIPv6, "integerValue"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v100[1] = v66;
      v99[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v100[2] = v67;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v68, "description");
        v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v70 = objc_msgSend(v69, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v70;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_bootToIPv6: %s\n", buf, 0x16u);

      }
      bootToIPv6 = self->_bootToIPv6;
      self->_bootToIPv6 = 0;

    }
    if (self->_firstUnlockToIPv6)
    {
      v97[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 10);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = v72;
      v97[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_firstUnlockToIPv6, "integerValue"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v98[1] = v73;
      v97[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = v74;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v75, "description");
        v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v77 = objc_msgSend(v76, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v77;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_firstUnlockToIPv6: %s\n", buf, 0x16u);

      }
      firstUnlockToIPv6 = self->_firstUnlockToIPv6;
      self->_firstUnlockToIPv6 = 0;

    }
    if (self->_lastJoinToIPv6)
    {
      v95[0] = CFSTR("latencyType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 11);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v79;
      v95[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_lastJoinToIPv6, "integerValue"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v80;
      v95[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2] = v81;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v82, "description");
        v83 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v84 = objc_msgSend(v83, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v84;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_lastJoinToIPv6: %s\n", buf, 0x16u);

      }
      lastJoinToIPv6 = self->_lastJoinToIPv6;
      self->_lastJoinToIPv6 = 0;

    }
    if (self->_lastLinkUpToIPv6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 12, CFSTR("latencyType"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v86;
      v93[1] = CFSTR("latencyValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSNumber integerValue](self->_lastLinkUpToIPv6, "integerValue"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v87;
      v93[2] = CFSTR("numberOfJoinsAttempts");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfJoins);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      AnalyticsSendEvent();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v89, "description");
        v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v91 = objc_msgSend(v90, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v118 = "-[WiFiUsageMonitor submitBootLatenciesToCA]";
        v119 = 2080;
        v120 = v91;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: dict_lastLinkUpToIPv6: %s\n", buf, 0x16u);

      }
      lastLinkUpToIPv6 = self->_lastLinkUpToIPv6;
      self->_lastLinkUpToIPv6 = 0;

    }
  }
}

- (void)updateIsBSPActive:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__WiFiUsageMonitor_updateIsBSPActive___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __38__WiFiUsageMonitor_updateIsBSPActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsBSPActive:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 bspMaxConsecutiveFails:(unint64_t)a16 supportsLinkRecommendation:(BOOL)a17 forInterface:(id)a18
{
  id v24;
  NSObject *internalQueue;
  id v26;
  _QWORD block[5];
  id v29;
  unint64_t v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;

  v24 = a18;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __329__WiFiUsageMonitor_updateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_bspMaxConsecutiveFails_supportsLinkRecommendation_forInterface___block_invoke;
  block[3] = &unk_1E881D3D0;
  block[4] = self;
  v29 = v24;
  v37 = a3;
  v38 = a4;
  v30 = a5;
  v31 = a6;
  v39 = a7;
  v40 = a8;
  v32 = *(_OWORD *)&a9;
  v33 = *(_OWORD *)&a11;
  v34 = *(_OWORD *)&a13;
  v35 = a15;
  v36 = a16;
  v41 = a17;
  v26 = v24;
  dispatch_async(internalQueue, block);

}

void __329__WiFiUsageMonitor_updateWithBspOverflowed_IsBSPActive_BspTimeToTST_BspSampleDurationMS_IsScanActiveBSP_IsP2PActiveBSP_BspTriggerCount_BspMutePercentage_BspMaxMuteMS_BspAvgMuteMS_BspErrorPercentage_BspTimeOutPercentageOfTriggers_BspRejectOrFailPercentageOfTriggers_bspMaxConsecutiveFails_supportsLinkRecommendation_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "samples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "populateWithBspOverflowed:IsBSPActive:BspTimeToTST:BspSampleDurationMS:IsScanActiveBSP:IsP2PActiveBSP:BspTriggerCount:BspMutePercentage:BspMaxMuteMS:BspAvgMuteMS:BspErrorPercentage:BspTimeOutPercentageOfTriggers:BspRejectOrFailPercentageOfTriggers:BspMaxConsecutiveFails:", *(unsigned __int8 *)(a1 + 128), *(unsigned __int8 *)(a1 + 129), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 130), *(unsigned __int8 *)(a1 + 131), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
  if (objc_msgSend(*(id *)(a1 + 32), "isBSPActive"))
  {
    if (!*(_BYTE *)(a1 + 132)
      || (objc_msgSend(v5, "numberForKeyPath:", CFSTR("chanQualScore")),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "submitLqmToCA:forInterface:", v5, *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)notifyIPv4Changes:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WiFiUsageMonitor *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyIPv4Changes___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __38__WiFiUsageMonitor_notifyIPv4Changes___block_invoke(uint64_t a1)
{
  WiFiUsageNetworkIPv4Details *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  WiFiUsageNetworkIPv4Details *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = -[WiFiUsageNetworkIPv4Details initWithDictionary:]([WiFiUsageNetworkIPv4Details alloc], "initWithDictionary:", *(_QWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[WiFiUsageMonitor notifyIPv4Changes:]_block_invoke";
    v47 = 2112;
    v48 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - details: %@", buf, 0x16u);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13++), "processIPv4Changes:", v2);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  if (-[WiFiUsageNetworkIPv4Details isValid](v2, "isValid"))
  {
    v14 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v14 + 408) && *(_QWORD *)(v14 + 328) <= 0x64uLL)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 408);
      *(_QWORD *)(v16 + 408) = v15;

      v18 = (void *)MEMORY[0x1E0CB37E8];
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
      objc_msgSend(v18, "numberWithDouble:");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 416);
      *(_QWORD *)(v20 + 416) = v19;

      v22 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v22 + 344))
      {
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 40);
        v26 = *(void **)(v25 + 424);
        *(_QWORD *)(v25 + 424) = v24;

        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v22 + 352))
      {
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        objc_msgSend(v27, "numberWithDouble:");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(void **)(v29 + 432);
        *(_QWORD *)(v29 + 432) = v28;

        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v22 + 376))
      {
        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 408), "timeIntervalSinceDate:");
        objc_msgSend(v31, "numberWithDouble:");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 40);
        v34 = *(void **)(v33 + 440);
        *(_QWORD *)(v33 + 440) = v32;

        v22 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend((id)v22, "submitBootLatenciesToCA");
    }
  }

}

- (void)notifyIPv6Changes:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WiFiUsageMonitor *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyIPv6Changes___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __38__WiFiUsageMonitor_notifyIPv6Changes___block_invoke(uint64_t a1)
{
  WiFiUsageNetworkIPv6Details *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  WiFiUsageNetworkIPv6Details *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = -[WiFiUsageNetworkIPv6Details initWithDictionary:]([WiFiUsageNetworkIPv6Details alloc], "initWithDictionary:", *(_QWORD *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[WiFiUsageMonitor notifyIPv6Changes:]_block_invoke";
    v47 = 2112;
    v48 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - details: %@", buf, 0x16u);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13++), "processIPv6Changes:", v2);
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  if (-[WiFiUsageNetworkIPv6Details isValid](v2, "isValid"))
  {
    v14 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v14 + 448) && *(_QWORD *)(v14 + 328) <= 0x64uLL)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 448);
      *(_QWORD *)(v16 + 448) = v15;

      v18 = (void *)MEMORY[0x1E0CB37E8];
      +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
      objc_msgSend(v18, "numberWithDouble:");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 456);
      *(_QWORD *)(v20 + 456) = v19;

      v22 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v22 + 344))
      {
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        objc_msgSend(v23, "numberWithDouble:");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_QWORD *)(a1 + 40);
        v26 = *(void **)(v25 + 464);
        *(_QWORD *)(v25 + 464) = v24;

        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v22 + 352))
      {
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        objc_msgSend(v27, "numberWithDouble:");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(void **)(v29 + 472);
        *(_QWORD *)(v29 + 472) = v28;

        v22 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v22 + 376))
      {
        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(v22 + 448), "timeIntervalSinceDate:");
        objc_msgSend(v31, "numberWithDouble:");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 40);
        v34 = *(void **)(v33 + 480);
        *(_QWORD *)(v33 + 480) = v32;

        v22 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend((id)v22, "submitBootLatenciesToCA");
    }
  }

}

- (void)notifyDHCPChanges:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__WiFiUsageMonitor_notifyDHCPChanges___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __38__WiFiUsageMonitor_notifyDHCPChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v26 = "-[WiFiUsageMonitor notifyDHCPChanges:]_block_invoke";
    v27 = 1024;
    v28 = 3143;
    v29 = 2048;
    v30 = v2;
    v31 = 2112;
    v32 = v3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:%d, self[%p], dictionary: %@", buf, 0x26u);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "processDHCPChanges:", *(_QWORD *)(a1 + 40));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

}

- (void)notifyIpConfigurationStateWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6
{
  NSObject *internalQueue;
  _QWORD block[6];
  BOOL v8;
  BOOL v9;
  BOOL v10;

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__WiFiUsageMonitor_notifyIpConfigurationStateWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6___block_invoke;
  block[3] = &unk_1E881D3F8;
  block[4] = self;
  v8 = a3;
  *(double *)&block[5] = a4;
  v9 = a5;
  v10 = a6;
  dispatch_async(internalQueue, block);
}

void __107__WiFiUsageMonitor_notifyIpConfigurationStateWithMethod_dhcpLeaseDuration_hasRoutableIpV4_hasRoutableIpV6___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "ipConfigurationDidChangeWithMethod:dhcpLeaseDuration:hasRoutableIpV4:hasRoutableIpV6:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(double *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)notifyInterfaceRankingState:(BOOL)a3 forInterface:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WiFiUsageMonitor_notifyInterfaceRankingState_forInterface___block_invoke;
  block[3] = &unk_1E881CF48;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __61__WiFiUsageMonitor_notifyInterfaceRankingState_forInterface___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "interfaceRankingDidChange:", *(unsigned __int8 *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)notifyDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  id v17;
  id v18;
  NSObject *internalQueue;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v17 = a3;
  v18 = a11;
  internalQueue = self->_internalQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__WiFiUsageMonitor_notifyDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString___block_invoke;
  v22[3] = &unk_1E881D420;
  v22[4] = self;
  v23 = v17;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  v30 = a9;
  v31 = a10;
  v24 = v18;
  v25 = a4;
  v20 = v18;
  v21 = v17;
  dispatch_async(internalQueue, v22);

}

void __119__WiFiUsageMonitor_notifyDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "valueForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "processDriverAvailability:available:version:flags:eventID:reason:subReason:minorReason:reasonString:", a1[5], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[6]);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__WiFiUsageMonitor_updateWithCompatibilityMode___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __48__WiFiUsageMonitor_updateWithCompatibilityMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompatibilityModeEnabled:", *(_BYTE *)(a1 + 40) != 0);
}

- (void)updateCurrentNetworkDetails:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__WiFiUsageMonitor_updateCurrentNetworkDetails___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __48__WiFiUsageMonitor_updateCurrentNetworkDetails___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateAssociatedNetworkDetails:", *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)updateRealTimeCoex:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a5;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__WiFiUsageMonitor_updateRealTimeCoex_type_reasons___block_invoke;
  v11[3] = &unk_1E881D358;
  v14 = a3;
  v12 = v8;
  v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(internalQueue, v11);

}

void __52__WiFiUsageMonitor_updateRealTimeCoex_type_reasons___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setRealtimeCoexStarted:type:reasons:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)setAwdlSequence:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WiFiUsageMonitor *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__WiFiUsageMonitor_setAwdlSequence___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __36__WiFiUsageMonitor_setAwdlSequence___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v32;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 264), "isCurrentBssOnChannel:", v9);
        if ((objc_msgSend(v9, "is5GHz") & 1) != 0 || objc_msgSend(v9, "is6GHz"))
        {
          v7 = v7 + 1.0;
        }
        else if (objc_msgSend(v9, "is2_4GHz"))
        {
          v7 = v7 + 0.5;
        }
        v5 += v10;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
    v7 = 0.0;
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = v11;
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * k);
              objc_msgSend(v20, "setAwdlSequence:infraScore:p2pScore:", *(_QWORD *)(a1 + 32), v5, v7);
              objc_msgSend(v20, "setRealTimeCoexStatus:type:", v7 >= 16.0, 0);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          }
          while (v17);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v12);
  }

}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__WiFiUsageMonitor_updateLinkRecoveryDisabled___block_invoke;
  v4[3] = &unk_1E881C960;
  v4[4] = self;
  v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __47__WiFiUsageMonitor_updateLinkRecoveryDisabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateLinkRecoveryDisabled:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updateLinkTestInterval:(unint64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__WiFiUsageMonitor_updateLinkTestInterval___block_invoke;
  v4[3] = &unk_1E881D448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

void __43__WiFiUsageMonitor_updateLinkTestInterval___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateLinkTestInterval:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10
{
  id v16;
  id v17;
  NSObject *internalQueue;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  v16 = a6;
  v17 = a8;
  internalQueue = self->_internalQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __159__WiFiUsageMonitor_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates___block_invoke;
  v21[3] = &unk_1E881D470;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v21[4] = self;
  v22 = v16;
  v27 = a7;
  v23 = v17;
  v28 = a9;
  v29 = a10;
  v19 = v17;
  v20 = v16;
  dispatch_async(internalQueue, v21);

}

void __159__WiFiUsageMonitor_setSteeringRequest_preferredChannel_preferredBand_preferredSSID_targetSSIDDiffersFromCurrent_preferredBSS_ssidIsSplit_transitionCandidates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v6);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v15 != v11)
                objc_enumerationMutation(v8);
              LOWORD(v13) = *(_WORD *)(a1 + 77);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFromCurrent:preferredBSS:ssidIsSplit:transitionCandidates:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 76), *(_QWORD *)(a1 + 48), v13);
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

- (void)updateKnownNetworksSupportingSeamless:(id)a3 forBSS:(id)a4 andSSID:(id)a5 beaconCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  WiFiUsageMonitor *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke;
  block[3] = &unk_1E881D038;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  v23 = v10;
  v24 = self;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  dispatch_async(internalQueue, block);

}

void __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  void *v62;
  uint64_t v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t n;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t ii;
  void *v101;
  unint64_t v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  _BOOL4 v110;
  uint64_t v111;
  id obj;
  id obja;
  void *v114;
  uint64_t v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  _BOOL4 v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  uint64_t v138;
  id (*v139)(uint64_t);
  void *v140;
  void *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint8_t v167[128];
  uint8_t buf[4];
  const char *v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  void *v173;
  __int16 v174;
  void *v175;
  _BYTE v176[128];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v127 = (void *)objc_opt_new();
  v114 = (void *)objc_opt_new();
  v106 = (void *)objc_opt_new();
  v108 = (id)objc_opt_new();
  v110 = +[WiFiUsagePrivacyFilter isLocallyAdministeredBitSetInBSSData:](WiFiUsagePrivacyFilter, "isLocallyAdministeredBitSetInBSSData:", *(_QWORD *)(a1 + 32));
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v115 = a1;
  obj = *(id *)(a1 + 40);
  v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
  if (v118)
  {
    v128 = 0;
    v116 = *(id *)v159;
    v102 = -1;
    v104 = -1;
    do
    {
      for (i = 0; i != v118; ++i)
      {
        if (*(id *)v159 != v116)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", CFSTR("BSSID"));
        v125 = objc_claimAutoreleasedReturnValue();
        +[WiFiUsagePrivacyFilter macAddressData:](WiFiUsagePrivacyFilter, "macAddressData:");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = +[WiFiUsagePrivacyFilter isLocallyAdministeredBitSetInBSSData:](WiFiUsagePrivacyFilter, "isLocallyAdministeredBitSetInBSSData:", v4);
        objc_msgSend(v3, "objectForKey:", CFSTR("SSID"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)v4;
        v120 = v5;
        if (v6)
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
        else
          v7 = 0;
        objc_msgSend(v3, "objectForKey:", CFSTR("CHANNEL"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        objc_msgSend(v3, "objectForKey:", CFSTR("CHANNEL_FLAGS"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");
        objc_msgSend(v3, "objectForKey:", CFSTR("RSSI"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)v125;
        +[WiFiUsageBssDetails bssWithIdentifier:channel:channelFlags:rssi:](WiFiUsageBssDetails, "bssWithIdentifier:channel:channelFlags:rssi:", v125, v9, v11, objc_msgSend(v12, "integerValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v114, "addObject:", v14);
        if (v6
          && objc_msgSend(v6, "length")
          && (objc_msgSend(v123, "isEqualToData:", *(_QWORD *)(v115 + 32)) & 1) == 0
          && ((v110 ^ v120) & 1) == 0)
        {
          if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(v115 + 48)))
          {
            ++v128;
          }
          else
          {
            objc_msgSend(v127, "addObject:", v6);
            +[DataComparisonByBytes dataComparisonByBytesWithData1:data2:reference:](DataComparisonByBytes, "dataComparisonByBytesWithData1:data2:reference:", v123, *(_QWORD *)(v115 + 32), v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[ObjectComparisonByTokens addComparison:to:ifMinOverlap:](ObjectComparisonByTokens, "addComparison:to:ifMinOverlap:", v15, v106, 4)&& objc_msgSend(v15, "distance") < v104)
            {
              v104 = objc_msgSend(v15, "distance");
            }
            +[StringComparisonByChars stringComparisonByCharsWithString1:string2:reference:](StringComparisonByChars, "stringComparisonByCharsWithString1:string2:reference:", v7, *(_QWORD *)(v115 + 48), v6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[ObjectComparisonByTokens addComparison:to:ifMinOverlap:](ObjectComparisonByTokens, "addComparison:to:ifMinOverlap:", v16, v108, (unint64_t)objc_msgSend(*(id *)(v115 + 48), "length") >> 1)&& objc_msgSend(v16, "diffTokensCount") != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(v16, "diffTokensCount") < v102)
            {
              v102 = objc_msgSend(v16, "diffTokensCount");
            }

          }
          v13 = (void *)v125;
        }

      }
      v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v176, 16);
    }
    while (v118);
  }
  else
  {
    v128 = 0;
    v102 = -1;
    v104 = -1;
  }

  v17 = v115;
  objc_msgSend(*(id *)(v115 + 56), "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "intersectSet:", v18);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(v115 + 48), "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315907;
    v169 = "-[WiFiUsageMonitor updateKnownNetworksSupportingSeamless:forBSS:andSSID:beaconCache:]_block_invoke";
    v170 = 2160;
    v171 = 1752392040;
    v172 = 2112;
    v173 = v19;
    v174 = 2113;
    v175 = v127;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s -  SSIDTransitionCandidates(excluding %{mask.hash}@):%{private}@\n", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("distance == %lu"), v104);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "filterUsingPredicate:", v20);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("diffTokensCount == %lu"), v102);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "filterUsingPredicate:", v21);

  v22 = (void *)objc_opt_new();
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v23 = v106;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v155;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v155 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
        objc_msgSend(v28, "reference");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v31 = (void *)objc_opt_new();
          objc_msgSend(v28, "reference");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, v32);

        }
        objc_msgSend(v28, "reference");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
    }
    while (v25);
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v117 = v108;
  v35 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v151;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v151 != v37)
          objc_enumerationMutation(v117);
        v39 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
        objc_msgSend(v39, "reference");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
          v42 = (void *)objc_opt_new();
          objc_msgSend(v39, "reference");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v42, v43);

        }
        objc_msgSend(v39, "reference");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v39);

      }
      v36 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
    }
    while (v36);
  }
  v105 = v23;

  objc_msgSend(v22, "keysOfEntriesPassingTest:", &__block_literal_global_494);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "allObjects");
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0C99D80];
  v49 = (void *)objc_opt_new();
  v107 = v22;
  objc_msgSend(v22, "objectsForKeys:notFoundMarker:", v47, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = (void *)v47;
  objc_msgSend(v48, "dictionaryWithObjects:forKeys:", v50, v47);
  v51 = objc_claimAutoreleasedReturnValue();

  v126 = (void *)v51;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s -  Top Potential Candidates And Votes:%@\n"), "-[WiFiUsageMonitor updateKnownNetworksSupportingSeamless:forBSS:andSSID:beaconCache:]_block_invoke_2", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v52), "UTF8String"));
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v54 = objc_msgSend(v53, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v169 = (const char *)v54;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v103 = v46;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v46);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "minusSet:", v127);
  v55 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(v115 + 64), "updateBssPerChannelWith:into:and:withChannelInfoList:", v114, v55, 0, *(_QWORD *)(*(_QWORD *)(v115 + 64) + 248));
  objc_msgSend(v55, "keysOfEntriesPassingTest:", &__block_literal_global_502);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");

  objc_msgSend(v55, "keysOfEntriesPassingTest:", &__block_literal_global_503);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  v60 = 1;
  if (v57)
    v60 = 2;
  if (v59)
    v61 = v60;
  else
    v61 = v57 != 0;
  objc_msgSend(v55, "keysOfEntriesPassingTest:", &__block_literal_global_504);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63)
    v64 = v61 + 1;
  else
    v64 = v61;
  if (+[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 2))
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    objc_msgSend(v126, "allKeys");
    v109 = (id)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
    if (obja)
    {
      v111 = *(_QWORD *)v147;
      do
      {
        v65 = 0;
        do
        {
          if (*(_QWORD *)v147 != v111)
            objc_enumerationMutation(v109);
          v119 = v65;
          v66 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * v65);
          v67 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v128);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, CFSTR("roamCandidatesInScan"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v127, "count"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v69, CFSTR("knownCandidatesInScan"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v126, "count"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v70, CFSTR("potentialCandidatesInScan"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v127, "containsObject:", v66));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v71, CFSTR("potentialCandidateIsKnown"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v64);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v72, CFSTR("uniqueBandsInScan"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v55, "count"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v73, CFSTR("uniqueChannelsInScan"));

          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          objc_msgSend(v126, "objectForKeyedSubscript:", v66);
          v121 = (id)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v142, v164, 16);
          if (v74)
          {
            v75 = v74;
            v76 = *(_QWORD *)v143;
            do
            {
              for (m = 0; m != v75; ++m)
              {
                if (*(_QWORD *)v143 != v76)
                  objc_enumerationMutation(v121);
                v78 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * m);
                if (objc_msgSend(v78, "isMemberOfClass:", objc_opt_class()))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "sameTokensCount"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v79, CFSTR("SSID_overlap"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "diffTokensCount"));
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v80, CFSTR("SSID_diff"));

                  v81 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v78, "obj1");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "numberWithInteger:", objc_msgSend(v82, "length"));
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v83, CFSTR("SSID1_length"));

                  v84 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v78, "obj2");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "numberWithInteger:", objc_msgSend(v85, "length"));
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v86, CFSTR("SSID2_length"));

                }
                if (objc_msgSend(v78, "isMemberOfClass:", objc_opt_class()))
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "sameTokensCount"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v87, CFSTR("BSSID_overlap"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "diffTokensCount"));
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v88, CFSTR("BSSID_diff"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v78, "distance"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", v89, CFSTR("BSSID_distance"));

                }
              }
              v75 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v142, v164, 16);
            }
            while (v75);
          }

          v137 = MEMORY[0x1E0C809B0];
          v138 = 3221225472;
          v139 = __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_4;
          v140 = &unk_1E881CCB8;
          v141 = v67;
          v90 = v67;
          AnalyticsSendEventLazy();

          v65 = v119 + 1;
        }
        while ((id)(v119 + 1) != obja);
        obja = (id)objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
      }
      while (obja);
    }

    v17 = v115;
  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v17 + 64) + 104), "allValues");
  v122 = (id)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v133, v163, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v134;
    do
    {
      for (n = 0; n != v92; ++n)
      {
        if (*(_QWORD *)v134 != v93)
          objc_enumerationMutation(v122);
        v95 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * n);
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v96 = v95;
        v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v129, v162, 16);
        if (v97)
        {
          v98 = v97;
          v99 = *(_QWORD *)v130;
          do
          {
            for (ii = 0; ii != v98; ++ii)
            {
              if (*(_QWORD *)v130 != v99)
                objc_enumerationMutation(v96);
              objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * ii), "setSSIDTransitionCandidates:SSIDTransitionPotentialCandidates:potentialCandidatesMinusCandidates:roamCandidates:uniqueChannels:uniqueBands:", v127, v126, v124, v128, objc_msgSend(v55, "count"), v64);
            }
            v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v129, v162, 16);
          }
          while (v98);
        }

      }
      v92 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v133, v163, 16);
    }
    while (v92);
  }

}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_492(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "count") == 2;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_500(uint64_t a1, void *a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  if (objc_msgSend(a2, "band"))
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = objc_msgSend(a2, "band") == 1 && objc_msgSend(v4, "count") != 0;

  return v5;
}

BOOL __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = objc_msgSend(a2, "band") == 2 && objc_msgSend(v4, "count") != 0;

  return v5;
}

id __85__WiFiUsageMonitor_updateKnownNetworksSupportingSeamless_forBSS_andSSID_beaconCache___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateScanForwardStats:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__WiFiUsageMonitor_updateScanForwardStats___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __43__WiFiUsageMonitor_updateScanForwardStats___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateScanForwardStats:", *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

}

- (void)setUsbStatus:(BOOL)a3 currentDevices:(id)a4 currentNoiseDelta:(int64_t)a5
{
  id v8;
  NSObject *internalQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__WiFiUsageMonitor_setUsbStatus_currentDevices_currentNoiseDelta___block_invoke;
  v11[3] = &unk_1E881D358;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a5;
  v10 = v8;
  dispatch_async(internalQueue, v11);

}

void __66__WiFiUsageMonitor_setUsbStatus_currentDevices_currentNoiseDelta___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = objc_msgSend(*(id *)(a1 + 40), "count") != 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(a1 + 40));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateUsbStatus:currentDevices:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = *(_QWORD *)(a1 + 48);
}

- (void)pushTDEventToHUD:(id)a3
{
  WiFiSoftError *tdSoftError;
  id v4;

  if (a3)
  {
    tdSoftError = self->_tdSoftError;
    if (tdSoftError)
      v4 = -[WiFiSoftError updateHUDWithMessage:](tdSoftError, "updateHUDWithMessage:");
  }
}

- (void)pushRNFEventToHUD:(BOOL)a3
{
  const __CFString *v4;
  id v5;
  id v6;

  if (self->_rnfSoftError)
  {
    if (a3)
      v4 = CFSTR("Wi-Fi Assist: cellular fallback is active");
    else
      v4 = CFSTR("Wi-Fi Assist: cellular fallback is inactive");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[WiFiSoftError updateHUDWithMessage:](self->_rnfSoftError, "updateHUDWithMessage:", v6);

  }
}

+ (id)getTDConfirmedEventStringForDisplay:(id *)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = &stru_1E881F240;
  if (a3->var0)
    v4 = CFSTR("Tx PER");
  else
    v4 = &stru_1E881F240;
  v5 = CFSTR("Beacon PER");
  if (!a3->var1)
    v5 = &stru_1E881F240;
  if (a3->var2)
    v6 = CFSTR("FW Tx PER");
  else
    v6 = &stru_1E881F240;
  if (a3->var3)
    v7 = CFSTR("Gateway ARP Failures");
  else
    v7 = &stru_1E881F240;
  if (a3->var4)
    v3 = CFSTR("Symptoms DNS Errors");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), v4, v5, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("TD evaluation in progress: high %@ detected"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)getTDEvalCompleteEventStringForDisplay:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = CFSTR("Roamed");
  v4 = CFSTR("Unknown");
  if (a3 == 13)
    v4 = CFSTR("Link down");
  if (a3 != 14)
    v3 = v4;
  if (a3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("RSSI improved");
  v6 = (void *)-[__CFString length](v5, "length");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("TD evaluation complete: outcome %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)resetDeviceSessionforInterface:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__WiFiUsageMonitor_resetDeviceSessionforInterface___block_invoke;
    v7[3] = &unk_1E881C8C0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(internalQueue, v7);

  }
}

void __51__WiFiUsageMonitor_resetDeviceSessionforInterface___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v6, "type") == 1)
        {
          objc_msgSend(v6, "sessionDidStart");
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)faultReasonCount:(unint64_t)a3 forInterface:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v7 = 0;
  if (v6 && a3 - 34 >= 0xFFFFFFFFFFFFFFDFLL)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    v19 = (id)objc_opt_new();
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__WiFiUsageMonitor_faultReasonCount_forInterface___block_invoke;
    v10[3] = &unk_1E881D558;
    v10[4] = self;
    v11 = v6;
    v12 = &v14;
    v13 = a3;
    dispatch_sync(internalQueue, v10);
    v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

void __50__WiFiUsageMonitor_faultReasonCount_forInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "faultReasonCount:", a1[7]));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sessionName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (id)getProperty:(id)a3 forAllSessionsOfInterface:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__1;
    v19 = __Block_byref_object_dispose__1;
    v20 = (id)objc_opt_new();
    internalQueue = self->_internalQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__WiFiUsageMonitor_getProperty_forAllSessionsOfInterface___block_invoke;
    v11[3] = &unk_1E881D580;
    v11[4] = self;
    v12 = v7;
    v14 = &v15;
    v13 = v6;
    dispatch_sync(internalQueue, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __58__WiFiUsageMonitor_getProperty_forAllSessionsOfInterface___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "isSessionActive"))
        {
          v7 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
          objc_msgSend(v6, "valueForKey:", a1[6]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sessionName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v8, v9);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)getMobileAssets
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__WiFiUsageMonitor_getMobileAssets__block_invoke;
  v2[3] = &unk_1E881D5A8;
  v2[4] = self;
  +[WCAFetchWiFiBehaviorParameters fetchWiFiBehaviorWithCompletion:](WCAFetchWiFiBehaviorParameters, "fetchWiFiBehaviorWithCompletion:", v2);
}

void __35__WiFiUsageMonitor_getMobileAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  NSLog(CFSTR("%s: received WCAFetchWiFiBehaviorParameters: %@"), "-[WiFiUsageMonitor getMobileAssets]_block_invoke", v3);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WiFiUsageMonitor_getMobileAssets__block_invoke_2;
  block[3] = &unk_1E881C8E8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __35__WiFiUsageMonitor_getMobileAssets__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "datapathTelemetry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "datapathTelemetry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageLQMConfiguration setConfig:](WiFiUsageLQMConfiguration, "setConfig:", v3);

  }
  else
  {
    NSLog(CFSTR("%s: %@ key not found in Mobile Assets"), "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", CFSTR("DataPathTelemetry"));
  }
  objc_msgSend(*(id *)(a1 + 32), "apProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "apProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfileConfiguration setConfig:](WiFiUsageAccessPointProfileConfiguration, "setConfig:", v5);

  }
  else
  {
    NSLog(CFSTR("%s: %@ key not found in Mobile Assets"), "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", CFSTR("AccessPointProfile"));
  }
  objc_msgSend(*(id *)(a1 + 32), "beaconParsing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "beaconParsing");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageBeaconParsingConfiguration setConfig:](WiFiUsageBeaconParsingConfiguration, "setConfig:", v7);

  }
  else
  {
    NSLog(CFSTR("%s: %@ key not found in Mobile Assets"), "-[WiFiUsageMonitor getMobileAssets]_block_invoke_2", CFSTR("BeaconParsing"));
  }
}

- (NSDate)processInitTime
{
  return self->_processInitTime;
}

- (void)setProcessInitTime:(id)a3
{
  objc_storeStrong((id *)&self->_processInitTime, a3);
}

- (BOOL)isSystemAwake
{
  return self->_isSystemAwake;
}

- (void)setIsSystemAwake:(BOOL)a3
{
  self->_isSystemAwake = a3;
}

- (BOOL)deviceLocked
{
  return self->_deviceLocked;
}

- (void)setDeviceLocked:(BOOL)a3
{
  self->_deviceLocked = a3;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (BOOL)deviceCharging
{
  return self->_deviceCharging;
}

- (void)setDeviceCharging:(BOOL)a3
{
  self->_deviceCharging = a3;
}

- (BOOL)companionConnected
{
  return self->_companionConnected;
}

- (void)setCompanionConnected:(BOOL)a3
{
  self->_companionConnected = a3;
}

- (NSString)motionState
{
  return self->_motionState;
}

- (BOOL)inActiveCall
{
  return self->_inActiveCall;
}

- (void)setInActiveCall:(BOOL)a3
{
  self->_inActiveCall = a3;
}

- (BOOL)inMediaPlayback
{
  return self->_inMediaPlayback;
}

- (void)setInMediaPlayback:(BOOL)a3
{
  self->_inMediaPlayback = a3;
}

- (unint64_t)hidCount
{
  return self->_hidCount;
}

- (void)setHidCount:(unint64_t)a3
{
  self->_hidCount = a3;
}

- (BOOL)inActiveA2dp
{
  return self->_inActiveA2dp;
}

- (void)setInActiveA2dp:(BOOL)a3
{
  self->_inActiveA2dp = a3;
}

- (BOOL)inActiveSco
{
  return self->_inActiveSco;
}

- (void)setInActiveSco:(BOOL)a3
{
  self->_inActiveSco = a3;
}

- (BOOL)inActiveUniAoS
{
  return self->_inActiveUniAoS;
}

- (void)setInActiveUniAoS:(BOOL)a3
{
  self->_inActiveUniAoS = a3;
}

- (BOOL)inActiveBiAoS
{
  return self->_inActiveBiAoS;
}

- (void)setInActiveBiAoS:(BOOL)a3
{
  self->_inActiveBiAoS = a3;
}

- (BOOL)curBTAudioBand
{
  return self->_curBTAudioBand;
}

- (void)setCurBTAudioBand:(BOOL)a3
{
  self->_curBTAudioBand = a3;
}

- (BOOL)inActiveAwdl
{
  return self->_inActiveAwdl;
}

- (void)setInActiveAwdl:(BOOL)a3
{
  self->_inActiveAwdl = a3;
}

- (BOOL)inActiveRoam
{
  return self->_inActiveRoam;
}

- (void)setInActiveRoam:(BOOL)a3
{
  self->_inActiveRoam = a3;
}

- (BOOL)inActiveScan
{
  return self->_inActiveScan;
}

- (void)setInActiveScan:(BOOL)a3
{
  self->_inActiveScan = a3;
}

- (BOOL)poweredOn
{
  return self->_poweredOn;
}

- (void)setPoweredOn:(BOOL)a3
{
  self->_poweredOn = a3;
}

- (BOOL)controlCenterEnabled
{
  return self->_controlCenterEnabled;
}

- (void)setControlCenterEnabled:(BOOL)a3
{
  self->_controlCenterEnabled = a3;
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (BOOL)cellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (BOOL)cellularOutrankingEnabled
{
  return self->_cellularOutrankingEnabled;
}

- (void)setCellularOutrankingEnabled:(BOOL)a3
{
  self->_cellularOutrankingEnabled = a3;
}

- (BOOL)compatibilityModeEnabled
{
  return self->_compatibilityModeEnabled;
}

- (void)setIsBSPActive:(BOOL)a3
{
  self->_isBSPActive = a3;
}

- (int64_t)tdLogic_badRssiThreshold
{
  return self->_tdLogic_badRssiThreshold;
}

- (void)setTdLogic_badRssiThreshold:(int64_t)a3
{
  self->_tdLogic_badRssiThreshold = a3;
}

- (int64_t)tdLogic_goodRssiThreshold
{
  return self->_tdLogic_goodRssiThreshold;
}

- (void)setTdLogic_goodRssiThreshold:(int64_t)a3
{
  self->_tdLogic_goodRssiThreshold = a3;
}

- (BOOL)lastTDEvalConfirmed
{
  return self->_lastTDEvalConfirmed;
}

- (void)setLastTDEvalConfirmed:(BOOL)a3
{
  self->_lastTDEvalConfirmed = a3;
}

- (BOOL)lastTDEvalExecuted
{
  return self->_lastTDEvalExecuted;
}

- (void)setLastTDEvalExecuted:(BOOL)a3
{
  self->_lastTDEvalExecuted = a3;
}

- (NSString)lastTDEvalStartedBy
{
  return self->_lastTDEvalStartedBy;
}

- (void)setLastTDEvalStartedBy:(id)a3
{
  objc_storeStrong((id *)&self->_lastTDEvalStartedBy, a3);
}

- (NSString)secondaryInterfaceName
{
  return self->_secondaryInterfaceName;
}

- (NSString)currentCellularStatus
{
  return self->_currentCellularStatus;
}

- (void)setCurrentCellularStatus:(id)a3
{
  objc_storeStrong((id *)&self->_currentCellularStatus, a3);
}

- (NSMutableDictionary)usageSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUsageSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)linkSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLinkSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)interfaceLqmWindows
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInterfaceLqmWindows:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)lastLQMAnalysisForSlowWiFiDNSFailureTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastLQMAnalysisForSlowWiFiDNSFailureTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableDictionary)interfacesCapabilities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInterfacesCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (BOOL)privacyRestrictionDisabled
{
  return self->_privacyRestrictionDisabled;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)faultEventHandler
{
  return self->_faultEventHandler;
}

- (void)completionContext
{
  return self->_completionContext;
}

- (void)setCompletionContext:(void *)a3
{
  self->_completionContext = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (WiFiUsageInterfaceStats)ifStatsAtLastLqmUpdate
{
  return (WiFiUsageInterfaceStats *)objc_getProperty(self, a2, 184, 1);
}

- (void)setIfStatsAtLastLqmUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (WiFiUsageInterfaceStats)secondaryIfStatsAtLastLqmUpdate
{
  return (WiFiUsageInterfaceStats *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSecondaryIfStatsAtLastLqmUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (WiFiUsageRangingSession)rangingSession
{
  return (WiFiUsageRangingSession *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRangingSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (BOOL)xctest
{
  return self->_xctest;
}

- (void)setXctest:(BOOL)a3
{
  self->_xctest = a3;
}

- (BOOL)xctest_disableSampling
{
  return self->_xctest_disableSampling;
}

- (void)setXctest_disableSampling:(BOOL)a3
{
  self->_xctest_disableSampling = a3;
}

- (NSMutableArray)pendingLqmAnalysis
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPendingLqmAnalysis:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (id)lqmAnalysisCompletionHandler
{
  return self->_lqmAnalysisCompletionHandler;
}

- (void)setLqmAnalysisCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSDate)lastCallStarted
{
  return self->_lastCallStarted;
}

- (void)setLastCallStarted:(id)a3
{
  objc_storeStrong((id *)&self->_lastCallStarted, a3);
}

- (NSDate)lastInCallAnalysis
{
  return self->_lastInCallAnalysis;
}

- (void)setLastInCallAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_lastInCallAnalysis, a3);
}

- (NSDictionary)lastScanData
{
  return self->_lastScanData;
}

- (void)setLastScanData:(id)a3
{
  objc_storeStrong((id *)&self->_lastScanData, a3);
}

- (NSArray)lastChannelInfoList
{
  return self->_lastChannelInfoList;
}

- (void)setLastChannelInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_lastChannelInfoList, a3);
}

- (NSDictionary)lastScanRequest
{
  return self->_lastScanRequest;
}

- (void)setLastScanRequest:(id)a3
{
  objc_storeStrong((id *)&self->_lastScanRequest, a3);
}

- (WiFiUsageNetworkDetails)currentNetworkDetails
{
  return self->_currentNetworkDetails;
}

- (void)setCurrentNetworkDetails:(id)a3
{
  objc_storeStrong((id *)&self->_currentNetworkDetails, a3);
}

- (BOOL)isAnyUsbInserted
{
  return self->_isAnyUsbInserted;
}

- (void)setIsAnyUsbInserted:(BOOL)a3
{
  self->_isAnyUsbInserted = a3;
}

- (NSArray)usbDevices
{
  return self->_usbDevices;
}

- (void)setUsbDevices:(id)a3
{
  objc_storeStrong((id *)&self->_usbDevices, a3);
}

- (int64_t)noiseDeltaUponUSBInsertion
{
  return self->_noiseDeltaUponUSBInsertion;
}

- (void)setNoiseDeltaUponUSBInsertion:(int64_t)a3
{
  self->_noiseDeltaUponUSBInsertion = a3;
}

- (WiFiSoftError)tdSoftError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTdSoftError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (WiFiSoftError)rnfSoftError
{
  return (WiFiSoftError *)objc_getProperty(self, a2, 296, 1);
}

- (void)setRnfSoftError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSString)lastTDConfirmedDisplayStr
{
  return self->_lastTDConfirmedDisplayStr;
}

- (void)setLastTDConfirmedDisplayStr:(id)a3
{
  objc_storeStrong((id *)&self->_lastTDConfirmedDisplayStr, a3);
}

- (AnalyticsProcessor)analyticsProcessor
{
  return (AnalyticsProcessor *)objc_getProperty(self, a2, 312, 1);
}

- (void)setAnalyticsProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (WAMessage)dummyWAMessage
{
  return (WAMessage *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDummyWAMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (unint64_t)pid
{
  return self->_pid;
}

- (void)setPid:(unint64_t)a3
{
  self->_pid = a3;
}

- (unint64_t)numberOfJoins
{
  return self->_numberOfJoins;
}

- (void)setNumberOfJoins:(unint64_t)a3
{
  self->_numberOfJoins = a3;
}

- (BOOL)detectedJoinAfterIPConfig
{
  return self->_detectedJoinAfterIPConfig;
}

- (void)setDetectedJoinAfterIPConfig:(BOOL)a3
{
  self->_detectedJoinAfterIPConfig = a3;
}

- (NSDate)timeOfFirstUnlockAfterBoot
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTimeOfFirstUnlockAfterBoot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSDate)timeOfLastJoin
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTimeOfLastJoin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSNumber)bootToLastJoin
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setBootToLastJoin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSNumber)firstUnlockToLastJoin
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setFirstUnlockToLastJoin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSDate)timeOfLastLinkUp
{
  return (NSDate *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTimeOfLastLinkUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSNumber)bootToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setBootToLastLinkUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSNumber)firstUnlockToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setFirstUnlockToLastLinkUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)lastJoinToLastLinkUp
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLastJoinToLastLinkUp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSDate)timeOfIPv4
{
  return (NSDate *)objc_getProperty(self, a2, 408, 1);
}

- (void)setTimeOfIPv4:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)bootToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBootToIPv4:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)firstUnlockToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setFirstUnlockToIPv4:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)lastJoinToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLastJoinToIPv4:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)lastLinkUpToIPv4
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLastLinkUpToIPv4:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSDate)timeOfIPv6
{
  return (NSDate *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTimeOfIPv6:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSNumber)bootToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setBootToIPv6:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSNumber)firstUnlockToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setFirstUnlockToIPv6:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSNumber)lastJoinToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setLastJoinToIPv6:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSNumber)lastLinkUpToIPv6
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setLastLinkUpToIPv6:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLinkUpToIPv6, 0);
  objc_storeStrong((id *)&self->_lastJoinToIPv6, 0);
  objc_storeStrong((id *)&self->_firstUnlockToIPv6, 0);
  objc_storeStrong((id *)&self->_bootToIPv6, 0);
  objc_storeStrong((id *)&self->_timeOfIPv6, 0);
  objc_storeStrong((id *)&self->_lastLinkUpToIPv4, 0);
  objc_storeStrong((id *)&self->_lastJoinToIPv4, 0);
  objc_storeStrong((id *)&self->_firstUnlockToIPv4, 0);
  objc_storeStrong((id *)&self->_bootToIPv4, 0);
  objc_storeStrong((id *)&self->_timeOfIPv4, 0);
  objc_storeStrong((id *)&self->_lastJoinToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_firstUnlockToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_bootToLastLinkUp, 0);
  objc_storeStrong((id *)&self->_timeOfLastLinkUp, 0);
  objc_storeStrong((id *)&self->_firstUnlockToLastJoin, 0);
  objc_storeStrong((id *)&self->_bootToLastJoin, 0);
  objc_storeStrong((id *)&self->_timeOfLastJoin, 0);
  objc_storeStrong((id *)&self->_timeOfFirstUnlockAfterBoot, 0);
  objc_storeStrong((id *)&self->_dummyWAMessage, 0);
  objc_storeStrong((id *)&self->_analyticsProcessor, 0);
  objc_storeStrong((id *)&self->_lastTDConfirmedDisplayStr, 0);
  objc_storeStrong((id *)&self->_rnfSoftError, 0);
  objc_storeStrong((id *)&self->_tdSoftError, 0);
  objc_storeStrong((id *)&self->_usbDevices, 0);
  objc_storeStrong((id *)&self->_currentNetworkDetails, 0);
  objc_storeStrong((id *)&self->_lastScanRequest, 0);
  objc_storeStrong((id *)&self->_lastChannelInfoList, 0);
  objc_storeStrong((id *)&self->_lastScanData, 0);
  objc_storeStrong((id *)&self->_lastInCallAnalysis, 0);
  objc_storeStrong((id *)&self->_lastCallStarted, 0);
  objc_storeStrong(&self->_lqmAnalysisCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingLqmAnalysis, 0);
  objc_storeStrong((id *)&self->_rangingSession, 0);
  objc_storeStrong((id *)&self->_secondaryIfStatsAtLastLqmUpdate, 0);
  objc_storeStrong((id *)&self->_ifStatsAtLastLqmUpdate, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_faultEventHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_interfacesCapabilities, 0);
  objc_storeStrong((id *)&self->_lastLQMAnalysisForSlowWiFiDNSFailureTime, 0);
  objc_storeStrong((id *)&self->_interfaceLqmWindows, 0);
  objc_storeStrong((id *)&self->_linkSessions, 0);
  objc_storeStrong((id *)&self->_usageSessions, 0);
  objc_storeStrong((id *)&self->_currentCellularStatus, 0);
  objc_storeStrong((id *)&self->_secondaryInterfaceName, 0);
  objc_storeStrong((id *)&self->_lastTDEvalStartedBy, 0);
  objc_storeStrong((id *)&self->_motionState, 0);
  objc_storeStrong((id *)&self->_processInitTime, 0);
}

@end
