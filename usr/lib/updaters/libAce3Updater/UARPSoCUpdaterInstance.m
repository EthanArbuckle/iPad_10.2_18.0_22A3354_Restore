@implementation UARPSoCUpdaterInstance

- (UARPSoCUpdaterInstance)initWithHelper:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  UARPSoCUpdaterInstance *v9;
  UARPSoCUpdaterInstance *v10;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *initUARPSemaphore;
  dispatch_semaphore_t v13;
  OS_dispatch_semaphore *assetTransferUARPSemaphore;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *applyAssetUARPSemaphore;
  NSDictionary *tssRequest;
  NSString *tssRequestServerURL;
  NSString *manifestPrefixName;
  NSString *ticketLongName;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  UARPSoCUpdaterInstance *v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)UARPSoCUpdaterInstance;
  v9 = -[UARPSoCUpdaterInstance init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_log, a3);
    v11 = dispatch_semaphore_create(0);
    initUARPSemaphore = v10->_initUARPSemaphore;
    v10->_initUARPSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_semaphore_create(0);
    assetTransferUARPSemaphore = v10->_assetTransferUARPSemaphore;
    v10->_assetTransferUARPSemaphore = (OS_dispatch_semaphore *)v13;

    v15 = dispatch_semaphore_create(0);
    applyAssetUARPSemaphore = v10->_applyAssetUARPSemaphore;
    v10->_applyAssetUARPSemaphore = (OS_dispatch_semaphore *)v15;

    v10->_updaterMode = SoCUpdaterGetMode(v8);
    v10->_uarpContext = 0;
    v10->_isDone = 0;
    tssRequest = v10->_tssRequest;
    v10->_tssRequest = 0;

    tssRequestServerURL = v10->_tssRequestServerURL;
    v10->_tssRequestServerURL = 0;

    v10->_pAssetContext = 0;
    v10->_endpoint = 0;
    manifestPrefixName = v10->_manifestPrefixName;
    v10->_manifestPrefixName = 0;

    ticketLongName = v10->_ticketLongName;
    v10->_ticketLongName = 0;

    v10->_requiresPersonalization = 0;
    v10->_logicUnitNumberFromDevice = -1;
    *(_WORD *)&v10->_prefixNeedsLogicalUnitNumber = 0;
    v10->_skipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
    if (!-[UARPSoCUpdaterInstance uarpRestoreInitOptions](v10, "uarpRestoreInitOptions")
      || !-[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks](v10, "uarpRestoreLayer4Callbacks")
      || !-[UARPSoCUpdaterInstance uarpRestoreQueueName](v10, "uarpRestoreQueueName"))
    {
      v24 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.queue"), -[UARPSoCUpdaterInstance uarpRestoreQueueName](v10, "uarpRestoreQueueName"));
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v22;

  }
  v24 = v10;
LABEL_8:

  return v24;
}

- (UARPSoCUpdaterInstance)initWithLogicUnitNumber:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  UARPSoCUpdaterInstance *v6;
  id *p_isa;
  UARPSoCUpdaterInstance *v8;

  v6 = -[UARPSoCUpdaterInstance initWithHelper:options:](self, "initWithHelper:options:", a4, a5);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_logicUnitNumber = a3;
    v6->_routerID = -1;
    if (!-[UARPSoCUpdaterInstance initUARPRestoreQueryInfo](v6, "initUARPRestoreQueryInfo"))
    {
      objc_msgSend(p_isa[20], "log:", CFSTR("%s: Failed to init Restore UARP Query Info."), "-[UARPSoCUpdaterInstance initWithLogicUnitNumber:helper:options:]");
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(p_isa, "printUpdaterMode");
  }
  v8 = p_isa;
LABEL_6:

  return v8;
}

- (UARPSoCUpdaterInstance)initWithRouterID:(unsigned __int8)a3 helper:(id)a4 options:(id)a5
{
  UARPSoCUpdaterInstance *v6;
  id *p_isa;
  UARPSoCUpdaterInstance *v8;

  v6 = -[UARPSoCUpdaterInstance initWithHelper:options:](self, "initWithHelper:options:", a4, a5);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_routerID = a3;
    v6->_logicUnitNumber = -1;
    if (!-[UARPSoCUpdaterInstance initUARPRestoreQueryInfo](v6, "initUARPRestoreQueryInfo"))
    {
      objc_msgSend(p_isa[20], "log:", CFSTR("%s: Failed to init Restore UARP Query Info."), "-[UARPSoCUpdaterInstance initWithRouterID:helper:options:]");
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(p_isa, "printUpdaterMode");
  }
  v8 = p_isa;
LABEL_6:

  return v8;
}

- (BOOL)receievePersonalizationRequestByOfferFirmwareData:(id)a3
{
  SoCUpdaterHelper *log;
  id v5;
  NSDictionary *tssRequest;
  NSString *tssRequestServerURL;
  SoCUpdaterHelper *v8;
  void *v9;
  SoCUpdaterHelper *v10;
  void *v11;
  SoCUpdaterHelper *v12;
  void *v13;
  NSDictionary *v14;

  log = self->_log;
  v5 = a3;
  -[SoCUpdaterHelper verboseLog:](log, "verboseLog:", CFSTR("%s: data = %@"), "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]", v5);
  tssRequest = self->_tssRequest;
  self->_tssRequest = 0;

  tssRequestServerURL = self->_tssRequestServerURL;
  self->_tssRequestServerURL = 0;

  self->_pAssetContext = 0;
  self->_endpoint = 0;
  v8 = self->_log;
  -[UARPSoCUpdaterInstance name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SoCUpdaterHelper log:](v8, "log:", CFSTR("%s: %@ Offering Firmware"), "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]", v9);

  LOBYTE(v8) = -[UARPSoCUpdaterInstance initUARPWithFirmware:](self, "initUARPWithFirmware:", v5);
  if ((v8 & 1) != 0)
  {
    self->_stagingResult = 0;
    v10 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v10, "log:", CFSTR("%@: Waiting for staging to complete..."), v11);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTransferUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v12 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v12, "log:", CFSTR("%@: Continuing after staging."), v13);

    v14 = self->_tssRequest;
    if (v14)
    {
LABEL_5:
      -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Success. tssOptions:%@, tssServer:%@ "), "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]", v14, self->_tssRequestServerURL);
      return self->_stagingResult;
    }
    if (-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
    {
      v14 = self->_tssRequest;
      goto LABEL_5;
    }
    -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Failed to receive tssOptions."), "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]");
  }
  else
  {
    -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Failed to init Restore UARP."), "-[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:]");
  }
  return 0;
}

- (BOOL)offerFirmwareData:(id)a3
{
  return self->_tssRequest
      || -[UARPSoCUpdaterInstance receievePersonalizationRequestByOfferFirmwareData:](self, "receievePersonalizationRequestByOfferFirmwareData:", a3);
}

- (BOOL)offerPersonalizationResponse:(id)a3
{
  const __CFDictionary *v4;
  NSDictionary *tssRequest;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *v10;
  SoCUpdaterHelper *log;
  void *v12;
  SoCUpdaterHelper *v13;
  void *v14;
  BOOL v15;

  v4 = (const __CFDictionary *)a3;
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Tss Response: %@"), "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]", v4);
  if (-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
  {
    -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Local Signing is enabled, no personalization data expected."), "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
  }
  else
  {
    if (!v4 && !-[UARPSoCUpdaterInstance useLocalSigning](self, "useLocalSigning"))
    {
      -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Personalization data is expected but empty."), "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
      v15 = 0;
      goto LABEL_7;
    }
    tssRequest = self->_tssRequest;
    -[SoCUpdaterHelper log:](self->_log, "log:", CFSTR("%s: Offering Tss Response"), "-[UARPSoCUpdaterInstance offerPersonalizationResponse:]");
    CoreUARPRestorePersonalizationTssResponse((uint64_t)self->_endpoint, (uint64_t)self->_pAssetContext, (int)tssRequest, v4, v6, v7, v8, v9);
    v10 = self->_tssRequest;
    self->_tssRequest = 0;

    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", CFSTR("%@: Waiting for TSS offer to complete..."), v12);

    dispatch_semaphore_wait((dispatch_semaphore_t)self->_assetTransferUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v13 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v13, "log:", CFSTR("%@: Continuing after TSS offer."), v14);

  }
  v15 = 1;
LABEL_7:

  return v15;
}

- (BOOL)applyStagedFirmware
{
  void *v3;
  void *v4;
  SoCUpdaterHelper *log;

  -[UARPSoCUpdaterInstance log](self, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "verboseLog:", CFSTR("%s"), "-[UARPSoCUpdaterInstance applyStagedFirmware]");

  self->_isDone = self->_tssRequest == 0;
  if (-[UARPSoCUpdaterInstance skipApplyStage](self, "skipApplyStage"))
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verboseLog:", CFSTR("%s: Skipping Apply for Updater(LUN:%d,RouterID:%d)"), "-[UARPSoCUpdaterInstance applyStagedFirmware]", -[UARPSoCUpdaterInstance logicUnitNumber](self, "logicUnitNumber"), -[UARPSoCUpdaterInstance routerID](self, "routerID"));

    return 1;
  }
  log = self->_log;
  if (self->_uarpContext)
  {
    -[SoCUpdaterHelper log:](log, "log:", CFSTR("%s: Applying Staged Assets"), "-[UARPSoCUpdaterInstance applyStagedFirmware]");
    UarpRestoreApplyStagedAssets((dispatch_queue_t *)self->_uarpContext);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_applyAssetUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", CFSTR("%s: Success."), "-[UARPSoCUpdaterInstance applyStagedFirmware]");
    return 1;
  }
  -[SoCUpdaterHelper log:](log, "log:", CFSTR("%s: There is no asset to apply."), "-[UARPSoCUpdaterInstance applyStagedFirmware]");
  return 0;
}

- (NSDictionary)personalizationRequestDict
{
  return self->_tssRequest;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)initUARPComplete
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initUARPSemaphore);
}

- (void)assetTransferUARPComplete
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_assetTransferUARPSemaphore);
}

- (void)applyAssetComplete
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_applyAssetUARPSemaphore);
}

- (void)tssRequestWithOptions:(id)a3 serverURL:(id)a4 assetCtx:(void *)a5 siliconCtx:(_UARPSiliconContext *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _uarpRestoreEndpoint *var4;
  NSDictionary *v15;
  NSDictionary *tssRequest;
  SoCUpdaterHelper *log;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = v19;
  if (v19)
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "log:", CFSTR("%s: Received Invalid tssOptions"), "-[UARPSoCUpdaterInstance tssRequestWithOptions:serverURL:assetCtx:siliconCtx:]");

    v11 = v19;
  }
  if (self->_tssRequest)
  {
    -[UARPSoCUpdaterInstance log](self, "log");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "log:", CFSTR("%s: Error: Multiple payload needs personalization"), "-[UARPSoCUpdaterInstance tssRequestWithOptions:serverURL:assetCtx:siliconCtx:]");

  }
  else
  {
    var4 = a6->var4;
    self->_pAssetContext = a5;
    self->_endpoint = var4;
    v15 = (NSDictionary *)objc_msgSend(v11, "copy");
    tssRequest = self->_tssRequest;
    self->_tssRequest = v15;

    objc_storeStrong((id *)&self->_tssRequestServerURL, a4);
    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", CFSTR("%@: TSS request signal waiting callbacks"), v18);

    self->_stagingResult = 1;
    -[UARPSoCUpdaterInstance assetTransferUARPComplete](self, "assetTransferUARPComplete");
  }

}

- (void)updateAppleProperty:(unsigned int)a3 siliconCtx:(_UARPSiliconContext *)a4
{
  NSString *v5;
  NSString *ticketLongName;
  NSString *v7;

  switch(a3)
  {
    case 0xEu:
      self->_prefixNeedsLogicalUnitNumber = UarpRestoreInfoPropertyPrefixNeedsLUN((uint64_t)a4) != 0;
      break;
    case 0xFu:
      self->_suffixNeedsLogicalUnitNumber = UarpRestoreInfoPropertySuffixNeedsLUN((uint64_t)a4) != 0;
      break;
    case 0x10u:
      self->_logicUnitNumberFromDevice = UarpRestoreInfoPropertyLogicalUnitNumber((uint64_t)a4);
      break;
    case 0x11u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", UarpRestoreInfoPropertyTicketLongName((uint64_t)a4));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      ticketLongName = self->_ticketLongName;
      self->_ticketLongName = v7;
      goto LABEL_8;
    case 0x12u:
      self->_requiresPersonalization = UarpRestoreInfoPropertyRequiresPersonalization((uint64_t)a4) != 0;
      break;
    default:
      if (a3 == 3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", UarpRestoreInfoPropertyManifestPrefix((uint64_t)a4));
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        ticketLongName = self->_manifestPrefixName;
        self->_manifestPrefixName = v5;
LABEL_8:

      }
      break;
  }
}

- (NSString)firmwareTagName
{
  uint64_t logicUnitNumberFromDevice;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  void *v8;

  logicUnitNumberFromDevice = self->_logicUnitNumberFromDevice;
  if (self->_prefixNeedsLogicalUnitNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), self->_manifestPrefixName, logicUnitNumberFromDevice);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_manifestPrefixName;
  }
  v5 = v4;
  if (self->_suffixNeedsLogicalUnitNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), self->_ticketLongName, logicUnitNumberFromDevice);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_ticketLongName;
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)ticketName
{
  uint64_t logicUnitNumberFromDevice;
  NSString *v4;
  NSString *v5;
  _BOOL4 suffixNeedsLogicalUnitNumber;
  __CFString *v7;
  void *v8;

  logicUnitNumberFromDevice = self->_logicUnitNumberFromDevice;
  if (self->_prefixNeedsLogicalUnitNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), self->_manifestPrefixName, logicUnitNumberFromDevice);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_manifestPrefixName;
  }
  v5 = v4;
  suffixNeedsLogicalUnitNumber = self->_suffixNeedsLogicalUnitNumber;
  v7 = CFSTR("Ticket");
  if (suffixNeedsLogicalUnitNumber)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), CFSTR("Ticket"), logicUnitNumberFromDevice);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)useLocalSigning
{
  return !self->_requiresPersonalization;
}

- (NSString)manifestPrefix
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_manifestPrefixName);
}

- (BOOL)skipApplyStage
{
  return 0;
}

- (void)uarpRestoreInitOptions
{
  void *v2;

  -[UARPSoCUpdaterInstance log](self, "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log:", CFSTR("%s: error subclass needs to override this property"), "-[UARPSoCUpdaterInstance uarpRestoreInitOptions]");

  return 0;
}

- (uarpRestoreLayer4Callbacks)uarpRestoreLayer4Callbacks
{
  void *v2;

  -[UARPSoCUpdaterInstance log](self, "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log:", CFSTR("%s: error subclass needs to override this property"), "-[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks]");

  return 0;
}

- (const)uarpRestoreQueueName
{
  void *v2;

  -[UARPSoCUpdaterInstance log](self, "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "log:", CFSTR("%s: error subclass needs to override this property"), "-[UARPSoCUpdaterInstance uarpRestoreQueueName]");

  return 0;
}

- (BOOL)initUARP
{
  uarpRestoreLayer4Callbacks *v2;
  uint64_t v4;
  _QWORD *v5;
  NSObject *queue;
  void *v7;
  _QWORD block[5];

  if (self->_uarpContext)
    goto LABEL_2;
  v2 = -[UARPSoCUpdaterInstance uarpRestoreInitOptions](self, "uarpRestoreInitOptions");
  if (v2)
  {
    v4 = (uint64_t)v2;
    v2 = -[UARPSoCUpdaterInstance uarpRestoreLayer4Callbacks](self, "uarpRestoreLayer4Callbacks");
    if (v2)
    {
      if (!v2->var9)
        v2->var9 = UARPSoCUpdaterLayer4UARPPropertyUpdate;
      if (!v2->var10)
        v2->var10 = UARPSoCUpdaterLayer4ApplePropertyUpdate;
      if (!v2->var11)
        v2->var11 = UARPSoCUpdaterLayer4PropertiesComplete;
      if (!v2->var5)
        v2->var5 = UARPSoCUpdaterStagingProgress;
      if (!v2->var6)
        v2->var6 = UARPSoCUpdaterStagingComplete;
      if (!v2->var7)
        v2->var7 = UARPSoCUpdaterApplyComplete;
      if (!v2->var8)
        v2->var8 = UARPSoCUpdaterFirmwareTssRequest;
      if (!v2->var13)
        v2->var13 = UARPSoCUpdaterFirmwareLogCommon;
      if (!v2->var14)
        v2->var14 = UARPSoCUpdaterFirmwareLogCommon;
      if (!v2->var15)
        v2->var15 = UARPSoCUpdaterFirmwareLogCommon;
      if (!v2->var16)
        v2->var16 = UARPSoCUpdaterFirmwareLogCommon;
      v5 = UarpRestoreInitializeEndpoint((uint64_t)self, v4, (uint64_t)v2, -[UARPSoCUpdaterInstance uarpRestoreQueueName](self, "uarpRestoreQueueName"));
      self->_uarpContext = v5;
      if (v5)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __34__UARPSoCUpdaterInstance_initUARP__block_invoke;
        block[3] = &unk_251CE12F0;
        block[4] = self;
        dispatch_async(queue, block);
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_initUARPSemaphore, 0xFFFFFFFFFFFFFFFFLL);
LABEL_2:
        LOBYTE(v2) = 1;
        return (char)v2;
      }
      -[UARPSoCUpdaterInstance log](self, "log");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "log:", CFSTR("%s: UarpRestoreInitializeEndpoint() returns NULL."), "-[UARPSoCUpdaterInstance initUARP]");

      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

uint64_t __34__UARPSoCUpdaterInstance_initUARP__block_invoke(uint64_t a1)
{
  return UarpRestoreInfoQueries(*(dispatch_queue_t **)(*(_QWORD *)(a1 + 32) + 48), 0, 0, &initUARP_applePropertyArray, 6);
}

- (BOOL)initUARPWithFirmware:(id)a3
{
  id v4;
  void *uarpContext;
  id v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v4 = a3;
  if (-[UARPSoCUpdaterInstance initUARP](self, "initUARP"))
  {
    uarpContext = self->_uarpContext;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    v14 = UarpRestoreStageFirmwareDataBuffer((uint64_t)uarpContext, v7, v8, v9, v10, v11, v12, v13);
    if (!(_DWORD)v14)
    {
      v17 = 1;
      goto LABEL_6;
    }
    v15 = v14;
    -[UARPSoCUpdaterInstance log](self, "log");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "log:", CFSTR("%s: UarpRestoreStageFirmwareDataBuffer() returns %u."), "-[UARPSoCUpdaterInstance initUARPWithFirmware:]", v15);

  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (void)printUpdaterMode
{
  SoCUpdaterHelper *log;
  id v4;

  log = self->_log;
  -[UARPSoCUpdaterInstance name](self, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SoCUpdaterHelper log:](log, "log:", CFSTR("%@: Detected updater mode %s"), v4, StringForSoCRestoreUpdateMode(self->_updaterMode));

}

- (const)namePrefix
{
  return "uarp";
}

- (id)name
{
  unsigned int logicUnitNumber;
  void *v4;
  const char *v5;
  NSString *v6;
  NSString *name;

  if (!self->_name)
  {
    if (self->_routerID == 255)
    {
      logicUnitNumber = self->_logicUnitNumber;
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = -[UARPSoCUpdaterInstance namePrefix](self, "namePrefix");
      if (logicUnitNumber == -1)
      {
        objc_msgSend(v4, "stringWithUTF8String:", v5);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%s[%u]"), v5, self->_logicUnitNumber);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s[%u]"), -[UARPSoCUpdaterInstance namePrefix](self, "namePrefix"), self->_routerID);
    }
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    name = self->_name;
    self->_name = v6;

  }
  return self->_name;
}

- (void)updateStagingProgressWithBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  unsigned int v4;
  SoCUpdaterHelper *log;
  void *v7;

  v4 = ((float)((float)a3 / (float)a4) * 100.0);
  self->_lastPercentComplete = v4;
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", CFSTR("%@ Update: %u%%"), v7, self->_lastPercentComplete);

    self->_nextUpdateProgressReportPercentThreshold = self->_lastPercentComplete + 10;
  }
}

- (void)stagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  SoCUpdaterHelper *log;
  void *v8;
  SoCUpdaterHelper *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  SoCUpdaterHelper *v13;
  void *v14;
  SoCUpdaterHelper *v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (self->_lastPercentComplete <= 0x63)
  {
    log = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](log, "log:", CFSTR("%@ Update: 100%%"), v8);

  }
  if ((_DWORD)v5 == 1)
  {
    v9 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v9, "log:", CFSTR("%@ Staging Complete"), v10);

    self->_stagingResult = 1;
  }
  else
  {
    v11 = uarpProcessingStatusToString((unsigned __int16)v5);
    v12 = uarpProcessingFlagsToString((unsigned __int16)v4);
    v13 = self->_log;
    -[UARPSoCUpdaterInstance name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoCUpdaterHelper log:](v13, "log:", CFSTR("%@: Firmware staging failed. Status: 0x%08x (%s), Reason: 0x%08x (%s)"), v14, v5, v11, v4, v12);

  }
  v15 = self->_log;
  -[UARPSoCUpdaterInstance name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SoCUpdaterHelper log:](v15, "log:", CFSTR("%@: staging complete signaling waiting callbacks"), v16);

  -[UARPSoCUpdaterInstance assetTransferUARPComplete](self, "assetTransferUARPComplete");
}

- (SoCUpdaterHelper)log
{
  return (SoCUpdaterHelper *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (unsigned)routerID
{
  return self->_routerID;
}

- (unsigned)logicUnitNumber
{
  return self->_logicUnitNumber;
}

- (unsigned)stagingStatus
{
  return self->_stagingStatus;
}

- (void)setStagingStatus:(unsigned int)a3
{
  self->_stagingStatus = a3;
}

- (unsigned)stagingStatusReason
{
  return self->_stagingStatusReason;
}

- (void)setStagingStatusReason:(unsigned int)a3
{
  self->_stagingStatusReason = a3;
}

- (unsigned)applyFlags
{
  return self->_applyFlags;
}

- (void)setApplyFlags:(unsigned int)a3
{
  self->_applyFlags = a3;
}

- (BOOL)skipSameVersion
{
  return self->_skipSameVersion;
}

- (int)updaterMode
{
  return self->_updaterMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_manifestPrefixName, 0);
  objc_storeStrong((id *)&self->_ticketLongName, 0);
  objc_storeStrong((id *)&self->_tssRequestServerURL, 0);
  objc_storeStrong((id *)&self->_tssRequest, 0);
  objc_storeStrong((id *)&self->_applyAssetUARPSemaphore, 0);
  objc_storeStrong((id *)&self->_assetTransferUARPSemaphore, 0);
  objc_storeStrong((id *)&self->_initUARPSemaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
