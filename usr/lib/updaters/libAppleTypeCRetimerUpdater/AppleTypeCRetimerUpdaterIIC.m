@implementation AppleTypeCRetimerUpdaterIIC

+ (id)getDeviceNames
{
  return IICGetDeviceNamesWithPrefix(CFSTR("atcrt"));
}

+ (id)getRouterIDs
{
  return AppleTypeCRetimerGetRouterIDsForIicPrefix(CFSTR("atcrt"));
}

- (AppleTypeCRetimerUpdaterIIC)initWithRouterID:(unsigned __int8)a3
{
  uint64_t v3;
  AppleTypeCRetimerUpdaterIIC *v4;
  os_log_t v5;
  OS_os_log *log;
  AppleTypeCRetimerIICDeviceHandle *v7;
  AppleTypeCRetimerIICDeviceHandle *v8;
  AppleTypeCRetimerIIC *v9;
  AppleTypeCRetimerIIC *iic;
  AppleTypeCRetimerUpdaterIIC *v11;
  NSObject *v12;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AppleTypeCRetimerUpdaterIIC;
  v4 = -[AppleTypeCRetimerUpdaterIIC init](&v14, sel_init);
  if (!v4)
    goto LABEL_4;
  v5 = os_log_create("com.apple.accessoryupdater.atcrt", "update");
  log = v4->_log;
  v4->_log = (OS_os_log *)v5;

  v7 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]([AppleTypeCRetimerIICDeviceHandle alloc], "initWithRouterID:namePrefix:", v3, CFSTR("atcrt"));
  if (v7)
  {
    v8 = v7;
    v9 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]([AppleTypeCRetimerIIC alloc], "initWithDeviceHandle:", v7);
    iic = v4->_iic;
    v4->_iic = v9;

    -[AppleTypeCRetimerIIC setDelegate:](v4->_iic, "setDelegate:", v4);
LABEL_4:
    v11 = v4;
    goto LABEL_8;
  }
  v12 = v4->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerUpdaterIIC initWithRouterID:].cold.1(v3, v12);
  v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)updateWithFTAB:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  void *v7;
  void *v8;
  void *v9;
  AppleTypeCRetimerIIC *iic;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bverString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v30 = 138412290;
      v31 = v5;
      _os_log_impl(&dword_24BC99000, log, OS_LOG_TYPE_INFO, "Updating to version: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  objc_msgSend(v4, "subfileWithTag:", CFSTR("rkos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v8, "removeSubfileWithTag:", CFSTR("rrko"));
    objc_msgSend(v8, "writeToData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    iic = self->_iic;
    v11 = objc_retainAutorelease(v9);
    v12 = -[AppleTypeCRetimerIIC transferFirmware:length:](iic, "transferFirmware:length:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    if (!v12)
    {
      v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }

  }
  else
  {
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    v12 = 0;
  }

  return v12;
}

- (void)performReset
{
  -[AppleTypeCRetimerIIC performReset](self->_iic, "performReset");
}

- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bytesSent:bytesTotal:", v5, v4);

}

- (NSString)bverString
{
  return -[AppleTypeCRetimerIICBase bverString](self->_iic, "bverString");
}

- (NSString)internalFirmwareVersion
{
  return -[AppleTypeCRetimerIICBase internalFirmwareVersion](self->_iic, "internalFirmwareVersion");
}

- (BOOL)startPacketDumperWithFileName:(id)a3
{
  return -[AppleTypeCRetimerIIC startPacketDumperWithFileName:](self->_iic, "startPacketDumperWithFileName:", a3);
}

- (id)queryHardwareID:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryHardwareID:](self->_iic, "queryHardwareID:", a3);
}

- (id)queryChipInfo:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryChipInfo:](self->_iic, "queryChipInfo:", a3);
}

- (id)queryPanicStatus:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryRetimerPanicStatus:](self->_iic, "queryRetimerPanicStatus:", a3);
}

- (AppleTypeCRetimerUpdaterIICDelegate)delegate
{
  return (AppleTypeCRetimerUpdaterIICDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_iic, 0);
}

- (void)initWithRouterID:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24BC99000, a2, OS_LOG_TYPE_ERROR, "Failed to locate retimer for router ID %u", (uint8_t *)v2, 8u);
}

- (void)updateWithFTAB:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Unable to locate rkos image", a5, a6, a7, a8, 2u);
}

- (void)updateWithFTAB:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s: Update failed", a5, a6, a7, a8, 2u);
}

@end
