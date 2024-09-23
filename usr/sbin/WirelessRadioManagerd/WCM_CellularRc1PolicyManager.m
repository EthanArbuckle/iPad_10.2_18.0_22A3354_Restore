@implementation WCM_CellularRc1PolicyManager

- (WCM_CellularRc1PolicyManager)init
{
  WCM_CellularRc1PolicyManager *v2;
  WCM_CellularRc1PolicyManager *v3;
  NSMutableArray *cachedNBDynamicPolicy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCM_CellularRc1PolicyManager;
  v2 = -[WCM_CellularRc1PolicyManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->Rc1Channel = 0;
    *(_WORD *)&v2->isCellInRc1CoexBand = 0;
    *(_QWORD *)&v2->WatchRc1IssueNbChannelIndex_begin = -1;
    v2->WatchRc1IssueChannel = 0;
    cachedNBDynamicPolicy = v2->cachedNBDynamicPolicy;
    v2->cachedNBDynamicPolicy = 0;

  }
  return v3;
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (a4 == 29)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_rcu1Controller, a3);
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_cellularController, a3);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RC1 Policy manager update Cellular Controller = %p"), self->_cellularController);
LABEL_5:
    v7 = v8;
  }

}

- (BOOL)isNBDynamicPolicyUpdateRequired:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSMutableArray *cachedNBDynamicPolicy;
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  NSMutableArray *v22;
  void *v24;
  WCM_CellularRc1PolicyManager *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "count");
  else
    v6 = 0;
  cachedNBDynamicPolicy = self->cachedNBDynamicPolicy;
  if (cachedNBDynamicPolicy)
    LODWORD(cachedNBDynamicPolicy) = -[NSMutableArray count](cachedNBDynamicPolicy, "count");
  if (v6 != (_DWORD)cachedNBDynamicPolicy)
  {
LABEL_25:
    v22 = v5;
    v10 = self->cachedNBDynamicPolicy;
    self->cachedNBDynamicPolicy = v22;
    v21 = 1;
    goto LABEL_26;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v5);
  v25 = self;
  v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->cachedNBDynamicPolicy);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = (NSMutableArray *)v8;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    v24 = v5;
    while (1)
    {
      v14 = 0;
LABEL_10:
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (!v17)
        break;
      v18 = v17;
      v19 = *(_QWORD *)v27;
LABEL_14:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        if ((objc_msgSend(v15, "isEqual:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20), v24) & 1) != 0)
          break;
        if (v18 == (id)++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v18)
            goto LABEL_14;
          goto LABEL_24;
        }
      }

      if ((id)++v14 != v12)
        goto LABEL_10;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v5 = v24;
      if (!v12)
        goto LABEL_23;
    }
LABEL_24:

    v5 = v24;
    self = v25;
    goto LABEL_25;
  }
LABEL_23:

  v21 = 0;
LABEL_26:

  return v21;
}

- (id)calculateNBDynamicPolicy
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int *v7;
  unsigned int v8;
  unint64_t v9;
  unsigned int *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager cellularController](self, "cellularController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager platformManager](self, "platformManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "activeSubId");
  v7 = (unsigned int *)objc_msgSend(v3, "getActiveULCAConfig");
  if (v7)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("calculateNBDynamicPolicy lte_nr_scell.totalvalidCarriers = %d"), v7[576]);
    v8 = v7[576];
    if (v8 <= 0x20)
    {
      v24 = v5;
      v25 = v3;
      if (v8)
      {
        v9 = 0;
        v10 = v7 + 16;
        do
        {
          v11 = *((double *)v10 - 6);
          v12 = *((double *)v10 - 5) * 0.5;
          v13 = (v11 - v12) * 1000000.0;
          v14 = (v11 + v12) * 1000000.0;
          v15 = *((double *)v10 - 8);
          v16 = *((double *)v10 - 7);
          v17 = (v15 - v16 * 0.5) * 1000000.0;
          v18 = (v15 + v16 * 0.5) * 1000000.0;
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("calculateNBDynamicPolicy carrier[%d]: ulCenterFreq_MHz = %f, ulBandwidth=%f"), v9, *(_QWORD *)&v15, *(_QWORD *)&v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wcmCellRc1CoexIssueTable"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "createDynamicRc1NbCoexPolicyByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *v10, 4, v13, v14, v17, v18));

          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wcmCellRc1CoexIssueTable"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "createDynamicRc1NbCoexPolicyByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:", *v10, 8, v13, v14, v17, v18));

          if (v20 && objc_msgSend(v20, "count"))
            objc_msgSend(v6, "addObjectsFromArray:", v20);
          if (v22 && objc_msgSend(v22, "count"))
            objc_msgSend(v6, "addObjectsFromArray:", v22);

          ++v9;
          v10 += 18;
        }
        while (v9 < v7[576]);
      }
      v7 = (unsigned int *)v6;
      v5 = v24;
      v3 = v25;
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("calculateNBDynamicPolicy lte_nr_scell has invalid total carriers"));
      v7 = 0;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("calculateNBDynamicPolicy lte_nr_scell is NULL"));
  }

  return v7;
}

- (void)handleCellularNetworkUpdate
{
  void *v3;
  void *v4;
  WCM_CellularController *v5;
  WCM_CellularController *cellularController;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = (id)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager cellularController](self, "cellularController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager platformManager](self, "platformManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_CellularRc1PolicyManager handleCellularNetworkUpdate"));
  if (!v31 && v4)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellularController"));
    v5 = (WCM_CellularController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellularController"));
    cellularController = self->_cellularController;
    self->_cellularController = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wcmCellRc1CoexIssueTable"));

  if (v7)
  {
    v8 = objc_msgSend(v31, "bandInfoType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeCoexFeatures"));
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("WatchReportRC1IssueChannel"));

    if (v10)
    {
      objc_msgSend(v31, "dlCenterFreq");
      v12 = v11;
      objc_msgSend(v31, "dlBandwidth");
      v14 = (v12 - v13 * 0.5) * 1000000.0;
      objc_msgSend(v31, "dlCenterFreq");
      v16 = v15;
      objc_msgSend(v31, "dlBandwidth");
      v18 = (v16 + v17 * 0.5) * 1000000.0;
      objc_msgSend(v31, "ulCenterFreq");
      v20 = v19;
      objc_msgSend(v31, "ulBandwidth");
      v22 = (v20 - v21 * 0.5) * 1000000.0;
      objc_msgSend(v31, "ulCenterFreq");
      v24 = v23;
      objc_msgSend(v31, "ulBandwidth");
      -[WCM_CellularRc1PolicyManager WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:](self, "WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:", v8, v14, v18, v22, (v24 + v25 * 0.5) * 1000000.0);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeCoexFeatures"));
    v27 = objc_msgSend(v26, "containsObject:", CFSTR("UseWCMAriDriver"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager calculateNBDynamicPolicy](self, "calculateNBDynamicPolicy"));
      if (v28
        && -[WCM_CellularRc1PolicyManager isNBDynamicPolicyUpdateRequired:](self, "isNBDynamicPolicyUpdateRequired:", v28))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_AriCoexCommandDriver singleton](WCM_AriCoexCommandDriver, "singleton"));
        v30 = v29;
        if (v29)
          objc_msgSend(v29, "handleRc1DynamicPolicy:SubId:", v28, 0);

      }
    }
    -[WCM_CellularRc1PolicyManager updateCellularR1CoexBandStatus](self, "updateCellularR1CoexBandStatus");
  }

}

- (void)updateCellularR1CoexBandStatus
{
  void *v3;
  void *v4;
  char *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  unsigned int v32;
  BOOL v33;
  double v34;
  void *v35;
  xpc_object_t v36;
  id v37;

  v37 = (id)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager cellularController](self, "cellularController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager platformManager](self, "platformManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v5 = (char *)objc_msgSend(v37, "getActiveULCAConfig");
  v6 = objc_msgSend(v37, "bandInfoType");
  objc_msgSend(v37, "dlCenterFreq");
  v8 = v7;
  objc_msgSend(v37, "dlBandwidth");
  v10 = v9;
  objc_msgSend(v37, "dlCenterFreq");
  v12 = v11;
  objc_msgSend(v37, "dlBandwidth");
  v14 = v13;
  objc_msgSend(v37, "ulCenterFreq");
  v16 = v15;
  objc_msgSend(v37, "ulBandwidth");
  v18 = v17;
  objc_msgSend(v37, "ulCenterFreq");
  v20 = v19;
  objc_msgSend(v37, "ulBandwidth");
  if (v5)
  {
    v22 = 0;
    do
    {
      v23 = *(double *)&v5[v22 + 16];
      v24 = *(double *)&v5[v22 + 24] * 0.5;
      v25 = (v23 - v24) * 1000000.0;
      v26 = (v23 + v24) * 1000000.0;
      v27 = *(double *)&v5[v22];
      v28 = *(double *)&v5[v22 + 8] * 0.5;
      v29 = (v27 - v28) * 1000000.0;
      v30 = (v27 + v28) * 1000000.0;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wcmCellRc1CoexIssueTable"));
      v32 = objc_msgSend(v31, "isCellularInRc1CoexBand:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1ChannelBitmask:", v6, self->Rc1Channel, v25, v26, v29, v30);

      if ((v32 & 1) != 0)
        break;
      v33 = v22 == 2232;
      v22 += 72;
    }
    while (!v33);
  }
  else
  {
    v34 = (v20 + v21 * 0.5) * 1000000.0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wcmCellRc1CoexIssueTable"));
    v32 = objc_msgSend(v35, "isCellularInRc1CoexBand:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1ChannelBitmask:", v6, self->Rc1Channel, (v8 - v10 * 0.5) * 1000000.0, (v12 + v14 * 0.5) * 1000000.0, (v16 - v18 * 0.5) * 1000000.0, v34);

  }
  if (self->isCellInRc1CoexBand != v32)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cell RC1 policy manager: cellular in RC1 Coex band: %d"), v32);
    self->isCellInRc1CoexBand = v32;
    v36 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v36, "kWCMHToRCU1Cellularband", v32);
    -[WCM_CellularRc1PolicyManager sendRc1Message:](self, "sendRc1Message:", v36);

  }
}

- (void)updateRc1ChannelNumber:(unsigned int)a3 NbChannelBitmask:(unsigned int)a4
{
  unsigned int v4;
  unsigned int v5;

  self->Rc1Channel = 0;
  if (a3 == 5)
  {
    v4 = 1;
  }
  else
  {
    v4 = 0;
    if (a3 != 9)
      goto LABEL_6;
    v4 = 2;
  }
  self->Rc1Channel = v4;
LABEL_6:
  if ((a4 & 0x1F) != 0)
  {
    v5 = v4 & 0xFFFFFFFB | (4 * (a4 & 1));
    if ((a4 & 2) != 0)
      v5 |= 0x18u;
    if ((a4 & 4) != 0)
      v5 |= 0x28u;
    if ((a4 & 8) != 0)
      v5 |= 0x48u;
    if ((a4 & 0x10) != 0)
      v5 |= 0x88u;
    self->Rc1Channel = v5;
  }
  -[WCM_CellularRc1PolicyManager updateCellularR1CoexBandStatus](self, "updateCellularR1CoexBandStatus");
}

- (void)sendRc1Message:(id)a3
{
  WCM_R1Controller *rcu1Controller;

  rcu1Controller = self->_rcu1Controller;
  if (rcu1Controller)
    -[WCM_Controller sendMessage:withArgs:](rcu1Controller, "sendMessage:withArgs:", 1500, a3);
}

- (void)handleCellularPowerState:(BOOL)a3
{
  id v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "kWCMHToRCU1CellularStatus", 1);
  self->cellPowerState = 1;
  -[WCM_CellularRc1PolicyManager sendRc1Message:](self, "sendRc1Message:", v4);

}

- (void)WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  int v18;
  unsigned int v20;
  xpc_object_t v21;
  unsigned int v22;
  unsigned int v23;

  v11 = *(_QWORD *)&a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_CellularRc1PolicyManager platformManager](self, "platformManager"));
  v22 = -1;
  v23 = -1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wcmCellRc1CoexIssueTable"));
  objc_msgSend(v14, "findRc1NbCoexIssueChannelByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:uwbNbIssueChannelBegin:uwbNbIssueChannelEnd:", v11, 4, &v23, &v22, a4, a5, a6, a7);

  if (v23 == -1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wcmCellRc1CoexIssueTable"));
    objc_msgSend(v15, "findRc1NbCoexIssueChannelByCellBandInfoType:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1Channel:uwbNbIssueChannelBegin:uwbNbIssueChannelEnd:", v11, 8, &v23, &v22, a4, a5, a6, a7);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wcmCellRc1CoexIssueTable"));
  v17 = objc_msgSend(v16, "isCellularInRc1CoexBand:CellDlLowFreq:cellDlHighFreq:cellUlLowFreq:cellUlHighFreq:RC1ChannelBitmask:", v11, 2, a4, a5, a6, a7);

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cell RC1 policy manager: cellDlLow=%fHz, cellDlHigh=%fHz, cellUlLow=%fHz, cellUlHigh=%fHz"), *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Cell RC1 policy manager: RC1 coex issue CH9=%d, NB channel[%d, %d]"), v17, v23, v22);
  v18 = v23;
  if (v22 == -1 || v23 == -1)
    v20 = v17;
  else
    v20 = 2;
  if (v20 != self->WatchRc1IssueChannel
    || v23 != self->WatchRc1IssueNbChannelIndex_begin
    || v22 != self->WatchRc1IssueNbChannelIndex_end)
  {
    self->WatchRc1IssueNbChannelIndex_end = v22;
    self->WatchRc1IssueChannel = v20;
    self->WatchRc1IssueNbChannelIndex_begin = v18;
    v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1ChannelsToTriggerGPIOBlanking", self->WatchRc1IssueChannel);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChBegin", self->WatchRc1IssueNbChannelIndex_begin);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChEnd", self->WatchRc1IssueNbChannelIndex_end);
    -[WCM_CellularRc1PolicyManager sendRc1Message:](self, "sendRc1Message:", v21);

  }
}

- (void)updateRc1OverallConfig
{
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(xdict, "kWCMHToRCU1CellularStatus", self->cellPowerState);
  xpc_dictionary_set_BOOL(xdict, "kWCMHToRCU1Cellularband", self->isCellInRc1CoexBand);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1ChannelsToTriggerGPIOBlanking", self->WatchRc1IssueChannel);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChBegin", self->WatchRc1IssueNbChannelIndex_begin);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChEnd", self->WatchRc1IssueNbChannelIndex_end);
  -[WCM_CellularRc1PolicyManager sendRc1Message:](self, "sendRc1Message:", xdict);

}

- (WCM_PlatformManager)platformManager
{
  return self->_platformManager;
}

- (void)setPlatformManager:(id)a3
{
  objc_storeStrong((id *)&self->_platformManager, a3);
}

- (WCM_CellularController)cellularController
{
  return self->_cellularController;
}

- (WCM_R1Controller)rcu1Controller
{
  return self->_rcu1Controller;
}

- (WCM_CellularRc1CoexIssueTable)rcu1CoexIssueTable
{
  return self->_rcu1CoexIssueTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rcu1CoexIssueTable, 0);
  objc_storeStrong((id *)&self->_rcu1Controller, 0);
  objc_storeStrong((id *)&self->_cellularController, 0);
  objc_storeStrong((id *)&self->_platformManager, 0);
  objc_storeStrong((id *)&self->cachedNBDynamicPolicy, 0);
}

@end
