@implementation TSUserFilteredClock

- (TSUserFilteredClock)initWithImplDC:(id)a3
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
      v10 = "[kernelClock isKindOfClass:[TSDCUserFilteredClock class]]";
      v11 = 2048;
      v12 = 0;
      v13 = 2048;
      v14 = 0;
      v15 = 2080;
      v16 = "";
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSUserFilteredClock.m";
      v19 = 1024;
      v20 = 47;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSUserFilteredClock;
  v5 = -[TSKernelClock initWithImplDC:](&v8, sel_initWithImplDC_, v4);
  if (v5)
  {
    v6 = v4;
    self = (TSUserFilteredClock *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v6;
LABEL_4:

  }
  return (TSUserFilteredClock *)v5;
}

- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5
{
  return -[TSDCUserFilteredClock addTimestampWithMachAbsolute:andDomainTime:error:](self->_impl, "addTimestampWithMachAbsolute:andDomainTime:error:", a3, a4, a5);
}

- (BOOL)resetSyncServiceWithError:(id *)a3
{
  return -[TSDCUserFilteredClock resetSyncServiceWithError:](self->_impl, "resetSyncServiceWithError:", a3);
}

- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4
{
  return -[TSDCUserFilteredClock resetFilterToNominal:error:](self->_impl, "resetFilterToNominal:error:", a3, a4);
}

+ (id)keyPathsForValuesAffectingNominalMachInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.nominalMachInterval"), 0);
}

- (unint64_t)nominalMachInterval
{
  return -[TSDCUserFilteredClock nominalMachInterval](self->_impl, "nominalMachInterval");
}

+ (id)keyPathsForValuesAffectingNominalDomainInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.nominalDomainInterval"), 0);
}

- (unint64_t)nominalDomainInterval
{
  return -[TSDCUserFilteredClock nominalDomainInterval](self->_impl, "nominalDomainInterval");
}

+ (id)keyPathsForValuesAffectingFilterShift
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.filterShift"), 0);
}

- (unsigned)filterShift
{
  return -[TSDCUserFilteredClock filterShift](self->_impl, "filterShift");
}

+ (id)keyPathsForValuesAffectingAdaptive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.adaptive"), 0);
}

- (BOOL)isAdaptive
{
  return -[TSDCUserFilteredClock isAdaptive](self->_impl, "isAdaptive");
}

- (BOOL)waitTimeSyncTimeUpdate
{
  TSDCUserFilteredClock *impl;

  impl = self->_impl;
  if (impl)
    LOBYTE(impl) = -[TSDCUserFilteredClock waitTimeSyncTimeUpdate](impl, "waitTimeSyncTimeUpdate");
  return (char)impl;
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___TSUserFilteredClock;
  objc_msgSendSuper2(&v17, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Nominal Mach Interval: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NominalMachInterval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v8, "appendFormat:", CFSTR("%llu\n"), objc_msgSend(v9, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Nominal Domain Interval: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NominalDomainInterval"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "appendFormat:", CFSTR("%llu\n"), objc_msgSend(v11, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Filter Shift: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FilterShift"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v12, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Adaptive: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Adaptive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "BOOLValue");
    v15 = CFSTR("NO");
    if (v14)
      v15 = CFSTR("YES");
    objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v15);
  }
  else
  {
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
