@implementation UICoreUICatalogColorWrapper

void __63___UICoreUICatalogColorWrapper__uikit_valueForTraitCollection___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a2 && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v9 = v3;
      +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "colorNamed:withTraitCollection:", *(_QWORD *)(a1[4] + 32), a1[5]);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1[6] + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
      v3 = v9;
    }

  }
}

@end
