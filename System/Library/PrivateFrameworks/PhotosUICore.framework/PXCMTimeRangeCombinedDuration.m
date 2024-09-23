@implementation PXCMTimeRangeCombinedDuration

Float64 __PXCMTimeRangeCombinedDuration_block_invoke_2(Float64 a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  CMTime v7;
  CMTime time;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "CMTimeRangeValue");
    if ((BYTE4(v11) & 0x1D) == 1)
    {
      objc_msgSend(v5, "CMTimeRangeValue");
      time = v7;
      a1 = CMTimeGetSeconds(&time) + a1;
    }
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }

  return a1;
}

uint64_t __PXCMTimeRangeCombinedDuration_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time2;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "CMTimeRangeValue");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.epoch = v11;
  if (v5)
    objc_msgSend(v5, "CMTimeRangeValue");
  else
    memset(&v8, 0, sizeof(v8));
  time2 = v8;
  v6 = CMTimeCompare(&time1, &time2);

  return v6;
}

@end
