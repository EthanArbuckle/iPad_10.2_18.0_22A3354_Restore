@implementation UIView(PXVideoOverlayButton)

+ (void)px_preloadResourcesForVideoOverlayButtonWithStyle:()PXVideoOverlayButton
{
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = a1;
  objc_msgSend(v5, "scheduleMainQueueTask:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __82__UIView_PXVideoOverlayButton__px_preloadResourcesForVideoOverlayButtonWithStyle___block_invoke_2;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  v7[4] = a1;
  v7[5] = a3;
  objc_msgSend(v5, "scheduleMainQueueTask:", v7);

}

+ (id)px_videoOverlayButtonWithConfiguration:()PXVideoOverlayButton
{
  id v3;
  uint64_t v4;
  BOOL v5;
  __objc2_class **v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "style");
  v5 = (unint64_t)(v4 - 2) < 2 || v4 == 5;
  if (!v5
    && (v4
     || (+[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance"),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_msgSend(v7, "deviceGraphicsQuality"),
         v7,
         v8)))
  {
    v6 = off_1E50B2FC8;
  }
  else
  {
    v6 = off_1E50B26B8;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v6), "initWithConfiguration:", v3);

  return v9;
}

+ (id)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton allowBackdropStatisticsSupression:
{
  void *v7;
  void *v8;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStyle:", a3);
  objc_msgSend(v7, "setAllowBackdropStatisticsSupression:", a4);
  objc_msgSend(a1, "px_videoOverlayButtonWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)px_videoOverlayButtonWithStyle:()PXVideoOverlayButton
{
  return objc_msgSend(a1, "px_videoOverlayButtonWithStyle:allowBackdropStatisticsSupression:", a3, 1);
}

+ (double)px_videoOverlayButtonSize
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;

  return v2;
}

+ (double)px_videoOverlayButtonSizeWithConfiguration:()PXVideoOverlayButton
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (px_videoOverlayButtonSizeWithConfiguration__onceToken != -1)
    dispatch_once(&px_videoOverlayButtonSizeWithConfiguration__onceToken, &__block_literal_global_48309);
  if (objc_msgSend(v4, "style") == 5)
  {
    v5 = (void *)px_videoOverlayButtonSizeWithConfiguration__cachedSizes;
    objc_msgSend(v4, "localizedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "CGSizeValue");
      v9 = v8;
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(v4, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v12);

      objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      PXSizeCeilingToPixel();
      v14 = v13;
      v16 = v15;
      PXEdgeInsetsMake();
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend(a1, "px_videoOverlayButtonSize");
      v9 = v26 + v24 + v14 + v20;
      if (v25 >= v22 + v16 + v18)
        v27 = v25;
      else
        v27 = v22 + v16 + v18;
      v28 = (void *)px_videoOverlayButtonSizeWithConfiguration__cachedSizes;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v9, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v29, v30);

    }
  }
  else
  {
    objc_msgSend(a1, "px_videoOverlayButtonSize");
    v9 = v10;
  }

  return v9;
}

@end
