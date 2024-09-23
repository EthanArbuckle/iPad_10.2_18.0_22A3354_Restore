@implementation _UISizeTrackingView

+ (_UISizeTrackingView)viewWithRemoteViewController:(id)a3 viewControllerOperatorProxy:(id)a4 textEffectsOperatorProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow");
  v11 = objc_alloc((Class)a1);
  v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 424), a4);
    objc_storeStrong((id *)(v13 + 432), a5);
    objc_storeWeak((id *)(v13 + 416), v8);
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v13 + 456) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v13 + 472) = v14;
    objc_msgSend((id)v13, "setAutoresizingMask:", 18);
    objc_msgSend((id)v13, "setClipsToBounds:", objc_msgSend(v8, "_viewClipsToBounds"));
    objc_msgSend((id)v13, "_registerForGeometryChanges");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__updateTextEffectsGeometriesImmediately, CFSTR("UITextEffectsWindowOffsetDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__updateTextEffectsWindowHostedViewSize, CFSTR("UITextEffectsWindowHostedViewSizeDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__updateTextEffectsWindowSafeAreaInsets, CFSTR("UITextEffectsWindowSafeAreaInsetsDidChangeNotification"), 0);

    v18 = (id)v13;
  }

  return (_UISizeTrackingView *)(id)v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UITextEffectsWindowOffsetDidChangeNotification");
  v6[1] = CFSTR("UITextEffectsWindowHostedViewSizeDidChangeNotification");
  v6[2] = CFSTR("UITextEffectsWindowSafeAreaInsetsDidChangeNotification");
  v6[3] = CFSTR("UITextEffectsWindowDidRotateNotification");
  v6[4] = 0x1E1764C40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UIView _unregisterForGeometryChanges](self, "_unregisterForGeometryChanges");
  v5.receiver = self;
  v5.super_class = (Class)_UISizeTrackingView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = -1.0;
  height = -1.0;
  if ((*(_BYTE *)&self->_sizeTrackingViewFlags & 1) != 0)
  {
    width = self->_intrinsicContentSize.width;
    height = self->_intrinsicContentSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)updateIntrinsicContentSize:(CGSize)a3
{
  self->_intrinsicContentSize = a3;
  *(_BYTE *)&self->_sizeTrackingViewFlags |= 1u;
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (BOOL)_needsTextEffectsUpdateToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  _UISizeTrackingView *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:forViewService:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self;
  v12 = v10;
  -[UIView origin](v11, "origin");
  v14 = x - v13;
  -[UIView origin](v11, "origin");
  v16 = y - v15;
  -[UIView window](v11, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:fromView:", v11, v14, v16, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[UIView window](v11, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertRect:fromWindow:", v26, v19, v21, v23, v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v36.origin.x = v28;
  v36.origin.y = v30;
  v36.size.width = v32;
  v36.size.height = v34;
  LOBYTE(v11) = !CGRectEqualToRect(v36, v11->_formerTextEffectsContentFrame);

  return (char)v11;
}

- (void)_updateTextEffectsWindowHostedViewSize
{
  id textEffectsOperatorProxy;
  id v4;

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", 0, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
  objc_msgSend(v4, "hostedViewSize");
  -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:");
  objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");

}

- (void)_updateTextEffectsWindowSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v27;
  id v29;

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", 0, 1);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hostedSafeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!_UIDeviceNativeUserInterfaceIdiom())
  {
    if ((os_variant_has_internal_diagnostics() & 1) != 0)
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isCarrierInstall") & 1) != 0)
      {
        v12 = dyld_program_sdk_at_least();

        if ((v12 & 1) == 0)
          goto LABEL_29;
      }
      else
      {

      }
    }
  }
  -[UIView traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "userInterfaceIdiom"))
  {

    goto LABEL_29;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "serviceBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple."));

  if ((v16 & 1) != 0)
    goto LABEL_29;
  -[UIView window](self, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[UIView window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v24, "interfaceOrientation") - 3) > 1)
  {

  }
  else
  {
    if (vabdd_f64(v6, v21) < 0.1 && v6 > 50.0)
    {

LABEL_28:
      v6 = 44.0;
      v10 = 44.0;
      goto LABEL_29;
    }

    if (vabdd_f64(v10, v23) < 0.1 && v10 > 50.0)
      goto LABEL_28;
  }
  v27 = vabdd_f64(v4, v19);
  if (v4 > 50.0 && v27 < 0.1)
    v4 = 44.0;
LABEL_29:
  objc_msgSend(self->_textEffectsOperatorProxy, "__setSafeAreaInsets:", v4, v6, v8, v10);

}

- (void)_updateTextEffectsGeometriesImmediately
{
  -[UIView frame](self, "frame");
  -[_UISizeTrackingView _updateTextEffectsGeometries:](self, "_updateTextEffectsGeometries:");
}

- (void)_textEffectsWindowDidRotate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  if (self->_observingTextEffectsWindowRotation)
  {
    self->_observingTextEffectsWindowRotation = 0;
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UITextEffectsWindowDidRotateNotification"), v7);

    -[UIView frame](self, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "object");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[_UISizeTrackingView _updateTextEffectsGeometries:textEffectsWindow:](self, "_updateTextEffectsGeometries:textEffectsWindow:", v16, v9, v11, v13, v15);
  }
}

- (void)_updateTextEffectsGeometries:(CGRect)a3
{
  -[_UISizeTrackingView _updateTextEffectsGeometries:textEffectsWindow:](self, "_updateTextEffectsGeometries:textEffectsWindow:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextEffectsGeometries:(CGRect)a3 textEffectsWindow:(id)a4
{
  void *v4;
  double height;
  double width;
  double y;
  double x;
  id v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  _UISizeTrackingView *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGSize v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  char has_internal_diagnostics;
  int v81;
  char v82;
  void *v83;
  id v84;
  void *v85;
  char v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v95;
  double v96;
  void *v97;
  void *v98;
  uint64_t v99;
  double v100;
  id textEffectsOperatorProxy;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  BOOL v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  _QWORD v112[4];
  id v113;
  uint64_t *v114;
  CGAffineTransform t2;
  CGAffineTransform t1;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  __int128 v122;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  -[UIView window](self, "window");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
    v14 = objc_msgSend(WeakRetained, "_shouldUpdateRemoteTextEffectsWindow");

    if (v14)
    {
      if (!v10)
      {
        -[UIView _window](self, "_window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "windowScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v16, 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      v117 = 0;
      v118 = &v117;
      v119 = 0x4010000000;
      v120 = &unk_18685B0AF;
      v121 = 0u;
      v122 = 0u;
      v17 = objc_loadWeakRetained((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "transform");
        v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&t2.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&t2.c = v19;
        *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        if (!CGAffineTransformEqualToTransform(&t1, &t2))
        {
LABEL_48:

          _Block_object_dispose(&v117, 8);
          goto LABEL_49;
        }
        -[UIView window](self, "window");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bounds");
        objc_msgSend(v20, "convertRect:fromView:", v18);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        -[UIView window](self, "window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "convertRect:fromWindow:", v29, v22, v24, v26, v28);
        v30 = v118;
        v118[4] = v31;
        v30[5] = v32;
        v30[6] = v33;
        v30[7] = v34;

        v35 = v118;
      }
      else
      {
        v36 = v10;
        v37 = self;
        -[UIView origin](v37, "origin");
        v39 = v38;
        -[UIView origin](v37, "origin");
        v41 = v40;
        -[UIView window](v37, "window");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "convertRect:fromView:", v37, x - v39, y - v41, width, height);
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;

        -[UIView window](v37, "window");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "convertRect:fromWindow:", v4, v44, v46, v48, v50);
        v52 = v51;
        v54 = v53;
        v56 = v55;
        v58 = v57;

        v35 = v118;
        v118[4] = v52;
        v35[5] = v54;
        v35[6] = v56;
        v35[7] = v58;
      }
      v59 = (CGSize)*((_OWORD *)v35 + 3);
      self->_formerTextEffectsContentFrame.origin = (CGPoint)*((_OWORD *)v35 + 2);
      self->_formerTextEffectsContentFrame.size = v59;
      objc_msgSend(v10, "actualSceneFrame");
      v111 = v60;
      v62 = v61;
      v63 = *((double *)v118 + 4);
      v64 = *((double *)v118 + 5);
      v109 = *((double *)v118 + 7);
      v110 = *((double *)v118 + 6);
      objc_msgSend(v10, "rootViewController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __70___UISizeTrackingView__updateTextEffectsGeometries_textEffectsWindow___block_invoke;
        v112[3] = &unk_1E16BC3A0;
        v113 = v65;
        v114 = &v117;
        objc_msgSend(v113, "performWithSafeTransitionFrames:", v112);

      }
      if (objc_msgSend(v10, "_isHostedInAnotherProcess"))
      {
        objc_msgSend(v10, "hostedSafeInsets");
        v68 = v67;
        v70 = v69;
        v72 = v71;
        v74 = v73;
      }
      else
      {
        -[UIView _window](self, "_window");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "safeAreaInsets");
        v68 = v76;
        v70 = v77;
        v72 = v78;
        v74 = v79;

      }
      if (!_UIDeviceNativeUserInterfaceIdiom())
      {
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if ((has_internal_diagnostics & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v4, "isCarrierInstall") & 1) != 0))
        {
          v81 = dyld_program_sdk_at_least();
          v82 = v81;
          if ((has_internal_diagnostics & 1) != 0)
          {
            if (!v81)
              goto LABEL_39;
          }
          else
          {

            if ((v82 & 1) == 0)
            {
LABEL_39:
              objc_msgSend(self->_textEffectsOperatorProxy, "__setWindowOffset:", *((double *)v118 + 4), *((double *)v118 + 5));
              objc_msgSend(self->_textEffectsOperatorProxy, "__setSafeAreaInsets:", v68, v70, v72, v74);
              objc_msgSend(self->_textEffectsOperatorProxy, "__setHostedViewReference:", v111 + v63, v62 + v64, v110, v109);
              v95 = *((double *)v118 + 6);
              v96 = *((double *)v118 + 7);
              -[UIView window](self, "window");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "windowScene");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v98, "_enhancedWindowingEnabled"))
              {
                v99 = MEMORY[0x1E0C9D820];
                v100 = *MEMORY[0x1E0C9D820];

                if (v95 != v100 || v96 != *(double *)(v99 + 8))
                {
                  textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
                  -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:", v95, v96);
                  objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");
                }
              }
              else
              {

              }
              v102 = objc_msgSend(v10, "interfaceOrientation");
              -[UIView window](self, "window");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = objc_msgSend(v103, "interfaceOrientation");

              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              if (v102 == v104)
              {
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "removeObserver:name:object:", self, CFSTR("UITextEffectsWindowDidRotateNotification"), v10);
                v106 = 0;
              }
              else
              {
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "addObserver:selector:name:object:", self, sel__textEffectsWindowDidRotate_, CFSTR("UITextEffectsWindowDidRotateNotification"), v10);
                v106 = 1;
              }

              self->_observingTextEffectsWindowRotation = v106;
              goto LABEL_48;
            }
          }
        }
        else
        {

        }
      }
      -[UIView traitCollection](self, "traitCollection");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v83, "userInterfaceIdiom"))
      {

        goto LABEL_39;
      }
      v84 = objc_loadWeakRetained((id *)&self->_remoteViewController);
      objc_msgSend(v84, "serviceBundleIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "hasPrefix:", CFSTR("com.apple."));

      if ((v86 & 1) != 0)
        goto LABEL_39;
      -[UIView window](self, "window");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "safeAreaInsets");
      v107 = v89;
      v108 = v88;
      v91 = v90;

      -[UIView window](self, "window");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v92, "interfaceOrientation") - 3) > 1)
      {

      }
      else
      {
        if (vabdd_f64(v70, v91) < 0.1 && v70 > 50.0)
        {

LABEL_38:
          v70 = 44.0;
          v74 = 44.0;
          goto LABEL_39;
        }

        if (vabdd_f64(v74, v107) < 0.1 && v74 > 50.0)
          goto LABEL_38;
      }
      v93 = vabdd_f64(v68, v108);
      if (v68 > 50.0 && v93 < 0.1)
        v68 = 44.0;
      goto LABEL_39;
    }
  }
LABEL_49:

}

- (void)_updateSceneGeometries:(id)a3 forOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  id *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id textEffectsOperatorProxy;
  id v24;

  v24 = a3;
  -[UIView _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v7, 1);
  v8 = (id *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v24)
  {
    if (!a4
      && ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0
       || (a4 = -[_UISizeTrackingView _interfaceOrientationForScene:](self, "_interfaceOrientationForScene:", v24)) == 0))
    {
      -[UIView window](self, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = objc_msgSend(v11, "interfaceOrientation");

    }
    self->_interfaceOrientation = a4;
    objc_msgSend(v24, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;

    if ((unint64_t)(a4 - 3) >= 2)
      v17 = v16;
    else
      v17 = v14;
    if ((unint64_t)(a4 - 3) < 2)
      v14 = v16;
  }
  else
  {
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v14 = *MEMORY[0x1E0C9D820];
    if (objc_msgSend(v8, "_isHostedInAnotherProcess"))
    {
      -[UIWindow _fbsScene](v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v10;
      v14 = v9;
      if (!v18)
      {
        objc_msgSend(v8, "hostedViewSize");
        v14 = v19;
        v17 = v20;
      }
    }
  }
  objc_msgSend(v8, "windowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "_enhancedWindowingEnabled") & 1) != 0)
  {

  }
  else
  {

    if (v14 != v9 || v17 != v10)
    {
      textEffectsOperatorProxy = self->_textEffectsOperatorProxy;
      -[_UISizeTrackingView _remoteTextEffectsWindowSizeFromSize:](self, "_remoteTextEffectsWindowSizeFromSize:", v14, v17);
      objc_msgSend(textEffectsOperatorProxy, "__setHostedViewSize:");
    }
  }

}

- (int64_t)_interfaceOrientationForScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isUISubclass"))
  {
    v6 = objc_msgSend(v5, "interfaceOrientation");
  }
  else
  {
    objc_msgSend(v3, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "interfaceOrientation");

  }
  return v6;
}

- (BOOL)_fencingEffectsAreVisible
{
  void *v3;
  _BOOL4 v4;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[UIView isHidden](self, "isHidden");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6;
  unint64_t var0;
  int v8;
  _BOOL4 v9;
  _UIRemoteViewController **p_remoteViewController;
  id WeakRetained;
  unsigned int v12;
  id v13;
  char v14;
  BOOL v15;
  void (**v16)(_QWORD);
  id v17;
  int v18;
  id v19;
  int v20;
  id v21;
  id v22;
  _QWORD aBlock[6];
  char v24;
  char v25;
  char v26;
  BOOL v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__223;
  v33 = __Block_byref_object_dispose__223;
  v34 = a3->var9;
  var0 = a3->var0;
  if (v6)
    v8 = 0;
  else
    v8 = (a3->var0 >> 3) & 1;
  if ((var0 & 0x10) != 0)
  {
    v9 = 1;
  }
  else if ((var0 & 6) != 0)
  {
    -[UIView frame](self, "frame");
    v9 = -[_UISizeTrackingView _needsTextEffectsUpdateToFrame:](self, "_needsTextEffectsUpdateToFrame:");
  }
  else
  {
    v9 = 0;
  }
  p_remoteViewController = &self->_remoteViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v12 = (v8 | v9) & ~objc_msgSend(WeakRetained, "_isUpdatingSize");

  if (v12 == 1)
  {
    v13 = objc_loadWeakRetained((id *)&self->_remoteViewController);
    v14 = objc_msgSend(v13, "_needsUnderflowPropertyUpdate");

    v15 = v30[5] != 0;
  }
  else
  {
    if (!v30[5])
      goto LABEL_18;
    v14 = 0;
    v15 = 1;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52___UISizeTrackingView__geometryChanged_forAncestor___block_invoke;
  aBlock[3] = &unk_1E16E88B0;
  v24 = v12;
  v25 = v14;
  v26 = v8;
  v27 = v9;
  v28 = v15;
  aBlock[4] = self;
  aBlock[5] = &v29;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  v17 = objc_loadWeakRetained((id *)p_remoteViewController);
  v18 = objc_msgSend(v17, "__shouldRemoteViewControllerFenceOperations");

  if (v18
    && (v19 = objc_loadWeakRetained((id *)p_remoteViewController),
        v20 = objc_msgSend(v19, "__shouldRemoteViewControllerFenceGeometryChange:forAncestor:", a3, v6),
        v19,
        v20))
  {
    v21 = objc_loadWeakRetained((id *)p_remoteViewController);
    objc_msgSend(v21, "synchronizeAnimationsInActions:", v16);

  }
  else
  {
    v16[2](v16);
  }
  v22 = objc_loadWeakRetained((id *)p_remoteViewController);
  objc_msgSend(v22, "updateTouchInterdictionViewLayout");

LABEL_18:
  _Block_object_dispose(&v29, 8);

}

- (CGSize)_sizeForRemoteViewService
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self, "bounds");
  -[_UISizeTrackingView _remoteViewServiceSizeFromSize:](self, "_remoteViewServiceSizeFromSize:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)_boundsForRemoteViewService
{
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
  CGRect result;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UISizeTrackingView _sizeForRemoteViewService](self, "_sizeForRemoteViewService");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_canSendViewServiceActualBoundingPath
{
  void *v3;
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
  double v15;
  int v16;
  char v17;
  char v18;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIView bounds](self, "bounds");
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "bounds");
    v16 = _UIRectEquivalentToRectWithAccuracy(v5, v7, v9, v11, v12, v13, v14, v15, 0.1);
    v17 = objc_msgSend(v3, "_isHostedInAnotherProcess");
    v18 = v17 & v16;
    if ((v17 & 1) == 0 && v16)
      v18 = objc_msgSend(v3, "_isSceneSized");
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_boundingPathForRemoteViewService
{
  void *v3;
  _UIRectangularBoundingPath *v4;
  _UIRectangularBoundingPath *v5;

  if (-[_UISizeTrackingView _canSendViewServiceActualBoundingPath](self, "_canSendViewServiceActualBoundingPath"))
  {
    -[UIView _effectiveBoundingPathAndBoundingPathView:](self, "_effectiveBoundingPathAndBoundingPathView:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "boundingPathForCoordinateSpace:", self);
    v4 = (_UIRectangularBoundingPath *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = [_UIRectangularBoundingPath alloc];
    -[_UISizeTrackingView _boundsForRemoteViewService](self, "_boundsForRemoteViewService");
    v4 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v5, "initWithCoordinateSpace:boundingRect:", self);
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[_UISizeTrackingView _boundingPathMayHaveChangedForView:relativeToBoundsOriginOnly:](self, "_boundingPathMayHaveChangedForView:relativeToBoundsOriginOnly:", self, 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[_UISizeTrackingView _boundingPathMayHaveChangedForView:relativeToBoundsOriginOnly:](self, "_boundingPathMayHaveChangedForView:relativeToBoundsOriginOnly:", self, 0);
}

- (void)_setNeedsRemoteViewServiceBoundingPathUpdate
{
  char sizeTrackingViewFlags;
  _QWORD v3[5];

  sizeTrackingViewFlags = (char)self->_sizeTrackingViewFlags;
  *(_BYTE *)&self->_sizeTrackingViewFlags = sizeTrackingViewFlags | 4;
  if ((sizeTrackingViewFlags & 8) == 0)
  {
    *(_BYTE *)&self->_sizeTrackingViewFlags = sizeTrackingViewFlags | 0xC;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67___UISizeTrackingView__setNeedsRemoteViewServiceBoundingPathUpdate__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v3);
  }
}

- (void)_clearNeedsRemoteViewServiceBoundingPathUpdate
{
  *(_BYTE *)&self->_sizeTrackingViewFlags &= ~4u;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromWindow:", 0, x, y);
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", 0);
  v10 = v9;
  v12 = v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_scrollToTopFromTouchAtViewLocation:resultHandler:", v7, v10, v12);

}

- (void)_willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[UIView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (*(_BYTE *)&self->_sizeTrackingViewFlags & 2) != 0)
  {
    -[UIView _removeBoundingPathChangeObserver:](self, "_removeBoundingPathChangeObserver:", self);
    *(_BYTE *)&self->_sizeTrackingViewFlags &= ~2u;
  }
  -[_UISizeTrackingView _setNeedsRemoteViewServiceBoundingPathUpdate](self, "_setNeedsRemoteViewServiceBoundingPathUpdate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v7 = v4;
  if (WeakRetained)
  {
    objc_msgSend(v5, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
    {
      if (v8 && v9 && v8 != (void *)v9)
      {
        objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
        -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)WeakRetained);
      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60___UIRemoteViewController__viewWillMoveFromWindow_toWindow___block_invoke;
      v12[3] = &unk_1E16B1B50;
      v12[4] = WeakRetained;
      v13 = v7;
      objc_msgSend(WeakRetained, "_synchronizeAnimationsInActionsIfNecessary:", v12);

    }
    else
    {
      objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0);
      -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)WeakRetained);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)_UISizeTrackingView;
  -[UIView _willMoveToWindow:](&v11, sel__willMoveToWindow_, v7);

}

- (void)_updateSceneGeometries:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UIView window](self, "window");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _fbsScene](v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", 0x1E1764C60);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = v10;
  if (v10 && self->_interfaceOrientation != v8)
  {
    -[_UISizeTrackingView _updateSceneGeometries:forOrientation:](self, "_updateSceneGeometries:forOrientation:", v10);
    v9 = v10;
  }

}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id *v7;
  id WeakRetained;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  id v20;
  id *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  id v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  id *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (id *)a4;
  v55.receiver = self;
  v55.super_class = (Class)_UISizeTrackingView;
  -[UIView _didMoveFromWindow:toWindow:](&v55, sel__didMoveFromWindow_toWindow_, v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v9 = objc_msgSend(WeakRetained, "_serviceHasScrollToTopView");

  if (v9)
  {
    objc_msgSend(v6, "_unregisterScrollToTopView:", self);
    objc_msgSend(v7, "_registerScrollToTopView:", self);
  }
  -[UIView frame](self, "frame");
  -[_UISizeTrackingView _updateTextEffectsGeometries:](self, "_updateTextEffectsGeometries:");
  if (v7)
  {
    objc_msgSend(v7[101], "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISizeTrackingView _updateSceneGeometries:forOrientation:](self, "_updateSceneGeometries:forOrientation:", v10, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__updateSceneGeometries_, 0x1E1764C40, v7);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, 0x1E1764C40, v6);

  }
  v13 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v14 = objc_msgSend(v13, "serviceViewShouldShareTouchesWithHost");

  v15 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v16 = v15;
  if (v7 && v14)
    objc_msgSend(v15, "_prepareTouchDeliveryPolicy");
  else
    objc_msgSend(v15, "_setTouchDeliveryPolicyAssertion:", 0);

  v17 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(v17, "_noteWindowState:", v7 != 0);

  if (v7)
  {
    if ((*(_BYTE *)&self->_sizeTrackingViewFlags & 2) == 0)
    {
      objc_msgSend(v7, "screen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[UIView _shouldSkipObservingBoundingPathChangesForScreen:]((_BOOL8)self, v18);

      if (!v19)
      {
        *(_BYTE *)&self->_sizeTrackingViewFlags |= 2u;
        -[UIView _addBoundingPathChangeObserver:](self, "_addBoundingPathChangeObserver:", self);
      }
    }
  }
  -[_UISizeTrackingView _setNeedsRemoteViewServiceBoundingPathUpdate](self, "_setNeedsRemoteViewServiceBoundingPathUpdate");
  v20 = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v21 = v7;
  if (v20)
  {
    if (!os_variant_has_internal_diagnostics())
      goto LABEL_17;
    if (!v21)
      goto LABEL_17;
    objc_msgSend(v21, "rootViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = UIEqual_0(v27, v20);

    objc_msgSend(v20, "parentViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "presentingViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v28 & 1) != 0 || v29 || v30)
      goto LABEL_17;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        goto LABEL_32;
      v45 = (void *)MEMORY[0x1E0CB3940];
      v46 = v20;
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("<%@: %p>"), v48, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = (void *)MEMORY[0x1E0CB3940];
      v51 = v21;
      v41 = v49;
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringWithFormat:", CFSTR("<%@: %p>"), v53, v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412546;
      v57 = v49;
      v58 = 2112;
      v59 = v54;
      _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "A remote view controller's view is in a window without the view controller being properly added to the hierarchy. viewController=%@; window=%@",
        buf,
        0x16u);

    }
    else
    {
      v31 = _viewDidMoveFromWindow_toWindow____s_category;
      if (!_viewDidMoveFromWindow_toWindow____s_category)
      {
        v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v31, (unint64_t *)&_viewDidMoveFromWindow_toWindow____s_category);
      }
      v32 = *(NSObject **)(v31 + 8);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = v20;
      v35 = v32;
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v37, v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = v21;
      v41 = v38;
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("<%@: %p>"), v43, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412546;
      v57 = v38;
      v58 = 2112;
      v59 = v44;
      _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "A remote view controller's view is in a window without the view controller being properly added to the hierarchy. viewController=%@; window=%@",
        buf,
        0x16u);

    }
LABEL_32:

LABEL_17:
    objc_msgSend(*((id *)v20 + 138), "window");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(*((id *)v20 + 138), "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "windowScene");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "windowScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v26)
        objc_msgSend(v20, "_restoreTextEffectsRemoteView");
    }
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService sizeTrackingViewDidMoveToWindow:](*((_QWORD *)v20 + 175), v21);
    -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)v20, v21);
  }

}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  id v6;
  id v7;
  void **WeakRetained;
  id v9;
  id v10;
  int v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UISizeTrackingView;
  v6 = a4;
  v7 = a3;
  -[UIView _viewDidMoveFromScreen:toScreen:](&v13, sel__viewDidMoveFromScreen_toScreen_, v7, v6);
  WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_remoteViewController);
  v9 = v7;
  v10 = v6;
  if (v10 && WeakRetained)
  {
    v11 = *((unsigned __int8 *)WeakRetained + 1232);
    objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0, v13.receiver, v13.super_class);
    -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded]((uint64_t *)WeakRetained);
    objc_msgSend(WeakRetained, "_notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded:", v10);
    if (v11 && !*((_BYTE *)WeakRetained + 1232))
      objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 1);
    v12 = WeakRetained[156];
    if (v12)
      -[_UIRemoteViewController _updateDynamicButtonEventDeferringIfNeededWithOldResolvedConfigurations:newResolvedConfigurations:](WeakRetained, v12, WeakRetained[156]);
  }

}

- (void)_prepareForWindowHostingSceneRemoval
{
  _UIRemoteViewController **p_remoteViewController;
  id WeakRetained;
  uint64_t *v5;
  id v6;
  objc_super v7;

  p_remoteViewController = &self->_remoteViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0);

  v5 = (uint64_t *)objc_loadWeakRetained((id *)p_remoteViewController);
  -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded](v5);

  v6 = objc_loadWeakRetained((id *)p_remoteViewController);
  -[_UIRemoteViewController _updateParentHostingRegistryIfNecessaryForWindow:]((uint64_t)v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)_UISizeTrackingView;
  -[UIView _prepareForWindowHostingSceneRemoval](&v7, sel__prepareForWindowHostingSceneRemoval);
}

- (void)_prepareForWindowDealloc
{
  _UIRemoteViewController **p_remoteViewController;
  id WeakRetained;
  uint64_t *v5;
  objc_super v6;

  p_remoteViewController = &self->_remoteViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  objc_msgSend(WeakRetained, "_setWantsKeyboardEnvironmentEventDeferring:", 0);

  v5 = (uint64_t *)objc_loadWeakRetained((id *)p_remoteViewController);
  -[_UIRemoteViewController _endDynamicButtonEventDeferringIfNeeded](v5);

  v6.receiver = self;
  v6.super_class = (Class)_UISizeTrackingView;
  -[UIView _prepareForWindowDealloc](&v6, sel__prepareForWindowDealloc);
}

- (_UIRemoteViewController)remoteViewController
{
  return (_UIRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (id)nextResponder
{
  _WORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISizeTrackingView;
  -[UIView nextResponder](&v7, sel_nextResponder);
  v3 = (_WORD *)objc_claimAutoreleasedReturnValue();
  -[UIView __viewDelegate]((id *)&self->super.super.super.isa);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v3 == (_WORD *)v4 && (v3[188] & 0x80) != 0)
  {

    v3 = 0;
  }

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewForRemoteTextEffectsWindowMatchAnimation);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_destroyWeak((id *)&self->_remoteViewController);
}

@end
