@implementation PLPhotoEditRenderer

- (PLPhotoEditRenderer)initWithEditSource:(id)a3
{
  return -[PLPhotoEditRenderer initWithEditSource:renderPriority:](self, "initWithEditSource:renderPriority:", a3, 1);
}

- (PLPhotoEditRenderer)initWithEditSource:(id)a3 renderPriority:(int64_t)a4
{
  id v8;
  PLPhotoEditRenderer *v9;
  NURenderContext *v10;
  NURenderContext *imageRenderContext;
  NURenderContext *v12;
  NURenderContext *videoRenderContext;
  NURenderContext *v14;
  NURenderContext *geometryContext;
  NURenderContext *v16;
  NURenderContext *smartToneAutoCalculatorContext;
  void *v18;
  int64_t v19;
  objc_class *v20;
  uint64_t v21;
  NUPriority *priority;
  void *v24;
  objc_super v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editSource"));

  }
  v25.receiver = self;
  v25.super_class = (Class)PLPhotoEditRenderer;
  v9 = -[PLPhotoEditRenderer init](&v25, sel_init);
  objc_msgSend((id)objc_opt_class(), "configureNeutrinoCacheDirectoryIfNeeded");
  objc_storeStrong((id *)&v9->_editSource, a3);
  v10 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  imageRenderContext = v9->_imageRenderContext;
  v9->_imageRenderContext = v10;

  v12 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  videoRenderContext = v9->_videoRenderContext;
  v9->_videoRenderContext = v12;

  v14 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  geometryContext = v9->_geometryContext;
  v9->_geometryContext = v14;

  v16 = (NURenderContext *)objc_alloc_init((Class)getNURenderContextClass());
  smartToneAutoCalculatorContext = v9->_smartToneAutoCalculatorContext;
  v9->_smartToneAutoCalculatorContext = v16;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v18 = (void *)getNUPriorityClass_softClass;
  v30 = getNUPriorityClass_softClass;
  if (!getNUPriorityClass_softClass)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __getNUPriorityClass_block_invoke;
    v26[3] = &unk_1E3677580;
    v26[4] = &v27;
    __getNUPriorityClass_block_invoke((uint64_t)v26);
    v18 = (void *)v28[3];
  }
  if ((unint64_t)a4 <= 3)
    v19 = 3 - a4;
  else
    v19 = 0;
  v20 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v27, 8);
  v21 = objc_msgSend([v20 alloc], "initWithLevel:", v19);
  priority = v9->_priority;
  v9->_priority = (NUPriority *)v21;

  return v9;
}

- (id)newExporter
{
  return objc_alloc_init((Class)getPICompositionExporterClass());
}

- (id)newImageExporterOptions
{
  void *v3;
  objc_class *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getPICompositionExporterImageOptionsClass_softClass;
  v11 = getPICompositionExporterImageOptionsClass_softClass;
  if (!getPICompositionExporterImageOptionsClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPICompositionExporterImageOptionsClass_block_invoke;
    v7[3] = &unk_1E3677580;
    v7[4] = &v8;
    __getPICompositionExporterImageOptionsClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setPriority:", self->_priority);
  return v5;
}

- (id)newVideoExporterOptions
{
  void *v3;
  objc_class *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getPICompositionExporterVideoOptionsClass_softClass;
  v11 = getPICompositionExporterVideoOptionsClass_softClass;
  if (!getPICompositionExporterVideoOptionsClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPICompositionExporterVideoOptionsClass_block_invoke;
    v7[3] = &unk_1E3677580;
    v7[4] = &v8;
    __getPICompositionExporterVideoOptionsClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setPriority:", self->_priority);
  return v5;
}

- (id)exportVideoToURL:(id)a3 preset:(id)a4 livePhotoPairingIdentifier:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[PLPhotoEditRenderer newExporter](self, "newExporter");
  v13 = -[PLPhotoEditRenderer newVideoExporterOptions](self, "newVideoExporterOptions");
  objc_msgSend(v13, "setPairingIdentifier:", v10);

  -[PLPhotoEditRenderer composition](self, "composition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PLPhotoEditRenderer_exportVideoToURL_preset_livePhotoPairingIdentifier_completion___block_invoke;
  v18[3] = &unk_1E3667558;
  v19 = v9;
  v15 = v9;
  objc_msgSend(v12, "exportVideoToURL:composition:options:completion:", v11, v14, v13, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NUComposition)composition
{
  void *v3;
  void *v4;

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoEditRenderer compositionWithController:source:](PLPhotoEditRenderer, "compositionWithController:source:", v3, self->_editSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NUComposition *)v4;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  height = a3.height;
  width = a3.width;
  v11 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_name_completion___block_invoke;
  v13[3] = &unk_1E3667580;
  v14 = v11;
  v12 = v11;
  -[PLPhotoEditRenderer renderImageWithTargetSize:contentMode:renderMode:name:completion:](self, "renderImageWithTargetSize:contentMode:renderMode:name:completion:", a4, 0, a5, v13, width, height);

}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 name:(id)a6 completion:(id)a7
{
  __int128 v7;
  uint64_t v8;

  v7 = *MEMORY[0x1E0CA2E18];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[PLPhotoEditRenderer renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:](self, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", a4, a5, &v7, a6, a7, a3.width, a3.height);
}

- (void)renderImageWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 renderMode:(int64_t)a5 renderTime:(id *)a6 name:(id)a7 completion:(id)a8
{
  double height;
  double width;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  int64_t var3;

  height = a3.height;
  width = a3.width;
  v16 = (__CFString *)a7;
  v17 = a8;
  if (!self->_editSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 405, CFSTR("editSource cannot be nil while rendering"));

  }
  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 406, CFSTR("compositionController cannot be nil while rendering"));

  }
  -[PLPhotoEditRenderer composition](self, "composition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    objc_msgSend(getPIPhotoEditHelperClass_27283(), "imageRenderRequestWithComposition:fillInSize:wideGamut:", v19, 1, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("PLPhotoEditRenderer-fill");
    goto LABEL_9;
  }
  if (!a4)
  {
    objc_msgSend(getPIPhotoEditHelperClass_27283(), "imageRenderRequestWithComposition:fitInSize:wideGamut:", v19, 1, width, height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("PLPhotoEditRenderer-fit");
LABEL_9:
    if (-[__CFString length](v16, "length"))
      v22 = v16;
    else
      v22 = v21;
    objc_msgSend(v20, "setName:", v22);
    goto LABEL_14;
  }
  v20 = 0;
LABEL_14:
  if (a5 == 1)
  {
    objc_msgSend(getPIPhotoEditHelperClass_27283(), "pipelineFiltersForCropping");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPipelineFilters:", v23);

  }
  objc_msgSend(v20, "setRenderContext:", self->_imageRenderContext);
  v29 = *(_OWORD *)&a6->var0;
  var3 = a6->var3;
  objc_msgSend(v20, "setTime:", &v29);
  objc_msgSend(v20, "setPriority:", self->_priority);
  -[PLPhotoEditRenderer displayMaximumEDRHeadroom](self, "displayMaximumEDRHeadroom");
  objc_msgSend(v20, "setMaxEDRHeadroom:");
  -[PLPhotoEditRenderer displayCurrentEDRHeadroom](self, "displayCurrentEDRHeadroom");
  objc_msgSend(v20, "setCurrentEDRHeadroom:");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __99__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_renderMode_renderTime_name_completion___block_invoke;
  v27[3] = &unk_1E3667558;
  v28 = v17;
  v24 = v17;
  objc_msgSend(v20, "submit:", v27);

}

- (void)renderVideoWithTargetSize:(CGSize)a3 name:(id)a4 completion:(id)a5
{
  -[PLPhotoEditRenderer renderVideoWithTargetSize:contentMode:name:completion:](self, "renderVideoWithTargetSize:contentMode:name:completion:", 0, a4, a5, a3.width, a3.height);
}

- (void)renderVideoWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 name:(id)a5 completion:(id)a6
{
  double height;
  double width;
  __CFString *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  height = a3.height;
  width = a3.width;
  v28[1] = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a5;
  v13 = a6;
  if (!self->_editSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 474, CFSTR("editSource cannot be nil while rendering"));

  }
  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 475, CFSTR("compositionController cannot be nil while rendering"));

  }
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Target size not specified");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 41003, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, v16);
    goto LABEL_19;
  }
  -[PLPhotoEditRenderer composition](self, "composition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoEditRenderer.m"), 494, CFSTR("PLPhotoEditContentModeAspectFill is not supported for this path"));

    goto LABEL_14;
  }
  if (a4)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  objc_msgSend(getPIPhotoEditHelperClass_27283(), "videoRenderRequestWithComposition:fitInSize:", v16, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  objc_msgSend(v17, "setRenderContext:", self->_videoRenderContext);
  objc_msgSend(v17, "setPriority:", self->_priority);
  if (-[__CFString length](v12, "length"))
    v22 = v12;
  else
    v22 = CFSTR("PLPhotoEditRenderer-renderVideoWithTargetSize");
  objc_msgSend(v17, "setName:", v22);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __77__PLPhotoEditRenderer_renderVideoWithTargetSize_contentMode_name_completion___block_invoke;
  v25[3] = &unk_1E3667558;
  v26 = v13;
  objc_msgSend(v17, "submit:", v25);

LABEL_19:
}

- (void)generateJPEGImageDataWithCompressionQuality:(double)a3 livePhotoPairingIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = -[PLPhotoEditRenderer newExporter](self, "newExporter");
  v11 = -[PLPhotoEditRenderer newImageExporterOptions](self, "newImageExporterOptions");
  objc_msgSend(v11, "setPairingIdentifier:", v9);

  objc_msgSend(v11, "setJPEGCompressionQuality:", a3);
  -[PLPhotoEditRenderer composition](self, "composition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __112__PLPhotoEditRenderer_generateJPEGImageDataWithCompressionQuality_livePhotoPairingIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E3667558;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v10, "exportImageToDataWithComposition:options:completion:", v12, v11, v14);

}

- (void)setCompositionController:(id)a3
{
  PICompositionController *v5;
  NSDictionary *smartToneAdjustments;
  NSDictionary *smartColorAdjustments;
  NSDictionary *smartBWAdjustments;
  PICompositionController *v9;

  v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    smartToneAdjustments = self->__smartToneAdjustments;
    self->__smartToneAdjustments = 0;

    smartColorAdjustments = self->__smartColorAdjustments;
    self->__smartColorAdjustments = 0;

    smartBWAdjustments = self->__smartBWAdjustments;
    self->__smartBWAdjustments = 0;

    v5 = v9;
  }

}

- (void)setSmartFiltersCubeSize:(int64_t)a3
{
  if (self->_smartFiltersCubeSize != a3)
    self->_smartFiltersCubeSize = a3;
}

- (double)_smartToneLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a3;
  v7 = a4;
  -[PLPhotoEditRenderer _smartToneAdjustments](self, "_smartToneAdjustments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PISmartToneAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "objectForKey:", v6);
  else
    +[PLCompositionHelper defaultValueForAdjustmentKey:settingKey:](PLCompositionHelper, "defaultValueForAdjustmentKey:settingKey:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  return v13;
}

- (double)smartToneBaseBrightness
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeBrightnessKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetBrightnessKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseContrast
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeBrightnessKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetBrightnessKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseExposure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeExposureKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetExposureKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeHighlightsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetHighlightsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseShadows
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeShadowsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetShadowsKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseBlackPoint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeBlackPointKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetBlackKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartToneBaseLocalLight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartToneAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeLocalLightKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetLocalLightKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartToneLevelWithAttributeKey:settingKey:](self, "_smartToneLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)_smartColorLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a3;
  v7 = a4;
  -[PLPhotoEditRenderer _smartColorAdjustments](self, "_smartColorAdjustments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PISmartColorAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "objectForKey:", v6);
  else
    +[PLCompositionHelper defaultValueForAdjustmentKey:settingKey:](PLCompositionHelper, "defaultValueForAdjustmentKey:settingKey:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  return v13;
}

- (double)smartColorBaseContrast
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartColorAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeContrastKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetContrastKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartColorLevelWithAttributeKey:settingKey:](self, "_smartColorLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartColorBaseSaturation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartColorAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeVibrancyKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetSaturationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartColorLevelWithAttributeKey:settingKey:](self, "_smartColorLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartColorBaseCast
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartColorAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeCastKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offsetCastKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartColorLevelWithAttributeKey:settingKey:](self, "_smartColorLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)_smartBWLevelWithAttributeKey:(id)a3 settingKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a3;
  v7 = a4;
  -[PLPhotoEditRenderer _smartBWAdjustments](self, "_smartBWAdjustments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PISmartBWAdjustmentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "objectForKey:", v6);
  else
    +[PLCompositionHelper defaultValueForAdjustmentKey:settingKey:](PLCompositionHelper, "defaultValueForAdjustmentKey:settingKey:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  return v13;
}

- (double)smartBWBaseStrength
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartBWAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeStrengthKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "strengthKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartBWLevelWithAttributeKey:settingKey:](self, "_smartBWLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartBWBaseNeutralGamma
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartBWAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeNeutralGammaKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "neutralKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartBWLevelWithAttributeKey:settingKey:](self, "_smartBWLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartBWBaseTone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartBWAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeToneKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toneKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartBWLevelWithAttributeKey:settingKey:](self, "_smartBWLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartBWBaseHue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartBWAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeHueKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hueKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartBWLevelWithAttributeKey:settingKey:](self, "_smartBWLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (double)smartBWBaseGrain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PISmartBWAdjustmentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "adjustmentControllerClassForKey:", v4);

  objc_msgSend(v6, "attributeGrainKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "grainKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer _smartBWLevelWithAttributeKey:settingKey:](self, "_smartBWLevelWithAttributeKey:settingKey:", v7, v8);
  v10 = v9;

  return v10;
}

- (id)_smartToneAdjustments
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *smartToneAdjustments;
  NSDictionary *v10;
  void *v11;
  double v12;
  NSDictionary *v13;
  NSDictionary *v14;
  NSDictionary *v15;
  NSDictionary *v16;

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartToneAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inputLight");
  v6 = v5;
  objc_msgSend(v4, "statistics");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != self->_smartToneLevelInCachedAdjustments || v7 != self->_smartToneStatisticsInCachedAdjustments)
  {
    smartToneAdjustments = self->__smartToneAdjustments;
    self->__smartToneAdjustments = 0;

  }
  v10 = self->__smartToneAdjustments;
  if (!v10 && v8)
  {
    -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("localAutoValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C9DDC8], "smartToneAdjustmentsForValue:localLightAutoValue:andStatistics:", v8, v6, v12);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->__smartToneAdjustments;
    self->__smartToneAdjustments = v13;
    v15 = v13;

    self->_smartToneLevelInCachedAdjustments = v6;
    objc_storeStrong((id *)&self->_smartToneStatisticsInCachedAdjustments, v8);

    v10 = self->__smartToneAdjustments;
  }
  v16 = v10;

  return v16;
}

- (id)_smartColorAdjustments
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *smartColorAdjustments;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSDictionary *v13;

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartColorAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "inputColor");
  v6 = v5;
  objc_msgSend(v4, "statistics");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != self->_smartColorLevelInCachedAdjustments || v7 != self->_smartColorStatisticsInCachedAdjustments)
  {
    smartColorAdjustments = self->__smartColorAdjustments;
    self->__smartColorAdjustments = 0;

  }
  v10 = self->__smartColorAdjustments;
  if (!v10 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "smartColorAdjustmentsForValue:andStatistics:", v8, v6);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = self->__smartColorAdjustments;
    self->__smartColorAdjustments = v11;

    self->_smartColorLevelInCachedAdjustments = v6;
    objc_storeStrong((id *)&self->_smartColorStatisticsInCachedAdjustments, v8);
    v10 = self->__smartColorAdjustments;
  }
  v13 = v10;

  return v13;
}

- (id)_smartBWAdjustments
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSDictionary *smartBWAdjustments;
  NSDictionary *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  -[PLPhotoEditRenderer compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartBWAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hue");
  v6 = v5;
  if (v5 != self->_smartBWLevelInCachedAdjustments)
  {
    smartBWAdjustments = self->__smartBWAdjustments;
    self->__smartBWAdjustments = 0;

  }
  v8 = self->__smartBWAdjustments;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "emptyImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "smartBlackAndWhiteAdjustmentsForValue:andStatistics:", 0, v6);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->__smartBWAdjustments;
    self->__smartBWAdjustments = v10;

    self->_smartBWLevelInCachedAdjustments = v6;
    v8 = self->__smartBWAdjustments;
  }
  v12 = v8;

  return v12;
}

- (void)calculateLongExposureFusionParametersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getPILongExposureFusionAutoCalculatorClass_softClass;
  v18 = getPILongExposureFusionAutoCalculatorClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getPILongExposureFusionAutoCalculatorClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getPILongExposureFusionAutoCalculatorClass_block_invoke;
    v14[3] = &unk_1E3677580;
    v14[4] = &v15;
    __getPILongExposureFusionAutoCalculatorClass_block_invoke((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v8 = [v7 alloc];
  -[PLPhotoEditRenderer composition](self, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithComposition:", v9);

  objc_msgSend(v10, "setName:", CFSTR("PL-PILongExposureFusionAutoCalculator"));
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __82__PLPhotoEditRenderer_calculateLongExposureFusionParametersWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E3667558;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "submit:", v12);

}

- (id)getGeometryForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(getPIPhotoEditHelperClass_27283(), "pipelineFiltersForOriginalGeometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer getGeometryForComposition:pipelineFilters:](self, "getGeometryForComposition:pipelineFilters:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getGeometryForComposition:(id)a3 pipelineFilters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(getPIPhotoEditHelperClass_27283(), "geometryRequestWithComposition:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPipelineFilters:", v6);
  objc_msgSend(v8, "setRenderContext:", self->_geometryContext);
  objc_msgSend(v8, "setName:", CFSTR("PLPhotoEditRenderer-geometry"));
  v12 = 0;
  objc_msgSend(v8, "submitSynchronous:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geometry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)applySourceChangesToCompositionSynchronously:(id)a3 source:(id)a4 withBlock:(id)a5
{
  -[PLPhotoEditRenderer applySourceChangesToComposition:source:withBlock:executeSynchronously:completionBlock:](self, "applySourceChangesToComposition:source:withBlock:executeSynchronously:completionBlock:", a3, a4, a5, 1, 0);
}

- (void)applySourceChangesToCompositionAsynchronously:(id)a3 source:(id)a4 withBlock:(id)a5 completionBlock:(id)a6
{
  -[PLPhotoEditRenderer applySourceChangesToComposition:source:withBlock:executeSynchronously:completionBlock:](self, "applySourceChangesToComposition:source:withBlock:executeSynchronously:completionBlock:", a3, a4, a5, 0, a6);
}

- (void)applySourceChangesToComposition:(id)a3 source:(id)a4 withBlock:(id)a5 executeSynchronously:(BOOL)a6 completionBlock:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  _BOOL4 v71;
  id v72;
  void *v73;
  void (**v74)(id, void *);
  void *v75;
  void (**v76)(void);
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  void (**v84)(void);
  _QWORD v85[4];
  NSObject *v86;
  id v87;
  _QWORD v88[8];
  __int128 v89;
  __int128 v90;
  uint8_t buf[16];
  __int128 v92;
  __int128 *v93;
  uint64_t v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v71 = a6;
  v94 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v72 = a4;
  v74 = (void (**)(id, void *))a5;
  v76 = (void (**)(void))a7;
  v79 = v11;
  v12 = (void *)objc_msgSend(v11, "copy");
  +[PLPhotoEditRenderer compositionWithController:source:](PLPhotoEditRenderer, "compositionWithController:source:", v12, self->_editSource);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoEditRenderer getGeometryForComposition:](self, "getGeometryForComposition:", v13);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2](v74, v12);
  +[PLPhotoEditRenderer compositionWithController:source:](PLPhotoEditRenderer, "compositionWithController:source:", v12, self->_editSource);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoEditRenderer getGeometryForComposition:](self, "getGeometryForComposition:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v78 && v75)
  {
    *(_OWORD *)buf = 0u;
    v92 = 0u;
    objc_msgSend(v78, "extent");
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v75, "extent");
    v15 = (double)0;
    v16 = (double)0;
    v17 = (double)0;
    v18 = (double)0;
    v95.origin.x = (double)0;
    v95.origin.y = (double)0;
    v95.size.width = (double)0;
    v95.size.height = (double)0;
    v99.origin.x = (double)0;
    v99.origin.y = (double)0;
    v99.size.width = (double)0;
    v99.size.height = (double)0;
    if (CGRectEqualToRect(v95, v99))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v12, "cropAdjustmentController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "cropAdjustmentController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);
      objc_msgSend(v19, "cropRect");
      v67 = v22;
      v68 = v23;
      v69 = v24;
      v70 = v25;
      if (v21 && !CGRectIsEmpty(*(CGRect *)&v22) && objc_msgSend(v19, "enabled"))
      {
        v96.origin.x = (double)0 + (v67 - (double)0) / v15 * v17;
        v96.origin.y = (double)0 + (v68 - (double)0) / v16 * v18;
        v96.size.width = v69 / v15 * v17;
        v96.size.height = v70 / v16 * v18;
        v97 = CGRectInset(v96, 1.0, 1.0);
        v98 = CGRectIntegral(v97);
        x = v98.origin.x;
        y = v98.origin.y;
        width = v98.size.width;
        height = v98.size.height;
        objc_msgSend(v73, "PICropAdjustmentKey");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke;
        v88[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
        *(CGFloat *)&v88[4] = x;
        *(CGFloat *)&v88[5] = y;
        *(CGFloat *)&v88[6] = width;
        *(CGFloat *)&v88[7] = height;
        objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v30, v88);

      }
      objc_msgSend(v73, "PIRedEyeAdjustmentKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeAdjustmentWithKey:", v31);

      objc_msgSend(v12, "smartToneAdjustmentController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v32, "enabled");

    }
  }
  objc_msgSend(v79, "portraitAdjustmentController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "enabled");
  objc_msgSend(v12, "portraitAdjustmentController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "enabled");

  objc_msgSend(v79, "portraitAdjustmentController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "kind");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "portraitAdjustmentController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "kind");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v38, "isEqualToString:", v40);

  if ((v41 & 1) == 0)
  {
    if (v34 == v36)
    {
      objc_msgSend(v12, "portraitAdjustmentController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v42, "enabled");

    }
    else
    {
      v14 = 1;
    }
  }
  objc_msgSend(v79, "autoLoopAdjustmentController");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autoLoopAdjustmentController");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v43 | v44 && (objc_msgSend((id)v43, "isEqual:", v44) & 1) == 0)
  {
    objc_msgSend((id)v44, "flavor");
    v53 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&v92 = 0x2020000000;
    v54 = getPIAutoLoopFlavorFromStringSymbolLoc_ptr;
    *((_QWORD *)&v92 + 1) = getPIAutoLoopFlavorFromStringSymbolLoc_ptr;
    if (!getPIAutoLoopFlavorFromStringSymbolLoc_ptr)
    {
      v55 = PhotoImagingLibrary_27258();
      v54 = dlsym(v55, "PIAutoLoopFlavorFromString");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v54;
      getPIAutoLoopFlavorFromStringSymbolLoc_ptr = v54;
    }
    _Block_object_dispose(buf, 8);
    if (v54)
    {
      v56 = ((uint64_t (*)(id))v54)(v53);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&v92 = 0x2020000000;
      v57 = getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr;
      *((_QWORD *)&v92 + 1) = getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr;
      if (!getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr)
      {
        v58 = PhotoImagingLibrary_27258();
        v57 = dlsym(v58, "PIAutoLoopFlavorProducesOnlyVideo");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v57;
        getPIAutoLoopFlavorProducesOnlyVideoSymbolLoc_ptr = v57;
      }
      _Block_object_dispose(buf, 8);
      if (v57)
      {
        if ((((uint64_t (*)(uint64_t))v57)(v56) & 1) != 0)
        {
          if ((v14 & 1) == 0)
            goto LABEL_34;
        }
        else
        {
          objc_msgSend(v12, "smartToneAdjustmentController");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "enabled");

          if (((v60 | v14) & 1) == 0)
            goto LABEL_34;
        }
LABEL_17:
        -[NURenderContext cancelAllRequests](self->_smartToneAutoCalculatorContext, "cancelAllRequests");
        *(_QWORD *)&v89 = 0;
        *((_QWORD *)&v89 + 1) = &v89;
        *(_QWORD *)&v90 = 0x2050000000;
        v45 = (void *)getPISmartToneAutoCalculatorClass_softClass;
        *((_QWORD *)&v90 + 1) = getPISmartToneAutoCalculatorClass_softClass;
        if (!getPISmartToneAutoCalculatorClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&v92 = __getPISmartToneAutoCalculatorClass_block_invoke;
          *((_QWORD *)&v92 + 1) = &unk_1E3677580;
          v93 = &v89;
          __getPISmartToneAutoCalculatorClass_block_invoke((uint64_t)buf);
          v45 = *(void **)(*((_QWORD *)&v89 + 1) + 24);
        }
        v46 = objc_retainAutorelease(v45);
        _Block_object_dispose(&v89, 8);
        v47 = (void *)objc_msgSend([v46 alloc], "initWithComposition:", v77);
        objc_msgSend(v47, "setName:", CFSTR("PL-PISmartToneAutoCalculator"));
        objc_msgSend(v47, "setRenderContext:", self->_smartToneAutoCalculatorContext);
        if (!v71)
        {
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_76;
          v80[3] = &unk_1E3667660;
          v81 = v12;
          v82 = v73;
          v83 = v79;
          v84 = v76;
          objc_msgSend(v47, "submit:", v80);

          v50 = v81;
LABEL_37:

          goto LABEL_38;
        }
        v87 = 0;
        objc_msgSend(v47, "submitSynchronous:", &v87);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v87;
        v50 = v49;
        if (v48)
        {
          objc_msgSend(v73, "PISmartToneAdjustmentKey");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2;
          v85[3] = &unk_1E3667638;
          v86 = v48;
          objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v51, v85);

          objc_msgSend(v79, "applyChangesFromCompositionController:", v12);
          v52 = v86;
        }
        else
        {
          objc_msgSend(v49, "domain");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v61, "isEqualToString:", CFSTR("NUError")))
          {
            v62 = objc_msgSend(v50, "code") == 10;

            if (v62)
              goto LABEL_23;
          }
          else
          {

          }
          PLPhotoEditGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v50;
            _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
          }
        }

LABEL_23:
        if (v76)
          v76[2]();

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SOFT_LINKED_PIAutoLoopFlavorProducesOnlyVideo(PIAutoLoopFlavor)");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("PLPhotoEditRenderer.m"), 86, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PIAutoLoopFlavor SOFT_LINKED_PIAutoLoopFlavorFromString(NSString *__strong)");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PLPhotoEditRenderer.m"), 85, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  if (v14)
    goto LABEL_17;
LABEL_34:
  objc_msgSend(v79, "applyChangesFromCompositionController:", v12);
  if (v76)
    v76[2]();
LABEL_38:

}

- (void)cancelAllRenders
{
  -[NURenderContext cancelAllRequests](self->_videoRenderContext, "cancelAllRequests");
  -[NURenderContext cancelAllRequests](self->_geometryContext, "cancelAllRequests");
  -[NURenderContext cancelAllRequests](self->_smartToneAutoCalculatorContext, "cancelAllRequests");
  -[NURenderContext cancelAllRequests](self->_imageRenderContext, "cancelAllRequests");
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (int64_t)smartFiltersCubeSize
{
  return self->_smartFiltersCubeSize;
}

- (double)displayMaximumEDRHeadroom
{
  return self->_displayMaximumEDRHeadroom;
}

- (void)setDisplayMaximumEDRHeadroom:(double)a3
{
  self->_displayMaximumEDRHeadroom = a3;
}

- (double)displayCurrentEDRHeadroom
{
  return self->_displayCurrentEDRHeadroom;
}

- (void)setDisplayCurrentEDRHeadroom:(double)a3
{
  self->_displayCurrentEDRHeadroom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_smartToneAutoCalculatorContext, 0);
  objc_storeStrong((id *)&self->_geometryContext, 0);
  objc_storeStrong((id *)&self->_videoRenderContext, 0);
  objc_storeStrong((id *)&self->_imageRenderContext, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->__smartBWAdjustments, 0);
  objc_storeStrong((id *)&self->_smartColorStatisticsInCachedAdjustments, 0);
  objc_storeStrong((id *)&self->__smartColorAdjustments, 0);
  objc_storeStrong((id *)&self->_smartToneStatisticsInCachedAdjustments, 0);
  objc_storeStrong((id *)&self->__smartToneAdjustments, 0);
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatistics:", *(_QWORD *)(a1 + 32));
}

void __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_76(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void (**v12)(void);
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  objc_msgSend(a2, "result:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  v5 = v4;
  if (v3)
  {
    v6 = a1[4];
    objc_msgSend(a1[5], "PISmartToneAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2_77;
    v17[3] = &unk_1E3667638;
    v18 = v3;
    objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v17);

    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_3;
    block[3] = &unk_1E3676290;
    v14 = a1[6];
    v15 = a1[4];
    v16 = a1[7];
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_12;
  }
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("NUError")))
  {

    goto LABEL_7;
  }
  v10 = objc_msgSend(v5, "code");

  if (v10 != 10)
  {
LABEL_7:
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error in smart tone autocalculator: %@", buf, 0xCu);
    }

  }
  v12 = (void (**)(void))a1[7];
  if (v12)
    v12[2]();
LABEL_12:

}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_2_77(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatistics:", *(_QWORD *)(a1 + 32));
}

uint64_t __109__PLPhotoEditRenderer_applySourceChangesToComposition_source_withBlock_executeSynchronously_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "applyChangesFromCompositionController:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__PLPhotoEditRenderer_calculateLongExposureFusionParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = 0;
  objc_msgSend(a2, "result:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(_QWORD, BOOL, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 != 0, v3, v4);

}

void __112__PLPhotoEditRenderer_generateJPEGImageDataWithCompressionQuality_livePhotoPairingIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = 0;
  objc_msgSend(a2, "result:", &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    objc_msgSend(v3, "geometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "size");
    v8 = v7;

    v9 = objc_msgSend(v3, "inputSize");
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, double, double, double, double))(v12 + 16))(v12, v13, (double)v9, (double)v11, (double)v6, (double)v8);

  }
  else
  {
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }

}

void __77__PLPhotoEditRenderer_renderVideoWithTargetSize_contentMode_name_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(a2, "result:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3)
  {
    objc_msgSend(v3, "video");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v3, "videoComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v3, "audioMix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Rendering error in -[PLPhotoEditRenderer renderVideoWithTargetSize:]: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __99__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_renderMode_renderTime_name_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id PIPhotoEditHelperClass_27283;
  void *v6;
  CGImage *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[16];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(a2, "result:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    PIPhotoEditHelperClass_27283 = getPIPhotoEditHelperClass_27283();
    objc_msgSend(v3, "buffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CGImage *)objc_msgSend(PIPhotoEditHelperClass_27283, "newCGImageFromImageBuffer:", v6);

    *(_OWORD *)buf = 0u;
    v15 = 0u;
    objc_msgSend(v3, "geometry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "extent");
    }
    else
    {
      *(_OWORD *)buf = 0u;
      v15 = 0u;
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, CGImage *, _QWORD, double, double, double, double))(v12 + 16))(v12, v7, 0, (double)*(uint64_t *)buf, (double)*(uint64_t *)&buf[8], (double)(uint64_t)v15, (double)*((uint64_t *)&v15 + 1));
    CGImageRelease(v7);
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Rendering error in -[PLPhotoEditRenderer renderImageWithTargetSize:]: %@", buf, 0xCu);
    }

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id, double, double, double, double))(v11 + 16))(v11, 0, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }

}

uint64_t __77__PLPhotoEditRenderer_renderImageWithTargetSize_contentMode_name_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__PLPhotoEditRenderer_exportVideoToURL_preset_livePhotoPairingIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  __n128 v5;
  __n128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  objc_msgSend(a2, "result:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v3, "geometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "size");
    v10 = v9;

    v5.n128_f64[0] = (double)v8;
    v6.n128_f64[0] = (double)v10;
  }
  else
  {
    v5.n128_u64[0] = *MEMORY[0x1E0C9D820];
    v6.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  (*(void (**)(__n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(v5, v6);

}

+ (void)configureNeutrinoCacheDirectoryIfNeeded
{
  if (configureNeutrinoCacheDirectoryIfNeeded_onceToken != -1)
    dispatch_once(&configureNeutrinoCacheDirectoryIfNeeded_onceToken, &__block_literal_global_27366);
}

+ (id)rendererForVideoURL:(id)a3 livePhotoStillURL:(id)a4 adjustmentData:(id)a5 formatIdentifier:(id)a6 formatVersion:(id)a7
{
  id v13;
  id v14;
  uint64_t v15;
  PLPhotoEditPersistenceManager *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id PIPhotoEditHelperClass_27283;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  PLPhotoEditRenderer *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  PLVideoEditSource *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 buf;
  uint64_t v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v43 = a5;
  v44 = a6;
  v45 = a7;
  v41 = v13;
  if (v14)
  {
    +[PLLivePhotoEditSource livePhotoSourceWithPhotoURL:videoComplementURL:](PLLivePhotoEditSource, "livePhotoSourceWithPhotoURL:videoComplementURL:", v14, v13);
    v42 = (PLVideoEditSource *)objc_claimAutoreleasedReturnValue();
    v15 = 3;
  }
  else
  {
    v42 = -[PLVideoEditSource initWithVideoURL:]([PLVideoEditSource alloc], "initWithVideoURL:", v13);
    v15 = 2;
  }
  v16 = objc_alloc_init(PLPhotoEditPersistenceManager);
  v47 = 0;
  -[PLPhotoEditPersistenceManager loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:](v16, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v43, v44, v45, 0, &v47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v47;
  v19 = v18;
  if (!v17 || v18)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "could not load composition from adjustment data: %@", (uint8_t *)&buf, 0xCu);
    }
    v33 = 0;
  }
  else
  {
    v20 = objc_msgSend(getPIPhotoEditHelperClass_27283(), "newCompositionControllerWithComposition:", v17);
    -[PLEditSource source](v42, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setSource:mediaType:](v20, "setSource:mediaType:", v21, v15);

    v40 = -[NSObject copy](v20, "copy");
    objc_msgSend(v40, "composition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoEditRenderer.m"), 257, CFSTR("Composition controller has no NUComposition!"));

    }
    PIPhotoEditHelperClass_27283 = getPIPhotoEditHelperClass_27283();
    objc_msgSend(v40, "composition");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PIPhotoEditHelperClass_27283, "videoPropertiesRequestWithComposition:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setName:", CFSTR("PLPhotoEditRenderer-getInputOrientation"));
    v46 = 0;
    objc_msgSend(v26, "submitSynchronous:", &v46);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v46;
    if (v27)
    {
      objc_msgSend(v27, "properties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "orientation");

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v49 = 0x2020000000;
      v31 = getNUOrientationIsValidSymbolLoc_ptr;
      v50 = getNUOrientationIsValidSymbolLoc_ptr;
      if (!getNUOrientationIsValidSymbolLoc_ptr)
      {
        v32 = NeutrinoCoreLibrary_27322();
        v31 = dlsym(v32, "NUOrientationIsValid");
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v31;
        getNUOrientationIsValidSymbolLoc_ptr = v31;
      }
      _Block_object_dispose(&buf, 8);
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NUOrientation SOFT_LINKED_NUOrientationIsValid(NUOrientation)");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PLPhotoEditRenderer.m"), 83, CFSTR("%s"), dlerror());

        __break(1u);
      }
      if (((uint64_t (*)(uint64_t))v31)(v30))
      {
        +[PLCompositionHelper compositionController:setInputOrientation:](PLCompositionHelper, "compositionController:setInputOrientation:", v20, v30);
      }
      else
      {
        PLBackendGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v30;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "video orientation from the video properties is invalid: %d", (uint8_t *)&buf, 8u);
        }

      }
      v33 = -[PLPhotoEditRenderer initWithEditSource:renderPriority:]([PLPhotoEditRenderer alloc], "initWithEditSource:renderPriority:", v42, 3);
      -[PLPhotoEditRenderer setCompositionController:](v33, "setCompositionController:", v20);
    }
    else
    {
      PLBackendGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Error encountered determining video properties for video composition: %@", (uint8_t *)&buf, 0xCu);
      }

      v33 = 0;
    }

  }
  return v33;
}

+ (id)compositionWithController:(id)a3 source:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSource:mediaType:", v7, objc_msgSend(v5, "mediaType"));

  v8 = objc_msgSend(v5, "mediaType");
  +[PLCompositionHelper validatedCompositionCopyFor:mediaType:](PLCompositionHelper, "validatedCompositionCopyFor:mediaType:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)newImageDataFromCGImage:(CGImage *)a3 withCompressionQuality:(double)a4 metadataSourceImageURL:(id)a5 preserveRegionsInMetadata:(BOOL)a6
{
  _BOOL8 v6;
  const __CFURL *v9;
  __CFData *v10;
  __CFString *v11;
  CGImageDestination *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFDictionaryRef v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  NSObject *v19;
  uint8_t v21[8];
  uint64_t v22;
  _QWORD v23[2];

  v6 = a6;
  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = (const __CFURL *)a5;
  v10 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = CGImageDestinationCreateWithData(v10, v11, 1uLL, 0);

  if (v12)
  {
    if (v9 && (v13 = CGImageSourceCreateWithURL(v9, 0)) != 0)
    {
      v14 = v13;
      v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      CFRelease(v14);
    }
    else
    {
      v15 = 0;
    }
    v22 = *MEMORY[0x1E0CBC780];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationSetProperties(v12, v17);

    if (!v15)
      v15 = (CFDictionaryRef)MEMORY[0x1E0C9AA70];
    objc_msgSend(getPICompositionExporterClass(), "resetImageProperties:preserveRegions:", v15, v6);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(v12, a3, v18);
    if (!CGImageDestinationFinalize(v12))
    {
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Couldn't create image data", v21, 2u);
      }

      v10 = 0;
    }
    CFRelease(v12);

  }
  return v10;
}

+ (BOOL)currentDeviceShouldAllowLocalLight
{
  if (currentDeviceShouldAllowLocalLight_onceToken != -1)
    dispatch_once(&currentDeviceShouldAllowLocalLight_onceToken, &__block_literal_global_63);
  return currentDeviceShouldAllowLocalLight_supportsLocalLight;
}

+ (void)updateCompositionController:(id)a3 fromPortraitMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getPIPortraitAutoCalculatorClass_softClass;
  v25 = getPIPortraitAutoCalculatorClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!getPIPortraitAutoCalculatorClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getPIPortraitAutoCalculatorClass_block_invoke;
    v21[3] = &unk_1E3677580;
    v21[4] = &v22;
    __getPIPortraitAutoCalculatorClass_block_invoke((uint64_t)v21);
    v7 = (void *)v23[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v9, "portraitInfoDictionaryFromCameraMetadata:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PIDepthAdjustmentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke;
  v19[3] = &unk_1E36675C8;
  v13 = v10;
  v20 = v13;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v12, v19);

  +[PLCompositionHelper adjustmentConstants](PLCompositionHelper, "adjustmentConstants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "PIPortraitAdjustmentKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke_2;
  v17[3] = &unk_1E36675F0;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v5, "modifyAdjustmentWithKey:modificationBlock:", v15, v17);

}

void __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v5 = (_QWORD *)getPIDepthInfoKeySymbolLoc_ptr;
  v26 = getPIDepthInfoKeySymbolLoc_ptr;
  if (!getPIDepthInfoKeySymbolLoc_ptr)
  {
    v6 = PhotoImagingLibrary_27258();
    v5 = dlsym(v6, "PIDepthInfoKey");
    v24[3] = (uint64_t)v5;
    getPIDepthInfoKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v23, 8);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDepthInfo:", v7);

    v8 = *(void **)(a1 + 32);
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v9 = (_QWORD *)getPIDepthApertureKeySymbolLoc_ptr;
    v26 = getPIDepthApertureKeySymbolLoc_ptr;
    if (!getPIDepthApertureKeySymbolLoc_ptr)
    {
      v10 = PhotoImagingLibrary_27258();
      v9 = dlsym(v10, "PIDepthApertureKey");
      v24[3] = (uint64_t)v9;
      getPIDepthApertureKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v23, 8);
    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v3, "setAperture:", v12);

      v13 = *(void **)(a1 + 32);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v14 = (_QWORD *)getPIDepthFocusRectKeySymbolLoc_ptr;
      v26 = getPIDepthFocusRectKeySymbolLoc_ptr;
      if (!getPIDepthFocusRectKeySymbolLoc_ptr)
      {
        v15 = PhotoImagingLibrary_27258();
        v14 = dlsym(v15, "PIDepthFocusRectKey");
        v24[3] = (uint64_t)v14;
        getPIDepthFocusRectKeySymbolLoc_ptr = (uint64_t)v14;
      }
      _Block_object_dispose(&v23, 8);
      if (v14)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", *v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setFocusRect:", v16);

        v17 = *(void **)(a1 + 32);
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v18 = (_QWORD *)getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr;
        v26 = getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr;
        if (!getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr)
        {
          v19 = PhotoImagingLibrary_27258();
          v18 = dlsym(v19, "PIDepthGlassesMatteAllowedKey");
          v24[3] = (uint64_t)v18;
          getPIDepthGlassesMatteAllowedKeySymbolLoc_ptr = (uint64_t)v18;
        }
        _Block_object_dispose(&v23, 8);
        if (v18)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", *v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setGlassesMatteAllowed:", v20);

          return;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIDepthGlassesMatteAllowedKey(void)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PLPhotoEditRenderer.m"), 101, CFSTR("%s"), dlerror());
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIDepthFocusRectKey(void)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PLPhotoEditRenderer.m"), 94, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIDepthApertureKey(void)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PLPhotoEditRenderer.m"), 92, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIDepthInfoKey(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PLPhotoEditRenderer.m"), 90, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

void __72__PLPhotoEditRenderer_updateCompositionController_fromPortraitMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v5 = (_QWORD *)getPIPortraitInfoKeySymbolLoc_ptr;
  v22 = getPIPortraitInfoKeySymbolLoc_ptr;
  if (!getPIPortraitInfoKeySymbolLoc_ptr)
  {
    v6 = PhotoImagingLibrary_27258();
    v5 = dlsym(v6, "PIPortraitInfoKey");
    v20[3] = (uint64_t)v5;
    getPIPortraitInfoKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v19, 8);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPortraitInfo:", v7);

    v8 = *(void **)(a1 + 32);
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v9 = (_QWORD *)getPIPortraitStrengthKeySymbolLoc_ptr;
    v22 = getPIPortraitStrengthKeySymbolLoc_ptr;
    if (!getPIPortraitStrengthKeySymbolLoc_ptr)
    {
      v10 = PhotoImagingLibrary_27258();
      v9 = dlsym(v10, "PIPortraitStrengthKey");
      v20[3] = (uint64_t)v9;
      getPIPortraitStrengthKeySymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v19, 8);
    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v3, "setStrength:", v12);

      v13 = *(void **)(a1 + 32);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v14 = (_QWORD *)getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr;
      v22 = getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr;
      if (!getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr)
      {
        v15 = PhotoImagingLibrary_27258();
        v14 = dlsym(v15, "PIPortraitSpillMatteAllowedKey");
        v20[3] = (uint64_t)v14;
        getPIPortraitSpillMatteAllowedKeySymbolLoc_ptr = (uint64_t)v14;
      }
      _Block_object_dispose(&v19, 8);
      if (v14)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", *v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSpillMatteAllowed:", v16);

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIPortraitSpillMatteAllowedKey(void)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PLPhotoEditRenderer.m"), 103, CFSTR("%s"), dlerror());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIPortraitStrengthKey(void)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PLPhotoEditRenderer.m"), 98, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getPIPortraitInfoKey(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PLPhotoEditRenderer.m"), 96, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

void __57__PLPhotoEditRenderer_currentDeviceShouldAllowLocalLight__block_invoke()
{
  void (*v0)(void);
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (void (*)(void))getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  v8 = getMTLCreateSystemDefaultDeviceSymbolLoc_ptr;
  if (!getMTLCreateSystemDefaultDeviceSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke;
    v4[3] = &unk_1E3677580;
    v4[4] = &v5;
    __getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke(v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v0();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    currentDeviceShouldAllowLocalLight_supportsLocalLight = objc_msgSend(v1, "supportsFeatureSet:", 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id SOFT_LINKED_MTLCreateSystemDefaultDevice(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PLPhotoEditRenderer.m"), 32, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void __62__PLPhotoEditRenderer_configureNeutrinoCacheDirectoryIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("com.apple.Photos"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Neutrino"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v4 = (void *)getNUGlobalSettingsClass_softClass;
  v10 = getNUGlobalSettingsClass_softClass;
  if (!getNUGlobalSettingsClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getNUGlobalSettingsClass_block_invoke;
    v6[3] = &unk_1E3677580;
    v6[4] = &v7;
    __getNUGlobalSettingsClass_block_invoke((uint64_t)v6);
    v4 = (void *)v8[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v7, 8);
  objc_msgSend(v5, "setCacheNodeDirectoryURL:", v3);

}

@end
