@implementation PHAsset

void __36__PHAsset_PhotosUICore___ocrStrings__block_invoke()
{
  uint8_t v0[16];

  _ocrStrings_observationClass = (uint64_t)NSClassFromString(CFSTR("VNDocumentObservation"));
  if (!_ocrStrings_observationClass && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v0 = 0;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VNDocumentObservation not available in current process", v0, 2u);
  }
}

void __47__PHAsset_PhotosUICore__px_curationDebugValues__block_invoke_2()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)px_curationDebugValues_dateFormatter;
  px_curationDebugValues_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)px_curationDebugValues_dateFormatter, "setDateFormat:", CFSTR("yyyy.MM.dd HH:mm:ss.SS"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)px_curationDebugValues_dateFormatter, "setTimeZone:", v2);

}

void __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3498];
  v4 = a2;
  v10 = (id)objc_msgSend([v3 alloc], "initWithString:attributes:", CFSTR("––––––––––––––––––––––––––––\n"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v10);
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@\n"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v8, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v9);
}

void __52__PHAsset_PhotosUICore__px_debugStringForValueList___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  __CFString *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3498];
  v4 = a2;
  v5 = [v3 alloc];
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("??");
  v8 = (id)objc_msgSend(v5, "initWithString:attributes:", v6, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" : "), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v7);

}

void __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __77__PHAsset_PhotosUICore__px_generateResourceFilesForAssets_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __68__PHAsset_PhotosUICore__px_orderedAssetsFromAssets_sortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __62__PHAsset_PhotosUICoreAccessibility___faceNamesStringForAsset__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__PHAsset_PXSharingAdditions__px_isSupportedApp___block_invoke()
{
  void *v0;

  v0 = (void *)px_isSupportedApp__supportedOriginators;
  px_isSupportedApp__supportedOriginators = (uint64_t)&unk_1E53EA9E0;

}

@end
