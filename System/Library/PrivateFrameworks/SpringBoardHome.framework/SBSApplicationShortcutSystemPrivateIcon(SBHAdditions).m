@implementation SBSApplicationShortcutSystemPrivateIcon(SBHAdditions)

+ (uint64_t)sbh_defaultImage
{
  return objc_msgSend(MEMORY[0x1E0DAADB8], "sbh_defaultImage");
}

- (id)sbh_systemImage
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "systemImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_systemImageNamed:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
