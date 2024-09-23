@implementation PGSpecBasedHighlightTitleGenerator

- (PGSpecBasedHighlightTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 createVerboseTitle:(BOOL)a5 titleGenerationContext:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PGSpecBasedHighlightTitleGenerator *v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "eventEnrichmentMomentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "temporarySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PGSpecBasedHighlightTitleGenerator initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:](self, "initWithMomentNodes:meaningLabel:createVerboseTitle:titleGenerationContext:", v13, v11, v6, v10);
  return v14;
}

- (PGSpecBasedHighlightTitleGenerator)initWithMomentNodes:(id)a3 meaningLabel:(id)a4 createVerboseTitle:(BOOL)a5 titleGenerationContext:(id)a6
{
  id v11;
  PGSpecBasedHighlightTitleGenerator *v12;
  PGSpecBasedHighlightTitleGenerator *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGSpecBasedHighlightTitleGenerator;
  v12 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v15, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_meaningLabel, a4);
    v13->_createVerboseTitle = a5;
  }

  return v13;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  PGSpecBasedTitleGenerator *v5;
  void *v6;
  void *v7;
  PGSpecBasedTitleGenerator *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a3;
  +[PGHighlightsTitleSpecFactory specCollectionForMeaningLabel:allowAllCities:](PGHighlightsTitleSpecFactory, "specCollectionForMeaningLabel:allowAllCities:", self->_meaningLabel, self->_createVerboseTitle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PGSpecBasedTitleGenerator alloc];
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGSpecBasedTitleGenerator initWithMomentNodes:features:specCollection:titleGenerationContext:](v5, "initWithMomentNodes:features:specCollection:titleGenerationContext:", v6, 0, v4, v7);

  -[PGSpecBasedTitleGenerator setLineBreakBehavior:](v8, "setLineBreakBehavior:", -[PGTitleGenerator lineBreakBehavior](self, "lineBreakBehavior"));
  -[PGSpecBasedTitleGenerator title](v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v10[2](v10, v9, 0);

}

- (NSString)meaningLabel
{
  return self->_meaningLabel;
}

- (BOOL)createVerboseTitle
{
  return self->_createVerboseTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

@end
