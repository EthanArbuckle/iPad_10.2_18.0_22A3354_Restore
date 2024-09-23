@implementation WFLoggerBase

- (unsigned)WFIsInternalInstall
{
  _QWORD block[5];

  self->_internalInstall = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WFLoggerBase_WFIsInternalInstall__block_invoke;
  block[3] = &unk_1E881CAE0;
  block[4] = self;
  if (WFIsInternalInstall___internalInstallOnceToken != -1)
    dispatch_once(&WFIsInternalInstall___internalInstallOnceToken, block);
  return self->_internalInstall;
}

uint64_t __35__WFLoggerBase_WFIsInternalInstall__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  NSLog(CFSTR("Should not be here"), a2, a3, a4, a5, a6);
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  NSLog(CFSTR("Should not be here"), a2, a3, a4, a5);
}

- (void)setLogLifespanInDays:(id)a3
{
  NSLog(CFSTR("Should not be here"), a2, a3);
}

- (NSNumber)getLogLifespanInDays
{
  NSLog(CFSTR("Should not be here"), a2);
  return 0;
}

- (void)setLogPrivacy:(unint64_t)a3
{
  NSLog(CFSTR("Should not be here"), a2, a3);
}

- (unint64_t)getLogPrivacy
{
  NSLog(CFSTR("Should not be here"), a2);
  return 1;
}

- (void)setLogLevelEnable:(unint64_t)a3
{
  NSLog(CFSTR("Should not be here"), a2, a3);
}

- (unint64_t)getLogLevelEnable
{
  NSLog(CFSTR("Should not be here"), a2);
  return 3;
}

- (void)setLogLevelPersist:(unint64_t)a3
{
  NSLog(CFSTR("Should not be here"), a2, a3);
}

- (unint64_t)getLogLevelPersist
{
  NSLog(CFSTR("Should not be here"), a2);
  return 3;
}

- (unint64_t)getMaxFileSizeInMB
{
  NSLog(CFSTR("Should not be here"), a2);
  return 0;
}

- (void)setMaxSizeInKb:(unint64_t)a3
{
  NSLog(CFSTR("Should not be here"), a2, a3);
}

- (void)stopWatchingLogFile
{
  NSLog(CFSTR("Should not be here"), a2);
}

- (void)dump
{
  NSLog(CFSTR("Log dump triggered"), a2);
}

@end
