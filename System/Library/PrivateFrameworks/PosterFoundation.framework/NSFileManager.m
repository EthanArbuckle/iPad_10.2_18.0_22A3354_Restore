@implementation NSFileManager

uint64_t __74__NSFileManager_PosterFoundation__pf_createTransientDirectoryAtURL_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

@end
