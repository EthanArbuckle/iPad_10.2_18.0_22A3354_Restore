@implementation PRComplicationDescriptor(PBFComplicationLookupInfo)

- (id)complicationWidgetFamily
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithInteger:", objc_msgSend(v2, "family"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)complicationExtensionBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)complicationContainingBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "containerBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)complicationWidgetKind
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)complicationIntent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "widget");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
