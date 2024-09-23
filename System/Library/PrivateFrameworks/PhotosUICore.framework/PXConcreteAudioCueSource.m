@implementation PXConcreteAudioCueSource

- (PXConcreteAudioCueSource)initWithNumberOfCues:(int64_t)a3 configuration:(id)a4
{
  void (**v6)(id, _QWORD);
  PXConcreteAudioCueSource *v7;
  PXConcreteAudioCueSource *v8;
  $D5021987E997E6DF12FC1EC57F7BF105 *v9;
  int64_t v10;
  $D5021987E997E6DF12FC1EC57F7BF105 *cues;
  $D5021987E997E6DF12FC1EC57F7BF105 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v18;
  CMTime start;
  CMTimeRange v20;
  objc_super v21;

  v6 = (void (**)(id, _QWORD))a4;
  v21.receiver = self;
  v21.super_class = (Class)PXConcreteAudioCueSource;
  v7 = -[PXConcreteAudioCueSource init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_numberOfCues = a3;
    if (a3 >= 1)
    {
      v9 = ($D5021987E997E6DF12FC1EC57F7BF105 *)malloc_type_calloc(a3, 0x20uLL, 0x1000040E0EAB150uLL);
      v8->_cues = v9;
      v10 = a3;
      do
      {
        *(_OWORD *)&v9->var0.var0 = 0uLL;
        *(_OWORD *)&v9->var0.var3 = 0uLL;
        ++v9;
        --v10;
      }
      while (v10);
      ((void (**)(id, $D5021987E997E6DF12FC1EC57F7BF105 *))v6)[2](v6, v8->_cues);
      cues = v8->_cues;
      v12 = &cues[a3];
      v13 = *(_OWORD *)&cues->var0.var0;
      start.epoch = cues->var0.var3;
      *(_OWORD *)&start.value = v13;
      v14 = *(_OWORD *)&v12[-1].var0.var0;
      v18.epoch = v12[-1].var0.var3;
      *(_OWORD *)&v18.value = v14;
      CMTimeRangeFromTimeToTime(&v20, &start, &v18);
      v16 = *(_OWORD *)&v20.start.epoch;
      v15 = *(_OWORD *)&v20.duration.timescale;
      *(_OWORD *)&v8->_timeRange.start.value = *(_OWORD *)&v20.start.value;
      *(_OWORD *)&v8->_timeRange.start.epoch = v16;
      *(_OWORD *)&v8->_timeRange.duration.timescale = v15;
    }
  }

  return v8;
}

- (PXConcreteAudioCueSource)init
{
  return -[PXConcreteAudioCueSource initWithNumberOfCues:configuration:](self, "initWithNumberOfCues:configuration:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_cues);
  v3.receiver = self;
  v3.super_class = (Class)PXConcreteAudioCueSource;
  -[PXConcreteAudioCueSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  PXConcreteAudioCueSource *v4;
  PXConcreteAudioCueSource *v5;
  uint64_t v6;
  BOOL v7;
  PXConcreteAudioCueSource *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMTimeRange v17;
  CMTimeRange range1;
  CMTime v19;
  CMTime v20;
  CMTime time2;
  CMTime time1;

  v4 = (PXConcreteAudioCueSource *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXConcreteAudioCueSource numberOfCues](v5, "numberOfCues");
      if (v6 != -[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues"))
        goto LABEL_19;
      if (v5)
        -[PXConcreteAudioCueSource timeRange](v5, "timeRange");
      else
        memset(&range1, 0, sizeof(range1));
      -[PXConcreteAudioCueSource timeRange](self, "timeRange");
      if (CMTimeRangeEqual(&range1, &v17))
      {
        v8 = objc_retainAutorelease(self);
        v9 = -[PXConcreteAudioCueSource cues](v8, "cues");
        v10 = -[PXConcreteAudioCueSource cues](objc_retainAutorelease(v5), "cues");
        v11 = -[PXConcreteAudioCueSource numberOfCues](v8, "numberOfCues");
        v7 = 1;
        if (v9 != v10)
        {
          v12 = v11;
          if (v11)
          {
            v7 = 0;
            if (v9)
            {
              if (v10)
              {
                v7 = 0;
                v13 = 0;
                do
                {
                  *(_OWORD *)&v20.value = *(_OWORD *)v9;
                  v14 = *(_QWORD *)(v9 + 24);
                  v20.epoch = *(_QWORD *)(v9 + 16);
                  *(_OWORD *)&v19.value = *(_OWORD *)v10;
                  v15 = *(_QWORD *)(v10 + 24);
                  v19.epoch = *(_QWORD *)(v10 + 16);
                  time1 = v20;
                  time2 = v19;
                  if (CMTimeCompare(&time1, &time2))
                    break;
                  if (v14 != v15)
                    break;
                  v10 += 32;
                  v9 += 32;
                  v7 = ++v13 >= v12;
                }
                while (v12 != v13);
              }
            }
          }
        }
      }
      else
      {
LABEL_19:
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEmpty
{
  return -[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues") == 0;
}

- ($D5021987E997E6DF12FC1EC57F7BF105)firstCueFollowingTime:(SEL)a3
{
  $D5021987E997E6DF12FC1EC57F7BF105 *result;
  $D5021987E997E6DF12FC1EC57F7BF105 *v7;
  $D5021987E997E6DF12FC1EC57F7BF105 *v8;
  __int128 v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a4;
  result = -[PXConcreteAudioCueSource _indexOfFirstCueFollowingTime:](self, "_indexOfFirstCueFollowingTime:", &v10);
  if (result == ($D5021987E997E6DF12FC1EC57F7BF105 *)0x7FFFFFFFFFFFFFFFLL)
  {
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var3 = 0u;
  }
  else
  {
    v7 = result;
    result = -[PXConcreteAudioCueSource cues](objc_retainAutorelease(self), "cues");
    v8 = &result[(_QWORD)v7];
    v9 = *(_OWORD *)&v8->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v8->var0.var0;
    *(_OWORD *)&retstr->var0.var3 = v9;
  }
  return result;
}

- ($D5021987E997E6DF12FC1EC57F7BF105)bestCueInRange:(SEL)a3 preferredTime:(id *)a4
{
  $D5021987E997E6DF12FC1EC57F7BF105 *result;
  __int128 v10;
  $D5021987E997E6DF12FC1EC57F7BF105 *v11;
  PXConcreteAudioCueSource *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  _QWORD *v17;
  double (*v18)(_QWORD *, __int128 *);
  __int128 v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  __int128 *v29;
  _QWORD v30[3];
  double v31;
  _QWORD aBlock[4];
  __int128 v33;
  int64_t var3;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  result = -[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues");
  if (result
    && (v10 = *(_OWORD *)&a4->var0.var3,
        v35 = *(_OWORD *)&a4->var0.var0,
        v36 = v10,
        v37 = *(_OWORD *)&a4->var1.var1,
        result = -[PXConcreteAudioCueSource _indexOfFirstCueInRange:](self, "_indexOfFirstCueInRange:", &v35),
        result != ($D5021987E997E6DF12FC1EC57F7BF105 *)0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = result;
    v12 = objc_retainAutorelease(self);
    v13 = -[PXConcreteAudioCueSource cues](v12, "cues");
    *(_QWORD *)&v35 = 0;
    *((_QWORD *)&v35 + 1) = &v35;
    *(_QWORD *)&v36 = 0x4010000000;
    *((_QWORD *)&v36 + 1) = &unk_1A7E74EE7;
    v14 = (__int128 *)(v13 + 32 * (_QWORD)v11);
    v15 = v14[1];
    v37 = *v14;
    v38 = v15;
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke;
    aBlock[3] = &__block_descriptor_56_e20_d40__0______qiIq_q_8l;
    v33 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    v17 = _Block_copy(aBlock);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0.0;
    v18 = (double (*)(_QWORD *, __int128 *))v17[2];
    v19 = *(_OWORD *)(*((_QWORD *)&v35 + 1) + 48);
    v23 = *(_OWORD *)(*((_QWORD *)&v35 + 1) + 32);
    v24 = v19;
    v31 = v18(v17, &v23);
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke_2;
    v26[3] = &unk_1E51333A0;
    v20 = v17;
    v27 = v20;
    v28 = v30;
    v29 = &v35;
    v21 = *(_OWORD *)&a4->var0.var3;
    v23 = *(_OWORD *)&a4->var0.var0;
    v24 = v21;
    v25 = *(_OWORD *)&a4->var1.var1;
    -[PXConcreteAudioCueSource enumerateCuesInRange:withBlock:](v12, "enumerateCuesInRange:withBlock:", &v23, v26);
    v22 = *(_OWORD *)(*((_QWORD *)&v35 + 1) + 48);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)(*((_QWORD *)&v35 + 1) + 32);
    *(_OWORD *)&retstr->var0.var3 = v22;

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var3 = 0u;
  }
  return result;
}

- (void)enumerateCuesInRange:(id *)a3 withBlock:(id)a4
{
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  PXConcreteAudioCueSource *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void (*v13)(_QWORD *, __int128 *, char *);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;

  v6 = a4;
  v21 = 0;
  v18 = *(_OWORD *)&a3->var0.var0;
  *(_QWORD *)&v19 = a3->var0.var3;
  v7 = -[PXConcreteAudioCueSource _indexOfFirstCueFollowingTime:](self, "_indexOfFirstCueFollowingTime:", &v18);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    v9 = objc_retainAutorelease(self);
    v10 = -[PXConcreteAudioCueSource cues](v9, "cues");
    if (v8 < -[PXConcreteAudioCueSource numberOfCues](v9, "numberOfCues"))
    {
      v11 = v10 + 32 * v8;
      do
      {
        v12 = *(_OWORD *)&a3->var0.var3;
        v18 = *(_OWORD *)&a3->var0.var0;
        v19 = v12;
        v20 = *(_OWORD *)&a3->var1.var1;
        v16 = *(_OWORD *)v11;
        v17 = *(_QWORD *)(v11 + 16);
        if (!PXCMTimeRangeContainsTimeInclusive((uint64_t)&v18, (uint64_t)&v16))
          break;
        if (v21)
          break;
        v13 = (void (*)(_QWORD *, __int128 *, char *))v6[2];
        v14 = *(_OWORD *)v11;
        v15 = *(_OWORD *)(v11 + 16);
        v11 += 32;
        v18 = v14;
        v19 = v15;
        v13(v6, &v18, &v21);
        ++v8;
      }
      while (v8 < -[PXConcreteAudioCueSource numberOfCues](v9, "numberOfCues"));
    }
  }

}

- (id)diagnosticStringForTimeRange:(id *)a3 indicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5 stringLength:(int64_t)a6
{
  void *v11;
  __int128 v12;
  id v13;
  int64_t v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  const __CFString *i;
  __int128 v19;
  __int128 v20;
  void *v21;
  int64_t v22;
  $D5021987E997E6DF12FC1EC57F7BF105 *v23;
  uint64_t v24;
  const __CFString *v25;
  int64_t v26;
  CMTime *v27;
  CMTimeValue value;
  __CFString *v29;
  __CFString *v30;
  $D5021987E997E6DF12FC1EC57F7BF105 *v31;
  __int128 v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  const __CFString *v38;
  id v39;
  uint64_t v40;
  $D5021987E997E6DF12FC1EC57F7BF105 *v41;
  CMTime v42;
  CMTime start;
  CMTime v44;
  uint64_t v45;
  uint64_t v46;
  BOOL (*v47)(uint64_t, uint64_t);
  void *v48;
  $D5021987E997E6DF12FC1EC57F7BF105 *v49;
  __int128 v50;
  CMTimeEpoch epoch;
  CMTime v52;
  CMTime lhs;
  CMTime v54;
  CMTime v55;
  CMTime time1;
  CMTime rhs;
  CMTime time2;
  CMTime var0;
  CMTime v60;
  CMTimeRange range;
  CMTime v62;
  CMTime var1;

  v39 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", a6);
  var1 = (CMTime)a3->var1;
  memset(&v62, 0, sizeof(v62));
  v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v62, &range);
  memset(&v60, 0, sizeof(v60));
  range.start = var1;
  CMTimeMultiplyByRatio(&v60, &range.start, 1, a6);
  v40 = -[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues");
  v41 = -[PXConcreteAudioCueSource cues](objc_retainAutorelease(self), "cues");
  var0 = (CMTime)a3->var0;
  v13 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v13, "appendString:", CFSTR("           "));
  v14 = objc_msgSend(v13, "length");
  if ((a5->var0.var2 & 1) == 0 || (a5->var1.var2 & 1) == 0 || a5->var1.var3 || a5->var1.var0 < 0)
  {
    v15 = *(_OWORD *)&a3->var0.var0;
    v16 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&a5->var0.var3 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&a5->var1.var1 = v16;
    *(_OWORD *)&a5->var0.var0 = v15;
    v17 = CFSTR(" ");
    v38 = CFSTR(" ");
  }
  else
  {
    v38 = CFSTR("}");
    v17 = CFSTR("{");
  }
  while (1)
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    range.start.epoch = a5->var0.var3;
    rhs = v60;
    CMTimeSubtract(&time2, &range.start, &rhs);
    range.start = var0;
    if ((CMTimeCompare(&range.start, &time2) & 0x80000000) == 0 || v14 >= a6)
      break;
    range.start = var0;
    rhs = v60;
    CMTimeAdd(&var0, &range.start, &rhs);
    objc_msgSend(v13, "appendString:", CFSTR(" "));
    v14 = objc_msgSend(v13, "length");
  }
  if (v14 >= a6)
    goto LABEL_14;
  range.start = var0;
  rhs = (CMTime)a5->var0;
  if ((CMTimeCompare(&range.start, &rhs) & 0x80000000) == 0)
    goto LABEL_14;
  rhs = var0;
  time1 = v60;
  CMTimeAdd(&range.start, &rhs, &time1);
  var0 = range.start;
  while (1)
  {
    objc_msgSend(v13, "appendString:", v17);
    v14 = objc_msgSend(v13, "length");
LABEL_14:
    *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
    range.start.epoch = a4->var3;
    rhs = v60;
    CMTimeSubtract(&v55, &range.start, &rhs);
    range.start = var0;
    if ((CMTimeCompare(&range.start, &v55) & 0x80000000) == 0 || v14 >= a6)
      break;
    rhs = var0;
    time1 = v60;
    CMTimeAdd(&range.start, &rhs, &time1);
    var0 = range.start;
    v17 = CFSTR(" ");
  }
  if (v14 >= a6)
    goto LABEL_21;
  range.start = var0;
  rhs = (CMTime)*a4;
  if ((CMTimeCompare(&range.start, &rhs) & 0x80000000) == 0)
    goto LABEL_21;
  rhs = var0;
  time1 = v60;
  CMTimeAdd(&range.start, &rhs, &time1);
  var0 = range.start;
  for (i = CFSTR("◎"); ; i = CFSTR(" "))
  {
    objc_msgSend(v13, "appendString:", i);
    v14 = objc_msgSend(v13, "length");
LABEL_21:
    v19 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v19;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&lhs, &range);
    range.start = v60;
    CMTimeSubtract(&v54, &lhs, &range.start);
    range.start = var0;
    if ((CMTimeCompare(&range.start, &v54) & 0x80000000) == 0 || v14 >= a6)
      break;
    rhs = var0;
    time1 = v60;
    CMTimeAdd(&range.start, &rhs, &time1);
    var0 = range.start;
  }
  if (v14 >= a6)
  {
    v21 = v39;
  }
  else
  {
    v20 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v20;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    CMTimeRangeGetEnd(&v52, &range);
    range.start = var0;
    v21 = v39;
    if (CMTimeCompare(&range.start, &v52) < 0)
    {
      objc_msgSend(v13, "appendString:", v38);
      v14 = objc_msgSend(v13, "length");
    }
  }
  if (v14 < a6)
  {
    do
      objc_msgSend(v13, "appendString:", CFSTR(" "));
    while (objc_msgSend(v13, "length") < a6);
  }
  objc_msgSend(v21, "appendString:", v13);
  objc_msgSend(v21, "appendString:", CFSTR("\n"));
  if (v40 < 1)
  {
    objc_msgSend(v21, "appendString:", CFSTR("  Cues: --\n"));
  }
  else
  {
    v22 = a6 - 9;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    range.start.epoch = a3->var0.var3;
    v45 = MEMORY[0x1E0C809B0];
    v46 = 3221225472;
    v47 = __108__PXConcreteAudioCueSource_diagnosticStringForTimeRange_indicatorTime_rangeIndicatorTimeRange_stringLength___block_invoke;
    v48 = &__block_descriptor_64_e8_B16__0q8l;
    v23 = v41;
    v49 = v41;
    v50 = *(_OWORD *)&range.start.value;
    epoch = range.start.epoch;
    v24 = PXFirstIndexInSortedRangePassingTest();
    if ((v24 & 1) != 0)
      v25 = CFSTR("[●]");
    else
      v25 = CFSTR("[○]");
    objc_msgSend(v11, "appendString:", v25);
    v26 = objc_msgSend(v11, "length");
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        v27 = (CMTime *)&v23[v24];
        rhs = *v27;
        value = v27[1].value;
        while (1)
        {
          time1 = rhs;
          start = v60;
          CMTimeSubtract(&v44, &time1, &start);
          time1 = range.start;
          if ((CMTimeCompare(&time1, &v44) & 0x80000000) == 0 || v26 >= v22)
            break;
          time1 = range.start;
          start = v60;
          CMTimeAdd(&range.start, &time1, &start);
          objc_msgSend(v11, "appendString:", CFSTR("-"));
          v26 = objc_msgSend(v11, "length");
        }
        if (v26 >= a6)
          break;
        v29 = CFSTR("?");
        if ((unint64_t)(value - 1) <= 3)
          v29 = off_1E51175A8[value - 1];
        v30 = v29;
        objc_msgSend(v11, "appendString:", v30);
        v26 = objc_msgSend(v11, "length");
        start = range.start;
        v42 = v60;
        CMTimeAdd(&time1, &start, &v42);
        range.start = time1;
        if (++v24 >= v40
          || (v31 = &v41[v24],
              v32 = *(_OWORD *)&v31->var0.var0,
              time1.epoch = v31->var0.var3,
              *(_OWORD *)&time1.value = v32,
              start = v62,
              CMTimeCompare(&time1, &start) > 0)
          || objc_msgSend(v11, "length") >= (unint64_t)v22)
        {

          break;
        }

        v23 = v41;
      }
      v21 = v39;
    }
    if (v26 < v22)
    {
      do
        objc_msgSend(v11, "appendString:", CFSTR("-"));
      while (objc_msgSend(v11, "length") < v22);
    }
    objc_msgSend(v21, "appendFormat:", CFSTR("  Cues: %@\n"), v11);
    v33 = CFSTR("+");
    v34 = CFSTR("|");
    v35 = CFSTR("§");
    v36 = CFSTR("$");
    objc_msgSend(v21, "appendFormat:", CFSTR("        %@ = Beat; %@ = Bar; %@ = Segment; %@ = Section"),
      CFSTR("+"),
      CFSTR("|"),
      CFSTR("§"),
      CFSTR("$"));

  }
  return v21;
}

- (int64_t)_indexOfFirstCueFollowingTime:(id *)a3
{
  PXConcreteAudioCueSource *v3;

  v3 = objc_retainAutorelease(self);
  -[PXConcreteAudioCueSource cues](v3, "cues");
  -[PXConcreteAudioCueSource numberOfCues](v3, "numberOfCues");
  return PXFirstIndexInSortedRangePassingTest();
}

- (int64_t)_indexOfFirstCueInRange:(id *)a3
{
  int64_t v5;
  __int128 v7;
  PXConcreteAudioCueSource *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CMTimeRange range;
  CMTimeRange otherRange;

  if ((a3->var0.var2 & 1) == 0)
    return -[PXConcreteAudioCueSource firstCueIndex](self, "firstCueIndex");
  if ((a3->var1.var2 & 1) == 0)
    return -[PXConcreteAudioCueSource firstCueIndex](self, "firstCueIndex");
  if (a3->var1.var3)
    return -[PXConcreteAudioCueSource firstCueIndex](self, "firstCueIndex");
  if (a3->var1.var0 < 0)
    return -[PXConcreteAudioCueSource firstCueIndex](self, "firstCueIndex");
  -[PXConcreteAudioCueSource cueTimeRange](self, "cueTimeRange");
  v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  if (CMTimeRangeContainsTimeRange(&range, &otherRange))
    return -[PXConcreteAudioCueSource firstCueIndex](self, "firstCueIndex");
  v8 = objc_retainAutorelease(self);
  v9 = -[PXConcreteAudioCueSource cues](v8, "cues");
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  range.start.epoch = a3->var0.var3;
  v10 = -[PXConcreteAudioCueSource _indexOfFirstCueFollowingTime:](v8, "_indexOfFirstCueFollowingTime:", &range);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v10;
  v11 = v9 + 32 * v10;
  v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v13 = *(_OWORD *)v11;
  v14 = *(_QWORD *)(v11 + 16);
  if (!PXCMTimeRangeContainsTimeInclusive((uint64_t)&range, (uint64_t)&v13))
    return 0x7FFFFFFFFFFFFFFFLL;
  return v5;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)cueTimeRange
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v6;
  $D5021987E997E6DF12FC1EC57F7BF105 *v7;
  $D5021987E997E6DF12FC1EC57F7BF105 *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  CMTime v13;
  CMTime start;

  result = -[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues");
  if (result)
  {
    v6 = result;
    v7 = -[PXConcreteAudioCueSource cues](objc_retainAutorelease(self), "cues");
    v8 = &v7[(_QWORD)v6];
    v9 = *(_OWORD *)&v7->var0.var0;
    start.epoch = v7->var0.var3;
    *(_OWORD *)&start.value = v9;
    v10 = *(_OWORD *)&v8[-1].var0.var0;
    v13.epoch = v8[-1].var0.var3;
    *(_OWORD *)&v13.value = v10;
    return ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v13);
  }
  else
  {
    v11 = MEMORY[0x1E0CA2E40];
    v12 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v12;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v11 + 32);
  }
  return result;
}

- (int64_t)firstCueIndex
{
  if (-[PXConcreteAudioCueSource numberOfCues](self, "numberOfCues") <= 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0;
}

- ($D5021987E997E6DF12FC1EC57F7BF105)cues
{
  return self->_cues;
}

- (int64_t)numberOfCues
{
  return self->_numberOfCues;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

BOOL __58__PXConcreteAudioCueSource__indexOfFirstCueFollowingTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  CMTime v5;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 32) + 32 * a2;
  v3 = *(_OWORD *)v2;
  time1.epoch = *(_QWORD *)(v2 + 16);
  *(_OWORD *)&time1.value = v3;
  v5 = *(CMTime *)(a1 + 40);
  return CMTimeCompare(&time1, &v5) >= 0;
}

BOOL __108__PXConcreteAudioCueSource_diagnosticStringForTimeRange_indicatorTime_rangeIndicatorTimeRange_stringLength___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  CMTime v5;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 32) + 32 * a2;
  v3 = *(_OWORD *)v2;
  time1.epoch = *(_QWORD *)(v2 + 16);
  *(_OWORD *)&time1.value = v3;
  v5 = *(CMTime *)(a1 + 40);
  return CMTimeCompare(&time1, &v5) >= 0;
}

double __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke(uint64_t a1, CMTime *a2)
{
  CMTimeValue value;
  double v5;
  CMTime time;
  CMTime time2;
  CMTime time1;

  *(_OWORD *)&time1.value = *(_OWORD *)&a2->value;
  value = a2[1].value;
  time1.epoch = a2->epoch;
  memset(&time2, 0, sizeof(time2));
  if (!CMTimeCompare(&time1, &time2) && !value)
    return 2.22507386e-308;
  v5 = (double)a2[1].value;
  if ((*(_DWORD *)(a1 + 44) & 0x1D) == 1)
  {
    time1 = *a2;
    time2 = *(CMTime *)(a1 + 32);
    CMTimeSubtract(&time, &time1, &time2);
    return v5 + fabs(CMTimeGetSeconds(&time)) * -2.22044605e-16;
  }
  return v5;
}

__n128 __57__PXConcreteAudioCueSource_bestCueInRange_preferredTime___block_invoke_2(_QWORD *a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  double (*v7)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v8;
  __n128 result;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  v6 = a1[4];
  v7 = *(double (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v8 = a2[1];
  v13[0] = *a2;
  v13[1] = v8;
  result.n128_f64[0] = v7(v6, v13, a3, a4);
  v10 = *(_QWORD *)(a1[5] + 8);
  if (result.n128_f64[0] > *(double *)(v10 + 24))
  {
    *(_QWORD *)(v10 + 24) = result.n128_u64[0];
    v11 = *(_QWORD *)(a1[6] + 8);
    result = *(__n128 *)a2;
    v12 = a2[1];
    *(_OWORD *)(v11 + 32) = *a2;
    *(_OWORD *)(v11 + 48) = v12;
  }
  return result;
}

@end
