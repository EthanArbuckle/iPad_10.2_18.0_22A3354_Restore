@implementation TSgPTPClock

- (TSgPTPClock)initWithImplDC:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[kernelClock isKindOfClass:[TSDCgPTPClock class]]";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPClock.m";
      v19 = 1024;
      v20 = 77;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPClock;
  v5 = -[TSKernelClock initWithImplDC:](&v8, sel_initWithImplDC_, v4);
  if (v5)
  {
    v6 = v4;
    self = (TSgPTPClock *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v6;
LABEL_4:

  }
  return (TSgPTPClock *)v5;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  return -[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:](self->_impl, "convertFrom32BitASToMachAbsoluteTime:", *(_QWORD *)&a3);
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCgPTPClock convertFrom32BitASTime:toMachAbsoluteTime:withCount:](self->_impl, "convertFrom32BitASTime:toMachAbsoluteTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  return -[TSDCgPTPClock gPTPTimeFromMachAbsoluteTime:](self->_impl, "gPTPTimeFromMachAbsoluteTime:", a3);
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  return -[TSDCgPTPClock machAbsoluteFromgPTPTime:](self->_impl, "machAbsoluteFromgPTPTime:", a3);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = -[TSDCgPTPClock convertFromMachAbsoluteTo128BitgPTPTime:grandmasterUsed:portNumber:](self->_impl, "convertFromMachAbsoluteTo128BitgPTPTime:grandmasterUsed:portNumber:", a3, a4, a5);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFrom128BitgPTPTimeToMachAbsoluteTime:grandmasterUsed:portNumber:](self->_impl, "convertFrom128BitgPTPTimeToMachAbsoluteTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4
{
  __int16 v5;

  v5 = 0;
  return -[TSgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:](self, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", a3, a4, &v5);
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:](self->_impl, "convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:", a3, a4, a5);
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:](self->_impl, "convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:", a3, a4, a5);
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  return -[TSDCgPTPClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self->_impl, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, a7, a8);
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  return -[TSDCgPTPClock convertFrom32BitASToTimeSyncTime:](self->_impl, "convertFrom32BitASToTimeSyncTime:", *(_QWORD *)&a3);
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSDCgPTPClock convertFrom32BitASTime:toTimeSyncTime:withCount:](self->_impl, "convertFrom32BitASTime:toTimeSyncTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  return -[TSDCgPTPClock gPTPTimeFromTimeSyncTime:](self->_impl, "gPTPTimeFromTimeSyncTime:", a3);
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  return -[TSDCgPTPClock timeSyncTimeFromgPTPTime:](self->_impl, "timeSyncTimeFromgPTPTime:", a3);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self->_impl, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:", a3, a4, a5);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self->_impl, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:](self->_impl, "convertFromTimeSyncTimeToDomainTime:grandmasterUsed:portNumber:", a3, a4, a5);
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  return -[TSDCgPTPClock convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:](self->_impl, "convertFromDomainTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3, a4, a5);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  return -[TSDCgPTPClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self->_impl, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", a3, a4, a5, a6, a7, a8);
}

+ (id)keyPathsForValuesAffectingGptpPath
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.gptpPath"), 0);
}

- (NSArray)gptpPath
{
  return -[TSDCgPTPClock gptpPath](self->_impl, "gptpPath");
}

+ (id)keyPathsForValuesAffectingGrandmasterIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.grandmasterIdentity"), 0);
}

- (unint64_t)grandmasterIdentity
{
  return -[TSDCgPTPClock grandmasterIdentity](self->_impl, "grandmasterIdentity");
}

+ (id)keyPathsForValuesAffectingClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockIdentity"), 0);
}

- (unint64_t)clockIdentity
{
  return -[TSDCgPTPClock clockIdentity](self->_impl, "clockIdentity");
}

+ (id)keyPathsForValuesAffectingClockPriority1
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockPriority1"), 0);
}

- (unsigned)clockPriority1
{
  return -[TSDCgPTPClock clockPriority1](self->_impl, "clockPriority1");
}

+ (id)keyPathsForValuesAffectingClockPriority2
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockPriority2"), 0);
}

- (unsigned)clockPriority2
{
  return -[TSDCgPTPClock clockPriority2](self->_impl, "clockPriority2");
}

+ (id)keyPathsForValuesAffectingClockClass
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockClass"), 0);
}

- (unsigned)clockClass
{
  return -[TSDCgPTPClock clockClass](self->_impl, "clockClass");
}

+ (id)keyPathsForValuesAffectingClockAccuracy
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockAccuracy"), 0);
}

- (unsigned)clockAccuracy
{
  return -[TSDCgPTPClock clockAccuracy](self->_impl, "clockAccuracy");
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 error:(id *)a4
{
  __int16 v5;

  v5 = 0;
  return -[TSgPTPClock addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:](self, "addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:", a3, &v5, a4);
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  return -[TSDCgPTPClock addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:](self->_impl, "addLinkLayerPortOnInterfaceNamed:allocatedPortNumber:error:", a3, a4, a5);
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  return -[TSDCgPTPClock removeLinkLayerPortFromInterfaceNamed:error:](self->_impl, "removeLinkLayerPortFromInterfaceNamed:error:", a3, a4);
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, &v6, a5);
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastUDPv4PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, a5, a6);
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastUDPv4PtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastUDPv4PtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, *(_QWORD *)&a4, a5);
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, &v6, a5);
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastUDPv6PtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastUDPv6PtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastUDPv6PtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, &v6, a5);
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastLinkLayerPtPPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastLinkLayerPtPPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastLinkLayerPtPPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, &v6, a5);
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastUDPv4EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, *(_QWORD *)&a4, a5, a6);
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastUDPv4EtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, *(_QWORD *)&a4, a5);
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, &v6, a5);
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastUDPv6EtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastUDPv6EtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  __int16 v6;

  v6 = 0;
  return -[TSgPTPClock addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self, "addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, &v6, a5);
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:](self->_impl, "addUnicastLinkLayerEtEPortOnInterfaceNamed:withDestinationAddress:allocatedPortNumber:error:", a3, a4, a5, a6);
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeUnicastLinkLayerEtEPortFromInterfaceNamed:withDestinationAddress:error:](self->_impl, "removeUnicastLinkLayerEtEPortFromInterfaceNamed:withDestinationAddress:error:", a3, a4, a5);
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  return -[TSDCgPTPClock addReverseSyncOnInterfaceNamed:withDomainNumner:syncInterval:error:](self->_impl, "addReverseSyncOnInterfaceNamed:withDomainNumner:syncInterval:error:", a3, a4, *(_QWORD *)&a5, a6);
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  return -[TSDCgPTPClock removeReverseSyncFromInterfaceNamed:withDomainNumner:error:](self->_impl, "removeReverseSyncFromInterfaceNamed:withDomainNumner:error:", a3, a4, a5);
}

- (id)getMetrics
{
  void *v2;
  TSClockMetrics *v3;

  -[TSDCgPTPClock getMetrics](self->_impl, "getMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[TSClockMetrics initWithDaemonMetrics:]([TSClockMetrics alloc], "initWithDaemonMetrics:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)getMetricsWithDelta:(id)a3
{
  TSDCgPTPClock *impl;
  void *v4;
  void *v5;
  TSClockMetrics *v6;

  impl = self->_impl;
  objc_msgSend(a3, "toDaemonMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDCgPTPClock getMetricsWithDelta:](impl, "getMetricsWithDelta:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[TSClockMetrics initWithDaemonMetrics:]([TSClockMetrics alloc], "initWithDaemonMetrics:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)keyPathsForValuesAffectingPorts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.ports"), 0);
}

- (NSArray)ports
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDCgPTPClock ports](self->_impl, "ports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[TSgPTPPort gPTPPortWithImplDC:](TSgPTPPort, "gPTPPortWithImplDC:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  void *v3;
  void *v4;

  -[TSDCgPTPClock portWithPortNumber:](self->_impl, "portWithPortNumber:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSgPTPPort gPTPPortWithImplDC:](TSgPTPPort, "gPTPPortWithImplDC:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSgPTPClock;
  -[TSKernelClock dealloc](&v2, sel_dealloc);
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  char v25;
  __objc2_class **v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  int v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v49.receiver = a1;
  v49.super_class = (Class)&OBJC_METACLASS___TSgPTPClock;
  objc_msgSendSuper2(&v49, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Grandmaster Clock Identity: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GrandmasterID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v9;
  if (v9)
    objc_msgSend(v8, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v9, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    gPTP Path: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ASPath"));
  v10 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v10;
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "appendString:", CFSTR("\n"));
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v8, "appendFormat:", CFSTR("%@        0x%016llx\n"), v7, objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "unsignedLongLongValue"), v37, v38);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v14);
    }

  }
  else
  {
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Ports:\n"), v7);
  v39 = v7;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("        |"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Ports"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ClassName"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncEthernetPort"));
        v26 = off_1E694A858;
        if ((v25 & 1) == 0)
        {
          v27 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort"));
          v26 = off_1E694A898;
          if ((v27 & 1) == 0)
          {
            v28 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort"));
            v26 = off_1E694A890;
            if ((v28 & 1) == 0)
            {
              v29 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort"));
              v26 = off_1E694A8A8;
              if ((v29 & 1) == 0)
              {
                v30 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort"));
                v26 = off_1E694A8B8;
                if ((v30 & 1) == 0)
                {
                  v31 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort"));
                  v26 = off_1E694A8A0;
                  if ((v31 & 1) == 0)
                  {
                    v32 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort"));
                    v26 = off_1E694A8B0;
                    if ((v32 & 1) == 0)
                    {
                      v33 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncTimeSyncTimePort"));
                      v26 = off_1E694A860;
                      if ((v33 & 1) == 0)
                      {
                        v34 = objc_msgSend(v24, "isEqualToString:", CFSTR("IOTimeSyncTimeOfDayPort"));
                        v26 = off_1E694A860;
                        if (!v34)
                          v26 = off_1E694A878;
                      }
                    }
                  }
                }
              }
            }
          }
        }
        -[__objc2_class diagnosticDescriptionForInfo:withIndent:](*v26, "diagnosticDescriptionForInfo:withIndent:", v23, v17);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v35);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v20);
  }

  return v8;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return +[_TSF_TSDgPTPClock clockNameForClockIdentifier:](_TSF_TSDgPTPClock, "clockNameForClockIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
