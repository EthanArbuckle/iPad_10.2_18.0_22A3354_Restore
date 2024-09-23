@implementation PXStoryDefaultSongsProducerFactory

- (id)songsProducerForConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PXStoryPassthroughSongsProducer *v8;
  PXStoryPassthroughSongsProducer *v9;
  __objc2_class *v10;
  void *v12;
  PXStoryDefaultSongsProducer *v13;
  void *v14;

  v3 = a3;
  if ((objc_msgSend(v3, "options") & 2) != 0 || (objc_msgSend(v3, "isAllowedToPlayAnyMusicOrSound") & 1) == 0)
  {
    v9 = objc_alloc_init(PXStoryPassthroughSongsProducer);
  }
  else
  {
    v4 = objc_msgSend(v3, "songsProducerKind");
    if (!v4)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "songsProducerKind");

    }
    objc_msgSend(v3, "songsConfiguration");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    switch(v4)
    {
      case 0:
        if (v6)
          goto LABEL_7;
        objc_msgSend(v3, "photoKitAssetContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = [PXStoryDefaultSongsProducer alloc];
          objc_msgSend(v3, "musicCurationProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = -[PXStoryDefaultSongsProducer initWithAssetContainer:configuration:curationProvider:](v13, "initWithAssetContainer:configuration:curationProvider:", v12, v3, v14);

        }
        else
        {
          v9 = objc_alloc_init(PXStoryPassthroughSongsProducer);
        }

        break;
      case 1:
        v10 = PXStoryDummySongsProducer;
        goto LABEL_13;
      case 2:
        v10 = PXStoryDummyAppleMusicSongsProducer;
        goto LABEL_13;
      case 3:
LABEL_7:
        v8 = -[PXStoryPassthroughSongsProducer initWithSongsConfiguration:]([PXStoryPassthroughSongsProducer alloc], "initWithSongsConfiguration:", v6);
        goto LABEL_14;
      case 4:
        v10 = PXStoryExceptionThrowingSongsProducer;
LABEL_13:
        v8 = (PXStoryPassthroughSongsProducer *)objc_alloc_init(v10);
LABEL_14:
        v9 = v8;
        break;
      default:
        v9 = 0;
        break;
    }

  }
  return v9;
}

@end
