@implementation BKLibraryBookshelfGridBookCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKLibraryBookshelfGridBookCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)_accessibilityDidTriggerShowMenuAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfGridBookCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moreButton"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextMenuInteraction"));
  if ((objc_opt_respondsToSelector(v6, "_presentMenuAtLocation:") & 1) != 0)
  {
    objc_msgSend(v5, "accessibilityActivationPoint");
    objc_msgSend(v6, "_presentMenuAtLocation:");
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKLibraryBookshelfGridBookCellAccessibility;
    v7 = -[BKLibraryBookshelfGridBookCellAccessibility _accessibilityDidTriggerShowMenuAction](&v9, "_accessibilityDidTriggerShowMenuAction");
  }

  return v7;
}

- (id)bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKLibraryBookshelfGridBookCell);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

@end
