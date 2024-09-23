@implementation UIApplicationAssertForExtensionType

void ___UIApplicationAssertForExtensionType_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NSExtension"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1EDDC80E8;
    qword_1EDDC80E8 = v2;

  }
}

@end
