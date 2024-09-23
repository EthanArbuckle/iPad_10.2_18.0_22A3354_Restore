@implementation UIDevice(ShareSheet)

- (uint64_t)sh_hostUserInterfaceIdiom
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_getAssociatedObject(a1, (const void *)SHSheetUserInterfaceIdiomPropertyKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom");

  }
  return v3;
}

- (void)setSh_hostUserInterfaceIdiom:()ShareSheet
{
  const void *v2;
  id v3;

  v2 = (const void *)SHSheetUserInterfaceIdiomPropertyKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

@end
