@implementation CellularProductExperimentsManager

- (CellularProductExperimentsManager)init
{
  CellularProductExperimentsManager *v2;
  dispatch_queue_t v3;
  uint64_t v4;
  TRIClient *trialClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CellularProductExperimentsManager;
  v2 = -[CellularProductExperimentsManager init](&v7, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: init CellularProductExperimentsManager"));
  v3 = dispatch_queue_create("com.apple.WirelessRadioManager.CellularProductExperimentsManager", 0);
  -[CellularProductExperimentsManager setCellularProdExpQueue:](v2, "setCellularProdExpQueue:", v3);

  v4 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 259));
  trialClient = v2->trialClient;
  v2->trialClient = (TRIClient *)v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: initialized trialClient for Wireless project ID"));
  return v2;
}

- (void)readParametersFromPlist:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v3, &v11);

  v5 = v11;
  if (objc_msgSend(v4, "count"))
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
  {
    v7 = CFSTR("CellularProductExperimentsManager: readParametersFromPlist: Error reading from plist file");
LABEL_9:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v7);
    goto LABEL_10;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.WirelessRadioManagerd")));
  if (!v8)
  {
    v7 = CFSTR("CellularProductExperimentsManager: readParametersFromPlist: No Bundle ID com.apple.WirelessRadioManagerd in the plist");
    goto LABEL_9;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton"));
  objc_msgSend(v10, "setTrialParameters:", v9);

LABEL_10:
}

- (void)notifyRegisteredClientsForExperimentStart:(id)a3
{
  id v4;

  v4 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: Experiment Start: set parameters from plist at %@"), v4);
  -[CellularProductExperimentsManager readParametersFromPlist:](self, "readParametersFromPlist:", v4);

}

- (void)notifyRegisteredClientsForExperimentEnd
{
  id v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: Experiment End: restore to default parameters from default plist file at %@"), CFSTR("/System/Library/WRM/WRMDefaultCellularProductExperimentParameters.plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/WRM/WRMDefaultCellularProductExperimentParameters.plist")));
  -[CellularProductExperimentsManager readParametersFromPlist:](self, "readParametersFromPlist:", v3);

}

- (void)updateTreatment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[TRIClient refresh](self->trialClient, "refresh");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient experimentIdentifiersWithNamespaceName:](self->trialClient, "experimentIdentifiersWithNamespaceName:", CFSTR("WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL")));
  v20 = v3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experimentId"));
    v5 = objc_msgSend(v20, "deploymentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "treatmentId"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: experimentIdentifiers are: experimentId: %@, deploymentId: %d, treatmentId: %@"), v4, v5, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->trialClient, "levelForFactor:withNamespaceName:", off_100270BB8, CFSTR("WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL")));
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileValue"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
        v14 = objc_msgSend(v13, "length");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileValue"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fileValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: activateTreatment: Trial Asset path: %@"), v19);

            -[CellularProductExperimentsManager notifyRegisteredClientsForExperimentStart:](self, "notifyRegisteredClientsForExperimentStart:", v17);
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: activateTreatment: Invalid asset path in trial"));
          }

          goto LABEL_13;
        }
      }
      else
      {

      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: activateTreatment: Invalid Asset Path. Treatment ended. Clear trial plist."));
      -[CellularProductExperimentsManager notifyRegisteredClientsForExperimentEnd](self, "notifyRegisteredClientsForExperimentEnd");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: activateTreatment: Invalid Trial level"));
    }
LABEL_13:

    goto LABEL_14;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: experimentIdentifiers nil. Experiment ended"));
  -[CellularProductExperimentsManager notifyRegisteredClientsForExperimentEnd](self, "notifyRegisteredClientsForExperimentEnd");
LABEL_14:

}

- (void)subscribeToTrial
{
  void *v3;
  TRIClient *trialClient;
  OS_dispatch_queue *cellularProdExpQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (self->trialClient)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: checkTreatmentUpdate: Subscribing to Trial"));
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v3 = objc_autoreleasePoolPush();
    objc_initWeak(&location, self);
    trialClient = self->trialClient;
    cellularProdExpQueue = self->cellularProdExpQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100049850;
    v7[3] = &unk_100202648;
    objc_copyWeak(&v8, &location);
    v7[4] = &v10;
    v6 = -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](trialClient, "addUpdateHandlerForNamespaceName:queue:usingBlock:", CFSTR("WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"), cellularProdExpQueue, v7);
    if (!*((_BYTE *)v11 + 24))
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: checkTreatmentUpdate: trialCallbackReceived : NO"));
      -[CellularProductExperimentsManager updateTreatment](self, "updateTreatment");
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v3);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: checkTreatmentUpdate: Invalid Trial client"));
  }
}

- (OS_dispatch_queue)cellularProdExpQueue
{
  return self->cellularProdExpQueue;
}

- (void)setCellularProdExpQueue:(id)a3
{
  objc_storeStrong((id *)&self->cellularProdExpQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cellularProdExpQueue, 0);
  objc_storeStrong((id *)&self->trialClient, 0);
}

@end
