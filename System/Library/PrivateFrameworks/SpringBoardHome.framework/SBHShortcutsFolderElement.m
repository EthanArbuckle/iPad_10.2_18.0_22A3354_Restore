@implementation SBHShortcutsFolderElement

+ (id)elementIdentifier
{
  return CFSTR("Shortcuts");
}

+ (id)elementKind
{
  return CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder");
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
  SBHIconGridSizeClassSet *v2;
  void *v3;
  SBHIconGridSizeClassSet *v4;

  v2 = [SBHIconGridSizeClassSet alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v2, "initWithGridSizeClasses:", v3);

  return v4;
}

@end
