@implementation TIImageCacheVersion

void __TIImageCacheVersion_block_invoke()
{
  void *v0;

  v0 = (void *)MGCopyAnswerWithError();
  TIImageCacheVersion_buildVersion = objc_msgSend(v0, "hash");

}

@end
