@implementation PGTripMemoryTitleGenerator

- (PGTripMemoryTitleGenerator)initWithMomentNodes:(id)a3 type:(unint64_t)a4 titleGenerationContext:(id)a5
{
  return -[PGTripMemoryTitleGenerator initWithMomentNodes:locationNodes:type:titleGenerationContext:](self, "initWithMomentNodes:locationNodes:type:titleGenerationContext:", a3, 0, a4, a5);
}

- (PGTripMemoryTitleGenerator)initWithMomentNodes:(id)a3 locationNodes:(id)a4 type:(unint64_t)a5 titleGenerationContext:(id)a6
{
  return -[PGTripMemoryTitleGenerator initWithMomentNodes:locationNodes:areaNodes:type:titleGenerationContext:](self, "initWithMomentNodes:locationNodes:areaNodes:type:titleGenerationContext:", a3, a4, 0, a5, a6);
}

- (PGTripMemoryTitleGenerator)initWithMomentNodes:(id)a3 locationNodes:(id)a4 areaNodes:(id)a5 type:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v13;
  id v14;
  PGTripMemoryTitleGenerator *v15;
  PGTripMemoryTitleGenerator *v16;
  objc_super v18;

  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGTripMemoryTitleGenerator;
  v15 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v18, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, a3, 0, 0, 0, 0, 0, a7);
  v16 = v15;
  if (v15)
  {
    v15->_type = a6;
    objc_storeStrong((id *)&v15->_locationNodes, a4);
    objc_storeStrong((id *)&v16->_areaNodes, a5);
  }

  return v16;
}

- (PGTripMemoryTitleGenerator)initWithHighlightNode:(id)a3 titleGenerationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PGTripMemoryTitleGenerator *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") && objc_msgSend(v6, "isTrip"))
  {
    v10 = objc_msgSend(v6, "isShortTrip");
    objc_msgSend(v9, "temporarySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PGTripMemoryTitleGenerator initWithMomentNodes:locationNodes:type:titleGenerationContext:](self, "initWithMomentNodes:locationNodes:type:titleGenerationContext:", v11, 0, v10, v7);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PGTripMemoryTitleGenerator)initWithHighlightGroupNodeAsCollection:(id)a3 type:(unint64_t)a4 titleGenerationContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  PGTripMemoryTitleGenerator *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGTripMemoryTitleGenerator initWithMomentNodes:locationNodes:type:titleGenerationContext:](self, "initWithMomentNodes:locationNodes:type:titleGenerationContext:", v12, 0, a4, v10);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_highlightGroupNodeAsCollection, a3);
    objc_msgSend(v9, "featuredLocationOrAreaNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator setUsedLocationNodes:](v13, "setUsedLocationNodes:", v15);

  }
  return v13;
}

- (id)initForTestingWithHighlightGroupNodeAsCollection:(id)a3 type:(unint64_t)a4 titleGenerationContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  PGTripMemoryTitleGenerator *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGTripMemoryTitleGenerator initWithMomentNodes:locationNodes:type:titleGenerationContext:](self, "initWithMomentNodes:locationNodes:type:titleGenerationContext:", v12, 0, a4, v10);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_highlightGroupNodeAsCollection, a3);
    objc_msgSend(v9, "featuredLocationOrAreaNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator setUsedLocationNodes:](v13, "setUsedLocationNodes:", v15);

  }
  return v13;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  unint64_t type;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, void *);

  v4 = (void (**)(id, void *, void *))a3;
  type = self->_type;
  v11 = v4;
  if (type == 1)
  {
    -[PGTripMemoryTitleGenerator _locationTitle](self, "_locationTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTripMemoryTitleGenerator _timeTitleForWeekend](self, "_timeTitleForWeekend");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (type)
    {
      v9 = 0;
      v6 = 0;
      v8 = 0;
      v10 = 0;
      if (!v4)
        goto LABEL_14;
      goto LABEL_13;
    }
    -[PGTripMemoryTitleGenerator _locationTitle](self, "_locationTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTripMemoryTitleGenerator _timeTitleForTrip](self, "_timeTitleForTrip");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (v6)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_7:
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v8, 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
    if (v7)
      goto LABEL_7;
  }
  v10 = 0;
LABEL_12:
  if (v11)
LABEL_13:
    v11[2](v11, v9, v10);
LABEL_14:

}

- (id)_locationTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PGGraphHighlightGroupNodeCollection *highlightGroupNodeAsCollection;
  void *v8;
  id v9;
  id v10;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  highlightGroupNodeAsCollection = self->_highlightGroupNodeAsCollection;
  v15 = 0;
  +[PGTripTitleGenerator titleForTripNodeAsCollection:locationHelper:error:](PGTripTitleGenerator, "titleForTripNodeAsCollection:locationHelper:error:", highlightGroupNodeAsCollection, v6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGTripMemoryTitleGenerator] %@", buf, 0xCu);

    }
  }

  return v8;
}

- (id)_timeTitleForWeekend
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PGTitleGenerator dateMatching](self, "dateMatching");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 9)
    goto LABEL_3;
  -[PGTitleGenerator dateMatching](self, "dateMatching");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    -[PGTripMemoryTitleGenerator _timeTitleForTripAndWeekend](self, "_timeTitleForTripAndWeekend");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_timeTitleForTripAndWeekend
{
  PGTimeTitleOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v3, "setMomentNodes:", v4);

  -[PGTitleGenerator usedLocationNodes](self, "usedLocationNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocationNodes:](v3, "setLocationNodes:", v5);

  -[PGTitleGenerator locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocale:](v3, "setLocale:", v6);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTripMemoryTitleGenerator _typeString](self, "_typeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v13 = v7;
LABEL_6:
    v12 = v13;
    goto LABEL_7;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v13 = v8;
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PGTripMemorySubtitleFormatWithLocalizedDate %@"), CFSTR("PGTripMemorySubtitleFormatWithLocalizedDate %@"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v14 = v12;

  return v14;
}

- (BOOL)_triggerDefaultTitleGenerationIfNil
{
  return 1;
}

- (id)_typeString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGTripMemoryTypeStringTrip"), CFSTR("PGTripMemoryTypeStringTrip"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightGroupNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_areaNodes, 0);
  objc_storeStrong((id *)&self->_locationNodes, 0);
}

@end
