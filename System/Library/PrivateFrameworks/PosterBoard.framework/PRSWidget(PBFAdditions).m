@implementation PRSWidget(PBFAdditions)

+ (id)pbf_PRSWidgetFromComplicationLookupInfo:()PBFAdditions uniqueIdentifier:intent:
{
  void *v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = 0;
  if (a3 && a4)
  {
    v8 = (objc_class *)MEMORY[0x1E0D7F738];
    v9 = a5;
    v10 = a4;
    v11 = a3;
    v12 = [v8 alloc];
    objc_msgSend(v11, "complicationWidgetKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complicationExtensionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complicationContainingBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complicationWidgetFamily");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(v12, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:family:intent:", v10, v13, v14, v15, objc_msgSend(v16, "integerValue"), v9);
  }
  return v5;
}

- (id)pbf_complicationLookupInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "family"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFGenericComplicationLookupInfo complicationLookupForWidgetFamily:extensionBundleIdentifier:containingBundleIdentifier:kind:intent:suggestedComplication:](PBFGenericComplicationLookupInfo, "complicationLookupForWidgetFamily:extensionBundleIdentifier:containingBundleIdentifier:kind:intent:suggestedComplication:", v2, v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
