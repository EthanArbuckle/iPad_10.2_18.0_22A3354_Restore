@implementation NSArray

uint64_t __88__NSArray_Cinematography___firstIndexAtOrAfterTime_startIndex_lastIfEqual_timeSelector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CMTime v11;
  CMTime time1;
  CMTime v13[2];

  v5 = a2;
  v6 = a3;
  memset(&v13[1], 0, sizeof(CMTime));
  v7 = *(void **)(a1 + 32);
  if (v7
    && (objc_msgSend(v7, "_timeForObject:timeSelector:", v5, *(_QWORD *)(a1 + 40)),
        v8 = *(void **)(a1 + 32),
        memset(v13, 0, 24),
        v8))
  {
    objc_msgSend(v8, "_timeForObject:timeSelector:", v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    memset(v13, 0, 24);
  }
  time1 = v13[1];
  v11 = v13[0];
  v9 = CMTimeCompare(&time1, &v11);

  return v9;
}

@end
