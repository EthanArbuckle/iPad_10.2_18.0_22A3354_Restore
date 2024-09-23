@implementation TSgPTPUnicastUDPv6PtPPort

- (TSgPTPUnicastUDPv6PtPPort)initWithimplDC:(id)a3
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
      v10 = "[portImpl isKindOfClass:[TSDgPTPUnicastUDPv6PtPPort class]]";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v19 = 1024;
      v20 = 2665;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSgPTPUnicastUDPv6PtPPort;
  v5 = -[TSgPTPFDPtPPort initWithImplDC:](&v8, sel_initWithImplDC_, v4);
  if (v5)
  {
    v6 = v4;
    self = (TSgPTPUnicastUDPv6PtPPort *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v6;
LABEL_4:

  }
  return (TSgPTPUnicastUDPv6PtPPort *)v5;
}

+ (id)keyPathsForValuesAffectingDestinationIPv6Address
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.destinationIPv6Address"), 0);
}

- (NSData)destinationIPv6Address
{
  return -[_TSF_TSDgPTPUnicastUDPv6PtPPort destinationIPv6Address](self->_impl, "destinationIPv6Address");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
