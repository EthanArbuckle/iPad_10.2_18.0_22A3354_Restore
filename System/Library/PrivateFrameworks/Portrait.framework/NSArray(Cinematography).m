@implementation NSArray(Cinematography)

- (uint64_t)_indexNearestTime:()Cinematography
{
  __int128 v4;
  uint64_t v5;

  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  return objc_msgSend(a1, "_indexNearestTime:timeSelector:", &v4, sel_time);
}

- (uint64_t)_indexAtOrBeforeTime:()Cinematography
{
  __int128 v4;
  uint64_t v5;

  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  return objc_msgSend(a1, "_indexAtOrBeforeTime:timeSelector:", &v4, sel_time);
}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography
{
  __int128 v4;
  uint64_t v5;

  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  return objc_msgSend(a1, "_firstIndexAtOrAfterTime:timeSelector:", &v4, sel_time);
}

- (uint64_t)_indexRangeOfTimeRange:()Cinematography
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "_indexRangeOfTimeRange:timeSelector:", v5, sel_time);
}

- (uint64_t)_timeRangeOfIndexRange:()Cinematography
{
  return objc_msgSend(a1, "_timeRangeOfIndexRange:timeSelector:", a3, a4, sel_time);
}

- (uint64_t)_indexNearestTime:()Cinematography timeSelector:
{
  uint64_t v7;
  void *v8;
  void *v9;
  CMTime v11;
  CMTime rhs;
  CMTime lhs;
  CMTime v14;
  CMTime v15;
  CMTime v16;

  v16 = *a3;
  v7 = objc_msgSend(a1, "_firstIndexAtOrAfterTime:startIndex:lastIfEqual:timeSelector:", &v16, 0, 1, a4);
  if (v7 >= 1)
  {
    if (v7 >= (unint64_t)objc_msgSend(a1, "count"))
    {
      --v7;
    }
    else
    {
      memset(&v16, 0, sizeof(v16));
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_timeForObject:timeSelector:", v8, a4);

      memset(&v15, 0, sizeof(v15));
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_timeForObject:timeSelector:", v9, a4);

      memset(&v14, 0, sizeof(v14));
      lhs = *a3;
      rhs = v16;
      CMTimeSubtract(&v14, &lhs, &rhs);
      memset(&lhs, 0, sizeof(lhs));
      rhs = v15;
      v11 = *a3;
      CMTimeSubtract(&lhs, &rhs, &v11);
      rhs = v14;
      v11 = lhs;
      if (CMTimeCompare(&rhs, &v11) == -1)
        --v7;
    }
  }
  return v7;
}

- (uint64_t)_indexAtOrBeforeTime:()Cinematography timeSelector:
{
  uint64_t v7;
  void *v8;
  int32_t v9;
  uint64_t v10;
  CMTime time2;
  CMTime time1;

  time1 = *a3;
  v7 = objc_msgSend(a1, "_firstIndexAtOrAfterTime:timeSelector:", &time1);
  if (v7 == objc_msgSend(a1, "count"))
  {
    if (v7)
      --v7;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_timeForObject:timeSelector:", v8, a4);
    time1 = *a3;
    v9 = CMTimeCompare(&time1, &time2);

    v10 = v7 - 1;
    if (!v7)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 < 0)
      return v10;
  }
  return v7;
}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography timeSelector:
{
  __int128 v5;
  uint64_t v6;

  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  return objc_msgSend(a1, "_firstIndexAtOrAfterTime:startIndex:lastIfEqual:timeSelector:", &v5, 0, 0, a4);
}

- (uint64_t)_indexRangeOfTimeRange:()Cinematography timeSelector:
{
  uint64_t v7;
  CMTime v9;
  CMTime lhs;
  CMTime v11;

  memset(&v11, 0, sizeof(v11));
  lhs = *(CMTime *)a3;
  v9 = *(CMTime *)(a3 + 24);
  CMTimeAdd(&v11, &lhs, &v9);
  lhs = *(CMTime *)a3;
  v7 = objc_msgSend(a1, "_firstIndexAtOrAfterTime:timeSelector:", &lhs, a4);
  lhs = v11;
  if (objc_msgSend(a1, "_firstIndexAfterTime:startIndex:timeSelector:", &lhs, v7, a4) <= v7)
    return 0;
  else
    return v7;
}

- (void)_timeRangeOfIndexRange:()Cinematography timeSelector:
{
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  CMTime v15;
  CMTime start;
  CMTime v17;
  CMTime v18;

  if (a2 >= objc_msgSend(a1, "count"))
  {
    v13 = MEMORY[0x1E0CA2E50];
    v14 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)a5 = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)(a5 + 16) = v14;
    *(_OWORD *)(a5 + 32) = *(_OWORD *)(v13 + 32);
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v18, 0, sizeof(v18));
    objc_msgSend(a1, "_timeForObject:timeSelector:", v10, a4);
    v11 = a2 + a3;
    if (v11 >= objc_msgSend(a1, "count"))
    {
      v17 = v18;
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
      CMTimeRangeMake((CMTimeRange *)a5, &v17, &start);
    }
    else
    {
      objc_msgSend(a1, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v17, 0, sizeof(v17));
      objc_msgSend(a1, "_timeForObject:timeSelector:", v12, a4);
      start = v18;
      v15 = v17;
      CMTimeRangeFromTimeToTime((CMTimeRange *)a5, &start, &v15);

    }
  }
}

- (void)_timeForObject:()Cinematography timeSelector:
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v8;
    if (!v8)
    {
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      goto LABEL_9;
    }
    objc_msgSend(v8, "CMTimeValue");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    ((void (*)(id, const char *))objc_msgSend(v8, "methodForSelector:", a2))(v8, a2);
  }
  else
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("_timeForObject: error: object %@ is neither a time value nor an object that responds to %@"), v8, v6);

    v7 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E68];
    a3[2] = *(_QWORD *)(v7 + 16);
  }
  v5 = v8;
LABEL_9:

}

- (uint64_t)_firstIndexAtOrAfterTime:()Cinematography startIndex:lastIfEqual:timeSelector:
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[6];
  __int128 v16;
  uint64_t v17;

  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "count") - a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __88__NSArray_Cinematography___firstIndexAtOrAfterTime_startIndex_lastIfEqual_timeSelector___block_invoke;
  v15[3] = &unk_1E822A6C8;
  v15[1] = 3221225472;
  if (a5)
    v12 = 1536;
  else
    v12 = 1280;
  v15[4] = a1;
  v15[5] = a6;
  v13 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v10, a4, v11, v12, v15);

  return v13;
}

- (unint64_t)_firstIndexAfterTime:()Cinematography startIndex:timeSelector:
{
  unint64_t v8;
  void *v9;
  CMTime v11;
  CMTime time1;
  CMTime v13;

  v13 = *a3;
  v8 = objc_msgSend(a1, "_firstIndexAtOrAfterTime:startIndex:lastIfEqual:timeSelector:", &v13, a4, 1, a5);
  if (v8 < objc_msgSend(a1, "count"))
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(a1, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_timeForObject:timeSelector:", v9, a5);

    time1 = *a3;
    v11 = v13;
    if (!CMTimeCompare(&time1, &v11))
      ++v8;
  }
  return v8;
}

@end
