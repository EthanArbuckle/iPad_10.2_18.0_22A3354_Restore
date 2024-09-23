@implementation PXPhotoLibraryProcessingProgressRowCell

void __66___PXPhotoLibraryProcessingProgressRowCell_updateDisplayedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleBriefDescriptionResultsWithTitle:image:", v6, v5);

}

@end
