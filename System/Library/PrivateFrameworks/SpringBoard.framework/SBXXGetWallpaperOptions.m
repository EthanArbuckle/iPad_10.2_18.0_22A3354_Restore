@implementation SBXXGetWallpaperOptions

void ___SBXXGetWallpaperOptions_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _DWORD *v11;
  double v12;
  double v13;
  _DWORD *v14;
  double v15;
  uint64_t v16;
  id v17;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wallpaperConfigurationManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "wallpaperConfigurationForVariant:includingValuesForTypes:", *(unsigned __int8 *)(a1 + 120), 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperKitData");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v4, "parallaxFactor");
  *(float *)&v8 = v8;
  **(_DWORD **)(a1 + 40) = LODWORD(v8);
  objc_msgSend(v4, "zoomScale");
  *(float *)&v9 = v9;
  **(_DWORD **)(a1 + 48) = LODWORD(v9);
  **(_BYTE **)(a1 + 56) = objc_msgSend(v4, "supportsCropping");
  objc_msgSend(v4, "cropRect");
  *(float *)&v10 = v10;
  v11 = *(_DWORD **)(a1 + 72);
  **(_DWORD **)(a1 + 64) = LODWORD(v10);
  *(float *)&v10 = v12;
  *v11 = LODWORD(v10);
  *(float *)&v10 = v13;
  v14 = *(_DWORD **)(a1 + 88);
  **(_DWORD **)(a1 + 80) = LODWORD(v10);
  *(float *)&v10 = v15;
  *v14 = LODWORD(v10);
  **(_BYTE **)(a1 + 96) = objc_msgSend(v4, "isPortrait");
  **(_BYTE **)(a1 + 104) = objc_msgSend(v4, "hasVideo");
  objc_msgSend(v4, "stillTimeInVideo");
  **(_QWORD **)(a1 + 112) = v16;

}

@end
