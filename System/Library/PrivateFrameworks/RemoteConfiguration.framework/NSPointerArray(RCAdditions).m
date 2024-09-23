@implementation NSPointerArray(RCAdditions)

- (uint64_t)rc_firstIndexOfObject:()RCAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = 0;
    while ((objc_msgSend(v4, "isEqual:", objc_msgSend(a1, "pointerAtIndex:", v5)) & 1) == 0)
    {
      if (++v5 >= (unint64_t)objc_msgSend(a1, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)rc_containsObject:()RCAdditions
{
  return objc_msgSend(a1, "rc_firstIndexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
}

@end
