@implementation PGHomeAggregationMemoryTitleGenerator

- (PGHomeAggregationMemoryTitleGenerator)initWithMomentNodes:(id)a3 titleGenerationContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGHomeAggregationMemoryTitleGenerator;
  return -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v5, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, 0, 0, 0, 0, a4);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void (**)(id, void *, void *))a3;
  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "setAllowedFormats:", 8);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMomentNodes:", v5);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGHomeAggregationMemoryTitleFormatLastMonth %@"), CFSTR("PGHomeAggregationMemoryTitleFormatLastMonth %@"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v11, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setAllowedFormats:", 4);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMomentNodes:", v14);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v15, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v12, v16);

}

@end
