@implementation PXStoryDefaultAutoCurationProducerFactory

- (id)autoCurationProducerForConfiguration:(id)a3
{
  id v3;
  PXStoryPassthroughAutoCurationProducer *v4;
  PXStoryDefaultAutoCurationProducer *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "autoCurationProducer");
  v4 = (PXStoryPassthroughAutoCurationProducer *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [PXStoryDefaultAutoCurationProducer alloc];
    objc_msgSend(v3, "originalCurationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXStoryDefaultAutoCurationProducer initWithCurationContext:](v5, "initWithCurationContext:", v6);

    if (!v4)
    {
      objc_msgSend(v3, "assetCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_7:
        v4 = objc_alloc_init(PXStoryPassthroughAutoCurationProducer);
        objc_msgSend(v3, "assets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryPassthroughAutoCurationProducer setAssets:](v4, "setAssets:", v8);

        goto LABEL_8;
      }
      v4 = -[PXStoryMemoryAutoCurationProducer initWithMemory:]([PXStoryMemoryAutoCurationProducer alloc], "initWithMemory:", v7);

      if (!v4)
        goto LABEL_7;
    }
  }
LABEL_8:

  return v4;
}

@end
