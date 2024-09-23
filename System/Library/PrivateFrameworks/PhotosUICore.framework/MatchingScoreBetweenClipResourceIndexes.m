@implementation MatchingScoreBetweenClipResourceIndexes

uint64_t __MatchingScoreBetweenClipResourceIndexes_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
