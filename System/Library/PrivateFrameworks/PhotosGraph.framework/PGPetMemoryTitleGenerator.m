@implementation PGPetMemoryTitleGenerator

- (PGPetMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  id v8;
  PGPetMemoryTitleGenerator *v9;
  uint64_t v10;
  CLSServiceManager *serviceManager;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGPetMemoryTitleGenerator;
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
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGSpecBasedTitleGenerator *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  PGSpecBasedTitleGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PGTimeTitleOptions *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(id, void *, void *);

  v4 = (void (**)(id, void *, void *))a3;
  if (!v4)
    goto LABEL_39;
  v41 = v4;
  if (self->_useAdventureTitle)
  {
    -[PGGraphPetNodeCollection names](self->_petNodes, "names");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length");
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGPetAdventuresMemoryTitleWithNameFormat"), CFSTR("PGPetAdventuresMemoryTitleWithNameFormat"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v10, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("PGPetAdventuresMemoryTitleFormat"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", v9, v9, CFSTR("Localizable"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v18);
    v17 = (PGSpecBasedTitleGenerator *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v20 = 0;
      goto LABEL_34;
    }
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v17, 1);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v20 = (void *)v19;
LABEL_34:

    goto LABEL_35;
  }
  if (self->_usePetAndPersonTitle)
  {
    v11 = -[MAElementCollection count](self->_personNodeAsCollection, "count");
    -[PGGraphPetNodeCollection names](self->_petNodes, "names");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGPetMemoryTitleGenerator personNodeAsCollection](self, "personNodeAsCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyNode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isMeNode"))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatMePerson"), CFSTR("PGPeopleTitleFormatMePerson"), CFSTR("Localizable"));
        v17 = (PGSpecBasedTitleGenerator *)objc_claimAutoreleasedReturnValue();

LABEL_23:
        if (objc_msgSend(v6, "length") && -[PGSpecBasedTitleGenerator length](v17, "length"))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@"), CFSTR("PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@"), CFSTR("Localizable"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "localizedStringWithFormat:", v30, v6, v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v32, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
LABEL_33:

              goto LABEL_34;
            }
          }
        }
        else
        {
          v32 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("PGPetAndPersonMemoryTitleFormat"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", v33, v33, CFSTR("Localizable"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v32, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }

        goto LABEL_33;
      }
      +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:", v15, self->_serviceManager);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count") != 2)
      {
        v17 = 0;
        v6 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (PGSpecBasedTitleGenerator *)v24;
    goto LABEL_23;
  }
  -[PGGraphPetNodeCollection names](self->_petNodes, "names");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length")
    || (+[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 1),
        (v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v25 = [PGSpecBasedTitleGenerator alloc];
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PGSpecBasedTitleGenerator initWithMomentNodes:memoryCategory:subcategory:titleGenerationContext:](v25, "initWithMomentNodes:memoryCategory:subcategory:titleGenerationContext:", v26, 0, 212, v27);

    -[PGSpecBasedTitleGenerator title](v17, "title");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v20 = (void *)v22;
LABEL_35:

  if (-[NSString length](self->_seasonName, "length"))
  {
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v36 = (PGTimeTitleOptions *)objc_claimAutoreleasedReturnValue();
    +[PGSeasonMemoryTitleGenerator seasonSubtitleWithMomentNodes:seasonName:](PGSeasonMemoryTitleGenerator, "seasonSubtitleWithMomentNodes:seasonName:", v36, self->_seasonName);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = objc_alloc_init(PGTimeTitleOptions);
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setMomentNodes:](v36, "setMomentNodes:", v38);

    -[PGTimeTitleOptions setAllowedFormats:](v36, "setAllowedFormats:", 20);
    -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setFeaturedYearNodes:](v36, "setFeaturedYearNodes:", v39);

    +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v40, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v41[2](v41, v20, v37);

  v4 = v41;
LABEL_39:

}

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)setSeasonName:(id)a3
{
  objc_storeStrong((id *)&self->_seasonName, a3);
}

- (BOOL)useAdventureTitle
{
  return self->_useAdventureTitle;
}

- (void)setUseAdventureTitle:(BOOL)a3
{
  self->_useAdventureTitle = a3;
}

- (BOOL)usePetAndPersonTitle
{
  return self->_usePetAndPersonTitle;
}

- (void)setUsePetAndPersonTitle:(BOOL)a3
{
  self->_usePetAndPersonTitle = a3;
}

- (PGGraphPetNodeCollection)petNodes
{
  return self->_petNodes;
}

- (void)setPetNodes:(id)a3
{
  objc_storeStrong((id *)&self->_petNodes, a3);
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
  objc_storeStrong((id *)&self->_petNodes, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

@end
