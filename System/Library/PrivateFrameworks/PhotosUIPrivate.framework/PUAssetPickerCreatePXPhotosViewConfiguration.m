@implementation PUAssetPickerCreatePXPhotosViewConfiguration

uint64_t __PUAssetPickerCreatePXPhotosViewConfiguration_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "searchQueryResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchQueryMatchInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ocrAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v9, "containsObject:", v10);
  if ((_DWORD)v5)
    return a3 | 0x1000000000;
  else
    return a3;
}

@end
