@implementation UIKeyboardCacheVersion

uint64_t __UIKeyboardCacheVersion_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)MGCopyAnswerWithError(), "hash");
  UIKeyboardCacheVersion_buildVersion = result;
  return result;
}

@end
