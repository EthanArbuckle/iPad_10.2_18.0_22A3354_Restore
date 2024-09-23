@implementation TSTranslationClock

- (TSTranslationClock)initWithTranslationClock:(id)a3
{
  id v5;
  void *v6;
  TSTranslationClock *v7;
  TSTranslationClock *v8;
  objc_super v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "kernelClock != nil";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSTranslationClock.m";
      v22 = 1024;
      v23 = 35;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
    goto LABEL_4;
  }
  v11.receiver = self;
  v11.super_class = (Class)TSTranslationClock;
  v7 = -[TSClock initWithClockIdentifier:](&v11, sel_initWithClockIdentifier_, objc_msgSend(v5, "clockIdentifier"));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_impl, a3);
    v10.receiver = v8;
    v10.super_class = (Class)TSTranslationClock;
    -[TSClock propertyUpdateQueue](&v10, sel_propertyUpdateQueue);
    self = (TSTranslationClock *)objc_claimAutoreleasedReturnValue();
    -[TSXTranslationClock setPropertyUpdateQueue:](v8->_impl, "setPropertyUpdateQueue:", self);
LABEL_4:

  }
  return v8;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  void *v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTranslationClock;
  -[TSClock setPropertyUpdateQueue:](&v6, sel_setPropertyUpdateQueue_, a3);
  v5.receiver = self;
  v5.super_class = (Class)TSTranslationClock;
  -[TSClock propertyUpdateQueue](&v5, sel_propertyUpdateQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSXTranslationClock setPropertyUpdateQueue:](self->_impl, "setPropertyUpdateQueue:", v4);

}

+ (id)keyPathsforvaluesaffectingLockState
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.lockState"), 0);
}

- (int)lockState
{
  return -[TSXTranslationClock lockState](self->_impl, "lockState");
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromMachAbsoluteToDomainTime:](self->_impl, "convertFromMachAbsoluteToDomainTime:", a3);
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromDomainToMachAbsoluteTime:](self->_impl, "convertFromDomainToMachAbsoluteTime:", a3);
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSXTranslationClock convertFromMachAbsoluteTime:toDomainTime:withCount:](self->_impl, "convertFromMachAbsoluteTime:toDomainTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSXTranslationClock convertFromDomainTime:toMachAbsoluteTime:withCount:](self->_impl, "convertFromDomainTime:toMachAbsoluteTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromMachAbsoluteIntervalToDomainInterval:](self->_impl, "convertFromMachAbsoluteIntervalToDomainInterval:", a3);
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromDomainIntervalToMachAbsoluteInterval:](self->_impl, "convertFromDomainIntervalToMachAbsoluteInterval:", a3);
}

+ (id)keyPathsForValuesAffectingHostRateRatio
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hostRateRatio"), 0);
}

- (double)hostRateRatio
{
  double result;

  -[TSXTranslationClock hostRateRatio](self->_impl, "hostRateRatio");
  return result;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSXTranslationClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:](self->_impl, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromTimeSyncToDomainTime:](self->_impl, "convertFromTimeSyncToDomainTime:", a3);
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromDomainToTimeSyncTime:](self->_impl, "convertFromDomainToTimeSyncTime:", a3);
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSXTranslationClock convertFromTimeSyncTime:toDomainTime:withCount:](self->_impl, "convertFromTimeSyncTime:toDomainTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return -[TSXTranslationClock convertFromDomainTime:toTimeSyncTime:withCount:](self->_impl, "convertFromDomainTime:toTimeSyncTime:withCount:", a3, a4, *(_QWORD *)&a5);
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromTimeSyncTimeIntervalToDomainInterval:](self->_impl, "convertFromTimeSyncTimeIntervalToDomainInterval:", a3);
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return -[TSXTranslationClock convertFromDomainIntervalToTimeSyncTimeInterval:](self->_impl, "convertFromDomainIntervalToTimeSyncTimeInterval:", a3);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return -[TSXTranslationClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self->_impl, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", a3, a4, a5, a6, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
