@implementation PIVideoStabilizeRequest

- (PIVideoStabilizeRequest)initWithComposition:(id)a3
{
  PIVideoStabilizeRequest *v3;
  PIVideoStabilizeRequest *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PIVideoStabilizeRequest;
  v3 = -[NURenderRequest initWithComposition:](&v8, sel_initWithComposition_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_allowedCropFraction = 0.1;
    v3->_allowedAnalysisTypes = 3;
    +[PIPipelineFilters sourceFilterNoOrientation](PIPipelineFilters, "sourceFilterNoOrientation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPipelineFilters:](v4, "setPipelineFilters:", v6);

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PIVideoStabilizeRequest;
  v4 = -[NURenderRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAllowedCropFraction:", self->_allowedCropFraction);
  objc_msgSend(v4, "setProgressHandler:", self->_progressHandler);
  objc_msgSend(v4, "setAllowedAnalysisTypes:", self->_allowedAnalysisTypes);
  return v4;
}

- (id)newRenderJob
{
  PIVideoStabilizeRenderJob *v3;
  void *v4;

  v3 = -[NURenderJob initWithRequest:]([PIVideoStabilizeRenderJob alloc], "initWithRequest:", self);
  -[PIVideoStabilizeRequest allowedCropFraction](self, "allowedCropFraction");
  -[PIVideoStabilizeRenderJob setAllowedCropFraction:](v3, "setAllowedCropFraction:");
  -[PIVideoStabilizeRequest progressHandler](self, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIVideoStabilizeRenderJob setProgressHandler:](v3, "setProgressHandler:", v4);

  -[PIVideoStabilizeRenderJob setAllowedAnalysisTypes:](v3, "setAllowedAnalysisTypes:", -[PIVideoStabilizeRequest allowedAnalysisTypes](self, "allowedAnalysisTypes"));
  return v3;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

+ (BOOL)canPerformGyroBasedStabilizationForAsset:(id)a3
{
  return +[PIVideoReframeMetadataExtractor canProvideMetadataForAVAsset:](PIVideoReframeMetadataExtractor, "canProvideMetadataForAVAsset:", a3);
}

@end
