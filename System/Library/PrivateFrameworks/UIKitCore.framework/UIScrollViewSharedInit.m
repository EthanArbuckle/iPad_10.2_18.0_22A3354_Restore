@implementation UIScrollViewSharedInit

_QWORD *___UIScrollViewSharedInit_block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[168])
    return (_QWORD *)objc_msgSend(result, "addInteraction:");
  return result;
}

@end
