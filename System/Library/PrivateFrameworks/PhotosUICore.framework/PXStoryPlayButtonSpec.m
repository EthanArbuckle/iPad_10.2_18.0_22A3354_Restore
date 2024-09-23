@implementation PXStoryPlayButtonSpec

- (PXStoryPlayButtonSpec)initWithChromeButtonSpec:(id)a3
{
  id v5;
  PXStoryPlayButtonSpec *v6;
  PXStoryPlayButtonSpec *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPlayButtonSpec;
  v6 = -[PXStoryPlayButtonSpec init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_chromeButtonSpec, a3);
    v7->_playButtonProgressIndicatorLineWidth = 2.0;
  }

  return v7;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  void *v2;
  void *v3;

  -[PXStoryPlayButtonSpec chromeButtonSpec](self, "chromeButtonSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXExtendedTraitCollection *)v3;
}

- (PXStoryChromeButtonSpec)chromeButtonSpec
{
  return self->_chromeButtonSpec;
}

- (double)playButtonProgressIndicatorLineWidth
{
  return self->_playButtonProgressIndicatorLineWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeButtonSpec, 0);
}

@end
