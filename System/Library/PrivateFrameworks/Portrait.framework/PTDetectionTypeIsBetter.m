@implementation PTDetectionTypeIsBetter

unint64_t __PTDetectionTypeIsBetter_block_invoke()
{
  uint64_t v0;
  void *v1;
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  void *v6;

  v0 = objc_opt_new();
  v1 = (void *)PTDetectionTypeIsBetter_sOrderMap;
  PTDetectionTypeIsBetter_sOrderMap = v0;

  result = objc_msgSend(&unk_1E8252E38, "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)PTDetectionTypeIsBetter_sOrderMap;
      objc_msgSend(&unk_1E8252E50, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

      result = objc_msgSend(&unk_1E8252E38, "count");
    }
  }
  return result;
}

@end
