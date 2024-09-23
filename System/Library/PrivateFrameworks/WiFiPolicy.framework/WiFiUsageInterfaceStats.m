@implementation WiFiUsageInterfaceStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

+ (id)statsForInterfaceName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_retainAutorelease(v4), objc_msgSend(v6, "UTF8String")))
  {
    objc_msgSend(a1, "_statsFromMIB:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v8)
        +[WiFiUsageInterfaceStats statsForInterfaceName:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      objc_msgSend(a1, "_statsFromNetIF:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_statsFromMIB:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  size_t size;
  int v37[4];
  int v38;
  unsigned int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  *(_OWORD *)v37 = xmmword_1CC50EDF0;
  v38 = 6;
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v39 = if_nametoindex(v7);
  size = 0;
  sysctl(v37, 6u, 0, &size, 0, 0);
  if (size)
  {
    v8 = malloc_type_malloc(size, 0xCB16AD62uLL);
    if (v8)
    {
      v9 = v8;
      if (sysctl(v37, 6u, v8, &size, 0, 0) < 0)
      {
        v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v27)
          +[WiFiUsageInterfaceStats _statsFromMIB:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      else
      {
        objc_msgSend(v5, "setTxBytes:", v9[13]);
        objc_msgSend(v5, "setRxBytes:", v9[12]);
        objc_msgSend(v5, "setTxL3Packets:", v9[9]);
        objc_msgSend(v5, "setRxL3Packets:", v9[7]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTimestamp:", v10);

      }
      free(v9);
    }
    else
    {
      v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v19)
        +[WiFiUsageInterfaceStats _statsFromMIB:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v11)
      +[WiFiUsageInterfaceStats _statsFromMIB:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  return v5;
}

- (void)setTxL3Packets:(unint64_t)a3
{
  self->_txL3Packets = a3;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRxL3Packets:(unint64_t)a3
{
  self->_rxL3Packets = a3;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (unint64_t)txL3Packets
{
  return self->_txL3Packets;
}

- (unint64_t)rxL3Packets
{
  return self->_rxL3Packets;
}

+ (id)_statsFromNetIF:(id)a3
{
  id v4;
  id v5;
  int v6;
  ifaddrs *v7;
  sockaddr *ifa_addr;
  unsigned int *ifa_data;
  const char *ifa_name;
  void *v11;
  ifaddrs *v13;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v13 = 0;
  objc_msgSend(v5, "setTxBytes:", 0);
  objc_msgSend(v5, "setRxBytes:", 0);
  if (v4)
  {
    v6 = getifaddrs(&v13);
    v7 = v13;
    if (!v6 && v13)
    {
      do
      {
        ifa_addr = v7->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18)
          {
            ifa_data = (unsigned int *)v7->ifa_data;
            if (ifa_data)
            {
              ifa_name = v7->ifa_name;
              if (ifa_name)
              {
                if (!strcmp(ifa_name, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String")))
                {
                  objc_msgSend(v5, "setTxBytes:", ifa_data[11]);
                  objc_msgSend(v5, "setRxBytes:", ifa_data[10]);
                  objc_msgSend(v5, "setTxL3Packets:", ifa_data[7]);
                  objc_msgSend(v5, "setRxL3Packets:", ifa_data[5]);
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setTimestamp:", v11);

                }
              }
            }
          }
        }
        v7 = v7->ifa_next;
      }
      while (v7);
      v7 = v13;
    }
    if (v7)
      MEMORY[0x1D17AC4C4](v7);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRxBytes:", -[WiFiUsageInterfaceStats rxBytes](self, "rxBytes"));
  objc_msgSend(v4, "setTxBytes:", -[WiFiUsageInterfaceStats txBytes](self, "txBytes"));
  objc_msgSend(v4, "setRxL3Packets:", -[WiFiUsageInterfaceStats rxL3Packets](self, "rxL3Packets"));
  objc_msgSend(v4, "setTxL3Packets:", -[WiFiUsageInterfaceStats txL3Packets](self, "txL3Packets"));
  -[WiFiUsageInterfaceStats timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimestamp:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("Rx: Packets=%lu "), -[WiFiUsageInterfaceStats rxL3Packets](self, "rxL3Packets"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Bytes=%lu "), -[WiFiUsageInterfaceStats rxBytes](self, "rxBytes"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Tx: Packets=%lu "), -[WiFiUsageInterfaceStats txL3Packets](self, "txL3Packets"));
  objc_msgSend(v6, "appendFormat:", CFSTR("Bytes=%lu "), -[WiFiUsageInterfaceStats txBytes](self, "txBytes"));
  -[WiFiUsageInterfaceStats timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Ts: %@>"), v7);

  return v6;
}

- (BOOL)isEqualToInterfaceStats:(id)a3
{
  id v4;
  unint64_t rxBytes;
  unint64_t txBytes;
  unint64_t rxL3Packets;
  unint64_t txL3Packets;
  BOOL v9;

  v4 = a3;
  rxBytes = self->_rxBytes;
  if (rxBytes == objc_msgSend(v4, "rxBytes")
    && (txBytes = self->_txBytes, txBytes == objc_msgSend(v4, "txBytes"))
    && (rxL3Packets = self->_rxL3Packets, rxL3Packets == objc_msgSend(v4, "rxL3Packets")))
  {
    txL3Packets = self->_txL3Packets;
    v9 = txL3Packets == objc_msgSend(v4, "txL3Packets");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WiFiUsageInterfaceStats *v4;
  WiFiUsageInterfaceStats *v5;
  BOOL v6;

  v4 = (WiFiUsageInterfaceStats *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[WiFiUsageInterfaceStats isEqualToInterfaceStats:](self, "isEqualToInterfaceStats:", v5);

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: failed to get mib length.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: null reqBuf", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_statsFromMIB:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: sysctl failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)statsForInterfaceName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "%s: falling back to NetIF", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
