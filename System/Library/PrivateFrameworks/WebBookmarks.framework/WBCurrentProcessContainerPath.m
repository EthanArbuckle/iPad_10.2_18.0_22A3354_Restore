@implementation WBCurrentProcessContainerPath

void __WBCurrentProcessContainerPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  _BYTE v2[1024];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  getpid();
  if (!sandbox_container_path_for_pid())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)WBCurrentProcessContainerPath_containerPath;
    WBCurrentProcessContainerPath_containerPath = v0;

  }
}

@end
