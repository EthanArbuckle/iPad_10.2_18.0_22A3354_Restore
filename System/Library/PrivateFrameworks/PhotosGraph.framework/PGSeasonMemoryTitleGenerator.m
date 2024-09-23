@implementation PGSeasonMemoryTitleGenerator

- (PGSeasonMemoryTitleGenerator)initWithMomentNodes:(id)a3 seasonName:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGSeasonMemoryTitleGenerator *v10;
  PGSeasonMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGSeasonMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_season, a4);

  return v11;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, void *);

  v12 = (void (**)(id, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("PGSeasonMemoryTitleFormat%@"), self->_season);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_opt_class();
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "seasonSubtitleWithMomentNodes:seasonName:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v12[2](v12, v8, v11);

}

- (NSString)season
{
  return self->_season;
}

- (void)setSeason:(id)a3
{
  objc_storeStrong((id *)&self->_season, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_season, 0);
}

+ (id)seasonSubtitleWithMomentNodes:(id)a3 seasonName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;

  v5 = a4;
  +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:](PGGraphMomentNode, "firstAndLastMomentNodesInMomentNodes:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMomentNodes:", v8);

  objc_msgSend(v7, "setAllowedFormats:", 4);
  objc_msgSend(v7, "setFilterDates:", 0);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  if (!v5)
  {
    v14 = v9;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGSeasonMemoryTitleFormat%@Year"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v11, v11, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  PFStringWithValidatedFormat();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_6:
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v14, 5, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_4:
  v15 = 0;
LABEL_7:

  return v15;
}

@end
