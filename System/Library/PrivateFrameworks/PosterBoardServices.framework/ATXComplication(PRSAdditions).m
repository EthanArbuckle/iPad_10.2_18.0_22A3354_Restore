@implementation ATXComplication(PRSAdditions)

- (uint64_t)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "widgetFamily");
  objc_msgSend(v4, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "source");

  if ((unint64_t)(v10 - 1) < 6)
    v11 = v10;
  else
    v11 = 0;
  v12 = objc_msgSend(a1, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v5, v6, v7, v8, v9, v11);

  return v12;
}

- (PRSPosterGallerySuggestedComplication)posterBoardRepresentation
{
  return -[PRSPosterGallerySuggestedComplication initWithProactiveRepresentation:]([PRSPosterGallerySuggestedComplication alloc], "initWithProactiveRepresentation:", a1);
}

@end
