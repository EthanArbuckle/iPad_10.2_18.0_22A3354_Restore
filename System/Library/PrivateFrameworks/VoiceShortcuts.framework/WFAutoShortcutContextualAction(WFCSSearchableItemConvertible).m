@implementation WFAutoShortcutContextualAction(WFCSSearchableItemConvertible)

- (void)generateSearchableItemWithCompletionBlock:()WFCSSearchableItemConvertible
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *, _QWORD);

  v13 = a3;
  v4 = (void *)MEMORY[0x1C3BAFA00]();
  objc_msgSend(a1, "spotlightItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isTopHitEligible"))
  {
    objc_msgSend(v5, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "phrase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "associatedAppBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "setAppShortcutDisplayRepresentationForPhraseSignature:bundleIdentifier:associatedAppBundleIdentifier:", v8, v9, v10);
    }
    else
    {
      objc_msgSend(a1, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAppShortcutDisplayRepresentationForPhraseSignature:bundleIdentifier:associatedAppBundleIdentifier:", v8, v9, v11);

    }
    objc_msgSend(v5, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "associateWithAppEntityForContextualAction:", a1);

  }
  v13[2](v13, v5, 0);

  objc_autoreleasePoolPop(v4);
}

@end
