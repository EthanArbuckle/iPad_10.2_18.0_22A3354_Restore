@implementation ATXPosterDescriptor(PRSAdditions)

- (uint64_t)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "galleryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "proactiveRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v5, v6, v7, v9);

  return v10;
}

- (PRSPosterGalleryItemPrototype)posterBoardRepresentation
{
  return -[PRSPosterGalleryItemPrototype initWithProactiveRepresentation:]([PRSPosterGalleryItemPrototype alloc], "initWithProactiveRepresentation:", a1);
}

@end
