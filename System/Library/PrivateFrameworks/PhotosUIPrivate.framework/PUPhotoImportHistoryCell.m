@implementation PUPhotoImportHistoryCell

void __38___PUPhotoImportHistoryCell_setAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained
    && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
     || v6 == (int)objc_msgSend(WeakRetained, "currentImageRequestToken")))
  {
    objc_msgSend(v8, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

  }
}

@end
