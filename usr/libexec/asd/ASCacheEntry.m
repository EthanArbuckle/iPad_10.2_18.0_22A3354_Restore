@implementation ASCacheEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_C56902430"));
}

- (id)nC4QvxwoXaT2I88i
{
  void *v3;
  void *v4;
  unsigned int v5;
  int8x8_t *v6;
  uint64x2_t v7;
  uint64x2_t v8;
  id v9;
  unsigned int v10;
  void *v11;
  double v12;
  uint64x2_t v13;
  uint64x2_t v14;
  uint64x2_t v15;
  int16x8_t v16;
  NSObject *v17;
  id v18;
  _QWORD v20[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCacheEntry dfVal](self, "dfVal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));

  v5 = objc_msgSend(v4, "length");
  v6 = (int8x8_t *)malloc_type_malloc(v5 + 36, 0x3DC415C9uLL);
  v7 = (uint64x2_t)vdupq_n_s64((unint64_t)-[ASCacheEntry counter](self, "counter"));
  *v6 = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE030))));
  v8 = (uint64x2_t)vdupq_n_s64((unint64_t)-[ASCacheEntry df_ttl](self, "df_ttl"));
  v6[1] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_1003FE030))));
  v9 = objc_retainAutorelease(v4);
  memcpy(&v6[2], objc_msgSend(v9, "bytes"), (size_t)objc_msgSend(v9, "length"));
  v10 = objc_msgSend(v9, "length");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCacheEntry presentTime](self, "presentTime"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = (uint64x2_t)vdupq_n_s64((unint64_t)v12);
  *(int8x8_t *)((char *)v6 + v10 + 16) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v13, (uint64x2_t)xmmword_1003FE030))));

  v14 = (uint64x2_t)vdupq_n_s64((unint64_t)-[ASCacheEntry queryKey](self, "queryKey"));
  *(int8x8_t *)((char *)v6 + v10 + 24) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE030))));
  v15 = (uint64x2_t)vdupq_n_s64((int)-[ASCacheEntry profID](self, "profID"));
  v16 = (int16x8_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE010);
  *(int32x2_t *)v15.i8 = vmovn_s64((int64x2_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE020));
  *(int32x2_t *)v16.i8 = vmovn_s64((int64x2_t)v16);
  v16.i16[1] = v16.i16[2];
  v16.i16[2] = v15.i16[0];
  v16.i16[3] = v15.i16[2];
  *(__int32 *)((char *)v6[4].i32 + v10) = vmovn_s16(v16).u32[0];
  if (v10 == v5)
  {
    sub_10027ADA4();
    free(v6);
  }
  else
  {
    free(v6);
    v20[0] = 0;
    v20[1] = 0;
    v17 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
      sub_1003D6DEC(v17);
  }
  v18 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v20);

  return v18;
}

- (BOOL)PJ7tY2vmxQ3CBhNO
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASCacheEntry nC4QvxwoXaT2I88i](self, "nC4QvxwoXaT2I88i"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCacheEntry macVal](self, "macVal"));
  v5 = objc_msgSend(v4, "isEqual:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCacheEntry presentTime](self, "presentTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", (double)(uint64_t)-[ASCacheEntry df_ttl](self, "df_ttl") / 1000.0));

    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8 >= 0.0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
