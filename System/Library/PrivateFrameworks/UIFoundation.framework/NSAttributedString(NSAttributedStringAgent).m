@implementation NSAttributedString(NSAttributedStringAgent)

+ (id)_allowedOptionClasses
{
  void *v0;
  Class v1;
  Class v2;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", objc_msgSend(MEMORY[0x1E0CB3498], "allowedSecureCodingClasses"));
  objc_msgSend(v0, "addObject:", objc_opt_class());
  objc_msgSend(v0, "addObject:", objc_opt_class());
  objc_msgSend(v0, "addObject:", objc_opt_class());
  v1 = NSClassFromString((NSString *)CFSTR("NSAppearance"));
  if (v1)
    objc_msgSend(v0, "addObject:", v1);
  v2 = NSClassFromString((NSString *)CFSTR("UIColor"));
  if (v2)
    objc_msgSend(v0, "addObject:", v2);
  return (id)objc_msgSend(v0, "copy");
}

+ (uint64_t)_allowedTokensClasses
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
}

@end
