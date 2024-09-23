@implementation TimeSyncPortRemoveRef

unint64_t __TimeSyncPortRemoveRef_block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = objc_msgSend((id)_timeSyncPortRefs, "count");
  if (result)
  {
    v3 = 0;
    while (1)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (v4 == objc_msgSend((id)_timeSyncPortRefs, "pointerAtIndex:", v3))
        break;
      ++v3;
      result = objc_msgSend((id)_timeSyncPortRefs, "count");
      if (v3 >= result)
        return result;
    }
    return objc_msgSend((id)_timeSyncPortRefs, "removePointerAtIndex:", v3);
  }
  return result;
}

@end
