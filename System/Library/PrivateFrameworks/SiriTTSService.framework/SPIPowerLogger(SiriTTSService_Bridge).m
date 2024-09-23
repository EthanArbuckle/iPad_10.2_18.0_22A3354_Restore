@implementation SPIPowerLogger(SiriTTSService_Bridge)

+ (id)loggerForCurrentProcess
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA3988]), "initWithCurrentProcess");
}

@end
