@implementation PXStoryDefaultMovieHighlightsProducerFactory

- (id)movieHighlightsProducerWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  PXStoryMediaAnalysisMovieHighlightsProducer *v5;
  PXStoryMediaAnalysisMovieHighlightsProducer *v6;

  v3 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wantsMovieHighlights"))
    v5 = -[PXStoryMediaAnalysisMovieHighlightsProducer initWithStoryConfiguration:]([PXStoryMediaAnalysisMovieHighlightsProducer alloc], "initWithStoryConfiguration:", v3);
  else
    v5 = objc_alloc_init(PXStoryPassthroughMovieHighlightsProducer);
  v6 = v5;

  return v6;
}

@end
