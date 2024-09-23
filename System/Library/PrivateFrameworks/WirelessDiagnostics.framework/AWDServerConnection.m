@implementation AWDServerConnection

- (id)newMetricContainerWithIdentifier:(unsigned int)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
  return 0;
}

- (AWDServerConnection)initWithComponentId:(unsigned int)a3
{
  objc_super v5;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)AWDServerConnection;
  return -[AWDServerConnection init](&v5, sel_init);
}

- (AWDServerConnection)initWithComponentId:(unsigned int)a3 andBlockOnConfiguration:(BOOL)a4
{
  objc_super v6;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)AWDServerConnection;
  return -[AWDServerConnection init](&v6, sel_init);
}

- (BOOL)submitMetric:(id)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
  return 0;
}

- (BOOL)registerQueriableMetric:(unsigned int)a3 callback:(id)a4
{
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v5, 2u);
  }
  return 0;
}

- (BOOL)registerQueriableMetricCallback:(id)a3 forIdentifier:(unsigned int)a4
{
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v5, 2u);
  }
  return 0;
}

- (BOOL)registerConfigChangeCallback:(id)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
  return 0;
}

- (id)getComponentConfigurationParameters
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v3, 2u);
  }
  return 0;
}

- (void)registerComponentParametersChangeCallback:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v3, 2u);
  }
}

- (unint64_t)getAWDTimestamp
{
  _BOOL8 v2;
  uint8_t v4[16];

  v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
  return awd::getAWDTimestamp((awd *)v2);
}

- (void)flushToQueue:(dispatch_queue_s *)a3 block:(id)a4
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
}

@end
