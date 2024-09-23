@implementation PXStoryDefaultSongResourceProducerFactory

- (id)songResourceProducerForPersistableRecipe:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  PXStoryPersistableRecipeSongResourceProducer *v9;
  PXStoryPassthroughSongResourceProducer *v10;
  PXStoryNullSongResource *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "songsProducerKind");
  if (!objc_msgSend(v6, "isAllowedToPlayAnyMusicOrSound"))
  {
LABEL_7:
    v10 = [PXStoryPassthroughSongResourceProducer alloc];
    v11 = objc_alloc_init(PXStoryNullSongResource);
    v9 = -[PXStoryPassthroughSongResourceProducer initWithSongResource:](v10, "initWithSongResource:", v11);

    goto LABEL_8;
  }
  if (!v7)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "songsProducerKind");

  }
  if (v7 >= 3)
  {
    if (v7 - 3 >= 2)
    {
      v9 = 0;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v9 = -[PXStoryPersistableRecipeSongResourceProducer initWithPersistableRecipe:configuration:]([PXStoryPersistableRecipeSongResourceProducer alloc], "initWithPersistableRecipe:configuration:", v5, v6);
LABEL_8:

  return v9;
}

@end
