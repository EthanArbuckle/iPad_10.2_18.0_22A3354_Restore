@implementation SBHLibraryPodOpenSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBHLibraryPodOpenSettings;
  -[SBHLibraryPodZoomSettings setDefaultValues](&v22, sel_setDefaultValues);
  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultCentralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySettings:", v4);

  -[SBHIconZoomSettings setLabelAlphaWithZoom:](self, "setLabelAlphaWithZoom:", 0);
  -[SBHScaleZoomSettings setCrossfadeWithZoom:](self, "setCrossfadeWithZoom:", 0);
  -[SBHScaleZoomSettings crossfadeSettings](self, "crossfadeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultCrossfadeSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applySettings:", v6);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", 0.2);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelay:", 0.0);

  -[SBHScaleZoomSettings outerFolderFadeSettings](self, "outerFolderFadeSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurve:", 0x10000);

  -[SBHLibraryPodZoomSettings innerFolderEdgeZoomSettings](self, "innerFolderEdgeZoomSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValues");

  -[SBHLibraryPodZoomSettings innerFolderEdgeZoomSettings](self, "innerFolderEdgeZoomSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applySettings:", v12);

  -[SBHLibraryPodZoomSettings innerFolderCenterZoomSettings](self, "innerFolderCenterZoomSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDefaultValues");

  -[SBHLibraryPodZoomSettings innerFolderCenterZoomSettings](self, "innerFolderCenterZoomSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applySettings:", v15);

  objc_msgSend((id)objc_opt_class(), "_defaultInnerFolderZoomDelay");
  v17 = v16;
  -[SBHLibraryPodZoomSettings innerFolderCenterZoomSettings](self, "innerFolderCenterZoomSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelay:", v17);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDuration:", 0.3);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelay:", 0.1);

  -[SBHFolderZoomSettings innerFolderFadeSettings](self, "innerFolderFadeSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCurve:", 0x10000);

}

@end
