@implementation PBFArchiveBuildNewFileName

id ___PBFArchiveBuildNewFileName_block_invoke(_QWORD *a1, __CFString *a2)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  double v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (a2)
    v3 = a2;
  else
    v3 = &stru_1E86FC5B8;
  v4 = (void *)a1[5];
  v5 = a1[6];
  v6 = a1[4];
  v7 = a2;
  objc_msgSend(v4, "timeIntervalSince1970");
  *(float *)&v8 = v8;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@_%@_Version%lu_%lu"), v6, v3, CFSTR("ArchivedDataStore"), v5, vcvtms_u32_f32(*(float *)&v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("pbds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
