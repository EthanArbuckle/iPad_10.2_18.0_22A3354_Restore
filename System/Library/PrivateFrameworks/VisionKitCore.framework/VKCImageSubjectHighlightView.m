@implementation VKCImageSubjectHighlightView

+ (BOOL)visualLookUpYear3InvocationEnabled
{
  if (visualLookUpYear3InvocationEnabled_onceToken != -1)
    dispatch_once(&visualLookUpYear3InvocationEnabled_onceToken, &__block_literal_global_9);
  return visualLookUpYear3InvocationEnabled_visualLookUpYear3InvocationEnabled;
}

uint64_t __66__VKCImageSubjectHighlightView_visualLookUpYear3InvocationEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  visualLookUpYear3InvocationEnabled_visualLookUpYear3InvocationEnabled = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  CGImageRelease(self->_colorMaskImage);
  if (self->_traitChangeRegistration)
    -[VKCImageSubjectHighlightView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectHighlightView dealloc](&v4, sel_dealloc);
}

- (VKCImageSubjectHighlightView)initWithFrame:(CGRect)a3
{
  VKCImageSubjectHighlightView *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *livePhotoPlayGR;
  uint64_t v6;
  UIPanGestureRecognizer *coyotePanGR;
  uint64_t v8;
  UIDragInteraction *dragInteraction;
  uint64_t v10;
  UITapGestureRecognizer *tapGR;
  void *v12;
  uint64_t v13;
  UITraitChangeRegistration *traitChangeRegistration;
  void *v15;
  CALayer *v16;
  CALayer *colorMaskLayer;
  void *v18;
  CALayer *v19;
  void *v20;
  UISelectionFeedbackGenerator *v21;
  UISelectionFeedbackGenerator *feedbackGenerator;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VKCImageSubjectHighlightView;
  v3 = -[VKCImageSubjectBaseView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v3, sel_livePhotoLongPress_);
    livePhotoPlayGR = v3->_livePhotoPlayGR;
    v3->_livePhotoPlayGR = (UILongPressGestureRecognizer *)v4;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v3->_livePhotoPlayGR, "setMinimumPressDuration:", 0.325);
    -[UILongPressGestureRecognizer setEnabled:](v3->_livePhotoPlayGR, "setEnabled:", 0);
    -[VKCImageSubjectHighlightView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_livePhotoPlayGR);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v3, sel_livePhotoCoyotePan_);
    coyotePanGR = v3->_coyotePanGR;
    v3->_coyotePanGR = (UIPanGestureRecognizer *)v6;

    -[UIPanGestureRecognizer setDelegate:](v3->_coyotePanGR, "setDelegate:", v3);
    -[UIPanGestureRecognizer setEnabled:](v3->_coyotePanGR, "setEnabled:", 0);
    -[UIPanGestureRecognizer setDelaysTouchesBegan:](v3->_coyotePanGR, "setDelaysTouchesBegan:", 0);
    -[UIPanGestureRecognizer setDelaysTouchesEnded:](v3->_coyotePanGR, "setDelaysTouchesEnded:", 0);
    -[VKCImageSubjectHighlightView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_coyotePanGR);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", v3);
    dragInteraction = v3->_dragInteraction;
    v3->_dragInteraction = (UIDragInteraction *)v8;

    -[VKCImageSubjectHighlightView addInteraction:](v3, "addInteraction:", v3->_dragInteraction);
    +[VKCInternalSettings subjectDragLiftDelay](VKCInternalSettings, "subjectDragLiftDelay");
    -[UIDragInteraction _setLiftDelay:](v3->_dragInteraction, "_setLiftDelay:");
    +[VKCInternalSettings subjectDragCancellationDelay](VKCInternalSettings, "subjectDragCancellationDelay");
    -[UIDragInteraction _setCancellationDelay:](v3->_dragInteraction, "_setCancellationDelay:");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_didTap_);
    tapGR = v3->_tapGR;
    v3->_tapGR = (UITapGestureRecognizer *)v10;

    -[UITapGestureRecognizer setEnabled:](v3->_tapGR, "setEnabled:", 0);
    -[VKCImageSubjectHighlightView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGR);
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v12, sel_traitStyleDidChange);
    v13 = objc_claimAutoreleasedReturnValue();
    traitChangeRegistration = v3->_traitChangeRegistration;
    v3->_traitChangeRegistration = (UITraitChangeRegistration *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel_menuControllerWillHide_, *MEMORY[0x1E0CEB998], 0);

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    colorMaskLayer = v3->_colorMaskLayer;
    v3->_colorMaskLayer = v16;

    -[VKCImageSubjectBaseView colorLayer](v3, "colorLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInvertsMask:", 1);

    v19 = v3->_colorMaskLayer;
    -[VKCImageSubjectBaseView colorLayer](v3, "colorLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMask:", v19);

    -[VKCImageSubjectHighlightView setSubjectHighlightState:](v3, "setSubjectHighlightState:", 0);
    -[VKCImageSubjectHighlightView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    v21 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0CEA998]);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = v21;

  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitStyleDidChange
{
  uint64_t v3;
  void *v4;
  id v5;

  -[VKCImageSubjectHighlightView traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "userInterfaceStyle");
  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", v3);

}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectBaseView setHidden:](&v4, sel_setHidden_, a3);
  if (-[VKCImageSubjectHighlightView isHidden](self, "isHidden"))
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
  -[VKCImageSubjectHighlightView beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectHighlightView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[VKCImageSubjectHighlightView beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
}

- (void)setRecognitionResult:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  objc_super v8;

  v4 = a3;
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)VKCImageSubjectHighlightView;
    -[VKCImageSubjectBaseView setRecognitionResult:](&v8, sel_setRecognitionResult_, v4);
    v7 = 0;
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView setIsLivePhoto:](self, "setIsLivePhoto:", objc_msgSend(v6, "isSubjectHighlightShowingLivePhoto:delegateHasImplementation:", self, &v7));

    -[VKCImageSubjectHighlightView setAnalysisDelayTimerActive:](self, "setAnalysisDelayTimerActive:", 0);
    -[VKCImageSubjectHighlightView setCalloutStartTime:](self, "setCalloutStartTime:", 0);
    -[VKCImageSubjectHighlightView setSubjectHighlightState:](self, "setSubjectHighlightState:", 0);
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
    -[VKCImageSubjectHighlightView beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
  }

}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectHighlightView buildMenuWithBuilder:](&v18, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA760], "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (vk_deviceSupportsAddingSystemStickers())
    {
      v8 = (void *)MEMORY[0x1E0CEA490];
      VKBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("VK_SUBJECT_LIFT_ADDSTICKER_MENU_TITLE"), CFSTR("VK_SUBJECT_LIFT_ADDSTICKER_MENU_TITLE"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commandWithTitle:image:action:propertyList:alternates:", v10, 0, sel__addSticker_, 0, MEMORY[0x1E0C9AA60]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "addObject:", v11);
      if (-[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto")
        && vk_isInternalBuild()
        && +[VKCInternalSettings shareHeicsCalloutEnabled](VKCInternalSettings, "shareHeicsCalloutEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CEA490], "commandWithTitle:image:action:propertyList:alternates:", CFSTR("shareHeics(internal)"), 0, sel__shareHeics_, 0, MEMORY[0x1E0C9AA60]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
    }
    v13 = (void *)MEMORY[0x1E0CEA490];
    VKBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("VK_SUBJECT_LIFT_SELECT_ALL_MENU_TITLE"), CFSTR("VK_SUBJECT_LIFT_SELECT_ALL_MENU_TITLE"), CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commandWithTitle:image:action:propertyList:alternates:", v15, 0, sel__selectAllSubjects_, 0, MEMORY[0x1E0C9AA60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v16);
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E94661A8, 0, 0, 1, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSiblingMenu:beforeMenuForIdentifier:", v17, *MEMORY[0x1E0CEB9C8]);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  VKCImageSubjectHighlightView *v5;
  void *v6;
  void *v7;
  void *v11;
  void *v12;

  v5 = self;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (sel_copy_ == a3 || sel__shareHeics_ == a3)
    goto LABEL_12;
  if (sel__share_ == a3 || sel__addSticker_ == a3)
  {
    if (vk_isDeviceLocked())
    {
      LOBYTE(v5) = vk_processHasUnlockEntitlement();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v5) = 1;
    goto LABEL_13;
  }
  if (sel__selectAllSubjects_ == a3)
  {
    LODWORD(v5) = objc_msgSend(v6, "allSubjectsSelected") ^ 1;
  }
  else if (sel__define_ == a3
         && +[VKCImageSubjectHighlightView visualLookUpYear3InvocationEnabled](VKCImageSubjectHighlightView, "visualLookUpYear3InvocationEnabled"))
  {
    -[VKCImageSubjectHighlightView delegate](v5, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView normalizedSubjectPath](v5, "normalizedSubjectPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v11, "subjectHighlightView:containsVSItemForNormalizedPath:", v5, v12);

  }
  else
  {
    LOBYTE(v5) = 0;
  }
LABEL_13:

  return (char)v5;
}

- (void)setSubjectHighlightState:(unint64_t)a3
{
  -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", a3, 1);
}

- (void)setColorMaskImage:(CGImage *)a3
{
  CGImage *v3;
  CGImage *colorMaskImage;
  id v6;

  v3 = a3;
  colorMaskImage = self->_colorMaskImage;
  if (colorMaskImage != a3)
  {
    CGImageRelease(colorMaskImage);
    self->_colorMaskImage = v3;
    CGImageRetain(v3);
    v3 = self->_colorMaskImage;
  }
  -[VKCImageSubjectHighlightView colorMaskLayer](self, "colorMaskLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", v3);

}

- (void)setIsLivePhoto:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  self->_isLivePhoto = a3;
  v5 = -[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled");
  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCancellationTimerEnabled:", v3);

  v7 = v3 & !v5;
  -[VKCImageSubjectHighlightView livePhotoPlayGR](self, "livePhotoPlayGR");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[VKCImageSubjectHighlightView coyotePanGR](self, "coyotePanGR");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL HasArea;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v17, sel_setNormalizedVisibleRect_);
  -[VKCImageSubjectHighlightView beginImageSubjectAnalysisWithDelayIfNecessary](self, "beginImageSubjectAnalysisWithDelayIfNecessary");
  HasArea = VKMRectHasArea(x, y, width, height);
  -[VKCImageSubjectHighlightView calloutStartTime](self, "calloutStartTime");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_5;
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView calloutStartTime](self, "calloutStartTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  if (v14 > 0.8)
  {
LABEL_5:
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
    if (HasArea)
      goto LABEL_4;
LABEL_6:
    v15 = -[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled") ^ 1;
    goto LABEL_7;
  }
  if (!HasArea)
    goto LABEL_6;
LABEL_4:
  v15 = 1;
LABEL_7:
  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnabled:", v15);

}

- (void)updateSubjectInteractionInProgressIfNecessary
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = -[VKCImageSubjectHighlightView subjectHighlightActive](self, "subjectHighlightActive");
  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 | objc_msgSend(v4, "_isActive");

  if (-[VKCImageSubjectHighlightView subjectHighlightState](self, "subjectHighlightState"))
    v6 = 1;
  else
    v6 = v5;
  -[VKCImageSubjectHighlightView setSubjectInteractionInProgress:](self, "setSubjectInteractionInProgress:", v6);
}

- (void)setSubjectInteractionInProgress:(BOOL)a3
{
  id v4;

  if (self->_subjectInteractionInProgress != a3)
  {
    self->_subjectInteractionInProgress = a3;
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subjectHighlightViewSubjectInteractionInProgressDidChange:", self);

  }
}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 HasArea;
  char v14;
  char v15;
  void *v16;
  NSObject *v17;
  double v18;
  double v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  VKCImageSubjectHighlightView *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  -[VKCImageSubjectHighlightView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[VKCImageSubjectBaseView loadMaskRequestStatus](self, "loadMaskRequestStatus");
  v8 = -[VKCImageSubjectHighlightView analysisDelayTimerActive](self, "analysisDelayTimerActive");
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  HasArea = VKMRectHasArea(v9, v10, v11, v12);
  v14 = -[VKCImageSubjectHighlightView isHidden](self, "isHidden");
  if (v5)
    v15 = v4;
  else
    v15 = 1;
  if ((v15 & 1) == 0 && (v14 & 1) == 0 && !v6 && !v7 && !v8 && HasArea && (vk_isSeedBuild() & 1) == 0)
  {
    -[VKCImageSubjectHighlightView setAnalysisDelayTimerActive:](self, "setAnalysisDelayTimerActive:", 1);
    -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      _os_log_impl(&dword_1D2E0D000, v17, OS_LOG_TYPE_DEFAULT, "Beginning subject analyze delay: %@", buf, 0xCu);
    }

    +[VKCInternalSettings subjectAutomaticAnalysisDelay](VKCInternalSettings, "subjectAutomaticAnalysisDelay");
    v19 = v18;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__VKCImageSubjectHighlightView_beginImageSubjectAnalysisWithDelayIfNecessary__block_invoke;
    v21[3] = &unk_1E94635E8;
    v21[4] = self;
    objc_copyWeak(&v23, &location);
    v20 = v16;
    v22 = v20;
    vk_dispatchMainAfterDelay(v21, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

void __77__VKCImageSubjectHighlightView_beginImageSubjectAnalysisWithDelayIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Subject analyze delay complete: %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "analysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);

  if (v5 == v6)
  {
    objc_msgSend(WeakRetained, "setAnalysisDelayTimerActive:", 0);
    if (!objc_msgSend(WeakRetained, "loadMaskRequestStatus"))
      objc_msgSend(WeakRetained, "loadSubjectMaskIfNecessary");
  }
  else
  {
    v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1D2E0D000, v7, OS_LOG_TYPE_DEFAULT, "Subject analysis cancelled because the analysis was changed from: %@, %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)setSubjectContext:(id)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectBaseView setSubjectContext:](&v9, sel_setSubjectContext_);
  +[VKCInternalSettings subjectDragLiftDelay](VKCInternalSettings, "subjectDragLiftDelay");
  v6 = 0.55;
  if (a3)
    v6 = 0.0;
  v7 = v6 + v5;
  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setLiftDelay:", v7);

  -[VKCImageSubjectHighlightView setLivePhotoStartTime:](self, "setLivePhotoStartTime:", 0);
  if (-[VKCImageSubjectHighlightView tapToSelectModeEnabled](self, "tapToSelectModeEnabled"))
  {
    -[VKCImageSubjectHighlightView setTapToSelectModeEnabled:](self, "setTapToSelectModeEnabled:", 0);
    -[VKCImageSubjectHighlightView setTapToSelectModeEnabled:](self, "setTapToSelectModeEnabled:", 1);
  }
}

- (id)stringForHighlightState:(unint64_t)a3
{
  char v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(&stru_1E94661A8, "stringByAppendingString:", CFSTR("container,"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = &stru_1E94661A8;
  if ((a3 & 4) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("image,"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
LABEL_6:
  if ((v3 & 2) != 0)
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("color,"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v8;
    if ((v3 & 8) == 0)
      return v4;
    goto LABEL_8;
  }
  if ((v3 & 8) != 0)
  {
LABEL_8:
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("colorMask,"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  return v4;
}

- (void)setSubjectHighlightState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  if (self->_subjectHighlightState == a3)
    return;
  v4 = a4;
  v5 = a3;
  self->_subjectHighlightState = a3;
  -[VKCImageSubjectHighlightView updateSubjectInteractionInProgressIfNecessary](self, "updateSubjectInteractionInProgressIfNecessary");
  -[VKCImageSubjectBaseView colorLayer](self, "colorLayer");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView colorMaskLayer](self, "colorMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView imageHighlightLayerContainer](self, "imageHighlightLayerContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "opacity");
  v11 = v10;
  objc_msgSend(v8, "opacity");
  v13 = v12;
  objc_msgSend(v9, "opacity");
  v15 = v14;
  if ((v5 & 2) != 0)
    v16 = 1.0;
  else
    v16 = 0.0;
  if ((v5 & 4) != 0)
    v17 = 1.0;
  else
    v17 = 0.0;
  if ((v5 & 1) != 0)
    v18 = 1.0;
  else
    v18 = 0.0;
  objc_msgSend(v33, "removeAllAnimations");
  objc_msgSend(v8, "removeAllAnimations");
  objc_msgSend(v9, "removeAllAnimations");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  *(float *)&v19 = v16;
  objc_msgSend(v33, "setOpacity:", v19);
  *(float *)&v20 = v17;
  objc_msgSend(v8, "setOpacity:", v20);
  *(float *)&v21 = v18;
  objc_msgSend(v9, "setOpacity:", v21);
  if ((v5 & 8) == 0)
  {
    v22 = 0;
LABEL_14:
    objc_msgSend(v33, "setMask:", v22);
    goto LABEL_15;
  }
  objc_msgSend(v33, "mask");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v7;
  if (v23 != v7)
    goto LABEL_14;
LABEL_15:
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView animationWithDuration:fromValue:toValue:key:](self, "animationWithDuration:fromValue:toValue:key:", v24, v25, CFSTR("opacity"), 0.25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addAnimation:forKey:", v26, 0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView animationWithDuration:fromValue:toValue:key:](self, "animationWithDuration:fromValue:toValue:key:", v27, v28, CFSTR("opacity"), 0.25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAnimation:forKey:", v29, 0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView animationWithDuration:fromValue:toValue:key:](self, "animationWithDuration:fromValue:toValue:key:", v30, v31, CFSTR("opacity"), 0.25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v32, 0);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v22);

}

- (id)animationWithDuration:(double)a3 fromValue:(id)a4 toValue:(id)a5 key:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0CD2710];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "animationWithKeyPath:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v10);

  objc_msgSend(v12, "setFromValue:", v11);
  objc_msgSend(v12, "setDuration:", a3);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  return v12;
}

- (id)springAnimationWithFromValue:(id)a3 toValue:(id)a4 key:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "animationWithKeyPath:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setToValue:", v8);

  objc_msgSend(v10, "setFromValue:", v9);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v10, "setStiffness:", 195.0);
  objc_msgSend(v10, "setDamping:", 19.75);
  objc_msgSend(v10, "settlingDuration");
  objc_msgSend(v10, "setDuration:");
  return v10;
}

- (id)targetedPreviewForCurrentSubject
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  VKCSubjectLiftView *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  _OWORD v62[3];
  _OWORD v63[3];
  CGRect v64;
  CGRect v65;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  objc_msgSend(v3, "setContentScaleFactor:", 0.0);
  -[VKCImageSubjectBaseView customImageForRemoveBackground](self, "customImageForRemoveBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VKCImageSubjectBaseView customImageForRemoveBackground](self, "customImageForRemoveBackground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v5);
  }
  else
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_6;
    v7 = (void *)MEMORY[0x1E0CEA638];
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v9, "CGImage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v10);

    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    vk_transformToImageOrientation((CGAffineTransform *)objc_msgSend(v5, "imageOrientation"), (uint64_t)v63);
    v62[0] = v63[0];
    v62[1] = v63[1];
    v62[2] = v63[2];
    objc_msgSend(v3, "setTransform:", v62);
  }

LABEL_6:
  -[VKCImageSubjectBaseView imageBounds](self, "imageBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v3, "setFrame:");
  v19 = -[VKCSubjectLiftView initWithFrame:]([VKCSubjectLiftView alloc], "initWithFrame:", v12, v14, v16, v18);
  v20 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[VKCSubjectLiftView bounds](v19, "bounds");
  v21 = (void *)objc_msgSend(v20, "initWithFrame:");
  -[VKCSubjectLiftView bounds](v19, "bounds");
  objc_msgSend(v3, "setFrame:");
  -[VKCSubjectLiftView addSubview:](v19, "addSubview:", v21);
  objc_msgSend(v21, "addSubview:", v3);
  -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
  v23 = v22;
  v24 = v22 * 20.0;
  v25 = VKMMultiplyPointScalar(0.0, 0.0, v22);
  v27 = v26;
  v28 = v23 * 3.0;
  v29 = VKMMultiplyPointScalar(0.0, 1.0, v23);
  v31 = v30;
  -[VKCSubjectLiftView layer](v19, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v32, "setShadowColor:", objc_msgSend(v34, "CGColor"));

  objc_msgSend(v32, "setShadowRadius:", v28);
  LODWORD(v35) = 0;
  objc_msgSend(v32, "setShadowOpacity:", v35);
  objc_msgSend(v32, "setShadowOffset:", v29, v31);
  objc_msgSend(v32, "setAllowsGroupBlending:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v33, "setShadowColor:", objc_msgSend(v36, "CGColor"));

  objc_msgSend(v33, "setShadowRadius:", v24);
  LODWORD(v37) = 0;
  objc_msgSend(v33, "setShadowOpacity:", v37);
  objc_msgSend(v33, "setShadowOffset:", v25, v27);
  objc_msgSend(v33, "setAllowsGroupBlending:", 1);
  -[VKCSubjectLiftView setDiffuseShadowLayer:](v19, "setDiffuseShadowLayer:", v33);
  -[VKCSubjectLiftView setRimShadowLayer:](v19, "setRimShadowLayer:", v32);
  if (v24 + v25 >= v28 + v29)
    v38 = v24 + v25;
  else
    v38 = v28 + v29;
  -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;

  v64.origin.x = v41;
  v64.origin.y = v43;
  v64.size.width = v45;
  v64.size.height = v47;
  v65 = CGRectInset(v64, -v38, -v38);
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  height = v65.size.height;
  v52 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[VKCImageSubjectBaseView configureMaskForCurrentSubjectContextWithLayer:animated:](self, "configureMaskForCurrentSubjectContextWithLayer:animated:", v52, 0);
  objc_msgSend(v3, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setMask:", v52);

  -[VKCImageSubjectHighlightView setCurrentLiftView:](self, "setCurrentLiftView:", v19);
  -[VKCImageSubjectHighlightView setCurrentLiftImageView:](self, "setCurrentLiftImageView:", v3);
  v54 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setShadowPath:", v55);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", VKMSubtractPoints(x, y, v12));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setVisiblePath:", v56);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setBackgroundColor:", v57);

  v58 = objc_alloc(MEMORY[0x1E0CEAA90]);
  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", self, VKMCenterOfRect(x, y, width, height));
  v60 = (void *)objc_msgSend(v58, "initWithView:parameters:target:", v19, v54, v59);

  return v60;
}

- (void)setTapToSelectModeEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  self->_tapToSelectModeEnabled = a3;
  if (a3)
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "subjectCount");

    if (v5)
    {
      -[VKCImageSubjectHighlightView tapGR](self, "tapGR");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 1);

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v7, 0, 0, 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    }
  }
  else
  {
    -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", 0, 0, 0, 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
  }
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  self->_subjectViewUserInteractionDisabled = a3;
  if (a3)
  {
    -[VKCImageSubjectHighlightView tapGR](self, "tapGR");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

    -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = 0;
  }
  else
  {
    -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = 1;
  }
  objc_msgSend(v5, "setEnabled:", v6);

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  void *v6;

  objc_msgSend(a5, "locationInView:", self, a4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView setBurstPoint:](self, "setBurstPoint:", v6);

  return -[VKCImageSubjectHighlightView targetedPreviewForCurrentSubject](self, "targetedPreviewForCurrentSubject");
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;

  v6 = a5;
  -[VKCImageSubjectHighlightView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CEA570]);
    objc_msgSend(v8, "bounds");
    v14 = (void *)objc_msgSend(v9, "initWithContainer:center:", self, VKMCenterOfRect(v10, v11, v12, v13));
    objc_msgSend(v6, "retargetedPreviewWithTarget:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[VKCImageSubjectHighlightView isLiftingEmptyItemArray](self, "isLiftingEmptyItemArray"))
    -[VKCImageSubjectHighlightView handleCancelForUndraggedLiftForInteraction:](self, "handleCancelForUndraggedLiftForInteraction:", v4);

}

- (void)handleCancelForUndraggedLiftForInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  id v54;
  CATransform3D v55;
  _OWORD v56[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CATransform3D v63;
  _QWORD v64[4];
  id v65;

  v4 = a3;
  -[VKCImageSubjectHighlightView currentLiftView](self, "currentLiftView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __75__VKCImageSubjectHighlightView_handleCancelForUndraggedLiftForInteraction___block_invoke;
  v64[3] = &unk_1E94625B8;
  v7 = v5;
  v65 = v7;
  objc_msgSend(v6, "performWithoutAnimation:", v64);
  v8 = CACurrentMediaTime();
  -[VKCImageSubjectHighlightView dragInteractionStartTime](self, "dragInteractionStartTime");
  v10 = v9;
  objc_msgSend(v4, "_cancellationDelay");
  v12 = v11;
  LODWORD(v6) = objc_msgSend(v4, "_isCancellationTimerEnabled");

  if ((_DWORD)v6
    && (v13 = v12 + -0.01, v14 = v8 - v10, v8 - v10 >= v12 + -0.01)
    && !-[VKCImageSubjectHighlightView glowLayerWasActiveOnLift](self, "glowLayerWasActiveOnLift", v13, v14))
  {
    -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 0, 0);
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "hideMenu");

  }
  else
  {
    -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", -[VKCImageSubjectHighlightView subjectHighlightState](self, "subjectHighlightState", v13, v14) | 5, 0);
    -[VKCImageSubjectHighlightView dragInteractionStartLocation](self, "dragInteractionStartLocation");
    -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, -[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto"), v15, v16);
    -[VKCImageSubjectBaseView pulseLayer](self, "pulseLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView imageHighlightLayerContainer](self, "imageHighlightLayerContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView imageHighlightLayerContainerShadow](self, "imageHighlightLayerContainerShadow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rimShadowLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v7;
    objc_msgSend(v7, "diffuseShadowLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v17, "timeOffset");
    v23 = v22;
    objc_msgSend(v17, "beginTime");
    v25 = v24;
    objc_msgSend(v17, "superlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 != v27)
    {
      objc_msgSend(v17, "superlayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "position");
      v30 = v29;
      v32 = v31;
      -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertPoint:toLayer:", v33, v30, v32);
      objc_msgSend(v17, "setPosition:");

      -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSublayer:", v17);

    }
    objc_msgSend(v17, "setTimeOffset:", v23);
    objc_msgSend(v17, "setBeginTime:", v25);
    objc_msgSend(v18, "setShadowColor:", objc_msgSend(v20, "shadowColor"));
    objc_msgSend(v18, "setShadowRadius:", 0.0);
    objc_msgSend(v20, "shadowOffset");
    objc_msgSend(v18, "setShadowOffset:");
    objc_msgSend(v20, "shadowOpacity");
    objc_msgSend(v18, "setShadowOpacity:");
    objc_msgSend(v19, "setShadowColor:", objc_msgSend(v21, "shadowColor"));
    objc_msgSend(v19, "setShadowRadius:", 0.0);
    objc_msgSend(v21, "shadowOffset");
    objc_msgSend(v19, "setShadowOffset:");
    objc_msgSend(v21, "shadowOpacity");
    objc_msgSend(v19, "setShadowOpacity:");
    memset(&v63, 0, sizeof(v63));
    CATransform3DMakeScale(&v63, 1.02, 1.02, 1.0);
    v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v59 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v51 = v59;
    v60 = v52;
    v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v61 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v49 = v61;
    v62 = v50;
    v48 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v56[0] = *MEMORY[0x1E0CD2610];
    v47 = v56[0];
    v56[1] = v48;
    v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v57 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v45 = v57;
    v58 = v46;
    objc_msgSend(v18, "setTransform:", v56);
    v53 = v20;
    v55 = v63;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v55);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&v55.m31 = v51;
    *(_OWORD *)&v55.m33 = v52;
    *(_OWORD *)&v55.m41 = v49;
    *(_OWORD *)&v55.m43 = v50;
    *(_OWORD *)&v55.m11 = v47;
    *(_OWORD *)&v55.m13 = v48;
    *(_OWORD *)&v55.m21 = v45;
    *(_OWORD *)&v55.m23 = v46;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v55);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView springAnimationWithFromValue:toValue:key:](self, "springAnimationWithFromValue:toValue:key:", v35, v36, CFSTR("transform"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "shadowRadius");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView springAnimationWithFromValue:toValue:key:](self, "springAnimationWithFromValue:toValue:key:", v39, &unk_1E9494EE0, CFSTR("shadowRadius"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v21, "shadowRadius");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView springAnimationWithFromValue:toValue:key:](self, "springAnimationWithFromValue:toValue:key:", v42, &unk_1E9494EE0, CFSTR("shadowRadius"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addAnimation:forKey:", v37, 0);
    objc_msgSend(v18, "addAnimation:forKey:", v40, 0);
    objc_msgSend(v19, "addAnimation:forKey:", v43, 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

    v7 = v54;
  }

}

uint64_t __75__VKCImageSubjectHighlightView_handleCancelForUndraggedLiftForInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (void)setGlowLayerActive:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectBaseView setGlowLayerActive:](&v7, sel_setGlowLayerActive_);
  v5 = -[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto") & !v3;
  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCancellationTimerEnabled:", v5);

  -[VKCImageSubjectHighlightView updateSubjectInteractionInProgressIfNecessary](self, "updateSubjectInteractionInProgressIfNecessary");
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v6 = a4;
  -[VKCImageSubjectHighlightView feedbackGenerator](self, "feedbackGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionChanged");

  -[VKCImageSubjectHighlightView setGlowLayerWasActiveOnLift:](self, "setGlowLayerWasActiveOnLift:", -[VKCImageSubjectBaseView glowLayerActive](self, "glowLayerActive"));
  -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessaryWithClearSelectAll:](self, "hideCalloutMenuIfNecessaryWithClearSelectAll:", 0);
  -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__VKCImageSubjectHighlightView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v8[3] = &unk_1E94625B8;
  v8[4] = self;
  objc_msgSend(v6, "addAnimations:", v8);

}

void __84__VKCImageSubjectHighlightView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "isLivePhoto") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "vk_viewPointRatioFromWindow");
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "configurePulseAnimationWithViewScale:");
    objc_msgSend(*(id *)(a1 + 32), "currentLiftImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pulseLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v6);

    objc_msgSend(*(id *)(a1 + 32), "showPulseAnimationWithViewScale:", v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "currentLiftView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowsVisible:", 1);

}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGPoint v10;
  CGRect v11;

  objc_msgSend(a4, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  -[VKCImageSubjectHighlightView bounds](self, "bounds");
  v10.x = v7;
  v10.y = v9;
  -[VKCImageSubjectHighlightView setShouldShowCalloutOnDragCancel:](self, "setShouldShowCalloutOnDragCancel:", CGRectContainsPoint(v11, v10));
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__VKCImageSubjectHighlightView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E9463610;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __83__VKCImageSubjectHighlightView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setSubjectHighlightState:animated:", objc_msgSend(*(id *)(a1 + 32), "subjectHighlightState") | 0xD, 0);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldShowCalloutOnDragCancel");
  if ((_DWORD)result)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "dragInteractionStartLocation");
    return objc_msgSend(v3, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, 0);
  }
  return result;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  NSObject *v53;
  VKCImageSubjectHighlightView *v54;
  void *v55;
  id v56;
  void *v58;
  int v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  uint8_t buf[4];
  VKCImageSubjectHighlightView *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  VKCImageSubjectHighlightView *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[VKCImageSubjectBaseView loadSubjectMaskIfNecessary](self, "loadSubjectMaskIfNecessary");
LABEL_7:
    v13 = 0;
    v14 = 1;
    goto LABEL_23;
  }
  if (-[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto")
    && !-[VKCImageSubjectHighlightView subjectAnalysisCompleteWhenTouchesBegan](self, "subjectAnalysisCompleteWhenTouchesBegan"))
  {
    goto LABEL_7;
  }
  -[VKCImageSubjectHighlightView setDragInteractionStartTime:](self, "setDragInteractionStartTime:", CACurrentMediaTime());
  objc_msgSend(v5, "locationInView:", self);
  -[VKCImageSubjectHighlightView setDragInteractionStartLocation:](self, "setDragInteractionStartLocation:");
  objc_msgSend(v5, "locationInView:", self);
  v8 = v7;
  v10 = v9;
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", v8, v10);
  objc_msgSend(v11, "indexOfSubjectAtNormalizedPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v12, "unsignedIntValue"));
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VKCImageSubjectHighlightView isSelectAllActive](self, "isSelectAllActive"))
    -[VKCImageSubjectBaseView setActiveSubjectIndexSet:](self, "setActiveSubjectIndexSet:", v15);
  v16 = -[VKCImageSubjectBaseView subjectExistsAtPoint:](self, "subjectExistsAtPoint:", v8, v10);
  -[VKCImageSubjectHighlightView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  VKMRectFromNormalizedSubrect(v18, v20, v22, v24, v25, v26, v27, v28);
  v30 = v29;
  v32 = v31;
  -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v42 = VKMCenterOfRect(v35, v37, v39, v41);
  v44 = v43;
  v45 = VKMMultiplyPointScalar(v39, v41, 0.72);
  v46 = VKMRectWithCenterAndSize(v42, v44, v45);
  if (v30 < v48 || v32 < v47)
  {
    v53 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = self;
      _os_log_impl(&dword_1D2E0D000, v53, OS_LOG_TYPE_DEFAULT, "Subject image is zoomed in and no longer fits the view properly to lift: %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
  -[UIView vk_windowPointRatioFromView](self, "vk_windowPointRatioFromView", v46);
  v51 = VKMMultiplyPointScalar(v39, v41, v49);
  if (v51 < 64.0)
  {
    v52 = v50;
    if (v50 < 64.0)
    {
      v53 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        VKMUIStringForSize(v51, v52);
        v54 = (VKCImageSubjectHighlightView *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v65 = v54;
        v66 = 2048;
        v67 = 0x4050000000000000;
        v68 = 2112;
        v69 = self;
        _os_log_impl(&dword_1D2E0D000, v53, OS_LOG_TYPE_DEFAULT, "Subject image is too small. Image in window coordinates: %@,  Max edge length %f: %@", buf, 0x20u);

      }
LABEL_20:
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
  }
  if (!v16)
  {
    v13 = 0;
    goto LABEL_22;
  }
  -[VKCImageSubjectHighlightView delegate](self, "delegate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "subjectHighlightView:shouldBeginInteractionAtPoint:withType:", self, 0, v8, v10);

  v13 = 0;
  if (v59)
  {
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "subjectHighlightView:willBeginInteractionAtPoint:withType:", self, 1, v8, v10);

    v61 = objc_alloc(MEMORY[0x1E0CEA558]);
    -[VKCImageSubjectHighlightView createItemProvider](self, "createItemProvider");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v61, "initWithItemProvider:", v62);

    v63 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  v14 = objc_msgSend(v13, "count") == 0;

LABEL_23:
  -[VKCImageSubjectHighlightView setIsLiftingEmptyItemArray:](self, "setIsLiftingEmptyItemArray:", v14);
  if (v13)
    v55 = v13;
  else
    v55 = (void *)MEMORY[0x1E0C9AA60];
  v56 = v55;

  return v56;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  void *v5;
  int v6;
  id v7;

  -[VKCImageSubjectHighlightView setShouldShowCalloutOnDragCancel:](self, "setShouldShowCalloutOnDragCancel:", 0, a4);
  -[VKCImageSubjectHighlightView setSubjectHighlightState:](self, "setSubjectHighlightState:", 3);
  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMenuVisible");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideMenuFromView:", self);

  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  if (!-[VKCImageSubjectHighlightView shouldShowCalloutOnDragCancel](self, "shouldShowCalloutOnDragCancel", a3, a4))
  {
    -[VKCImageSubjectHighlightView setSubjectHighlightState:](self, "setSubjectHighlightState:", 0);
    -[VKCImageSubjectHighlightView setIsSelectAllActive:](self, "setIsSelectAllActive:", 0);
  }
  if (a5 == 2)
    -[VKCImageSubjectBaseView sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:](self, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 2, 3, 1, 0.0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)livePhotoCoyotePan:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "state") != 4
    && !-[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled"))
  {
    objc_msgSend(v17, "translationInView:", self);
    v6 = VKMDistance(v4, v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
    v8 = v7;
    -[VKCImageSubjectHighlightView livePhotoStartTime](self, "livePhotoStartTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v6 * v8 > 20.0)
      {
        objc_msgSend(v17, "_activeEventOfType:", 0, v6 * v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allTouches");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "_isActive");

          if ((v14 & 1) == 0)
          {
            -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEnabled:", 1);

            -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
            -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
            -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_immediatelyBeginDragWithTouch:completion:", v12, &__block_literal_global_148);

          }
        }

      }
    }
  }

}

- (void)livePhotoLongPress:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;

  if (!-[VKCImageSubjectBaseView subjectExistsAtPoint:](self, "subjectExistsAtPoint:", v7, v9)
    && -[VKCImageSubjectHighlightView subjectAnalysisCompleteWhenTouchesBegan](self, "subjectAnalysisCompleteWhenTouchesBegan")&& (-[VKCImageSubjectBaseView subjectContext](self, "subjectContext"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else if (v5 == 1)
  {
    -[VKCImageSubjectHighlightView setSubjectHighlightState:](self, "setSubjectHighlightState:", 0);
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subjectHighlightView:livePhotoShouldPlay:", self, 1);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView setLivePhotoStartTime:](self, "setLivePhotoStartTime:", v31);
    goto LABEL_7;
  }
  if ((unint64_t)(v5 - 3) <= 1)
  {
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subjectHighlightView:livePhotoShouldPlay:", self, 0);

    -[VKCImageSubjectHighlightView livePhotoStartTime](self, "livePhotoStartTime");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectHighlightView setLivePhotoStartTime:](self, "setLivePhotoStartTime:", 0);
    v12 = v31;
    if (!v31)
      goto LABEL_8;
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v31);
      v17 = v16;

      if (v17 < 0.8)
      {
        -[VKCImageSubjectBaseView imageHighlightLayer](self, "imageHighlightLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageSubjectBaseView pulseLayer](self, "pulseLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "superlayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 != v18)
        {
          objc_msgSend(v19, "superlayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "position");
          v23 = v22;
          v25 = v24;
          objc_msgSend(v18, "superlayer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "convertPoint:toLayer:", v26, v23, v25);
          objc_msgSend(v19, "setPosition:");

          objc_msgSend(v18, "addSublayer:", v19);
        }
        -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:", v7, v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v27, "integerValue"));
        else
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setActiveSubjectIndexes:", v29);

        -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 7, 1);
        -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, 1, v7, v9);

      }
    }
LABEL_7:
    v12 = v31;
LABEL_8:

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectHighlightView touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  if (-[VKCImageSubjectBaseView glowLayerActive](self, "glowLayerActive"))
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView setSubjectAnalysisCompleteWhenTouchesBegan:](self, "setSubjectAnalysisCompleteWhenTouchesBegan:", v5 != 0);

}

- (void)hideCalloutMenuIfNecessary
{
  if (!-[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled"))
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessaryWithClearSelectAll:](self, "hideCalloutMenuIfNecessaryWithClearSelectAll:", 1);
}

- (void)hideCalloutMenuIfNecessaryWithClearSelectAll:(BOOL)a3
{
  VKCImageSubjectHighlightView *v5;
  _BOOL8 v6;
  BOOL v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_targetView");
  v5 = (VKCImageSubjectHighlightView *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView setCalloutStartTime:](self, "setCalloutStartTime:", 0);
  v6 = -[VKCImageSubjectHighlightView isSelectAllActive](self, "isSelectAllActive");
  if (objc_msgSend(v9, "isMenuVisible"))
    v7 = v5 == self;
  else
    v7 = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideMenuFromView:", self);

  }
  if (!a3)
    -[VKCImageSubjectHighlightView setIsSelectAllActive:](self, "setIsSelectAllActive:", v6);

}

- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  double y;
  double x;
  _BOOL8 v10;
  _BOOL4 v11;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  v10 = a5;
  v11 = a4;
  v18 = a3;
  if (v18)
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "subjectIndexes:equivalentToIndexes:", v18, v14);

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    if ((v15 & 1) == 0)
      -[VKCImageSubjectBaseView setActiveSubjectIndexSet:animated:](self, "setActiveSubjectIndexSet:animated:", v18, v7);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if (v11)
    {
      if (v10
        || !-[VKCImageSubjectBaseView glowLayerActive](self, "glowLayerActive")
        || (objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isMenuVisible"),
            v16,
            (v15 & v17 & 1) == 0))
      {
        -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, v10, x, y);
      }
    }
    else
    {
      -[VKCImageSubjectHighlightView _configureGlowWithShowBurst:burstPoint:](self, "_configureGlowWithShowBurst:burstPoint:", v10, x, y);
    }
  }
  else
  {
    -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
    -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
    -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 0, v7);
  }

}

- (void)showCalloutMenuAtLocation:(CGPoint)a3 checkDelegate:(BOOL)a4 showPulse:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  if (a4)
  {
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "subjectHighlightView:shouldBeginInteractionAtPoint:withType:", self, 1, x, y);

    if (!v10)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0CEA7D0]);
      objc_msgSend(v21, "notificationOccurred:", 1);
      -[VKCImageSubjectHighlightView setSubjectHighlightState:](self, "setSubjectHighlightState:", 0);
      -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
      -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
      goto LABEL_6;
    }
    -[VKCImageSubjectHighlightView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subjectHighlightView:willBeginInteractionAtPoint:withType:", self, 1, x, y);

  }
  -[VKCImageSubjectHighlightView becomeFirstResponder](self, "becomeFirstResponder");
  -[VKCImageSubjectHighlightView subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:](self, "subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:", 1);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView _configureGlowWithShowBurst:burstPoint:](self, "_configureGlowWithShowBurst:burstPoint:", v5, x, y);
  objc_msgSend(v21, "showMenuFromView:rect:", self, v13, v15, v17, v19);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectHighlightView setCalloutStartTime:](self, "setCalloutStartTime:", v20);

LABEL_6:
}

- (void)_configureGlowWithShowBurst:(BOOL)a3 burstPoint:(CGPoint)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  VKCImageSubjectHighlightView *v16;
  uint64_t v17;

  v4 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "vk_valueWithPoint:", a4.x, a4.y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageSubjectBaseView setBurstPoint:](self, "setBurstPoint:", v6);

  }
  else
  {
    -[VKCImageSubjectBaseView setBurstPoint:](self, "setBurstPoint:", 0, a4.x, a4.y);
  }
  v7 = -[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled") ^ 1;
  -[VKCImageSubjectHighlightView tapGR](self, "tapGR");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cancelLift");

  -[VKCImageSubjectHighlightView livePhotoPlayGR](self, "livePhotoPlayGR");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 0);

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeGlowLayerIndexSet](self, "activeGlowLayerIndexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "subjectIndexes:equivalentToIndexes:", v12, v13);

  if ((v14 & 1) == 0)
  {
    if (-[VKCImageSubjectBaseView glowLayerActive](self, "glowLayerActive"))
    {
      -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

LABEL_11:
        -[VKCImageSubjectBaseView updateGlowLayerForActiveSubjectIndexSet](self, "updateGlowLayerForActiveSubjectIndexSet");
        goto LABEL_12;
      }
      if (-[VKCImageSubjectHighlightView isSelectAllActive](self, "isSelectAllActive"))
        goto LABEL_11;
      v16 = self;
      v17 = 0;
    }
    else
    {
      v16 = self;
      v17 = 1;
    }
    -[VKCImageSubjectHighlightView setGlowLayerActive:](v16, "setGlowLayerActive:", v17);
  }
LABEL_12:
  if (!-[VKCImageSubjectHighlightView subjectHighlightState](self, "subjectHighlightState"))
    -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 4, 0);
  -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 15, 1);
  if (v4)
  {
    -[UIView vk_viewPointRatioFromWindow](self, "vk_viewPointRatioFromWindow");
    -[VKCImageSubjectBaseView showPulseAnimationWithViewScale:](self, "showPulseAnimationWithViewScale:");
  }
}

- (void)_shareHeics:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__VKCImageSubjectHighlightView__shareHeics___block_invoke;
  v5[3] = &unk_1E9463678;
  objc_copyWeak(&v6, &location);
  -[VKCImageSubjectBaseView loadImageSubjectIfNecessaryWithCompletion:](self, "loadImageSubjectIfNecessaryWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __44__VKCImageSubjectHighlightView__shareHeics___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tempGenerateStickerFromLivePhotoIfNecessaryWithProgress:", 0);

}

- (void)_addSticker:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke;
  v5[3] = &unk_1E9462590;
  objc_copyWeak(&v6, &location);
  vk_requestDeviceUnlockIfNecessaryWithCompletion(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke_2;
    v2[3] = &unk_1E9462630;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    vk_dispatchMainAfterDelay(v2, 0.0);
    objc_destroyWeak(&v3);
  }
}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke_3;
    v5[3] = &unk_1E9462630;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "subjectHighlightView:prepareForCalloutAction:completion:", v3, sel__addSticker_, v5);

    objc_destroyWeak(&v6);
  }

}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_addSticker");

}

- (void)_addSticker
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VKCImageSubjectHighlightView__addSticker__block_invoke;
  v3[3] = &unk_1E9463678;
  objc_copyWeak(&v4, &location);
  -[VKCImageSubjectBaseView loadImageSubjectIfNecessaryWithCompletion:](self, "loadImageSubjectIfNecessaryWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__VKCImageSubjectHighlightView__addSticker__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__VKCImageSubjectHighlightView__addSticker__block_invoke_2;
  v4[3] = &unk_1E9462630;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  vk_dispatchMainAfterDelay(v4, 0.0);
  objc_destroyWeak(&v5);

}

void __43__VKCImageSubjectHighlightView__addSticker__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentStickerPickerViewController");
    objc_msgSend(v2, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 2, 4, 1, 0.0);
    WeakRetained = v2;
  }

}

- (void)_selectAllSubjects:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView setActiveSubjectIndexSet:](self, "setActiveSubjectIndexSet:", v5);

  -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
  -[VKCImageSubjectHighlightView setIsSelectAllActive:](self, "setIsSelectAllActive:", 1);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VKCImageSubjectHighlightView__selectAllSubjects___block_invoke;
  v6[3] = &unk_1E9462630;
  objc_copyWeak(&v7, &location);
  vk_dispatchMainAfterDelay(v6, 0.0);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __51__VKCImageSubjectHighlightView__selectAllSubjects___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)_presentStickerPickerViewController
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;

  -[VKCImageSubjectHighlightView subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:](self, "subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:", 1);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  v7 = CGRectGetMidX(v30) + -20.0;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v8 = CGRectGetMidY(v31) + -20.0;
  v9 = objc_alloc_init(MEMORY[0x1E0CEAEF0]);
  -[VKCImageSubjectHighlightView setStickerPickerViewController:](self, "setStickerPickerViewController:", v9);

  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceView:", self);

  v12 = VKMRectWithOriginAndSize(v11, v7, v8, 40.0, 40.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[VKCImageSubjectHighlightView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceStyle");
  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOverrideUserInterfaceStyle:", v22);

  -[VKCImageSubjectHighlightView delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentingViewControllerForSubjectHighlightView:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v29 = v25;
  }
  else
  {
    -[VKCImageSubjectHighlightView window](self, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rootViewController");
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentViewController:animated:completion:", v28, 0, 0);

}

- (void)_dismissCard
{
  id v2;

  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissCard");

}

- (void)didTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  if (-[VKCImageSubjectHighlightView tapToSelectModeEnabled](self, "tapToSelectModeEnabled"))
  {
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;

    -[VKCImageSubjectHighlightView selectAndShowCalloutForTapToSelectModeAtPoint:](self, "selectAndShowCalloutForTapToSelectModeAtPoint:", v6, v8);
  }
  else
  {
    v9 = objc_msgSend(v4, "state");

    if (v9 == 3)
      -[VKCImageSubjectHighlightView hideCalloutMenuIfNecessary](self, "hideCalloutMenuIfNecessary");
  }
}

- (void)selectAndShowCalloutForTapToSelectModeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  y = a3.y;
  x = a3.x;
  -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v6, "integerValue"));
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "subjectIndexes:equivalentToIndexes:", v7, v9);

  -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v7, v14 != 0, 0, 1, x, y);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "update");
LABEL_6:

    goto LABEL_10;
  }
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isMenuVisible");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hideMenu");
      goto LABEL_6;
    }
  }
LABEL_10:

}

- (void)menuControllerWillHide:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  VKCImageSubjectHighlightView *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v5, (uint64_t)v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[VKCImageSubjectHighlightView subjectViewUserInteractionDisabled](self, "subjectViewUserInteractionDisabled");
  objc_msgSend(v18, "_targetView");
  v8 = (VKCImageSubjectHighlightView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    v9 = -[VKCImageSubjectHighlightView tapToSelectModeEnabled](self, "tapToSelectModeEnabled");

    if (!v9)
    {
      -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_isActive");

      if (v11)
      {
        -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_cancelLift");

      }
      else if (!-[VKCImageSubjectHighlightView isHidingMenuController](self, "isHidingMenuController"))
      {
        -[VKCImageSubjectHighlightView setIsHidingMenuController:](self, "setIsHidingMenuController:", 1);
        -[VKCImageSubjectHighlightView setSubjectHighlightState:animated:](self, "setSubjectHighlightState:animated:", 0, 1);
        -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
        -[VKCImageSubjectHighlightView setIsHidingMenuController:](self, "setIsHidingMenuController:", 0);
      }
      -[VKCImageSubjectHighlightView tapGR](self, "tapGR");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEnabled:", 0);

      v14 = !v7;
      -[VKCImageSubjectHighlightView dragInteraction](self, "dragInteraction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEnabled:", v14);

      v16 = -[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto") & v14;
      -[VKCImageSubjectHighlightView livePhotoPlayGR](self, "livePhotoPlayGR");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEnabled:", v16);

      -[VKCImageSubjectHighlightView setGlowLayerActive:](self, "setGlowLayerActive:", 0);
      -[VKCImageSubjectHighlightView setIsSelectAllActive:](self, "setIsSelectAllActive:", 0);
    }
  }
  else
  {

  }
}

- (void)_tempGenerateStickerFromLivePhotoIfNecessaryWithProgress:(id)a3
{
  id v4;
  VKCRemoveBackgroundVideoRequest *v5;
  void *v6;
  void *v7;
  VKCRemoveBackgroundVideoRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  VKCRemoveBackgroundVideoRequestHandler *v18;
  _QWORD v19[5];
  id v20;
  id location;
  _QWORD v22[2];

  v4 = a3;
  if (-[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto"))
  {
    v5 = [VKCRemoveBackgroundVideoRequest alloc];
    -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VKCRemoveBackgroundVideoRequest initWithPhotosAnalyzerRequest:](v5, "initWithPhotosAnalyzerRequest:", v7);

    +[VKImageDataRequirements stickerRequirements](VKImageDataRequirements, "stickerRequirements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "maxLength"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMaxDimension:](v8, "setMaxDimension:", v10);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "minLength"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMinDimension:](v8, "setMinDimension:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "maxDataLength"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMaxFileSize:](v8, "setMaxFileSize:", v12);

    -[VKCImageSubjectBaseView burstPoint](self, "burstPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "pointValue");
      -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
      VKMFlipPoint();
      v22[0] = v15;
      v22[1] = v16;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGPoint=dd}");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCRemoveBackgroundVideoRequest setInstancePoint:](v8, "setInstancePoint:", v17);

    }
    v18 = objc_alloc_init(VKCRemoveBackgroundVideoRequestHandler);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke;
    v19[3] = &unk_1E94636F0;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:](v18, "performRequest:previewResultAvailable:progress:completion:", v8, 0, v4, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_2;
  v10[3] = &unk_1E94636C8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = v5;
  v11 = v7;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  vk_dispatchMainAfterDelay(v10, 0.0);

  objc_destroyWeak(&v14);
}

void __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v32[4];
  id v33;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "utType");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CEA2E8];
      VKBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Error Extracting Heics"), CFSTR("Error Extracting Heics"), CFSTR("Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CEA2E0];
      VKBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_3;
      v32[3] = &unk_1E94636A0;
      v15 = v11;
      v33 = v15;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "addAction:", v16);
      objc_msgSend(a1[6], "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentingViewControllerForSubjectHighlightView:", WeakRetained);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(WeakRetained, "window");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "rootViewController");
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v20, "presentViewController:animated:completion:", v15, 1, &__block_literal_global_165);

    }
    else
    {
      objc_msgSend(WeakRetained, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "tempPNGURLForSubjectHighlightView:", WeakRetained);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "URLByDeletingPathExtension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathExtensionForType:", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "writeToURL:atomically:", v24, 1);
      objc_msgSend(WeakRetained, "bounds");
      v29 = VKMCenterOfRect(v25, v26, v27, v28);
      objc_msgSend(WeakRetained, "showSharingPaneForURL:sourceRect:", v24, VKMRectWithCenterAndSize(v29, v30, 1.0));

    }
  }

}

uint64_t __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showSharingPaneForURL:(id)a3 sourceRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13[5];
  id location;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__VKCImageSubjectHighlightView_showSharingPaneForURL_sourceRect___block_invoke;
  v11[3] = &unk_1E9463718;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  v10 = v9;
  v12 = v10;
  v13[1] = *(id *)&x;
  v13[2] = *(id *)&y;
  v13[3] = *(id *)&width;
  v13[4] = *(id *)&height;
  vk_performBlockOnMainThread(v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

void __65__VKCImageSubjectHighlightView_showSharingPaneForURL_sourceRect___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentingViewControllerForSubjectHighlightView:", WeakRetained);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;

LABEL_5:
      v7 = objc_alloc(MEMORY[0x1E0CEA2D8]);
      v18[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithActivityItems:applicationActivities:", v8, MEMORY[0x1E0C9AA60]);

      v17 = *MEMORY[0x1E0CEB240];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setExcludedActivityTypes:", v10);

      v11 = *(double *)(a1 + 56);
      v12 = *(double *)(a1 + 64);
      v13 = *(double *)(a1 + 72);
      v14 = *(double *)(a1 + 80);
      objc_msgSend(v9, "popoverPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSourceRect:", v11, v12, v13, v14);

      objc_msgSend(v9, "popoverPresentationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSourceView:", WeakRetained);

      objc_msgSend(v5, "presentViewController:animated:completion:", v9, 1, 0);
      goto LABEL_6;
    }
    objc_msgSend(WeakRetained, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)_share
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  VKCImageSubjectHighlightView *v8;
  id v9;
  uint8_t buf[4];
  VKCImageSubjectHighlightView *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Activating Subject share from callout menu: %@", buf, 0xCu);
  }

  -[VKCImageBaseOverlayView recognitionResult](self, "recognitionResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__VKCImageSubjectHighlightView__share__block_invoke;
  v6[3] = &unk_1E9463740;
  objc_copyWeak(&v9, (id *)buf);
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[VKCImageSubjectBaseView loadImageSubjectIfNecessaryWithCompletion:](self, "loadImageSubjectIfNecessaryWithCompletion:", v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __38__VKCImageSubjectHighlightView__share__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    objc_msgSend(v3, "vk_PNGData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__VKCImageSubjectHighlightView__share__block_invoke_2;
    v10[3] = &unk_1E94636C8;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v7 = v6;
    v11 = v7;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12 = v8;
    v13 = v9;
    vk_performBlockOnMainThread(v10);

    objc_destroyWeak(&v14);
  }

}

void __38__VKCImageSubjectHighlightView__share__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    v21 = WeakRetained;
    objc_msgSend(WeakRetained, "recognitionResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    WeakRetained = v21;
    if (v3 == v4)
    {
      objc_msgSend(v21, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tempPNGURLForSubjectHighlightView:", v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "writeToURL:atomically:", v6, 1);
      objc_msgSend(*(id *)(a1 + 48), "subjectPathInBoundsCoordinates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v12 = VKMCenterOfRect(v8, v9, v10, v11);
      v14 = VKMRectWithCenterAndSize(v12, v13, 1.0);
      v16 = v15;
      v18 = v17;
      v20 = v19;

      objc_msgSend(*(id *)(a1 + 48), "showSharingPaneForURL:sourceRect:", v6, v14, v16, v18, v20);
      objc_msgSend(v21, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 2, 2, 1, 0.0);

      WeakRetained = v21;
    }
  }

}

- (void)_define:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  VKCImageSubjectHighlightView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_DEFAULT, "Activating Subject LookUp from callout menu: %@", (uint8_t *)&v9, 0xCu);
  }

  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
  objc_msgSend(v5, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageSubjectHighlightView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subjectHighlightView:activateVSItemForNormalizedPath:", self, v7);

}

- (void)_share:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__VKCImageSubjectHighlightView__share___block_invoke;
  v5[3] = &unk_1E9462590;
  objc_copyWeak(&v6, &location);
  vk_requestDeviceUnlockIfNecessaryWithCompletion(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __39__VKCImageSubjectHighlightView__share___block_invoke(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __39__VKCImageSubjectHighlightView__share___block_invoke_2;
    v2[3] = &unk_1E9462630;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    vk_dispatchMainAfterDelay(v2, 0.0);
    objc_destroyWeak(&v3);
  }
}

void __39__VKCImageSubjectHighlightView__share___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__VKCImageSubjectHighlightView__share___block_invoke_3;
    v5[3] = &unk_1E9462630;
    objc_copyWeak(&v6, v1);
    objc_msgSend(v4, "subjectHighlightView:prepareForCalloutAction:completion:", v3, sel__share_, v5);

    objc_destroyWeak(&v6);
  }

}

void __39__VKCImageSubjectHighlightView__share___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_share");

}

- (void)copy:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  VKCImageSubjectHighlightView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_DEFAULT, "Subject copy: %@", buf, 0xCu);
  }

  -[VKCImageSubjectHighlightView createItemProvider](self, "createItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemProviders:", v7);

    -[VKCImageSubjectBaseView sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:](self, "sendSubjectAnalyticsEventWithEventType:interactionType:subjectFound:processingDuration:", 2, 1, 1, 0.0);
  }

}

- (id)createItemProvider
{
  void *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24[5];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  objc_initWeak(&location, self);
  -[VKCImageSubjectBaseView analysisResult](self, "analysisResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[VKCInternalSettings addSubjectCropRectToPasteboard](VKCInternalSettings, "addSubjectCropRectToPasteboard");
  v5 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke;
  v25[3] = &unk_1E94637B8;
  objc_copyWeak(&v28, &location);
  v9 = v3;
  v26 = v9;
  v10 = v6;
  v27 = v10;
  objc_msgSend(v5, "registerObjectOfClass:visibility:loadHandler:", v7, 0, v25);
  if (v4)
  {
    -[VKCImageSubjectBaseView subjectContext](self, "subjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageBaseOverlayView contentsRect](self, "contentsRect");
    objc_msgSend(v11, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = objc_opt_class();
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_4;
    v23[3] = &unk_1E9463808;
    objc_copyWeak(v24, &location);
    v24[1] = v14;
    v24[2] = v16;
    v24[3] = v18;
    v24[4] = v20;
    objc_msgSend(v5, "registerObjectOfClass:visibility:loadHandler:", v21, 0, v23);
    objc_destroyWeak(v24);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  VKCRemoveBackgroundRequestHandler *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "analysisResult"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = *(void **)(a1 + 32),
        v6,
        v6 == v7))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_2;
    v16[3] = &unk_1E9463768;
    v17 = v3;
    v8 = (VKCRemoveBackgroundRequestHandler *)v3;
    objc_msgSend(v5, "loadImageSubjectIfNecessaryWithCompletion:", v16);
    v11 = v17;
  }
  else
  {
    v8 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    objc_msgSend(*(id *)(a1 + 40), "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaskOnly:", 0);
    objc_msgSend(v9, "setCropToFit:", 1);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_3;
    v13[3] = &unk_1E9463790;
    v14 = v9;
    v15 = v3;
    v10 = v3;
    v11 = v9;
    -[VKCRemoveBackgroundRequestHandler performRequest:completion:](v8, "performRequest:completion:", v11, v13);

  }
  return 0;
}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CVBuffer *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = vk_cgImageFromPixelBuffer((__CVBuffer *)objc_msgSend(a2, "pixelBuffer"));
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v6);
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_orientedImageFromImage:toOrientation:", v8, objc_msgSend(*(id *)(a1 + 32), "imageOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __int128 v5;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_5;
    v7[3] = &unk_1E94637E0;
    v8 = v3;
    v5 = *(_OWORD *)(a1 + 56);
    v9 = *(_OWORD *)(a1 + 40);
    v10 = v5;
    objc_msgSend(WeakRetained, "loadImageSubjectIfNecessaryWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  NSStringFromCGRect(*(CGRect *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (CGRect)subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v3 = a3;
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:");
  v9 = v8;
  v10 = v7 > 88.0;
  if (v10 && v3)
    v11 = v7 + -44.0;
  else
    v11 = v7;
  if (v10 && v3)
    v12 = v6 + 0.0;
  else
    v12 = v6;
  if (v10 && v3)
    v13 = v5 + 0.0;
  else
    v13 = v5;
  -[VKCImageSubjectBaseView subjectPathInBoundsCoordinates](self, "subjectPathInBoundsCoordinates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v31.origin.x = v13;
  v31.origin.y = v12;
  v31.size.width = v9;
  v31.size.height = v11;
  v35.origin.x = v16;
  v35.origin.y = v18;
  v35.size.width = v20;
  v35.size.height = v22;
  v32 = CGRectIntersection(v31, v35);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  if (VKMRectHasArea(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height))
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    if (!CGRectIsNull(v33))
    {
      v22 = height;
      v20 = width;
      v18 = y;
      v16 = x;
    }
  }
  v27 = v16;
  v28 = v18;
  v29 = v20;
  v30 = v22;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke;
  v18[3] = &unk_1E9463920;
  v21 = v14;
  v22 = a4;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  -[VKCImageSubjectBaseView loadImageSubjectWithIndexes:completion:](self, "loadImageSubjectWithIndexes:completion:", a3, v18);

}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VKCRemoveBackgroundVideoRequest *v12;
  void *v13;
  void *v14;
  VKCRemoveBackgroundVideoRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  VKCRemoveBackgroundVideoRequestHandler *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  _BYTE *v33;
  _QWORD v34[4];
  NSObject *v35;
  _BYTE *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[2];
  _QWORD v42[4];
  NSObject *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD v51[4];
  int v52;
  _QWORD v53[5];
  id v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__5;
  v53[4] = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2810000000;
  v51[3] = &unk_1D2EE27EA;
  v52 = 0;
  v4 = *(_QWORD *)(a1 + 64);
  v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    VKMUIStringForStickerRepresentationType(*(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1D2E0D000, v5, OS_LOG_TYPE_DEFAULT, "Beginning sticker rep creation with types: %@, %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v56 = __Block_byref_object_copy__5;
  v57 = __Block_byref_object_dispose__5;
  v58 = 0;
  v8 = dispatch_group_create();
  +[VKImageDataRequirements stickerRequirements](VKImageDataRequirements, "stickerRequirements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  if ((v4 & 1) != 0)
  {
    dispatch_group_enter(v8);
    v46[0] = v10;
    v46[1] = 3221225472;
    v46[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_177;
    v46[3] = &unk_1E9463830;
    v47 = v9;
    v49 = v51;
    v50 = v53;
    v48 = v8;
    objc_msgSend(v3, "vk_imageDataWithRequirements:completion:", v47, v46);

  }
  if ((v4 & 4) != 0)
  {
    dispatch_group_enter(v8);
    +[VKImageDataRequirements stickerThumbnailRequirements](VKImageDataRequirements, "stickerThumbnailRequirements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    v42[1] = 3221225472;
    v42[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_2;
    v42[3] = &unk_1E9463858;
    v44 = v51;
    v45 = v53;
    v43 = v8;
    objc_msgSend(v3, "vk_imageDataWithRequirements:completion:", v11, v42);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isLivePhoto") & (v4 >> 1) & 1) == 1)
  {
    v12 = [VKCRemoveBackgroundVideoRequest alloc];
    objc_msgSend(*(id *)(a1 + 32), "analysisResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[VKCRemoveBackgroundVideoRequest initWithPhotosAnalyzerRequest:](v12, "initWithPhotosAnalyzerRequest:", v14);

    -[VKCRemoveBackgroundVideoRequest setStickerIDs:](v15, "setStickerIDs:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "maxLength"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMaxDimension:](v15, "setMaxDimension:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "minLength"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMinDimension:](v15, "setMinDimension:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "maxDataLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoRequest setMaxFileSize:](v15, "setMaxFileSize:", v18);

    objc_msgSend(*(id *)(a1 + 32), "burstPoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v19, "pointValue");
      objc_msgSend(v21, "normalizedPointFromViewPoint:");
      VKMFlipPoint();
      v41[0] = v22;
      v41[1] = v23;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v41, "{CGPoint=dd}");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCRemoveBackgroundVideoRequest setInstancePoint:](v15, "setInstancePoint:", v24);

    }
    v25 = objc_alloc_init(VKCRemoveBackgroundVideoRequestHandler);
    dispatch_group_enter(v8);
    v40[0] = v10;
    v40[1] = 3221225472;
    v40[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_3;
    v40[3] = &unk_1E9463880;
    v40[4] = *(_QWORD *)(a1 + 32);
    v37[0] = v10;
    v37[1] = 3221225472;
    v37[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_5;
    v37[3] = &unk_1E94638A8;
    v39 = *(id *)(a1 + 48);
    v38 = *(id *)(a1 + 40);
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_6;
    v34[3] = &unk_1E94638D0;
    v36 = buf;
    v35 = v8;
    -[VKCRemoveBackgroundVideoRequestHandler performRequest:previewResultAvailable:progress:completion:](v25, "performRequest:previewResultAvailable:progress:completion:", v15, v40, v37, v34);

  }
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_7;
  v28[3] = &unk_1E94638F8;
  v26 = *(_QWORD *)(a1 + 32);
  v29 = v3;
  v30 = v26;
  v31 = *(id *)(a1 + 56);
  v32 = v53;
  v33 = buf;
  v27 = v3;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v28);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_177(uint64_t a1, void *a2, double a3, double a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E0CEAEF8];
    v8 = a2;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v9, "setData:", v8);

    objc_msgSend(v9, "setRole:", CFSTR("com.apple.stickers.role.still"));
    objc_msgSend(*(id *)(a1 + 32), "uti");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setType:", v10);

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "insertObject:atIndex:", v9, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E0CEAEF8];
    v8 = a2;
    v9 = objc_alloc_init(v7);
    objc_msgSend(v9, "setData:", v8);

    objc_msgSend(v9, "setRole:", CFSTR("com.apple.stickers.role.keyboard"));
    +[VKImageDataRequirements stickerThumbnailRequirements](VKImageDataRequirements, "stickerThumbnailRequirements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uti");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setType:", v11);

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_4;
  v5[3] = &unk_1E9462B58;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  vk_performBlockOnMainThread(v5);

}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setVideoPreview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPreviewAvailableForSubjectHighlightView:", *(_QWORD *)(a1 + 32));

}

uint64_t __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_6(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "subjectPathInBoundsCoordinates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  -[VKCImageSubjectHighlightView videoPreview](self, "videoPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  objc_msgSend(v4, "subjectMatteAtCompositionTime:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v6 = a3;
  -[VKCImageSubjectHighlightView videoPreview](self, "videoPreview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *a4;
  objc_msgSend(v7, "subjectMatteForImage:atCompositionTime:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange
{
  void *v4;
  $0FD61D44AD30C1CDCD15B60AC4039C90 *result;
  void *v6;

  -[VKCImageSubjectHighlightView videoPreview](self, "videoPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "timeRange");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCImageSubjectHighlightView videoPreview](self, "videoPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedCropRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)stickerPickerViewControllerDidLoad
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__VKCImageSubjectHighlightView_stickerPickerViewControllerDidLoad__block_invoke;
  v2[3] = &unk_1E94625B8;
  v2[4] = self;
  vk_dispatchMainAfterDelay(v2, 0.5);
}

uint64_t __66__VKCImageSubjectHighlightView_stickerPickerViewControllerDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSticker");
}

- (void)addSticker
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;
  BOOL v16;
  id location;
  uint8_t buf[4];
  VKCImageSubjectHighlightView *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = -[VKCImageSubjectHighlightView isLivePhoto](self, "isLivePhoto");
  -[VKCImageSubjectBaseView activeSubjectIndexSet](self, "activeSubjectIndexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[VKCImageSubjectHighlightView stickerPickerViewController](self, "stickerPickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = v7 & 1;
  if ((v7 & 1) != 0)
    v9 = 5;
  else
    v9 = 7;
  v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEFAULT, "StickerPickerDidLoad: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke;
  v12[3] = &unk_1E94639E0;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  v15 = v8;
  v16 = v3;
  v11 = v5;
  v13 = v11;
  -[VKCImageSubjectHighlightView createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:](self, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v11, v9, MEMORY[0x1E0C9AA60], 0, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (v9)
  {
    v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_cold_1();
  }
  else
  {
    if (!WeakRetained)
      goto LABEL_5;
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(WeakRetained, "stickerPickerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_188;
      v16[3] = &unk_1E94639B8;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      v15 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v19 = *(_BYTE *)(a1 + 57);
      v17 = v15;
      objc_msgSend(v13, "addStickerWithRepresentations:previewView:originatingView:completion:", v7, v8, v14, v16);

      objc_destroyWeak(&v18);
      goto LABEL_5;
    }
    objc_msgSend(*(id *)(a1 + 32), "stickerPickerViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject addStickerWithRepresentations:previewView:originatingView:](v12, "addStickerWithRepresentations:previewView:originatingView:", v7, v8, *(_QWORD *)(a1 + 32));
  }

LABEL_5:
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_188_cold_1();
LABEL_4:

    goto LABEL_5;
  }
  if (WeakRetained && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "subjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animatedStickerScore");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &unk_1E9494EF8;
    if (v12)
      v14 = (void *)v12;
    v9 = v14;

    objc_msgSend(v8, "stickerPickerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __42__VKCImageSubjectHighlightView_addSticker__block_invoke_189(0.0, (uint64_t)v15, CFSTR("begin"), v5, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "animatedStickerCreationProgressChanged:progress:", v16, 0.0);

    v17 = *(_QWORD *)(a1 + 40);
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_196;
    v26[3] = &unk_1E9463968;
    objc_copyWeak(&v28, (id *)(a1 + 48));
    v27 = &__block_literal_global_191;
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2;
    v20[3] = &unk_1E9463990;
    v19 = *(_QWORD *)(a1 + 32);
    v21 = 0;
    v22 = v19;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    v24 = &__block_literal_global_191;
    v23 = v5;
    objc_msgSend(v8, "createStickerRepresentationsAtIndexSet:type:stickerIDs:progress:completion:", v17, 2, v23, v26, v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    goto LABEL_4;
  }
LABEL_5:

}

id __42__VKCImageSubjectHighlightView_addSticker__block_invoke_189(double a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v18[0] = a3;
  v17[0] = CFSTR("type");
  v17[1] = CFSTR("progress");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "numberWithDouble:", a1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (id)MEMORY[0x1E0C9AA60];
  if (v10)
    v14 = v10;
  v18[1] = v12;
  v18[2] = v14;
  v17[2] = CFSTR("stickerIDs");
  v17[3] = CFSTR("stickerScore");
  v18[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_196(uint64_t a1, void *a2, double a3)
{
  id *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "subjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animatedStickerScore");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &unk_1E9494EF8;
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  objc_msgSend(WeakRetained, "stickerPickerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "animatedStickerCreationProgressChanged:progress:", v14, a3);
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2_cold_1(v2, a1, v3);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      v14 = WeakRetained;
      objc_msgSend(WeakRetained, "subjectContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "animatedStickerScore");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = &unk_1E9494EF8;
      if (v7)
        v9 = (void *)v7;
      v10 = v9;

      v11 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v11, "stickerPickerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(100.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "animatedStickerCreationProgressChanged:progress:", v13, 100.0);
      WeakRetained = v14;
    }

  }
}

- (void)stickerPickerViewControllerDidDismiss
{
  -[VKCImageSubjectHighlightView setStickerPickerViewController:](self, "setStickerPickerViewController:", 0);
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (VKCImageSubjectHighlightViewDelegate)delegate
{
  return (VKCImageSubjectHighlightViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)subjectInteractionInProgress
{
  return self->_subjectInteractionInProgress;
}

- (BOOL)tapToSelectModeEnabled
{
  return self->_tapToSelectModeEnabled;
}

- (BOOL)subjectViewUserInteractionDisabled
{
  return self->_subjectViewUserInteractionDisabled;
}

- (unint64_t)subjectHighlightState
{
  return self->_subjectHighlightState;
}

- (UILongPressGestureRecognizer)livePhotoPlayGR
{
  return self->_livePhotoPlayGR;
}

- (void)setLivePhotoPlayGR:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoPlayGR, a3);
}

- (UITapGestureRecognizer)tapGR
{
  return self->_tapGR;
}

- (void)setTapGR:(id)a3
{
  objc_storeStrong((id *)&self->_tapGR, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (UIPanGestureRecognizer)coyotePanGR
{
  return self->_coyotePanGR;
}

- (void)setCoyotePanGR:(id)a3
{
  objc_storeStrong((id *)&self->_coyotePanGR, a3);
}

- (BOOL)shouldShowCalloutOnDragCancel
{
  return self->_shouldShowCalloutOnDragCancel;
}

- (void)setShouldShowCalloutOnDragCancel:(BOOL)a3
{
  self->_shouldShowCalloutOnDragCancel = a3;
}

- (BOOL)glowLayerWasActiveOnLift
{
  return self->_glowLayerWasActiveOnLift;
}

- (void)setGlowLayerWasActiveOnLift:(BOOL)a3
{
  self->_glowLayerWasActiveOnLift = a3;
}

- (BOOL)isHidingMenuController
{
  return self->_isHidingMenuController;
}

- (void)setIsHidingMenuController:(BOOL)a3
{
  self->_isHidingMenuController = a3;
}

- (CALayer)colorMaskLayer
{
  return self->_colorMaskLayer;
}

- (void)setColorMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_colorMaskLayer, a3);
}

- (CGImage)colorMaskImage
{
  return self->_colorMaskImage;
}

- (VKCSubjectLiftView)currentLiftView
{
  return (VKCSubjectLiftView *)objc_loadWeakRetained((id *)&self->_currentLiftView);
}

- (void)setCurrentLiftView:(id)a3
{
  objc_storeWeak((id *)&self->_currentLiftView, a3);
}

- (UIImageView)currentLiftImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_currentLiftImageView);
}

- (void)setCurrentLiftImageView:(id)a3
{
  objc_storeWeak((id *)&self->_currentLiftImageView, a3);
}

- (double)dragInteractionStartTime
{
  return self->_dragInteractionStartTime;
}

- (void)setDragInteractionStartTime:(double)a3
{
  self->_dragInteractionStartTime = a3;
}

- (CGPoint)dragInteractionStartLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_dragInteractionStartLocation.x;
  y = self->_dragInteractionStartLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDragInteractionStartLocation:(CGPoint)a3
{
  self->_dragInteractionStartLocation = a3;
}

- (NSDate)livePhotoStartTime
{
  return self->_livePhotoStartTime;
}

- (void)setLivePhotoStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoStartTime, a3);
}

- (NSDate)calloutStartTime
{
  return self->_calloutStartTime;
}

- (void)setCalloutStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_calloutStartTime, a3);
}

- (BOOL)isSelectAllActive
{
  return self->_isSelectAllActive;
}

- (void)setIsSelectAllActive:(BOOL)a3
{
  self->_isSelectAllActive = a3;
}

- (BOOL)isLiftingEmptyItemArray
{
  return self->_isLiftingEmptyItemArray;
}

- (void)setIsLiftingEmptyItemArray:(BOOL)a3
{
  self->_isLiftingEmptyItemArray = a3;
}

- (BOOL)isLivePhotoCheckCompleted
{
  return self->_isLivePhotoCheckCompleted;
}

- (void)setIsLivePhotoCheckCompleted:(BOOL)a3
{
  self->_isLivePhotoCheckCompleted = a3;
}

- (BOOL)subjectAnalysisCompleteWhenTouchesBegan
{
  return self->_subjectAnalysisCompleteWhenTouchesBegan;
}

- (void)setSubjectAnalysisCompleteWhenTouchesBegan:(BOOL)a3
{
  self->_subjectAnalysisCompleteWhenTouchesBegan = a3;
}

- (BOOL)analysisDelayTimerActive
{
  return self->_analysisDelayTimerActive;
}

- (void)setAnalysisDelayTimerActive:(BOOL)a3
{
  self->_analysisDelayTimerActive = a3;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (_UIStickerPickerViewController)stickerPickerViewController
{
  return self->_stickerPickerViewController;
}

- (void)setStickerPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPickerViewController, a3);
}

- (VKCRemoveBackgroundVideoPreviewResult)videoPreview
{
  return self->_videoPreview;
}

- (void)setVideoPreview:(id)a3
{
  objc_storeStrong((id *)&self->_videoPreview, a3);
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_videoPreview, 0);
  objc_storeStrong((id *)&self->_stickerPickerViewController, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_calloutStartTime, 0);
  objc_storeStrong((id *)&self->_livePhotoStartTime, 0);
  objc_destroyWeak((id *)&self->_currentLiftImageView);
  objc_destroyWeak((id *)&self->_currentLiftView);
  objc_storeStrong((id *)&self->_colorMaskLayer, 0);
  objc_storeStrong((id *)&self->_coyotePanGR, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayGR, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D2E0D000, v0, v1, "Error createStickerRepresentationsAtIndexSet: %@, %@");
  OUTLINED_FUNCTION_2_0();
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_188_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D2E0D000, v0, v1, "Error adding stickers with representation: %@, %@");
  OUTLINED_FUNCTION_2_0();
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 40);
  OUTLINED_FUNCTION_0_1(&dword_1D2E0D000, a2, a3, "Error creating StickerRepresentationsAtIndexSet for animated sticker: %@, %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

@end
