@implementation ASClass101288420

- (id)nC4QvxwoXaT2I88i
{
  void *v3;
  void *v4;
  unsigned int v5;
  char *v6;
  uint64x2_t v7;
  int16x8_t v8;
  uint64x2_t v9;
  id v10;
  unsigned int v11;
  void *v12;
  double v13;
  uint64x2_t v14;
  uint64x2_t v15;
  uint64x2_t v16;
  int16x8_t v17;
  NSObject *v18;
  id v19;
  _QWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASClass101288420 dfVal](self, "dfVal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataUsingEncoding:", 4));

  v5 = objc_msgSend(v4, "length");
  v6 = (char *)malloc_type_malloc(v5 + 32, 0x3142594BuLL);
  v7 = (uint64x2_t)vdupq_n_s64((int)-[ASClass101288420 version](self, "version"));
  v8 = (int16x8_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE010);
  *(int32x2_t *)v7.i8 = vmovn_s64((int64x2_t)vshlq_u64(v7, (uint64x2_t)xmmword_1003FE020));
  *(int32x2_t *)v8.i8 = vmovn_s64((int64x2_t)v8);
  v8.i16[1] = v8.i16[2];
  v8.i16[2] = v7.i16[0];
  v8.i16[3] = v7.i16[2];
  *(_DWORD *)v6 = vmovn_s16(v8).u32[0];
  v9 = (uint64x2_t)vdupq_n_s64((unint64_t)-[ASClass101288420 dfMaxAge](self, "dfMaxAge"));
  *(int8x8_t *)(v6 + 4) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_1003FE030))));
  v10 = objc_retainAutorelease(v4);
  memcpy(v6 + 12, objc_msgSend(v10, "bytes"), (size_t)objc_msgSend(v10, "length"));
  v11 = objc_msgSend(v10, "length");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASClass101288420 presentTime](self, "presentTime"));
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = (uint64x2_t)vdupq_n_s64((unint64_t)v13);
  *(int8x8_t *)&v6[v11 + 12] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v14, (uint64x2_t)xmmword_1003FE030))));

  v15 = (uint64x2_t)vdupq_n_s64((unint64_t)-[ASClass101288420 queryKey](self, "queryKey"));
  *(int8x8_t *)&v6[v11 + 20] = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE010), (int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE020)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE040), (int32x4_t)vshlq_u64(v15, (uint64x2_t)xmmword_1003FE030))));
  v16 = (uint64x2_t)vdupq_n_s64((int)-[ASClass101288420 profID](self, "profID"));
  v17 = (int16x8_t)vshlq_u64(v16, (uint64x2_t)xmmword_1003FE010);
  *(int32x2_t *)v16.i8 = vmovn_s64((int64x2_t)vshlq_u64(v16, (uint64x2_t)xmmword_1003FE020));
  *(int32x2_t *)v17.i8 = vmovn_s64((int64x2_t)v17);
  v17.i16[1] = v17.i16[2];
  v17.i16[2] = v16.i16[0];
  v17.i16[3] = v16.i16[2];
  *(_DWORD *)&v6[v11 + 28] = vmovn_s16(v17).u32[0];
  if (v11 == v5)
  {
    sub_10027ADA4();
    free(v6);
  }
  else
  {
    free(v6);
    v21[0] = 0;
    v21[1] = 0;
    v18 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
      sub_1003D6DEC(v18);
  }
  v19 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v21);

  return v19;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASClass101288420 nC4QvxwoXaT2I88i](self, "nC4QvxwoXaT2I88i"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASClass101288420 macVal](self, "macVal"));
  v5 = objc_msgSend(v4, "isEqual:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASClass101288420 presentTime](self, "presentTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", (double)(uint64_t)-[ASClass101288420 dfMaxAge](self, "dfMaxAge") / 1000.0));

    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8 >= 0.0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("DB_R101288420"));
}

@end
