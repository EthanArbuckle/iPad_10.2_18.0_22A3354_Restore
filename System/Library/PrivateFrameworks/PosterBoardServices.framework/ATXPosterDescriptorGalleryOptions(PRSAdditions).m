@implementation ATXPosterDescriptorGalleryOptions(PRSAdditions)

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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = a1;
  v22.super_class = (Class)&off_1EE789160;
  v5 = objc_msgSendSuper2(&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "modularComplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_map:", &__block_literal_global_2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModularComplications:", v7);

    objc_msgSend(v4, "modularLandscapeComplications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bs_map:", &__block_literal_global_4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setModularLandscapeComplications:", v9);

    objc_msgSend(v4, "inlineComplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "proactiveRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInlineComplication:", v11);

    objc_msgSend(v5, "setAllowsSystemSuggestedComplications:", objc_msgSend(v4, "allowsSystemSuggestedComplications"));
    objc_msgSend(v5, "setAllowsSystemSuggestedComplicationsInLandscape:", objc_msgSend(v4, "allowsSystemSuggestedComplicationsInLandscape"));
    v12 = objc_msgSend(v4, "featuredConfidenceLevel");
    if (v12 == 2)
      v13 = 2;
    else
      v13 = v12 == 1;
    objc_msgSend(v5, "setFeaturedConfidenceLevel:", v13);
    objc_msgSend(v4, "displayNameLocalizationKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayNameLocalizationKey:", v14);

    objc_msgSend(v4, "spokenNameLocalizationKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpokenNameLocalizationKey:", v15);

    objc_msgSend(v4, "descriptiveTextLocalizationKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDescriptiveTextLocalizationKey:", v16);

    objc_msgSend(v5, "setHero:", objc_msgSend(v4, "isHero"));
    objc_msgSend(v5, "setShouldShowAsShuffleStack:", objc_msgSend(v4, "shouldShowAsShuffleStack"));
    v17 = objc_msgSend(v4, "photoSubtype");
    if ((unint64_t)(v17 - 1) >= 8)
      v18 = 0;
    else
      v18 = v17;
    objc_msgSend(v5, "setPhotoSubtype:", v18);
    v19 = objc_msgSend(v4, "focus");
    if ((unint64_t)(v19 - 1) >= 9)
      v20 = 0;
    else
      v20 = v19;
    objc_msgSend(v5, "setFocus:", v20);
    objc_msgSend(v5, "setOnlyEligibleForMadeForFocusSection:", objc_msgSend(v4, "isOnlyEligibleForMadeForFocusSection"));
  }

  return v5;
}

- (PRSPosterGalleryItemOptions)posterBoardRepresentation
{
  return -[PRSPosterGalleryItemOptions initWithProactiveRepresentation:]([PRSPosterGalleryItemOptions alloc], "initWithProactiveRepresentation:", a1);
}

@end
