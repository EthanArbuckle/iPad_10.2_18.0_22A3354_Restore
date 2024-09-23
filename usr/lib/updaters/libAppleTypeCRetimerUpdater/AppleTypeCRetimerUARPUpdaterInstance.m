@implementation AppleTypeCRetimerUARPUpdaterInstance

- (AppleTypeCRetimerUARPUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v6;
  id v8;
  AppleTypeCRetimerUARPUpdaterInstance *v9;
  AppleTypeCRetimerUARPUpdaterInstance *v10;
  uint64_t v11;
  NSString *name;
  AppleTypeCRetimerIICDeviceHandle *v13;
  AppleTypeCRetimerIICDeviceHandle *deviceHandle;
  id WeakRetained;
  id v16;
  uint64_t v17;
  id v18;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id v20;
  id v21;
  AppleTypeCRetimerUARPUpdaterInstance *v22;
  id v24;
  objc_super v25;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AppleTypeCRetimerUARPUpdaterInstance;
  v9 = -[AppleTypeCRetimerUARPUpdaterInstance init](&v25, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_13;
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10->_routerID = v6;
  v10->_useLocalSigning = 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%u"), "uatcrt", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  name = v10->_name;
  v10->_name = (NSString *)v11;

  v13 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]([AppleTypeCRetimerIICDeviceHandle alloc], "initWithRouterID:namePrefix:", v10->_routerID, CFSTR("uatcrt"));
  deviceHandle = v10->_deviceHandle;
  v10->_deviceHandle = v13;

  if (v10->_deviceHandle)
  {
    if (-[AppleTypeCRetimerUARPUpdaterInstance allocateACE](v10, "allocateACE"))
    {
      *(_QWORD *)&v10->_nextDFUFirmwareProgressReportPercentThreshold = 0xA0000000ALL;
      v10->_nextUpdateProgressReportPercentThreshold = 10;
      if (v5)
      {
        WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
        objc_msgSend(WeakRetained, "log:", CFSTR("Updater instance forcing power on for %@"), v10->_name);

        if (-[ACE retimerForcePower](v10->_ace, "retimerForcePower"))
        {
          v16 = objc_loadWeakRetained((id *)&v10->_delegate);
          objc_msgSend(v16, "log:", CFSTR("Failed to force power on for %@ during Updater instance initialization"), v10->_name);

          v24 = 0;
          -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](v10, "queryPanicStatus:", &v24);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v24;
          panicStatus = v10->_panicStatus;
          v10->_panicStatus = (AppleTypeCRetimerPanicStatus *)v17;

          if (!v10->_panicStatus)
          {
            v20 = objc_loadWeakRetained((id *)&v10->_delegate);
            objc_msgSend(v20, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUARPUpdaterInstance initWithRouterID:delegate:forcePower:]", v10->_name, v18);

          }
          goto LABEL_10;
        }
      }
      else
      {
        v10->_dfuCheckHasRun = 1;
      }
      v10->_powerForced = 1;
LABEL_13:
      v22 = v10;
      goto LABEL_14;
    }
  }
  else
  {
    v21 = objc_loadWeakRetained((id *)&v10->_delegate);
    objc_msgSend(v21, "log:", CFSTR("Failed to allocate device handle for %@ during Updater instance initialization"), v10->_name);

  }
LABEL_10:
  v22 = 0;
LABEL_14:

  return v22;
}

- (void)dealloc
{
  uint64_t *uarpContext;
  objc_super v4;

  -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
  if (self->_dfuUpdater)
    -[ACE retimerExitForceDFU](self->_ace, "retimerExitForceDFU");
  if (self->_powerForced && !self->_stageSuccess)
    -[ACE retimerRemoveForcePower](self->_ace, "retimerRemoveForcePower");
  uarpContext = (uint64_t *)self->_uarpContext;
  if (uarpContext)
  {
    UarpRestoreFinalizeEndpoint(uarpContext);
    self->_uarpContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppleTypeCRetimerUARPUpdaterInstance;
  -[AppleTypeCRetimerUARPUpdaterInstance dealloc](&v4, sel_dealloc);
}

- (BOOL)allocateACE
{
  ACE *v3;
  ACE *ace;
  ACE *v5;
  id WeakRetained;

  v3 = -[ACE initWithRouterID:]([ACE alloc], "initWithRouterID:", self->_routerID);
  ace = self->_ace;
  self->_ace = v3;

  v5 = self->_ace;
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Unable to locate ACE for %@"), self);

  }
  return v5 != 0;
}

- (BOOL)allocateUpdaterDFU
{
  AppleTypeCRetimerDFU *v3;
  AppleTypeCRetimerDFU *dfuUpdater;
  AppleTypeCRetimerDFU *v5;
  id WeakRetained;

  v3 = -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:]([AppleTypeCRetimerDFU alloc], "initWithRouterID:route:port:space:baudRate:", self->_routerID, 0, 0, 2, 921600);
  dfuUpdater = self->_dfuUpdater;
  self->_dfuUpdater = v3;

  v5 = self->_dfuUpdater;
  if (v5)
  {
    -[AppleTypeCRetimerDFU setDelegate:](self->_dfuUpdater, "setDelegate:", self);
    -[AppleTypeCRetimerDFU setMaxB2PFrameSize:](self->_dfuUpdater, "setMaxB2PFrameSize:", 1011);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Unable to create DFU updater for %@"), self);

  }
  return v5 != 0;
}

- (id)queryHardwareID
{
  AppleTypeCRetimerUARPHardwareIDQuerier *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  AppleTypeCRetimerPanicStatus *v8;
  id v9;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19;

  v3 = -[AppleTypeCRetimerUARPHardwareIDQuerier initWithDeviceHandle:captureFileName:]([AppleTypeCRetimerUARPHardwareIDQuerier alloc], "initWithDeviceHandle:captureFileName:", self->_deviceHandle, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "log:", CFSTR("%@: Attempting to query hardware ID via UARP."), self->_name);

  -[AppleTypeCRetimerUARPHardwareIDQuerier queryHardwareID](v3, "queryHardwareID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v19 = 0;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v19);
    v8 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v8;

    if (!self->_panicStatus)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", v12, v9);

    }
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "log:", CFSTR("%s: IIC hardware ID query failed for %@."), "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", self);

    if (self->_dfuCheckHasRun)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "log:", CFSTR("%s: Falling back to DFU mode for %@."), "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", v15);

      if (-[AppleTypeCRetimerUARPUpdaterInstance allocateUpdaterDFU](self, "allocateUpdaterDFU"))
      {
        -[AppleTypeCRetimerDFU queryHardwareID](self->_dfuUpdater, "queryHardwareID");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v6 = (void *)v16;

          goto LABEL_3;
        }
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v17, "log:", CFSTR("%s: Unable to query hardware ID in DFU mode for %@."), "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", self);

      }
    }

    v6 = 0;
    goto LABEL_12;
  }
  v6 = (void *)v5;
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "log:", CFSTR("%@: UARP hardware ID check succeeded."), self->_name);

LABEL_3:
  self->_useLocalSigning = objc_msgSend(v6, "requiresPersonalization") ^ 1;
LABEL_12:

  return v6;
}

- (id)createChipSpecificSuperBinaryDataForStockSuperBinary:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  UARPAssetTag *v13;
  void *v14;
  AppleTypeCRetimerBoardIDFile *v15;
  FTABSubfile *v16;
  void *v17;
  void *v18;
  FTABSubfile *v19;
  void *v20;
  void *v21;
  void *v22;
  FTABSubfile *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id WeakRetained;
  AppleTypeCRetimerUARPUpdaterInstance *v32;
  unint64_t v33;
  id v34;
  unint64_t v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("FIRM"));
  objc_msgSend(v10, "payloadWith4ccTag:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v33 = a6;
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v14, "setManifest:", v11);
    v34 = v11;
    v15 = -[AppleTypeCRetimerBoardIDFile initWithBoardID:chipID:portNumber:securityDomain:]([AppleTypeCRetimerBoardIDFile alloc], "initWithBoardID:chipID:portNumber:securityDomain:", objc_msgSend(v12, "boardID"), (unsigned __int16)objc_msgSend(v12, "chipID"), self->_routerID, objc_msgSend(v12, "securityDomain"));
    v16 = [FTABSubfile alloc];
    -[AppleTypeCRetimerBoardIDFile tag](v15, "tag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerBoardIDFile data](v15, "data");
    v32 = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[FTABSubfile initWithTag:data:](v16, "initWithTag:data:", v17, v18);

    -[FTABSubfile data](v19, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABSubfile tag](v19, "tag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubfile:tag:", v20, v21);

    v35 = v33;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v35, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FTABSubfile initWithTag:data:]([FTABSubfile alloc], "initWithTag:data:", CFSTR("dbgb"), v22);
    -[FTABSubfile data](v23, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABSubfile tag](v23, "tag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubfile:tag:", v24, v25);

    objc_msgSend(v10, "generatePersonalizedSuperBinary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&v32->_delegate);
      objc_msgSend(WeakRetained, "log:", CFSTR("Failed to generate updated super binary for %@"), v32);

    }
    v11 = v34;
  }
  else
  {
    v29 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v29, "log:", CFSTR("Failed to locate firmware super binary payload when updating super binary"));

    v27 = 0;
  }

  return v27;
}

- (BOOL)performUpdateForSuperBinaryData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7 bver:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  UARPSuperBinary *v18;
  void *v19;
  UARPSuperBinary *v20;
  id v21;
  _BOOL4 v22;
  id v23;
  id WeakRetained;
  void *v25;
  id v26;
  id v27;
  char v29;

  v10 = a6;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a3;
  v18 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]([UARPSuperBinary alloc], "initWithData:delegate:delegateQueue:", v17, 0, 0);

  if (v18)
  {
    -[AppleTypeCRetimerUARPUpdaterInstance createChipSpecificSuperBinaryDataForStockSuperBinary:manifestData:apHardwareID:debugFlags:](self, "createChipSpecificSuperBinaryDataForStockSuperBinary:manifestData:apHardwareID:debugFlags:", v18, v14, v15, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      LOBYTE(v22) = 0;
LABEL_19:

      goto LABEL_20;
    }
    v20 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]([UARPSuperBinary alloc], "initWithData:delegate:delegateQueue:", v19, 0, 0);
    if (v20)
    {
      if (!self->_dfuUpdater)
      {
        if (!v10)
          goto LABEL_15;
        v29 = 0;
        v22 = -[AppleTypeCRetimerUARPUpdaterInstance checkForVersionMatch:withBver:](self, "checkForVersionMatch:withBver:", &v29, v16);
        if (v22)
        {
          if (!v29)
            goto LABEL_15;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "log:", CFSTR("Skipping update for %@ because it already has this firmware version."), v25);

        }
LABEL_18:

        goto LABEL_19;
      }
      if (-[AppleTypeCRetimerUARPUpdaterInstance performDfuUpdateForSuperBinary:withManifestData:](self, "performDfuUpdateForSuperBinary:withManifestData:", v18, v14))
      {
        sleep(1u);
LABEL_15:
        self->_stageSuccess = 0;
        if (-[AppleTypeCRetimerUARPUpdaterInstance startAppModeUpdateForSuperBinaryData:](self, "startAppModeUpdateForSuperBinaryData:", v19))
        {
          v26 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v26, "log:", CFSTR("%@: Waiting for UARP stage to complete..."), self->_name);

          dispatch_semaphore_wait((dispatch_semaphore_t)self->_uarpSemaphore, 0xFFFFFFFFFFFFFFFFLL);
          v27 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v27, "log:", CFSTR("%@: Continuing after UARP staging has completed."), self->_name);

        }
        -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
        LOBYTE(v22) = self->_stageSuccess;
        goto LABEL_18;
      }
    }
    else
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v23, "log:", CFSTR("Failed to parse updated super binary"));

    }
    LOBYTE(v22) = 0;
    goto LABEL_18;
  }
  v21 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v21, "log:", CFSTR("Failed to parse super binary."));

  LOBYTE(v22) = 0;
LABEL_20:

  return v22;
}

- (BOOL)performDfuUpdateForSuperBinary:(id)a3 withManifestData:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  UARPAssetTag *v10;
  void *v11;
  void *v12;
  FTABFile *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  const __CFString *v19;
  const char *v21;
  AppleTypeCRetimerUARPUpdaterInstance *v22;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "log:", CFSTR("%@: Performing DFU"), v9);

  v10 = -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("RRKO"));
  objc_msgSend(v7, "payloadWith4ccTag:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "payloadData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = (FTABFile *)objc_loadWeakRetained((id *)&self->_delegate);
      -[FTABFile log:](v13, "log:", CFSTR("Failed to locate RRKO data"));
      v18 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v13 = objc_alloc_init(FTABFile);
    if (-[FTABFile addSubfileWithTagName:subfileData:](v13, "addSubfileWithTagName:subfileData:", CFSTR("rrko"), v12))
    {
      if (v6)
        -[FTABFile setManifest:](v13, "setManifest:", v6);
      v14 = (int)-[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:](self->_dfuUpdater, "dfuWithFTAB:forcePersonalize:", v13, 0);
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = v15;
      if (v14)
      {
        -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "log:", CFSTR("%s: DFU complete for %@"), "-[AppleTypeCRetimerUARPUpdaterInstance performDfuUpdateForSuperBinary:withManifestData:]", v17);

        v18 = 1;
LABEL_13:

        goto LABEL_14;
      }
      v21 = "-[AppleTypeCRetimerUARPUpdaterInstance performDfuUpdateForSuperBinary:withManifestData:]";
      v22 = self;
      v19 = CFSTR("%s: DFU failed for %@");
    }
    else
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      v16 = v15;
      v19 = CFSTR("Failed to add RRKO data to FTAB");
    }
    objc_msgSend(v15, "log:", v19, v21, v22);
    v18 = 0;
    goto LABEL_13;
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "log:", CFSTR("Failed to locate RRKO payload in super binary"));
  v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)startAppModeUpdateForSuperBinaryData:(id)a3
{
  id v4;
  _UARPSiliconContext *uarpContext;
  id v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  id WeakRetained;
  BOOL v17;

  v4 = a3;
  if (-[AppleTypeCRetimerUARPUpdaterInstance initUARP](self, "initUARP"))
  {
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    uarpContext = self->_uarpContext;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    v14 = UarpRestoreStageFirmwareDataBuffer((uint64_t)uarpContext, v7, v8, v9, v10, v11, v12, v13);
    if (!v14)
    {
      v17 = 1;
      goto LABEL_6;
    }
    v15 = v14;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("%s: Failed to start UARP update for %@ (%s)"), "-[AppleTypeCRetimerUARPUpdaterInstance startAppModeUpdateForSuperBinaryData:]", self, uarpStatusCodeToString(v15));

  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (BOOL)checkForVersionMatch:(BOOL *)a3 withBver:(id)a4
{
  id v6;
  AppleTypeCRetimerIIC *v7;
  void *v8;
  AppleTypeCRetimerPanicStatus *v9;
  id v10;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id WeakRetained;
  void *v13;
  id v14;
  id v16;

  v6 = a4;
  v7 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]([AppleTypeCRetimerIIC alloc], "initWithDeviceHandle:", self->_deviceHandle);
  -[AppleTypeCRetimerIICBase bverString](v7, "bverString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *a3 = objc_msgSend(v6, "isEqualToString:", v8);
  }
  else
  {
    v16 = 0;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v16);
    v9 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v9;

    if (!self->_panicStatus)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUARPUpdaterInstance checkForVersionMatch:withBver:]", v13, v10);

    }
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "log:", CFSTR("Version match: Failed to query chip Bver for %@"), self);

  }
  return v8 != 0;
}

- (BOOL)applyFirmware
{
  _BOOL4 v3;
  unsigned int v4;
  const char *v5;
  id WeakRetained;
  id v7;
  id v8;

  v3 = -[AppleTypeCRetimerUARPUpdaterInstance initUARP](self, "initUARP");
  if (v3)
  {
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    v4 = UarpRestoreApplyStagedAssets((dispatch_queue_t *)self->_uarpContext);
    if (v4)
    {
      v5 = uarpStatusCodeToString(v4);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "log:", CFSTR("%s: Failed to start firmware apply for %@ (%s)"), "-[AppleTypeCRetimerUARPUpdaterInstance applyFirmware]", self, v5);

      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      LOBYTE(v3) = 0;
    }
    else
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "log:", CFSTR("%@: Waiting for UARP apply to complete..."), self->_name);

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_uarpSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "log:", CFSTR("%@: Continuing after UARP apply has completed."), self->_name);

      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      LOBYTE(v3) = self->_applySuccess;
    }
  }
  return v3;
}

- (BOOL)printVersions
{
  AppleTypeCRetimerIIC *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  id v9;
  AppleTypeCRetimerPanicStatus *v10;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id WeakRetained;
  void *v13;
  id v14;
  id v16;

  v3 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]([AppleTypeCRetimerIIC alloc], "initWithDeviceHandle:", self->_deviceHandle);
  -[AppleTypeCRetimerIICBase bverString](v3, "bverString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerIICBase internalFirmwareVersion](v3, "internalFirmwareVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (v7)
  {
    v16 = 0;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v16);
    v10 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v10;

    if (!self->_panicStatus)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUARPUpdaterInstance printVersions]", v13, v9);

    }
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "log:", CFSTR("%s: Failed to query new firmware version for %@"), "-[AppleTypeCRetimerUARPUpdaterInstance printVersions]", self);

  }
  else
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "log:", CFSTR("%@: New firmware version %@ (%@)"), self->_name, v4, v6);
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ panicState=%d assertID=%u>"), v4, -[AppleTypeCRetimerPanicStatus fwPanic](self->_panicStatus, "fwPanic"), -[AppleTypeCRetimerPanicStatus assertID](self->_panicStatus, "assertID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queryPanicStatus:(id *)a3
{
  AppleTypeCRetimerIIC *v4;
  void *v5;

  v4 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]([AppleTypeCRetimerIIC alloc], "initWithDeviceHandle:", self->_deviceHandle);
  -[AppleTypeCRetimerIICBase queryRetimerPanicStatus:](v4, "queryRetimerPanicStatus:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dfuImageBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;

  v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUFirmwareProgressReportPercentThreshold <= v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: DFU firmware transfer: %u%%"), v7, v4);

    self->_nextDFUFirmwareProgressReportPercentThreshold = v4 + 10;
  }
}

- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5
{
  return 0;
}

- (void)manifestBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;

  v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUManifestProgressReportPercentThreshold <= v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: DFU manifest transfer: %u%%"), v7, v4);

    self->_nextDFUManifestProgressReportPercentThreshold = v4 + 10;
  }
}

- (BOOL)initUARP
{
  BOOL v2;
  id v4;
  _QWORD *v5;
  AppleTypeCRetimerIICFifo *v6;
  AppleTypeCRetimerIICFifo *fifo;
  id WeakRetained;
  dispatch_queue_t v9;
  OS_dispatch_semaphore *v10;
  OS_dispatch_semaphore *uarpSemaphore;
  _OWORD v13[8];
  uint64_t v14;

  if (self->_uarpInitialized)
    return 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.uarp"), self->_name);
  v14 = 0;
  v13[2] = xmmword_251CE3D98;
  v13[3] = *(_OWORD *)&off_251CE3DA8;
  memset(&v13[4], 0, 64);
  v13[0] = xmmword_251CE3D78;
  v13[1] = unk_251CE3D88;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = UarpRestoreInitializeEndpoint(0, (uint64_t)self, (uint64_t)v13, (const char *)objc_msgSend(v4, "UTF8String"));
  v2 = v5 != 0;
  if (v5)
  {
    v6 = -[AppleTypeCRetimerIICFifo initWithDeviceHandle:queueLabelSuffix:]([AppleTypeCRetimerIICFifo alloc], "initWithDeviceHandle:queueLabelSuffix:", self->_deviceHandle, CFSTR("updater_instance"));
    fifo = self->_fifo;
    self->_fifo = v6;

    -[AppleTypeCRetimerIICFifo setDelegate:](self->_fifo, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.fifo_delegate"), self->_name);
    WeakRetained = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(WeakRetained, "UTF8String"), 0);
    -[AppleTypeCRetimerIICFifo setDelegateQueue:](self->_fifo, "setDelegateQueue:", v9);

    v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    uarpSemaphore = self->_uarpSemaphore;
    self->_uarpSemaphore = v10;

    self->_uarpInitialized = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Failed to initialize UARP endpoint for %@"), self);
  }

  return v2;
}

- (void)firmwareBytesTransferred:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;

  v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: Update: %u%%"), v7, v4);

    self->_nextUpdateProgressReportPercentThreshold = v4 + 10;
  }
}

- (void)firmwareStagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == 1)
  {
    self->_stageSuccess = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: Firmware staging complete."), self->_name, v10, v11, v12, v13);
  }
  else
  {
    v6 = *(_QWORD *)&a4;
    v7 = *(_QWORD *)&a3;
    v8 = uarpProcessingStatusToString((unsigned __int16)a3);
    v9 = uarpProcessingFlagsToString((unsigned __int16)v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: Firmware staging failed. Status: 0x%08x (%s), Reason: 0x%08x (%s)"), self->_name, v7, v8, v6, v9);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
}

- (void)firmwareApplyCompleteWithStatus:(unsigned int)a3 flags:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    v6 = *(_QWORD *)&a3;
    v7 = uarpStatusCodeToString(a3);
    v8 = uarpProcessingFlagsToString((unsigned __int16)v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: Firmware apply failed. Status: 0x%08x (%s), Flags 0x%08x (%s)"), self->_name, v6, v7, v5, v8);

  }
  else
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "log:", CFSTR("%@: Firmware apply complete"), self->_name);

    self->_applySuccess = 1;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
}

- (void)setUarpChipCallbacks:(uarpChipCallbacks *)a3
{
  self->_uarpChipCallbacks = *a3;
}

- (void)setUarpContext:(void *)a3
{
  self->_uarpContext = (_UARPSiliconContext *)a3;
}

- (void)writeData:(id)a3
{
  -[AppleTypeCRetimerIICFifo writeData:](self->_fifo, "writeData:", a3);
}

- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4
{
  void (*fRestoreDataRecv)(_UARPSiliconContext *, AppleTypeCRetimerUARPUpdaterInstance *, uint64_t, uint64_t);
  _UARPSiliconContext *uarpContext;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_UARPSiliconContext *, AppleTypeCRetimerUARPUpdaterInstance *, uint64_t, uint64_t);

  fRestoreDataRecv = (void (*)(_UARPSiliconContext *, AppleTypeCRetimerUARPUpdaterInstance *, uint64_t, uint64_t))self->_uarpChipCallbacks.fRestoreDataRecv;
  if (fRestoreDataRecv)
  {
    uarpContext = self->_uarpContext;
    v10 = fRestoreDataRecv;
    v7 = objc_retainAutorelease(a4);
    v8 = objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");

    v10(uarpContext, self, v8, v9);
  }
}

- (void)appleTypeCRetimerIICFifoTransferError:(id)a3 error:(id)a4
{
  AppleTypeCRetimerUARPUpdaterInstanceDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "log:", CFSTR("%@: FIFO transfer error (%@)"), self->_name, v6);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
}

- (unsigned)routerID
{
  return self->_routerID;
}

- (BOOL)useLocalSigning
{
  return self->_useLocalSigning;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_panicStatus, 0);
  objc_storeStrong((id *)&self->_uarpSemaphore, 0);
  objc_storeStrong((id *)&self->_uarpQueue, 0);
  objc_storeStrong((id *)&self->_fifo, 0);
  objc_storeStrong((id *)&self->_dfuUpdater, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_ace, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
