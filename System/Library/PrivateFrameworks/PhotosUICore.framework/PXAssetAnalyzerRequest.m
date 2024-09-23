@implementation PXAssetAnalyzerRequest

void __48___PXAssetAnalyzerRequest_runWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Effects request failed: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleFinishWithSuccess:", v3 == 0);

}

@end
