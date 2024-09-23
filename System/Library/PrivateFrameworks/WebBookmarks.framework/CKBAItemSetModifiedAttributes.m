@implementation CKBAItemSetModifiedAttributes

uint64_t __CKBAItemSetModifiedAttributes_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isInserted");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_saveBookmark:withSpecialID:updateGenerationIfNeeded:", *(_QWORD *)(a1 + 32), 0, 0);
  return result;
}

@end
