@implementation PXStoryTimelineProducerConfiguration

- (PXStoryTimelineProducerConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineProducer.m"), 18, CFSTR("%s is not available as initializer"), "-[PXStoryTimelineProducerConfiguration init]");

  abort();
}

- (PXStoryTimelineProducerConfiguration)initWithResourcesDataSource:(id)a3 style:(id)a4 spec:(id)a5 options:(unint64_t)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PXStoryTimelineProducerConfiguration *v18;
  PXStoryTimelineProducerConfiguration *v19;
  void *v21;
  void *v22;
  void *v23;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v26 = a7;
  v17 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineProducer.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("style != nil"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineProducer.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourcesDataSource != nil"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineProducer.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spec != nil"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineProducerConfiguration;
  v18 = -[PXStoryTimelineProducerConfiguration init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resourcesDataSource, a3);
    objc_storeStrong((id *)&v19->_style, a4);
    objc_storeStrong((id *)&v19->_spec, a5);
    v19->_options = a6;
    objc_storeStrong((id *)&v19->_loadingCoordinator, a7);
    objc_storeStrong((id *)&v19->_errorReporter, a8);
    v19->_rangeOfPrioritizedDisplayAssetResources = (_NSRange)xmmword_1A7C0C330;
  }

  return v19;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryStyle)style
{
  return self->_style;
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXStoryLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (_NSRange)rangeOfPrioritizedDisplayAssetResources
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeOfPrioritizedDisplayAssetResources.length;
  location = self->_rangeOfPrioritizedDisplayAssetResources.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeOfPrioritizedDisplayAssetResources:(_NSRange)a3
{
  self->_rangeOfPrioritizedDisplayAssetResources = a3;
}

- (id)scorerFactory
{
  return self->_scorerFactory;
}

- (void)setScorerFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scorerFactory, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
}

@end
