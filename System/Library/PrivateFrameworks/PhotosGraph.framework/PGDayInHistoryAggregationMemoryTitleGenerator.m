@implementation PGDayInHistoryAggregationMemoryTitleGenerator

- (PGDayInHistoryAggregationMemoryTitleGenerator)initWithMomentNodes:(id)a3 referenceDateInterval:(id)a4 titleGenerationContext:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGDayInHistoryAggregationMemoryTitleGenerator;
  return -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v6, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, a4, 0, 0, 0, 0, a5);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  PGTimeTitleOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  PGTimeTitleOptions *v12;

  v4 = (void (**)(id, void *, void *))a3;
  v12 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setAllowedFormats:](v12, "setAllowedFormats:", 64);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v12, "setMomentNodes:", v5);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setAllowedFormats:](v8, "setAllowedFormats:", 16);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v8, "setMomentNodes:", v9);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v10, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, v11);

}

@end
