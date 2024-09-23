@implementation PGTrendsMemoryTitleGenerator

- (PGTrendsMemoryTitleGenerator)initWithMomentNodes:(id)a3 sceneFeatureLabel:(id)a4 titleGenerationContext:(id)a5 timeTitleOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGTrendsMemoryTitleGenerator *v15;
  PGTrendsMemoryTitleGenerator *v16;
  uint64_t v17;
  CLSServiceManager *serviceManager;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PGTrendsMemoryTitleGenerator;
  v15 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v20, sel_initWithMomentNodes_type_titleGenerationContext_, v11, 0, v13);
  v16 = v15;
  if (v15)
  {
    v15->_type = 1;
    objc_storeStrong((id *)&v15->_momentNodes, a3);
    objc_storeStrong((id *)&v16->_sceneFeatureLabel, a4);
    objc_storeStrong((id *)&v16->_timeTitleOptions, a6);
    objc_msgSend(v13, "serviceManager");
    v17 = objc_claimAutoreleasedReturnValue();
    serviceManager = v16->_serviceManager;
    v16->_serviceManager = (CLSServiceManager *)v17;

  }
  return v16;
}

- (PGTrendsMemoryTitleGenerator)initWithMomentNodes:(id)a3 sceneFeatureLabel:(id)a4 personNode:(id)a5 titleGenerationContext:(id)a6 timeTitleOptions:(id)a7
{
  id v13;
  PGTrendsMemoryTitleGenerator *v14;
  PGTrendsMemoryTitleGenerator *v15;

  v13 = a5;
  v14 = -[PGTrendsMemoryTitleGenerator initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:](self, "initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:", a3, a4, a6, a7);
  v15 = v14;
  if (v14)
  {
    v14->_type = 2;
    objc_storeStrong((id *)&v14->_personNode, a5);
  }

  return v15;
}

- (PGTrendsMemoryTitleGenerator)initWithMomentNodes:(id)a3 sceneFeatureLabel:(id)a4 cityNode:(id)a5 titleGenerationContext:(id)a6 timeTitleOptions:(id)a7
{
  id v13;
  PGTrendsMemoryTitleGenerator *v14;
  PGTrendsMemoryTitleGenerator *v15;

  v13 = a5;
  v14 = -[PGTrendsMemoryTitleGenerator initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:](self, "initWithMomentNodes:sceneFeatureLabel:titleGenerationContext:timeTitleOptions:", a3, a4, a6, a7);
  v15 = v14;
  if (v14)
  {
    v14->_type = 3;
    objc_storeStrong((id *)&v14->_cityNode, a5);
  }

  return v15;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t type;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGGraphLocationCityNode *cityNode;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(id, void *, void *);

  v26 = (void (**)(id, void *, void *))a3;
  objc_msgSend(CFSTR("PGTrendsMemoryTitle"), "stringByAppendingString:", self->_sceneFeatureLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", self->_timeTitleOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v8, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type == 3)
  {
    v25 = v6;
    cityNode = self->_cityNode;
    -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "locationHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", cityNode, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
    {
      v6 = v25;
      goto LABEL_11;
    }
    objc_msgSend(CFSTR("PGLocationTrendsMemoryTitle"), "stringByAppendingString:", self->_sceneFeatureLabel);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringByAppendingString:", CFSTR(" %@"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", v21, v21, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PFLocalizedStringWithValidatedFormat();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v4, 4, v11);
    v24 = objc_claimAutoreleasedReturnValue();
    v6 = v25;
LABEL_9:

    v7 = (void *)v24;
LABEL_11:

    goto LABEL_12;
  }
  if (type == 2)
  {
    +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:", self->_personNode, self->_serviceManager);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PGPersonTrendsMemoryTitle"), "stringByAppendingString:", self->_sceneFeatureLabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(" %@"));
      v13 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v14, v14, CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v13;
    }
    else
    {
      objc_msgSend(v12, "stringByAppendingString:", CFSTR("Unnamed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, v16, CFSTR("Localizable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v4, 3);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_12:
  v26[2](v26, v7, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_timeTitleOptions, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
  objc_storeStrong((id *)&self->_cityNode, 0);
  objc_storeStrong((id *)&self->_sceneFeatureLabel, 0);
}

@end
