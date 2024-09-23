@implementation STTelephonyStatusDomainDataProvider

void __58__STTelephonyStatusDomainDataProvider__updateDataForSlot___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "setSIMOneInfo:", *(_QWORD *)(a1 + 32));
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(v4, "setSIMTwoInfo:", *(_QWORD *)(a1 + 40));
    v3 = v4;
  }
  objc_msgSend(v3, "setCellularRadioCapabilityEnabled:", *(unsigned __int8 *)(a1 + 50));
  objc_msgSend(v4, "setDualSIMEnabled:", *(unsigned __int8 *)(a1 + 51));
  objc_msgSend(v4, "setRadioModuleDead:", *(unsigned __int8 *)(a1 + 52));
  objc_msgSend(v4, "setUsingStewieForSOS:", *(unsigned __int8 *)(a1 + 53));
  objc_msgSend(v4, "setInactiveSOSEnabled:", *(unsigned __int8 *)(a1 + 54));
  objc_msgSend(v4, "setUsingStewieConnection:", *(unsigned __int8 *)(a1 + 55));

}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)self, a4);
}

- (void)_updateDataForSlot:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;

  if (a1)
  {
    v26 = *(id *)(a1 + 8);
    objc_msgSend(v26, "subscriptionInfoForSlot:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "subscriptionInfoForSlot:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v25 = v4;
    if (a2 == 2)
    {
      if (!v5
        || !objc_msgSend(v5, "isHiddenSIM")
        || (objc_msgSend(v6, "isBootstrap") & 1) != 0
        || !objc_msgSend(v6, "isProvidingDataConnection"))
      {
        v9 = 0;
        objc_msgSend(v26, "carrierBundleInfoForSlot:", 2, 0);
        goto LABEL_21;
      }
    }
    else
    {
      if (a2 != 1)
      {
        v7 = 0;
        if (a2 > 1)
        {
          v23 = 0;
          v9 = 0;
          goto LABEL_18;
        }
LABEL_15:
        objc_msgSend(v26, "carrierBundleInfoForSlot:", 1, 1, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStatusDomainDataProvider _SIMInfoForStateProvider:subscriptionInfo:carrierBundleInfo:slot:otherSlotSubscriptionInfo:](a1, v26, v4, v8, 1, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        a2 = v7;
LABEL_18:
        if ((a2 & 0xFFFFFFFFFFFFFFFDLL) != 0)
        {
          v10 = 0;
          v11 = 0;
          v12 = v26;
LABEL_22:
          v14 = objc_msgSend(v12, "isCellularRadioCapabilityActive", v23);
          v15 = objc_msgSend(v26, "isDualSIMEnabled");
          v16 = objc_msgSend(v26, "isRadioModuleDead");
          v17 = objc_msgSend(v26, "isUsingStewieForSOS");
          v18 = objc_msgSend(v26, "isInactiveSOSEnabled");
          v19 = objc_msgSend(v26, "isUsingStewieConnection");
          v20 = *(void **)(a1 + 16);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __58__STTelephonyStatusDomainDataProvider__updateDataForSlot___block_invoke;
          v27[3] = &unk_1E8E17F38;
          v30 = v24;
          v31 = v10;
          v28 = v9;
          v29 = v11;
          v32 = v14;
          v33 = v15;
          v34 = v16;
          v35 = v17;
          v36 = v18;
          v37 = v19;
          v21 = v11;
          v22 = v9;
          objc_msgSend(v20, "updateDataWithBlock:", v27);

          return;
        }
        objc_msgSend(v26, "carrierBundleInfoForSlot:", 2, v23);
LABEL_21:
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[STTelephonyStatusDomainDataProvider _SIMInfoForStateProvider:subscriptionInfo:carrierBundleInfo:slot:otherSlotSubscriptionInfo:](a1, v26, v6, v13, 2, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v26;
        v10 = 1;
        goto LABEL_22;
      }
      if (!v4
        || !objc_msgSend(v4, "isHiddenSIM")
        || (objc_msgSend(v4, "isBootstrap") & 1) != 0
        || (objc_msgSend(v4, "isProvidingDataConnection") & 1) == 0)
      {
        v7 = 1;
        goto LABEL_15;
      }
    }
    v7 = 0;
    goto LABEL_15;
  }
}

- (BOOL)_simStatusMeansLocked:(void *)a1
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (objc_msgSend(v1, "compare:", *MEMORY[0x1E0CA7800]))
    v2 = objc_msgSend(v1, "compare:", *MEMORY[0x1E0CA7808]) == 0;
  else
    v2 = 1;

  return v2;
}

- (BOOL)_shouldShowEmergencyOnlyStatusForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5
{
  id v9;
  id v10;
  int v11;
  _BOOL8 v12;

  v9 = a1;
  v10 = a5;
  v12 = 0;
  if ((a4 & 1) == 0 && objc_msgSend(v9, "hasCellularTelephony"))
  {
    v11 = a2 == 2 ? a3 : 0;
    if ((a2 == 4 || v11) && !objc_msgSend(v10, "suppressSOSOnlyWithLimitedService"))
      v12 = 1;
  }

  return v12;
}

- (uint64_t)_serviceStateForStateProvider:(void *)a1 registrationStatus:(uint64_t)a2 bootstrap:(int)a3 hidden:(char)a4 carrierBundleInfo:(void *)a5
{
  _BOOL4 v9;
  id v10;
  id v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;

  v9 = a2 == 2;
  v10 = a1;
  v11 = a5;
  v12 = -[STTelephonyStatusDomainDataProvider _shouldShowEmergencyOnlyStatusForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v10, a2, a3, a4, v11);
  v13 = 2 * v9;
  if (a2 == 1)
    v13 = 1;
  if (v12)
    v14 = 3;
  else
    v14 = v13;

  return v14;
}

- (id)_SIMInfoForStateProvider:(void *)a3 subscriptionInfo:(void *)a4 carrierBundleInfo:(uint64_t)a5 slot:(void *)a6 otherSlotSubscriptionInfo:
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  int v26;
  char v27;
  _BOOL4 v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v50;

  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0DB0958];
  v13 = a4;
  v14 = a2;
  v15 = objc_alloc_init(v12);
  if (v10 && objc_msgSend(v10, "isHiddenSIM"))
    v16 = objc_msgSend(v10, "isBootstrap") ^ 1;
  else
    v16 = 0;
  v17 = v16 ^ 1;
  objc_msgSend(v15, "setSIMPresent:", objc_msgSend(v14, "isSIMPresentForSlot:", a5) & (v16 ^ 1));
  objc_msgSend(v15, "setBootstrap:", objc_msgSend(v10, "isBootstrap"));
  objc_msgSend(v10, "SIMLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", v18);

  objc_msgSend(v10, "shortSIMLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShortLabel:", v19);

  objc_msgSend(v15, "setSignalStrengthBars:", objc_msgSend(v10, "signalStrengthBars"));
  objc_msgSend(v15, "setMaxSignalStrengthBars:", objc_msgSend(v10, "maxSignalStrengthBars"));
  LODWORD(v19) = objc_msgSend(v10, "isBootstrap");
  objc_msgSend(v15, "setServiceState:", -[STTelephonyStatusDomainDataProvider _serviceStateForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v14, objc_msgSend(v10, "registrationStatus"), (int)v19, v16, v13));
  objc_msgSend(v15, "setCellularServiceState:", -[STTelephonyStatusDomainDataProvider _serviceStateForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v14, objc_msgSend(v10, "cellularRegistrationStatus"), (int)v19, v16, v13));
  v20 = v14;
  v21 = v10;
  v22 = v13;
  if (!objc_msgSend(v20, "isUsingStewieForSOS")
    || !objc_msgSend(v20, "isUsingStewieConnection"))
  {
    if ((objc_msgSend(v20, "isRadioModuleDead") & 1) != 0)
      v25 = 3;
    else
      v25 = objc_msgSend(v21, "registrationStatus");
    v26 = objc_msgSend(v21, "isBootstrap");
    if (v10 && objc_msgSend(v21, "isHiddenSIM"))
      v27 = objc_msgSend(v21, "isBootstrap") ^ 1;
    else
      v27 = 0;
    v28 = -[STTelephonyStatusDomainDataProvider _shouldShowEmergencyOnlyStatusForStateProvider:registrationStatus:bootstrap:hidden:carrierBundleInfo:](v20, v25, v26, v27, v22);
    if (!v28 && v25 == 2)
    {
      objc_msgSend(v21, "operatorName");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(v21, "SIMStatus");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    v50 = v17;
    if (!v30)
      goto LABEL_20;
    if (objc_msgSend(v30, "compare:", *MEMORY[0x1E0CA77F8]))
    {
      if (objc_msgSend(v31, "compare:", *MEMORY[0x1E0CA77F0]) && objc_msgSend(v31, "compare:", *MEMORY[0x1E0CA7810]))
      {
        if (!-[STTelephonyStatusDomainDataProvider _simStatusMeansLocked:](v31))
        {
LABEL_20:
          v32 = 0;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        v35 = CFSTR("LOCKED_SIM");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        v35 = CFSTR("BAD_SIM");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v35 = CFSTR("NO_SIM");
    }
    objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_1E8E18D48, CFSTR("SystemStatusServer-Telephony"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
    if (v25 - 3 > 1)
    {
      if (v25 > 1)
      {
        v39 = 0;
        if (v28)
        {
LABEL_34:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SOS_ONLY"), &stru_1E8E18D48, CFSTR("SystemStatusServer-Telephony"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v20, "needsUserIdentificationModule");
            v42 = v32;
            v43 = v32;
          }
          else
          {
            v42 = 0;
            v43 = 0;
          }
LABEL_45:
          v44 = v42;
          v29 = objc_retainAutorelease(v43);
          v24 = v41;

          v17 = v50;
          goto LABEL_46;
        }
LABEL_37:
        if (-[STTelephonyStatusDomainDataProvider _simStatusMeansLocked:](v31)
          || objc_msgSend(v20, "needsUserIdentificationModule"))
        {
          v43 = 0;
          if (v32)
            v42 = v32;
          else
            v42 = v39;
          v41 = v42;
        }
        else
        {
          v43 = 0;
          v42 = v39;
          v41 = v39;
        }
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = CFSTR("SEARCHING");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = CFSTR("NO_SERVICE");
    }
    objc_msgSend(v36, "localizedStringForKey:value:table:", v38, &stru_1E8E18D48, CFSTR("SystemStatusServer-Telephony"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      goto LABEL_34;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SATELLITE"), &stru_1E8E18D48, CFSTR("SystemStatusServer-Telephony"));
  v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  v29 = 0;
LABEL_46:

  v45 = v29;
  objc_msgSend(v15, "setServiceDescription:", v24);
  objc_msgSend(v15, "setSecondaryServiceDescription:", v45);

  v46 = objc_msgSend(v21, "dataConnectionType");
  if (v11
    && objc_msgSend(v11, "isHiddenSIM")
    && (objc_msgSend(v11, "isBootstrap") & 1) == 0
    && objc_msgSend(v11, "isProvidingDataConnection"))
  {
    v46 = objc_msgSend(v11, "dataConnectionType");
    v47 = 1;
  }
  else
  {
    v47 = 0;
  }
  if ((unint64_t)(v46 - 1) >= 0xE)
    v48 = 0;
  else
    v48 = v46;
  objc_msgSend(v15, "setDataNetworkType:", v48);
  objc_msgSend(v15, "setProvidingDataConnection:", (v47 | objc_msgSend(v21, "isProvidingDataConnection")) & v17);
  objc_msgSend(v15, "setPreferredForDataConnections:", objc_msgSend(v21, "isPreferredForDataConnections"));
  objc_msgSend(v15, "setRegisteredWithoutCellular:", objc_msgSend(v21, "isRegisteredWithoutCellular"));
  objc_msgSend(v15, "setCallForwardingEnabled:", objc_msgSend(v21, "callForwardingIndicator") == 1);

  return v15;
}

- (STTelephonyStatusDomainDataProvider)init
{
  void *v3;
  STTelephonyStatusDomainDataProvider *v4;

  STDefaultStatusDomainPublisherServerHandle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STTelephonyStatusDomainDataProvider initWithServerHandle:](self, "initWithServerHandle:", v3);

  return v4;
}

- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3
{
  id v4;
  STTelephonyStateProvider *v5;
  STTelephonyStatusDomainDataProvider *v6;

  v4 = a3;
  v5 = objc_alloc_init(STTelephonyStateProvider);
  v6 = -[STTelephonyStatusDomainDataProvider initWithServerHandle:stateProvider:](self, "initWithServerHandle:stateProvider:", v4, v5);

  return v6;
}

- (STTelephonyStatusDomainDataProvider)initWithStateProvider:(id)a3
{
  id v4;
  void *v5;
  STTelephonyStatusDomainDataProvider *v6;

  v4 = a3;
  STDefaultStatusDomainPublisherServerHandle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STTelephonyStatusDomainDataProvider initWithServerHandle:stateProvider:](self, "initWithServerHandle:stateProvider:", v5, v4);

  return v6;
}

- (STTelephonyStatusDomainDataProvider)initWithServerHandle:(id)a3 stateProvider:(id)a4
{
  id v6;
  id v7;
  STTelephonyStatusDomainDataProvider *v8;
  STTelephonyStatusDomainDataProvider *v9;
  uint64_t v10;
  STTelephonyStatusDomainPublisher *telephonyDomainPublisher;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STTelephonyStatusDomainDataProvider;
  v8 = -[STTelephonyStatusDomainDataProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_telephonyStateProvider, a4);
    objc_msgSend(v7, "addObserver:", v9);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A88]), "initWithServerHandle:", v6);
    telephonyDomainPublisher = v9->_telephonyDomainPublisher;
    v9->_telephonyDomainPublisher = (STTelephonyStatusDomainPublisher *)v10;

    -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)v9, 0);
  }

  return v9;
}

- (void)dealloc
{
  STTelephonyStatusDomainDataProvider *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STTelephonyStatusDomainDataProvider *)self->_telephonyDomainPublisher;
  -[STTelephonyStatusDomainDataProvider invalidate](self, "invalidate");
  -[STTelephonyStatusDomainDataProvider invalidate](v2, "invalidate");
  v3.receiver = v2;
  v3.super_class = (Class)STTelephonyStatusDomainDataProvider;
  -[STTelephonyStatusDomainDataProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  STTelephonyStatusDomainDataProvider *v2;

  v2 = self;
  if (self)
    self = (STTelephonyStatusDomainDataProvider *)self->_telephonyStateProvider;
  -[STTelephonyStatusDomainDataProvider removeObserver:](self, "removeObserver:", v2);
}

- (void)carrierBundleInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)self, a4);
}

- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)self, a4);
}

- (void)stewieStateDidChangeForStateProvider:(id)a3 usingStewieForSOS:(BOOL)a4 isInactiveSOSEnabled:(BOOL)a5 usingStewieConnection:(BOOL)a6
{
  -[STTelephonyStatusDomainDataProvider _updateDataForSlot:]((uint64_t)self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyDomainPublisher, 0);
  objc_storeStrong((id *)&self->_telephonyStateProvider, 0);
}

@end
