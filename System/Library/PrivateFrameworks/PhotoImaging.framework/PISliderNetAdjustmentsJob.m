@implementation PISliderNetAdjustmentsJob

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

- (BOOL)prepare:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  IHKFeatureVector **p_sourceStyleFeatureVector;
  IHKFeatureVector *v15;
  IHKFeatureVector *v16;
  BOOL v17;
  NSObject *v19;
  void *v20;
  const void **v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  void *v39;
  uint64_t *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)PISliderNetAdjustmentsJob;
  if (!-[NURenderJob prepare:](&v33, sel_prepare_))
    return 0;
  -[NURenderJob prepareNode](self, "prepareNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    NUAssertLogger_14867();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing prepare node"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_14867();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v31;
        _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  -[NURenderJob request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v9 = (void *)getIHKFeatureVectorClass_softClass;
  v37 = getIHKFeatureVectorClass_softClass;
  if (!getIHKFeatureVectorClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getIHKFeatureVectorClass_block_invoke;
    v39 = &unk_1E5019948;
    v40 = &v34;
    __getIHKFeatureVectorClass_block_invoke((uint64_t)buf);
    v9 = (void *)v35[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v34, 8);
  objc_msgSend(v7, "styleFeatureVectorData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", v10, v11, &v32);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v32;
  p_sourceStyleFeatureVector = &self->_sourceStyleFeatureVector;
  v15 = *p_sourceStyleFeatureVector;
  *p_sourceStyleFeatureVector = (IHKFeatureVector *)v12;

  v16 = *p_sourceStyleFeatureVector;
  v17 = *p_sourceStyleFeatureVector != 0;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to unarchive style feature vector data"), v7, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)networkProcessingWithResultingPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  IHKFeatureVector *sourceStyleFeatureVector;
  float v14;
  float v15;
  id v16;
  void *v17;
  id adjustments;
  BOOL v19;
  void *v20;
  double v21;
  double similarityScore;
  double v23;
  void *v24;
  IHKFeatureVector *v25;
  NSDictionary *v26;
  void *v27;
  IHKFeatureVector *v28;
  NSDictionary *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  id v35;
  id v36;

  -[NURenderJob request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sliderNetModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetScenePrint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v8, "predictStylePrintForPixelBuffer:scenePrint:error:", a3, v9, &v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v36;

  if (v10)
  {
    objc_msgSend(v7, "sliderNetModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sourceStyleFeatureVector = self->_sourceStyleFeatureVector;
    v35 = 0;
    objc_msgSend(v12, "gatingScoreToTransferStyleFrom:to:error:", sourceStyleFeatureVector, v10, &v35);
    v15 = v14;
    v16 = v35;
    self->_similarityScore = v15;

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0D520A0];
      -[NURenderJob request](self, "request");
      adjustments = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to get a gating score from from network"), adjustments, v16);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v7, "similarityGatingThreshold");
    if (v21 == -1.0)
    {
      objc_msgSend(v7, "sliderNetModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self->_sourceStyleFeatureVector;
      v33 = 0;
      objc_msgSend(v24, "predictSlidersToTransferStyleFrom:to:error:", v25, v10, &v33);
      v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v27 = v33;
    }
    else
    {
      similarityScore = self->_similarityScore;
      objc_msgSend(v7, "similarityGatingThreshold");
      if (v23 > similarityScore)
      {
        adjustments = self->_adjustments;
        self->_adjustments = (NSDictionary *)MEMORY[0x1E0C9AA70];
LABEL_11:
        v19 = 1;
        goto LABEL_13;
      }
      objc_msgSend(v7, "sliderNetModel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = self->_sourceStyleFeatureVector;
      v34 = 0;
      objc_msgSend(v24, "predictSlidersToTransferStyleFrom:to:error:", v28, v10, &v34);
      v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v27 = v34;
    }
    adjustments = v27;
    v29 = self->_adjustments;
    self->_adjustments = v26;

    if (!self->_adjustments)
    {
      v30 = (void *)MEMORY[0x1E0D520A0];
      -[NURenderJob request](self, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to get sliders data from network"), v31, adjustments);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v20 = (void *)MEMORY[0x1E0D520A0];
  -[NURenderJob request](self, "request");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Unable to get a content feature Vector from network"), v16, v11);
  v19 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v19;
}

- (id)result
{
  _PISliderNetAdjustmentsResult *v3;
  double v4;

  v3 = objc_alloc_init(_PISliderNetAdjustmentsResult);
  -[_PISliderNetAdjustmentsResult setAdjustments:](v3, "setAdjustments:", self->_adjustments);
  *(float *)&v4 = self->_similarityScore;
  -[_PISliderNetAdjustmentsResult setSimilarityScore:](v3, "setSimilarityScore:", v4);
  return v3;
}

- (void)cleanUp
{
  NSDictionary *adjustments;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PISliderNetAdjustmentsJob;
  -[NURenderJob cleanUp](&v4, sel_cleanUp);
  adjustments = self->_adjustments;
  self->_adjustments = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContentFeatureVector, 0);
  objc_storeStrong((id *)&self->_sourceStyleFeatureVector, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
}

@end
