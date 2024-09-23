@implementation PBUIBackdropCompositor

- (PBUIBackdropCompositor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBUIBackdropCompositor;
  return -[PBUIBackdropCompositor init](&v3, sel_init);
}

- (id)applyEffect:(id)a3 toImage:(id)a4
{
  _OWORD *v5;
  id v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  _QWORD v12[4];
  _OWORD *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = a3;
  objc_msgSend(a4, "pbui_CGImageBackedImage");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (void *)objc_msgSend(v6, "CGImage");
  if (v5)
  {
    v8 = v5[3];
    v15 = v5[2];
    v16 = v8;
    v9 = v5[5];
    v17 = v5[4];
    v18 = v9;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
  }
  PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)&v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__PBUIBackdropCompositor_applyEffect_toImage___block_invoke;
    v12[3] = &unk_1E6B95A18;
    v13 = v5;
    v14 = v10;
    objc_msgSend(v6, "pbui_imageByManipulatingInDeviceColorSpaceWithBlock:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __46__PBUIBackdropCompositor_applyEffect_toImage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v12[4];

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && *(_BYTE *)(v5 + 8))
  {
    v6 = *(_OWORD *)(v5 + 48);
    v12[0] = *(_OWORD *)(v5 + 32);
    v12[1] = v6;
    v7 = *(_OWORD *)(v5 + 80);
    v12[2] = *(_OWORD *)(v5 + 64);
    v12[3] = v7;
    PBUIBackdropInputSettingsForWallpaperBackdropParameters((uint64_t)v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v8, 0, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_applyBackdropViewSettings:includeTints:includeBlur:", *(_QWORD *)(a1 + 40), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", *(_QWORD *)(a1 + 40), 0, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
