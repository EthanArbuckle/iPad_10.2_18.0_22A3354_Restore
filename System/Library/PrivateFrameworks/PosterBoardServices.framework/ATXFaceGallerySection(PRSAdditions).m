@implementation ATXFaceGallerySection(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&off_1EE78BC90;
  v5 = objc_msgSendSuper2(&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedTitle:", v6);

    objc_msgSend(v4, "symbolImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSymbolImageName:", v7);

    objc_msgSend(v4, "symbolColorName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSymbolColorName:", v8);

    objc_msgSend(v4, "localizedSubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedSubtitle:", v9);

    objc_msgSend(v4, "localizedDescriptiveText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalizedDescriptiveText:", v10);

    objc_msgSend(v4, "unityDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUnityDescription:", v11);

    v12 = objc_msgSend(v4, "type");
    if ((unint64_t)(v12 - 1) >= 3)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(v5, "setType:", v13);
    objc_msgSend(v4, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bs_map:", &__block_literal_global_11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v15);

  }
  return v5;
}

- (PRSPosterGallerySection)posterBoardRepresentation
{
  return -[PRSPosterGallerySection initWithProactiveRepresentation:]([PRSPosterGallerySection alloc], "initWithProactiveRepresentation:", a1);
}

@end
