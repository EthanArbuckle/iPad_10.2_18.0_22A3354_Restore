@implementation SUSettingsSharedLogger

void __SUSettingsSharedLogger_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettings"));
  v1 = (void *)sharedLogger;
  sharedLogger = v0;

}

@end
