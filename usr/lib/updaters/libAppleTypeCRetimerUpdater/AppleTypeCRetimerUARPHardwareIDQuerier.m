@implementation AppleTypeCRetimerUARPHardwareIDQuerier

- (AppleTypeCRetimerUARPHardwareIDQuerier)initWithDeviceHandle:(id)a3 captureFileName:(id)a4
{
  id v6;
  id v7;
  AppleTypeCRetimerUARPHardwareIDQuerier *v8;
  os_log_t v9;
  OS_os_log *log;
  void *v11;
  uint64_t v12;
  NSString *name;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *querySemaphore;
  uint64_t v16;
  NSData *nonce;
  AppleTypeCRetimerUARPHardwareIDQuerier *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AppleTypeCRetimerUARPHardwareIDQuerier;
  v8 = -[AppleTypeCRetimerUARPHardwareIDQuerier init](&v20, sel_init);
  if (!v8)
    goto LABEL_3;
  v9 = os_log_create("com.apple.accessoryupdater.atcrt", "uarp");
  log = v8->_log;
  v8->_log = (OS_os_log *)v9;

  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  name = v8->_name;
  v8->_name = (NSString *)v12;

  v14 = dispatch_semaphore_create(0);
  querySemaphore = v8->_querySemaphore;
  v8->_querySemaphore = (OS_dispatch_semaphore *)v14;

  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v16 = objc_claimAutoreleasedReturnValue();
  nonce = v8->_nonce;
  v8->_nonce = (NSData *)v16;

  v18 = 0;
  if (-[AppleTypeCRetimerUARPHardwareIDQuerier initUARPWithDeviceHandle:captureFileName:](v8, "initUARPWithDeviceHandle:captureFileName:", v6, v7))
  {
LABEL_3:
    v18 = v8;
  }

  return v18;
}

- (void)dealloc
{
  uint64_t *uarpContext;
  objc_super v4;

  -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
  uarpContext = (uint64_t *)self->_uarpContext;
  if (uarpContext)
  {
    UarpRestoreFinalizeEndpoint(uarpContext);
    self->_uarpContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppleTypeCRetimerUARPHardwareIDQuerier;
  -[AppleTypeCRetimerUARPHardwareIDQuerier dealloc](&v4, sel_dealloc);
}

- (id)queryHardwareID
{
  unsigned int v3;
  unsigned int v4;
  const char *v5;
  NSObject *log;
  AppleTypeCRetimerHardwareID *v7;
  AppleTypeCRetimerHardwareID *v9;
  uint64_t v10;
  _OWORD v11[2];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[AppleTypeCRetimerIICFifo checkReady](self->_fifo, "checkReady"))
  {
    v12 = 6;
    v11[0] = xmmword_24BCE04C0;
    v11[1] = unk_24BCE04D0;
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    v3 = UarpRestoreInfoQueries((dispatch_queue_t *)self->_uarpContext, 0, 0, v11, 9);
    if (!v3)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_querySemaphore, 0xFFFFFFFFFFFFFFFFLL);
      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      v9 = [AppleTypeCRetimerHardwareID alloc];
      LOBYTE(v10) = self->_chipRev;
      v7 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:](v9, "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:", LOWORD(self->_chipID), LOWORD(self->_boardID), LOBYTE(self->_securityEpoch), LOBYTE(self->_productionMode), LOBYTE(self->_securityMode), LOBYTE(self->_securityDomain), self->_ecid, self->_nonce, v10);
      return v7;
    }
    v4 = v3;
    -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
    v5 = uarpStatusCodeToString(v4);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerUARPHardwareIDQuerier queryHardwareID].cold.1((uint64_t)self, (uint64_t)v5, log);
  }
  v7 = 0;
  return v7;
}

- (BOOL)initUARPWithDeviceHandle:(id)a3 captureFileName:(id)a4
{
  id v6;
  void *v7;
  uint64_t *p_name;
  NSString *name;
  id v10;
  id v11;
  const char *v12;
  id v13;
  _QWORD *v14;
  AppleTypeCRetimerIICFifo *v15;
  AppleTypeCRetimerIICFifo *fifo;
  id v17;
  dispatch_queue_t v18;
  NSObject *log;
  _OWORD v21[8];
  uint64_t v22;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  p_name = (uint64_t *)&self->_name;
  name = self->_name;
  v10 = a4;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.%@.uarp.hw_id"), name);
  memset(&v21[6], 0, 32);
  v22 = 0;
  v21[5] = *(_OWORD *)&off_251CE53A8;
  v21[0] = xmmword_251CE5358;
  memset(&v21[1], 0, 64);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v13, "UTF8String");

  v14 = UarpRestoreInitializeEndpoint(0, (uint64_t)self, (uint64_t)v21, v12);
  if (v14)
  {
    v15 = -[AppleTypeCRetimerIICFifo initWithDeviceHandle:queueLabelSuffix:]([AppleTypeCRetimerIICFifo alloc], "initWithDeviceHandle:queueLabelSuffix:", v6, CFSTR("uarp_querier"));
    fifo = self->_fifo;
    self->_fifo = v15;

    -[AppleTypeCRetimerIICFifo setDelegate:](self->_fifo, "setDelegate:", self);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.%@.hw_id_fifo_delegate"), self->_name);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    -[AppleTypeCRetimerIICFifo setDelegateQueue:](self->_fifo, "setDelegateQueue:", v18);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerUARPHardwareIDQuerier initUARPWithDeviceHandle:captureFileName:].cold.1(p_name, log);
  }

  return v14 != 0;
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

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (void)setECID:(unint64_t)a3
{
  self->_ecid = a3;
}

- (void)setSecurityDomain:(unsigned int)a3
{
  self->_securityDomain = a3;
}

- (void)setSecurityMode:(unsigned int)a3
{
  self->_securityMode = a3;
}

- (void)setProductionMode:(unsigned int)a3
{
  self->_productionMode = a3;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void)setChipRev:(unsigned int)a3
{
  self->_chipRev = a3;
}

- (void)setSecurityEpoch:(unsigned int)a3
{
  self->_securityEpoch = a3;
}

- (void)queryComplete
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_querySemaphore);
}

- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4
{
  void (*fRestoreDataRecv)(_UARPSiliconContext *, AppleTypeCRetimerUARPHardwareIDQuerier *, uint64_t, uint64_t);
  _UARPSiliconContext *uarpContext;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_UARPSiliconContext *, AppleTypeCRetimerUARPHardwareIDQuerier *, uint64_t, uint64_t);

  fRestoreDataRecv = (void (*)(_UARPSiliconContext *, AppleTypeCRetimerUARPHardwareIDQuerier *, uint64_t, uint64_t))self->_uarpChipCallbacks.fRestoreDataRecv;
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
  id v5;
  NSObject *log;

  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerUARPHardwareIDQuerier appleTypeCRetimerIICFifoTransferError:error:].cold.1((uint64_t)self, (uint64_t)v5, log);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_querySemaphore);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_fifo, 0);
  objc_storeStrong((id *)&self->_querySemaphore, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)queryHardwareID
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 8);
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_24BC99000, a2, a3, "%@: Failed to start query (%s)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)initUARPWithDeviceHandle:(uint64_t *)a1 captureFileName:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_24BC99000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to initialize UARP endpoint for querying the hardware ID", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)appleTypeCRetimerIICFifoTransferError:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_24BC99000, a2, a3, "%@: HW ID Querier FIFO transfer error (%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

@end
