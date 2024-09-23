@implementation NSOrderedSet

uint64_t __56__NSOrderedSet_Voicemail__arrayBySubtractingOrderedSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __61__NSOrderedSet_Voicemail__arrayByIntersectingWithOrderedSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

@end
