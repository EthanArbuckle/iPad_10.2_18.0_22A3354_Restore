@implementation CHSWidgetDescriptor(PRAdditions)

- (uint64_t)pr_shouldDisplayInGallery
{
  PRChronoDefaultsDomain *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = objc_alloc_init(PRChronoDefaultsDomain);
  if ((-[PRChronoDefaultsDomain shouldShowInternalWidgets](v2, "shouldShowInternalWidgets") & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(a1, "pr_isVisibilityWidgetDefined:", objc_msgSend(a1, "widgetVisibility")))
  {
    v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
    objc_msgSend(a1, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSuiteName:", v5);

    v7 = *MEMORY[0x1E0D0FF68];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D0FF68]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v6, "BOOLForKey:", v7);
    else
      v9 = objc_msgSend(a1, "pr_isVisibleByDefault");
    v3 = v9;

  }
  else
  {
    v3 = objc_msgSend(a1, "isInternal") ^ 1;
  }

  return v3;
}

- (BOOL)pr_isVisibilityWidgetDefined:()PRAdditions
{
  return a3 > 1;
}

- (BOOL)pr_isVisibleByDefault
{
  return ((objc_msgSend(a1, "widgetVisibility") - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

@end
