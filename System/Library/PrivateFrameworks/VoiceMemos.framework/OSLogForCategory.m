@implementation OSLogForCategory

void __OSLogForCategory_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 10);
  v1 = (void *)OSLogForCategory_gOSLogDictionary;
  OSLogForCategory_gOSLogDictionary = v0;

}

@end
