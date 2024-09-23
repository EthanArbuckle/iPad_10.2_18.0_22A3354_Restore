@implementation AppleTypeCRetimerUpdaterInstance

- (AppleTypeCRetimerUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  AppleTypeCRetimerUpdaterInstance *v9;
  AppleTypeCRetimerUpdaterInstance *v10;
  uint64_t v11;
  NSString *name;
  id WeakRetained;
  id v14;
  AppleTypeCRetimerUpdaterInstance *v15;
  AppleTypeCRetimerUpdaterIIC *iicUpdater;
  uint64_t v17;
  id v18;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id v20;
  id v22;
  objc_super v23;

  v5 = a5;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AppleTypeCRetimerUpdaterInstance;
  v9 = -[AppleTypeCRetimerUpdaterInstance init](&v23, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_13:
    v15 = v10;
    goto LABEL_14;
  }
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10->_routerID = a3;
  v10->_useLocalSigning = 1;
  if (-[AppleTypeCRetimerUpdaterInstance allocateACE](v10, "allocateACE")
    && -[AppleTypeCRetimerUpdaterInstance allocateUpdaterIIC](v10, "allocateUpdaterIIC"))
  {
    *(_QWORD *)&v10->_nextDFUFirmwareProgressReportPercentThreshold = 0xA0000000ALL;
    v10->_nextUpdateProgressReportPercentThreshold = 10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%u"), "atcrt", v10->_routerID);
    v11 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      objc_msgSend(WeakRetained, "log:", CFSTR("Updater instance forcing power on for %@"), v10->_name);

      if (-[ACE retimerForcePower](v10->_ace, "retimerForcePower"))
      {
        v14 = objc_loadWeakRetained((id *)&v10->_delegate);
        objc_msgSend(v14, "log:", CFSTR("Failed to force power on for %@ during Updater instance initialization"), v10->_name);

      }
      else
      {
        v10->_powerForced = 1;
        iicUpdater = v10->_iicUpdater;
        v22 = 0;
        -[AppleTypeCRetimerUpdaterIIC queryPanicStatus:](iicUpdater, "queryPanicStatus:", &v22);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v22;
        panicStatus = v10->_panicStatus;
        v10->_panicStatus = (AppleTypeCRetimerPanicStatus *)v17;

        if (!v10->_panicStatus)
        {
          v20 = objc_loadWeakRetained((id *)&v10->_delegate);
          objc_msgSend(v20, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUpdaterInstance initWithRouterID:delegate:forcePower:]", v10->_name, v18);

        }
      }
    }
    else
    {
      *(_WORD *)&v10->_powerForced = 257;
    }
    v10->_skipUpdates = 0;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_dfuUpdater)
    -[ACE retimerExitForceDFU](self->_ace, "retimerExitForceDFU");
  if (self->_powerForced)
    -[ACE retimerRemoveForcePower](self->_ace, "retimerRemoveForcePower");
  v3.receiver = self;
  v3.super_class = (Class)AppleTypeCRetimerUpdaterInstance;
  -[AppleTypeCRetimerUpdaterInstance dealloc](&v3, sel_dealloc);
}

- (id)queryHardwareID
{
  AppleTypeCRetimerUpdaterIIC *iicUpdater;
  void *v4;
  id v5;
  AppleTypeCRetimerUpdaterIIC *v6;
  AppleTypeCRetimerPanicStatus *v7;
  id v8;
  AppleTypeCRetimerPanicStatus *panicStatus;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v18;
  id v19;

  iicUpdater = self->_iicUpdater;
  v19 = 0;
  -[AppleTypeCRetimerUpdaterIIC queryHardwareID:](iicUpdater, "queryHardwareID:", &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v4)
    goto LABEL_2;
  v6 = self->_iicUpdater;
  v18 = 0;
  -[AppleTypeCRetimerUpdaterIIC queryPanicStatus:](v6, "queryPanicStatus:", &v18);
  v7 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  panicStatus = self->_panicStatus;
  self->_panicStatus = v7;

  if (!self->_panicStatus)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status"), "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", v11, v8);

  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "log:", CFSTR("%s: IIC hardware ID query failed for %@ (%@)."), "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", self, v5);

  if (!self->_dfuCheckHasRun
    || (v13 = objc_loadWeakRetained((id *)&self->_delegate),
        -[AppleTypeCRetimerUpdaterInstance name](self, "name"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "log:", CFSTR("%s: Falling back to DFU mode for %@."), "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", v14), v14, v13, !-[AppleTypeCRetimerUpdaterInstance allocateUpdaterDFU](self, "allocateUpdaterDFU")))
  {
LABEL_10:

    v4 = 0;
    goto LABEL_11;
  }
  -[AppleTypeCRetimerDFU queryHardwareID](self->_dfuUpdater, "queryHardwareID");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "log:", CFSTR("%s: Unable to query hardware ID in DFU mode for %@."), "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", self);

    goto LABEL_10;
  }
  v4 = (void *)v15;

LABEL_2:
  self->_skipUpdates = objc_msgSend(v4, "chipRev") == 0;
  self->_useLocalSigning = objc_msgSend(v4, "requiresPersonalization") ^ 1;
LABEL_11:

  return v4;
}

- (BOOL)generateFTABForData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  FTABFile *v13;
  AppleTypeCRetimerBoardIDFile *v14;
  FTABSubfile *v15;
  void *v16;
  void *v17;
  FTABSubfile *v18;
  void *v19;
  FTABSubfile *v20;
  void *v21;
  void *v22;
  FTABFile *v23;
  FTABFile *v24;
  void *ftab;
  id WeakRetained;
  id v28;
  unint64_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = -[FTABFile initWithData:]([FTABFile alloc], "initWithData:", v12);

  if (v13)
  {
    if (objc_msgSend(v10, "length"))
      -[FTABFile setManifest:](v13, "setManifest:", v10);
    v28 = v10;
    v14 = -[AppleTypeCRetimerBoardIDFile initWithBoardID:chipID:portNumber:securityDomain:]([AppleTypeCRetimerBoardIDFile alloc], "initWithBoardID:chipID:portNumber:securityDomain:", objc_msgSend(v11, "boardID"), (unsigned __int16)objc_msgSend(v11, "chipID"), self->_routerID, objc_msgSend(v11, "securityDomain"));
    v15 = [FTABSubfile alloc];
    -[AppleTypeCRetimerBoardIDFile tag](v14, "tag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerBoardIDFile data](v14, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[FTABSubfile initWithTag:data:](v15, "initWithTag:data:", v16, v17);

    v29 = a6;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v29, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[FTABSubfile initWithTag:data:]([FTABSubfile alloc], "initWithTag:data:", CFSTR("dbgb"), v19);
    v30[0] = v18;
    v30[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABFile addSubfiles:](v13, "addSubfiles:", v21);

    -[FTABFile writeToData](v13, "writeToData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FTABFile initWithData:]([FTABFile alloc], "initWithData:", v22);

    LOBYTE(v13) = v23 != 0;
    if (v23)
    {
      v24 = v23;
      ftab = self->_ftab;
      self->_ftab = v24;
    }
    else
    {
      ftab = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(ftab, "log:", CFSTR("Failed to parse updated FTAB data"));
    }

    v10 = v28;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Failed to parse FTAB file"));

  }
  return (char)v13;
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

- (BOOL)allocateUpdaterIIC
{
  AppleTypeCRetimerUpdaterIIC *v3;
  AppleTypeCRetimerUpdaterIIC *iicUpdater;
  AppleTypeCRetimerUpdaterIIC *v5;
  id WeakRetained;

  v3 = -[AppleTypeCRetimerUpdaterIIC initWithRouterID:]([AppleTypeCRetimerUpdaterIIC alloc], "initWithRouterID:", self->_routerID);
  iicUpdater = self->_iicUpdater;
  self->_iicUpdater = v3;

  v5 = self->_iicUpdater;
  if (v5)
  {
    -[AppleTypeCRetimerUpdaterIIC setDelegate:](self->_iicUpdater, "setDelegate:", self);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Unable to create IIC updater for %@"), self);

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
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Unable to create DFU updater for %@"), self);

  }
  return v5 != 0;
}

- (BOOL)checkForVersionMatch:(BOOL *)a3
{
  void *v5;
  void *WeakRetained;
  BOOL v7;
  id v8;

  -[FTABFile bverString](self->_ftab, "bverString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", CFSTR("Unable to locate bver in FTAB."));
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  -[AppleTypeCRetimerUpdaterIIC bverString](self->_iicUpdater, "bverString");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "log:", CFSTR("Unable to query chip Bver for %@"), self);

    goto LABEL_6;
  }
  *a3 = objc_msgSend(v5, "isEqualToString:", WeakRetained);
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)performUpdateForFTABData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7
{
  id v8;
  _BOOL4 v9;
  id WeakRetained;
  void *v12;
  char v13;

  if (!self->_skipUpdates)
  {
    v9 = a6;
    if (-[AppleTypeCRetimerUpdaterInstance generateFTABForData:manifestData:apHardwareID:debugFlags:](self, "generateFTABForData:manifestData:apHardwareID:debugFlags:", a3, a4, a5, a7)&& -[AppleTypeCRetimerUpdaterInstance allocateACE](self, "allocateACE")&& -[AppleTypeCRetimerUpdaterInstance allocateUpdaterIIC](self, "allocateUpdaterIIC"))
    {
      if (!self->_dfuUpdater)
      {
        if (v9)
        {
          v13 = 0;
          LODWORD(v8) = -[AppleTypeCRetimerUpdaterInstance checkForVersionMatch:](self, "checkForVersionMatch:", &v13);
          if (!(_DWORD)v8)
            return (char)v8;
          if (v13)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            -[AppleTypeCRetimerUpdaterInstance name](self, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "log:", CFSTR("Skipping update for %@ because it already has this firmware version."), v12);

            return (char)v8;
          }
        }
LABEL_15:
        LOBYTE(v8) = -[AppleTypeCRetimerUpdaterInstance performUpdateIIC](self, "performUpdateIIC");
        return (char)v8;
      }
      if (-[AppleTypeCRetimerUpdaterInstance performUpdateDFU](self, "performUpdateDFU"))
      {
        sleep(1u);
        goto LABEL_15;
      }
    }
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "log:", CFSTR("Skipping update for %@ because the retimer chip is deprecated."), self);

  LOBYTE(v8) = 1;
  return (char)v8;
}

- (BOOL)performUpdateDFU
{
  AppleTypeCRetimerUpdaterInstanceDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "log:", CFSTR("Performing DFU for %@"), v5);

  v6 = (int)-[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:](self->_dfuUpdater, "dfuWithFTAB:forcePersonalize:", self->_ftab, 0);
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = v7;
  if (v6)
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", CFSTR("DFU complete for %@"), v9);

  }
  else
  {
    objc_msgSend(v7, "log:", CFSTR("DFU failed for %@"), self);
  }

  return v6;
}

- (BOOL)shouldResetAfterUpdate
{
  return self->_dfuUpdater != 0;
}

- (BOOL)performUpdateIIC
{
  AppleTypeCRetimerUpdaterInstanceDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "log:", CFSTR("%s: Starting updating for %@"), "-[AppleTypeCRetimerUpdaterInstance performUpdateIIC]", v5);

  v6 = -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:](self->_iicUpdater, "updateWithFTAB:", self->_ftab);
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = v7;
  if (v6)
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "log:", CFSTR("Update complete for %@"), v9);

  }
  else
  {
    objc_msgSend(v7, "log:", CFSTR("%s: Update failed for %@"), "-[AppleTypeCRetimerUpdaterInstance performUpdateIIC]", self);
  }

  return v6;
}

- (void)performReset
{
  -[AppleTypeCRetimerUpdaterIIC performReset](self->_iicUpdater, "performReset");
}

- (void)printVersions
{
  void *v3;
  id WeakRetained;
  BOOL v5;
  void *v6;
  id v7;

  -[AppleTypeCRetimerUpdaterIIC bverString](self->_iicUpdater, "bverString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerUpdaterIIC internalFirmwareVersion](self->_iicUpdater, "internalFirmwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(WeakRetained, "log:", CFSTR("%s: Failed to query new firmware version for %@"), "-[AppleTypeCRetimerUpdaterInstance printVersions]", self);
  }
  else
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@ has new firmware version: %@ (%@)"), v6, v7, v3);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ panicState=%d assertID=%u>"), v4, -[AppleTypeCRetimerPanicStatus fwPanic](self->_panicStatus, "fwPanic"), -[AppleTypeCRetimerPanicStatus assertID](self->_panicStatus, "assertID"));
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
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: DFU firmware transfer: %u%%"), v7, v4);

    self->_nextDFUFirmwareProgressReportPercentThreshold = v4 + 10;
  }
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
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: DFU manifest transfer: %u%%"), v7, v4);

    self->_nextDFUManifestProgressReportPercentThreshold = v4 + 10;
  }
}

- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5
{
  return 0;
}

- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4;
  id WeakRetained;
  void *v7;

  v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "log:", CFSTR("%@: Update: %u%%"), v7, v4);

    self->_nextUpdateProgressReportPercentThreshold = v4 + 10;
  }
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
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_panicStatus, 0);
  objc_storeStrong((id *)&self->_dfuUpdater, 0);
  objc_storeStrong((id *)&self->_iicUpdater, 0);
  objc_storeStrong((id *)&self->_ace, 0);
  objc_storeStrong((id *)&self->_ftab, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
