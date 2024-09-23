@implementation SBHShortcutsSingleElement

+ (id)elementIdentifier
{
  return CFSTR("Shortcuts");
}

+ (id)elementKind
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle");
}

- (id)containerBundleIdentifier
{
  return CFSTR("com.apple.shortcuts");
}

- (id)displayName
{
  void *v2;
  void *v3;

  SBHBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHORTCUTS_WIDGET_COLLECTION_NAME"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;

  return SBHGetApplicationIconImage(CFSTR("com.apple.shortcuts"), 0, v4, v5, v6);
}

- (id)configurationStorageIdentifier
{
  return CFSTR("com.apple.shortcuts");
}

- (id)supportedGridSizeClasses
{
  return -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
}

@end
