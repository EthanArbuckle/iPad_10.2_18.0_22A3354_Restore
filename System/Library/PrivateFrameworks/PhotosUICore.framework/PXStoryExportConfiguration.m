@implementation PXStoryExportConfiguration

- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4
{
  id v7;
  id v8;
  PXStoryExportConfiguration *v9;
  PXStoryExportConfiguration *v10;
  uint64_t v11;
  PXStoryExportVideoOptions *videoOptions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryExportConfiguration;
  v9 = -[PXStoryExportConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storyConfiguration, a3);
    v11 = objc_msgSend(v8, "copy");
    videoOptions = v10->_videoOptions;
    v10->_videoOptions = (PXStoryExportVideoOptions *)v11;

  }
  return v10;
}

- (PXStoryExportConfiguration)initWithConfiguration:(id)a3 videoOptions:(id)a4 builder:(id)a5
{
  void (**v8)(id, PXStoryExportConfiguration *);
  PXStoryExportConfiguration *v9;

  v8 = (void (**)(id, PXStoryExportConfiguration *))a5;
  v9 = -[PXStoryExportConfiguration initWithConfiguration:videoOptions:](self, "initWithConfiguration:videoOptions:", a3, a4);
  if (v9)
    v8[2](v8, v9);

  return v9;
}

- (void)copyOptionalPropertiesFromOtherExportConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryExportConfiguration setActivityType:](self, "setActivityType:", v5);

  objc_msgSend(v4, "activityCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryExportConfiguration setActivityCategory:](self, "setActivityCategory:", v6);

  objc_msgSend(v4, "errorReporter");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryExportConfiguration setErrorReporter:](self, "setErrorReporter:", v7);
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  PXStoryExportExtendedTraitCollection *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PXStoryExportExtendedTraitCollection *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;

  -[PXStoryExportConfiguration videoOptions](self, "videoOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullSizePlayerExtendedTraitCollectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryExportConfiguration videoOptions](self, "videoOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersExportLayoutMatchesPlayback");

  v7 = [PXStoryExportExtendedTraitCollection alloc];
  if (v6 && v4)
  {
    objc_msgSend(v4, "layoutReferenceSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v4, "displayScale");
    v13 = v12;
    objc_msgSend(v4, "fullScreenReferenceRect");
    v18 = -[PXStoryExportExtendedTraitCollection initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:](v7, "initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:", v9, v11, v13, v14, v15, v16, v17);
  }
  else
  {
    -[PXStoryExportConfiguration videoOptions](self, "videoOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resolution");
    v21 = v20;
    v23 = v22;
    -[PXStoryExportConfiguration videoOptions](self, "videoOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    v18 = -[PXStoryExportExtendedTraitCollection initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:](v7, "initWithLayoutReferenceSize:displayScale:overrideFullScreenReferenceRect:", v21, v23, v25, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  }
  return (PXExtendedTraitCollection *)v18;
}

- (PXStoryExportVideoOptions)videoOptions
{
  return self->_videoOptions;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (NSString)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(id)a3
{
  objc_storeStrong((id *)&self->_activityCategory, a3);
}

- (PXStoryErrorReporter)errorReporter
{
  return (PXStoryErrorReporter *)objc_loadWeakRetained((id *)&self->_errorReporter);
}

- (void)setErrorReporter:(id)a3
{
  objc_storeWeak((id *)&self->_errorReporter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_errorReporter);
  objc_storeStrong((id *)&self->_activityCategory, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_videoOptions, 0);
}

@end
