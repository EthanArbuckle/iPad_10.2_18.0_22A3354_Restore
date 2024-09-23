@implementation CHSWidgetDescriptor(Sanitization)

- (SBHSpecialWidgetDescriptor)sanitizedDescriptor
{
  void *v2;
  char isKindOfClass;
  SBHSpecialWidgetDescriptor *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(a1, "kind");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = SBHSpecialWidgetDescriptorTypeForKind(v5);

      v4 = -[SBHSpecialWidgetDescriptor initWithType:]([SBHSpecialWidgetDescriptor alloc], "initWithType:", v6);
      return v4;
    }
  }
  v4 = a1;
  return v4;
}

@end
