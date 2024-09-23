@implementation CPLResource(PL)

- (void)setDeleteAfterUpload:()PL
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("deleteAfterUpload"), v2, (void *)1);

}

- (uint64_t)deleteAfterUpload
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("deleteAfterUpload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

+ (id)videoDerivativeTypes
{
  if (videoDerivativeTypes_s_onceToken != -1)
    dispatch_once(&videoDerivativeTypes_s_onceToken, &__block_literal_global_65125);
  return (id)videoDerivativeTypes_s_types;
}

+ (id)imageDerivativeTypes
{
  if (imageDerivativeTypes_s_onceToken != -1)
    dispatch_once(&imageDerivativeTypes_s_onceToken, &__block_literal_global_5_65119);
  return (id)imageDerivativeTypes_s_types;
}

@end
