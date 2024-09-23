@implementation CNContact(PXFaceTileImageCombinerItem)

- (void)px_requestImageWithTargetSize:()PXFaceTileImageCombinerItem displayScale:isRTL:resultHandler:
{
  id v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v13 = a4;
  if (a5 == *MEMORY[0x1E0C9D820] && a6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+PXFaceTileImageCombinerItem.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!CGSizeEqualToSize(targetSize, CGSizeZero)"));

  }
  if (a7 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+PXFaceTileImageCombinerItem.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v13)
      goto LABEL_8;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNContact+PXFaceTileImageCombinerItem.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

    goto LABEL_8;
  }
  if (!v13)
    goto LABEL_10;
LABEL_8:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__CNContact_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v19[3] = &unk_1E5147A90;
  v20 = v13;
  v15 = v13;
  +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", a1, a3, 0, v19, a5, a6, a7);

}

@end
