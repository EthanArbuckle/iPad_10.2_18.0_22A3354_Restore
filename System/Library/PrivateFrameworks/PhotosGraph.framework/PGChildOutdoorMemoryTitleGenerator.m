@implementation PGChildOutdoorMemoryTitleGenerator

- (PGChildOutdoorMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 type:(int64_t)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  PGChildOutdoorMemoryTitleGenerator *v13;
  PGChildOutdoorMemoryTitleGenerator *v14;
  uint64_t v15;
  CLSServiceManager *serviceManager;
  objc_super v18;

  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGChildOutdoorMemoryTitleGenerator;
  v13 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v18, sel_initWithMomentNodes_type_titleGenerationContext_, a3, a5, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personNode, a4);
    objc_msgSend(v12, "serviceManager");
    v15 = objc_claimAutoreleasedReturnValue();
    serviceManager = v14->_serviceManager;
    v14->_serviceManager = (CLSServiceManager *)v15;

  }
  return v14;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  PGGraphPersonNode *personNode;
  CLSServiceManager *serviceManager;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PGTimeTitleOptions *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (a3)
  {
    personNode = self->_personNode;
    serviceManager = self->_serviceManager;
    v6 = (void (**)(id, void *, void *))a3;
    +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:", personNode, serviceManager);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGChildAdventuresMemoryTitle %@"), CFSTR("PGChildAdventuresMemoryTitle %@"), CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v9, v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v10;
      v12 = 3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PGChildAdventuresMemoryTitle"), CFSTR("PGChildAdventuresMemoryTitle"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v10;
      v12 = 1;
    }
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(PGTimeTitleOptions);
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setMomentNodes:](v15, "setMomentNodes:", v16);

    -[PGTimeTitleOptions setAllowedFormats:](v15, "setAllowedFormats:", 20);
    -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setFeaturedYearNodes:](v15, "setFeaturedYearNodes:", v17);

    +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v18, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v14, v19);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
}

@end
