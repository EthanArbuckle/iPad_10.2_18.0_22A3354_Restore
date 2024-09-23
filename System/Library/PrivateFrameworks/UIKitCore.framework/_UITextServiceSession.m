@implementation _UITextServiceSession

+ (BOOL)_canShowTextServices
{
  int v3;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    return 0;
  v3 = MKBGetDeviceLockState();
  return !v3 || v3 == 3;
}

+ (int64_t)availableTextServices
{
  void *v2;
  int64_t v3;

  if (!objc_msgSend(a1, "_canShowTextServices"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isDefinitionLookupAllowed"))
    v3 = 18;
  else
    v3 = 0;
  if (objc_msgSend(v2, "isSelectedTextSharingAllowed"))
    v3 |= 8uLL;
  if (objc_msgSend(v2, "isSpellCheckAllowed"))
    v3 |= 4uLL;
  if (objc_msgSend(v2, "isTranslationLookupAllowed"))
    v3 |= 0x20uLL;
  if ((v3 & 0x20) != 0 && !objc_msgSend(getLTUITranslationViewControllerClass(), "isAvailable"))
    v3 &= ~0x20uLL;

  return v3;
}

+ (BOOL)_canShowTextServiceForType:(int64_t)a3
{
  return (a3 & ~objc_msgSend(a1, "availableTextServices")) == 0;
}

+ (BOOL)shouldPresentServiceInSameWindowAsView:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isTextEffectsWindow") & 1) != 0)
    v4 = 0;
  else
    v4 = dyld_program_sdk_at_least();

  return v4;
}

+ (id)showServiceForText:(id)a3 selectedTextRange:(_NSRange)a4 type:(int64_t)a5 fromRect:(CGRect)a6 inView:(id)a7
{
  return 0;
}

+ (id)showServiceForType:(int64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  UIReferenceLibraryViewController *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  int v44;
  id v45;
  int v46;
  id v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  objc_class *v54;
  id v55;
  void *v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _UIFallbackPresentationViewController *v68;
  void *v69;
  _UIFallbackPresentationViewController *v70;
  void *v71;
  void *v72;
  NSObject *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  uint8_t buf[8];
  uint64_t v101;
  void (*v102)(uint64_t);
  void *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD v110[3];

  v110[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(a1, "_canShowTextServiceForType:", a3))
  {
    objc_msgSend(v6, "textWithContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rvItemWithContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 16 && !v7 && !v76)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v74, OS_LOG_TYPE_FAULT, "Cannot show text service when there isn't text; _UITextServiceSessionContext.textWithContext is nil.",
            buf,
            2u);
        }

      }
      else
      {
        v8 = qword_1ECD81D08;
        if (!qword_1ECD81D08)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&qword_1ECD81D08);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Cannot show text service when there isn't text; _UITextServiceSessionContext.textWithContext is nil.",
            buf,
            2u);
        }
      }
      v10 = 0;
      goto LABEL_79;
    }
    if (qword_1ECD81D10 != -1)
      dispatch_once(&qword_1ECD81D10, &__block_literal_global_581);
    v11 = objc_msgSend(v6, "selectedRange");
    v13 = v12;
    objc_msgSend(v7, "substringWithRange:", v11, v12);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v6, "textInput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textInputView");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "presentationRect");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
    objc_storeStrong((id *)(v26 + 24), v16);
    v10 = 0;
    if (a3 <= 7)
    {
      if (a3 == 2)
      {
        v27 = -[UIReferenceLibraryViewController initWithTerm:]([UIReferenceLibraryViewController alloc], "initWithTerm:", v75);
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_2;
        v98[3] = &unk_1E16B1B28;
        v99 = (id)v26;
        -[UIReferenceLibraryViewController setDismissCompletionHandler:](v27, "setDismissCompletionHandler:", v98);

      }
      else
      {
        if (a3 != 4)
          goto LABEL_78;
        _shortcutEditorController(v75);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v27 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v35);
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "userInterfaceIdiom");

          if ((v37 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            v38 = 7;
          else
            v38 = -2;
          -[UIViewController setModalPresentationStyle:](v27, "setModalPresentationStyle:", v38);
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_3;
          v96[3] = &unk_1E16B1B28;
          v97 = (id)v26;
          _swapInCompletionForShortcutEditor(v27, v96);

        }
        else
        {
          v27 = 0;
        }

      }
    }
    else
    {
      switch(a3)
      {
        case 8:
          v39 = objc_alloc(MEMORY[0x1E0D96D28]);
          v110[0] = v75;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (UIReferenceLibraryViewController *)objc_msgSend(v39, "initWithActivityItems:applicationActivities:", v40, 0);

          v109 = *MEMORY[0x1E0D96E28];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIReferenceLibraryViewController setExcludedActivityTypes:](v27, "setExcludedActivityTypes:", v41);

          objc_initWeak((id *)buf, v27);
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_4;
          v93[3] = &unk_1E16E7858;
          objc_copyWeak(&v95, (id *)buf);
          v94 = (id)v26;
          -[UIReferenceLibraryViewController setCompletionWithItemsHandler:](v27, "setCompletionWithItemsHandler:", v93);

          objc_destroyWeak(&v95);
          objc_destroyWeak((id *)buf);
          break;
        case 16:
          if (!v76
            || (v42 = (void *)objc_msgSend(objc_alloc((Class)DataDetectorsUIGetClass(CFSTR("DDParsecCollectionViewController"))), "initWithRVItem:", v76)) == 0)
          {
            v42 = (void *)objc_msgSend(objc_alloc((Class)DataDetectorsUIGetClass(CFSTR("DDParsecCollectionViewController"))), "initWithString:range:", v7, v11, v13);
          }
          v91[0] = MEMORY[0x1E0C809B0];
          v91[1] = 3221225472;
          v91[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_5;
          v91[3] = &unk_1E16B1B28;
          v92 = (id)v26;
          v27 = v42;
          -[UIReferenceLibraryViewController setDismissCompletionHandler:](v27, "setDismissCompletionHandler:", v91);

          break;
        case 32:
          v27 = (UIReferenceLibraryViewController *)objc_alloc_init((Class)getLTUITranslationViewControllerClass());
          -[UIViewController setModalPresentationStyle:](v27, "setModalPresentationStyle:", 7);
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v75);
          -[UIReferenceLibraryViewController setText:](v27, "setText:", v28);

          -[UIReferenceLibraryViewController setIsSourceEditable:](v27, "setIsSourceEditable:", 0);
          objc_msgSend(v6, "textInput");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 && (v30 = objc_msgSend(v16, "isEditable"), v29, v30))
          {
            objc_msgSend(v6, "textInput");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "selectedTextRange");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "textInput");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak((id *)buf, v33);

            -[UIReferenceLibraryViewController setIsSourceEditable:](v27, "setIsSourceEditable:", 1);
            v88[0] = MEMORY[0x1E0C809B0];
            v88[1] = 3221225472;
            v88[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_6;
            v88[3] = &unk_1E16E7880;
            objc_copyWeak(&v90, (id *)buf);
            v34 = v32;
            v89 = v34;
            -[UIReferenceLibraryViewController setReplacementHandler:](v27, "setReplacementHandler:", v88);

            objc_destroyWeak(&v90);
            objc_destroyWeak((id *)buf);

          }
          else if (objc_msgSend(v16, "conformsToProtocolCached:", &unk_1EE0CE288))
          {
            v43 = objc_initWeak((id *)buf, v16);
            v44 = objc_msgSend(v16, "isReplaceAllowed");

            if (v44)
            {
              -[UIReferenceLibraryViewController setIsSourceEditable:](v27, "setIsSourceEditable:", 1);
              v85[0] = MEMORY[0x1E0C809B0];
              v85[1] = 3221225472;
              v85[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_7;
              v85[3] = &unk_1E16E7880;
              objc_copyWeak(&v87, (id *)buf);
              v86 = v75;
              -[UIReferenceLibraryViewController setReplacementHandler:](v27, "setReplacementHandler:", v85);

              objc_destroyWeak(&v87);
            }
            objc_destroyWeak((id *)buf);
          }
          else if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0CE228))
          {
            v45 = objc_initWeak((id *)buf, v16);
            v46 = objc_msgSend(v16, "isReplaceAllowed");

            if (v46)
            {
              -[UIReferenceLibraryViewController setIsSourceEditable:](v27, "setIsSourceEditable:", 1);
              v82[0] = MEMORY[0x1E0C809B0];
              v82[1] = 3221225472;
              v82[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_8;
              v82[3] = &unk_1E16E7880;
              objc_copyWeak(&v84, (id *)buf);
              v83 = v75;
              -[UIReferenceLibraryViewController setReplacementHandler:](v27, "setReplacementHandler:", v82);

              objc_destroyWeak(&v84);
            }
            objc_destroyWeak((id *)buf);
          }
          else if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0CE648))
          {
            v47 = objc_initWeak((id *)buf, v16);
            v48 = objc_msgSend(v16, "isReplaceAllowed");

            if (v48)
            {
              -[UIReferenceLibraryViewController setIsSourceEditable:](v27, "setIsSourceEditable:", 1);
              v79[0] = MEMORY[0x1E0C809B0];
              v79[1] = 3221225472;
              v79[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_9;
              v79[3] = &unk_1E16E7880;
              objc_copyWeak(&v81, (id *)buf);
              v80 = v75;
              -[UIReferenceLibraryViewController setReplacementHandler:](v27, "setReplacementHandler:", v79);

              objc_destroyWeak(&v81);
            }
            objc_destroyWeak((id *)buf);
          }
          objc_msgSend(v6, "textInput");
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)v49;
          if (v49)
            v51 = (void *)v49;
          else
            v51 = v16;
          v52 = v51;

          if (objc_msgSend(v52, "conformsToProtocol:", &unk_1EE0CF188))
          {
            v105 = 0;
            v106 = &v105;
            v107 = 0x2050000000;
            v53 = (void *)qword_1ECD81D18;
            v108 = qword_1ECD81D18;
            if (!qword_1ECD81D18)
            {
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              v101 = 3221225472;
              v102 = __getLTUISourceMetaClass_block_invoke;
              v103 = &unk_1E16B14C0;
              v104 = &v105;
              __getLTUISourceMetaClass_block_invoke((uint64_t)buf);
              v53 = (void *)v106[3];
            }
            v54 = objc_retainAutorelease(v53);
            _Block_object_dispose(&v105, 8);
            v55 = objc_alloc_init(v54);
            objc_msgSend(v55, "setOrigin:", objc_msgSend(v52, "isImageBacked"));
            -[UIReferenceLibraryViewController setSourceMeta:](v27, "setSourceMeta:", v55);

          }
          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __56___UITextServiceSession_showServiceForType_withContext___block_invoke_10;
          v77[3] = &unk_1E16B1B28;
          v78 = (id)v26;
          -[UIReferenceLibraryViewController setDismissCompletionHandler:](v27, "setDismissCompletionHandler:", v77);

          break;
        default:
          goto LABEL_78;
      }
    }
    if (v27)
    {
      objc_msgSend(v16, "_window");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "_isTextEffectsWindow"))
      {
        v57 = ((unint64_t)a3 < 0x21) & (0x100010010uLL >> a3);
        if (a3 == 8)
          v58 = 1;
        else
          v58 = ((unint64_t)a3 < 0x21) & (0x100010010uLL >> a3);

        if (!v58)
        {
LABEL_69:
          -[UIViewController presentationController](v27, "presentationController");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setDelegate:", v26);

          -[UIViewController popoverPresentationController](v27, "popoverPresentationController");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setSourceView:", v16);

          -[UIViewController popoverPresentationController](v27, "popoverPresentationController");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setSourceRect:", v19, v21, v23, v25);

          objc_storeStrong((id *)(v26 + 16), v27);
          if (objc_msgSend(a1, "shouldPresentServiceInSameWindowAsView:", v16))
          {
            objc_msgSend(v16, "_viewControllerForAncestor");
            v68 = (_UIFallbackPresentationViewController *)objc_claimAutoreleasedReturnValue();
            -[UIViewController presentedViewController](v68, "presentedViewController");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (v69)
            {
              do
              {
                -[UIViewController presentedViewController](v68, "presentedViewController");
                v70 = (_UIFallbackPresentationViewController *)objc_claimAutoreleasedReturnValue();

                -[UIViewController presentedViewController](v70, "presentedViewController");
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                v68 = v70;
              }
              while (v71);
            }
            else
            {
              v70 = v68;
            }
            -[UIViewController presentViewController:animated:completion:](v70, "presentViewController:animated:completion:", v27, 1, 0);
          }
          else
          {
            v70 = objc_alloc_init(_UIFallbackPresentationViewController);
            -[UIApplicationRotationFollowingController setSizesWindowToScene:](v70, "setSizesWindowToScene:", 1);
            -[UIViewController popoverPresentationController](v27, "popoverPresentationController");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "_setAllowsSourceViewInDifferentWindowThanInitialPresentationViewController:", 1);

            -[_UIFallbackPresentationViewController _presentViewController:sendingView:animated:](v70, "_presentViewController:sendingView:animated:", v27, v16, 1);
          }

          objc_msgSend((id)_MergedGlobals_1268, "addObject:", v26);
          v10 = (id)v26;

          goto LABEL_78;
        }
        if (v57)
        {
          objc_msgSend(v16, "keyboardSceneDelegate");
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = *(void **)(v26 + 40);
          *(_QWORD *)(v26 + 40) = v59;

          -[UIViewController view](v27, "view");
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = *(void **)(v26 + 32);
          *(_QWORD *)(v26 + 32) = v61;

          objc_msgSend(*(id *)(v26 + 40), "_beginPinningInputViewsOnBehalfOfResponder:", *(_QWORD *)(v26 + 32));
        }
        objc_msgSend(v16, "keyboardSceneDelegate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "passthroughViews");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController popoverPresentationController](v27, "popoverPresentationController");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setPassthroughViews:", v63);

      }
      goto LABEL_69;
    }
    v10 = 0;
LABEL_78:

LABEL_79:
    goto LABEL_80;
  }
  v10 = 0;
LABEL_80:

  return v10;
}

+ (id)showServiceForText:(id)a3 type:(int64_t)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a6;
  v13 = a3;
  +[_UITextServiceSession showServiceForText:selectedTextRange:type:fromRect:inView:](_UITextServiceSession, "showServiceForText:selectedTextRange:type:fromRect:inView:", v13, 0, objc_msgSend(v13, "length"), a4, v12, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (_UITextServiceSession)initWithType:(int64_t)a3
{
  _UITextServiceSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextServiceSession;
  result = -[_UITextServiceSession init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (_UITextServiceSession)init
{
  return -[_UITextServiceSession initWithType:](self, "initWithType:", 2);
}

- (BOOL)isDisplaying
{
  return !self->_dismissed;
}

- (int64_t)type
{
  return self->_type;
}

+ (id)textServiceSessionForType:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)_MergedGlobals_1268;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)textServiceIsDisplaying
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)_MergedGlobals_1268;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDisplaying", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)dismissTextServiceAnimated:(BOOL)a3
{
  int64_t type;
  void *v4;
  UIViewController *v5;

  type = self->_type;
  if (type <= 7)
  {
    if (type == 2)
    {
      -[UIViewController _dismissModalReferenceView:](self->_modalViewController, "_dismissModalReferenceView:", 0);
    }
    else if (type == 4)
    {
      _dismissShortcutEditorController(self->_modalViewController);
    }
  }
  else if (type == 8 || type == 16)
  {
    v5 = self->_modalViewController;
    -[UIViewController dismissCompletionHandler](v5, "dismissCompletionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, v4);

    -[UIViewController setDismissCompletionHandler:](v5, "setDismissCompletionHandler:", 0);
  }
  else if (type == 32)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](self->_modalViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_endSession
{
  UIKeyboardSceneDelegate *keyboardSceneDelegate;
  UIResponder *pinnedResponder;
  UIViewController *modalViewController;

  if (!self->_dismissed)
  {
    if (self->_pinnedResponder)
    {
      -[UIKeyboardSceneDelegate _stopPinningInputViewsOnBehalfOfResponder:](self->_keyboardSceneDelegate, "_stopPinningInputViewsOnBehalfOfResponder:");
      keyboardSceneDelegate = self->_keyboardSceneDelegate;
      self->_keyboardSceneDelegate = 0;

      pinnedResponder = self->_pinnedResponder;
      self->_pinnedResponder = 0;

    }
    -[_UITextServiceSession sessionDidDismiss](self, "sessionDidDismiss");
    modalViewController = self->_modalViewController;
    self->_modalViewController = 0;

    objc_msgSend((id)_MergedGlobals_1268, "removeObject:", self);
  }
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissedHandler, 0);
  objc_storeStrong((id *)&self->_keyboardSceneDelegate, 0);
  objc_storeStrong((id *)&self->_pinnedResponder, 0);
  objc_storeStrong((id *)&self->_contextView, 0);
  objc_storeStrong((id *)&self->_modalViewController, 0);
}

- (void)sessionDidDismiss
{
  void (**dismissedHandler)(id, _UITextServiceSession *);

  if (!self->_dismissed)
  {
    dismissedHandler = (void (**)(id, _UITextServiceSession *))self->_dismissedHandler;
    if (dismissedHandler)
    {
      dismissedHandler[2](dismissedHandler, self);
      -[_UITextServiceSession setDismissedHandler:](self, "setDismissedHandler:", 0);
    }
    self->_dismissed = 1;
  }
}

@end
