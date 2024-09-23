@implementation SearchUILocalSuggestionCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "command", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)prefixMatchExtensionString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SEARCH_BAR_PLACEHOLDER"), &stru_1EA1FB118, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  return 0;
}

@end
