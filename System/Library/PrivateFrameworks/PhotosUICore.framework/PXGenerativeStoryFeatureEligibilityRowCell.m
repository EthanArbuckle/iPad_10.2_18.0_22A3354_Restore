@implementation PXGenerativeStoryFeatureEligibilityRowCell

void __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "processingStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke_2;
  v9[3] = &unk_1E511A7C8;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v8 = v5;
  v10 = v8;
  +[PXGenerativeStoryFeatureEligibilityDataSource renderImageWithFeatureAvailability:completionHandler:](PXGenerativeStoryFeatureEligibilityDataSource, "renderImageWithFeatureAvailability:completionHandler:", v7, v9);

  objc_destroyWeak(&v11);
}

void __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "featureEligibilityTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleResultsWithTitle:image:", v5, v4);

}

@end
