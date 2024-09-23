@implementation TimeSyncClockValidRef

unint64_t __TimeSyncClockValidRef_block_invoke(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = objc_msgSend((id)_timeSyncClockRefs, "count");
  if (result)
  {
    v3 = 0;
    while (1)
    {
      v4 = *(_QWORD *)(a1 + 40);
      result = objc_msgSend((id)_timeSyncClockRefs, "pointerAtIndex:", v3);
      if (v4 == result)
        break;
      ++v3;
      result = objc_msgSend((id)_timeSyncClockRefs, "count");
      if (v3 >= result)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
