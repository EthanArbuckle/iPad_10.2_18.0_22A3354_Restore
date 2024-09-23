@implementation SBHLibraryPodCloseSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SBHLibraryPodCloseSettings;
  -[SBHLibraryPodZoomSettings setDefaultValues](&v24, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultCentralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySettings:", v4);

  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomDelay");
  v6 = v5 * 0.5;
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelay:", v6);

  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 0);
  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultCrossfadeSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySettings:", v9);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDuration:", 0.2);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelay:", 0.1);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurve:", 0x10000);

  -[SBHLibraryPodZoomSettings innerFolderEdgeZoomSettings](self, "innerFolderEdgeZoomSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDefaultValues");

  -[SBHLibraryPodZoomSettings innerFolderEdgeZoomSettings](self, "innerFolderEdgeZoomSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySettings:", v15);

  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomDelay");
  v17 = v16;
  -[SBHLibraryPodZoomSettings innerFolderEdgeZoomSettings](self, "innerFolderEdgeZoomSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelay:", v17);

  -[SBHLibraryPodZoomSettings innerFolderCenterZoomSettings](self, "innerFolderCenterZoomSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDefaultValues");

  -[SBHLibraryPodZoomSettings innerFolderCenterZoomSettings](self, "innerFolderCenterZoomSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomAnimationSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applySettings:", v21);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDuration:", 0.2);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCurve:", 0x20000);

}

@end
