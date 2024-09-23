@implementation TSIntervalTimeLineFilter

- (TSIntervalTimeLineFilter)initWithExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 filterSize:(unsigned __int8)a5
{
  uint64_t v5;
  TSIntervalTimeLineFilter *v8;
  TSIntervalTimeLineFilter *v9;
  TSIntervalFilter *v10;
  TSIntervalFilter *aIntervalFilter;
  TSIntervalFilter *v12;
  TSIntervalFilter *bIntervalFilter;
  dispatch_queue_t v14;
  OS_dispatch_queue *syncQueue;
  objc_super v17;

  v5 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSIntervalTimeLineFilter;
  v8 = -[TSIntervalTimeLineFilter init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_validIndex = -1;
    v10 = -[TSIntervalFilter initWithExpectedInterval:multiIntervalCount:filterSize:]([TSIntervalFilter alloc], "initWithExpectedInterval:multiIntervalCount:filterSize:", a3, 1, v5);
    aIntervalFilter = v9->_aIntervalFilter;
    v9->_aIntervalFilter = v10;

    v12 = -[TSIntervalFilter initWithExpectedInterval:multiIntervalCount:filterSize:]([TSIntervalFilter alloc], "initWithExpectedInterval:multiIntervalCount:filterSize:", a4, 1, v5);
    bIntervalFilter = v9->_bIntervalFilter;
    v9->_bIntervalFilter = v12;

    v14 = dispatch_queue_create("com.apple.TimeSync.TSIntervalTimeLineFilter", 0);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v14;

    if (!v9->_aIntervalFilter || !v9->_bIntervalFilter || !v9->_syncQueue)
    {

      return 0;
    }
  }
  return v9;
}

- (void)addTimestamps:(id)a3
{
  NSObject *syncQueue;
  _QWORD block[5];
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v5;

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TSIntervalTimeLineFilter_addTimestamps___block_invoke;
  block[3] = &unk_1E694B058;
  block[4] = self;
  v5 = a3;
  dispatch_sync(syncQueue, block);
}

uint64_t __42__TSIntervalTimeLineFilter_addTimestamps___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1[4];
  v3 = (*(_DWORD *)(v2 + 272) + 1) & 7;
  *(_QWORD *)(v2 + 8 + 8 * v3) = objc_msgSend(*(id *)(v2 + 280), "addTimestamp:entry:", a1[5], v2 + 136 + 8 * v3);
  result = objc_msgSend(*(id *)(a1[4] + 288), "addTimestamp:entry:", a1[6], a1[4] + 200 + 8 * v3);
  *(_QWORD *)(a1[4] + 72 + 8 * v3) = result;
  *(_QWORD *)(a1[4] + 272) = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)rateRatio
{
  unint64_t validIndex;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  validIndex = self->_validIndex;
  if (validIndex > 7)
  {
    v5 = -1;
    v4 = -1;
  }
  else
  {
    v4 = -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]);
    v5 = -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]);
  }
  v6 = v4;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (void)getAnchors:(id *)a3 andRateRatio:(id *)a4
{
  unint64_t validIndex;

  if (a3)
  {
    a3->var0 = -1;
    a3->var1 = -1;
  }
  if (a4)
  {
    a4->var0 = -1;
    a4->var1 = -1;
  }
  validIndex = self->_validIndex;
  if (validIndex <= 7)
  {
    if (a3)
    {
      a3->var0 = self->_AAnchor[validIndex];
      a3->var1 = self->_BAnchor[validIndex];
    }
    if (a4)
    {
      a4->var0 = -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]);
      a4->var1 = -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]);
    }
  }
}

- (unint64_t)domainATimeFromDomainBTime:(unint64_t)a3
{
  int64_t validIndex;

  validIndex = self->_validIndex;
  if (validIndex > 7)
    return -1;
  else
    return TSTimeXtoTimeY(a3, self->_BAnchor[validIndex], -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]), self->_AAnchor[validIndex], -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]));
}

- (unint64_t)domainAIntervalFromDomainBInterval:(unint64_t)a3
{
  int64_t validIndex;

  validIndex = self->_validIndex;
  if (validIndex > 7)
    return -1;
  else
    return TSIntervalXtoIntervalY(a3, -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]), -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]));
}

- (unint64_t)domainBTimeFromDomainATime:(unint64_t)a3
{
  int64_t validIndex;

  validIndex = self->_validIndex;
  if (validIndex > 7)
    return -1;
  else
    return TSTimeXtoTimeY(a3, self->_AAnchor[validIndex], -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]), self->_BAnchor[validIndex], -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]));
}

- (unint64_t)domainBIntervalFromDomainAInterval:(unint64_t)a3
{
  int64_t validIndex;

  validIndex = self->_validIndex;
  if (validIndex > 7)
    return -1;
  else
    return TSIntervalXtoIntervalY(a3, -[TSIntervalFilter multiIntervalTimeForEntry:](self->_aIntervalFilter, "multiIntervalTimeForEntry:", self->_AEntries[validIndex]), -[TSIntervalFilter multiIntervalTimeForEntry:](self->_bIntervalFilter, "multiIntervalTimeForEntry:", self->_BEntries[validIndex]));
}

- (void)resetFilter
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TSIntervalTimeLineFilter_resetFilter__block_invoke;
  block[3] = &unk_1E694B080;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __39__TSIntervalTimeLineFilter_resetFilter__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "resetFilter");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "resetFilter");
}

- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4
{
  NSObject *syncQueue;
  _QWORD block[7];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval___block_invoke;
  block[3] = &unk_1E694B058;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(syncQueue, block);
}

uint64_t __94__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 280), "resetFilterWithNewExpectedInterval:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 288), "resetFilterWithNewExpectedInterval:", a1[6]);
}

- (void)resetFilterWithNewExpectedDomainAInterval:(unint64_t)a3 expectedDomainBInterval:(unint64_t)a4 multiIntervalCount:(unsigned int)a5
{
  NSObject *syncQueue;
  _QWORD v6[7];
  unsigned int v7;

  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval_multiIntervalCount___block_invoke;
  v6[3] = &unk_1E694B0A8;
  v6[4] = self;
  v6[5] = a3;
  v7 = a5;
  v6[6] = a4;
  dispatch_sync(syncQueue, v6);
}

uint64_t __113__TSIntervalTimeLineFilter_resetFilterWithNewExpectedDomainAInterval_expectedDomainBInterval_multiIntervalCount___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "resetFilterWithNewExpectedInterval:multiIntervalCount:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "resetFilterWithNewExpectedInterval:multiIntervalCount:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

- (void)changeToNewFilterSize:(unsigned __int8)a3
{
  NSObject *syncQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__TSIntervalTimeLineFilter_changeToNewFilterSize___block_invoke;
  v4[3] = &unk_1E694B0D0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __50__TSIntervalTimeLineFilter_changeToNewFilterSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "changeToNewFilterSize:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "changeToNewFilterSize:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)canConvertTime
{
  return self->_validIndex != -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bIntervalFilter, 0);
  objc_storeStrong((id *)&self->_aIntervalFilter, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
