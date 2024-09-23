@implementation SiriCoreSharedResourcesDirectory

void ___SiriCoreSharedResourcesDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPSharedResourcesDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Assistant"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath;
  _SiriCoreSharedResourcesDirectory_sUserSupportDirectoryPath = v0;

}

@end
