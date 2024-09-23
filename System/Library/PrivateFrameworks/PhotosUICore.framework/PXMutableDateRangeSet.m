@implementation PXMutableDateRangeSet

- (void)addDateRange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v4 = a3;
  v5 = v4;
  do
  {
    v6 = v5;
    v8 = 0;
    v7 = -[PXMutableDateRangeSet _attemptToAddDateRange:outNextRange:](self, "_attemptToAddDateRange:outNextRange:", v5, &v8);
    v5 = v8;

  }
  while (!v7);

}

- (BOOL)_attemptToAddDateRange:(id)a3 outNextRange:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  BOOL v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDateRangeSet.m"), 142, CFSTR("outNextAttempt required"));

  }
  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v32;
    while (2)
    {
      v13 = 0;
      v14 = v11 + v10;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
        if ((objc_msgSend(v7, "intersectsRange:", v15, (_QWORD)v31) & 1) != 0)
        {

          objc_msgSend(v8, "objectAtIndex:", v11 + v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectAtIndex:", v11 + v13);
          objc_msgSend(v7, "startDate");
          v18 = v17;
          objc_msgSend(v16, "startDate");
          if (v18 <= v19)
            v20 = v7;
          else
            v20 = v16;
          objc_msgSend(v20, "startDate");
          v22 = v21;
          objc_msgSend(v7, "endDate");
          v24 = v23;
          objc_msgSend(v16, "endDate");
          if (v24 >= v25)
            v26 = v7;
          else
            v26 = v16;
          objc_msgSend(v26, "endDate");
          *a4 = -[PXDateRange initWithStartDate:endDate:]([PXDateRange alloc], "initWithStartDate:endDate:", v22, v27);

          v28 = 0;
          goto LABEL_26;
        }
        if ((objc_msgSend(v7, "isStrictlyBeforeRange:", v15) & 1) != 0)
        {
          v14 = v11 + v13;
          goto LABEL_22;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_22:

  if (v14 >= objc_msgSend(v8, "count"))
    objc_msgSend(v8, "addObject:", v7);
  else
    objc_msgSend(v8, "insertObject:atIndex:", v7, v14);
  v28 = 1;
LABEL_26:

  return v28;
}

- (void)removeAllDateRanges
{
  id v2;

  -[PXDateRangeSet _dateRanges](self, "_dateRanges");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

@end
