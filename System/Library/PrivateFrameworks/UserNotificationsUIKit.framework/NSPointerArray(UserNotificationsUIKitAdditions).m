@implementation NSPointerArray(UserNotificationsUIKitAdditions)

- (uint64_t)unui_compact
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    v3 = result - 1;
    do
    {
      result = objc_msgSend(a1, "pointerAtIndex:", v3);
      if (!result)
        result = objc_msgSend(a1, "removePointerAtIndex:", v3);
      --v3;
    }
    while (v3 != -1);
  }
  return result;
}

@end
