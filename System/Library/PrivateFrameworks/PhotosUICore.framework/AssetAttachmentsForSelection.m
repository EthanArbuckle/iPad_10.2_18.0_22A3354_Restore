@implementation AssetAttachmentsForSelection

void ___AssetAttachmentsForSelection_block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _OWORD v14[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v14[0] = *a2;
  v14[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[dataSource assetAtItemIndexPath:indexPath]"), v11);
  }

LABEL_3:
  if (*(_BYTE *)(a1 + 56))
    +[PXFeedbackTapToRadarUtilities thumbnailFileURLForAsset:](PXFeedbackTapToRadarUtilities, "thumbnailFileURLForAsset:", v5);
  else
    +[PXFeedbackTapToRadarUtilities imageFileURLForAsset:](PXFeedbackTapToRadarUtilities, "imageFileURLForAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

@end
