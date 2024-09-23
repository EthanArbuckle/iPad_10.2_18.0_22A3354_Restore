@implementation AppleTypeCRetimerDFU

- (AppleTypeCRetimerDFU)initWithRouterID:(unsigned __int8)a3 route:(unint64_t)a4 port:(unsigned int)a5 space:(unsigned int)a6 baudRate:(unsigned int)a7
{
  uint64_t v11;
  AppleTypeCRetimerDFU *v12;
  os_log_t v13;
  OS_os_log *log;
  ThunderboltInterface *v15;
  ThunderboltInterface *tbtInterface;
  dispatch_queue_t v17;
  OS_dispatch_queue *b2pQueue;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *b2pSemaphore;
  B2PEngine *v21;
  B2PEngine *b2p;
  AppleTypeCRetimerDFU *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v11 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AppleTypeCRetimerDFU;
  v12 = -[AppleTypeCRetimerDFU init](&v32, sel_init);
  if (!v12)
    goto LABEL_4;
  v13 = os_log_create("com.apple.accessoryupdater.atcrt", "dfu");
  log = v12->_log;
  v12->_log = (OS_os_log *)v13;

  v15 = -[ThunderboltInterface initWithRouterID:]([ThunderboltInterface alloc], "initWithRouterID:", v11);
  tbtInterface = v12->_tbtInterface;
  v12->_tbtInterface = v15;

  if (v12->_tbtInterface)
  {
    v17 = dispatch_queue_create("RT13 B2P Queue", 0);
    b2pQueue = v12->_b2pQueue;
    v12->_b2pQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_semaphore_create(0);
    b2pSemaphore = v12->_b2pSemaphore;
    v12->_b2pSemaphore = (OS_dispatch_semaphore *)v19;

    v21 = -[B2PEngine initWithDelegate:]([B2PEngine alloc], "initWithDelegate:", v12);
    b2p = v12->_b2p;
    v12->_b2p = v21;

    -[B2PEngine setMaxTransmitAttempts:](v12->_b2p, "setMaxTransmitAttempts:", 5);
    v12->_maxB2PFrameSize = 51;
    v12->_route = a4;
    v12->_port = a5;
    v12->_space = a6;
    v12->_baudRate = a7;
LABEL_4:
    v23 = v12;
    goto LABEL_8;
  }
  v24 = v12->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:].cold.1(v11, v24, v25, v26, v27, v28, v29, v30);
  v23 = 0;
LABEL_8:

  return v23;
}

- (BOOL)configReadForIndex:(unsigned int)a3 result:(unsigned int *)a4
{
  uint64_t v5;
  _BOOL4 v7;

  v5 = *(_QWORD *)&a3;
  v7 = -[ThunderboltInterface configReadForRoute:port:space:index:result:](self->_tbtInterface, "configReadForRoute:port:space:index:result:", self->_route, self->_port, self->_space, *(_QWORD *)&a3, a4);
  if (v7)
    -[ThunderboltPacketDumper dumpATCConfigRegisterRead:value:](self->_dumper, "dumpATCConfigRegisterRead:value:", v5, *a4);
  return v7;
}

- (BOOL)configReadMetadata:(unsigned int *)a3 opCode:(unsigned __int16)a4
{
  uint64_t v4;
  _BOOL4 v7;

  v4 = a4;
  v7 = -[ThunderboltInterface configReadForRoute:port:space:index:result:](self->_tbtInterface, "configReadForRoute:port:space:index:result:", self->_route, self->_port, self->_space, 25, a3);
  if (v7)
    -[ThunderboltPacketDumper dumpATCMetadataRead:opCode:](self->_dumper, "dumpATCMetadataRead:opCode:", *a3, v4);
  return v7;
}

- (BOOL)registerReadForVendorIndex:(unsigned int)a3 result:(unsigned int *)a4
{
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v8;

  v5 = *(_QWORD *)&a3;
  v7 = -[AppleTypeCRetimerDFU registerIndexForVendorIndex:](self, "registerIndexForVendorIndex:");
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 1);
  v8 = -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", v7, a4);
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 0);
  if (v8)
    -[ThunderboltPacketDumper dumpATCRegisterRead:value:](self->_dumper, "dumpATCRegisterRead:value:", v5, *a4);
  return v8;
}

- (BOOL)configWriteForIndex:(unsigned int)a3 value:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[ThunderboltInterface configWriteForRoute:port:space:index:value:](self->_tbtInterface, "configWriteForRoute:port:space:index:value:", self->_route, self->_port, self->_space, *(_QWORD *)&a3, *(_QWORD *)&a4);
  if (v7)
    -[ThunderboltPacketDumper dumpATCConfigRegisterWrite:value:](self->_dumper, "dumpATCConfigRegisterWrite:value:", v5, v4);
  return v7;
}

- (BOOL)configWriteMetadata:(unsigned int)a3 opCode:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v7;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[ThunderboltInterface configWriteForRoute:port:space:index:value:](self->_tbtInterface, "configWriteForRoute:port:space:index:value:", self->_route, self->_port, self->_space, 25, *(_QWORD *)&a3);
  if (v7)
    -[ThunderboltPacketDumper dumpATCMetadataWrite:opCode:](self->_dumper, "dumpATCMetadataWrite:opCode:", v5, v4);
  return v7;
}

- (BOOL)registerWriteForVendorIndex:(unsigned int)a3 value:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[AppleTypeCRetimerDFU registerIndexForVendorIndex:](self, "registerIndexForVendorIndex:");
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 1);
  v8 = -[AppleTypeCRetimerDFU configWriteForIndex:value:](self, "configWriteForIndex:value:", v7, v4);
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 0);
  if (v8)
    -[ThunderboltPacketDumper dumpATCRegisterWrite:value:](self->_dumper, "dumpATCRegisterWrite:value:", v5, v4);
  return v8;
}

- (BOOL)waitForCurrentRouterOperationToComplete:(unsigned int *)a3
{
  unsigned int v5;
  uint64_t v7;
  unsigned int v8;

  v8 = 0;
  -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 26, &v8);
  v5 = v8;
  if ((v8 & 0x80000000) != 0)
  {
    v7 = 500;
    while (1)
    {
      sleepMS(10);
      -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 26, &v8);
      v5 = v8;
      if ((v8 & 0x80000000) == 0)
        break;
      if (!--v7)
        return 0;
    }
  }
  if (a3)
    *a3 = v5;
  return 1;
}

- (BOOL)performRouterOperationWithOpCode:(unsigned __int16)a3 metadata:(unsigned int *)a4 dWordBuffer:(unsigned int *)a5 dWordCount:(unsigned int)a6 returnStatus:(unsigned int *)a7
{
  _BOOL4 v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v17;

  if (a6 < 0x11)
  {
    v13 = a3;
    if (-[AppleTypeCRetimerDFU waitForCurrentRouterOperationToComplete:](self, "waitForCurrentRouterOperationToComplete:", 0))
    {
      if (-[AppleTypeCRetimerDFU configWriteMetadata:opCode:](self, "configWriteMetadata:opCode:", *a4, v13))
      {
        if (a6)
        {
          v14 = 0;
          while (-[AppleTypeCRetimerDFU configWriteForIndex:value:](self, "configWriteForIndex:value:", (v14 + 9), a5[v14]))
          {
            if (a6 == ++v14)
              goto LABEL_10;
          }
          v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.7();
            goto LABEL_36;
          }
        }
        else
        {
LABEL_10:
          v17 = v13 | 0x80000000;
          if (-[AppleTypeCRetimerDFU configWriteForIndex:value:](self, "configWriteForIndex:value:", 26))
          {
            if (-[AppleTypeCRetimerDFU waitForCurrentRouterOperationToComplete:](self, "waitForCurrentRouterOperationToComplete:", &v17))
            {
              if ((v17 & 0x40000000) != 0)
              {
                v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
                if (v9)
                {
                  -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.4();
                  goto LABEL_36;
                }
              }
              else
              {
                *a7 = HIBYTE(v17) & 0x3F;
                if (-[AppleTypeCRetimerDFU configReadMetadata:opCode:](self, "configReadMetadata:opCode:", a4, v13))
                {
                  LOBYTE(v9) = 1;
                  if ((_DWORD)v13 != 32770 && a6)
                  {
                    v15 = 0;
                    while (-[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", (v15 + 9), a5))
                    {
                      ++v15;
                      ++a5;
                      LOBYTE(v9) = 1;
                      if (a6 == v15)
                        return v9;
                    }
                    v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
                    if (v9)
                    {
                      -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.2();
                      goto LABEL_36;
                    }
                  }
                }
                else
                {
                  v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
                  if (v9)
                  {
                    -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.3();
                    goto LABEL_36;
                  }
                }
              }
            }
            else
            {
              v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
              if (v9)
              {
                -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.5();
                goto LABEL_36;
              }
            }
          }
          else
          {
            v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
            if (v9)
            {
              -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.6();
              goto LABEL_36;
            }
          }
        }
      }
      else
      {
        v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.8();
          goto LABEL_36;
        }
      }
    }
    else
    {
      v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.9();
        goto LABEL_36;
      }
    }
  }
  else
  {
    v9 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.1();
LABEL_36:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)pingChip
{
  void *v2;
  BOOL v3;

  -[AppleTypeCRetimerDFU sendPingCommand](self, "sendPingCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)queryChipIdentification
{
  B2PIdentificationResponse *v3;
  B2PIdentificationResponse *idResponse;

  -[AppleTypeCRetimerDFU sendIdentificationCommand](self, "sendIdentificationCommand");
  v3 = (B2PIdentificationResponse *)objc_claimAutoreleasedReturnValue();
  idResponse = self->_idResponse;
  self->_idResponse = v3;

  return self->_idResponse != 0;
}

- (BOOL)queryManifestForFTAB:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSData *v10;
  id WeakRetained;
  void *v12;
  NSData *manifestData;
  NSData *v14;
  _BOOL4 v15;
  NSObject *log;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v4, "manifest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dataPointer");
    objc_msgSend(v4, "manifest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataWithBytes:length:", v8, objc_msgSend(v9, "dataLength"));
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    manifestData = self->_manifestData;
    self->_manifestData = v10;
    v14 = v10;

    LOBYTE(v15) = 1;
    return v15;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[B2PIdentificationResponse hardwareID](self->_idResponse, "hardwareID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "generateManifestForFTAB:hardwareID:apParameters:", v4, v12, 0);
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
  log = self->_log;
  v15 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    -[AppleTypeCRetimerDFU queryManifestForFTAB:].cold.1(log, v17, v18, v19, v20, v21, v22, v23);
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)dataTransferUpdateForBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4 sessionID:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  if (a5 == 5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "manifestBytesSent:bytesTotal:", v6, v5);
  }
  else
  {
    if (a5 != 4)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dfuImageBytesSent:bytesTotal:", v6, v5);
  }

}

- (BOOL)transferDataBuffer:(const char *)a3 length:(unsigned int)a4 sessionID:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  unsigned int maxB2PFrameSize;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *log;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  -[AppleTypeCRetimerDFU dataTransferUpdateForBytesSent:bytesTotal:sessionID:](self, "dataTransferUpdateForBytesSent:bytesTotal:sessionID:", 0);
  if (!(_DWORD)v6)
    return 1;
  LODWORD(v9) = 0;
  v10 = v6;
  while (1)
  {
    maxB2PFrameSize = self->_maxB2PFrameSize;
    v12 = v10 >= maxB2PFrameSize ? maxB2PFrameSize : v10;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerDFU sendDataSessionDataCommandForSessionID:status:data:](self, "sendDataSessionDataCommandForSessionID:status:data:", v5, 0, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      break;
    v15 = (void *)v14;
    v10 -= v12;
    a3 += v12;
    v9 = (v12 + v9);
    -[AppleTypeCRetimerDFU dataTransferUpdateForBytesSent:bytesTotal:sessionID:](self, "dataTransferUpdateForBytesSent:bytesTotal:sessionID:", v9, v6, v5);

    if (!v10)
      return 1;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:].cold.1(log, v18, v19, v20, v21, v22, v23, v24);

  return 0;
}

- (BOOL)b2pDataSessionOpenForSessionID:(unsigned __int8)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:](self, "sendDataSessionConnectCommandForSessionID:state:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "state") != 1)
  {
    stringForB2PDataSessionID(v3);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:].cold.1();
    goto LABEL_6;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)sendDFUImage:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  id v7;

  v4 = *(_QWORD *)&a4;
  LODWORD(v7) = -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:](self, "b2pDataSessionOpenForSessionID:", 4);
  if ((_DWORD)v7)
  {
    LODWORD(v7) = -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:](self, "transferDataBuffer:length:sessionID:", a3, v4, 4);
    if ((_DWORD)v7)
    {
      v7 = -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:](self, "sendDataSessionConnectCommandForSessionID:state:", 4, 0);
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (BOOL)sendManifest
{
  id v3;

  LODWORD(v3) = -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:](self, "b2pDataSessionOpenForSessionID:", 5);
  if ((_DWORD)v3)
  {
    LODWORD(v3) = -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:](self, "transferDataBuffer:length:sessionID:", -[NSData bytes](self->_manifestData, "bytes"), -[NSData length](self->_manifestData, "length"), 5);
    if ((_DWORD)v3)
    {
      v3 = -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:](self, "sendDataSessionConnectCommandForSessionID:state:", 5, 0);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (BOOL)dfuValidate
{
  B2PDFUValidateCommand *v3;
  void *v4;
  void *v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v3 = objc_alloc_init(B2PDFUValidateCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "status"))
  {
    v14 = 1;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU dfuValidate].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }

  return v14;
}

- (BOOL)dfuBoot
{
  B2PDFUBootCommand *v3;
  void *v4;
  void *v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v3 = objc_alloc_init(B2PDFUBootCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "status"))
  {
    v14 = 1;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU dfuBoot].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    v14 = 0;
  }

  return v14;
}

- (AppleTypeCRetimerDFU)dfuWithFTAB:(id)a3 forcePersonalize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *log;
  void *v9;
  id v10;
  AppleTypeCRetimerDFU *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "bverString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:].cold.2((uint64_t)v7, log);
  }
  objc_msgSend(v6, "subfileWithTag:", CFSTR("rrko"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_20;
  }
  if (!-[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated](self, "verifyRouterIsNotEnumerated")
    || !-[AppleTypeCRetimerDFU findBaseAddress](self, "findBaseAddress")
    || !-[AppleTypeCRetimerDFU enableUART](self, "enableUART")
    || (v10 = -[AppleTypeCRetimerDFU readData](self, "readData"),
        !-[AppleTypeCRetimerDFU pingChip](self, "pingChip"))
    || !-[AppleTypeCRetimerDFU queryChipIdentification](self, "queryChipIdentification")
    || (-[B2PIdentificationResponse securityMode](self->_idResponse, "securityMode") || v4)
    && !-[AppleTypeCRetimerDFU queryManifestForFTAB:](self, "queryManifestForFTAB:", v6)
    || !-[AppleTypeCRetimerDFU sendDFUImage:length:](self, "sendDFUImage:length:", objc_msgSend(v9, "dataPointer"), objc_msgSend(v9, "dataLength"))|| self->_manifestData && !-[AppleTypeCRetimerDFU sendManifest](self, "sendManifest")|| !-[AppleTypeCRetimerDFU dfuValidate](self, "dfuValidate"))
  {
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  v11 = (AppleTypeCRetimerDFU *)-[AppleTypeCRetimerDFU dfuBoot](self, "dfuBoot");
LABEL_21:

  return v11;
}

- (BOOL)findBaseAddress
{
  BOOL v3;
  unsigned int v4;
  int v6;
  unsigned int v7;

  v7 = 1;
  if (-[ThunderboltInterface findCapabilityForRoute:port:space:mask:value:offset:](self->_tbtInterface, "findCapabilityForRoute:port:space:mask:value:offset:", self->_route, self->_port, self->_space, 65280, 1280, &v7))
  {
    v6 = 0;
    v3 = -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", v7, &v6);
    if (v3)
    {
      v4 = v7;
      if (!HIBYTE(v6))
        v4 = v7 + 1;
      self->_dfuBaseAddress = v4;
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[AppleTypeCRetimerDFU findBaseAddress].cold.1();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU findBaseAddress].cold.2();
    return 0;
  }
  return v3;
}

- (BOOL)enableUART
{
  BOOL v3;

  v3 = -[AppleTypeCRetimerDFU registerWriteForVendorIndex:value:](self, "registerWriteForVendorIndex:value:", 15, (2 * self->_baudRate) | 1);
  if (!v3 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerDFU enableUART].cold.1();
  return v3;
}

- (unsigned)registerIndexForVendorIndex:(unsigned int)a3
{
  return self->_dfuBaseAddress + a3;
}

- (BOOL)verifyRouterIsNotEnumerated
{
  _BOOL4 v3;
  int v5;

  v5 = 0;
  if (!-[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 3, &v5))
  {
    v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    -[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated].cold.2();
    goto LABEL_9;
  }
  if (v5 < 0)
  {
    v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    -[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated].cold.1();
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (unsigned)bytesAvailableToRead
{
  unsigned int result;
  int v4;

  v4 = 0;
  if (-[AppleTypeCRetimerDFU registerReadForVendorIndex:result:](self, "registerReadForVendorIndex:result:", 17, &v4))
    return HIWORD(v4) & 0x7FFF;
  result = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
  if (result)
  {
    -[AppleTypeCRetimerDFU bytesAvailableToRead].cold.1();
    return 0;
  }
  return result;
}

- (unsigned)convertBytesToDword:(const char *)a3 length:(unsigned int)a4
{
  unsigned int result;

  if (!a4)
    return 0;
  result = *(unsigned __int8 *)a3;
  if (a4 != 1)
  {
    result |= *((unsigned __int8 *)a3 + 1) << 8;
    if (a4 >= 3)
    {
      result |= *((unsigned __int8 *)a3 + 2) << 16;
      if (a4 != 3)
        result |= *((unsigned __int8 *)a3 + 3) << 24;
    }
  }
  return result;
}

- (void)convertBytesToDwords:(const char *)a3 length:(unsigned int)a4 dWordBuffer:(unsigned int *)a5
{
  unsigned int v6;
  uint64_t v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      if (v6 >= 4)
        v9 = 4;
      else
        v9 = v6;
      *a5++ = -[AppleTypeCRetimerDFU convertBytesToDword:length:](self, "convertBytesToDword:length:", a3, v9);
      a3 += v9;
      v6 -= v9;
    }
    while (v6);
  }
}

- (BOOL)writeData:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *log;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  if (v5)
  {
    v9 = v7;
    *(_QWORD *)&v8 = 136315650;
    v24 = v8;
    while (1)
    {
      memset(v32, 0, sizeof(v32));
      v10 = v5 >= 0x40 ? 64 : v5;
      v25 = 0;
      -[AppleTypeCRetimerDFU convertBytesToDwords:length:dWordBuffer:](self, "convertBytesToDwords:length:dWordBuffer:", v9, v10, v32, v24);
      HIDWORD(v25) |= v10;
      if (!-[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:](self, "performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:", 32770, (char *)&v25 + 4, v32, 16, &v25))break;
      if (self->_dumper)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ThunderboltPacketDumper dumpATCRouterOperationWithOpCode:data:](self->_dumper, "dumpATCRouterOperationWithOpCode:data:", 32770, v11);

      }
      if ((_DWORD)v25)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[AppleTypeCRetimerDFU writeData:].cold.1();
        goto LABEL_20;
      }
      v12 = BYTE5(v25);
      if (BYTE5(v25) <= v10)
      {
        LODWORD(v10) = BYTE5(v25);
      }
      else
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          v27 = "-[AppleTypeCRetimerDFU writeData:]";
          v28 = 1024;
          v29 = v12;
          v30 = 1024;
          v31 = v10;
          _os_log_error_impl(&dword_24BC99000, log, OS_LOG_TYPE_ERROR, "%s: Wrote more bytes than asked! (%u > %u)", buf, 0x18u);
        }
      }
      v9 += v10;
      v5 -= v10;
      if (!v5)
        goto LABEL_15;
    }
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU writeData:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_20:
    v14 = 0;
  }
  else
  {
LABEL_15:
    self->_bytesSent += objc_msgSend(v6, "length");
    v14 = 1;
  }

  return v14;
}

- (id)readData
{
  void *v3;
  unsigned int v4;
  __int128 v5;
  uint64_t v6;
  int v7;
  NSObject *log;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  int v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  _OWORD v29[4];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AppleTypeCRetimerDFU bytesAvailableToRead](self, "bytesAvailableToRead");
  if (v4)
  {
    LODWORD(v6) = v4;
    *(_QWORD *)&v5 = 136315650;
    v20 = v5;
    while (1)
    {
      memset(v29, 0, sizeof(v29));
      v6 = v6 >= 0x40 ? 64 : v6;
      v21 = 0;
      v22 = v6;
      if (!-[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:](self, "performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:", 32771, &v22, v29, 16, &v21, v20))break;
      if (v21)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[AppleTypeCRetimerDFU readData].cold.1();
        goto LABEL_18;
      }
      v7 = BYTE1(v22);
      if (BYTE1(v22) <= v6)
      {
        v6 = BYTE1(v22);
      }
      else
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v24 = "-[AppleTypeCRetimerDFU readData]";
          v25 = 1024;
          v26 = v7;
          v27 = 1024;
          v28 = v6;
          _os_log_error_impl(&dword_24BC99000, log, OS_LOG_TYPE_ERROR, "%s: Read more bytes than asked! (%u > %u)", buf, 0x18u);
        }
      }
      -[AppleTypeCRetimerDFU convertDWordsToData:bytes:](self, "convertDWordsToData:bytes:", v29, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendData:", v9);
      -[ThunderboltPacketDumper dumpATCRouterOperationWithOpCode:data:](self->_dumper, "dumpATCRouterOperationWithOpCode:data:", 32771, v9);
      LODWORD(v6) = -[AppleTypeCRetimerDFU bytesAvailableToRead](self, "bytesAvailableToRead");

      if (!(_DWORD)v6)
        goto LABEL_18;
    }
    v10 = self->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU readData].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_18:
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)convertDwordToData:(unsigned int)a3 bytes:(unsigned int)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v10;
  char v11;
  char v12;
  char v13;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
  {
    v13 = a3;
    objc_msgSend(v6, "appendBytes:length:", &v13, 1);
    if (a4 != 1)
    {
      v12 = BYTE1(a3);
      objc_msgSend(v7, "appendBytes:length:", &v12, 1);
      if (a4 >= 3)
      {
        v11 = BYTE2(a3);
        objc_msgSend(v7, "appendBytes:length:", &v11, 1);
        if (a4 != 3)
        {
          v10 = HIBYTE(a3);
          objc_msgSend(v7, "appendBytes:length:", &v10, 1);
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)convertDWordsToData:(unsigned int *)a3 bytes:(unsigned int)a4
{
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (a4)
  {
    if (a4 >= 4)
      v8 = 4;
    else
      v8 = a4;
    v9 = *a3++;
    -[AppleTypeCRetimerDFU convertDwordToData:bytes:](self, "convertDwordToData:bytes:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v10);
    a4 -= v8;

  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sendB2PCommand:(id)a3 responseClass:(Class)a4
{
  id v5;
  void *v6;
  NSObject *log;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  B2PResponse *v15;
  NSObject *b2pQueue;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[5];
  id v29;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v5 = a3;
  v6 = v5;
  if (self->_b2pCommandInFlight)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:].cold.2(log, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    b2pQueue = self->_b2pQueue;
    v17 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke;
    block[3] = &unk_251CE3AF0;
    v32 = &v33;
    block[4] = self;
    v18 = v5;
    v31 = v18;
    dispatch_sync(b2pQueue, block);
    if (*((_BYTE *)v34 + 24))
    {
      dispatch_get_global_queue(0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke_11;
      v28[3] = &unk_251CE3B18;
      v28[4] = self;
      v29 = v18;
      dispatch_async(v19, v28);

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_b2pSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = self->_b2pResponse;
      else
        v15 = 0;

    }
    else
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:].cold.1((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);
      v15 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v15;
}

uint64_t __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "sendCommand:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    result = objc_msgSend(*(id *)(a1 + 40), "opCode");
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 66) = result;
  }
  return result;
}

uint64_t __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pollForB2PResponseForCommand:", *(_QWORD *)(a1 + 40));
}

- (void)pollForB2PResponseForCommand:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *b2pQueue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x24BDAC760];
  do
  {
    sleepMS(2);
    b2pQueue = self->_b2pQueue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke;
    block[3] = &unk_251CE3B40;
    block[4] = self;
    v7 = v4;
    v9 = v7;
    v10 = &v11;
    dispatch_sync(b2pQueue, block);
    LODWORD(b2pQueue) = *((unsigned __int8 *)v12 + 24);

  }
  while (!(_DWORD)b2pQueue);
  _Block_object_dispose(&v11, 8);

}

intptr_t __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke(uint64_t a1)
{
  intptr_t result;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 104))
  {
    objc_msgSend((id)result, "readData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) += objc_msgSend(v3, "length");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "receiveData:", v4);
    }

    result = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(result + 88))
  {
    if (!*(_BYTE *)(result + 104))
      return result;
    goto LABEL_9;
  }
  if (*(_BYTE *)(result + 104))
  {
LABEL_9:
    v5 = *(NSObject **)(result + 24);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    result = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(result + 64) = 0;
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 66) = 0;
  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (id)sendPingCommand
{
  B2PPingCommand *v3;
  void *v4;
  NSObject *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_alloc_init(B2PPingCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU sendPingCommand].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
  }

  return v4;
}

- (id)sendIdentificationCommand
{
  B2PIdentificationCommand *v3;
  void *v4;
  NSObject *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_alloc_init(B2PIdentificationCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU sendIdentificationCommand].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
  }

  return v4;
}

- (id)sendDataSessionConnectCommandForSessionID:(unsigned __int8)a3 state:(int)a4
{
  unsigned int v5;
  B2PDataSessionConnectCommand *v7;
  void *v8;

  v5 = a3;
  v7 = -[B2PDataSessionConnectCommand initWithSessionID:state:]([B2PDataSessionConnectCommand alloc], "initWithSessionID:state:", a3, *(_QWORD *)&a4);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    stringForB2PDataSessionID(v5);
    stringForB2PDataSessionState(a4);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:].cold.1();
  }

  return v8;
}

- (id)sendDataSessionDataCommandForSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  B2PDataSessionDataCommand *v9;
  void *v10;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = a5;
  v9 = -[B2PDataSessionDataCommand initWithSessionID:status:data:]([B2PDataSessionDataCommand alloc], "initWithSessionID:status:data:", v6, v5, v8);

  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queue
{
  return self->_b2pQueue;
}

- (void)receivedResponse:(id)a3
{
  id v5;
  BOOL v6;
  id v7;

  v5 = a3;
  if (self->_b2pCommandInFlight)
  {
    v7 = v5;
    v6 = self->_b2pOpCodeInFlight + 1 == objc_msgSend(v5, "opCode");
    v5 = v7;
    if (v6)
    {
      objc_storeStrong((id *)&self->_b2pResponse, a3);
      v5 = v7;
    }
  }

}

- (BOOL)receivedCommand:(id)a3
{
  NSObject *log;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerDFU receivedCommand:].cold.1(log, v4, v5, v6, v7, v8, v9, v10);
  return 0;
}

- (void)b2pReset:(int)a3
{
  self->_b2pReset = 1;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerDFU b2pReset:].cold.1();
}

- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4
{
  return 0;
}

- (id)queryHardwareID
{
  id v3;
  void *v4;

  if (-[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated](self, "verifyRouterIsNotEnumerated")
    && -[AppleTypeCRetimerDFU findBaseAddress](self, "findBaseAddress")
    && -[AppleTypeCRetimerDFU enableUART](self, "enableUART")
    && (v3 = -[AppleTypeCRetimerDFU readData](self, "readData"),
        -[AppleTypeCRetimerDFU queryChipIdentification](self, "queryChipIdentification")))
  {
    -[B2PIdentificationResponse hardwareID](self->_idResponse, "hardwareID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)aceInfo
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (AppleTypeCRetimerDFUDelegate)delegate
{
  return (AppleTypeCRetimerDFUDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)maxB2PFrameSize
{
  return self->_maxB2PFrameSize;
}

- (void)setMaxB2PFrameSize:(unsigned int)a3
{
  self->_maxB2PFrameSize = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_aceInfo, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_manifestData, 0);
  objc_storeStrong((id *)&self->_idResponse, 0);
  objc_storeStrong((id *)&self->_b2pResponse, 0);
  objc_storeStrong((id *)&self->_b2pSemaphore, 0);
  objc_storeStrong((id *)&self->_b2pQueue, 0);
  objc_storeStrong((id *)&self->_b2p, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tbtInterface, 0);
}

- (void)initWithRouterID:(uint64_t)a3 route:(uint64_t)a4 port:(uint64_t)a5 space:(uint64_t)a6 baudRate:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_24BC99000, a2, a3, "Failed to locate Thunderbolt interface for router ID %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_24BC99000, v0, v1, "Router Op: Dword buffer too large (%u)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_24BC99000, v0, v1, "Router Op: Failed to read data register %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Router Op: Failed to read metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_24BC99000, v0, v1, "Router Op: Router operation 0x%04x was not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_24BC99000, v0, v1, "Router Op: Timed out waiting for router operation 0x%04x to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Router Op: Failed to start operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_24BC99000, v0, v1, "Router Op: Failed to write to data register %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Router Op: Failed to write metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Router Op: Timed out waiting for prvious router operation processing to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)queryManifestForFTAB:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Failed to generate manifest.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)transferDataBuffer:(uint64_t)a3 length:(uint64_t)a4 sessionID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Failed to receive data response", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)b2pDataSessionOpenForSessionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_24BC99000, v0, v1, "%s: Failed to open %s data session", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)dfuValidate
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: DFU validation failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)dfuBoot
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: DFU boot failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)dfuWithFTAB:(uint64_t)a3 forcePersonalize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Unable to locate rrko image", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)dfuWithFTAB:(uint64_t)a1 forcePersonalize:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24BC99000, a2, OS_LOG_TYPE_DEBUG, "DFUing verson: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)findBaseAddress
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Failed to find vendor specific capability", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)enableUART
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Failed to enable UART", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyRouterIsNotEnumerated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Failed to read ROUTER_CS_3", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bytesAvailableToRead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "Failed to read ROUTER_CS_VCS_17", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_24BC99000, v0, v1, "%s: write operation returned %u", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)writeData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: write operation failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)readData
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: read operation failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendB2PCommand:(uint64_t)a3 responseClass:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_24BC99000, a2, a3, "%s: Failed to send %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendB2PCommand:(uint64_t)a3 responseClass:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Command in flight!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a2, a3, "Failed to receive response to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendPingCommand
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: No response received for ping command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendIdentificationCommand
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: No response received for ID command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)sendDataSessionConnectCommandForSessionID:state:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_24BC99000, v2, OS_LOG_TYPE_ERROR, "%s: No response received for data session connect command (session=%s, state=%s)", (uint8_t *)v3, 0x20u);
}

- (void)receivedCommand:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Receiving commands not supported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)b2pReset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "B2P has been reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
