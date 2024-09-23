@implementation NSPointerArray(SystemApertureAdditions)

- (uint64_t)sa_compact
{
  uint64_t result;
  char v3;
  uint64_t v4;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = 0;
    v4 = result - 1;
    do
    {
      if (!objc_msgSend(a1, "pointerAtIndex:", v4))
      {
        objc_msgSend(a1, "removePointerAtIndex:", v4);
        v3 = 1;
      }
      --v4;
    }
    while (v4 != -1);
    return v3 & 1;
  }
  return result;
}

- (uint64_t)sa_lastPointer
{
  uint64_t result;

  objc_msgSend(a1, "sa_compact");
  result = objc_msgSend(a1, "count");
  if (result)
    return objc_msgSend(a1, "pointerAtIndex:", result - 1);
  return result;
}

@end
