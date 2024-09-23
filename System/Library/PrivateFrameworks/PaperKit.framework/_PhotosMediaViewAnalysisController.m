@implementation _PhotosMediaViewAnalysisController

- (_PhotosMediaViewAnalysisController)initWithAssetView:(id)a3
{
  id v4;
  _PhotosMediaViewAnalysisController *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  VKCImageAnalyzer *v9;
  VKCImageAnalyzer *analyzer;
  uint64_t v11;
  NSHashTable *observers;
  void *v13;
  objc_class *v14;
  VKCImageAnalysisInteraction *v15;
  VKCImageAnalysisInteraction *interaction;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  objc_super v25;
  id location;
  uint64_t v27;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PhotosMediaViewAnalysisController;
  v5 = -[_PhotosMediaViewAnalysisController init](&v25, sel_init);
  if (v5)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v6 = (void *)getVKCImageAnalyzerClass_softClass;
    v34 = getVKCImageAnalyzerClass_softClass;
    v7 = (void *)MEMORY[0x1E0C809B0];
    if (!getVKCImageAnalyzerClass_softClass)
    {
      location = (id)MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __getVKCImageAnalyzerClass_block_invoke;
      v29 = &unk_1EA839030;
      v30 = &v31;
      __getVKCImageAnalyzerClass_block_invoke((uint64_t)&location);
      v6 = (void *)v32[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v31, 8);
    v9 = (VKCImageAnalyzer *)objc_alloc_init(v8);
    analyzer = v5->_analyzer;
    v5->_analyzer = v9;

    objc_storeWeak((id *)&v5->_assetView, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v11;

    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v13 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    v34 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      location = v7;
      v27 = 3221225472;
      v28 = __getVKCImageAnalysisInteractionClass_block_invoke;
      v29 = &unk_1EA839030;
      v30 = &v31;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)&location);
      v13 = (void *)v32[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v31, 8);
    v15 = (VKCImageAnalysisInteraction *)objc_alloc_init(v14);
    interaction = v5->_interaction;
    v5->_interaction = v15;

    -[VKCImageAnalysisInteraction setDelegate:](v5->_interaction, "setDelegate:", v5);
    -[VKCImageAnalysisInteraction setWantsAutomaticContentsRectCalculation:](v5->_interaction, "setWantsAutomaticContentsRectCalculation:", 0);
    -[VKCImageAnalysisInteraction setActionInfoViewHidden:](v5->_interaction, "setActionInfoViewHidden:", 0);
    -[VKCImageAnalysisInteraction setAutomaticallyShowVisualSearchResults:](v5->_interaction, "setAutomaticallyShowVisualSearchResults:", 1);
    -[VKCImageAnalysisInteraction setActiveInteractionTypes:](v5->_interaction, "setActiveInteractionTypes:", 9);
    objc_initWeak(&location, v5);
    objc_msgSend(v4, "mediaProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    v21 = 3221225472;
    v22 = __56___PhotosMediaViewAnalysisController_initWithAssetView___block_invoke;
    v23 = &unk_1EA839378;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v17, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v18, 0, 0, &v20, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

    objc_msgSend(v4, "addInteraction:", v5->_interaction, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3
{
  void *v4;

  -[_PhotosMediaViewAnalysisController analysis](self, "analysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "hasResultsForAnalysisTypes:", a3);

  return a3;
}

- (BOOL)actionInfoViewHidden
{
  return -[VKCImageAnalysisInteraction actionInfoViewHidden](self->_interaction, "actionInfoViewHidden");
}

- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[VKCImageAnalysisInteraction setActionInfoViewHidden:animated:](self->_interaction, "setActionInfoViewHidden:animated:", a3, a4);
}

- (void)setAnalysisInteractionHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[VKCImageAnalysisInteraction setActionInfoViewHidden:animated:](self->_interaction, "setActionInfoViewHidden:animated:", a3, a4);
}

- (BOOL)highlightSelectableItemsEnabled
{
  return -[VKCImageAnalysisInteraction highlightSelectableItems](self->_interaction, "highlightSelectableItems");
}

- (void)setHighlightSelectableItemsEnabled:(BOOL)a3
{
  -[VKCImageAnalysisInteraction setHighlightSelectableItems:](self->_interaction, "setHighlightSelectableItems:", a3);
}

- (NSString)infoButtonGlyphName
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisInteraction visualSearchResultItems](self->_interaction, "visualSearchResultItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoButtonGlyphName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)filledInfoButtonGlyphName
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisInteraction visualSearchResultItems](self->_interaction, "visualSearchResultItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filledInfoButtonGlyphName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)analysisInteractionHidden
{
  void *v2;
  BOOL v3;

  -[VKCImageAnalysisInteraction view](self->_interaction, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (unint64_t)activeInteractionTypes
{
  return -[VKCImageAnalysisInteraction activeInteractionTypes](self->_interaction, "activeInteractionTypes");
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  uint64_t v5;
  _QWORD v6[5];

  v5 = -[VKCImageAnalysisInteraction activeInteractionTypes](self->_interaction, "activeInteractionTypes");
  -[VKCImageAnalysisInteraction setActiveInteractionTypes:](self->_interaction, "setActiveInteractionTypes:", a3);
  if (v5 != a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64___PhotosMediaViewAnalysisController_setActiveInteractionTypes___block_invoke;
    v6[3] = &unk_1EA8393A0;
    v6[4] = self;
    -[_PhotosMediaViewAnalysisController _enumerateObservers:](self, "_enumerateObservers:", v6);
  }
}

- (void)toggleInteractionTypes:(unint64_t)a3
{
  -[_PhotosMediaViewAnalysisController setActiveInteractionTypes:](self, "setActiveInteractionTypes:", -[_PhotosMediaViewAnalysisController activeInteractionTypes](self, "activeInteractionTypes") ^ a3);
}

- (void)setAutomaticallyInvokedInteraction:(unint64_t)a3
{
  if (self->_automaticallyInvokedInteraction != a3)
  {
    self->_automaticallyInvokedInteraction = a3;
    -[_PhotosMediaViewAnalysisController _performAutomaticallyInvokedInteractionIfNeeded](self, "_performAutomaticallyInvokedInteractionIfNeeded");
  }
}

- (void)addAnalysisObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeAnalysisObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;

  -[_PhotosMediaViewAnalysisController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewControllerForContext:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __116___PhotosMediaViewAnalysisController_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke;
  v4[3] = &unk_1EA8393A0;
  v4[4] = self;
  -[_PhotosMediaViewAnalysisController _enumerateObservers:](self, "_enumerateObservers:", v4);
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95___PhotosMediaViewAnalysisController_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke;
  v3[3] = &unk_1EA8393A0;
  v3[4] = self;
  -[_PhotosMediaViewAnalysisController _enumerateObservers:](self, "_enumerateObservers:", v3);
}

- (id)contentImageForImageAnalysisInteraction:(id)a3
{
  return self->_image;
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  void (**v6)(_QWORD);
  _QWORD v7[5];

  v6 = (void (**)(_QWORD))a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97___PhotosMediaViewAnalysisController_imageAnalysisInteraction_prepareForCalloutAction_competion___block_invoke;
  v7[3] = &unk_1EA8393A0;
  v7[4] = self;
  -[_PhotosMediaViewAnalysisController _enumerateObservers:](self, "_enumerateObservers:", v7);
  if (v6)
    v6[2](v6);

}

- (void)_enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_handleImageResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5
{
  id v8;
  UIImage *v9;
  UIImage *image;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  VKCImageAnalyzer *analyzer;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a5;
  objc_initWeak(&location, self);
  v9 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:imageOrientation:", a3, a4);
  image = self->_image;
  self->_image = v9;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v11 = (void *)getVKCImageAnalyzerRequestClass_softClass;
  v23 = getVKCImageAnalyzerRequestClass_softClass;
  v12 = MEMORY[0x1E0C809B0];
  if (!getVKCImageAnalyzerRequestClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getVKCImageAnalyzerRequestClass_block_invoke;
    v19[3] = &unk_1EA839030;
    v19[4] = &v20;
    __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)v19);
    v11 = (void *)v21[3];
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v20, 8);
  v14 = (void *)objc_msgSend([v13 alloc], "initWithImage:requestType:", self->_image, 53);
  objc_msgSend(v14, "set_wantsFormFieldDetection:", 1);
  analyzer = self->_analyzer;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_2;
  v16[3] = &unk_1EA839430;
  objc_copyWeak(&v17, &location);
  -[VKCImageAnalyzer processRequest:progressHandler:completionHandler:](analyzer, "processRequest:progressHandler:completionHandler:", v14, &__block_literal_global_2, v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

- (void)setAnalysis:(id)a3
{
  VKCImageAnalysis *v5;
  _QWORD v6[5];

  v5 = (VKCImageAnalysis *)a3;
  if (self->_analysis != v5)
  {
    objc_storeStrong((id *)&self->_analysis, a3);
    -[VKCImageAnalysisInteraction setAnalysis:](self->_interaction, "setAnalysis:", v5);
    -[VKCImageAnalysisInteraction set_photosImageForRemoveBackground:](self->_interaction, "set_photosImageForRemoveBackground:", self->_image);
    -[VKCImageAnalysisInteraction beginImageSubjectAnalysisIfNecessary](self->_interaction, "beginImageSubjectAnalysisIfNecessary");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50___PhotosMediaViewAnalysisController_setAnalysis___block_invoke;
    v6[3] = &unk_1EA8393A0;
    v6[4] = self;
    -[_PhotosMediaViewAnalysisController _enumerateObservers:](self, "_enumerateObservers:", v6);
    if (v5)
      -[_PhotosMediaViewAnalysisController _performAutomaticallyInvokedInteractionIfNeeded](self, "_performAutomaticallyInvokedInteractionIfNeeded");
  }

}

- (void)_handleAnalysisResult:(id)a3 error:(id)a4
{
  NSError *v6;
  NSError *error;

  v6 = (NSError *)a4;
  -[_PhotosMediaViewAnalysisController setAnalysis:](self, "setAnalysis:", a3);
  error = self->_error;
  self->_error = v6;

}

- (void)_performAutomaticallyInvokedInteractionIfNeeded
{
  unint64_t v3;

  v3 = -[_PhotosMediaViewAnalysisController automaticallyInvokedInteraction](self, "automaticallyInvokedInteraction");
  switch(v3)
  {
    case 1uLL:
      -[VKCImageAnalysisInteraction setHighlightSelectableItems:](self->_interaction, "setHighlightSelectableItems:", 1);
      break;
    case 4uLL:
      -[_PhotosMediaViewAnalysisController setActiveInteractionTypes:](self, "setActiveInteractionTypes:", 4);
      break;
    case 8uLL:
      -[VKCImageAnalysisInteraction setSubjectHighlightActive:](self->_interaction, "setSubjectHighlightActive:", 1);
      break;
  }
}

- (PPKPhotosMediaViewImageAnalysisInteractionContextDelegate)delegate
{
  return (PPKPhotosMediaViewImageAnalysisInteractionContextDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (unint64_t)automaticallyInvokedInteraction
{
  return self->_automaticallyInvokedInteraction;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_destroyWeak((id *)&self->_assetView);
}

@end
