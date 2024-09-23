@implementation PGTripHighlightTitleGenerator

- (PGTripHighlightTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PGTripHighlightTitleGenerator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "eventEnrichmentMomentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "temporarySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PGTripHighlightTitleGenerator;
  v11 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, v10, 0, v8);

  if (v11)
    objc_storeStrong((id *)&v11->_collection, a3);

  return v11;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __int16 v11[8];

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[PGTripHighlightTitleGenerator collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTrip");

  if (v6)
  {
    -[PGTripHighlightTitleGenerator _locationTitle](self, "_locationTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_12;
      goto LABEL_11;
    }
    v8 = 0;
    if (v4)
LABEL_11:
      v4[2](v4, v8, 0);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 0;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Collection is not a trip, can't use trip collection title generator", (uint8_t *)v11, 2u);
    }

    if (v4)
      v4[2](v4, 0, 0);
    v7 = 0;
    v8 = 0;
  }
LABEL_12:

}

- (id)_locationTitle
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__58197;
  v14 = __Block_byref_object_dispose__58198;
  v15 = 0;
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PGTitleGenerator lineBreakBehavior](self, "lineBreakBehavior");
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PGTripHighlightTitleGenerator__locationTitle__block_invoke;
  v9[3] = &unk_1E84330E0;
  v9[4] = self;
  v9[5] = &v10;
  +[PGLocationTitleUtility generateHighlightLocationTitleForTripWithMomentNodes:lineBreakBehavior:locationHelper:result:](PGLocationTitleUtility, "generateHighlightLocationTitleForTripWithMomentNodes:lineBreakBehavior:locationHelper:result:", v3, v4, v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 0;
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

void __47__PGTripHighlightTitleGenerator__locationTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setUsedLocationNodes:", v7);

}

@end
