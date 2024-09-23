@implementation _TVRCRapportDeviceRecord

- (_TVRCRapportDeviceRecord)initWithDevice:(id)a3
{
  id v5;
  _TVRCRapportDeviceRecord *v6;
  _TVRCRapportDeviceRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVRCRapportDeviceRecord;
  v6 = -[_TVRCRapportDeviceRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_transports = 0;
  }

  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[_TVRCRapportDeviceRecord device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[_TVRCRapportDeviceRecord device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addTransportForStatusFlag:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  _TVRCRapportDeviceRecord *v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = -[_TVRCRapportDeviceRecord _transportForStatusFlag:](self, "_transportForStatusFlag:", a3);
  if (v4)
  {
    v5 = v4;
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = self;
      v9 = 1024;
      v10 = (v5 >> 1) & 1;
      v11 = 1024;
      v12 = v5 & 1;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Adding transports for record=%@, WiFi=%{BOOL}d, BLE=%{BOOL}d", (uint8_t *)&v7, 0x18u);
    }

    self->_transports |= v5;
  }
}

- (void)removeTransportForStatusFlag:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  _TVRCRapportDeviceRecord *v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = -[_TVRCRapportDeviceRecord _transportForStatusFlag:](self, "_transportForStatusFlag:", a3);
  if (v4)
  {
    v5 = v4;
    _TVRCRapportLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = self;
      v9 = 1024;
      v10 = (v5 >> 1) & 1;
      v11 = 1024;
      v12 = v5 & 1;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Removing transports for record=%@, WiFi=%{BOOL}d, BLE=%{BOOL}d", (uint8_t *)&v7, 0x18u);
    }

    self->_transports &= ~v5;
  }
}

- (void)updateTransportsForStatusFlags:(unint64_t)a3
{
  char v3;
  NSObject *v5;

  v3 = a3;
  _TVRCRapportLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_TVRCRapportDeviceRecord updateTransportsForStatusFlags:].cold.1(v5);

  if ((v3 & 4) != 0)
    -[_TVRCRapportDeviceRecord addTransportForStatusFlag:](self, "addTransportForStatusFlag:", 4);
  if ((v3 & 2) != 0)
    -[_TVRCRapportDeviceRecord addTransportForStatusFlag:](self, "addTransportForStatusFlag:", 2);
}

- (BOOL)hasAvailableTransports
{
  return -[_TVRCRapportDeviceRecord transports](self, "transports") != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRCRapportDeviceRecord device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("device"));

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[_TVRCRapportDeviceRecord transports](self, "transports"), CFSTR("transports"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", (-[_TVRCRapportDeviceRecord transports](self, "transports") >> 1) & 1, CFSTR("WiFi"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[_TVRCRapportDeviceRecord transports](self, "transports") & 1, CFSTR("BLE"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[_TVRCRapportDeviceRecord hasAvailableTransports](self, "hasAvailableTransports"), CFSTR("hasAvailableTransports"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)_transportForStatusFlag:(unint64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 4);
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (unint64_t)transports
{
  return self->_transports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)updateTransportsForStatusFlags:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[_TVRCRapportDeviceRecord updateTransportsForStatusFlags:]";
  _os_log_debug_impl(&dword_21A51B000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
