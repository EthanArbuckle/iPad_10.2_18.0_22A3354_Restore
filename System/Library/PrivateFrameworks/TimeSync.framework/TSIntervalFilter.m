@implementation TSIntervalFilter

- (TSIntervalFilter)initWithExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4 filterSize:(unsigned __int8)a5
{
  TSIntervalFilter *v8;
  TSIntervalFilter *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *syncQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSIntervalFilter;
  v8 = -[TSIntervalFilter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_expectedInterval = a3;
    v8->_multiIntervalCount = a4;
    v8->_filterCount = 0;
    v8->_timestampIndex = 0;
    v8->_validEntry = -1;
    v8->_filterSize = a5;
    v8->_filterOffset = a3 << a5;
    v8->_filteredTimestamps = (unint64_t *)malloc_type_calloc(a4 + 1, 8uLL, 0x100004000313F17uLL);
    v10 = dispatch_queue_create("com.apple.TimeSync.TSIntervalFilter", 0);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v10;

    if (!v9->_filteredTimestamps || !v9->_syncQueue)
    {

      return 0;
    }
  }
  return v9;
}

- (unint64_t)_calculateNewTimestamp:(unint64_t)a3
{
  unint64_t v4;
  unsigned int filterSize;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  IOTS_U128 v9;
  IOTS_U128 *p_filteredOffset;
  unsigned int v11;
  unsigned int v12;
  unint64_t expectedInterval;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  IOTS_U128 *p_filteredSnapshot;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  IOTS_U128 v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t lo;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  IOTS_U128 v45;
  IOTS_U128 v46;

  v4 = self->_filterOffset + a3;
  if (self->_filterCount)
  {
    filterSize = self->_filterSize;
    v6 = v4 << self->_filterSize;
    v7 = v6;
    if (filterSize <= 0x3F)
      v6 = v4 >> -(char)filterSize;
    else
      v7 = 0;
    if (filterSize == 64)
    {
      v7 = 0;
      v6 = self->_filterOffset + a3;
    }
    if (self->_filterSize)
    {
      v4 = v7;
      v8 = v6;
    }
    else
    {
      v8 = self->_filterSize;
    }
    v45.lo = v4;
    v45.hi = v8;
    IIR(&self->_filteredSnapshot, v45, filterSize);
    v9 = (IOTS_U128)(__PAIR128__(v8 - self->_filteredSnapshot.hi, v4) - self->_filteredSnapshot.lo);
    p_filteredOffset = &self->_filteredOffset;
    v11 = self->_filterSize;
  }
  else
  {
    v12 = self->_filterSize;
    if (v12 == 64)
    {
      v17 = 0;
      self->_filteredSnapshot.lo = 0;
      self->_filteredSnapshot.hi = v4;
      p_filteredSnapshot = &self->_filteredSnapshot;
    }
    else
    {
      expectedInterval = self->_expectedInterval;
      if (self->_filterSize)
      {
        v19 = expectedInterval << v12;
        v20 = expectedInterval >> -(char)v12;
        v21 = expectedInterval << v12;
        if (v12 <= 0x3F)
          v19 = v20;
        else
          v21 = 0;
        v14 = v4 >= v21;
        v22 = v4 - v21;
        if (v14)
          v23 = 0;
        else
          v23 = -1;
        v24 = v23 - v19;
        v25 = v22 << v12;
        v26 = (v24 << v12) | (v22 >> -(char)v12);
        v27 = v22 << v12;
        if (v12 <= 0x3F)
          v28 = v27;
        else
          v28 = 0;
        if (v12 <= 0x3F)
          v29 = v26;
        else
          v29 = v25;
        self->_filteredSnapshot.lo = v28;
        self->_filteredSnapshot.hi = v29;
        p_filteredSnapshot = &self->_filteredSnapshot;
        if (v12 <= 0x3F)
          v17 = v4 << v12;
        else
          v17 = 0;
        if (v12 <= 0x3F)
          v4 >>= -(char)v12;
        else
          v4 <<= v12;
      }
      else
      {
        v14 = v4 >= expectedInterval;
        v15 = v4 - expectedInterval;
        if (v14)
          v16 = 0;
        else
          v16 = -1;
        self->_filteredSnapshot.lo = v15;
        self->_filteredSnapshot.hi = v16;
        p_filteredSnapshot = &self->_filteredSnapshot;
        v17 = v4;
        v4 = 0;
      }
    }
    v46.lo = v17;
    v46.hi = v4;
    IIR(p_filteredSnapshot, v46, v12);
    v30 = (IOTS_U128)(__PAIR128__(v4 - self->_filteredSnapshot.hi, v17) - self->_filteredSnapshot.lo);
    v31 = IOTS_uint64mul(self->_expectedInterval, ~(-1 << self->_filterSize));
    v11 = self->_filterSize;
    v33 = self->_filterSize;
    v34 = v31 << v33;
    v35 = (v31 >> -(char)v11) | (v32 << v33);
    v36 = v31 << v33;
    if (v11 <= 0x3F)
      v34 = v35;
    else
      v36 = 0;
    if (v11 == 64)
    {
      v36 = 0;
      v34 = v31;
    }
    if (!self->_filterSize)
    {
      v36 = v31;
      v34 = v32;
    }
    self->_filteredOffset.lo = v36;
    self->_filteredOffset.hi = v34;
    p_filteredOffset = &self->_filteredOffset;
    v9 = v30;
  }
  IIR(p_filteredOffset, v9, v11);
  lo = self->_filteredOffset.lo;
  v38 = self->_filteredSnapshot.lo;
  v14 = __CFADD__(v38, lo);
  v39 = v38 + lo;
  LODWORD(v40) = v14;
  if (v39 < v38)
    v40 = 1;
  else
    v40 = v40;
  v41 = self->_filterSize;
  if (self->_filterSize)
  {
    v42 = self->_filteredSnapshot.hi + self->_filteredOffset.hi + v40;
    if (v41 != 64)
    {
      v43 = (v42 << -(char)v41) | (v39 >> v41);
      if (v41 <= 0x3F)
        v42 = v43;
      else
        v42 >>= v41;
    }
  }
  else
  {
    v42 = v39;
  }
  return v42 - self->_filterOffset;
}

- (unint64_t)addTimestamp:(unint64_t)a3
{
  return -[TSIntervalFilter addTimestamp:entry:](self, "addTimestamp:entry:", a3, 0);
}

- (unint64_t)addTimestamp:(unint64_t)a3 entry:(int64_t *)a4
{
  NSObject *syncQueue;
  unint64_t v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__TSIntervalFilter_addTimestamp_entry___block_invoke;
  v7[3] = &unk_1E694B908;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(syncQueue, v7);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__TSIntervalFilter_addTimestamp_entry___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 24))
  {
    **(_QWORD **)(v2 + 32) = a1[6];
    *(_QWORD *)(*(_QWORD *)(a1[4] + 32) + 8 * *(unsigned int *)(a1[4] + 16)) = a1[6] - *(_QWORD *)(a1[4] + 8);
    v3 = a1[4];
    v4 = *(unsigned int *)(v3 + 16);
    if (v4 >= 2)
    {
      do
      {
        v5 = a1[4];
        v6 = *(_QWORD *)(v5 + 32);
        v7 = *(_QWORD *)(v6 + 8 * v4--) - *(_QWORD *)(v5 + 8);
        *(_QWORD *)(v6 + 8 * v4) = v7;
      }
      while ((v4 & 0xFFFFFFFE) != 0);
      v3 = a1[4];
    }
    *(_DWORD *)(v3 + 40) = 0;
    v2 = a1[4];
  }
  result = objc_msgSend((id)v2, "_calculateNewTimestamp:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 32) + 8 * (*(_DWORD *)(a1[4] + 40))++) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v9 = a1[4];
  if (*(_DWORD *)(v9 + 40) == *(_DWORD *)(v9 + 16) + 1)
  {
    *(_DWORD *)(v9 + 40) = 0;
    v9 = a1[4];
  }
  ++*(_QWORD *)(v9 + 24);
  v10 = a1[4];
  v11 = (*(_DWORD *)(v10 + 176) + 1) & 7;
  *(_QWORD *)(v10 + 8 * v11 + 48) = *(_QWORD *)(v10 + 24);
  *(_QWORD *)(a1[4] + 8 * v11 + 112) = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)
                                     - *(_QWORD *)(*(_QWORD *)(a1[4] + 32) + 8 * *(unsigned int *)(a1[4] + 40));
  *(_QWORD *)(a1[4] + 176) = v11;
  v12 = (_QWORD *)a1[7];
  if (v12)
    *v12 = v11;
  return result;
}

- (unint64_t)multiIntervalTime
{
  return -[TSIntervalFilter multiIntervalTimeForEntry:](self, "multiIntervalTimeForEntry:", -1);
}

- (unint64_t)multiIntervalTimeForEntry:(int64_t)validEntry
{
  unint64_t result;

  result = -1;
  if (validEntry < 0)
    validEntry = self->_validEntry;
  if ((unint64_t)validEntry <= 7)
    return self->_timestampIntervals[validEntry];
  return result;
}

- (unint64_t)filterCount
{
  return -[TSIntervalFilter filterCountForEntry:](self, "filterCountForEntry:", -1);
}

- (unint64_t)filterCountForEntry:(int64_t)validEntry
{
  if (validEntry < 0)
    validEntry = self->_validEntry;
  if ((unint64_t)validEntry > 7)
    return 0;
  else
    return self->_timestampCount[validEntry];
}

- (void)resetFilter
{
  unint64_t v3;
  unint64_t expectedInterval;

  v3 = -[TSIntervalFilter multiIntervalTime](self, "multiIntervalTime");
  if (v3 == -1)
    expectedInterval = self->_expectedInterval;
  else
    expectedInterval = v3 / self->_multiIntervalCount;
  -[TSIntervalFilter resetFilterWithNewExpectedInterval:](self, "resetFilterWithNewExpectedInterval:", expectedInterval);
}

- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3
{
  -[TSIntervalFilter resetFilterWithNewExpectedInterval:multiIntervalCount:](self, "resetFilterWithNewExpectedInterval:multiIntervalCount:", a3, self->_multiIntervalCount);
}

- (void)resetFilterWithNewExpectedInterval:(unint64_t)a3 multiIntervalCount:(unsigned int)a4
{
  NSObject *syncQueue;
  _QWORD block[6];
  unsigned int v6;

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TSIntervalFilter_resetFilterWithNewExpectedInterval_multiIntervalCount___block_invoke;
  block[3] = &unk_1E694B930;
  v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(syncQueue, block);
}

_QWORD *__74__TSIntervalFilter_resetFilterWithNewExpectedInterval_multiIntervalCount___block_invoke(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = result;
  v2 = result[4];
  if (*(_DWORD *)(v2 + 16) != *((_DWORD *)result + 12))
  {
    free(*(void **)(v2 + 32));
    *(_DWORD *)(v1[4] + 16) = *((_DWORD *)v1 + 12);
    result = malloc_type_calloc((*(_DWORD *)(v1[4] + 16) + 1), 8uLL, 0x100004000313F17uLL);
    *(_QWORD *)(v1[4] + 32) = result;
    v2 = v1[4];
  }
  *(_QWORD *)(v2 + 8) = v1[5];
  *(_QWORD *)(v1[4] + 200) = *(_QWORD *)(v1[4] + 8) << *(_BYTE *)(v1[4] + 192);
  *(_QWORD *)(v1[4] + 24) = 0;
  *(_QWORD *)(v1[4] + 176) = -1;
  return result;
}

- (void)changeToNewFilterSize:(unsigned __int8)a3
{
  self->_filterSize = a3;
  -[TSIntervalFilter resetFilter](self, "resetFilter");
}

- (void)dealloc
{
  objc_super v3;

  free(self->_filteredTimestamps);
  v3.receiver = self;
  v3.super_class = (Class)TSIntervalFilter;
  -[TSIntervalFilter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  return self;
}

@end
