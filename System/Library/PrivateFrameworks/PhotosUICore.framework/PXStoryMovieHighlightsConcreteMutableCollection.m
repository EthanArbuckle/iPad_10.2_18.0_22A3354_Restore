@implementation PXStoryMovieHighlightsConcreteMutableCollection

- (void)setMovieHighlightCuration:(id)a3 forDisplayAsset:(id)a4
{
  NSMutableDictionary *highlightsByAssetId;
  id v6;
  id v7;

  highlightsByAssetId = self->super._highlightsByAssetId;
  v6 = a3;
  objc_msgSend(a4, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](highlightsByAssetId, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setMovieHighlightCurations:(id)a3 forDisplayAssets:(id)a4
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = objc_msgSend(v13, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMovieHighlightsConcreteCollection.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("movieHighlightCurations.count == displayAssets.count"));

  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryMovieHighlightsConcreteMutableCollection setMovieHighlightCuration:forDisplayAsset:](self, "setMovieHighlightCuration:forDisplayAsset:", v10, v11);

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }

}

@end
