@implementation PGPlaceMemoryTitleGenerator

- (PGPlaceMemoryTitleGenerator)initWithMomentNodes:(id)a3 placeNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGPlaceMemoryTitleGenerator *v10;
  PGPlaceMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGPlaceMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, 0, 0, 0, 0, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_placeNode, a4);

  return v11;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  PGTimeTitleOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, void *);

  v11 = (void (**)(id, void *, void *))a3;
  -[PGPlaceMemoryTitleGenerator _placeTitle](self, "_placeTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v5, "setMomentNodes:", v6);

  -[PGTimeTitleOptions setAllowedFormats:](v5, "setAllowedFormats:", 20);
  -[PGTimeTitleOptions setFilterDates:](v5, "setFilterDates:", 0);
  -[PGTitleGenerator locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocale:](v5, "setLocale:", v7);

  -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setFeaturedYearNodes:](v5, "setFeaturedYearNodes:", v8);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v9, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v11[2](v11, v4, v10);

}

- (id)_placeTitle
{
  PGGraphNode *placeNode;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  placeNode = self->_placeNode;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", placeNode, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PGGraphNode)placeNode
{
  return self->_placeNode;
}

- (void)setPlaceNode:(id)a3
{
  objc_storeStrong((id *)&self->_placeNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeNode, 0);
}

@end
