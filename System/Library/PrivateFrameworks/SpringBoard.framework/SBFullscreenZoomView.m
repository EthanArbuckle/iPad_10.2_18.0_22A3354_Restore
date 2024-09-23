@implementation SBFullscreenZoomView

- (void).cxx_destruct
{
  objc_storeStrong(&self->_surface, 0);
}

- (id)initWithContainingBounds:(double)a3 contentFrame:(double)a4 statusBarFrame:(double)a5 snapshot:(double)a6 snapshotOrientation:(double)a7 interfaceOrientation:(double)a8 doubleHeightStatusBar:(double)a9 allowStatusBarToOverlap:(uint64_t)a10 useLargerCornerRadii:(void *)a11 preventSplit:(uint64_t)a12 needsZoomFilter:(uint64_t)a13 asyncDecodeImage:(uint64_t)a14 forJail:(uint64_t)a15 hasOrientationMismatchForClassicApp:(uint64_t)a16
{
  id v37;
  id *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  id v44;
  NSObject *v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56;

  v37 = a11;
  v38 = (id *)objc_msgSend(a1, "_initWithFrame:", a2, a3, a4, a5);
  v39 = v38;
  if (v38)
  {
    objc_msgSend(v38, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    SBSetShouldRasterizeLayer(v40, 0);

    objc_msgSend(v37, "imageForInterfaceOrientation:generationOptions:", a12, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v41);
      if (objc_msgSend((id)SBApp, "homeScreenRotationStyleWantsUIKitRotation"))
        v43 = a22 == 0;
      else
        v43 = 1;
      if (!v43)
      {
        v44 = objc_retainAutorelease(v41);
        if (objc_msgSend(v44, "CGImage"))
        {
          dispatch_get_global_queue(-32768, 0);
          v45 = objc_claimAutoreleasedReturnValue();
          v51 = MEMORY[0x1E0C809B0];
          v52 = 3221225472;
          v53 = __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke;
          v54 = &unk_1E8E9E820;
          v55 = v44;
          v56 = v42;
          dispatch_async(v45, &v51);

        }
      }
      objc_msgSend(v39[52], "setFrame:", a6, a7, a8, a9, v51, v52, v53, v54);
      if (a24)
      {
        objc_msgSend(v39[52], "center");
        objc_msgSend(v39[52], "setCenter:", v47, v46);
      }
      objc_msgSend(v39[52], "bounds");
      objc_msgSend(v42, "setFrame:");
      objc_msgSend(v42, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAllowsDisplayCompositing:", 0);

      objc_msgSend(v39[52], "addSubview:", v42);
      if (SBFEffectiveHomeButtonType() == 2 && a23)
        objc_msgSend(v39[52], "sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpaceForInterfaceOrientation:allowStatusBarToOverlap:useDeviceCornerRadius:", a13, a15, a16);

      v49 = objc_msgSend(v41, "sbs_hasAlpha");
      if ((a23 & 1) == 0 && (objc_msgSend(v37, "isImageOpaque") & v49) != 1)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(0, "sbs_hasAlpha");
    }
    objc_msgSend(v39, "_addBlackBackground");
LABEL_19:

  }
  return v39;
}

- (id)_initWithFrame:(CGRect)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFullscreenZoomView;
  v3 = -[SBZoomView _initWithFrame:](&v7, sel__initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEdgeAntialiasingMask:", 0);
    objc_msgSend(v5, "setName:", CFSTR("zoomView"));
    SBSetShouldRasterizeLayer(v5, 1);

  }
  return v4;
}

- (void)_addBlackBackground
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFullscreenZoomView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[SBFullscreenZoomView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  SBSetShouldRasterizeLayer(v4, 1);
  objc_msgSend(v4, "setAllowsGroupOpacity:", 1);

}

- (id)_initWithView:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  id *v7;
  id *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "bounds");
  v7 = -[SBFullscreenZoomView _initWithFrame:](self, "_initWithFrame:");
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSetShouldRasterizeLayer(v9, 0);

    objc_msgSend(v8[52], "addSubview:", v6);
  }

  return v8;
}

void __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CGSize v11;

  objc_msgSend(*(id *)(a1 + 32), "size");
  UIGraphicsBeginImageContextWithOptions(v11, 1, 0.0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "size");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke_2;
  v8[3] = &unk_1E8E9E820;
  v9 = *(id *)(a1 + 40);
  v10 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __284__SBFullscreenZoomView_initWithContainingBounds_contentFrame_statusBarFrame_snapshot_snapshotOrientation_interfaceOrientation_doubleHeightStatusBar_allowStatusBarToOverlap_useLargerCornerRadii_preventSplit_needsZoomFilter_asyncDecodeImage_forJail_hasOrientationMismatchForClassicApp___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

- (SBFullscreenZoomView)initWithView:(id)a3 containingSceneSnapshot:(id)a4 forDisplayConfiguration:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  SBFullscreenZoomView *v14;
  uint64_t v15;
  id surface;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0D01940];
  v11 = a5;
  v12 = [v10 alloc];
  objc_msgSend(v11, "bounds");
  v13 = (void *)objc_msgSend(v12, "initWithFrame:");
  v14 = -[SBFullscreenZoomView _initWithView:displayConfiguration:](self, "_initWithView:displayConfiguration:", v13, v11);

  if (v14)
  {
    objc_msgSend(v9, "IOSurface");
    v15 = objc_claimAutoreleasedReturnValue();
    surface = v14->_surface;
    v14->_surface = (id)v15;

    objc_msgSend(v13, "addContentView:", v8);
    objc_msgSend(v9, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentOrientation:", objc_msgSend(v18, "interfaceOrientation"));

  }
  return v14;
}

- (id)surface
{
  return self->_surface;
}

@end
