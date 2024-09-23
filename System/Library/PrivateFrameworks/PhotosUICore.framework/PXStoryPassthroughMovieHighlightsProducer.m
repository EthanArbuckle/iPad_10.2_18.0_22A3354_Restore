@implementation PXStoryPassthroughMovieHighlightsProducer

- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v7;
  void (**v8)(id, void *);
  PXStoryMovieHighlightsConcreteMutableCollection *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  PXStoryProducerResult *v13;
  void *v14;
  PXStoryProducerResult *v15;

  v7 = a3;
  v8 = (void (**)(id, void *))a6;
  v9 = objc_alloc_init(PXStoryMovieHighlightsConcreteMutableCollection);
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v11, "playbackStyle") - 3) <= 2)
      {
        +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:](PXStoryFallbackMovieHighlightCuration, "movieHighlightCurationForDisplayAsset:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryMovieHighlightsConcreteMutableCollection setMovieHighlightCuration:forDisplayAsset:](v9, "setMovieHighlightCuration:forDisplayAsset:", v12, v11);

      }
      ++v10;
    }
    while (v10 < objc_msgSend(v7, "count"));
  }
  v13 = [PXStoryProducerResult alloc];
  v14 = (void *)-[PXStoryMovieHighlightsConcreteMutableCollection copy](v9, "copy");
  v15 = -[PXStoryProducerResult initWithObject:](v13, "initWithObject:", v14);

  v8[2](v8, v15);
  return 0;
}

@end
