@implementation STStorageDataLocStr

void __STStorageDataLocStr_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("STStorageApp")));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)STStorageDataLocStr_strBundle;
  STStorageDataLocStr_strBundle = v0;

}

@end
