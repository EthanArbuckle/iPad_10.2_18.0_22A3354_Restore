@implementation STStorageIsInternalInstall

void __STStorageIsInternalInstall_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  STStorageIsInternalInstall_isInternal = objc_msgSend(v0, "BOOLValue");

}

@end
