@implementation UICalloutBar

+ (id)activeCalloutBar
{
  return (id)qword_1ECD7B8F8;
}

+ (void)fadeSharedCalloutBar
{
  void *v2;
  int v3;

  objc_msgSend(a1, "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visible");

  if (v3)
    objc_msgSend((id)qword_1ECD7B8F8, "fade");
}

+ (void)performWithoutAffectingSharedCalloutBar:(id)a3
{
  void (*v4)(void);
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  id v8;

  if (qword_1ECD7B900)
  {
    v4 = (void (*)(void))*((_QWORD *)a3 + 2);
    v8 = a3;
    v4();
    v5 = v8;
  }
  else
  {
    objc_storeStrong((id *)&qword_1ECD7B900, (id)qword_1ECD7B8F8);
    v6 = (void (**)(_QWORD))a3;
    v7 = (void *)qword_1ECD7B8F8;
    qword_1ECD7B8F8 = 0;

    v6[2](v6);
    objc_storeStrong((id *)&qword_1ECD7B8F8, (id)qword_1ECD7B900);
    v5 = (void *)qword_1ECD7B900;
    qword_1ECD7B900 = 0;
  }

}

+ (id)sharedCalloutBar
{
  void *v2;
  UICalloutBar *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)xmmword_1ECD7B8F8;
  if (xmmword_1ECD7B8F8 == 0)
  {
    v3 = [UICalloutBar alloc];
    v4 = -[UICalloutBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = (void *)xmmword_1ECD7B8F8;
    *(_QWORD *)&xmmword_1ECD7B8F8 = v4;

    v2 = (void *)xmmword_1ECD7B8F8;
  }
  return v2;
}

+ (void)_releaseSharedInstance
{
  void *v2;
  void *v3;

  if ((_QWORD)xmmword_1ECD7B8F8)
  {
    objc_msgSend((id)xmmword_1ECD7B8F8, "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllAnimations");

    v3 = (void *)xmmword_1ECD7B8F8;
    *(_QWORD *)&xmmword_1ECD7B8F8 = 0;

  }
}

+ (BOOL)sharedCalloutBarIsVisible
{
  void *v2;
  char v3;

  objc_msgSend(a1, "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visible");

  return v3;
}

+ (void)fadeSharedCalloutBarFromTargetView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "activeCalloutBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visible");

  if (v5)
    objc_msgSend((id)xmmword_1ECD7B8F8, "fadeFromTargetView:", v6);

}

+ (void)hideSharedCalloutBar
{
  void *v2;
  int v3;

  objc_msgSend(a1, "activeCalloutBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visible");

  if (v3)
    objc_msgSend((id)xmmword_1ECD7B8F8, "hide");
}

+ (void)hideSharedCalloutBarFromTargetView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "activeCalloutBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visible");

  if (v5)
    objc_msgSend((id)xmmword_1ECD7B8F8, "hideFromTargetView:", v6);

}

- (UICalloutBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  uint64_t v8;
  void *v9;
  UICalloutBarBackground *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIView *v67;
  void *v68;
  void *v69;
  int v70;
  BOOL v71;
  __CFString *v72;
  __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  UISwipeGestureRecognizer *v88;
  UISwipeGestureRecognizer *v89;
  void *v90;
  char *v91;
  void *v93;
  void *v94;
  objc_super v95;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v95.receiver = self;
  v95.super_class = (Class)UICalloutBar;
  v7 = -[UIView initWithFrame:](&v95, sel_initWithFrame_);
  if (v7)
  {
    +[UICalloutBar _visualStyleForCalloutBar:](UICalloutBar, "_visualStyleForCalloutBar:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 104);
    *((_QWORD *)v7 + 104) = v8;

    v10 = -[UICalloutBarBackground initWithVisualStyle:]([UICalloutBarBackground alloc], "initWithVisualStyle:", *((_QWORD *)v7 + 104));
    v11 = (void *)*((_QWORD *)v7 + 89);
    *((_QWORD *)v7 + 89) = v10;

    objc_msgSend(*((id *)v7 + 89), "setAutoresizingMask:", 18);
    objc_msgSend(v7, "addSubview:", *((_QWORD *)v7 + 89));
    objc_msgSend(v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v7, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHitTestsAsOpaque:", 1);

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)*((_QWORD *)v7 + 88);
    *((_QWORD *)v7 + 88) = v14;

    v7[510] = 1;
    v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v7 + 600) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v7 + 616) = v16;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Cut"), CFSTR("Cut"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v18, sel_cut_, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);

    _UIKitBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Copy[Menu]"), CFSTR("Copy"), CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v21, sel_copy_, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v22);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Select"), CFSTR("Select"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v23, sel_select_, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v24);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Select All"), CFSTR("Select All"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v25, sel_selectAll_, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSecureName:", 0x10000);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForLocalization:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v27;
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v28, objc_msgSend(v27, "selector"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v29);

    _UIKitBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Delete[Menu]"), CFSTR("Delete"), CFSTR("Localizable"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v31, sel_delete_, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v32);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Replace…"), CFSTR("Replace…"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v33, sel__promptForReplace_, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v34);

    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", CFSTR("简⇄繁"), sel__transliterateChinese_, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v35);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Insert Drawing"), CFSTR("Insert Drawing"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v36, sel__insertDrawing_, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v37);

    +[UIAction _textFromCameraImage](UIAction, "_textFromCameraImage");
    v38 = objc_claimAutoreleasedReturnValue();
    +[UIAction _textFromCameraTitle](UIAction, "_textFromCameraTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)v38;
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:image:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:image:action:type:", v39, v38, sel_captureTextFromCamera_, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v40);

    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bold.italic.underline"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithImage:action:type:", v41, sel__showTextStyleOptions_, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "setConfigurationBlock:", &__block_literal_global_247);
    objc_msgSend(v17, "addObject:", v42);
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "userInterfaceIdiom");

    if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && ((objc_msgSend((id)UIApp, "_appAdoptsUICanvasLifecycle") & 1) != 0
       || objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle")))
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Open in New Window"), CFSTR("Open in New Window"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v45, sel__openInNewCanvas_, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v46);

    }
    _UINSLocalizedStringWithDefaultValue(CFSTR("Look Up"), CFSTR("Look Up"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v47, sel__lookup_, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v48);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Look Up"), CFSTR("Look Up"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v49, sel__define_, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v50);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Translate"), CFSTR("Translate"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v51, sel__translate_, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v52);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Learn…"), CFSTR("Learn…"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v53, sel__addShortcut_, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v54);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Speak"), CFSTR("Speak"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v55, sel__accessibilitySpeak_, 5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v56);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Speak…"), CFSTR("Speak…"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v57, sel__accessibilitySpeakLanguageSelection_, 5);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v58);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Pause"), CFSTR("Pause"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v59, sel__accessibilityPauseSpeaking_, 5);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v60);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Share…"), CFSTR("Share…"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithTitle:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithTitle:action:type:", v61, sel__share_, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v62);

    _UIImageWithName(CFSTR("UICalloutBarTextRtoL.png"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithImage:action:type:", v63, sel_makeTextWritingDirectionRightToLeft_, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v64);

    _UIImageWithName(CFSTR("UICalloutBarTextLtoR.png"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICalloutBarSystemButtonDescription buttonDescriptionWithImage:action:type:](_UICalloutBarSystemButtonDescription, "buttonDescriptionWithImage:action:type:", v65, sel_makeTextWritingDirectionLeftToRight_, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v66);

    objc_storeStrong((id *)v7 + 83, v17);
    v67 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", x, y, width, height);
    v68 = (void *)*((_QWORD *)v7 + 102);
    *((_QWORD *)v7 + 102) = v67;

    objc_msgSend(*((id *)v7 + 102), "setAutoresizingMask:", 18);
    objc_msgSend(*((id *)v7 + 104), "buttonMetrics");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "cornerRadius");
    objc_msgSend(*((id *)v7 + 102), "_setCornerRadius:");

    objc_msgSend(*((id *)v7 + 102), "setClipsToBounds:", 1);
    objc_msgSend(v7, "addSubview:", *((_QWORD *)v7 + 102));
    v70 = objc_msgSend(v7, "_shouldReverseLayoutDirection");
    v71 = v70 == 0;
    if (v70)
      v72 = CFSTR("UICalloutBarNextArrow.png");
    else
      v72 = CFSTR("UICalloutBarPreviousArrow.png");
    if (v71)
      v73 = CFSTR("UICalloutBarNextArrow.png");
    else
      v73 = CFSTR("UICalloutBarPreviousArrow.png");
    if (v71)
      v74 = 2;
    else
      v74 = 1;
    if (v71)
      v75 = 1;
    else
      v75 = 2;
    _UIImageWithName(v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICalloutBarButton buttonWithImage:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithImage:action:type:inView:visualStyle:", v76, sel__showPreviousItems_, 3, *((_QWORD *)v7 + 102), *((_QWORD *)v7 + 104));
    v78 = objc_claimAutoreleasedReturnValue();
    v79 = (void *)*((_QWORD *)v7 + 87);
    *((_QWORD *)v7 + 87) = v78;

    +[UICalloutBarButton buttonWithImage:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithImage:action:type:inView:visualStyle:", v77, sel__showNextItems_, 3, *((_QWORD *)v7 + 102), *((_QWORD *)v7 + 104));
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)*((_QWORD *)v7 + 86);
    *((_QWORD *)v7 + 86) = v80;

    v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v83 = (void *)*((_QWORD *)v7 + 84);
    *((_QWORD *)v7 + 84) = v82;

    v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v85 = (void *)*((_QWORD *)v7 + 85);
    *((_QWORD *)v7 + 85) = v84;

    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v87 = (void *)*((_QWORD *)v7 + 101);
    *((_QWORD *)v7 + 101) = v86;

    *((_QWORD *)v7 + 103) = -1;
    v88 = -[UISwipeGestureRecognizer initWithTarget:action:]([UISwipeGestureRecognizer alloc], "initWithTarget:action:", v7, sel__showPreviousItems_);
    -[UISwipeGestureRecognizer setDirection:](v88, "setDirection:", v75);
    objc_msgSend(v7, "addGestureRecognizer:", v88);
    v89 = -[UISwipeGestureRecognizer initWithTarget:action:]([UISwipeGestureRecognizer alloc], "initWithTarget:action:", v7, sel__showNextItems_);
    -[UISwipeGestureRecognizer setDirection:](v89, "setDirection:", v74);
    objc_msgSend(v7, "addGestureRecognizer:", v89);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObserver:selector:name:object:", v7, sel_applicationDidAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);

    v91 = v7;
  }

  return (UICalloutBar *)v7;
}

void __30__UICalloutBar_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDontDismiss:", 1);
  objc_msgSend(v2, "setImageVerticalAdjust:", 1.0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), UIApp);

  v4.receiver = self;
  v4.super_class = (Class)UICalloutBar;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)applicationDidAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 5)
    -[UICalloutBar hide](self, "hide");
  else
    -[UICalloutBar fade](self, "fade");
}

- (BOOL)visible
{
  void *v3;
  double v4;
  BOOL v5;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 && (-[UIView alpha](self, "alpha"), v4 == 1.0) && !self->m_fadeAfterCommand;

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  v11.x = x;
  v11.y = y;
  if (CGRectContainsPoint(v12, v11) && !self->m_isDisplayingVertically)
    y = 18.0;
  v10.receiver = self;
  v10.super_class = (Class)UICalloutBar;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

- (id)_targetForAction:(SEL)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  v6 = objc_loadWeakRetained((id *)&self->m_responderTarget);
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "canPerformAction:withSender:", a3, WeakRetained))
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    +[UIWindow _externalKeyWindow](UIWindow, "_externalKeyWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)&self->m_targetView);
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "windowScene");
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      -[UIWindowScene _keyWindow](v14);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "firstResponder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_responderForEditing");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputDelegateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "forwardingInputDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputDelegateManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "forwardingInputDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_responderForEditing");
      v23 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v23;
    }
    objc_msgSend(v16, "targetForAction:withSender:", a3, WeakRetained);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)buttonPressed:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  BOOL *p_m_fadeAfterCommand;
  UICalloutBar *v9;
  UICalloutBar *v10;
  void *WeakRetained;
  uint64_t v12;
  uint64_t v13;
  UICalloutBar *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t);
  void *v25;
  UICalloutBar *v26;
  id v27;
  id v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "type");
  v7 = v6;
  if (v5 != 3 && v6 != 5)
  {
    p_m_fadeAfterCommand = &self->m_fadeAfterCommand;
    self->m_fadeAfterCommand = objc_msgSend(v4, "dontDismiss") ^ 1;
LABEL_6:
    -[UICalloutBar _targetForAction:](self, "_targetForAction:", objc_msgSend(v4, "action"));
    v9 = (UICalloutBar *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  p_m_fadeAfterCommand = &self->m_fadeAfterCommand;
  self->m_fadeAfterCommand = 0;
  if (v5 != 3)
    goto LABEL_6;
  v9 = self;
LABEL_7:
  v10 = v9;
  WeakRetained = objc_loadWeakRetained(&self->m_delegate);
  if (objc_msgSend(v4, "type") == 4)
  {
    objc_msgSend(v4, "textReplacement");
    v12 = objc_claimAutoreleasedReturnValue();

    WeakRetained = (void *)v12;
    if (!v12)
    {
      objc_msgSend(v4, "currentTitle");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  self->m_ignoreFade = objc_msgSend(v4, "dontDismiss");
  v13 = objc_msgSend(v4, "action");
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __30__UICalloutBar_buttonPressed___block_invoke;
  v25 = &unk_1E16B47A8;
  v14 = v10;
  v26 = v14;
  v20 = v4;
  v27 = v20;
  v15 = WeakRetained;
  v28 = v15;
  +[UIPasteboard _performAsDataOwnerForAction:responder:block:](UIPasteboard, "_performAsDataOwnerForAction:responder:block:", v13, v14, &v22);
  if (objc_msgSend(v20, "type") == 4)
  {
    objc_msgSend(v20, "textReplacement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didReplaceTextWithTarget:", v14);

  }
  if (self->m_ignoreFade && (objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled");
    -[UICalloutBar willFinishIgnoringCalloutBarFadeAfterPerformingAction](v14, "willFinishIgnoringCalloutBarFadeAfterPerformingAction");
  }
  self->m_ignoreFade = 0;
  if (*p_m_fadeAfterCommand)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && ((char *)objc_msgSend(v20, "action") == sel_cut_
       || (char *)objc_msgSend(v20, "action") == sel_copy_
       || (char *)objc_msgSend(v20, "action") == sel_paste_
       || (char *)objc_msgSend(v20, "action") == sel_undo_
       || (char *)objc_msgSend(v20, "action") == sel_redo_))
    {
      +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:](UIUndoGestureInteraction, "presentProductivityGestureTutorialInlineWithCompletion:", 0, v20, v22, v23, v24, v25, v26, v27);
    }
    -[UICalloutBar _fadeAfterCommand:](self, "_fadeAfterCommand:", objc_msgSend(v20, "action", v20));
  }
  else
  {
    v19 = v20;
    if (v5 == 3)
      goto LABEL_25;
    if (v7 == 5)
    {
      self->m_recalcVisibleItems = 1;
      -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 1);
    }
    else
    {
      objc_msgSend(v20, "setHighlighted:", 0);
    }
  }
  v19 = v20;
LABEL_25:
  +[UIKBAnalyticsDispatcher keyboardAnalyticsDispatchWithSelector:withTrigger:](UIKBAnalyticsDispatcher, "keyboardAnalyticsDispatchWithSelector:withTrigger:", objc_msgSend(v19, "action", v20), CFSTR("CalloutBar"));

}

id __30__UICalloutBar_buttonPressed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "action");
  v4 = *(_QWORD *)(a1 + 48);
  if (dyld_program_sdk_at_least())
  {
    v5 = v2;
    v6 = (const char *)v3;
    v7 = v4;
  }
  else
  {
    v6 = sel_performSelector_withObject_;
    v5 = v2;
    v7 = v3;
  }
  return objc_msgSend(v5, v6, v7);
}

- (void)_showPreviousItems:(id)a3
{
  int m_currentPage;
  BOOL v4;
  int v5;

  m_currentPage = self->m_currentPage;
  v4 = __OFSUB__(m_currentPage, 1);
  v5 = m_currentPage - 1;
  if (v5 < 0 == v4)
  {
    self->m_currentPage = v5;
    -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 1);
  }
}

- (void)_showNextItems:(id)a3
{
  int m_currentPage;

  m_currentPage = self->m_currentPage;
  if (m_currentPage < self->m_pageCount - 1)
  {
    self->m_currentPage = m_currentPage + 1;
    -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 1);
  }
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UICalloutBar clearEvadeRects](self, "clearEvadeRects");
  v3.receiver = self;
  v3.super_class = (Class)UICalloutBar;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  UICalloutBar *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGPoint v13;

  y = a3.y;
  x = a3.x;
  v6 = self;
  -[UIView _window](self, "_window", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromView:", v6, x, y);
  v13.x = v10;
  v13.y = v11;
  LOBYTE(v6) = CGRectContainsPoint(v6->m_controlFrame, v13);

  return (char)v6;
}

- (int)textEffectsVisibilityLevel
{
  return 350;
}

- (CGRect)textEffectsWindowSafeArea
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
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
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  double v41;
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
  CGRect v53;
  CGRect v54;
  CGRect result;
  CGRect v56;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
  objc_msgSend(WeakRetained, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "_usableBounds");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  if (objc_msgSend(v6, "_isHostedInAnotherProcess"))
  {
    objc_msgSend(v6, "safeAreaInsets");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v6, "_usableSceneBounds");
    objc_msgSend(v6, "convertRect:fromWindow:", 0, v18 + v23, v16 + v24, v25 - (v18 + v22), v26 - (v16 + v20));
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend(v6, "bounds");
    v56.origin.x = v35;
    v56.origin.y = v36;
    v56.size.width = v37;
    v56.size.height = v38;
    v53.origin.x = v28;
    v53.origin.y = v30;
    v53.size.width = v32;
    v53.size.height = v34;
    v54 = CGRectIntersection(v53, v56);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
  }
  objc_msgSend(v6, "windowScene");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "convertRect:fromWindow:", v6, x, y, width, height);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  v49 = v42;
  v50 = v44;
  v51 = v46;
  v52 = v48;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (void)resetPage
{
  if (self->m_currentPage >= 1)
    self->m_currentPage = 0;
}

- (BOOL)rectClear:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = *MEMORY[0x1E0C80C00];
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (!CGRectContainsRect(v21, v23))
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UICalloutBar rectsToEvade](self, "rectsToEvade", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "CGRectValue");
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        if (CGRectIntersectsRect(v22, v24))
        {
          v13 = 0;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (double)supressHorizontalXMovementIfNeededForPoint:(CGPoint)a3 proposedX:(double)a4
{
  double x;
  CGRect *p_m_supressesHorizontalMovementFrame;
  double v8;
  double width;
  double v10;

  x = a3.x;
  if (-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement", a3.x, a3.y))
  {
    p_m_supressesHorizontalMovementFrame = &self->m_supressesHorizontalMovementFrame;
    if (!CGRectIsNull(*p_m_supressesHorizontalMovementFrame))
    {
      a4 = p_m_supressesHorizontalMovementFrame->origin.x;
      v8 = x;
      if (x < p_m_supressesHorizontalMovementFrame->origin.x)
      {
LABEL_6:
        p_m_supressesHorizontalMovementFrame->origin.x = x;
        return v8;
      }
      width = p_m_supressesHorizontalMovementFrame->size.width;
      v10 = a4 + width;
      if (x > a4 + width)
      {
        v8 = x - width;
        x = a4 + x - v10;
        goto LABEL_6;
      }
    }
  }
  return a4;
}

- (double)maxVerticalCalloutHeightForMinButtonHeight:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3 * 3.0;
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v6 = v5;
  v8 = self->m_pointBelowControls.y + -9.0 + -6.0 - v7;
  v9 = v5 - (self->m_pointAboveControls.y + 9.0 + 6.0);
  -[UICalloutBar rectsToEvade](self, "rectsToEvade");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[UICalloutBar rectsToEvade](self, "rectsToEvade");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGRectValue");
    v14 = v13;

  }
  else
  {
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v15 = v8 + -10.0;
  v16 = v9 - v14 + -10.0;
  if ((v8 + -10.0 >= v4 || v16 >= v4) && v14 + v15 + v16 <= v6)
  {
    self->m_isUsingVerticalFallbackPosition = 0;
    if (v15 >= v16)
      return v8 + -10.0;
    else
      return v9 - v14 + -10.0;
  }
  else
  {
    self->m_isUsingVerticalFallbackPosition = 1;
    return (v6 - v14) * 0.5 + -9.0 + -6.0 + -10.0;
  }
}

- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 below:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  int *v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  CGFloat MinX;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v27;
  double rect1;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v29 = v14;
  v15 = &OBJC_IVAR___UICalloutBar_m_pointAboveControls;
  if (v4)
    v15 = &OBJC_IVAR___UICalloutBar_m_pointBelowControls;
  v16 = (double *)((char *)self + *v15);
  v17 = v16[1];
  -[UICalloutBar supressHorizontalXMovementIfNeededForPoint:proposedX:](self, "supressHorizontalXMovementIfNeededForPoint:proposedX:", *(_QWORD *)v16);
  v19 = v18;
  if (-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement")
    && !CGRectIsNull(self->m_supressesHorizontalMovementFrame))
  {
    v27 = v27 * 0.7 + self->m_supressedHorizontalMovementX * 0.3;
  }
  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v29;
  rect1 = v11;
  if (v19 >= CGRectGetMinX(v30) + 10.0)
  {
    v23 = v9 + v13 + -10.0;
    if (width + v19 <= v23)
    {
      self->m_availableSpaceOnLeft = v19 + -10.0;
      v21 = v23 - v19 - width;
    }
    else
    {
      v19 = v23 - width;
      self->m_availableSpaceOnLeft = v23 - width + -10.0;
      v21 = 0.0;
    }
    v22 = v29;
  }
  else
  {
    v31.origin.x = v9;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v29;
    MinX = CGRectGetMinX(v31);
    self->m_availableSpaceOnLeft = 0.0;
    v19 = MinX + 10.0;
    v21 = v9 + v13 + -10.0 - (MinX + 10.0) - width;
    v22 = v29;
  }
  self->m_availableSpaceOnRight = v21;
  if (v4)
    v24 = v17 + -9.0 + -6.0 - height;
  else
    v24 = v17 + 9.0 + 6.0;
  if (self->m_isDisplayingVertically
    && self->m_isUsingVerticalFallbackPosition
    && v4
    && height + height + height + rect1 + 9.0 + 6.0 < self->m_targetRect.origin.y + self->m_targetRect.size.height)
  {
    v24 = height + height + rect1;
  }
  v32.origin.x = v9;
  v32.origin.y = rect1;
  v32.size.width = v13;
  v32.size.height = v22;
  v33.origin.x = v19;
  v33.origin.y = v24;
  v33.size.width = width;
  v33.size.height = height;
  v25 = CGRectContainsRect(v32, v33);
  if (v25)
  {
    v25 = -[UICalloutBar rectClear:](self, "rectClear:", v19, v24, width, height);
    if (v25)
    {
      self->m_controlFrame.origin.x = v19;
      self->m_controlFrame.origin.y = v24;
      self->m_controlFrame.size.width = width;
      self->m_controlFrame.size.height = height;
      if (-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement")
        && CGRectIsNull(self->m_supressesHorizontalMovementFrame))
      {
        self->m_supressesHorizontalMovementFrame.origin.x = v19;
        self->m_supressesHorizontalMovementFrame.origin.y = v24;
        self->m_supressesHorizontalMovementFrame.size.width = width;
        self->m_supressesHorizontalMovementFrame.size.height = height;
        self->m_supressedHorizontalMovementX = v27;
      }
      LOBYTE(v25) = 1;
    }
  }
  return v25;
}

- (BOOL)calculateControlFrameForCalloutSize:(CGSize)a3 right:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  int *v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double width;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = &OBJC_IVAR___UICalloutBar_m_pointLeftOfControls;
  if (v4)
    v15 = &OBJC_IVAR___UICalloutBar_m_pointRightOfControls;
  v16 = (double *)((char *)self + *v15);
  v17 = *v16;
  v18 = floor(v16[1] + height * -0.5);
  if (v18 >= CGRectGetMinY(*(CGRect *)&v7) + 10.0)
  {
    v19 = v12 + v14 + -10.0;
    if (height + v18 > v19)
      v18 = v19 - height;
  }
  else
  {
    v24.origin.x = v11;
    v24.origin.y = v12;
    v24.size.width = v13;
    v24.size.height = v14;
    v18 = CGRectGetMinY(v24) + 10.0;
  }
  if (v4)
    v20 = v17 + -3.0 - width;
  else
    v20 = v17 + 3.0;
  v25.origin.x = v11;
  v25.origin.y = v12;
  v25.size.width = v13;
  v25.size.height = v14;
  v26.origin.x = v20;
  v26.origin.y = v18;
  v26.size.width = width;
  v26.size.height = height;
  v21 = CGRectContainsRect(v25, v26);
  if (v21)
  {
    v21 = -[UICalloutBar rectClear:](self, "rectClear:", v20, v18, width, height);
    if (v21)
    {
      self->m_controlFrame.origin.x = v20;
      self->m_controlFrame.origin.y = v18;
      self->m_controlFrame.size.width = width;
      self->m_controlFrame.size.height = height;
      LOBYTE(v21) = 1;
    }
  }
  return v21;
}

- (BOOL)calculateControlFrameInsideTargetRect:(CGSize)a3
{
  double height;
  double width;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double MinX;
  double v25;
  double v26;
  CGFloat x;
  CGFloat y;
  CGFloat v29;
  CGFloat v30;
  CGRectEdge v31;
  double MaxX;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinY;
  double v40;
  double MaxY;
  double v42;
  _BOOL4 v43;
  float64x2_t v49;
  float64x2_t v50;
  int m_arrowDirection;
  double v52;
  double v53;
  double v54;
  float64x2_t v55;
  double v56;
  double v57;
  double MidY;
  uint64_t v59;
  double v60;
  double v61;
  CGFloat v62;
  float64x2_t v64;
  double v65;
  double rect[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGRect slice;
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  height = a3.height;
  width = a3.width;
  v73 = *MEMORY[0x1E0C80C00];
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UICalloutBar targetRect](self, "targetRect");
  v78.origin.x = v14;
  v78.origin.y = v15;
  v78.size.width = v16;
  v78.size.height = v17;
  rect[0] = v7;
  v74.origin.x = v7;
  v74.origin.y = v9;
  v74.size.width = v11;
  v74.size.height = v13;
  slice = CGRectIntersection(v74, v78);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[UICalloutBar rectsToEvade](self, "rectsToEvade");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v68 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        memset(&rect[1], 0, 32);
        objc_msgSend(v23, "CGRectValue");
        *(CGRect *)&rect[1] = CGRectIntersection(v75, slice);
        MinX = CGRectGetMinX(*(CGRect *)&rect[1]);
        if (MinX >= CGRectGetMaxX(slice))
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&rect[1]);
          v33 = CGRectGetMinX(slice);
          v34 = rect[1];
          v35 = rect[2];
          v36 = rect[3];
          v37 = rect[4];
          if (MaxX <= v33)
          {
            MinY = CGRectGetMinY(*(CGRect *)&v34);
            if (MinY >= CGRectGetMaxY(slice))
            {
              MaxY = CGRectGetMaxY(*(CGRect *)&rect[1]);
              if (MaxY <= CGRectGetMinY(slice))
                continue;
              v42 = CGRectGetMaxY(*(CGRect *)&rect[1]);
              v26 = v42 - CGRectGetMinY(slice);
              x = slice.origin.x;
              y = slice.origin.y;
              v29 = slice.size.width;
              v30 = slice.size.height;
              v31 = CGRectMinYEdge;
            }
            else
            {
              v40 = CGRectGetMaxY(slice);
              v26 = v40 - CGRectGetMinY(*(CGRect *)&rect[1]);
              x = slice.origin.x;
              y = slice.origin.y;
              v29 = slice.size.width;
              v30 = slice.size.height;
              v31 = CGRectMaxYEdge;
            }
          }
          else
          {
            v38 = CGRectGetMaxX(*(CGRect *)&v34);
            v26 = v38 - CGRectGetMinX(slice);
            x = slice.origin.x;
            y = slice.origin.y;
            v29 = slice.size.width;
            v30 = slice.size.height;
            v31 = CGRectMinXEdge;
          }
        }
        else
        {
          v25 = CGRectGetMaxX(slice);
          v26 = v25 - CGRectGetMinX(*(CGRect *)&rect[1]);
          x = slice.origin.x;
          y = slice.origin.y;
          v29 = slice.size.width;
          v30 = slice.size.height;
          v31 = CGRectMaxXEdge;
        }
        CGRectDivide(*(CGRect *)&x, &slice, (CGRect *)&rect[1], v26, v31);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    }
    while (v20);
  }

  if (CGRectIsNull(slice))
  {
    LOBYTE(v43) = 0;
  }
  else
  {
    __asm { FMOV            V2.2D, #0.5 }
    v49 = vmulq_f64((float64x2_t)slice.size, _Q2);
    v50 = vrndaq_f64(vaddq_f64((float64x2_t)slice.origin, v49));
    m_arrowDirection = self->m_arrowDirection;
    v52 = v50.f64[1];
    v64 = v50;
    if (m_arrowDirection == 4)
    {
      v53 = floor(v50.f64[0] - width - v49.f64[0]);
    }
    else if (m_arrowDirection == 3)
    {
      v53 = floor(vaddq_f64(v49, v50).f64[0]);
    }
    else
    {
      -[UICalloutBar supressHorizontalXMovementIfNeededForPoint:proposedX:](self, "supressHorizontalXMovementIfNeededForPoint:proposedX:", *(_OWORD *)&v50, floor(v50.f64[0] + width * -0.5));
      v53 = v54;
      if (-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement")
        && !CGRectIsNull(self->m_supressesHorizontalMovementFrame))
      {
        v55.f64[0] = v64.f64[0] * 0.7 + self->m_supressedHorizontalMovementX * 0.3;
        v64 = v55;
      }
    }
    v56 = 10.0;
    if (v53 >= 10.0)
    {
      v57 = rect[0] + v11 + -10.0;
      v56 = v53;
      if (width + v53 > v57)
        v56 = v57 - width;
    }
    if (self->m_isDisplayingVertically
      && (v76.origin.x = rect[0],
          v76.origin.y = v9,
          v76.size.width = v11,
          v76.size.height = v13,
          MidY = CGRectGetMidY(v76),
          MidY > CGRectGetMidY(slice)))
    {
      v59 = 1;
      v60 = 0.0;
    }
    else
    {
      v59 = -[UICalloutBar arrowDirection](self, "arrowDirection", *(_OWORD *)&v64);
      v60 = height;
    }
    v61 = v52 - v60 + 9.0 + 6.0;
    -[UICalloutBar setArrowDirection:](self, "setArrowDirection:", v59, *(_OWORD *)&v64);
    v77.origin.x = rect[0];
    v77.origin.y = v9;
    v77.size.width = v11;
    v77.size.height = v13;
    v79.origin.x = v56;
    v79.origin.y = v61;
    v79.size.width = width;
    v79.size.height = height;
    v43 = CGRectContainsRect(v77, v79);
    if (v43)
    {
      v43 = -[UICalloutBar rectClear:](self, "rectClear:", v56, v61, width, height);
      if (v43)
      {
        self->m_controlFrame.origin.x = v56;
        self->m_controlFrame.origin.y = v61;
        self->m_controlFrame.size.width = width;
        self->m_controlFrame.size.height = height;
        v62 = round(width * 0.5 + v56);
        self->m_pointBelowControls.x = v62;
        self->m_pointBelowControls.y = round(height + v61);
        self->m_pointAboveControls.x = v62;
        self->m_pointAboveControls.y = round(v61) + -9.0;
        if (-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement")
          && CGRectIsNull(self->m_supressesHorizontalMovementFrame))
        {
          self->m_supressesHorizontalMovementFrame.origin.x = v56;
          self->m_supressesHorizontalMovementFrame.origin.y = v61;
          self->m_supressesHorizontalMovementFrame.size.width = width;
          self->m_supressesHorizontalMovementFrame.size.height = height;
          self->m_supressedHorizontalMovementX = v65;
        }
        LOBYTE(v43) = 1;
      }
    }
  }
  return v43;
}

- (void)updateAvailableButtons
{
  double v3;
  double v4;
  NSString *v5;
  NSString *m_untruncatedString;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSArray *obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[7];
  _QWORD v50[4];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray enumerateObjectsUsingBlock:](self->m_currentSystemButtons, "enumerateObjectsUsingBlock:", &__block_literal_global_406);
  -[NSMutableArray removeAllObjects](self->m_currentSystemButtons, "removeAllObjects");
  -[NSMutableArray enumerateObjectsUsingBlock:](self->m_extraButtons, "enumerateObjectsUsingBlock:", &__block_literal_global_407);
  -[NSMutableArray removeAllObjects](self->m_extraButtons, "removeAllObjects");
  -[UIView setHidden:](self->m_previousButton, "setHidden:", 1);
  -[UICalloutBarButton setHighlighted:](self->m_previousButton, "setHighlighted:", 0);
  -[UIView setHidden:](self->m_nextButton, "setHidden:", 1);
  -[UICalloutBarButton setHighlighted:](self->m_nextButton, "setHighlighted:", 0);
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v4 = v3;
  if (-[NSString length](self->m_untruncatedString, "length"))
  {
    v5 = self->m_untruncatedString;
    m_untruncatedString = self->m_untruncatedString;
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString componentsSeparatedByCharactersInSet:](m_untruncatedString, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (NSString *)v9;
    }
    +[UICalloutBarButton buttonWithTitle:subtitle:maxWidth:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:subtitle:maxWidth:action:type:inView:visualStyle:", v5, v11, 0, 7, self->m_buttonView, self->m_visualStyle, v4 + -20.0 + -34.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);
    objc_msgSend(v13, "setEnabled:", 0);
    -[NSMutableArray addObject:](self->m_extraButtons, "addObject:", v13);

  }
  else if (-[UICalloutBar hasReplacements](self, "hasReplacements"))
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__UICalloutBar_updateAvailableButtons__block_invoke_3;
    aBlock[3] = &unk_1E16C8BF0;
    aBlock[4] = self;
    aBlock[5] = v50;
    *(double *)&aBlock[6] = v4 + -20.0;
    v12 = _Block_copy(aBlock);
    -[NSArray enumerateObjectsUsingBlock:](self->m_replacements, "enumerateObjectsUsingBlock:", v12);

    _Block_object_dispose(v50, 8);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = self->m_systemButtonDescriptions;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v14)
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v15 = 0;
      v16 = *(_QWORD *)v46;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
          if ((v15 & 1) != 0
            && (char *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v17), "action") == sel__define_)
          {
            v15 = 1;
          }
          else
          {
            -[UICalloutBar _targetForAction:](self, "_targetForAction:", objc_msgSend(v18, "action", v37));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              if ((char *)objc_msgSend(v18, "action") == sel_captureTextFromCamera_)
              {
                v22 = v18;

                v23 = v19;
                v37 = -[NSMutableArray count](self->m_currentSystemButtons, "count");
                v38 = v23;
                v39 = v22;
              }
              else
              {
                objc_msgSend(v18, "materializeButtonInView:visualStyle:", self->m_buttonView, self->m_visualStyle);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setHidden:", 0);
                -[NSMutableArray addObject:](self->m_currentSystemButtons, "addObject:", v20);
                v21 = objc_msgSend(v18, "action") == (_QWORD)sel__lookup_;

                v15 |= v21;
              }
            }

          }
          ++v17;
        }
        while (v14 != v17);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        v14 = v24;
      }
      while (v24);
    }
    else
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = self->m_extraItems;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[UICalloutBar _targetForAction:](self, "_targetForAction:", objc_msgSend(v29, "action", v37));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (!v31)
          {
            objc_msgSend(v29, "title");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[UICalloutBarButton buttonWithTitle:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:action:type:inView:visualStyle:", v32, objc_msgSend(v29, "action"), 6, self->m_buttonView, self->m_visualStyle);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "setDontDismiss:", objc_msgSend(v29, "dontDismiss"));
            -[NSMutableArray addObject:](self->m_extraButtons, "addObject:", v33);

          }
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v26);
    }

    if (v39 && v38)
    {
      v34 = -[NSMutableArray count](self->m_currentSystemButtons, "count");
      if (v34 + -[NSMutableArray count](self->m_extraButtons, "count"))
      {
        objc_msgSend(v39, "setTitle:", 0);
      }
      else
      {
        +[UIAction _textFromCameraTitleForResponder:](UIAction, "_textFromCameraTitleForResponder:", v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setTitle:", v35);

      }
      objc_msgSend(v39, "materializeButtonInView:visualStyle:", self->m_buttonView, self->m_visualStyle, v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 0);
      -[NSMutableArray insertObject:atIndex:](self->m_currentSystemButtons, "insertObject:atIndex:", v36, v37);

    }
  }
  -[UIView setNeedsLayout](self->m_overlay, "setNeedsLayout", v37);
}

uint64_t __38__UICalloutBar_updateAvailableButtons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

uint64_t __38__UICalloutBar_updateAvailableButtons__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __38__UICalloutBar_updateAvailableButtons__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  double v11;
  id v12;

  v6 = a2;
  objc_msgSend(v6, "menuTitle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replacementText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E16EDF20);
  v9 = objc_msgSend(v6, "_isNoReplacementsFoundItem");
  +[UICalloutBarButton buttonWithTitle:action:type:inView:visualStyle:](UICalloutBarButton, "buttonWithTitle:action:type:inView:visualStyle:", v12, sel_replace_, 4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 816), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 832));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextReplacement:", v6);

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 785)
    || (objc_msgSend(v10, "contentWidth"),
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 24),
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < *(double *)(a1 + 48)))
  {
    objc_msgSend(v10, "setHidden:", 0);
    objc_msgSend(v10, "setEnabled:", (v9 | v8) ^ 1u);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "addObject:", v10);
  }
  else
  {
    *a4 = 1;
  }

}

- (BOOL)setFrameForSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  BOOL v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  CGRect v20;
  CGRect v21;

  height = a3.height;
  width = a3.width;
  if (!self->m_targetHorizontal)
  {
    if ((!-[UICalloutBar arrowDirection](self, "arrowDirection")
       || -[UICalloutBar arrowDirection](self, "arrowDirection") == 2)
      && -[UICalloutBar calculateControlFrameForCalloutSize:below:](self, "calculateControlFrameForCalloutSize:below:", 1, width, height))
    {
      goto LABEL_23;
    }
    if (!self->m_targetHorizontal)
    {
      if ((!-[UICalloutBar arrowDirection](self, "arrowDirection")
         || -[UICalloutBar arrowDirection](self, "arrowDirection") == 1)
        && -[UICalloutBar calculateControlFrameForCalloutSize:below:](self, "calculateControlFrameForCalloutSize:below:", 0, width, height))
      {
        v6 = 1;
        goto LABEL_24;
      }
      if (!self->m_targetHorizontal)
      {
LABEL_20:
        if (!-[UICalloutBar calculateControlFrameInsideTargetRect:](self, "calculateControlFrameInsideTargetRect:", width, height))goto LABEL_25;
        if (-[UICalloutBar arrowDirection](self, "arrowDirection"))
        {
          v6 = -[UICalloutBar arrowDirection](self, "arrowDirection");
          goto LABEL_24;
        }
LABEL_23:
        v6 = 2;
        goto LABEL_24;
      }
    }
  }
  if (-[UICalloutBar arrowDirection](self, "arrowDirection")
    && -[UICalloutBar arrowDirection](self, "arrowDirection") != 4
    || !-[UICalloutBar calculateControlFrameForCalloutSize:right:](self, "calculateControlFrameForCalloutSize:right:", 1, width, height))
  {
    if (self->m_targetHorizontal
      && (!-[UICalloutBar arrowDirection](self, "arrowDirection")
       || -[UICalloutBar arrowDirection](self, "arrowDirection") == 3)
      && -[UICalloutBar calculateControlFrameForCalloutSize:right:](self, "calculateControlFrameForCalloutSize:right:", 0, width, height))
    {
      v6 = 3;
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  v6 = 4;
LABEL_24:
  -[UICalloutBar setTargetDirection:](self, "setTargetDirection:", v6);
LABEL_25:
  v7 = CGRectEqualToRect(self->m_controlFrame, *MEMORY[0x1E0C9D648]);
  if (!v7)
  {
    -[UICalloutBar controlFrame](self, "controlFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[UICalloutBar targetDirection](self, "targetDirection");
    if ((v16 - 3) >= 2)
    {
      if (v16 == 1)
      {
        -[UICalloutBar pointAboveControls](self, "pointAboveControls");
        -[UICalloutBar setTargetPoint:](self, "setTargetPoint:");
        -[UICalloutBar targetPoint](self, "targetPoint");
        v15 = v15 + v11 - v17 + 9.0;
        -[UICalloutBar targetPoint](self, "targetPoint");
        v11 = v18;
        goto LABEL_32;
      }
      if (v16 != 2)
      {
LABEL_32:
        v20.origin.x = v9;
        v20.origin.y = v11;
        v20.size.width = v13;
        v20.size.height = v15;
        v21 = CGRectIntegral(v20);
        -[UIView setFrame:](self, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
        return !v7;
      }
      -[UICalloutBar pointBelowControls](self, "pointBelowControls");
      -[UICalloutBar setTargetPoint:](self, "setTargetPoint:");
    }
    v15 = v15 + 9.0;
    goto LABEL_32;
  }
  return !v7;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  UIStackView *m_verticalStackView;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  if (a5 && self->m_isDisplayingVertically)
  {
    y = a5->y;
    m_verticalStackView = self->m_verticalStackView;
    -[_UICalloutBarVisualStyle buttonMetrics](self->m_visualStyle, "buttonMetrics", a3, a4.x, a4.y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "height");
    -[UIView hitTest:forEvent:](m_verticalStackView, "hitTest:forEvent:", 0, 0.0, y + v9 * 0.5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "frameOrigin");
    v11 = v10 + -7.0;
    if (v10 <= 0.0)
      v11 = v10;
    a5->y = v11;

  }
}

- (void)scrollableButtonTouchDown:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->m_isDisplayingVertically)
  {
    v4 = v14;
    -[UIScrollView contentOffset](self->m_verticalScrollView, "contentOffset");
    v6 = v5;
    objc_msgSend(v4, "frame");
    v8 = v7;
    objc_msgSend(v4, "frame");
    v10 = v9;
    objc_msgSend(v4, "size");
    v12 = v11;
    -[UIView size](self->m_verticalScrollView, "size");
    if (v8 < v6 || (v8 = v10 + v12 - v13, v8 > v6))
    {
      -[UIScrollView setContentOffset:animated:](self->m_verticalScrollView, "setContentOffset:animated:", 1, 0.0, v8);
      objc_msgSend(v4, "cancelTrackingWithEvent:", 0);
    }

  }
}

- (void)configureButtonsForVerticalView:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  UIScrollView *v39;
  UIScrollView *m_verticalScrollView;
  void *v41;
  double v42;
  double v43;
  void *v44;
  UIStackView *m_verticalStackView;
  unint64_t v46;
  UIStackView *v47;
  UIStackView *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  double height;
  double v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  BOOL v83;
  void *v84;
  int v85;
  UIView *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double Width;
  double v100;
  double v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  uint64_t k;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  uint64_t v113;
  double v114;
  double v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v131 = *MEMORY[0x1E0C80C00];
  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICalloutBarVisualStyle buttonMetrics](self->m_visualStyle, "buttonMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "height");
  if (v7 >= a3 + 36.0)
    v8 = v7;
  else
    v8 = a3 + 36.0;
  objc_msgSend(v5, "verticalPadding");
  v10 = v9;
  objc_msgSend(v5, "horizontalPadding");
  v12 = v11;
  v110 = v5;
  objc_msgSend(v5, "interitemPadding");
  v14 = v13;
  objc_msgSend(v6, "horizontalPadding");
  v112 = v15;
  objc_msgSend(v6, "imageWidth");
  v115 = v16;
  v109 = v6;
  objc_msgSend(v6, "minimumTitleAndImageSpacing");
  v114 = v17;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v18 = self->m_currentSystemButtons;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v124, v130, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v125;
    v22 = 0.0;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v125 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
        objc_msgSend(v24, "contentWidth");
        if (v25 > v22)
        {
          objc_msgSend(v24, "contentWidth");
          v22 = v26;
        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v124, v130, 16);
    }
    while (v20);
  }
  else
  {
    v22 = 0.0;
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v27 = self->m_extraButtons;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v121;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v121 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
        objc_msgSend(v32, "contentWidth");
        if (v33 > v22)
        {
          objc_msgSend(v32, "contentWidth");
          v22 = v34;
        }
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    }
    while (v29);
  }

  if (-[UICalloutBar arrowDirection](self, "arrowDirection") == 3
    || (v35 = 0.0, -[UICalloutBar arrowDirection](self, "arrowDirection") == 4))
  {
    v35 = 9.0;
  }
  -[UIView size](self, "size");
  if (v22 >= v36)
    v37 = v36;
  else
    v37 = v22;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", self->m_currentSystemButtons);
  objc_msgSend(v38, "addObjectsFromArray:", self->m_extraButtons);
  -[_UICalloutBarVisualStyle updateCalloutBar:withContentButtons:](self->m_visualStyle, "updateCalloutBar:withContentButtons:", self, v38);
  if (!self->m_verticalScrollView)
  {
    v39 = objc_alloc_init(UIScrollView);
    m_verticalScrollView = self->m_verticalScrollView;
    self->m_verticalScrollView = v39;

    -[UIScrollView setShowsVerticalScrollIndicator:](self->m_verticalScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cornerRadius");
    v43 = v42;
    -[UIView layer](self->m_verticalScrollView, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerRadius:", v43);

    -[UIScrollView setDelegate:](self->m_verticalScrollView, "setDelegate:", self);
  }
  m_verticalStackView = self->m_verticalStackView;
  v46 = 0x1E0D15000uLL;
  if (!m_verticalStackView)
  {
    v47 = objc_alloc_init(UIStackView);
    v48 = self->m_verticalStackView;
    self->m_verticalStackView = v47;

    -[UIView addSubview:](self->m_verticalScrollView, "addSubview:", self->m_verticalStackView);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->m_verticalStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->m_verticalStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](self->m_verticalStackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](self->m_verticalStackView, "setSpacing:", v14);
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView topAnchor](self->m_verticalStackView, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->m_verticalScrollView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v10);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v52);

    -[UIView bottomAnchor](self->m_verticalStackView, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->m_verticalScrollView, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v10);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v55);

    -[UIView centerXAnchor](self->m_verticalStackView, "centerXAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->m_verticalScrollView, "centerXAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v58);

    -[UIView widthAnchor](self->m_verticalStackView, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView widthAnchor](self->m_verticalScrollView, "widthAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, v12 * -2.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v61);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v49);
    m_verticalStackView = self->m_verticalStackView;
  }
  -[UIView subviews](m_verticalStackView, "subviews");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  height = self->m_controlFrame.size.height;
  v65 = v10 + v10;
  v66 = objc_msgSend(v38, "count");
  v111 = v35;
  if (v66)
  {
    v67 = 0;
    v68 = 0;
    v69 = v37 - v35 + -17.0;
    v70 = v112 + v112;
    v113 = v66 - 1;
    v71 = 0.0;
    while (1)
    {
      objc_msgSend(v38, "objectAtIndex:", v68);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStackView addArrangedSubview:](self->m_verticalStackView, "addArrangedSubview:", v72);
      objc_msgSend(v72, "setHidden:", 0);
      objc_msgSend(v72, "addTarget:action:forControlEvents:", self, sel_scrollableButtonTouchDown_, 1);
      objc_msgSend(v72, "setContentHorizontalAlignment:", 1);
      objc_msgSend(v72, "setContentEdgeInsets:", 0.0, 8.0, 0.0, 8.0);
      objc_msgSend(v72, "configureForVerticalPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
      objc_msgSend(v72, "titleLabel");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "sizeThatFits:", v69, 0.0);
      v75 = v74;

      if (v115 + v114 + v70 + v75 + 16.0 >= v71)
        v71 = v115 + v114 + v70 + v75 + 16.0;
      objc_msgSend(v72, "widthAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->m_verticalStackView, "widthAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addObject:", v78);

      objc_msgSend(v72, "heightAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToConstant:", v8);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addObject:", v80);

      v81 = v8 + v65;
      if (v65 + 14.0 <= height)
        v82 = 0.0;
      else
        v82 = v8;
      v83 = v81 >= height;
      if (v81 >= height)
        v81 = v65 + 14.0 - v82;
      if ((v67 & 1) == 0)
        v65 = v81;
      if (v113 == v68)
        break;
      v67 |= v83;
      -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "displaySeparators");

      if (v85)
      {
        v86 = objc_alloc_init(UIView);
        -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "separatorColor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v86, "setBackgroundColor:", v88);

        -[UIStackView addArrangedSubview:](self->m_verticalStackView, "addArrangedSubview:", v86);
        -[UIView widthAnchor](v86, "widthAnchor");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView widthAnchor](self->m_verticalStackView, "widthAnchor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "constraintEqualToAnchor:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addObject:", v91);

        -[UIView heightAnchor](v86, "heightAnchor");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "constraintEqualToConstant:", 1.0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addObject:", v93);

        v94 = 1.0;
        if ((v67 & 1) != 0)
          v94 = 0.0;
        v65 = v65 + v94;

      }
      ++v68;
    }

    v35 = v111;
    v46 = 0x1E0D15000;
  }
  else
  {
    v71 = 0.0;
  }
  objc_msgSend(*(id *)(v46 + 1760), "activateConstraints:", v63);
  v95 = v35 + v71;
  v96 = v12 + v12;
  v97 = v12 + v12 + v95;
  -[UICalloutBar controlFrame](self, "controlFrame");
  if (v97 >= v98)
    v97 = v98;
  -[UICalloutBar setFrameForSize:](self, "setFrameForSize:", v97, v65);
  -[UIView frame](self, "frame");
  Width = CGRectGetWidth(v132);
  UIRoundToScale(v97 / v71, 10.0);
  v101 = v100;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v102 = v38;
  v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  if (v103)
  {
    v104 = v103;
    v105 = *(_QWORD *)v117;
    v106 = Width - v96;
    do
    {
      for (k = 0; k != v104; ++k)
      {
        if (*(_QWORD *)v117 != v105)
          objc_enumerationMutation(v102);
        v108 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * k);
        if (v101 < 1.0)
          objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * k), "setContentScale:", v101);
        if (objc_msgSend(v108, "isSecurePasteButton"))
          objc_msgSend(v108, "configureSecurePasteButtonWithWidth:height:", v106, v8);
      }
      v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
    }
    while (v104);
  }

  -[UICalloutBar controlFrame](self, "controlFrame");
  v134 = CGRectIntegral(v133);
  if (-[UICalloutBar targetDirection](self, "targetDirection", v134.origin.x, v134.origin.y) != 1
    && -[UICalloutBar targetDirection](self, "targetDirection") != 3)
  {
    -[UICalloutBar targetDirection](self, "targetDirection");
  }
  -[UIScrollView setFrame:](self->m_verticalScrollView, "setFrame:");
  -[UIView addSubview:](self, "addSubview:", self->m_verticalScrollView);

}

- (void)configureButtons:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double y;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  NSMutableArray *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  double v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t n;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  int v68;
  char v69;
  double v70;
  double v71;
  CGFloat v72;
  void *v73;
  double v74;
  CGFloat x;
  CGFloat v76;
  CGFloat width;
  CGFloat height;
  double v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  int v87;
  double v88;
  double v89;
  _BOOL4 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  uint64_t v107;
  double MinX;
  _BOOL4 v112;
  double v113;
  CGFloat v114;
  double v115;
  double v116;
  uint64_t m_pageCount;
  double v118;
  int *v119;
  void *v120;
  int *v121;
  id v122;
  id v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  int *v130;
  double v131;
  double v132;
  uint64_t v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGFloat v142;
  double v143;
  double v144;
  double v145;
  double v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;

  v172 = *MEMORY[0x1E0C80C00];
  -[UIScrollView removeFromSuperview](self->m_verticalScrollView, "removeFromSuperview");
  v5 = a3 + 36.0;
  if (-[UICalloutBar targetDirection](self, "targetDirection") == 1)
  {
    -[UICalloutBar targetPoint](self, "targetPoint");
    v7 = v6;
    -[UIView frame](self, "frame");
    v5 = v5 + v7 - v8;
  }
  v9 = 0.0;
  if (-[UICalloutBar targetDirection](self, "targetDirection") == 2)
  {
    y = self->m_controlFrame.origin.y;
    -[UIView frame](self, "frame");
    v9 = y - v11;
  }
  v142 = v9;
  if (-[UICalloutBar targetDirection](self, "targetDirection") != 2)
  {
    -[UIView bounds](self, "bounds");
    v9 = v12 - v5 + -9.0;
  }
  v13 = 0.0;
  if (-[UICalloutBar arrowDirection](self, "arrowDirection") == 3)
    v14 = 5.0;
  else
    v14 = 0.0;
  v138 = v14;
  if (-[UICalloutBar arrowDirection](self, "arrowDirection") == 4)
    v13 = 5.0;
  -[UIView bounds](self, "bounds");
  v16 = v15;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v18 = v17;
  v19 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView bounds](self, "bounds");
  v173.origin.x = 0.0;
  v173.origin.y = v9;
  v173.size.height = v5;
  v174 = CGRectIntegral(v173);
  -[UIView setFrame:](self->m_buttonView, "setFrame:", v174.origin.x, v174.origin.y, v174.size.width, v174.size.height);
  if (self->m_pageCount >= 1)
  {
    v20 = 0;
    v21 = v138;
    v22 = v16 - v138 - v13;
    if (v19)
      v23 = v13;
    else
      v23 = v138;
    v143 = v23;
    v136 = v13;
    v137 = v22;
    if (!v19)
      v21 = v13;
    v139 = 1.0 / v18;
    v140 = v21;
    while (1)
    {
      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      v24 = self->m_currentSystemButtons;
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v163, v171, 16);
      v26 = 0.0;
      if (v25)
      {
        v27 = v25;
        v28 = *(_QWORD *)v164;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v164 != v28)
              objc_enumerationMutation(v24);
            v30 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
            if (objc_msgSend(v30, "page") == v20)
            {
              objc_msgSend(v30, "contentWidth");
              v26 = v26 + v31 + -8.0;
            }
          }
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v163, v171, 16);
        }
        while (v27);
      }

      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      v32 = self->m_extraButtons;
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v159, v170, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v160;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v160 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * j);
            if (objc_msgSend(v37, "page") == v20)
            {
              objc_msgSend(v37, "contentWidth");
              v26 = v26 + v38 + -8.0;
            }
          }
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v159, v170, 16);
        }
        while (v34);
      }

      if (v26 == 0.0)
        goto LABEL_122;
      v39 = v22;
      if (self->m_pageCount >= 2)
      {
        -[UICalloutBarButton contentWidth](self->m_nextButton, "contentWidth");
        v39 = v22 - v40;
      }
      if (v20)
      {
        -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
        v39 = v39 - v41;
      }
      UIRoundToScale(v39 / v26, 10.0);
      v43 = v42;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = 0u;
      v156 = 0u;
      v157 = 0u;
      v158 = 0u;
      v45 = self->m_currentSystemButtons;
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v156;
        do
        {
          for (k = 0; k != v47; ++k)
          {
            if (*(_QWORD *)v156 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * k);
            if (objc_msgSend(v50, "page") == v20)
              objc_msgSend(v44, "addObject:", v50);
          }
          v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v155, v169, 16);
        }
        while (v47);
      }

      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      v51 = self->m_extraButtons;
      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v152;
        do
        {
          for (m = 0; m != v53; ++m)
          {
            if (*(_QWORD *)v152 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * m);
            if (objc_msgSend(v56, "page") == v20)
              objc_msgSend(v44, "addObject:", v56);
          }
          v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
        }
        while (v53);
      }

      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v57 = v44;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v148;
        v61 = 0.0;
        do
        {
          for (n = 0; n != v59; ++n)
          {
            if (*(_QWORD *)v148 != v60)
              objc_enumerationMutation(v57);
            objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * n), "contentWidth");
            v61 = v61 + v63;
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v147, v167, 16);
        }
        while (v59);
      }
      else
      {
        v61 = 0.0;
      }

      v64 = v22;
      if (self->m_pageCount >= 2)
      {
        -[UICalloutBarButton contentWidth](self->m_nextButton, "contentWidth");
        v64 = v22 - v65;
      }
      if (v20)
      {
        -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
        v64 = v64 - v66;
      }
      v67 = v64 / v61;
      if (v61 <= 0.0)
        v67 = 1.0;
      v145 = v67;
      v68 = objc_msgSend(v57, "count");
      if (v20)
        v69 = v19;
      else
        v69 = 1;
      v70 = 0.0;
      if ((v69 & 1) == 0)
      {
        -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
        v70 = v138 + v71;
      }
      v146 = fmin(v43, 1.0);
      if (v68 == 1)
      {
        v72 = v142;
        if (self->m_pageCount != 1)
          break;
        objc_msgSend(v57, "lastObject");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "contentWidth");
        v175.size.width = round(v136 + v138 + v145 * v74);
        v175.origin.x = v70;
        v175.origin.y = v142;
        v175.size.height = v5;
        v176 = CGRectIntegral(v175);
        x = v176.origin.x;
        v76 = v176.origin.y;
        width = v176.size.width;
        height = v176.size.height;
        objc_msgSend(v73, "setFrame:");
        objc_msgSend(v73, "setContentScale:", v146);
        objc_msgSend(v73, "setContentHorizontalAlignment:", 0);
        objc_msgSend(v73, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
        objc_msgSend(v73, "configureForSingle:", -[UICalloutBar targetDirection](self, "targetDirection"));
        if (objc_msgSend(v73, "isSecurePasteButton"))
        {
          v177.origin.x = x;
          v177.origin.y = v76;
          v177.size.width = width;
          v177.size.height = height;
          v79 = CGRectGetWidth(v177);
          v178.origin.x = x;
          v178.origin.y = v76;
          v178.size.width = width;
          v178.size.height = height;
          objc_msgSend(v73, "configureSecurePasteButtonWithWidth:height:", v79, CGRectGetHeight(v178));
        }

        goto LABEL_121;
      }
      v72 = v142;
      if (v68 >= 1)
        break;
LABEL_121:

      v22 = v137;
LABEL_122:
      ++v20;
      m_pageCount = self->m_pageCount;
      if (v20 >= m_pageCount)
      {
        v118 = v136;
        if ((int)m_pageCount > 1)
        {
          if (v19)
            v119 = &OBJC_IVAR___UICalloutBar_m_nextButton;
          else
            v119 = &OBJC_IVAR___UICalloutBar_m_previousButton;
          v120 = *(Class *)((char *)&self->super.super.super.isa + *v119);
          if (v19)
            v121 = &OBJC_IVAR___UICalloutBar_m_previousButton;
          else
            v121 = &OBJC_IVAR___UICalloutBar_m_nextButton;
          v122 = v120;
          v123 = *(id *)((char *)&self->super.super.super.isa + *v121);
          objc_msgSend(v122, "configureForLeftPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
          objc_msgSend(v123, "configureForRightPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
          -[UIView bounds](self, "bounds");
          v125 = v124;
          if (v19)
          {
            -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
            v127 = v125 - v126 - v136;
            v128 = 0.0;
            v129 = v138;
            v130 = &OBJC_IVAR____UIFocusMapSnapshot__regionToFocusItemCache;
          }
          else
          {
            v130 = &OBJC_IVAR____UIFocusMapSnapshot__regionToFocusItemCache;
            -[UICalloutBarButton contentWidth](self->m_nextButton, "contentWidth");
            v128 = v125 - v131 - v136;
            v127 = 0.0;
            v129 = v136;
            v118 = v138;
          }
          -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
          v182.size.width = v118 + v132;
          v182.origin.x = v127;
          v182.origin.y = v142;
          v182.size.height = v5;
          v183 = CGRectIntegral(v182);
          -[UIButton setFrame:](self->m_previousButton, "setFrame:", v183.origin.x, v183.origin.y, v183.size.width, v183.size.height);
          v133 = v130[676];
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v133), "contentWidth");
          v184.size.width = v129 + v134;
          v184.origin.x = v128;
          v184.origin.y = v142;
          v184.size.height = v5;
          v185 = CGRectIntegral(v184);
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v133), "setFrame:", v185.origin.x, v185.origin.y, v185.size.width, v185.size.height);
          if (!v19)
          {
            -[UICalloutBarButton contentWidth](self->m_previousButton, "contentWidth");
            v127 = v138 + v135 - v139;
          }
          -[UICalloutBarButton setDividerOffset:](self->m_previousButton, "setDividerOffset:", v127);

        }
        return;
      }
    }
    v80 = 0;
    v144 = (v64 - v61) / (double)v68;
    v81 = (v68 - 1);
    v141 = v136 + v138 + v39;
    v82 = v68;
    while (1)
    {
      objc_msgSend(v57, "objectAtIndex:", v80);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "contentWidth");
      v85 = v144 + v84;
      v86 = v145 * v84;
      if (v146 >= 1.0)
        v86 = v85;
      if (v81 == v80)
      {
        v87 = self->m_pageCount;
        v88 = -0.0;
        v89 = v143;
        if (v80 | v20)
          v89 = -0.0;
        v90 = v87 < 2;
        v91 = v89 + v86;
        if (v87 < 2)
          v88 = v140;
        v92 = v91 + v88;
      }
      else
      {
        v90 = 0;
        v93 = -0.0;
        if (!(v80 | v20))
          v93 = v143;
        v92 = v93 + v86;
      }
      v94 = v70 + v92;
      v95 = round(v70 + v92);
      v96 = round(v70);
      v97 = v95 - v96;
      if (v19)
      {
        v98 = 0.0;
        if (self->m_pageCount >= 2)
          -[UICalloutBarButton contentWidth](self->m_nextButton, "contentWidth", 0.0);
        v96 = round(v141 - v70 - v97 + v98);
      }
      v99 = v72;
      v100 = v97;
      v101 = v5;
      v179 = CGRectIntegral(*(CGRect *)&v96);
      v102 = v179.origin.x;
      v103 = v179.origin.y;
      v104 = v179.size.width;
      v105 = v179.size.height;
      objc_msgSend(v83, "setFrame:");
      objc_msgSend(v83, "setContentScale:", v146);
      objc_msgSend(v83, "setContentHorizontalAlignment:", 0);
      objc_msgSend(v83, "setContentEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
      if (v19 ? v90 : (v80 | v20) == 0)
        break;
      if (v19)
        v112 = (v80 | v20) == 0;
      else
        v112 = v90;
      if (!v112)
      {
        objc_msgSend(v83, "configureForMiddlePosition");
        goto LABEL_107;
      }
      objc_msgSend(v83, "configureForRightPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
      MinX = 0.0;
      if (v19)
      {
        objc_msgSend(v83, "frame", 0.0);
LABEL_115:
        MinX = CGRectGetMinX(*(CGRect *)&v107);
      }
LABEL_116:
      objc_msgSend(v83, "setDividerOffset:", MinX);
      if (objc_msgSend(v83, "isSecurePasteButton"))
      {
        v180.origin.x = v102;
        v180.origin.y = v103;
        v180.size.width = v104;
        v180.size.height = v105;
        v113 = v5;
        v114 = CGRectGetWidth(v180);
        v181.origin.x = v102;
        v181.origin.y = v103;
        v181.size.width = v104;
        v181.size.height = v105;
        v115 = CGRectGetHeight(v181);
        v116 = v114;
        v5 = v113;
        v72 = v142;
        objc_msgSend(v83, "configureSecurePasteButtonWithWidth:height:", v116, v115);
      }

      ++v80;
      v70 = v94;
      if (v82 == v80)
        goto LABEL_121;
    }
    objc_msgSend(v83, "configureForLeftPosition:", -[UICalloutBar targetDirection](self, "targetDirection"));
LABEL_107:
    objc_msgSend(v83, "frame");
    if (v19)
      goto LABEL_115;
    MinX = CGRectGetMaxX(*(CGRect *)&v107) - v139;
    goto LABEL_116;
  }
}

- (void)updateForCurrentPage
{
  if (-[NSMutableArray count](self->m_separatorViews, "count"))
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->m_separatorViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->m_separatorViews, "removeAllObjects");
  }
  if (self->m_isDisplayingVertically)
    -[UICalloutBar updateForCurrentVerticalPage](self, "updateForCurrentVerticalPage");
  else
    -[UICalloutBar updateForCurrentHorizontalPage](self, "updateForCurrentHorizontalPage");
}

- (void)updateForCurrentHorizontalPage
{
  void *v3;
  NSString *v4;
  _BOOL8 IsAccessibilityCategory;
  int v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = self->m_pageCount - 1;
  if (v6 >= (self->m_currentPage & ~(self->m_currentPage >> 31)))
    v6 = self->m_currentPage & ~(self->m_currentPage >> 31);
  self->m_currentPage = v6;
  -[UIView setHidden:](self->m_previousButton, "setHidden:", v6 == 0);
  if (!-[UIView isHidden](self->m_previousButton, "isHidden"))
    -[UICalloutBar addVerticalSeparatorAfterButton:usingLargeText:](self, "addVerticalSeparatorAfterButton:usingLargeText:", self->m_previousButton, IsAccessibilityCategory);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->m_currentSystemButtons;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "setHidden:", objc_msgSend(v12, "page") != self->m_currentPage);
        if ((objc_msgSend(v12, "isHidden") & 1) == 0)
          -[UICalloutBar addVerticalSeparatorAfterButton:usingLargeText:](self, "addVerticalSeparatorAfterButton:usingLargeText:", v12, IsAccessibilityCategory);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->m_extraButtons;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        objc_msgSend(v18, "setHidden:", objc_msgSend(v18, "page", (_QWORD)v19) != self->m_currentPage);
        if ((objc_msgSend(v18, "isHidden") & 1) == 0)
          -[UICalloutBar addVerticalSeparatorAfterButton:usingLargeText:](self, "addVerticalSeparatorAfterButton:usingLargeText:", v18, IsAccessibilityCategory);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  -[UIView setHidden:](self->m_nextButton, "setHidden:", self->m_pageCount < 2);
  -[UICalloutBarButton setHighlighted:](self->m_previousButton, "setHighlighted:", 0);
  -[UICalloutBarButton setHighlighted:](self->m_nextButton, "setHighlighted:", 0);
  -[UIButton setEnabled:](self->m_nextButton, "setEnabled:", self->m_currentPage < self->m_pageCount - 1);
}

- (void)updateForCurrentVerticalPage
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->m_currentSystemButtons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "setHidden:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->m_extraButtons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setHidden:", 0, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (void)addVerticalSeparatorAfterButton:(id)a3 usingLargeText:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UICalloutBarButton *v10;
  BOOL v11;
  double v12;
  double v13;
  double MinY;
  double v15;
  double v16;
  UIView *v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  UICalloutBarButton *v21;
  CGRect v22;
  CGRect v23;

  v4 = a4;
  v21 = (UICalloutBarButton *)a3;
  v6 = -[NSMutableArray count](self->m_currentSystemButtons, "count");
  v7 = -[NSMutableArray count](self->m_extraButtons, "count");
  v8 = -[NSMutableArray indexOfObject:](self->m_currentSystemButtons, "indexOfObject:", v21);
  v9 = -[NSMutableArray indexOfObject:](self->m_extraButtons, "indexOfObject:", v21);
  v10 = v21;
  if (self->m_previousButton == v21
    || (v11 = -[UICalloutBarButton page](v21, "page") <= 0, v10 = v21, !v11)
    || v8 != 0x7FFFFFFFFFFFFFFFLL && (v8 + 1 >= v6 ? (v19 = v7 == 0) : (v19 = 0), !v19)
    || (v9 != 0x7FFFFFFFFFFFFFFFLL ? (v20 = v9 + 1 >= v7) : (v20 = 1), !v20))
  {
    -[UICalloutBarButton dividerOffset](v10, "dividerOffset");
    v13 = v12;
    -[UIView frame](v21, "frame");
    MinY = CGRectGetMinY(v22);
    v15 = 1.0;
    if (!v4)
    {
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v15 = 1.0 / v16;
    }
    -[UIView frame](v21, "frame");
    v17 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, MinY, v15, CGRectGetHeight(v23));
    if (v4)
      +[UIColor whiteColor](UIColor, "whiteColor");
    else
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5569, 0.5569, 0.5765, 0.75);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UIView insertSubview:atIndex:](self->m_buttonView, "insertSubview:atIndex:", v17, 0);
    -[NSMutableArray addObject:](self->m_separatorViews, "addObject:", v17);

    v10 = v21;
  }

}

- (void)adjustFrameToAvoidDividerOnArrow
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  double v29;
  double v30;
  double x;
  double v32;
  double v33;
  double v34;
  double m_availableSpaceOnRight;
  double m_availableSpaceOnLeft;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (-[UICalloutBar targetDirection](self, "targetDirection") != 3
    && -[UICalloutBar targetDirection](self, "targetDirection") != 4
    && !self->m_currentPage
    && !-[UICalloutBar supressesHorizontalMovement](self, "supressesHorizontalMovement"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v4 = self->m_currentSystemButtons;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v53 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (!objc_msgSend(v9, "page"))
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v6);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = self->m_extraButtons;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          if (!objc_msgSend(v15, "page"))
            objc_msgSend(v3, "addObject:", v15);
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v12);
    }

    -[UIView frame](self, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v24 = v3;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      while (2)
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "dividerOffset", (_QWORD)v44);
          if (v29 > 0.0)
          {
            v30 = v17 + v29;
            x = self->m_targetPoint.x;
            v32 = ceil(vabdd_f64(x, v17 + v29));
            if (v32 < 11.0)
            {
              v33 = 11.0 - v32;
              if (v30 >= x)
              {
                m_availableSpaceOnRight = self->m_availableSpaceOnRight;
                if (m_availableSpaceOnRight <= v33)
                {
                  m_availableSpaceOnLeft = self->m_availableSpaceOnLeft;
                  v37 = v32 + 11.0;
                  if (m_availableSpaceOnLeft <= v37)
                  {
                    v40 = m_availableSpaceOnLeft - v37;
                    v41 = -m_availableSpaceOnLeft;
                    if (v40 >= m_availableSpaceOnRight - v33)
                      v33 = self->m_availableSpaceOnRight;
                    else
                      v33 = v41;
                  }
                  else
                  {
                    v33 = -v37;
                  }
                }
              }
              else
              {
                v34 = self->m_availableSpaceOnLeft;
                if (v34 <= v33)
                {
                  v38 = self->m_availableSpaceOnRight;
                  v39 = v32 + 11.0;
                  if (v38 <= v39)
                  {
                    v42 = v34 - v33;
                    v43 = -v34;
                    if (v42 >= v38 - v39)
                      v33 = self->m_availableSpaceOnRight;
                    else
                      v33 = v43;
                  }
                  else
                  {
                    v33 = v39;
                  }
                }
                else
                {
                  v33 = -v33;
                }
              }
              if (v33 != 0.0)
              {
                -[UIView setFrame:](self, "setFrame:", v17 + v33, v19, v21, v23);
                self->m_controlFrame.origin.x = v33 + self->m_controlFrame.origin.x;
              }
              goto LABEL_49;
            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_49:

  }
}

- (BOOL)_updateVisibleItemsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  id v26;
  double v27;
  void *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double x;
  double y;
  double width;
  double height;
  double v42;
  void *v43;
  void *v44;
  int v45;
  _QWORD v47[5];
  _QWORD aBlock[10];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[5];
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t *v58;
  double v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];
  uint64_t v65;
  _QWORD v66[4];
  _QWORD v67[6];
  uint64_t v68;
  double *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;

  v3 = a3;
  v81 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1E0C809B0];
  if (!self->m_recalcVisibleItems)
    goto LABEL_39;
  -[UICalloutBar setTargetDirection:](self, "setTargetDirection:", 2);
  -[UICalloutBar setControlFrame:](self, "setControlFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  self->m_pageCount = 0;
  -[UICalloutBar updateAvailableButtons](self, "updateAvailableButtons");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v7 = self->m_currentSystemButtons;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v77 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isHidden") & 1) == 0)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "addObjectsFromArray:", self->m_extraButtons);
  v72 = 0;
  v73 = (double *)&v72;
  v74 = 0x2020000000;
  v75 = 0;
  -[UICalloutBar textEffectsWindowSafeArea](self, "textEffectsWindowSafeArea");
  v13 = v12;
  if (-[UICalloutBar arrowDirection](self, "arrowDirection") == 3
    || (v14 = 0.0, -[UICalloutBar arrowDirection](self, "arrowDirection") == 4))
  {
    v14 = 5.0;
  }
  if (-[UICalloutBar arrowDirection](self, "arrowDirection") == 3)
  {
    v15 = self->m_targetRect.origin.x + self->m_targetRect.size.width;
  }
  else
  {
    v16 = 0.0;
    if (-[UICalloutBar arrowDirection](self, "arrowDirection") != 4)
      goto LABEL_19;
    v15 = v13 - self->m_targetRect.origin.x;
  }
  v16 = fmin(v15, 120.0);
LABEL_19:
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _UISSlotContentSizeCategoryFromContentSizeCategory(v17);
  UISCalloutBarFontSize();
  v19 = v18;

  objc_msgSend(off_1E167A828, "systemFontOfSize:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lineHeight");
  v73[3] = v21 + 8.0 + -36.0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v22);
  *((_QWORD *)v73 + 3) = v23;

  v24 = fmin(v13 - v14 + -20.0 - v16, 768.0);
  v68 = 0;
  v69 = (double *)&v68;
  v70 = 0x2020000000;
  v71 = 0;
  v67[0] = v5;
  v67[1] = 3221225472;
  v67[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke;
  v67[3] = &unk_1E16B5D60;
  v67[4] = &v68;
  *(double *)&v67[5] = v24;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v67);
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v66[3] = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v65 = 0;
  v25 = 0;
  if (v69[3] > v24)
    -[UICalloutBarButton contentWidth](self->m_nextButton, "contentWidth", 0.0);
  v65 = v25;
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x2020000000;
  v63 = 0;
  v53[0] = v5;
  v53[1] = 3221225472;
  v53[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_2;
  v53[3] = &unk_1E16C8C18;
  v53[4] = self;
  v55 = v64;
  v56 = v66;
  v59 = v24;
  v26 = v6;
  v54 = v26;
  v57 = &v60;
  v58 = &v72;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v53);
  v27 = v61[3];
  if (v27 > v13 + -20.0 - v16)
    v27 = v13 + -20.0 - v16;
  v61[3] = v27;
  -[_UICalloutBarVisualStyle barMetrics](self->m_visualStyle, "barMetrics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->m_isDisplayingVertically = objc_msgSend(v28, "isVerticallyAligned");

  if (self->m_isDisplayingVertically && !-[NSMutableArray count](self->m_rectsToEvade, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
    objc_msgSend(WeakRetained, "_window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v32;

    objc_msgSend(v33, "windowScene");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "keyboardSceneDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "containerWindow");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(v33, "windowScene");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v35, "visibleFrameInView:", v36);
    x = v82.origin.x;
    y = v82.origin.y;
    width = v82.size.width;
    height = v82.size.height;
    if (!CGRectIsEmpty(v82))
      -[UICalloutBar addRectToEvade:](self, "addRectToEvade:", x, y, width, height);

  }
  v42 = v73[3] + 36.0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_3;
  aBlock[3] = &unk_1E16C8C40;
  aBlock[4] = self;
  aBlock[5] = &v60;
  *(double *)&aBlock[8] = v14;
  *(double *)&aBlock[9] = v42;
  aBlock[6] = &v72;
  aBlock[7] = &v49;
  v43 = _Block_copy(aBlock);
  v44 = v43;
  if (v3)
    (*((void (**)(void *))v43 + 2))(v43);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v43);
  v45 = *((unsigned __int8 *)v50 + 24);
  if (*((_BYTE *)v50 + 24))
  {
    -[UICalloutBar adjustFrameToAvoidDividerOnArrow](self, "adjustFrameToAvoidDividerOnArrow");
    self->m_recalcVisibleItems = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v72, 8);
  if (!v45)
    return 0;
LABEL_39:
  if (v3)
  {
    v47[0] = v5;
    v47[1] = 3221225472;
    v47[2] = __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_4;
    v47[3] = &unk_1E16B1B28;
    v47[4] = self;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", self, 5242880, v47, 0, 0.25);
  }
  else
  {
    -[UICalloutBar updateForCurrentPage](self, "updateForCurrentPage");
  }
  return 1;
}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t result;
  double v7;

  result = objc_msgSend(a2, "contentWidth");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  *a4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > *(double *)(a1 + 40);
  return result;
}

void __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  id v22;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v22 = v5;
  if (!*(_DWORD *)(v6 + 512))
  {
    *(_DWORD *)(v6 + 512) = 1;
    goto LABEL_12;
  }
  objc_msgSend(v5, "contentWidth");
  v5 = v22;
  if (v7 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) <= *(double *)(a1 + 80))
    goto LABEL_12;
  if (objc_msgSend(v22, "type") == 1)
  {
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(v22, "contentWidth");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v5 = v22;
    if (v8 + v10 + (double)(4 * v9 + 4) * -8.0 <= *(double *)(a1 + 80))
      goto LABEL_12;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  if (v9 >= 2 && objc_msgSend(*(id *)(a1 + 40), "count") - 1 != a3
    || (v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
        objc_msgSend(v22, "contentWidth"),
        v5 = v22,
        v11 + v12 + (double)(4 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 4) * -8.0 > *(double *)(a1 + 80)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "contentWidth");
    v14 = v13;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 688), "contentWidth");
    v5 = v22;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14 + v15;
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 512);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
LABEL_12:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(v5, "contentWidth");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(double *)(v17 + 24);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v18 < *(double *)(v19 + 24))
    v18 = *(double *)(v19 + 24);
  *(double *)(v17 + 24) = v18;
  v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  objc_msgSend(v22, "additionalContentHeight");
  if (v20 >= v21)
    v21 = v20;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v21;
  objc_msgSend(v22, "setPage:", *(int *)(*(_QWORD *)(a1 + 32) + 512) - 1);

}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  _BYTE *v2;
  double v3;
  double v4;
  double v5;

  v1 = result;
  v2 = *(_BYTE **)(result + 32);
  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  if (v2[788])
  {
    if (v3 != 0.0)
    {
      v4 = v3 + *(double *)(result + 64);
      objc_msgSend(*(id *)(result + 32), "maxVerticalCalloutHeightForMinButtonHeight:", *(double *)(result + 72));
      result = objc_msgSend(v2, "setFrameForSize:", v4, v5);
      if ((_DWORD)result)
      {
        result = objc_msgSend(*(id *)(v1 + 32), "configureButtonsForVerticalView:", *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24));
LABEL_8:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      }
    }
  }
  else if (v3 != 0.0)
  {
    result = objc_msgSend(*(id *)(result + 32), "setFrameForSize:", v3 + *(double *)(result + 64), *(double *)(result + 72));
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v1 + 32), "configureButtons:", *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24));
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t __44__UICalloutBar__updateVisibleItemsAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForCurrentPage");
}

- (void)setResponderTarget:(id)a3
{
  -[UICalloutBar setResponderTarget:completion:](self, "setResponderTarget:completion:", a3, 0);
}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointBelowControls:(CGPoint)a5 pointAboveControls:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 v15;
  id WeakRetained;
  id v17;
  CGRect v18;
  CGRect v19;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v17 = a4;
  v18.origin.x = v13;
  v18.origin.y = v12;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectIntegral(v18);
  -[UICalloutBar setTargetRect:](self, "setTargetRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  -[UICalloutBar setTargetView:](self, "setTargetView:", v17);
  -[UICalloutBar setArrowDirection:](self, "setArrowDirection:", 0);
  -[UICalloutBar setTargetHorizontal:](self, "setTargetHorizontal:", 0);
  -[UICalloutBar setPointBelowControls:](self, "setPointBelowControls:", v9, v8);
  -[UICalloutBar setPointAboveControls:](self, "setPointAboveControls:", x, y);
  v15 = -[UICalloutBar visible](self, "visible");
  self->m_recalcVisibleItems = 1;
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v17)
      -[UICalloutBar _clearResponderTarget](self, "_clearResponderTarget");
    if (!-[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 0))
      -[UICalloutBar fade](self, "fade");
  }

}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 pointLeftOfControls:(CGPoint)a5 pointRightOfControls:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 v15;
  id WeakRetained;
  id v17;
  CGRect v18;
  CGRect v19;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v17 = a4;
  v18.origin.x = v13;
  v18.origin.y = v12;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectIntegral(v18);
  -[UICalloutBar setTargetRect:](self, "setTargetRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  -[UICalloutBar setTargetView:](self, "setTargetView:", v17);
  -[UICalloutBar setArrowDirection:](self, "setArrowDirection:", 0);
  -[UICalloutBar setTargetHorizontal:](self, "setTargetHorizontal:", 1);
  -[UICalloutBar setPointLeftOfControls:](self, "setPointLeftOfControls:", v9, v8);
  -[UICalloutBar setPointRightOfControls:](self, "setPointRightOfControls:", x, y);
  v15 = -[UICalloutBar visible](self, "visible");
  self->m_recalcVisibleItems = 1;
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v17)
      -[UICalloutBar _clearResponderTarget](self, "_clearResponderTarget");
    if (!-[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 0))
      -[UICalloutBar fade](self, "fade");
  }

}

- (void)setTargetRect:(CGRect)a3 view:(id)a4 arrowDirection:(int)a5
{
  uint64_t v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  id WeakRetained;
  id v18;
  CGRect v19;
  CGRect v20;

  v5 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a4;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v20 = CGRectIntegral(v19);
  v11 = v20.origin.x;
  v12 = v20.origin.y;
  v13 = v20.size.width;
  v14 = v20.size.height;
  -[UICalloutBar setTargetRect:](self, "setTargetRect:");
  -[UICalloutBar setTargetView:](self, "setTargetView:", v18);
  -[UICalloutBar setArrowDirection:](self, "setArrowDirection:", v5);
  -[UICalloutBar setTargetHorizontal:](self, "setTargetHorizontal:", (v5 - 3) < 2);
  -[UICalloutBar setPointBelowControls:](self, "setPointBelowControls:", v11 + v13 * 0.5, round(v12));
  -[UICalloutBar setPointAboveControls:](self, "setPointAboveControls:", v11 + v13 * 0.5, round(v12 + v14));
  v15 = round(v12 + v14 * 0.5);
  -[UICalloutBar setPointLeftOfControls:](self, "setPointLeftOfControls:", v11 + v13, v15);
  -[UICalloutBar setPointRightOfControls:](self, "setPointRightOfControls:", v11, v15);
  v16 = -[UICalloutBar visible](self, "visible");
  self->m_recalcVisibleItems = 1;
  if (v16)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

    if (WeakRetained != v18)
      -[UICalloutBar _clearResponderTarget](self, "_clearResponderTarget");
    if (!-[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 0))
      -[UICalloutBar fade](self, "fade");
  }

}

- (int64_t)indexOfButton:(id)a3
{
  return _indexOfButton(a3, self);
}

- (BOOL)containsButtonForAction:(SEL)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD aBlock[5];

  if (!-[UICalloutBar visible](self, "visible"))
    return 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__UICalloutBar_containsButtonForAction___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_B32__0__UICalloutBarButton_8Q16_B24l;
  aBlock[4] = a3;
  v5 = _Block_copy(aBlock);
  v6 = -[NSMutableArray indexOfObjectPassingTest:](self->m_currentSystemButtons, "indexOfObjectPassingTest:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = -[NSMutableArray indexOfObjectPassingTest:](self->m_extraButtons, "indexOfObjectPassingTest:", v5);
  v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

BOOL __40__UICalloutBar_containsButtonForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_msgSend(v3, "isHidden") & 1) == 0 && objc_msgSend(v3, "action") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (void)buttonHovered:(id)a3 index:(int64_t)a4 hovered:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double v10;
  int64_t m_hoveredIndex;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  double v18;
  double v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v5 = a5;
  v27 = 0;
  v26 = 0;
  _separatorsForIndex(self, a4, &v27, &v26);
  v8 = v27;
  v9 = v26;
  if (v5)
  {
    self->m_hoveredIndex = a4;
    v10 = 0.0;
    goto LABEL_17;
  }
  m_hoveredIndex = self->m_hoveredIndex;
  if (m_hoveredIndex != a4)
  {
    v24 = 0;
    v25 = 0;
    _separatorsForIndex(self, m_hoveredIndex, &v25, &v24);
    v12 = v25;
    v13 = v24;
    if (v8 == v12)
    {
      v14 = v8;
      v8 = 0;
    }
    else
    {
      if (v9 != v12)
        goto LABEL_10;
      v14 = v9;
      v9 = 0;
    }

LABEL_10:
    if (v8 == v13)
    {
      v8 = 0;
    }
    else
    {
      if (v9 != v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      v9 = 0;
    }

    goto LABEL_15;
  }
  self->m_hoveredIndex = -1;
LABEL_16:
  v10 = 1.0;
LABEL_17:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__UICalloutBar_buttonHovered_index_hovered___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  v15 = v8;
  v21 = v15;
  v23 = v10;
  v16 = v9;
  v22 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v15 && (objc_msgSend(v15, "alpha"), v10 != v18) || v16 && (objc_msgSend(v16, "alpha"), v10 != v19))
  {
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327716, v17, 0, 0.41, 0.0);
    else
      v17[2](v17);
  }

}

uint64_t __44__UICalloutBar_buttonHovered_index_hovered___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 48));
}

- (void)buttonHighlighted:(id)a3 highlighted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v4 = a4;
  v19 = a3;
  -[_UICalloutBarVisualStyle buttonMetrics](self->m_visualStyle, "buttonMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "prefersCustomSelection");

  v8 = v19;
  if ((v7 & 1) == 0)
  {
    if (!v4 || (v9 = _indexOfButton(v19, self) == self->m_hoveredIndex, v8 = v19, !v9))
    {
      objc_msgSend(v8, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      if (self->m_isDisplayingVertically)
      {
        -[UIScrollView contentOffset](self->m_verticalScrollView, "contentOffset");
        v13 = v13 - v18;
        if (-[UICalloutBar targetDirection](self, "targetDirection") == 1)
          v13 = v13 + 15.0;
      }
      -[UICalloutBarBackground setHighlighted:forFrame:](self->m_overlay, "setHighlighted:forFrame:", v4, v11, v13, v15, v17);
      v8 = v19;
    }
  }

}

- (void)show
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !-[UICalloutBar suppressesAppearance](self, "suppressesAppearance"))
  {
    -[UICalloutBar _endOngoingAppearOrFadeAnimations](self, "_endOngoingAppearOrFadeAnimations");
    -[UICalloutBar delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_asCalloutBarDelegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      -[UICalloutBar setDelegate:](self, "setDelegate:", v6);
    }
    self->m_fadedTime = 0.0;
    self->m_fadedDueToCommand = 0;
    self->m_currentPage = 0;
    if (!self->m_recalcVisibleItems
      || -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 0))
    {
      UICalloutBarAnimationContext(CFSTR("UICalloutBarAnimationAppear"), -[UICalloutBar hasReplacements](self, "hasReplacements"), self->m_didPromptForReplace);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "calloutBar:willStartAnimation:", self, v5);
      -[_UICalloutBarVisualStyle calloutBarWillAppear:](self->m_visualStyle, "calloutBarWillAppear:", self);
      -[UIView setAlpha:](self, "setAlpha:", 1.0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "calloutBar:didFinishAnimation:", self, v5);
      self->m_fadeAfterCommand = 0;
      self->m_didPromptForReplace = 0;

    }
  }
}

- (void)appear
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !-[UICalloutBar suppressesAppearance](self, "suppressesAppearance"))
  {
    -[UICalloutBar _endOngoingAppearOrFadeAnimations](self, "_endOngoingAppearOrFadeAnimations");
    -[UICalloutBar delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_asCalloutBarDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[UICalloutBar setDelegate:](self, "setDelegate:", v4);
    }
    self->m_fadedTime = 0.0;
    self->m_fadedDueToCommand = 0;
    -[UIView setAlpha:](self, "setAlpha:", 0.0);
    self->m_currentPage = 0;
    if (!self->m_recalcVisibleItems
      || -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 0))
    {
      UICalloutBarAnimationContext(CFSTR("UICalloutBarAnimationAppear"), -[UICalloutBar hasReplacements](self, "hasReplacements"), self->m_didPromptForReplace);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "calloutBar:willStartAnimation:", self, v6);
      -[_UICalloutBarVisualStyle calloutBarWillAppear:](self->m_visualStyle, "calloutBarWillAppear:", self);
      -[UICalloutBar setCurrentAppearOrFadeContext:](self, "setCurrentAppearOrFadeContext:", v6);
      v10 = v6;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __22__UICalloutBar_appear__block_invoke;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __22__UICalloutBar_appear__block_invoke_2;
      v9[3] = &unk_1E16B2218;
      v9[4] = self;
      v7 = v6;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v9, 0.2);
      self->m_fadeAfterCommand = 0;
      self->m_didPromptForReplace = 0;
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logBlock:domain:", &__block_literal_global_430, CFSTR("com.apple.keyboard.UIKit"));

    }
  }
}

uint64_t __22__UICalloutBar_appear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __22__UICalloutBar_appear__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appearAnimationDidStopWithContext:", *(_QWORD *)(a1 + 40));
}

id __22__UICalloutBar_appear__block_invoke_3()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("KeyboardEventType");
  v1[1] = CFSTR("Operation");
  v2[0] = CFSTR("TextEditing");
  v2[1] = CFSTR("Show callout bar");
  v1[2] = CFSTR("TriggerType");
  v2[2] = CFSTR("CalloutBar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_endOngoingAppearOrFadeAnimations
{
  void *v3;
  void *v4;
  id v5;

  -[UICalloutBar currentAppearOrFadeContext](self, "currentAppearOrFadeContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UICalloutBarInfoKeyAnimationID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("UICalloutBarAnimationAppear")))
      -[UICalloutBar appearAnimationDidStopWithContext:](self, "appearAnimationDidStopWithContext:", v5);
    else
      -[UICalloutBar fadeAnimationDidStopWithContext:finished:](self, "fadeAnimationDidStopWithContext:finished:", v5, 0);

    v3 = v5;
  }

}

- (void)_fadeAfterCommand:(SEL)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  id WeakRetained;
  BOOL m_fadeAfterCommand;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD v17[5];
  BOOL v18;

  -[UICalloutBar _endOngoingAppearOrFadeAnimations](self, "_endOngoingAppearOrFadeAnimations");
  -[UICalloutBar clearEvadeRects](self, "clearEvadeRects");
  -[UICalloutBar clearSupressesHorizontalMovementFrame](self, "clearSupressesHorizontalMovementFrame");
  -[UIView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self->m_fadedTime = CFAbsoluteTimeGetCurrent();
    self->m_fadedDueToCommand = a3 != 0;
    v6 = sel__promptForReplace_ == a3;
    self->m_didPromptForReplace = v6;
    UICalloutBarAnimationContext(CFSTR("UICalloutBarAnimationFade"), v6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "calloutBar:willStartAnimation:", self, v7);
    -[UICalloutBar setCurrentAppearOrFadeContext:](self, "setCurrentAppearOrFadeContext:", v7);
    m_fadeAfterCommand = self->m_fadeAfterCommand;
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke;
    v17[3] = &unk_1E16B1B78;
    v18 = m_fadeAfterCommand;
    v17[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke_2;
    v14[3] = &unk_1E16B7110;
    v14[4] = self;
    v15 = v7;
    v16 = m_fadeAfterCommand;
    v11 = v7;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v14, 0.2);
    self->m_fadeAfterCommand = 0;
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __34__UICalloutBar__fadeAfterCommand___block_invoke_3;
    v13[3] = &__block_descriptor_40_e5__8__0l;
    v13[4] = a3;
    objc_msgSend(v12, "logBlock:domain:", v13, CFSTR("com.apple.keyboard.UIKit"));

  }
}

uint64_t __34__UICalloutBar__fadeAfterCommand___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend((id)UIApp, "beginIgnoringInteractionEvents");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __34__UICalloutBar__fadeAfterCommand___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "fadeAnimationDidStopWithContext:finished:", *(_QWORD *)(a1 + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "_clearResponderTarget");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend((id)UIApp, "endIgnoringInteractionEvents");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "calloutBarDidDisappear:");
}

id __34__UICalloutBar__fadeAfterCommand___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("TextEditing");
  v8[0] = CFSTR("KeyboardEventType");
  v8[1] = CFSTR("Operation");
  v1 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = CFSTR("None");
  if (v2)
    v4 = (const __CFString *)v2;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@(%@)"), CFSTR("Fade callout bar after command"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("TriggerType");
  v9[1] = v5;
  v9[2] = CFSTR("CalloutBar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isOwnedByView:(id)a3
{
  id v4;
  UIView **p_m_targetView;
  id WeakRetained;
  id v7;
  BOOL v8;

  v4 = a3;
  p_m_targetView = &self->m_targetView;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_targetView);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_m_targetView);
    v8 = v7 == v4;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_clearResponderTarget
{
  void (**m_responderTargetCompletionHandler)(id, id);
  id WeakRetained;
  id v5;

  m_responderTargetCompletionHandler = (void (**)(id, id))self->m_responderTargetCompletionHandler;
  if (m_responderTargetCompletionHandler)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);
    m_responderTargetCompletionHandler[2](m_responderTargetCompletionHandler, WeakRetained);

  }
  objc_storeWeak((id *)&self->m_responderTarget, 0);
  v5 = self->m_responderTargetCompletionHandler;
  self->m_responderTargetCompletionHandler = 0;

}

- (void)setResponderTarget:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id m_responderTargetCompletionHandler;
  id obj;

  obj = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_responderTarget);

  if (WeakRetained != obj)
  {
    -[UICalloutBar _clearResponderTarget](self, "_clearResponderTarget");
    objc_storeWeak((id *)&self->m_responderTarget, obj);
    v8 = _Block_copy(v6);
    m_responderTargetCompletionHandler = self->m_responderTargetCompletionHandler;
    self->m_responderTargetCompletionHandler = v8;

  }
}

- (void)fadeFromTargetView:(id)a3
{
  if (-[UICalloutBar _isOwnedByView:](self, "_isOwnedByView:", a3))
    -[UICalloutBar fade](self, "fade");
}

- (void)fade
{
  if (!self->m_ignoreFade)
    -[UICalloutBar _fadeAfterCommand:](self, "_fadeAfterCommand:", 0);
}

- (void)hideFromTargetView:(id)a3
{
  if (-[UICalloutBar _isOwnedByView:](self, "_isOwnedByView:", a3))
    -[UICalloutBar hide](self, "hide");
}

- (void)hide
{
  void *v3;
  id WeakRetained;
  CGSize v5;
  void *v6;
  id v7;

  -[UICalloutBar clearEvadeRects](self, "clearEvadeRects");
  -[UICalloutBar clearSupressesHorizontalMovementFrame](self, "clearSupressesHorizontalMovementFrame");
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UICalloutBar _endOngoingAppearOrFadeAnimations](self, "_endOngoingAppearOrFadeAnimations");
    UICalloutBarAnimationContext(CFSTR("UICalloutBarAnimationHide"), 0, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "calloutBar:willStartAnimation:", self, v7);
    -[UIView setAlpha:](self, "setAlpha:", 0.0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "calloutBar:didFinishAnimation:", self, v7);
    -[_UICalloutBarVisualStyle calloutBarDidDisappear:](self->m_visualStyle, "calloutBarDidDisappear:", self);
    -[UICalloutBar _clearResponderTarget](self, "_clearResponderTarget");
    objc_storeWeak((id *)&self->m_targetView, 0);
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->m_targetRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->m_targetRect.size = v5;
    -[UICalloutBar removeFromSuperview](self, "removeFromSuperview");
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logBlock:domain:", &__block_literal_global_437, CFSTR("com.apple.keyboard.UIKit"));

  }
}

id __20__UICalloutBar_hide__block_invoke()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("KeyboardEventType");
  v1[1] = CFSTR("Operation");
  v2[0] = CFSTR("TextEditing");
  v2[1] = CFSTR("Hide callout bar");
  v1[2] = CFSTR("TriggerType");
  v2[2] = CFSTR("CalloutBar");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)update
{
  self->m_recalcVisibleItems = 1;
  -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", 1);
}

- (void)updateAnimated:(BOOL)a3
{
  self->m_recalcVisibleItems = 1;
  -[UICalloutBar _updateVisibleItemsAnimated:](self, "_updateVisibleItemsAnimated:", a3);
}

- (BOOL)recentlyFaded
{
  return self->m_fadedTime + 0.5 > CFAbsoluteTimeGetCurrent();
}

- (BOOL)fadedDueToCommand
{
  return self->m_fadedDueToCommand;
}

- (void)appearAnimationDidStopWithContext:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  -[UICalloutBar currentAppearOrFadeContext](self, "currentAppearOrFadeContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    -[UICalloutBar setCurrentAppearOrFadeContext:](self, "setCurrentAppearOrFadeContext:", 0);
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "calloutBar:didFinishAnimation:", self, v7);

    v5 = v7;
  }

}

- (void)fadeAnimationDidStopWithContext:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id WeakRetained;
  CGSize v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[UICalloutBar currentAppearOrFadeContext](self, "currentAppearOrFadeContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v6 == v10)
  {
    -[UICalloutBar setCurrentAppearOrFadeContext:](self, "setCurrentAppearOrFadeContext:", 0);
    WeakRetained = objc_loadWeakRetained(&self->m_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "calloutBar:didFinishAnimation:", self, v10);
    if (v4)
    {
      objc_storeWeak((id *)&self->m_targetView, 0);
      v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->m_targetRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->m_targetRect.size = v9;
      -[UICalloutBar removeFromSuperview](self, "removeFromSuperview");
    }

    v7 = v10;
  }

}

- (void)addRectToEvade:(CGRect)a3
{
  NSMutableArray *m_rectsToEvade;
  id v4;

  m_rectsToEvade = self->m_rectsToEvade;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](m_rectsToEvade, "addObject:", v4);

}

- (void)clearEvadeRects
{
  -[NSMutableArray removeAllObjects](self->m_rectsToEvade, "removeAllObjects");
}

- (BOOL)hasReplacements
{
  return -[NSArray count](self->m_replacements, "count") != 0;
}

- (void)clearReplacements
{
  NSArray *m_replacements;

  m_replacements = self->m_replacements;
  self->m_replacements = 0;

}

- (void)clearSupressesHorizontalMovementFrame
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->m_supressesHorizontalMovementFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->m_supressesHorizontalMovementFrame.size = v2;
  self->m_supressedHorizontalMovementX = 0.0;
}

- (BOOL)isDisplayingVertically
{
  return self->m_isDisplayingVertically;
}

- (CGPoint)pointAboveControls
{
  double x;
  double y;
  CGPoint result;

  x = self->m_pointAboveControls.x;
  y = self->m_pointAboveControls.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPointAboveControls:(CGPoint)a3
{
  self->m_pointAboveControls = a3;
}

- (CGPoint)pointBelowControls
{
  double x;
  double y;
  CGPoint result;

  x = self->m_pointBelowControls.x;
  y = self->m_pointBelowControls.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPointBelowControls:(CGPoint)a3
{
  self->m_pointBelowControls = a3;
}

- (CGPoint)pointLeftOfControls
{
  double x;
  double y;
  CGPoint result;

  x = self->m_pointLeftOfControls.x;
  y = self->m_pointLeftOfControls.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPointLeftOfControls:(CGPoint)a3
{
  self->m_pointLeftOfControls = a3;
}

- (CGPoint)pointRightOfControls
{
  double x;
  double y;
  CGPoint result;

  x = self->m_pointRightOfControls.x;
  y = self->m_pointRightOfControls.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPointRightOfControls:(CGPoint)a3
{
  self->m_pointRightOfControls = a3;
}

- (CGPoint)targetPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->m_targetPoint.x;
  y = self->m_targetPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3
{
  self->m_targetPoint = a3;
}

- (int)targetDirection
{
  return self->m_targetDirection;
}

- (void)setTargetDirection:(int)a3
{
  self->m_targetDirection = a3;
}

- (BOOL)targetHorizontal
{
  return self->m_targetHorizontal;
}

- (void)setTargetHorizontal:(BOOL)a3
{
  self->m_targetHorizontal = a3;
}

- (CGRect)controlFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_controlFrame.origin.x;
  y = self->m_controlFrame.origin.y;
  width = self->m_controlFrame.size.width;
  height = self->m_controlFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setControlFrame:(CGRect)a3
{
  self->m_controlFrame = a3;
}

- (UICalloutBarDelegate)delegate
{
  return (UICalloutBarDelegate *)objc_loadWeakRetained(&self->m_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->m_delegate, a3);
}

- (NSArray)rectsToEvade
{
  return &self->m_rectsToEvade->super;
}

- (CGRect)targetRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_targetRect.origin.x;
  y = self->m_targetRect.origin.y;
  width = self->m_targetRect.size.width;
  height = self->m_targetRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->m_targetRect = a3;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->m_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->m_targetView, a3);
}

- (int)arrowDirection
{
  return self->m_arrowDirection;
}

- (void)setArrowDirection:(int)a3
{
  self->m_arrowDirection = a3;
}

- (UIResponder)responderTarget
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->m_responderTarget);
}

- (NSArray)replacements
{
  return self->m_replacements;
}

- (void)setReplacements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)showAllReplacements
{
  return self->m_showAllReplacements;
}

- (void)setShowAllReplacements:(BOOL)a3
{
  self->m_showAllReplacements = a3;
}

- (NSArray)extraItems
{
  return self->m_extraItems;
}

- (void)setExtraItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (NSString)untruncatedString
{
  return self->m_untruncatedString;
}

- (void)setUntruncatedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (BOOL)supressesHorizontalMovement
{
  return self->m_supressesHorizontalMovement;
}

- (void)setSupressesHorizontalMovement:(BOOL)a3
{
  self->m_supressesHorizontalMovement = a3;
}

- (NSDictionary)currentAppearOrFadeContext
{
  return self->m_currentAppearOrFadeContext;
}

- (void)setCurrentAppearOrFadeContext:(id)a3
{
  objc_storeStrong((id *)&self->m_currentAppearOrFadeContext, a3);
}

- (BOOL)suppressesAppearance
{
  return self->m_suppressesAppearance;
}

- (void)setSuppressesAppearance:(BOOL)a3
{
  self->m_suppressesAppearance = a3;
}

- (BOOL)isUsingVerticalFallbackPosition
{
  return self->m_isUsingVerticalFallbackPosition;
}

- (UIScrollView)verticalScrollView
{
  return self->m_verticalScrollView;
}

- (UIStackView)verticalStackView
{
  return self->m_verticalStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_visualStyle, 0);
  objc_storeStrong((id *)&self->m_buttonView, 0);
  objc_storeStrong((id *)&self->m_separatorViews, 0);
  objc_storeStrong((id *)&self->m_verticalStackView, 0);
  objc_storeStrong((id *)&self->m_verticalScrollView, 0);
  objc_storeStrong((id *)&self->m_untruncatedString, 0);
  objc_storeStrong((id *)&self->m_extraItems, 0);
  objc_storeStrong((id *)&self->m_replacements, 0);
  objc_storeStrong(&self->m_responderTargetCompletionHandler, 0);
  objc_destroyWeak((id *)&self->m_responderTarget);
  objc_storeStrong((id *)&self->m_currentAppearOrFadeContext, 0);
  objc_storeStrong((id *)&self->m_overlay, 0);
  objc_storeStrong((id *)&self->m_rectsToEvade, 0);
  objc_storeStrong((id *)&self->m_previousButton, 0);
  objc_storeStrong((id *)&self->m_nextButton, 0);
  objc_storeStrong((id *)&self->m_extraButtons, 0);
  objc_storeStrong((id *)&self->m_currentSystemButtons, 0);
  objc_storeStrong((id *)&self->m_systemButtonDescriptions, 0);
  objc_destroyWeak((id *)&self->m_targetView);
  objc_destroyWeak(&self->m_delegate);
}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!__idiomToVisualStyleClassMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)__idiomToVisualStyleClassMap;
    __idiomToVisualStyleClassMap = v8;

  }
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UICalloutBar.m"), 3574, CFSTR("visualStyleClass of type %@ is not a subclass of _UICalloutBarVisualStyle."), v12);

  }
  v10 = (void *)__idiomToVisualStyleClassMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, v13);

}

+ (id)_visualStyleForCalloutBar:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;

  v3 = (void *)__idiomToVisualStyleClassMap;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "objectForKeyedSubscript:", v7);

  if (v8)
    v9 = (objc_class *)v8;
  else
    v9 = (objc_class *)_UICalloutBarVisualStyle;
  v10 = (void *)objc_msgSend([v9 alloc], "initWithCalloutBar:", v5);

  return v10;
}

@end
