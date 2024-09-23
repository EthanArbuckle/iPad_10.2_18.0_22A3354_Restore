@implementation AVURLAsset(RCAdditions)

+ (id)rc_preciseTimingAssetWithURL:()RCAdditions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v8 = *MEMORY[0x1E0C8AD90];
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:options:", v3, v5);

  return v6;
}

@end
