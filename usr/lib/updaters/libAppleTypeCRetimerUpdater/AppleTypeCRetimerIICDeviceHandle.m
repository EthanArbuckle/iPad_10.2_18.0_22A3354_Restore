@implementation AppleTypeCRetimerIICDeviceHandle

- (AppleTypeCRetimerIICDeviceHandle)initWithRouterID:(unsigned __int8)a3 namePrefix:(id)a4
{
  uint64_t v4;
  id v6;
  AppleTypeCRetimerIICDeviceHandle *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  NSString *serviceName;
  AppleTypeCRetimerIICDeviceHandle *v12;
  objc_super v14;

  v4 = a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AppleTypeCRetimerIICDeviceHandle;
  v7 = -[AppleTypeCRetimerIICDeviceHandle init](&v14, sel_init);
  if (!v7)
    goto LABEL_3;
  v8 = os_log_create("com.apple.accessoryupdater.atcrt", "retimer");
  log = v7->_log;
  v7->_log = (OS_os_log *)v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%u"), v6, v4);
  v10 = objc_claimAutoreleasedReturnValue();
  serviceName = v7->_serviceName;
  v7->_serviceName = (NSString *)v10;

  if (!-[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:](v7, "initIICServiceForRouterID:", v4))
    v12 = 0;
  else
LABEL_3:
    v12 = v7;

  return v12;
}

- (BOOL)initIICServiceForRouterID:(unsigned __int8)a3
{
  NSString **p_serviceName;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  kern_return_t v7;
  BOOL v8;
  io_connect_t connect;

  p_serviceName = &self->_serviceName;
  v5 = IOServiceNameMatching(-[NSString UTF8String](self->_serviceName, "UTF8String", a3));
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v5);
  *((_DWORD *)p_serviceName + 2) = MatchingService;
  if (MatchingService)
  {
    connect = 0;
    v7 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &connect);
    v8 = v7 == 0;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:].cold.2();
    }
    else
    {
      self->_connection = connect;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:].cold.1();
    return 0;
  }
  return v8;
}

- (void)dealloc
{
  io_object_t service;
  io_connect_t connection;
  objc_super v5;

  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    IOServiceClose(connection);
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AppleTypeCRetimerIICDeviceHandle;
  -[AppleTypeCRetimerIICDeviceHandle dealloc](&v5, sel_dealloc);
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v5;
  unsigned __int8 *outputStruct;
  kern_return_t v9;
  NSObject *log;
  size_t v12;
  unsigned __int8 inputStruct;

  v5 = *(_QWORD *)&a5;
  inputStruct = a3;
  v12 = a5 + 1;
  outputStruct = (unsigned __int8 *)malloc_type_calloc(v12, 1uLL, 0x9E64EDF1uLL);
  v9 = IOConnectCallMethod(self->_connection, 0, 0, 0, &inputStruct, 1uLL, 0, 0, outputStruct, &v12);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:].cold.2();
    goto LABEL_9;
  }
  if (*outputStruct >= v5)
  {
    memcpy(a4, outputStruct + 1, v5);
LABEL_9:
    free(outputStruct);
    return v9;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:].cold.1(outputStruct, v5, log);
  free(outputStruct);
  return -536870169;
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  kern_return_t v5;
  _BYTE *v10;

  if (a5 > 0xFF)
    return -536870206;
  v10 = malloc_type_calloc(a5 + 2, 1uLL, 0xA8F1F66AuLL);
  *v10 = a3;
  v10[1] = a5;
  memcpy(v10 + 2, a4, a5);
  v5 = IOConnectCallMethod(self->_connection, 0, 0, 0, v10, a5 + 2, 0, 0, 0, 0);
  if (v5 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[AppleTypeCRetimerIICDeviceHandle writeRegister:buffer:length:].cold.1();
  free(v10);
  return v5;
}

- (NSString)name
{
  return self->_serviceName;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)initIICServiceForRouterID:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_24BC99000, v0, OS_LOG_TYPE_ERROR, "%s: Unable to locate %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)initIICServiceForRouterID:.cold.2()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_24BC99000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to open connection to %@ (0x%08x)", (uint8_t *)v2, 0x1Cu);
}

- (void)readRegister:(unsigned __int8 *)a1 buffer:(uint64_t)a2 length:(NSObject *)a3 .cold.1(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[20];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:]";
  *(_DWORD *)&v3[14] = *a1;
  *(_WORD *)&v3[18] = 1024;
  OUTLINED_FUNCTION_0_0(&dword_24BC99000, a2, a3, "%s: Read %u bytes, expected %u", *(const char **)v3, (unint64_t)"-[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:]" >> 32, *(_DWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)readRegister:buffer:length:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_24BC99000, v0, OS_LOG_TYPE_ERROR, "%s: Read result 0x%08x", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)writeRegister:buffer:length:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  int v4;
  int v5;

  LODWORD(v3) = 136315650;
  OUTLINED_FUNCTION_1_0();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_0_0(&dword_24BC99000, v1, v2, "%s: Write result 0x%08x, length = %u", v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
