@implementation PXFileRadarWithConfiguration

void __PXFileRadarWithConfiguration_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  NSLog(CFSTR("Filing radar succeeded %i with error: %@"), a2, v6);
  objc_msgSend(*(id *)(a1 + 32), "stopShowing");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __PXFileRadarWithConfiguration_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  _QWORD v26[4];
  id v27;

  v3 = a2;
  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "component");
    if (v4 > 0x28)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
    }
    else
    {
      v5 = off_1E511D0A0[v4];
      v6 = off_1E511D1E8[v4];
      v7 = off_1E511D330[v4];
    }
    v25 = v5;
    v24 = v6;
    v23 = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(*(id *)(a1 + 32), "wantsPhotosDiagnostics"))
      objc_msgSend(v8, "addObject:", CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics"));
    v22 = v8;
    objc_msgSend(*(id *)(a1 + 32), "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "description");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E5149688;
    if (v9)
      v12 = (const __CFString *)v9;
    else
      v12 = &stru_1E5149688;
    v20 = v12;
    v13 = objc_msgSend(*(id *)(a1 + 32), "classification") - 1;
    if (v13 <= 9)
      v11 = off_1E511D478[v13];
    objc_msgSend(*(id *)(a1 + 32), "keywordIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "screenshots");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 32), "wantsSystemDiagnostics");
    v18 = objc_msgSend(*(id *)(a1 + 32), "attachmentsIncludeAnyUserAsset");
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __PXFileRadarWithConfiguration_block_invoke_4;
    v26[3] = &unk_1E513FE10;
    v27 = *(id *)(a1 + 40);
    BYTE1(v19) = v18;
    LOBYTE(v19) = v17;
    +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v21, v20, v11, v25, v24, v23, v15, v16, v3, v19, v22, v26);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __PXFileRadarWithConfiguration_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PXFileRadarWithConfiguration_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDelay:", 0.0);
  objc_msgSend(v2, "setIsInternalUIAllowed:", 1);
  objc_msgSend(v2, "setLabel:", CFSTR("Filing Radar…"));

}

@end
