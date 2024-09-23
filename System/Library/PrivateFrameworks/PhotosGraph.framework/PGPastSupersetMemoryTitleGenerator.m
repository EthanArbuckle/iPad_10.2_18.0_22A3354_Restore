@implementation PGPastSupersetMemoryTitleGenerator

- (PGPastSupersetMemoryTitleGenerator)initWithMomentNodes:(id)a3 supersetLocationNode:(id)a4 supersetDateInterval:(id)a5 titleGenerationContext:(id)a6
{
  id v11;
  id v12;
  PGPastSupersetMemoryTitleGenerator *v13;
  PGPastSupersetMemoryTitleGenerator *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGPastSupersetMemoryTitleGenerator;
  v13 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v16, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_supersetLocationNode, a4);
    objc_storeStrong((id *)&v14->_supersetDateInterval, a5);
  }

  return v14;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *);

  v9 = (void (**)(id, void *, void *))a3;
  -[PGPastSupersetMemoryTitleGenerator _locationTitle](self, "_locationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPastSupersetMemoryTitleGenerator _timeTitle](self, "_timeTitle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v4, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_3:
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    if (v5)
      goto LABEL_3;
  }
  v8 = 0;
LABEL_6:
  if (v9)
    v9[2](v9, v7, v8);

}

- (id)_locationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", self->_supersetLocationNode, self->_supersetDateInterval, 208);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGPastSupersetMemoryTitleFormatWithLocation %@"), CFSTR("PGPastSupersetMemoryTitleFormatWithLocation %@"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_timeTitle
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMomentNodes:", v4);

  objc_msgSend(v3, "setAllowedFormats:", 4);
  objc_msgSend(v3, "setFilterDates:", 0);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGGraphLocationNode)supersetLocationNode
{
  return (PGGraphLocationNode *)objc_getProperty(self, a2, 128, 1);
}

- (NSDateInterval)supersetDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersetDateInterval, 0);
  objc_storeStrong((id *)&self->_supersetLocationNode, 0);
}

@end
