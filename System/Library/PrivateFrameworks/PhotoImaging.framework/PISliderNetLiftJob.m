@implementation PISliderNetLiftJob

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NURenderJob request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (BOOL)wantsOutputImage
{
  return 1;
}

- (BOOL)wantsCompleteStage
{
  return 1;
}

- (id)cacheKey
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D52090]);
  -[NURenderJob renderNode](self, "renderNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nu_updateDigest:", v3);

  objc_msgSend(v3, "finalize");
  objc_msgSend(v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSData *v13;
  id v14;
  NSData *styleFeatureVectorData;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  -[NURenderJob request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sliderNetModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetScenePrint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v8, "predictStylePrintForPixelBuffer:scenePrint:error:", a3, v9, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;

  if (v10)
  {
    v20 = 0;
    v12 = 1;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v20);
    v13 = (NSData *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    styleFeatureVectorData = self->_styleFeatureVectorData;
    self->_styleFeatureVectorData = v13;

    if (!self->_styleFeatureVectorData)
    {
      v16 = (void *)MEMORY[0x1E0D520A0];
      -[NURenderJob request](self, "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to archive the style Vector data"), v17, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v12 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D520A0];
    -[NURenderJob request](self, "request");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to get a style feature vector from IHK network"), v14, v11);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)result
{
  _PISliderNetLiftResult *v3;

  v3 = objc_alloc_init(_PISliderNetLiftResult);
  -[_PISliderNetLiftResult setStyleFeatureVectorData:](v3, "setStyleFeatureVectorData:", self->_styleFeatureVectorData);
  -[_PISliderNetLiftResult setContentFeatureVectorData:](v3, "setContentFeatureVectorData:", self->_contentFeatureVectorData);
  return v3;
}

- (void)cleanUp
{
  NSData *styleFeatureVectorData;
  NSData *contentFeatureVectorData;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PISliderNetLiftJob;
  -[NURenderJob cleanUp](&v5, sel_cleanUp);
  styleFeatureVectorData = self->_styleFeatureVectorData;
  self->_styleFeatureVectorData = 0;

  contentFeatureVectorData = self->_contentFeatureVectorData;
  self->_contentFeatureVectorData = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, 0);
  objc_storeStrong((id *)&self->_styleFeatureVectorData, 0);
}

@end
