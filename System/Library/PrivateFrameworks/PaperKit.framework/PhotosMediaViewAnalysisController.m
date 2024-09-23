@implementation PhotosMediaViewAnalysisController

void __56___PhotosMediaViewAnalysisController_initWithAssetView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleImageResult:orientation:info:", a2, a3, v7);

}

uint64_t __64___PhotosMediaViewAnalysisController_setActiveInteractionTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextActiveInteractionTypesDidChange:", *(_QWORD *)(a1 + 32));
}

uint64_t __116___PhotosMediaViewAnalysisController_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextWillPresentVisualSearchController:", *(_QWORD *)(a1 + 32));
}

uint64_t __95___PhotosMediaViewAnalysisController_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextDidDismissVisualSearchController:", *(_QWORD *)(a1 + 32));
}

uint64_t __97___PhotosMediaViewAnalysisController_imageAnalysisInteraction_prepareForCalloutAction_competion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextWillPresentVisualSearchController:", *(_QWORD *)(a1 + 32));
}

void __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_3;
  block[3] = &unk_1EA839408;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleAnalysisResult:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __50___PhotosMediaViewAnalysisController_setAnalysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "contextAnalysisDidChange:", v3);
  objc_msgSend(v4, "contextAvailableResultsDidChange:", *(_QWORD *)(a1 + 32));

}

@end
