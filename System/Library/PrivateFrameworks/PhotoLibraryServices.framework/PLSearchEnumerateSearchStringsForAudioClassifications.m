@implementation PLSearchEnumerateSearchStringsForAudioClassifications

void __PLSearchEnumerateSearchStringsForAudioClassifications_block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "classificationType");
  v4 = v10;
  if (v3 == 3)
  {
    v5 = objc_msgSend(v10, "sceneIdentifier") - 1;
    if (v5 > 5)
      v6 = 0;
    else
      v6 = off_1E366CE90[v5];
    v7 = -[__CFString length](v6, "length");
    v4 = v10;
    if (v7)
    {
      PLServicesLocalizedFrameworkString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLSearchLocalizedSynonymsForKey(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      v4 = v10;
    }
  }

}

@end
