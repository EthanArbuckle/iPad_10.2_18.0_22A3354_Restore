@implementation PXPhotoKitPeopleSuggestionsMediaProvider

- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  PXPeopleFaceCropFetchOptions *v19;
  void *v20;
  void *v21;
  void *v22;
  PXPeopleFaceCropFetchOptions *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  void *v30;
  _QWORD v31[4];
  id v32;

  height = a4.height;
  width = a4.width;
  v16 = a3;
  v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPeopleSuggestionsMediaProvider.m"), 21, CFSTR("This media provider only works with PXPhotoKitPersonSuggestion."));

  }
  v18 = v16;
  v19 = [PXPeopleFaceCropFetchOptions alloc];
  objc_msgSend(v18, "person");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "keyFaceFetchResult");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v19, "initWithPerson:face:targetSize:displayScale:", v20, v22, width, height, a5);

  objc_msgSend(v18, "keyAssetFetchResult");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFaceCropFetchOptions setAsset:](v23, "setAsset:", v25);

  -[PXPeopleFaceCropFetchOptions setCropFactor:](v23, "setCropFactor:", a6);
  -[PXPeopleFaceCropFetchOptions setCornerStyle:](v23, "setCornerStyle:", a7);
  -[PXPeopleFaceCropFetchOptions setDeliveryMode:](v23, "setDeliveryMode:", 1);
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __137__PXPhotoKitPeopleSuggestionsMediaProvider_requestImageForPersonSuggestion_targetSize_displayScale_cropFactor_cornerStyle_resultHandler___block_invoke;
  v31[3] = &unk_1E5147AB8;
  v32 = v17;
  v27 = v17;
  v28 = objc_msgSend(v26, "requestFaceCropForOptions:resultHandler:", v23, v31);

  return v28;
}

- (void)cancelRequest:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestForRequestID:", v3);

}

uint64_t __137__PXPhotoKitPeopleSuggestionsMediaProvider_requestImageForPersonSuggestion_targetSize_displayScale_cropFactor_cornerStyle_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
