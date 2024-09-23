@implementation SPIPowerLogger

- (SPIPowerLogger)init
{

  return 0;
}

- (SPIPowerLogger)initWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  SPIPowerLogger *v4;
  SPIPowerLogger *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)SPIPowerLogger;
  v4 = -[SPIPowerLogger init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->pid = v3;
    v4->process = +[SPIProcessUtils getProcessForPid:](SPIProcessUtils, "getProcessForPid:", v3);
  }
  return v5;
}

- (SPIPowerLogger)initWithCurrentProcess
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "processIdentifier");

  return -[SPIPowerLogger initWithProcessIdentifier:](self, "initWithProcessIdentifier:", v4);
}

- (id)captureSnapshot
{
  uint64_t v3;
  int v4;
  SPIPowerLoggerSnapshot *v5;
  SPIPowerLoggerSnapshot *v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = 0uLL;
  v11 = 0;
  v3 = mach_absolute_time();
  v4 = +[SPIProcessUtils getUsageForPid:withOutput:](SPIProcessUtils, "getUsageForPid:withOutput:", -[SPIPowerLogger pid](self, "pid"), &v10);
  v5 = 0;
  if (!v4)
  {
    v6 = [SPIPowerLoggerSnapshot alloc];
    v8 = v10;
    v9 = v11;
    v5 = -[SPIPowerLoggerSnapshot initWithPowerLogger:usage:captureTimestamp:](v6, "initWithPowerLogger:usage:captureTimestamp:", self, &v8, v3);
  }
  return v5;
}

- (int)pid
{
  return self->pid;
}

- (unsigned)process
{
  return self->process;
}

@end
