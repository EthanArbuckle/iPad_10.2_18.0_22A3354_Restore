@implementation PXStoryDefaultDetailedSaliencyProducerFactory

- (id)detailedSaliencyProducerForConfiguration:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  PXStoryPassthroughDetailedSaliencyProducer *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "options") & 2) != 0)
    goto LABEL_4;
  +[PXStoryMultipartPanoramaSettings sharedInstance](PXStoryMultipartPanoramaSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled");

  if (!v5
    || (objc_msgSend(v3, "mediaProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[PXStoryVisionDetailedSaliencyProducer initWithMediaProvider:]([PXStoryVisionDetailedSaliencyProducer alloc], "initWithMediaProvider:", v6), v6, !v7))
  {
LABEL_4:
    v7 = objc_alloc_init(PXStoryPassthroughDetailedSaliencyProducer);
  }

  return v7;
}

@end
