@implementation PGExcitingMomentsMemoryTitleGenerator

- (PGExcitingMomentsMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  id v8;
  PGExcitingMomentsMemoryTitleGenerator *v9;
  uint64_t v10;
  CLSServiceManager *serviceManager;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGExcitingMomentsMemoryTitleGenerator;
  v9 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "serviceManager");
    v10 = objc_claimAutoreleasedReturnValue();
    serviceManager = v9->_serviceManager;
    v9->_serviceManager = (CLSServiceManager *)v10;

  }
  return v9;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  PGGraphPersonNodeCollection *personNodeAsCollection;
  void (**v5)(id, id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGTimeTitleOptions *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  personNodeAsCollection = self->_personNodeAsCollection;
  v5 = (void (**)(id, id, void *))a3;
  -[MANodeCollection anyNode](personNodeAsCollection, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:", v6, self->_serviceManager);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGExcitingMomentsWithPersonMemoryTypeFormat"), CFSTR("PGExcitingMomentsWithPersonMemoryTypeFormat"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGExcitingMomentsMemoryTypeFormat"), CFSTR("PGExcitingMomentsMemoryTypeFormat"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v11, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v12, "setMomentNodes:", v13);

  -[PGTimeTitleOptions setAllowedFormats:](v12, "setAllowedFormats:", 20);
  -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setFeaturedYearNodes:](v12, "setFeaturedYearNodes:", v14);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v15, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v17, v16);

}

- (PGGraphPersonNodeCollection)personNodeAsCollection
{
  return self->_personNodeAsCollection;
}

- (void)setPersonNodeAsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_personNodeAsCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end
