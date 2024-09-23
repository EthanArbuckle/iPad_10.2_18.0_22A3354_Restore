@implementation NSPointerArray(SBHPointerArrayUtilities)

- (uint64_t)sbh_removePointer:()SBHPointerArrayUtilities
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v6 = result;
    v7 = 0;
    for (i = result; i != v7; v6 = i - v7)
    {
      result = objc_msgSend(a1, "sbh_indexOfPointer:inRange:", a3, v7, v6);
      if (result == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v7 = result;
      result = objc_msgSend(a1, "removePointerAtIndex:", result);
      --i;
    }
  }
  return result;
}

- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities
{
  return objc_msgSend(a1, "sbh_indexOfPointer:inRange:", a3, 0, objc_msgSend(a1, "count"));
}

- (uint64_t)sbh_indexOfPointer:()SBHPointerArrayUtilities inRange:
{
  uint64_t v5;
  uint64_t i;

  if (a4 >= a4 + a5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = a5;
  for (i = a4; objc_msgSend(a1, "pointerAtIndex:", i) != a3; ++i)
  {
    if (!--v5)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return i;
}

@end
