@implementation _CalendarEventsRow

- (_CalendarEventsRow)init
{
  _CalendarEventsRow *v2;
  NSMutableArray *v3;
  NSMutableArray *blocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CalendarEventsRow;
  v2 = -[_CalendarEventsRow init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    blocks = v2->_blocks;
    v2->_blocks = v3;

    v2->_occupyingDays = 0;
  }
  return v2;
}

- (void)addOccurrenceBlock:(id)a3
{
  unint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64x2_t v8;
  int64x2_t v9;
  int32x4_t v10;
  int32x4_t v11;
  unsigned __int128 v12;
  int32x4_t v13;
  int64x2_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x8_t v18;
  id v19;

  v19 = a3;
  -[NSMutableArray addObject:](self->_blocks, "addObject:", v19);
  v4 = (unint64_t)objc_msgSend(v19, "startRange");
  v5 = objc_msgSend(v19, "length");
  v6 = self->_occupyingDays | (1 << v4);
  if (v5 != (id)1)
  {
    v7 = 0;
    v8 = (uint64x2_t)vdupq_n_s64((unint64_t)v5 - 2);
    v9 = vdupq_n_s64(v4);
    v10 = (int32x4_t)vaddq_s64(v9, (int64x2_t)xmmword_1001A1510);
    v11 = (int32x4_t)vaddq_s64(v9, (int64x2_t)xmmword_1001A1520);
    v12 = self->_occupyingDays | (unsigned __int128)(1 << v4);
    v13.i64[0] = 0x100000001;
    v13.i64[1] = 0x100000001;
    v14 = vdupq_n_s64(4uLL);
    do
    {
      v15 = (int8x16_t)v12;
      v12 = (unsigned __int128)vorrq_s8((int8x16_t)vshlq_u32((uint32x4_t)v13, (uint32x4_t)vaddq_s32(vuzp1q_s32(v11, v10), v13)), (int8x16_t)v12);
      v7 += 4;
      v10 = (int32x4_t)vaddq_s64((int64x2_t)v10, v14);
      v11 = (int32x4_t)vaddq_s64((int64x2_t)v11, v14);
    }
    while ((((unint64_t)v5 + 2) & 0xFFFFFFFFFFFFFFFCLL) != v7);
    v16 = (int8x16_t)vdupq_n_s64(v7 - 4);
    v17 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)vorrq_s8(v16, (int8x16_t)xmmword_1001A1520), v8), (int32x4_t)vcgtq_u64((uint64x2_t)vorrq_s8(v16, (int8x16_t)xmmword_1001A1510), v8)), v15, (int8x16_t)v12);
    v18 = vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL));
    v6 = v18.i32[0] | v18.i32[1];
  }
  self->_occupyingDays = v6;

}

- (BOOL)isFilledForDay:(unint64_t)a3
{
  char v3;

  return !(((self->_occupyingDays & (1 << a3)) < 0) ^ v3 | ((self->_occupyingDays & (1 << a3)) == 0));
}

- (id)occurrenceForDay:(unint64_t)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  char *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_blocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "startRange", (_QWORD)v14);
        v11 = (char *)objc_msgSend(v9, "length");
        if ((unint64_t)v10 <= a3 && &v11[(_QWORD)v10 - 1] >= (char *)a3)
        {
          v12 = v9;
          goto LABEL_12;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unint64_t)spaceGapFor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_blocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "gapBetweenBlock:", v4, (_QWORD)v13);
        if (v11 == (id)-1)
        {
          v8 = -1;
          goto LABEL_14;
        }
        if ((unint64_t)v11 > v8)
          v8 = (unint64_t)v11;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)occurrenceBlocks
{
  return self->_blocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
