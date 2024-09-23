@implementation UIInputWindowController

void __59__UIInputWindowController_updateKeyboardPlacementForGuide___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isTrackingKeyboard"))
    objc_msgSend(v3, "updateGuideForKeyboardPlacement:", *(_QWORD *)(a1 + 32));

}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (dyld_program_sdk_at_least())
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInputWindowController;
    return -[UIViewController overrideUserInterfaceStyle](&v7, sel_overrideUserInterfaceStyle);
  }
  else
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_inheritedRenderConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "lightKeyboard"))
      v3 = 1;
    else
      v3 = 2;

  }
  return v3;
}

void __51__UIInputWindowController_keyboardDismissWithInfo___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "isTrackingKeyboard"))
  {
    objc_msgSend(*(id *)(a1 + 32), "beginFrame");
    v4 = v3;
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "endFrame");
    v9 = vabdd_f64(v4, v7);
    v10 = 4;
    v11 = 2;
    v12 = 4;
    if (v7 > v4)
      v12 = 8;
    if (v4 <= v7)
      v11 = v12;
    if (v9 > 5.0)
      v10 = v11;
    if (v6 == v8)
      v13 = v10;
    else
      v13 = 4;
    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(v15, "moveKeyboardLayoutGuideOverEdge:layoutViews:", v13, v14 > 0.0);
  }

}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
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
  objc_super v16;
  UIEdgeInsets result;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isTextEffectsWindow")
    && (objc_msgSend(v3, "_isHostedInAnotherProcess") & 1) != 0)
  {
    objc_msgSend(v3, "hostedSafeInsets");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIInputWindowController;
    -[UIViewController _viewSafeAreaInsetsFromScene](&v16, sel__viewSafeAreaInsetsFromScene);
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)keyboardMovedToScreenPosition:(CGRect)a3 animated:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  BOOL v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  void *v54;
  double MaxY;
  void *v56;
  double v57;
  double MinX;
  void *v59;
  double v60;
  uint64_t v61;
  void *v62;
  void (**v63)(_QWORD, _QWORD);
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  _QWORD aBlock[5];
  id v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  char v86;
  BOOL v87;
  _BYTE v88[128];
  uint64_t v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v89 = *MEMORY[0x1E0C80C00];
  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    -[UIViewController _window](self, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_isHostedInAnotherProcess");

    -[UIViewController _window](self, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController _window](self, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hostedViewOrigin");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasActiveKeyboardResponder");

    -[UIInputWindowController placement](self, "placement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isUndocked") & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      -[UIInputWindowController placement](self, "placement");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isFloating") & 1) != 0)
      {
        v19 = 1;
      }
      else
      {
        -[UIInputWindowController placement](self, "placement");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isFloatingAssistantView") & 1) != 0)
        {
          v19 = 1;
        }
        else
        {
          -[UIInputWindowController placement](self, "placement");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v22, "isHiddenForFloatingTransition");

        }
      }

    }
    v90.origin.x = x;
    v90.origin.y = y;
    v90.size.width = width;
    v90.size.height = height;
    if (!CGRectIsEmpty(v90))
    {
      -[UIViewController _window](self, "_window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[UIViewController _window](self, "_window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "screen");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v99.origin.x = v34;
      v99.origin.y = v35;
      v99.size.width = v36;
      v99.size.height = v37;
      v91.origin.x = v25;
      v91.origin.y = v27;
      v91.size.width = v29;
      v91.size.height = v31;
      v38 = CGRectEqualToRect(v91, v99);

      v39 = height;
      v40 = width;
      v41 = y;
      v42 = x;
      if (!v38)
      {
        -[UIViewController _window](self, "_window");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "windowScene");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "coordinateSpace");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "convertRect:toCoordinateSpace:", v45, x, y, width, height);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v53 = v52;

        -[UIViewController _window](self, "_window");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "bounds");
        v100.origin.x = v47;
        v100.origin.y = v49;
        v100.size.width = v51;
        v100.size.height = v53;
        v93 = CGRectIntersection(v92, v100);
        v42 = v93.origin.x;
        v41 = v93.origin.y;
        v40 = v93.size.width;
        v39 = v93.size.height;

      }
      -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v40, v39, *(_QWORD *)&width, *(_QWORD *)&height);
      v94.origin.x = v42;
      v94.origin.y = v41;
      v94.size.width = v40;
      v94.size.height = v39;
      MaxY = CGRectGetMaxY(v94);
      -[UIViewController _window](self, "_window");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "frame");
      v57 = CGRectGetMaxY(v95);

      if (MaxY < v57)
      {
        v96.origin.x = v42;
        v96.origin.y = v41;
        v96.size.width = v40;
        v96.size.height = v39;
        MinX = CGRectGetMinX(v96);
        -[UIViewController _window](self, "_window");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "frame");
        v60 = CGRectGetMaxY(v97);
        v98.origin.x = v42;
        v98.origin.y = v41;
        v98.size.width = v40;
        v98.size.height = v39;
        -[UIInputWindowController updateTrackingElementsWithOffset:](self, "updateTrackingElementsWithOffset:", MinX, v60 - CGRectGetMaxY(v98));

      }
      v61 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke;
      aBlock[3] = &unk_1E16D5DB8;
      v85 = v19;
      v81 = x;
      v82 = y;
      v83 = v71;
      v84 = v72;
      v86 = v11;
      aBlock[4] = self;
      v80 = v14;
      v87 = a4;
      v62 = _Block_copy(aBlock);
      v63 = (void (**)(_QWORD, _QWORD))v62;
      if ((v17 | v11) == 1)
      {
        v77[0] = v61;
        v77[1] = 3221225472;
        v77[2] = __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke_2;
        v77[3] = &unk_1E16D5D90;
        v78 = v62;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v77);
        v64 = v78;
      }
      else
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        -[UIViewController _window](self, "_window");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "windowScene");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "windows");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v74;
          do
          {
            v70 = 0;
            do
            {
              if (*(_QWORD *)v74 != v69)
                objc_enumerationMutation(v64);
              v63[2](v63, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v70++));
            }
            while (v68 != v70);
            v68 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          }
          while (v68);
        }
      }

    }
  }
}

void __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  double width;
  double v13;
  double height;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MaxY;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v58 = a2;
  if (!objc_msgSend(v58, "isTrackingKeyboard"))
    goto LABEL_23;
  objc_msgSend(v58, "_primaryKeyboardTrackingGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocked:", *(_BYTE *)(a1 + 80) == 0);

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || *(_BYTE *)(a1 + 81))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v58, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinateSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:toCoordinateSpace:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    x = v7;
    y = v9;
    width = v11;
    height = v13;

    if (!*(_BYTE *)(a1 + 81) || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(v58, "frame");
      v68.origin.x = v15;
      v68.origin.y = v16;
      v68.size.width = v17;
      v68.size.height = v18;
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = width;
      v59.size.height = height;
      v60 = CGRectIntersection(v59, v68);
      x = v60.origin.x;
      y = v60.origin.y;
      width = v60.size.width;
      height = v60.size.height;
    }
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    if (!CGRectIsEmpty(v61))
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v58, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertRect:fromWindow:", v58, v20, v22, v24, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    v62.origin.x = v29;
    v62.origin.y = v31;
    v62.size.width = v33;
    v62.size.height = v35;
    v63 = CGRectIntersection(v62, *(CGRect *)(a1 + 48));
    v36 = v63.origin.x;
    v37 = v63.origin.y;
    v38 = v63.size.width;
    v39 = v63.size.height;
    if (!CGRectIsNull(v63))
    {
      objc_msgSend(*(id *)(a1 + 32), "_window");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "convertRect:toWindow:", v58, v36, v37, v38, v39);
      x = v54;
      y = v55;
      width = v56;
      height = v57;

      goto LABEL_11;
    }
  }
  objc_msgSend(v58, "frame");
  y = CGRectGetMaxY(v64);
  objc_msgSend(v58, "frame");
  width = v40;
  objc_msgSend(v58, "insetForDismissedKeyboardGuide");
  height = v41;
  x = 0.0;
LABEL_11:
  objc_msgSend(v58, "insetForDismissedKeyboardGuide");
  if (height < v42)
  {
    objc_msgSend(v58, "insetForDismissedKeyboardGuide");
    height = v43;
  }
  objc_msgSend(v58, "frame");
  MaxY = CGRectGetMaxY(v65);
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  v45 = MaxY - CGRectGetMaxY(v66);
  if (v45 > 0.0 && !*(_BYTE *)(a1 + 80))
    v45 = 0.0;
  v46 = v58;
  if (!*(_BYTE *)(a1 + 82))
  {
    objc_msgSend(v58, "_primaryKeyboardTrackingGuide");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "enableAnimations:", 0);

    v46 = v58;
  }
  objc_msgSend(v46, "_primaryKeyboardTrackingGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  v49 = objc_msgSend(v48, "changeOffsetConstants:", CGRectGetMinX(v67), v45);

  objc_msgSend(v58, "_primaryKeyboardTrackingGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "changeSizingConstants:", width, height);

  if ((v49 & 1) != 0 || v51)
  {
    if (*(_BYTE *)(a1 + 82))
      objc_msgSend(v58, "layoutViewsForTrackedGuides");
  }
  objc_msgSend(v58, "_primaryKeyboardTrackingGuide");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "enableAnimations:", 1);

LABEL_23:
}

- (void)keyboardMoveWithInfo:(id)a3
{
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  char v28;
  double v29;
  id v30;
  CGRect v31;

  v30 = a3;
  v4 = -[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide");
  v5 = v30;
  if (v4)
  {
    objc_msgSend(v30, "endFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIViewController _window](self, "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_isHostedInAnotherProcess");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasActiveKeyboardResponder");

    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    if (CGRectIsEmpty(v31))
    {
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_5;
      v19 = (void *)v18;
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "toPlacement");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "showsInputOrAssistantViews");

      v5 = v30;
      if ((v22 & 1) == 0)
      {
LABEL_5:
        -[UIInputWindowController keyboardDismissWithInfo:](self, "keyboardDismissWithInfo:", v30);
LABEL_13:
        v5 = v30;
      }
    }
    else
    {
      v23 = ((v15 | v17 ^ 1) & 1) != 0 || +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
      -[UIViewController _window](self, "_window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_isRemoteKeyboardWindow");

      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isInputViewPlaceholder");

      v28 = objc_msgSend(v30, "forWritingToolsSheet");
      v5 = v30;
      if ((v28 & 1) != 0 || !v27 || (v23 & ~v25) != 0)
      {
        objc_msgSend(v30, "duration");
        -[UIInputWindowController keyboardMovedToScreenPosition:animated:](self, "keyboardMovedToScreenPosition:animated:", v29 > 0.0, v7, v9, v11, v13);
        goto LABEL_13;
      }
    }
  }

}

- (void)keyboardDismissWithInfo:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    if ((objc_msgSend(v7, "dueToRotation") & 1) == 0)
    {
      -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[UIViewController _window](self, "_window");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bounds");
        -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v6, 0.0);

        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __51__UIInputWindowController_keyboardDismissWithInfo___block_invoke;
        v8[3] = &unk_1E16B29D0;
        v9 = v7;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v8);

      }
    }
  }

}

- (void)loadView
{
  UIInputSetContainerView *v3;
  UIInputSetContainerView *v4;
  void *v5;
  id v6;

  v3 = [UIInputSetContainerView alloc];
  v4 = -[UIInputSetContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIViewController setView:](self, "setView:", v4);

  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

}

uint64_t __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double *v5;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  void *v14;
  double *v15;
  double v16;
  double v17;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  uint64_t result;
  double *v26;
  double v27;
  double v28;
  void *v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  void *v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("bounds"));

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("bounds"));

  objc_msgSend(*(id *)(a1 + 48), "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("bounds"));

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  if (!CGRectIsEmpty(v45))
  {
    v5 = (double *)(*(_QWORD *)(a1 + 56) + 1048);
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v7 = *v5;
    if (*MEMORY[0x1E0C9D820] != *v5 || v6 != *(double *)(*(_QWORD *)(a1 + 56) + 1056))
    {
      v9 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v9, "transform", *MEMORY[0x1E0C9D820], v6);
        v7 = *(double *)(*(_QWORD *)(a1 + 56) + 1048);
        v9 = *(void **)(a1 + 32);
      }
      else
      {
        memset(&v43, 0, sizeof(v43));
      }
      objc_msgSend(v9, "bounds");
      v10 = *(double *)(*(_QWORD *)(a1 + 56) + 1056);
      v12 = v7 / v11;
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      CGAffineTransformScale(&v44, &v43, v12, v10 / v13);
      v14 = *(void **)(a1 + 32);
      v42 = v44;
      objc_msgSend(v14, "setTransform:", &v42);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  if (!CGRectIsEmpty(v46))
  {
    v15 = (double *)(*(_QWORD *)(a1 + 56) + 1064);
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v17 = *v15;
    if (*MEMORY[0x1E0C9D820] != *v15 || v16 != *(double *)(*(_QWORD *)(a1 + 56) + 1072))
    {
      v19 = *(void **)(a1 + 40);
      if (v19)
      {
        objc_msgSend(v19, "transform", *MEMORY[0x1E0C9D820], v16);
        v17 = *(double *)(*(_QWORD *)(a1 + 56) + 1064);
        v19 = *(void **)(a1 + 40);
      }
      else
      {
        memset(&v40, 0, sizeof(v40));
      }
      objc_msgSend(v19, "bounds");
      v20 = *(double *)(*(_QWORD *)(a1 + 56) + 1072);
      v22 = v17 / v21;
      objc_msgSend(*(id *)(a1 + 40), "bounds");
      CGAffineTransformScale(&v41, &v40, v22, v20 / v23);
      v24 = *(void **)(a1 + 40);
      v39 = v41;
      objc_msgSend(v24, "setTransform:", &v39);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  result = CGRectIsEmpty(v47);
  if ((result & 1) == 0)
  {
    v26 = (double *)(*(_QWORD *)(a1 + 56) + 1080);
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v28 = *v26;
    if (*MEMORY[0x1E0C9D820] != *v26 || v27 != *(double *)(*(_QWORD *)(a1 + 56) + 1088))
    {
      v30 = *(void **)(a1 + 48);
      if (v30)
      {
        objc_msgSend(v30, "transform", *MEMORY[0x1E0C9D820], v27);
        v30 = *(void **)(a1 + 48);
        v28 = *(double *)(*(_QWORD *)(a1 + 56) + 1080);
      }
      else
      {
        memset(&v37, 0, sizeof(v37));
      }
      objc_msgSend(v30, "bounds");
      v31 = *(double *)(*(_QWORD *)(a1 + 56) + 1088);
      v33 = v28 / v32;
      objc_msgSend(*(id *)(a1 + 48), "bounds");
      CGAffineTransformScale(&v38, &v37, v33, v31 / v34);
      v35 = *(void **)(a1 + 48);
      v36 = v38;
      return objc_msgSend(v35, "setTransform:", &v36);
    }
  }
  return result;
}

void __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "postRotationPlacement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlacement:", v2);

}

void __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_2(uint64_t a1)
{
  id v2;

  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlacement:", v2);

}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "_updateBackdropViews");
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_9(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "changedAccessoryOnly"))
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "layoutIfNeeded");

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "_updateBackdropViews");
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_11()
{
  return +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
}

uint64_t __83__UIInputWindowController_setPlacement_quietly_animated_generateSplitNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlacement:quietly:animated:generateSplitNotification:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 49));
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, 0.0, 0.0);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "activationState") == -1
    || (objc_msgSend(v3, "_orientationTransactionToken"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = 30;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputWindowController;
    v7 = -[UIApplicationRotationFollowingController supportedInterfaceOrientations](&v9, sel_supportedInterfaceOrientations);
  }

  return v7;
}

- (void)popAnimationStyle
{
  if (-[NSMutableArray count](self->_animationStyleStack, "count"))
    -[NSMutableArray removeLastObject](self->_animationStyleStack, "removeLastObject");
}

- (void)setPostRotationPendingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (void)registerPowerLogEvent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v3 = a3;
  v12[4] = *MEMORY[0x1E0C80C00];
  if (a3 || self->_wasOnScreen)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isExtensionInputMode"))
    {
      objc_msgSend(v6, "identifier");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR("System");
    }
    if (v7 != (__CFString *)self->_lastKeyboardID || self->_wasOnScreen != v3)
    {
      v11[0] = CFSTR("Process-ID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v12[1] = v7;
      v11[1] = CFSTR("Keyboard-ID");
      v11[2] = CFSTR("Status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2] = v9;
      v11[3] = CFSTR("Timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[3] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
      PLLogRegisteredEvent();

      self->_wasOnScreen = v3;
      objc_storeStrong((id *)&self->_lastKeyboardID, v7);
    }

  }
}

- (BOOL)dontDismissReachability
{
  return self->_dontDismissReachability;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _BOOL4 v7;
  void *v8;
  UIInputViewSetNotificationInfo **p_rotationInfo;
  uint64_t v10;
  void *v11;
  UIView *preRotationSnapshot;
  UIView *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  UIInputWindowControllerHosting *hosting;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  UIView *v29;
  UIView *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  CGFloat v53;
  CGFloat v54;
  CGSize *p_preRotationInputAssistantViewSize;
  void *v56;
  void *v57;
  CGFloat v58;
  CGFloat v59;
  CGSize *p_preRotationInputAccessoryViewSize;
  void *v61;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  void *v65;
  void *v66;
  CGAffineTransform *p_preRotationInputAssistantViewTransform;
  void *v68;
  void *v69;
  void *v70;
  CGAffineTransform *p_preRotationInputAccessoryViewTransform;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[6];
  _QWORD v87[5];
  _QWORD v88[5];

  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled") && !self->_rotationState)
  {
    self->_rotationState = 1;
    v7 = -[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards");
    if (v7)
    {
      +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    p_rotationInfo = &self->_rotationInfo;
    objc_storeStrong((id *)&self->_rotationInfo, v8);
    if (v7)

    v10 = MEMORY[0x1E0C809B0];
    if (*p_rotationInfo)
    {
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke;
      v88[3] = &unk_1E16B1B28;
      v88[4] = self;
      -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v88);
      -[UIInputViewSetNotificationInfo addKeyboardNotificationDebuggingInfo:](*p_rotationInfo, "addKeyboardNotificationDebuggingInfo:", CFSTR("willRotateToInterfaceOrientation: update _rotationInfo"));
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](*p_rotationInfo, "setWasCausedRemotely:", objc_msgSend(v11, "keyboardActive") ^ 1);

    }
    preRotationSnapshot = self->_preRotationSnapshot;
    if (preRotationSnapshot)
    {
      -[UIView removeFromSuperview](preRotationSnapshot, "removeFromSuperview");
      v13 = self->_preRotationSnapshot;
      self->_preRotationSnapshot = 0;

    }
    -[UIInputWindowController placement](self, "placement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "showsKeyboard"))
    {

    }
    else
    {
      -[UIInputWindowController placement](self, "placement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewSetPlacement placement](UIInputViewSetPlacementInitialPosition, "placement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if ((v17 & 1) == 0)
        -[UIInputWindowController updateGuideForOffscreenRotationWithDuration:](self, "updateGuideForOffscreenRotationWithDuration:", a4);
    }
    v18 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
    hosting = self->_hosting;
    if (v18)
    {
      -[UIInputWindowControllerHosting itemForPurpose:](hosting, "itemForPurpose:", 2);
      v82 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "splitKeyboardController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cancelGestureRecognizers");

    }
    else
    {
      -[UIInputWindowControllerHosting itemForPurpose:](hosting, "itemForPurpose:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hostView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;
      v26 = v25;

      if (v24 > 0.0 && v26 > 0.0)
      {
        -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hostView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "snapshotViewAfterScreenUpdates:", 0);
        v29 = (UIView *)objc_claimAutoreleasedReturnValue();
        v30 = self->_preRotationSnapshot;
        self->_preRotationSnapshot = v29;

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_preRotationSnapshot, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v87[0] = v10;
        v87[1] = 3221225472;
        v87[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_2;
        v87[3] = &unk_1E16B1B28;
        v87[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v87);
        -[UIInputWindowController inputViewSet](self, "inputViewSet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = objc_msgSend(v31, "isSplit");

        if ((_DWORD)v28)
        {
          -[UIView bounds](self->_preRotationSnapshot, "bounds");
          if (v32 <= 0.0)
          {
            v41 = 0.2;
            v40 = 0.4;
          }
          else
          {
            v33 = v32;
            -[UIInputWindowController inputViewSet](self, "inputViewSet");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "_rightInputViewSetFrame");
            v36 = v35;

            -[UIInputWindowController inputViewSet](self, "inputViewSet");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "_leftInputViewSetFrame");
            v39 = v38;

            v40 = v39 / v33;
            v41 = (v33 - v39 - v36) / v33;
          }
          -[UIView layer](self->_preRotationSnapshot, "layer");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setContentsCenter:", v40, 0.0, v41, 1.0);

        }
      }
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = (void *)v43;
        -[UIInputWindowController transientInputViewSet](self, "transientInputViewSet");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          -[UIInputWindowController transientInputViewSet](self, "transientInputViewSet");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIInputWindowController changeToInputViewSet:](self, "changeToInputViewSet:", v46);

        }
      }
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "toPlacement");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        -[UIInputWindowController setPostRotationPlacement:](self, "setPostRotationPlacement:", v48);
      }
      else
      {
        -[UIInputWindowController placement](self, "placement");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowController setPostRotationPlacement:](self, "setPostRotationPlacement:", v49);

      }
      -[UIInputWindowController setPostRotationPendingBlock:](self, "setPostRotationPendingBlock:", 0);
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController pushAnimationStyle:](self, "pushAnimationStyle:", v50);

      v86[0] = v10;
      v86[1] = 3221225472;
      v86[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_3;
      v86[3] = &unk_1E16B1888;
      v86[4] = self;
      v86[5] = a3;
      -[UIInputWindowController performWithoutAppearanceCallbacks:](self, "performWithoutAppearanceCallbacks:", v86);
      if (self->_preRotationSnapshot)
      {
        -[UIViewController view](self, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addSubview:", self->_preRotationSnapshot);

      }
      -[UIInputWindowController _inputView](self, "_inputView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bounds");
      self->_preRotationInputViewSize.width = v53;
      self->_preRotationInputViewSize.height = v54;

      p_preRotationInputAssistantViewSize = &self->_preRotationInputAssistantViewSize;
      -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "bounds");
        p_preRotationInputAssistantViewSize->width = v58;
        self->_preRotationInputAssistantViewSize.height = v59;

      }
      else
      {
        *p_preRotationInputAssistantViewSize = *(CGSize *)MEMORY[0x1E0C9D820];
      }

      p_preRotationInputAccessoryViewSize = &self->_preRotationInputAccessoryViewSize;
      -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bounds");
        p_preRotationInputAccessoryViewSize->width = v63;
        self->_preRotationInputAccessoryViewSize.height = v64;

      }
      else
      {
        *p_preRotationInputAccessoryViewSize = *(CGSize *)MEMORY[0x1E0C9D820];
      }

      -[UIInputWindowController _inputView](self, "_inputView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
      {
        objc_msgSend(v65, "transform");
      }
      else
      {
        v84 = 0u;
        v85 = 0u;
        v83 = 0u;
      }
      *(_OWORD *)&self->_preRotationInputViewTransform.a = v83;
      *(_OWORD *)&self->_preRotationInputViewTransform.c = v84;
      *(_OWORD *)&self->_preRotationInputViewTransform.tx = v85;

      p_preRotationInputAssistantViewTransform = &self->_preRotationInputAssistantViewTransform;
      -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v69;
        if (v69)
        {
          objc_msgSend(v69, "transform");
        }
        else
        {
          v84 = 0u;
          v85 = 0u;
          v83 = 0u;
        }
        *(_OWORD *)&p_preRotationInputAssistantViewTransform->a = v83;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.c = v84;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.tx = v85;

      }
      else
      {
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.c = 0u;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.tx = 0u;
        *(_OWORD *)&p_preRotationInputAssistantViewTransform->a = 0u;
      }

      p_preRotationInputAccessoryViewTransform = &self->_preRotationInputAccessoryViewTransform;
      -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
      {
        -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v73;
        if (v73)
        {
          objc_msgSend(v73, "transform");
        }
        else
        {
          v84 = 0u;
          v85 = 0u;
          v83 = 0u;
        }
        *(_OWORD *)&p_preRotationInputAccessoryViewTransform->a = v83;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.c = v84;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.tx = v85;

      }
      else
      {
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.c = 0u;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.tx = 0u;
        *(_OWORD *)&p_preRotationInputAccessoryViewTransform->a = 0u;
      }

      -[UIInputWindowController _inputView](self, "_inputView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setAlpha:", 0.0);

      -[UIInputWindowController _inputView](self, "_inputView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "layer");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setAllowsGroupOpacity:", 0);

      -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "layer");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setAllowsGroupOpacity:", 0);

      -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setAlpha:", 0.0);

      -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setAlpha:", 0.0);

    }
  }
}

- (UIView)_inputAssistantView
{
  void *v2;
  void *v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)_inputView
{
  void *v2;
  void *v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)initialNotificationInfo
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[UIInputWindowController templateNotificationInfo](self, "templateNotificationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (UIInputViewSetNotificationInfo)templateNotificationInfo
{
  return self->_templateNotificationInfo;
}

- (BOOL)shouldPostNotification:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  int v12;
  BOOL v14;

  v6 = a4;
  if (!-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
    goto LABEL_14;
  v7 = 1;
  if (!a3 || self->_suppressedNotifications || !objc_msgSend(v6, "containsChange"))
    goto LABEL_15;
  -[UIViewController _window](self, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "_isTextEffectsWindowNotificationOwner")
    || objc_msgSend((id)UIApp, "isSuspended") && self->_isSnapshotting
    || -[UIInputWindowController isTransitioningBetweenFloatingStates](self, "isTransitioningBetweenFloatingStates"))
  {
    goto LABEL_13;
  }
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCustomInputView");
  if (a3 == 2 && (v10 & 1) == 0)
  {
    objc_msgSend(v6, "endFrame");
    if (v11 == 0.0)
    {

LABEL_13:
LABEL_14:
      v7 = 1;
LABEL_15:
      v12 = v7 & (objc_msgSend(v6, "nonKeyboardOverride") ^ 1);
      goto LABEL_16;
    }
  }
  v14 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");

  if (v14)
    goto LABEL_14;
  if (!self->_externalTrackingUpdateInProgress)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v6, "nonKeyboardOverride") ^ 1;
LABEL_16:
  if (objc_msgSend(v6, "waitingForInputUI"))
  {
    -[UIInputWindowController setNotificationInfoWaitingForInputUI:](self, "setNotificationInfoWaitingForInputUI:", v6);
    LOBYTE(v12) = 1;
  }

  return v12 ^ 1;
}

- (BOOL)shouldNotifyRemoteKeyboards
{
  return self->_shouldNotifyRemoteKeyboards;
}

- (void)setPlacementDuringAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_placementDuringAnimation, a3);
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (UIInputViewSetPlacement)placement
{
  return self->_placement;
}

- (void)_collectTransitionTimeStatistics:(unint64_t)a3 withStart:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[6];

  v6 = a4;
  if (v6
    && !-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards")
    && (objc_msgSend((id)UIApp, "launchedToTest") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8;
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isDescendantOfView:", v11))
    {

      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        kdebug_trace();
        dispatch_get_global_queue(-2, 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __70__UIInputWindowController__collectTransitionTimeStatistics_withStart___block_invoke;
        v13[3] = &__block_descriptor_48_e5_v8__0l;
        v13[4] = a3;
        v13[5] = v9;
        dispatch_async(v12, v13);

      }
    }
    else
    {

    }
  }

}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFloating");
  if ((result & 1) == 0)
    return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &__block_literal_global_554);
  return result;
}

- (BOOL)_allowsSkippingLayout
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)keyboardOrientation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 <= v6)
    return 1;
  else
    return 4;
}

uint64_t __59__UIInputWindowController_updateKeyboardDockViewVisibility__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateKeyboardDockViewVisibility");
}

- (void)moveFromPlacement:(id)a3 toPlacement:(id)a4 starting:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  UIInputViewSetPlacement *placement;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  __objc2_class **v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  void *v43;
  void *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  void *v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  int v59;
  int v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  char v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  char v79;
  char v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  NSObject *v98;
  os_signpost_id_t v99;
  os_signpost_id_t v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void (**v106)(void);
  id v107;
  _QWORD v108[4];
  id v109;
  UIInputWindowController *v110;
  id v111;
  id v112;
  id v113;
  _QWORD v114[5];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  _QWORD v120[5];
  id v121;
  id v122;
  char v123;
  char v124;
  _QWORD aBlock[5];
  id v126;
  id v127;
  id v128;
  _QWORD v129[4];
  id v130;
  UIInputWindowController *v131;
  id v132;
  id v133;
  _QWORD v134[5];
  id v135;
  id v136;
  _BYTE *v137;
  _QWORD v138[6];
  uint8_t v139[4];
  id v140;
  __int16 v141;
  id v142;
  _BYTE buf[24];
  UIInputViewSetPlacement *v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  CGRect v148;
  CGRect v149;

  v147 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v107 = a4;
  v106 = (void (**)(void))a5;
  v104 = a6;
  _UIInputWindowControllerLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    placement = self->_placement;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v107;
    *(_WORD *)&buf[22] = 2112;
    v144 = placement;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Moving from placement: %@ to placement: %@ (currentPlacement: %@)", buf, 0x20u);
  }

  kdebug_trace();
  kac_get_log();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "animationPreparing", ", buf, 2u);
    }
  }

  if (self->_disablePlacementChanges)
  {
    if (objc_msgSend(v107, "showsKeyboard"))
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = off_1E167A9C8;
      if (v17)
        v18 = off_1E167A998;
      -[__objc2_class placement](*v18, "placement");
      v19 = objc_claimAutoreleasedReturnValue();

      v107 = (id)v19;
    }
    _UIInputWindowControllerLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "inputAccessoryView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v22 != 0;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v107;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "_disablePlacementChanges = YES, (iav: %d) new placement: %@", buf, 0x12u);

    }
  }
  if ((objc_msgSend(v107, "showsInputOrAssistantViews") & 1) != 0 || objc_msgSend(v107, "showsKeyboard"))
    self->_externalTrackingUpdateInProgress = 0;
  -[UIInputWindowController nextAnimationStyle](self, "nextAnimationStyle");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewPlacementTransition transitionFromPlacement:toPlacement:withAnimationStyle:](UIInputViewPlacementTransition, "transitionFromPlacement:toPlacement:withAnimationStyle:", v10, v107, v105);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInputWindowController mergeTransitionIfNecessaryWithTransition:](self, "mergeTransitionIfNecessaryWithTransition:", v23))
  {
    if (v106)
      -[UIInputWindowController addPendingActivity:](self, "addPendingActivity:", v106);
    if (v104)
      -[UIInputWindowController addPendingActivity:](self, "addPendingActivity:");
    goto LABEL_87;
  }
  -[UIInputWindowController flushPendingActivities](self, "flushPendingActivities");
  v24 = v10;
  -[UIInputWindowController currentTransition](self, "currentTransition");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v24;
  if (v25)
  {
    if (-[UIInputWindowController isRotating](self, "isRotating"))
    {
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "cancelled");

      v102 = v24;
      if ((v27 & 1) != 0)
        goto LABEL_28;
    }
    else
    {

    }
    objc_msgSend(v23, "fromPlacement");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_28:
  objc_msgSend(v23, "fromPlacement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "isEqual:", v107);
  objc_msgSend(v23, "animationStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "extraOptions") & 0xFFFFFFFFFFFFFFFDLL;
  v32 = 2;
  if (!v29)
    v32 = 0;
  objc_msgSend(v30, "setExtraOptions:", v31 | v32);

  -[UIInputWindowController setCurrentTransition:](self, "setCurrentTransition:", v23);
  if (v106)
    v106[2]();
  if (objc_msgSend(v28, "isEqual:", v107))
  {
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnimationStyle:", v33);

  }
  -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNotificationInfo:", v34);

  objc_msgSend(v23, "notificationInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "animationStyle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "populateWithAnimationStyle:", v36);

  objc_msgSend(v23, "setNotifications:", objc_msgSend(v102, "notificationsForTransitionToPlacement:", v107));
  if (objc_msgSend(v23, "notifications"))
  {
    if (objc_msgSend(v23, "notifications") != 1)
    {
      objc_msgSend(v23, "notificationInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setForceNotification:", 1);

    }
  }
  else
  {
    objc_msgSend(v23, "notificationInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "forceNotification");

    if (v39)
    {
      if ((objc_msgSend(v107, "showsInputViews") & 1) != 0)
      {
        v40 = 2;
      }
      else if (objc_msgSend(v107, "inputViewWillAppear"))
      {
        v40 = 1;
      }
      else
      {
        v40 = 3;
      }
      objc_msgSend(v23, "setNotifications:", v40);
    }
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (objc_msgSend(v107, "accessoryViewWillAppear"))
      v41 = objc_msgSend(v107, "inputViewWillAppear") ^ 1;
    else
      v41 = 0;
    if (objc_msgSend(v28, "accessoryViewWillAppear")
      && (objc_msgSend(v28, "inputViewWillAppear") & 1) == 0)
    {
      v42 = objc_msgSend(v107, "accessoryViewWillAppear") ^ 1;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v23, "notificationInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setShouldSendInClient:", v42 | v41);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x4010000000;
  v144 = (UIInputViewSetPlacement *)&unk_18685B0AF;
  v145 = 0u;
  v146 = 0u;
  v138[0] = MEMORY[0x1E0C809B0];
  v138[1] = 3221225472;
  v138[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke;
  v138[3] = &unk_1E16BACE0;
  v138[4] = self;
  v138[5] = buf;
  -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v138);
  objc_msgSend(v23, "didAdvanceAnimationToState:", 1);
  -[UIInputWindowController updateAppearStatesForPlacement:start:animated:](self, "updateAppearStatesForPlacement:start:animated:", v107, 1, 1);
  if ((objc_msgSend(v28, "isEqual:", self->_placement) & 1) == 0)
  {
    -[UIViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "frame");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    -[UIViewController view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "window");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v149.origin.x = v55;
    v149.origin.y = v56;
    v149.size.width = v57;
    v149.size.height = v58;
    v148.origin.x = v46;
    v148.origin.y = v48;
    v148.size.width = v50;
    v148.size.height = v52;
    if (CGRectEqualToRect(v148, v149))
    {

    }
    else
    {
      v59 = objc_msgSend(v28, "requiresWindowBasedSafeAreaInsets");
      v60 = objc_msgSend(v107, "requiresWindowBasedSafeAreaInsets");

      if (v59 != v60)
        -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self);
    }
  }
  objc_msgSend(v23, "animationStyle");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "controllerForStartPlacement:endPlacement:", v28, v107);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAnimationController:", v62);

  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2;
  v134[3] = &unk_1E16BCFE0;
  v134[4] = self;
  v63 = v23;
  v135 = v63;
  v137 = buf;
  v64 = v107;
  v136 = v64;
  -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v134);
  if ((objc_msgSend(v28, "isInteractive") & 1) == 0)
  {
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3;
    v129[3] = &unk_1E16B51E8;
    v130 = v63;
    v131 = self;
    v132 = v28;
    v133 = v64;
    -[UIInputWindowController ignoreLayoutNotifications:](self, "ignoreLayoutNotifications:", v129);

  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    objc_msgSend(v63, "notificationInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "currentUIState");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setWasCausedRemotely:", objc_msgSend(v65, "wasCausedRemotely") | objc_msgSend(v67, "isLocal") ^ 1);

  }
  else
  {
    objc_msgSend(v63, "notificationInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setWasCausedRemotely:", objc_msgSend(v66, "handlingRemoteEvent") | objc_msgSend(v65, "wasCausedRemotely"));
  }

  objc_msgSend(v63, "animationStyle");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v68, "animated") & 1) == 0)
  {

    goto LABEL_67;
  }
  v69 = +[UIViewPropertyAnimator _trackedAnimationsStartPaused](UIViewPropertyAnimator, "_trackedAnimationsStartPaused");

  if (!v69)
  {
LABEL_67:
    v70 = 0;
    goto LABEL_68;
  }
  +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 0);
  v70 = 1;
LABEL_68:
  objc_msgSend(v28, "assistantView");
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v71;
  if (v71)
    v73 = (void *)v71;
  else
    v73 = v28;
  v103 = v73;

  objc_msgSend(v64, "assistantView");
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v74;
  if (v74)
    v76 = (void *)v74;
  else
    v76 = v64;
  v77 = v76;

  if (!objc_msgSend(v103, "isEqual:", v28) || (objc_msgSend(v77, "isEqual:", v64) & 1) == 0)
  {
    _UIInputWindowControllerLogger();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v139 = 138412546;
      v140 = v103;
      v141 = 2112;
      v142 = v77;
      _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_DEFAULT, "moveFromPlacement, updated placements from: %@, to: %@", v139, 0x16u);
    }

  }
  if ((objc_msgSend(v103, "isFloatingAssistantView") & 1) != 0
    || objc_msgSend(v77, "isFloatingAssistantView"))
  {
    v79 = objc_msgSend(v103, "isCompactAssistantView");
    v80 = v79 ^ objc_msgSend(v77, "isCompactAssistantView");
  }
  else
  {
    v80 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_482;
  aBlock[3] = &unk_1E16B51E8;
  aBlock[4] = self;
  v81 = v63;
  v126 = v81;
  v82 = v64;
  v127 = v82;
  v83 = v28;
  v128 = v83;
  v84 = _Block_copy(aBlock);
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_487;
  v120[3] = &unk_1E16B2950;
  v120[4] = self;
  v85 = v81;
  v121 = v85;
  v123 = v80;
  v101 = v77;
  v122 = v101;
  v124 = v70;
  v86 = _Block_copy(v120);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "_transitionStartTime");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_488;
  v114[3] = &unk_1E16D5EC0;
  v114[4] = self;
  v89 = v85;
  v115 = v89;
  v90 = v82;
  v116 = v90;
  v91 = v88;
  v117 = v91;
  v10 = v83;
  v118 = v10;
  v119 = v104;
  v92 = _Block_copy(v114);
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_504;
  v108[3] = &unk_1E16D5EE8;
  v93 = v89;
  v109 = v93;
  v94 = v84;
  v111 = v94;
  v95 = v86;
  v112 = v95;
  v96 = v92;
  v113 = v96;
  v110 = self;
  v97 = _Block_copy(v108);
  -[UIInputWindowController chainPlacementsIfNecessaryFrom:toPlacement:transition:completion:](self, "chainPlacementsIfNecessaryFrom:toPlacement:transition:completion:", v10, v90, v93, v97);
  kdebug_trace();
  kac_get_log();
  v98 = (id)objc_claimAutoreleasedReturnValue();
  v99 = os_signpost_id_make_with_pointer(v98, self);
  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v100 = v99;
    if (os_signpost_enabled(v98))
    {
      *(_WORD *)v139 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v98, OS_SIGNPOST_INTERVAL_END, v100, "animationPreparing", ", v139, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_87:

}

- (void)performWithSafeTransitionFrames:(id)a3
{
  void (*v3)(void);
  int hiddenCount;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  int v12;
  _QWORD v13[5];
  int v14;

  if (self->_inhibitingHiding)
  {
    v3 = (void (*)(void))*((_QWORD *)a3 + 2);
    v10 = a3;
    v3();

  }
  else
  {
    hiddenCount = self->_hiddenCount;
    v6 = (void (**)(_QWORD))a3;
    -[UIInputWindowController inputSetContainerView](self, "inputSetContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke;
    v13[3] = &unk_1E16BFE10;
    v14 = hiddenCount;
    v13[4] = self;
    objc_msgSend(v7, "performWithoutGeometryObserverNotifications:", v13);

    self->_inhibitingHiding = 1;
    v6[2](v6);

    LODWORD(v7) = self->_hiddenCount + hiddenCount;
    self->_hiddenCount = 0;
    self->_inhibitingHiding = 0;
    -[UIInputWindowController inputSetContainerView](self, "inputSetContainerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke_2;
    v11[3] = &unk_1E16BFE10;
    v12 = (int)v7;
    v11[4] = self;
    objc_msgSend(v9, "performWithoutGeometryObserverNotifications:", v11);

  }
}

uint64_t __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (*(int *)(result + 40) >= 1)
  {
    v1 = result;
    v2 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v1 + 32), "setInputViewsHidden:", 1);
      ++v2;
    }
    while (v2 < *(_DWORD *)(v1 + 40));
  }
  return result;
}

uint64_t __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (*(int *)(result + 40) >= 1)
  {
    v1 = result;
    v2 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v1 + 32), "setInputViewsHidden:", 0);
      ++v2;
    }
    while (v2 < *(_DWORD *)(v1 + 40));
  }
  return result;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIInputViewSetNotificationInfo *rotationInfo;
  _QWORD v16[5];
  _QWORD v17[5];
  BOOL v18;
  BOOL v19;
  _QWORD v20[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIInputWindowController;
  -[UIViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke;
  v20[3] = &unk_1E16D5DE0;
  v20[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v20);

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (v5)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "notifications") == 0;

  }
  else
  {
    v8 = 0;
  }
  if (-[UIInputWindowController isOnScreen](self, "isOnScreen"))
  {
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_2;
    v17[3] = &unk_1E16B70C0;
    v17[4] = self;
    v18 = v6;
    v19 = v8;
    -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v17);
  }
  else
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "notifications");
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowController updateAmbiguousControlCenterActivationMargin:withInfo:](self, "updateAmbiguousControlCenterActivationMargin:withInfo:", v10, v12);

  }
  if (-[UIInputViewSetNotificationInfo forceNotification](self->_rotationInfo, "forceNotification"))
  {
    v16[0] = v4;
    v16[1] = 3221225472;
    v16[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_3;
    v16[3] = &unk_1E16B1B28;
    v16[4] = self;
    -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetNotificationInfo rotationUserInfo](self->_rotationInfo, "rotationUserInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("_UIKeyboardInternalWillRotateNotification"), self, v14);

    rotationInfo = self->_rotationInfo;
    self->_rotationInfo = 0;

  }
}

- (UIInputViewPlacementTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  UIInputWindowController *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_suppressUpdateVisibilityConstraints)
    goto LABEL_19;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v21 = self;
    obj = v5;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v14 = objc_msgSend(v4, "accessoryViewWillAppear", v21);
        if (v12 + v11)
        {
          objc_msgSend(v4, "subPlacements");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v12 + v11 - 1);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (!v16)
            goto LABEL_10;
LABEL_9:
          objc_msgSend(v13, "updateVisibilityConstraintsForPlacement:", v16);
          goto LABEL_10;
        }
        v16 = v4;
        if (v16)
          goto LABEL_9;
LABEL_10:
        v9 |= v14;

        ++v11;
      }
      while (v7 != v11);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v7 = v17;
      v8 = v12 + v11;
      if (!v17)
      {

        -[UIViewController view](v21, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setNeedsLayout");

        if ((v9 & 1) != 0)
        {
          -[UIInputWindowController _inputAccessoryView](v21, "_inputAccessoryView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
  }

  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v20 = v19;
  objc_msgSend(v19, "setNeedsLayout");

LABEL_19:
}

- (void)setCurrentTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransition, a3);
}

- (void)flushPendingActivities
{
  id pendingTransitionActivity;
  void (**v4)(void);

  v4 = (void (**)(void))_Block_copy(self->_pendingTransitionActivity);
  if (v4)
  {
    pendingTransitionActivity = self->_pendingTransitionActivity;
    self->_pendingTransitionActivity = 0;

    v4[2]();
  }

}

- (id)nextAnimationStyle
{
  if (-[NSMutableArray count](self->_animationStyleStack, "count"))
    -[NSMutableArray lastObject](self->_animationStyleStack, "lastObject");
  else
    +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation
{
  void *v3;
  void *v4;
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
  double v16;
  objc_super v17;
  CGRect result;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && -[UIInputViewSetPlacement requiresWindowBasedSafeAreaInsets](self->_placement, "requiresWindowBasedSafeAreaInsets"))
  {
    objc_msgSend(v4, "bounds");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIInputWindowController;
    -[UIViewController _viewFrameInWindowForContentOverlayInsetsCalculation](&v17, sel__viewFrameInWindowForContentOverlayInsetsCalculation);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIView)bottomEdgeView
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isOnScreen
{
  void *v2;
  char v3;

  -[UIInputWindowController placement](self, "placement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsInputViews");

  return v3;
}

- (void)updateAppearStatesForPlacement:(id)a3 start:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t i;

  v5 = a5;
  v6 = a4;
  for (i = 0; i != 3; ++i)
    -[UIInputWindowController changeChild:toAppearState:animated:](self, "changeChild:toAppearState:animated:", (1 << i), -[UIInputWindowController appearStateForChild:placement:start:](self, "appearStateForChild:placement:start:", (1 << i), a3, v6), v5);
}

- (void)changeChild:(unint64_t)a3 toAppearState:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  int v8;
  void *v9;
  id v10;

  if (!self->_suppressedCallbacks)
  {
    v5 = a5;
    if (a3 == 2)
    {
      -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 4)
        -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      else
        -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;
    v8 = a4 | (16 * objc_msgSend(v7, "_appearState"));
    if (v8 <= 31)
    {
      if (v8 <= 17)
      {
        if (v8 != 1)
        {
          v9 = v10;
          if (v8 == 2)
          {
            objc_msgSend(v10, "__viewWillAppear:", v5);
LABEL_25:
            objc_msgSend(v10, "__viewDidAppear:", v5);
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        goto LABEL_24;
      }
      if (v8 == 18)
        goto LABEL_25;
      v9 = v10;
      if (v8 != 19)
      {
LABEL_29:

        return;
      }
      objc_msgSend(v10, "__viewDidAppear:", v5);
LABEL_20:
      -[UIViewController __viewWillDisappear:]((uint64_t)v10, v5);
LABEL_28:
      v9 = v10;
      goto LABEL_29;
    }
    if (v8 > 47)
    {
      if (v8 != 48)
      {
        v9 = v10;
        if (v8 != 49)
          goto LABEL_29;
        -[UIViewController __viewDidDisappear:]((uint64_t)v10, v5);
LABEL_24:
        objc_msgSend(v10, "__viewWillAppear:", v5);
        goto LABEL_28;
      }
    }
    else
    {
      if (v8 != 32)
      {
        v9 = v10;
        if (v8 != 35)
          goto LABEL_29;
        goto LABEL_20;
      }
      -[UIViewController __viewWillDisappear:]((uint64_t)v10, v5);
    }
    -[UIViewController __viewDidDisappear:]((uint64_t)v10, v5);
    goto LABEL_28;
  }
}

- (int)appearStateForChild:(unint64_t)a3 placement:(id)a4 start:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;

  v5 = a5;
  if (a3 == 4)
    v6 = objc_msgSend(a4, "accessoryViewWillAppear");
  else
    v6 = objc_msgSend(a4, "inputViewWillAppear");
  if (v5)
    v7 = 1;
  else
    v7 = 2;
  if (v5)
    v8 = 3;
  else
    v8 = 0;
  if (v6)
    return v7;
  else
    return v8;
}

- (BOOL)mergeTransitionIfNecessaryWithTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIInputWindowController currentTransition](self, "currentTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "cancelled") & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v6, "toPlacement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toPlacement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
  {

LABEL_7:
    _UIInputWindowControllerLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "Merging transitions: %@ into %@", (uint8_t *)&v29, 0x16u);
    }

    objc_msgSend(v6, "setCancelled:", 1);
    objc_msgSend(v6, "animationStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancelInterruptibleAnimations");

    v15 = objc_msgSend(v6, "notifications");
    objc_msgSend(v6, "notificationInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowController postEndNotifications:withInfo:](self, "postEndNotifications:withInfo:", v15, v16);

    -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", &__block_literal_global_467);

    if (objc_msgSend(v6, "animationState") > 2)
      goto LABEL_15;
    -[UIInputWindowControllerHosting removeAllAnimations](self->_hosting, "removeAllAnimations");
    objc_msgSend(v6, "fromPlacement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFromPlacement:", v18);

    objc_msgSend(v4, "fromPlacement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "showsInputViews");
    objc_msgSend(v4, "toPlacement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 == objc_msgSend(v21, "showsInputViews"))
    {
      objc_msgSend(v4, "fromPlacement");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "showsKeyboard");
      objc_msgSend(v4, "toPlacement");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 == objc_msgSend(v24, "showsKeyboard"))
      {
        objc_msgSend(v4, "animationStyle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "dontMerge");

        if ((v27 & 1) != 0)
          goto LABEL_15;
        objc_msgSend(v4, "animationStyle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v28, "copy");

        objc_msgSend(v19, "setAnimated:", 0);
        objc_msgSend(v4, "setAnimationStyle:", v19);
LABEL_14:

LABEL_15:
        v12 = 0;
        goto LABEL_16;
      }

    }
    goto LABEL_14;
  }
  objc_msgSend(v6, "animationStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
    goto LABEL_7;
  v12 = 1;
LABEL_16:

  return v12;
}

void __40__UIInputWindowController_setPlacement___block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[129], "allHostingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__UIInputWindowController_setPlacement___block_invoke_2;
  v4[3] = &unk_1E16D6010;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  objc_destroyWeak(&v5);
}

- (void)syncToExistingAnimations
{
  void *v3;
  id v4;
  BOOL v5;
  BOOL v6;
  id v7;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = v5 || v7 == v4;
  if (!v6 && objc_msgSend(v7, "_requiresKeyboardPresentationFence"))
    +[UIWindow _synchronizeDrawing](UIWindow, "_synchronizeDrawing");

}

- (void)setDontDismissReachability:(BOOL)a3
{
  self->_dontDismissReachability = a3;
}

- (void)updateAmbiguousControlCenterActivationMargin:(unint64_t)a3 withInfo:(id)a4
{
  void *v4;
  BOOL v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a4;
  v7 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");
  if (!v7)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v4, "orientation") - 3) >= 2)
    {

LABEL_10:
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0.0;
      goto LABEL_11;
    }
  }
  -[UIInputWindowController placement](self, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isUndocked");

  if (!v7)
  if ((v9 & 1) != 0)
    goto LABEL_10;
  v10 = 0.0;
  if (a3 != 3)
  {
    objc_msgSend(v15, "endFrame");
    v10 = v11;
  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v10;
LABEL_11:
  objc_msgSend(v12, "setAmbiguousControlCenterActivationMargin:", v14);

}

- (BOOL)isOnScreenRotating
{
  void *v3;
  void *v4;
  char v5;

  -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsInputViews");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDisableUpdateMaskForSecureTextEntry:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _UIKeyboardPasscodeObscuringInteraction *passcodeObscuringInteraction;
  _UIKeyboardPasscodeObscuringInteraction *v11;
  _UIKeyboardPasscodeObscuringInteraction *v12;
  _UIKeyboardPasscodeObscuringInteraction *v13;
  id v14;

  v3 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForPreferenceKey:", CFSTR("ShowPasswordKeyboardInVideo"));

  if ((v7 & 1) == 0)
  {
    -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 100);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hostView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
      if (v3)
      {
        if (!passcodeObscuringInteraction)
        {
          v11 = objc_alloc_init(_UIKeyboardPasscodeObscuringInteraction);
          v12 = self->_passcodeObscuringInteraction;
          self->_passcodeObscuringInteraction = v11;

          passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
        }
        objc_msgSend(v9, "addInteraction:", passcodeObscuringInteraction);
      }
      else if (passcodeObscuringInteraction)
      {
        objc_msgSend(v8, "removeInteraction:");
        v13 = self->_passcodeObscuringInteraction;
        self->_passcodeObscuringInteraction = 0;

      }
    }

  }
}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 100);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInputBackdropView");

}

void __52__UIInputWindowController_updateInputAssistantView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 102);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInputAssistantBackdropView");

}

void __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "someViewDidLayoutSubviews");
  if ((objc_msgSend(*(id *)(a1 + 32), "isTranslating") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isDragging") & 1) == 0)
  {
    objc_msgSend(v3, "refreshApplicator");
  }

}

- (BOOL)isTranslating
{
  void *v2;
  void *v3;
  char v4;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitKeyboardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranslating");

  return v4;
}

- (BOOL)isDragging
{
  void *v2;
  char v3;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollKeyboardActive");

  return v3;
}

- (void)ignoreLayoutNotifications:(id)a3
{
  void *v3;
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ignoreLayoutNotifications:", v4);

  }
  else
  {
    v4[2]();
  }

}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "animationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareAnimationWithHost:startPlacement:endPlacement:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAnimationContext:", v2);

}

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputWindowController;
  -[UIViewController _updateContentOverlayInsetsForSelfAndChildren](&v3, sel__updateContentOverlayInsetsForSelfAndChildren);
  -[UIInputWindowController updateSupportsDockViewController](self, "updateSupportsDockViewController");
}

- (void)updateSupportsDockViewController
{
  _BOOL4 supportsDockViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  supportsDockViewController = self->_supportsDockViewController;
  self->_supportsDockViewController = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExtensionInputMode");

    if (!v8)
      goto LABEL_14;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "updateSupportsDockViewController");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (supportsDockViewController != self->_supportsDockViewController)
  {
    -[UIInputWindowController updateKeyboardDockViewVisibility](self, "updateKeyboardDockViewVisibility");
    -[UIViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "isDescendantOfView:", v14);

    if (v15)
      objc_msgSend(v4, "updateLayout");
  }
LABEL_14:

}

- (void)clearKeyboardSnapshot
{
  UIView *keyboardSnapshot;
  void *v4;
  UIView *v5;
  NSObject *v6;
  uint8_t v7[16];

  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    -[UIView superview](keyboardSnapshot, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIView removeFromSuperview](self->_keyboardSnapshot, "removeFromSuperview");
    v5 = self->_keyboardSnapshot;
    self->_keyboardSnapshot = 0;

    _UIInputWindowControllerLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot cleared", v7, 2u);
    }

  }
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  _QWORD v4[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(WeakRetained[129], "initializeTranslateGestureRecognizerIfNecessary");
  else
    objc_msgSend(WeakRetained, "changeToInputViewSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained[129], "updateEmptyHeightConstraint", WeakRetained);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_6;
  v4[3] = &unk_1E16B1B28;
  v4[4] = v3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);

}

uint64_t __46__UIInputWindowController_invalidateInputView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsView:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_inputViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "clearInputViewEdgeConstraints");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "resetInputViewVisibility");
  }
  objc_msgSend(*(id *)(a1 + 32), "_inputViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);

  if (v10 == v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_inputViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromParentViewController");

  }
  return objc_msgSend(*(id *)(a1 + 32), "set_inputViewController:", 0);
}

- (unint64_t)changeToInputViewSet:(id)a3
{
  UIInputViewSet *v5;
  NSObject *v6;
  UIInputViewSet *inputViewSet;
  NSObject *v8;
  UIInputViewSet **p_inputViewSet;
  UIInputViewSet *v10;
  unsigned int (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  UIInputWindowControllerHosting *hosting;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
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
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIInputViewSet **v42;
  void *v43;
  unsigned int (**v44)(_QWORD);
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  UIInputWindowControllerHosting *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
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
  char v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  unsigned int (**v100)(_QWORD);
  unsigned int (**v101)(_QWORD);
  UIInputViewSet **v102;
  UIInputViewSet **v103;
  UIInputViewSet *v104;
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD aBlock[5];
  UIInputViewSet *v109;
  uint8_t buf[4];
  UIInputViewSet *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = (UIInputViewSet *)a3;
  _UIInputWindowControllerLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    inputViewSet = self->_inputViewSet;
    *(_DWORD *)buf = 138412290;
    v111 = inputViewSet;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Change from input view set: %@", buf, 0xCu);
  }

  _UIInputWindowControllerLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v111 = v5;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Change to input view set: %@", buf, 0xCu);
  }

  p_inputViewSet = &self->_inputViewSet;
  v104 = self->_inputViewSet;
  objc_storeStrong((id *)&self->_inputViewSet, a3);
  -[UIInputWindowController setTransientInputViewSet:](self, "setTransientInputViewSet:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke;
  aBlock[3] = &unk_1E16D5FC0;
  aBlock[4] = self;
  v10 = v5;
  v109 = v10;
  v11 = (unsigned int (**)(_QWORD))_Block_copy(aBlock);
  -[UIInputWindowControllerHosting initializeTranslateGestureRecognizerIfNecessary](self->_hosting, "initializeTranslateGestureRecognizerIfNecessary");
  self->_isChangingInputViews = 1;
  -[UIInputWindowController _inputViewController](self, "_inputViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSet inputView](v10, "inputView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  hosting = self->_hosting;
  if (v13 == v14)
  {
    -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 100);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "updateInputBackdropViewVisibility");

    v37 = 0;
  }
  else
  {
    -[UIInputViewSet inputView](v10, "inputView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHosting disableViewSizingConstraints:forNewView:](hosting, "disableViewSizingConstraints:forNewView:", 1, v16);

    -[UIInputWindowController _inputViewController](self, "_inputViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
      v17 = self;
    v19 = objc_msgSend(v17, "_appearState");

    -[UIInputWindowController invalidateInputView](self, "invalidateInputView");
    -[UIInputViewSet inputView](*p_inputViewSet, "inputView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (-[UIInputViewSet isInputViewPlaceholder](*p_inputViewSet, "isInputViewPlaceholder"))
      {
        -[UIInputViewSet inputView](*p_inputViewSet, "inputView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "refreshPlaceholder");

        -[UIInputWindowController updateKeyboardLayoutGuideForRefreshedPlaceholder](self, "updateKeyboardLayoutGuideForRefreshedPlaceholder");
      }
      *(_QWORD *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
      -[UIInputViewSet inputViewController](*p_inputViewSet, "inputViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController set_inputViewController:](self, "set_inputViewController:", v22);

      -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parentViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[UIInputWindowController _inputViewController](self, "_inputViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "parentViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "invalidateInputView");

      }
      -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", v28, dyld_program_sdk_at_least(), 1);

      -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 100);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setInputView:", v30);

      -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "didMoveToParentViewController:", self);

      -[UIInputWindowController changeChild:toAppearState:animated:](self, "changeChild:toAppearState:animated:", 1, v19, 0);
      *(_QWORD *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
      -[UIInputWindowController _inputViewController](self, "_inputViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_inheritedRenderConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_setRenderConfig:", v36);

      p_inputViewSet = &self->_inputViewSet;
    }
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_2;
    v107[3] = &unk_1E16B1B28;
    v107[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v107);
    v37 = 1;
  }
  -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSet inputAssistantView](v10, "inputAssistantView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 == v41)
  {
    -[UIViewController _window](self, "_window");
    v42 = p_inputViewSet;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSet inputAssistantView](v10, "inputAssistantView");
    v44 = v11;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "window");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v44;
    v47 = v43 == v46;
    p_inputViewSet = v42;
    if (v47)
      goto LABEL_20;
  }
  else
  {

  }
  -[UIInputWindowController updateInputAssistantView:](self, "updateInputAssistantView:", v10);
  v37 |= 2uLL;
LABEL_20:
  -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSet inputAccessoryView](v10, "inputAccessoryView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49 == v50)
  {
    -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "view");
    v80 = objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      v81 = (void *)v80;
      v103 = p_inputViewSet;
      v101 = v11;
      -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "view");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 101);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "hostView");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v83, "isDescendantOfView:", v85);

      if ((v86 & 1) == 0)
      {
        -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "view");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 101);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setInputAccessoryView:", v88);

        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_4;
        v105[3] = &unk_1E16B1B28;
        v105[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v105);
      }
      v11 = v101;
      p_inputViewSet = v103;
    }
    else
    {

    }
    goto LABEL_41;
  }
  v51 = self->_hosting;
  -[UIInputViewSet inputAccessoryView](v10, "inputAccessoryView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting disableViewSizingConstraints:forNewView:](v51, "disableViewSizingConstraints:forNewView:", 4, v52);

  -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (!v53)
    v53 = self;
  v55 = objc_msgSend(v53, "_appearState");

  -[UIInputWindowController invalidateInputAccessoryView](self, "invalidateInputAccessoryView");
  if (!v11[2](v11))
    goto LABEL_37;
  -[UIInputViewSet inputAccessoryView](*p_inputViewSet, "inputAccessoryView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    *(_QWORD *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
    v102 = p_inputViewSet;
    -[UIInputViewSet accessoryViewController](*p_inputViewSet, "accessoryViewController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowController set_inputAccessoryViewController:](self, "set_inputAccessoryViewController:", v57);

    -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "parentViewController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
      goto LABEL_32;
    v100 = v11;
    -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "_responderWindow");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "_firstResponder");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (-[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController"),
          v64 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v64, "view"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v66 = objc_msgSend(v65, "containsView:", v63),
          v65,
          v64,
          (v66 & 1) == 0))
    {

      v63 = 0;
    }
    -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "parentViewController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v11 = v100;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v68, "invalidateInputAccessoryView");
    objc_msgSend(v63, "_becomeFirstResponderWhenPossible");
    v69 = v100[2](v100);

    if (v69)
    {
LABEL_32:
      -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", v70, dyld_program_sdk_at_least(), 1);

      -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "view");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 101);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setInputAccessoryView:", v72);

      -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "didMoveToParentViewController:", self);

      -[UIInputWindowController changeChild:toAppearState:animated:](self, "changeChild:toAppearState:animated:", 4, v55, 0);
      *(_QWORD *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
      -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "view");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_inheritedRenderConfig");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_setRenderConfig:", v78);

      p_inputViewSet = v102;
      goto LABEL_33;
    }
LABEL_37:
    v37 = 0;
    goto LABEL_50;
  }
LABEL_33:
  v37 |= 4uLL;
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_3;
  v106[3] = &unk_1E16B1B28;
  v106[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v106);
LABEL_41:
  self->_isChangingInputViews = 0;
  -[UIInputWindowController updateInputAssistantViewForInputViewSet:](self, "updateInputAssistantViewForInputViewSet:", *p_inputViewSet);
  -[UIInputWindowController updateKeyboardDockViewVisibility](self, "updateKeyboardDockViewVisibility");
  if (v37 || -[UIInputWindowControllerHosting requiresConstraintUpdate](self->_hosting, "requiresConstraintUpdate"))
    -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
  -[UIInputWindowController updateGestureRecognizers](self, "updateGestureRecognizers");
  -[UIInputViewSet inputView](v104, "inputView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "superview");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v91)
  {
    -[UIInputViewSet inputView](v104, "inputView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "_clearOverrideNextResponder");

  }
  -[UIInputViewSet inputAssistantView](v104, "inputAssistantView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "superview");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v94)
  {
    -[UIInputViewSet inputAssistantView](v104, "inputAssistantView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "_clearOverrideNextResponder");

  }
  -[UIInputViewSet inputAccessoryView](v104, "inputAccessoryView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "superview");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v97)
  {
    -[UIInputViewSet inputAccessoryView](v104, "inputAccessoryView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "_clearOverrideNextResponder");

  }
LABEL_50:

  return v37;
}

- (UIInputViewController)_inputViewController
{
  return self->_inputViewController;
}

- (UIInputViewController)_inputAccessoryViewController
{
  return self->_inputAccessoryViewController;
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputWindowController;
  -[UIViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  if (!self->_suppressUpdateViewConstraints)
    -[UIInputWindowControllerHosting updateViewConstraints](self->_hosting, "updateViewConstraints");
}

- (void)updateInputAssistantViewForInputViewSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  if (!-[UIInputWindowController isRotating](self, "isRotating"))
  {
    v4 = v41;
    if (!v41)
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = v4;
    if ((objc_msgSend(v4, "isEmpty") & 1) == 0 && (objc_msgSend(v41, "isRemoteKeyboard") & 1) == 0)
    {
      objc_msgSend(v41, "inputAssistantView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5
        || (objc_msgSend(v41, "assistantViewController"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v6,
            (isKindOfClass & 1) == 0))
      {
LABEL_25:
        -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
        goto LABEL_26;
      }
      objc_msgSend(v41, "assistantViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "responder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyboardSceneDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v13;
      objc_msgSend(v13, "systemInputAssistantViewController");
      v14 = objc_claimAutoreleasedReturnValue();
      if ((void *)v14 == v8)
      {

      }
      else
      {
        v15 = (void *)v14;
        objc_msgSend(v10, "_window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_isRemoteKeyboardWindow");

        if (!v17)
          goto LABEL_13;
      }
      objc_msgSend(v8, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v10);
LABEL_13:
      v18 = objc_msgSend(v8, "shouldBeShownForInputDelegate:inputViews:", 0, v41);
      objc_msgSend(v41, "inputAssistantView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = &off_1E167A000;
      if (v20)
      {
        v23 = v20;
      }
      else
      {
        objc_msgSend(v41, "inputView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "window");
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "visualModeManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "windowingModeEnabled"))
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v27 = v10;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "visualModeManager");
        v29 = v23;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "shouldShowWithinAppWindow");

        v23 = v29;
        v10 = v27;
        v22 = &off_1E167A000;
      }
      else
      {
        v31 = 0;
      }

      objc_msgSend(v23, "windowScene");
      v32 = v23;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22[483], "activeKeyboardSceneDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "scene");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 == v35)
        v36 = v18;
      else
        v36 = 0;
      if (!v31)
        v36 = v18;
      v37 = v36 ^ 1u;
      objc_msgSend(v8, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setHidden:", v37);

      objc_msgSend(v8, "updateCenterViewVisibilityStateForInputDelegate:", 0);
      -[UIInputWindowController placement](self, "placement");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController updateVisibilityConstraintsForPlacement:](self, "updateVisibilityConstraintsForPlacement:", v39);

      goto LABEL_25;
    }
  }
LABEL_26:

}

- (void)setTransientInputViewSet:(id)a3
{
  objc_storeStrong((id *)&self->_transientInputViewSet, a3);
}

- (BOOL)isChangingInputViews
{
  return self->_isChangingInputViews;
}

- (void)updateKeyboardDockViewVisibility
{
  id v2;

  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_545);

}

- (void)updateGestureRecognizers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  UIKeyboardFloatingTransitionController *floatingTransitionController;
  UIKeyboardFloatingTransitionController *v9;
  UIKeyboardFloatingTransitionController *v10;
  UIKeyboardFloatingTransitionController *v11;
  UIKeyboardFloatingTransitionController *v12;
  UIKeyboardFloatingTransitionController *v13;
  void *v14;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isInputViewPlaceholder");

    if ((v7 & 1) == 0)
    {
      floatingTransitionController = self->_floatingTransitionController;
      if (!floatingTransitionController)
      {
        v9 = objc_alloc_init(UIKeyboardFloatingTransitionController);
        v10 = self->_floatingTransitionController;
        self->_floatingTransitionController = v9;

        floatingTransitionController = self->_floatingTransitionController;
      }
      -[UIKeyboardFloatingTransitionController setDelegate:](floatingTransitionController, "setDelegate:", self);
      v11 = self->_floatingTransitionController;
      -[UIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardFloatingTransitionController addGestureRecognizersToView:](v11, "addGestureRecognizersToView:", v14);

      return;
    }
  }
  else
  {

  }
  v12 = self->_floatingTransitionController;
  if (v12)
  {
    -[UIKeyboardFloatingTransitionController setDelegate:](v12, "setDelegate:", 0);
    -[UIKeyboardFloatingTransitionController removeGestureRecognizers](self->_floatingTransitionController, "removeGestureRecognizers");
    v13 = self->_floatingTransitionController;
    self->_floatingTransitionController = 0;

  }
}

- (void)set_inputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewController, a3);
}

- (void)invalidateInputView
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIInputWindowController _inputViewController](self, "_inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__UIInputWindowController_invalidateInputView__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend(v4, "_preserveResponderOverridesWhilePerforming:", v5);

}

- (void)updateKeyboardLayoutGuideForRefreshedPlaceholder
{
  _BOOL4 externalTrackingUpdateInProgress;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isInputViewPlaceholder") & 1) != 0)
    {
      externalTrackingUpdateInProgress = self->_externalTrackingUpdateInProgress;

      if (!externalTrackingUpdateInProgress)
      {
        -[UIInputWindowController inputViewSet](self, "inputViewSet");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "inputView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fixedSize");
        v7 = v6;
        v9 = v8;

        -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v7, v9);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[UIViewController _window](self, "_window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "windowScene");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "windows");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (objc_msgSend(v17, "isTrackingKeyboard"))
              {
                objc_msgSend(v17, "insetForDismissedKeyboardGuide");
                v18 = v9;
                if (v9 < v19)
                {
                  objc_msgSend(v17, "insetForDismissedKeyboardGuide");
                  v18 = v20;
                }
                objc_msgSend(v17, "_primaryKeyboardTrackingGuide");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "changeSizingConstants:", v7, v18);

                if (v22)
                  objc_msgSend(v17, "layoutViewsForTrackedGuides");
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v14);
        }

      }
    }
    else
    {

    }
  }
}

uint64_t __68__UIInputWindowController_mergeTransitionIfNecessaryWithTransition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearInteractiveTransitionStateIfNecessary");
}

- (UIInputWindowController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIInputWindowController *v4;
  NSMutableArray *v5;
  NSMutableArray *animationStyleStack;
  uint64_t v7;
  UIInputViewSetPlacement *placement;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInputWindowController;
  v4 = -[UIApplicationRotationFollowingController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    animationStyleStack = v4->_animationStyleStack;
    v4->_animationStyleStack = v5;

    +[UIInputViewSetPlacement placement](UIInputViewSetPlacementInitialPosition, "placement");
    v7 = objc_claimAutoreleasedReturnValue();
    placement = v4->_placement;
    v4->_placement = (UIInputViewSetPlacement *)v7;

    v4->_shouldNotifyRemoteKeyboards = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_hostViewWillDisappear, 0x1E1784B20, 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_hostViewDidEnterBackground, 0x1E1784A40, 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_hostViewWillenterForeground, 0x1E1784A60, 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_updateKeyboardDockViewVisibility, CFSTR("UITextInputNextInputModeInputModeDidChangeNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_updateKeyboardDockViewVisibility, CFSTR("UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_willBeginIndirectSelectionGesture, CFSTR("UIKeyboardWillBeginIndirectSelectionGestureNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_didEndIndirectSelectionGesture, CFSTR("UIKeyboardDidEndIndirectSelectionGestureNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_presentationTransitionWillBegin_, CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_presentationTransitionDidEnd_, CFSTR("UIPresentationControllerDismissalTransitionDidEndNotification"), 0);

  }
  return v4;
}

- (void)presentViewController:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
  -[UIViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v19);

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ already contains %@"), self, v19);
  -[UIViewController addChildViewController:](self, "addChildViewController:", v19);
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v19, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  objc_msgSend(v19, "didMoveToParentViewController:", self);
}

- (void)setShouldNotifyRemoteKeyboards:(BOOL)a3
{
  self->_shouldNotifyRemoteKeyboards = a3;
}

- (void)keyboardMoveOfType:(unint64_t)a3 info:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a4;
  if ((objc_msgSend(v12, "dueToRotation") & 1) == 0)
  {
    -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 != 4 && !v6 && !+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      switch(a3)
      {
        case 0uLL:
          -[UIInputWindowController placement](self, "placement");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v7, "isFloating"))
            goto LABEL_11;
          v8 = objc_msgSend(v12, "wasCausedRemotely");

          if (v8)
            goto LABEL_14;
          break;
        case 1uLL:
          -[UIInputWindowController placement](self, "placement");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isFloating"))
          {
LABEL_11:

          }
          else
          {
            -[UIInputWindowController placement](self, "placement");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isFloatingAssistantView");

            if ((v11 & 1) == 0)
              goto LABEL_16;
          }
          break;
        case 2uLL:
LABEL_16:
          -[UIInputWindowController keyboardMoveWithInfo:](self, "keyboardMoveWithInfo:", v12);
          break;
        case 3uLL:
          if ((objc_msgSend(v12, "dueToRotation") & 1) == 0)
          {
            -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v9)
LABEL_14:
              -[UIInputWindowController keyboardDismissWithInfo:](self, "keyboardDismissWithInfo:", v12);
          }
          break;
        default:
          break;
      }
    }
  }

}

- (void)performOperations:(id)a3 withAnimationStyle:(id)a4
{
  void (**v6)(_QWORD);

  if (a3)
  {
    v6 = (void (**)(_QWORD))a3;
    -[UIInputWindowController pushAnimationStyle:](self, "pushAnimationStyle:", a4);
    v6[2](v6);

    -[UIInputWindowController popAnimationStyle](self, "popAnimationStyle");
  }
}

- (void)pushAnimationStyle:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_animationStyleStack, "addObject:");
}

- (void)setInputViewSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  int v35;
  char v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  id v43;
  int v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  char v55;
  _QWORD v56[4];
  id v57;
  id v58;
  char v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63[2];
  _QWORD v64[5];
  id v65;
  id v66;
  _BYTE *v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIInputWindowController updateKeyboardSizeClass](self, "updateKeyboardSizeClass");
  -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "handlingRemoteEvent") & 1) != 0)
    {
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fromPlacement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_69;
    }
    else
    {

    }
    if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    {
      if (!self->_inputViewSet)
        goto LABEL_69;
    }
    else
    {
      +[UIInputView _setupAppearanceIfNecessary](UIInputView, "_setupAppearanceIfNecessary");
    }
    _UIInputWindowControllerLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Setting input views: %@", buf, 0xCu);
    }

    -[UIInputWindowController updateInputAssistantViewForInputViewSet:](self, "updateInputAssistantViewForInputViewSet:", v4);
    v13 = -[UIInputViewSet isEqual:](self->_inputViewSet, "isEqual:", v4);
    if (v13)
    {
      v45 = 0;
    }
    else
    {
      LODWORD(v45) = (objc_msgSend(v4, "isInputViewPlaceholder") & 1) != 0
                  || -[UIInputViewSet isInputViewPlaceholder](self->_inputViewSet, "isInputViewPlaceholder");
      if (objc_msgSend(v4, "isInputViewPlaceholder"))
        HIDWORD(v45) = !-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards");
      else
        HIDWORD(v45) = 0;
      if (-[UIInputViewSet isCustomInputView](self->_inputViewSet, "isCustomInputView"))
      {
        v44 = objc_msgSend(v4, "isCustomInputView") ^ 1;
LABEL_24:
        v14 = !v13;
        if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
          && -[UIInputViewSet isInputViewPlaceholder](self->_inputViewSet, "isInputViewPlaceholder"))
        {
          -[UIInputViewSet inputView](self->_inputViewSet, "inputView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fixedSize");
          v17 = v16;
          objc_msgSend(v15, "refreshPlaceholder");
          objc_msgSend(v15, "fixedSize");
          v19 = v18;
          if (v17 != v18)
          {
            _UIInputWindowControllerLogger();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v19;
              _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Remote keyboard height changed from %.1f to %.1f", buf, 0x16u);
            }

            v14 = 1;
          }

        }
        -[UIInputWindowController nextAnimationStyle](self, "nextAnimationStyle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v69 = __Block_byref_object_copy__129;
        v70 = __Block_byref_object_dispose__129;
        -[UIInputWindowController currentPresentationPlacement](self, "currentPresentationPlacement");
        v71 = (id)objc_claimAutoreleasedReturnValue();
        -[UIViewController _window](self, "_window");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "windowScene");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "startPlacementForInputViewSet:currentPlacement:windowScene:", v4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v46);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endPlacementForInputViewSet:windowScene:", v4, v46);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setOtherPlacement:", v24);
        objc_msgSend(v24, "setOtherPlacement:", v23);
        -[UIInputWindowController currentTransition](self, "currentTransition");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "toPlacement");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "isEqual:", v26);

        v28 = v14 | v27 ^ 1;
        if ((v28 & 1) == 0)
        {
          -[UIInputWindowController currentTransition](self, "currentTransition");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "animationStyle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v21, "isEqual:", v30);

          if (v31)
          {
            _UIInputWindowControllerLogger();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v63[0]) = 0;
              _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_DEFAULT, "Skipping changing input views", (uint8_t *)v63, 2u);
            }

            goto LABEL_68;
          }
        }
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isUndocked")
          && (objc_msgSend(v24, "isUndocked") & 1) == 0)
        {
          v33 = objc_msgSend(v24, "showsInputViews") ^ 1;
        }
        else
        {
          v33 = 0;
        }
        if (!-[UIInputViewSet isEqual:](self->_inputViewSet, "isEqual:", v4)
          && (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isEqual:", v23) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v64[0] = MEMORY[0x1E0C809B0];
            v64[1] = 3221225472;
            v64[2] = __43__UIInputWindowController_setInputViewSet___block_invoke;
            v64[3] = &unk_1E16BCFE0;
            v64[4] = self;
            v65 = v4;
            v67 = buf;
            v66 = v23;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v64);
            -[UIInputWindowControllerHosting setRequiresConstraintUpdate:](self->_hosting, "setRequiresConstraintUpdate:", 1);

            v28 = 1;
          }
        }
        objc_initWeak(v63, self);
        -[UIInputWindowController setTransientInputViewSet:](self, "setTransientInputViewSet:", v4);
        v34 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "notificationsForTransitionToPlacement:", v24);
        if (v34 == 3)
          v35 = 1;
        else
          v35 = HIDWORD(v45);
        if ((v35 | v33) == 1)
        {
          if (HIDWORD(v45))
            objc_msgSend(v24, "setDirty");
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_3;
          v60[3] = &unk_1E16B1500;
          objc_copyWeak(&v62, v63);
          v61 = v4;
          -[UIInputWindowController setPlacement:starting:completion:](self, "setPlacement:starting:completion:", v24, 0, v60);

          objc_destroyWeak(&v62);
          goto LABEL_67;
        }
        if (v34 != 1)
        {
          if (v34 == 2)
          {
            if ((-[UIInputViewSet isCustomInputView](self->_inputViewSet, "isCustomInputView")
               || (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isFloating") & 1) != 0
               || objc_msgSend(v23, "showsInputOrAssistantViews"))
              && (objc_msgSend(v4, "isNullInputView") & 1) == 0
              && (objc_msgSend(v24, "showsKeyboard") & 1) == 0)
            {
              -[UIInputWindowController currentTransition](self, "currentTransition");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "toPlacement");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqual:", v24);

              v36 = v41 | v44;
            }
            else
            {
              v36 = 1;
            }
            v42 = MEMORY[0x1E0C809B0];
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_4;
            v56[3] = &unk_1E16C2F48;
            v59 = v36;
            objc_copyWeak(&v58, v63);
            v43 = v4;
            v57 = v43;
            v52[0] = v42;
            v52[1] = 3221225472;
            v52[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_5;
            v52[3] = &unk_1E16C2F48;
            objc_copyWeak(&v54, v63);
            v55 = v36;
            v53 = v43;
            -[UIInputWindowController setPlacement:starting:completion:](self, "setPlacement:starting:completion:", v24, v56, v52);

            objc_destroyWeak(&v54);
            objc_destroyWeak(&v58);
            goto LABEL_67;
          }
          if (!v28)
          {
            -[UIInputWindowController setTransientInputViewSet:](self, "setTransientInputViewSet:", 0);
LABEL_67:
            objc_destroyWeak(v63);
LABEL_68:

            _Block_object_dispose(buf, 8);
            goto LABEL_69;
          }
        }
        +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowController transferActiveNotificationInfoToInfo:](self, "transferActiveNotificationInfoToInfo:", v37);
        objc_msgSend(v37, "addKeyboardNotificationDebuggingInfo:", CFSTR("setInputViewSet:"));
        if ((_DWORD)v45)
        {
          objc_msgSend(v37, "forceNotification");
          objc_msgSend(v37, "setForceNotification:", 1);
        }
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_7;
        v47[3] = &unk_1E16D5FE8;
        objc_copyWeak(&v51, v63);
        v48 = v24;
        v49 = v4;
        v38 = v37;
        v50 = v38;
        -[UIInputWindowController performOperations:withTemplateNotificationInfo:](self, "performOperations:withTemplateNotificationInfo:", v47, v38);

        objc_destroyWeak(&v51);
        goto LABEL_67;
      }
    }
    LOBYTE(v44) = 0;
    goto LABEL_24;
  }
  -[UIInputWindowController setPostRotationInputViewSet:](self, "setPostRotationInputViewSet:", v4);
  -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowController setPostRotationInputViewNotificationInfo:](self, "setPostRotationInputViewNotificationInfo:", v6);

  -[UIInputWindowController postRotationInputViewNotificationInfo](self, "postRotationInputViewNotificationInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldSendInClient:", 1);

LABEL_69:
}

- (BOOL)isRotating
{
  void *v2;
  BOOL v3;

  -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIInputViewSetPlacement)postRotationPlacement
{
  return self->_postRotationPlacement;
}

- (void)updateKeyboardSizeClass
{
  UITraitCollection *v3;
  void *v4;
  void *v5;
  UITraitCollection *sizeClassCollectionOverride;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1);
      v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    -[UIInputWindowController _inputViewController](self, "_inputViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v3, v4);

    -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v3, v5);

    sizeClassCollectionOverride = self->_sizeClassCollectionOverride;
    self->_sizeClassCollectionOverride = v3;

  }
}

- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[5];
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v8 = v6;
  v14 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = v9;
  if (v4)
  {
    v9[2](v9);
  }
  else
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_3;
    v11[3] = &unk_1E16B1BF8;
    v12 = v9;
    -[UIInputWindowController performWithoutCallbacksOrNotifications:](self, "performWithoutCallbacksOrNotifications:", v11);

  }
}

void __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  char v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "updateVisibilityConstraintsForPlacement:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInputAccessoryViewPlaceholder"))
  {

LABEL_5:
    v9 = 0;
    v5 = 0.0;
    v6 = 1;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputAccessoryView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v9, "frame");
  v5 = v4;
  v6 = 0;
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1018) = 1;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1018) = 0;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v9, "frame");
    if (v5 != v8)
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &__block_literal_global_510);
  }

}

- (void)performWithoutCallbacksOrNotifications:(id)a3
{
  ++self->_suppressedNotifications;
  -[UIInputWindowController performWithoutAppearanceCallbacks:](self, "performWithoutAppearanceCallbacks:", a3);
  --self->_suppressedNotifications;
}

- (void)performWithoutAppearanceCallbacks:(id)a3
{
  ++self->_suppressedCallbacks;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_suppressedCallbacks;
}

uint64_t __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_3(uint64_t a1)
{
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", *(_QWORD *)(a1 + 32));
}

- (void)postEndNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6;

  v6 = a4;
  if (-[UIInputWindowController shouldPostNotification:withInfo:](self, "shouldPostNotification:withInfo:", a3))
    -[UIInputWindowController postValidatedEndNotifications:withInfo:](self, "postValidatedEndNotifications:withInfo:", a3, v6);

}

- (void)postStartNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6;

  v6 = a4;
  if (-[UIInputWindowController shouldPostNotification:withInfo:](self, "shouldPostNotification:withInfo:", a3))
    -[UIInputWindowController postValidatedStartNotifications:withInfo:](self, "postValidatedStartNotifications:withInfo:", a3, v6);

}

- (id)currentPresentationPlacement
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animationState");

  if (v4 < 3)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromPlacement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 || objc_msgSend(v5, "showsInputViews"))
    {
      -[UIInputWindowController placement](self, "placement");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }
  else
  {
    -[UIInputWindowController placement](self, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)postValidatedStartNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  BOOL v10;
  _QWORD aBlock[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIInputWindowController_postValidatedStartNotifications_withInfo___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "layoutIsResizing") & 1) != 0)
  {

  }
  else
  {
    v10 = -[UIInputWindowController isTransitioningBetweenFloatingStates](self, "isTransitioningBetweenFloatingStates");

    if (!v10)
    {
      v8[2](v8);
      goto LABEL_6;
    }
  }
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
LABEL_6:

}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_3(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_4;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_4;
  v3[3] = &unk_1E16B1888;
  v1 = *(_QWORD *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = v1;
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_4;
  v3[3] = &unk_1E16B1888;
  v1 = *(_QWORD *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = v1;
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_2;
  v2[3] = &unk_1E16B1B28;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (int)hiddenCount
{
  return self->_hiddenCount;
}

- (UIView)_inputAccessoryView
{
  void *v2;
  void *v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

void __40__UIInputWindowController_setPlacement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  objc_msgSend(a2, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "updateViewConstraints");
    objc_msgSend(WeakRetained, "updateKeyboardDockViewVisibility");

  }
}

- (void)updateInputAssistantView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIInputWindowControllerHosting *hosting;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  UITraitCollection *sizeClassCollectionOverride;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];

  v35 = a3;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
  {
    -[UIViewController _window](self, "_window");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "inputAssistantView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {

        goto LABEL_7;
      }
      -[UIViewController _window](self, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "inputAssistantView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v11)
      {
LABEL_7:
        -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
          v12 = self;
        v14 = objc_msgSend(v12, "_appearState");

        hosting = self->_hosting;
        -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowControllerHosting disableViewSizingConstraints:forNewView:](hosting, "disableViewSizingConstraints:forNewView:", 2, v16);

        -[UIInputWindowController invalidateInputAssistantView](self, "invalidateInputAssistantView");
        -[UIInputViewSet inputAssistantView](self->_inputViewSet, "inputAssistantView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_17;
        *(_QWORD *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
        -[UIInputViewSet assistantViewController](self->_inputViewSet, "assistantViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowController set_inputAssistantViewController:](self, "set_inputAssistantViewController:", v18);

        -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "parentViewController");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v22 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");

          if (v22)
          {
LABEL_14:
            -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", v24, dyld_program_sdk_at_least(), 1);

            sizeClassCollectionOverride = self->_sizeClassCollectionOverride;
            if (sizeClassCollectionOverride)
            {
              -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIViewController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", sizeClassCollectionOverride, v26);

            }
            -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "view");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 102);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setInputAssistantView:", v28);

            -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "didMoveToParentViewController:", self);

            -[UIInputWindowController changeChild:toAppearState:animated:](self, "changeChild:toAppearState:animated:", 2, v14, 0);
            *(_QWORD *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
            -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "view");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIViewController view](self, "view");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "_inheritedRenderConfig");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "_setRenderConfig:", v34);

LABEL_17:
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __52__UIInputWindowController_updateInputAssistantView___block_invoke;
            v36[3] = &unk_1E16B1B28;
            v36[4] = self;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v36);
            goto LABEL_18;
          }
          -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "parentViewController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "invalidateInputAssistantView");

        }
        goto LABEL_14;
      }
    }
  }
LABEL_18:

}

- (UIInputViewController)_inputAssistantViewController
{
  return self->_inputAssistantViewController;
}

- (void)invalidateInputAssistantView
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIInputWindowController _inputAssistantViewController](self, "_inputAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__UIInputWindowController_invalidateInputAssistantView__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend(v4, "_preserveResponderOverridesWhilePerforming:", v5);

}

- (void)set_inputAssistantViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantViewController, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  char v5;
  UIInputWindowControllerHosting *v6;
  UIInputWindowControllerHosting *hosting;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInputWindowController;
  -[UIViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (!self->_hosting)
  {
    -[UIViewController _window](self, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIViewController _window](self, "_window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isForViewService");

      if ((v5 & 1) != 0)
        return;
    }
    else
    {

    }
    v6 = -[UIInputWindowControllerHosting initWithHost:]([UIInputWindowControllerHosting alloc], "initWithHost:", self);
    hosting = self->_hosting;
    self->_hosting = v6;

  }
}

- (void)_updatePlacementWithPlacement:(id)a3
{
  id v5;
  NSObject *v6;
  char isKindOfClass;
  char v8;
  _BOOL4 v9;
  UIInputWindowControllerHosting *hosting;
  void *v11;
  void *v12;
  char v13;
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _UIInputWindowControllerLogger();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "updatePlacementWithPlacement: %@", buf, 0xCu);
  }

  -[UIInputWindowController updateKeyboardPlacementForGuide:](self, "updateKeyboardPlacementForGuide:", v5);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();
  if (-[UIInputViewSetPlacement isHiddenForFloatingTransition](self->_placement, "isHiddenForFloatingTransition"))
    v9 = -[UIInputViewSetPlacement applicatorClassForKeyboard:](self->_placement, "applicatorClassForKeyboard:", 1) == 0;
  else
    v9 = 0;
  -[UIInputWindowControllerHosting unloadForPlacement](self->_hosting, "unloadForPlacement");
  objc_storeStrong((id *)&self->_placement, a3);
  hosting = self->_hosting;
  -[UIInputWindowController transientInputViewSet](self, "transientInputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[UIInputWindowControllerHosting reloadForPlacementForInputViewSet:](hosting, "reloadForPlacementForInputViewSet:", v11);
  }
  else
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHosting reloadForPlacementForInputViewSet:](hosting, "reloadForPlacementForInputViewSet:", v12);

  }
  v13 = isKindOfClass ^ v8;

  if (v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__UIInputWindowController__updatePlacementWithPlacement___block_invoke;
    v14[3] = &unk_1E16B1B28;
    v14[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
  }
  if ((v13 & 1) != 0
    && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"))
  {
    -[UIInputWindowControllerHosting updateViewSizingConstraints](self->_hosting, "updateViewSizingConstraints");
  }

}

- (void)updateKeyboardPlacementForGuide:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__UIInputWindowController_updateKeyboardPlacementForGuide___block_invoke;
    v5[3] = &unk_1E16B29D0;
    v6 = v4;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v5);

  }
}

- (BOOL)currentControllerShouldUpdateKeyboardLayoutGuide
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    v4 = 1;
  }
  else
  {
    -[UIViewController _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_isRemoteKeyboardWindow"))
      v4 = objc_msgSend(v3, "_isHostedInAnotherProcess");
    else
      v4 = 1;

  }
  if ((objc_msgSend(v3, "_isTextEffectsWindowNotificationOwner") & 1) != 0 || !v4)
    v6 = objc_msgSend(v3, "isForViewService") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (UIInputViewSet)transientInputViewSet
{
  return self->_transientInputViewSet;
}

- (BOOL)isSplitting
{
  void *v2;
  void *v3;
  char v4;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitKeyboardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSplitting");

  return v4;
}

- (void)hostAppSceneBoundsChanged
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  _QWORD v24[5];
  char v25;

  -[UIInputWindowControllerHosting updateConstraintInsets](self->_hosting, "updateConstraintInsets");
  if (-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneUpdated");

  }
  if (self->_shouldNotifyRemoteKeyboards)
    NotifyVC(self);
  -[UIViewController _window](self, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHostedInAnotherProcess");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "windowingModeEnabled");

  if ((v8 & 1) != 0 || v5)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __52__UIInputWindowController_hostAppSceneBoundsChanged__block_invoke;
    v24[3] = &unk_1E16B1B78;
    v25 = v5;
    v24[4] = self;
    -[UIInputWindowController performWithoutCallbacksOrNotifications:](self, "performWithoutCallbacksOrNotifications:", v24);
  }
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualModeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "windowingModeEnabled");

    if (v11)
    {
      +[UIKeyboardImpl floatingPersistentOffset](UIKeyboardImpl, "floatingPersistentOffset");
      v13 = v12;
      v15 = v14;
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputViewBounds");
      +[UIPeripheralHost adjustedFloatingOffsetForKeyboardSize:](UIPeripheralHost, "adjustedFloatingOffsetForKeyboardSize:", v17, v18);
      v20 = v19;
      v22 = v21;

      if (v13 != v20 || v15 != v22)
      {
        +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setUndockedWithOffset:animated:", 1, v20, v22);

      }
    }
  }
}

- (CGRect)_visibleFrame
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;
  CGRect v54;
  CGRect v55;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationsFrame");
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  if (CGRectGetHeight(v47) == 0.0
    && +[UIKeyboard isInputUIProcess](UIKeyboard, "isInputUIProcess")
    && !+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "keyboardVisible")
      && (objc_msgSend(v8, "remoteKeyboardUndocked") & 1) == 0
      && !objc_msgSend(v8, "isFloating"))
    {
      objc_msgSend(v8, "keyboardPosition");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      -[UIViewController _window](self, "_window");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "frame");
      v44 = v43;
      objc_msgSend(v8, "keyboardPosition");
      v46 = v44 - v45;
      v51.origin.x = v35;
      v51.origin.y = v37;
      v51.size.width = v39;
      v51.size.height = v41;
      v52 = CGRectOffset(v51, 0.0, v46);
      v28 = v52.origin.x;
      v27 = v52.origin.y;
      v25 = v52.size.width;
      v29 = v52.size.height;

      goto LABEL_11;
    }

  }
  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v48.origin.x = v10;
  v48.origin.y = v12;
  v48.size.width = v14;
  v48.size.height = v16;
  v54.origin.x = v21;
  v54.origin.y = v23;
  v54.size.width = v25;
  v54.size.height = v27;
  if (CGRectIntersectsRect(v48, v54))
  {
    v49.origin.x = v10;
    v49.origin.y = v12;
    v49.size.width = v14;
    v49.size.height = v16;
    v55.origin.x = v21;
    v55.origin.y = v23;
    v55.size.width = v25;
    v55.size.height = v27;
    v50 = CGRectIntersection(v49, v55);
    v28 = v50.origin.x;
    v27 = v50.origin.y;
    v25 = v50.size.width;
    v29 = v50.size.height;
  }
  else
  {
    v28 = 0.0;
    v29 = 0.0;
  }
LABEL_11:

  v30 = v28;
  v31 = v27;
  v32 = v25;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
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
  UIView *preRotationSnapshot;
  void *v18;
  uint64_t v19;
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
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void **v37;
  const __CFString **v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  _QWORD v48[6];
  _QWORD v49[5];
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (self->_rotationState == 2)
  {
    self->_rotationState = 0;
    -[UIInputWindowController _updateContentOverlayInsetsForSelfAndChildren](self, "_updateContentOverlayInsetsForSelfAndChildren");
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 1);

    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputAssistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 1);

    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputAssistantView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 1.0);

    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", 1.0);

    -[UIView removeFromSuperview](self->_preRotationSnapshot, "removeFromSuperview");
    preRotationSnapshot = self->_preRotationSnapshot;
    self->_preRotationSnapshot = 0;

    -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke;
      v49[3] = &unk_1E16B1B28;
      v49[4] = self;
      -[UIInputWindowController performWithoutCallbacksOrNotifications:](self, "performWithoutCallbacksOrNotifications:", v49);
      v48[0] = v19;
      v48[1] = 3221225472;
      v48[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_3;
      v48[3] = &unk_1E16B1888;
      v48[4] = self;
      v48[5] = a3;
      -[UIInputWindowController performWithoutAppearanceCallbacks:](self, "performWithoutAppearanceCallbacks:", v48);
      -[UIInputWindowController popAnimationStyle](self, "popAnimationStyle");
      -[UIInputWindowController postRotationInputViewSet](self, "postRotationInputViewSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController postRotationInputViewNotificationInfo](self, "postRotationInputViewNotificationInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDueToRotation:", 1);
      objc_msgSend(v21, "setShouldSendInClient:", 1);
      if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
        objc_msgSend(v21, "setWaitingForInputUI:", 1);
      -[UIInputWindowController setPostRotationPlacement:](self, "setPostRotationPlacement:", 0);
      -[UIInputWindowController setPostRotationInputViewSet:](self, "setPostRotationInputViewSet:", 0);
      -[UIInputWindowController setPostRotationInputViewNotificationInfo:](self, "setPostRotationInputViewNotificationInfo:", 0);
      -[UIInputWindowController postRotationPendingBlock](self, "postRotationPendingBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("didRotateFromInterfaceOrientation: has postRotationPendingBlock"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addKeyboardNotificationDebuggingInfo:", v23);

        v47[0] = v19;
        v47[1] = 3221225472;
        v47[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_6;
        v47[3] = &unk_1E16B1B28;
        v47[4] = self;
        -[UIInputWindowController performOperations:withTemplateNotificationInfo:](self, "performOperations:withTemplateNotificationInfo:", v47, v21);
        v20 = 0;
      }
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _window](self, "_window");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "completeMoveKeyboardForWindow:", v25);

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("didRotateFromInterfaceOrientation: has pending inputViewSet"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addKeyboardNotificationDebuggingInfo:", v26);

        v45[0] = v19;
        v45[1] = 3221225472;
        v45[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_7;
        v45[3] = &unk_1E16B1B50;
        v45[4] = self;
        v46 = v20;
        -[UIInputWindowController performOperations:withTemplateNotificationInfo:](self, "performOperations:withTemplateNotificationInfo:", v45, v21);

      }
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "isInputViewPlaceholder"))
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "currentInputMode");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "isExtensionInputMode") & 1) != 0)
        {
          -[UIInputWindowController _inputViewController](self, "_inputViewController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_opt_respondsToSelector();

          if ((v31 & 1) != 0)
          {
            -[UIInputWindowController _inputViewController](self, "_inputViewController");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "takeSnapshotView");

            -[UIInputWindowController updateKeyboardLayoutGuideForRotationOrientation:](self, "updateKeyboardLayoutGuideForRotationOrientation:", -[UIViewController interfaceOrientation](self, "interfaceOrientation"));
          }
          goto LABEL_21;
        }

      }
LABEL_21:
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "remoteTextInputPartner");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "documentStateChanged");

      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("UITextEffectsWindow_fromOrientation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("UITextEffectsWindowViewControllerDidRotateNotification"), self, v44);

      return;
    }
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      if (self->_isChangingPlacement)
      {
        -[UIInputWindowController placement](self, "placement");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputWindowController updateVisibilityConstraintsForPlacement:](self, "updateVisibilityConstraintsForPlacement:", v33);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("UITextEffectsWindow_fromOrientation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v35;
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = (void **)v55;
      v38 = &v54;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("UITextEffectsWindow_fromOrientation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v35;
      v36 = (void *)MEMORY[0x1E0C99D80];
      v37 = &v53;
      v38 = &v52;
    }
    objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("UITextEffectsWindowViewControllerDidRotateNotification"), self, v39);

  }
}

- (void)setPostRotationPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_postRotationPlacement, a3);
}

void __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDueToRotation:", 1);
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWasCausedRemotely:", objc_msgSend(v2, "keyboardActive") ^ 1);

  objc_msgSend(v5, "setShouldSendInClient:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("didRotateFromInterfaceOrientation: %li"), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyboardNotificationDebuggingInfo:", v3);

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_5;
  v6[3] = &unk_1E16B1B28;
  v6[4] = v4;
  objc_msgSend(v4, "performOperations:withTemplateNotificationInfo:", v6, v5);

}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDueToRotation:", 1);
  objc_msgSend(v5, "setShouldSendInClient:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("willRotateToInterfaceOrientation: %li"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyboardNotificationDebuggingInfo:", v2);

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWasCausedRemotely:", objc_msgSend(v3, "keyboardActive") ^ 1);

  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_5;
  v6[3] = &unk_1E16B1B28;
  v6[4] = v4;
  objc_msgSend(v4, "performOperations:withTemplateNotificationInfo:", v6, v5);

}

- (void)performOperations:(id)a3 withTemplateNotificationInfo:(id)a4
{
  void (**v6)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  -[UIInputWindowController setTemplateNotificationInfo:](self, "setTemplateNotificationInfo:", a4);
  v6[2](v6);

  -[UIInputWindowController setTemplateNotificationInfo:](self, "setTemplateNotificationInfo:", 0);
}

- (void)setTemplateNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_templateNotificationInfo, a3);
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_5(uint64_t a1)
{
  id v2;

  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlacement:", v2);

}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _BOOL8 v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  int64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  UIInputWindowController *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  if (self->_rotationState == 1)
  {
    self->_rotationState = 2;
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      v7 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_2;
      v38[3] = &unk_1E16B1B28;
      v38[4] = self;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v7, &__block_literal_global_522, v38, 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("UITextEffectsWindow_toOrientation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v42[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UITextEffectsWindowViewControllerWillRotateNotification"), self, v10);
    }
    else
    {
      v11 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_3;
      v37[3] = &unk_1E16B1B28;
      v37[4] = self;
      -[UIInputWindowController performWithoutCallbacksOrNotifications:](self, "performWithoutCallbacksOrNotifications:", v37);
      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsUpdateConstraints");

      -[UIInputWindowController _inputView](self, "_inputView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController _inputAssistantView](self, "_inputAssistantView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIInputWindowController _useLiveRotation](self, "_useLiveRotation"))
      {
        v32[0] = v11;
        v32[1] = 3221225472;
        v32[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_5;
        v32[3] = &unk_1E16B51E8;
        v16 = v13;
        v33 = v16;
        v17 = v14;
        v34 = v17;
        v18 = v15;
        v35 = v18;
        v36 = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v32);
        objc_msgSend(v16, "setAlpha:", 1.0);
        objc_msgSend(v17, "setAlpha:", 1.0);
        objc_msgSend(v18, "setAlpha:", 1.0);
        -[UIView setAlpha:](self->_preRotationSnapshot, "setAlpha:", 0.0);

      }
      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hostView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      -[UIView setBounds:](self->_preRotationSnapshot, "setBounds:");

      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hostView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "center");
      -[UIView setCenter:](self->_preRotationSnapshot, "setCenter:");

      v23 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_7;
      v27[3] = &unk_1E16B2900;
      v27[4] = self;
      v28 = v13;
      v29 = v14;
      v30 = v15;
      v31 = a3;
      v10 = v15;
      v9 = v14;
      v8 = v13;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v23, &__block_literal_global_525, v27, 0);
      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("UITextEffectsWindow_toOrientation");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("UITextEffectsWindowViewControllerWillRotateNotification"), self, v26);

      -[UIInputViewSetNotificationInfo setDuration:](self->_rotationInfo, "setDuration:", a4);
      -[UIInputViewSetNotificationInfo setForceNotification:](self->_rotationInfo, "setForceNotification:", 1);
      -[UIInputViewSetNotificationInfo setShouldSendInClient:](self->_rotationInfo, "setShouldSendInClient:", 1);

    }
  }
}

- (BOOL)_useLiveRotation
{
  void *v2;
  char v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSplit") ^ 1;

  return v3;
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isInputViewPlaceholder") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;

    if (v6 == 0.0)
      objc_msgSend(*(id *)(a1 + 32), "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 0, 1);
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "postRotationPlacement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlacement:", v7);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "initializeTranslateGestureRecognizerIfNecessary");
}

uint64_t __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_3(uint64_t a1)
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

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "populateEndInfoWithFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "addKeyboardNotificationDebuggingInfo:", CFSTR("viewDidLayoutSubviews _rotationInfo updated"));
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1240);
  objc_msgSend(*(id *)(v2 + 1032), "itemForPurpose:", 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "notificationsFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v12, v5, v7, v9, v11);
  objc_msgSend(v3, "populateStartInfoWithFrame:");

}

void __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  _BOOL4 v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  void *v50;
  void *v51;
  _BYTE *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  int v61;
  CGFloat *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGRect v67;
  CGRect v68;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", *(double *)(*(_QWORD *)(a1 + 32) + 1248), *(double *)(*(_QWORD *)(a1 + 32) + 1256), *(double *)(*(_QWORD *)(a1 + 32) + 1264), *(double *)(*(_QWORD *)(a1 + 32) + 1272));
  v63 = v2;
  v64 = v3;
  v65 = v4;
  v66 = v5;
  v6 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationsFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v9, v11, v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "screen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");
  v28 = v27;

  v29 = *(double **)(a1 + 32);
  if (v29[158] == v21)
    v6 = round(v28 * v29[159]) != round(v23 * v28);
  objc_msgSend(v29, "inputViewSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "inputAccessoryViewBounds");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v67.origin.x = v32;
  v67.origin.y = v34;
  v67.size.width = v36;
  v67.size.height = v38;
  v39 = CGRectEqualToRect(v67, *(CGRect *)(*(_QWORD *)(a1 + 32) + 1280));
  v40 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (v40 && v39)
  {
    v68.origin.x = v32;
    v68.origin.y = v34;
    v68.size.width = v36;
    v68.size.height = v38;
    v40 = !CGRectIsEmpty(v68);
  }
  if (*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
  {
    if (v6)
    {
      v52 = *(_BYTE **)(a1 + 32);
      if (v52[992])
      {
        objc_msgSend(v52, "currentTransition");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "notificationInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "addKeyboardNotificationDebuggingInfo:", CFSTR("viewDidLayoutSubviews hasTransition, hostViewDidChangeSize, _isChangingPlacement"));
        if (v40)
          objc_msgSend(v43, "setShouldSendInClient:", 1);
        v54 = *(void **)(a1 + 32);
        objc_msgSend(v54, "currentTransition");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "postEndNotifications:withInfo:", objc_msgSend(v55, "notifications"), v43);

        objc_msgSend(v43, "populateStartInfoWithFrame:", v63, v64, v65, v66);
        objc_msgSend(v43, "populateEndInfoWithFrame:", v17, v19, v21, v23);
        objc_msgSend(*(id *)(a1 + 32), "currentTransition");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "notifications");

        if (v57)
          objc_msgSend(*(id *)(a1 + 32), "keyboardMoveOfType:info:", 1, v43);
        v58 = *(void **)(a1 + 32);
        objc_msgSend(v58, "currentTransition");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "postStartNotifications:withInfo:", objc_msgSend(v50, "notifications"), v43);
        goto LABEL_38;
      }
    }
  }
  else
  {
    v41 = *(void **)(*(_QWORD *)(a1 + 32) + 1320);
    if (v41)
    {
      objc_msgSend(v41, "addKeyboardNotificationDebuggingInfo:", CFSTR("viewDidLayoutSubviews update _keyboardHeightChangeNotificationInfo"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "populateEndInfoWithFrame:", v17, v19, v21, v23);
      goto LABEL_39;
    }
    if (*(_BYTE *)(a1 + 41))
      v42 = 1;
    else
      v42 = v6;
    if (v42 == 1)
    {
      +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setForceNotification:", 1);
      objc_msgSend(*(id *)(a1 + 32), "transferActiveNotificationInfoToInfo:", v43);
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "populateWithAnimationStyle:", v44);

      objc_msgSend(v43, "populateStartInfoWithFrame:", v63, v64, v65, v66);
      objc_msgSend(v43, "populateEndInfoWithFrame:", v17, v19, v21, v23);
      if (*(_BYTE *)(a1 + 41))
        v45 = CFSTR(" transitionRequiresImplicitNotifications");
      else
        v45 = &stru_1E16EDF20;
      v46 = CFSTR(" hostViewDidChangeSize");
      if (!v6)
        v46 = &stru_1E16EDF20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("viewDidLayoutSubviews%@%@"), v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addKeyboardNotificationDebuggingInfo:", v47);

      v48 = *(_BYTE **)(a1 + 32);
      if (v6 && v48[1410])
      {
        objc_msgSend(v48, "keyboardMoveOfType:info:", 1, v43);
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1410) = 0;
        v48 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v48, "_screen");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardMotionSupport supportForScreen:](UIFlickingAssistantViewSupport, "supportForScreen:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "placement");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v51, "isFloating") & 1) != 0)
      {

      }
      else
      {
        v59 = objc_msgSend(v50, "handlingFlickGesture");

        if ((v59 & 1) == 0)
        {
          if (v40)
            objc_msgSend(v43, "setShouldSendInClient:", 1);
          if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          {
            +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isWaitingForInputUI");

            if (v61)
              objc_msgSend(v43, "setWaitingForInputUI:", 1);
          }
          objc_msgSend(*(id *)(a1 + 32), "postStartNotifications:withInfo:", 2, v43);
          objc_msgSend(*(id *)(a1 + 32), "postEndNotifications:withInfo:", 2, v43);
        }
      }
LABEL_38:

    }
  }
LABEL_39:
  v62 = (CGFloat *)(*(_QWORD *)(a1 + 32) + 1280);
  *v62 = v32;
  v62[1] = v34;
  v62[2] = v36;
  v62[3] = v38;
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2(uint64_t a1)
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  CGRect v22;
  CGRect v23;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 40), "notificationInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "populateStartInfoWithFrame:", v12, v14, v16, v18);

  objc_msgSend(*(id *)(a1 + 40), "notificationInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  objc_msgSend(v20, "setForceNotification:", objc_msgSend(v20, "forceNotification") | !CGRectEqualToRect(v22, v23));

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isWaitingForInputUI")
    && objc_msgSend(*(id *)(a1 + 48), "showsKeyboard"))
  {

    if (v18 != 0.0)
      return;
    objc_msgSend(*(id *)(a1 + 40), "notificationInfo");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWaitingForInputUI:", 1);
  }

}

- (CGRect)convertRectFromContainerCoordinateSpaceToScreenSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    goto LABEL_2;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "visualModeManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "windowingModeEnabled");

  if ((v28 & 1) != 0)
  {
LABEL_8:
    -[UIViewController _window](self, "_window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "coordinateSpace");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _window](self, "_window");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "screen");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "coordinateSpace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertRect:toCoordinateSpace:", v36, v10, v12, v14, v16);
    v19 = v37;
    v21 = v38;
    v23 = v39;
    v25 = v40;

    goto LABEL_9;
  }
  -[UIViewController _window](self, "_window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "_isTextEffectsWindow") & 1) == 0)
  {

    goto LABEL_8;
  }
  -[UIViewController _window](self, "_window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "_isHostedInAnotherProcess");

  if (!v31)
    goto LABEL_8;
LABEL_2:
  -[UIViewController _window](self, "_window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertRect:toWindow:", 0, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
LABEL_9:

  v41 = v19;
  v42 = v21;
  v43 = v23;
  v44 = v25;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

uint64_t __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

  result = objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  v9 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v9[4] = v10;
  v9[5] = v11;
  v9[6] = v12;
  v9[7] = v13;
  return result;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInputWindowController;
  -[UIViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  if (!self->_didOverridePreLayoutHostViewFrame)
  {
    -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationsFrame");
    self->_preLayoutHostViewFrame.origin.x = v4;
    self->_preLayoutHostViewFrame.origin.y = v5;
    self->_preLayoutHostViewFrame.size.width = v6;
    self->_preLayoutHostViewFrame.size.height = v7;

  }
  self->_didOverridePreLayoutHostViewFrame = 0;
}

- (void)setPostRotationInputViewSet:(id)a3
{
  objc_storeStrong((id *)&self->_postRotationInputViewSet, a3);
}

- (void)setPostRotationInputViewNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_postRotationInputViewNotificationInfo, a3);
}

- (id)postRotationPendingBlock
{
  return self->_postRotationPendingBlock;
}

- (UIInputViewSet)postRotationInputViewSet
{
  return self->_postRotationInputViewSet;
}

- (UIInputViewSetNotificationInfo)postRotationInputViewNotificationInfo
{
  return self->_postRotationInputViewNotificationInfo;
}

- (void)transferActiveNotificationInfoToInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIInputWindowController templateNotificationInfo](self, "templateNotificationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transferActiveNotificationInfoToInfo:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addKeyboardNotificationDebuggingInfo:", v5);

  if (v4)
  {
    objc_msgSend(v7, "setWasCausedRemotely:", objc_msgSend(v4, "wasCausedRemotely"));
    objc_msgSend(v7, "setDueToRotation:", objc_msgSend(v4, "dueToRotation"));
    objc_msgSend(v7, "setWaitingForInputUI:", objc_msgSend(v4, "waitingForInputUI"));
    if ((objc_msgSend(v7, "dueToRotation") & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (-[UIInputWindowController isRotating](self, "isRotating"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWasCausedRemotely:", objc_msgSend(v6, "keyboardActive") ^ 1);

    objc_msgSend(v7, "setDueToRotation:", 1);
LABEL_6:
    objc_msgSend(v7, "setShouldSendInClient:", 1);
  }
LABEL_7:

}

void __43__UIInputWindowController_setInputViewSet___block_invoke_7(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = a1[4];
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_8;
  v8[3] = &unk_1E16BFAE0;
  objc_copyWeak(&v11, v2);
  v9 = a1[5];
  v10 = a1[6];
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_10;
  v6[3] = &unk_1E16B1B28;
  v7 = a1[4];
  objc_msgSend(WeakRetained, "setPlacement:starting:completion:", v4, v8, v6);

  objc_destroyWeak(&v11);
}

- (void)setPlacement:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__UIInputWindowController_setPlacement___block_invoke;
  v5[3] = &unk_1E16B3F40;
  objc_copyWeak(&v6, &location);
  -[UIInputWindowController setPlacement:starting:completion:](self, "setPlacement:starting:completion:", v4, v5, 0);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (void)setPlacement:(id)a3 starting:(id)a4 completion:(id)a5
{
  -[UIInputWindowController moveFromPlacement:toPlacement:starting:completion:](self, "moveFromPlacement:toPlacement:starting:completion:", self->_placement, a3, a4, a5);
}

- (CGRect)visibleFrame
{
  void *v3;
  UIInputWindowController *v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerRootController");
  v4 = (UIInputWindowController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[UIInputWindowController _visibleFrame](self, "_visibleFrame");
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerRootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_visibleFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)isUndocked
{
  void *v2;
  char v3;

  -[UIInputWindowController placement](self, "placement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndocked");

  return v3;
}

- (BOOL)isChangingPlacement
{
  return self->_isChangingPlacement;
}

- (void)chainPlacementsIfNecessaryFrom:(id)a3 toPlacement:(id)a4 transition:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __objc2_class **v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v32;
  int v33;
  __objc2_class **v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  int v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  UIInputWindowController *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void (**v64)(_QWORD);
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  UIInputWindowController *v70;
  _QWORD aBlock[5];
  id v72;
  _BYTE *v73;
  _BYTE buf[24];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  _UIInputWindowControllerLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v75 = v12;
    _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "chainPlacementsIfNecessaryFrom, from: %@, to: %@ transition: %@", buf, 0x20u);
  }

  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
    goto LABEL_41;
  objc_msgSend(v12, "animationStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "animated"))
    goto LABEL_40;
  v16 = -[UIInputWindowController isTransitioningBetweenFloatingStates](self, "isTransitioningBetweenFloatingStates");

  if (v16)
    goto LABEL_41;
  if (objc_msgSend(v11, "isFloating") && objc_msgSend(v10, "isVisible"))
  {
    if (objc_msgSend(v10, "isFloatingAssistantView"))
    {
      +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v10);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "animationStyle");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "showsInputOrAssistantViews"))
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inputAccessoryView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = off_1E167A9C8;
      if (v26)
        v27 = off_1E167A998;
      -[__objc2_class placement](*v27, "placement");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "animationStyle");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:", v10);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:", v11);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (objc_msgSend(v11, "isVisible") && objc_msgSend(v10, "isFloating"))
  {
    +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:forFloatingAssistantViewTransition:", v10, objc_msgSend(v11, "isFloatingAssistantView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "animationStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "showsInputOrAssistantViews"))
    {
      if (objc_msgSend(v11, "isFloatingAssistantView"))
      {
        +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v11);
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[UIInputWindowController inputViewSet](self, "inputViewSet");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "inputAccessoryView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          +[UIInputViewSetPlacement placement](UIInputViewSetPlacementAccessoryOnScreen, "placement");
        else
          +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v23 = (id)v19;
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v11, "isFloatingAssistantView")
    && objc_msgSend(v10, "isVisible")
    && (objc_msgSend(v10, "isFloatingAssistantView") & 1) == 0)
  {
    if (objc_msgSend(v10, "accessoryViewWillAppear") && (objc_msgSend(v10, "showsKeyboard") & 1) == 0)
    {
      +[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:](UIInputViewSetPlacementInvisibleAssistantBar, "placementWithPlacement:", v11);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    +[UIInputViewSetPlacementOffScreenDownForFloatingAssistant placement](UIInputViewSetPlacementOffScreenDownForFloatingAssistant, "placement");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "animationStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v11);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_56:
    v32 = (id)v24;
    goto LABEL_57;
  }
  if (!objc_msgSend(v11, "isVisible")
    || !objc_msgSend(v10, "isFloatingAssistantView")
    || (objc_msgSend(v11, "isFloatingAssistantView") & 1) != 0)
  {
    if (objc_msgSend(v10, "isFloatingAssistantView"))
    {
      if (objc_msgSend(v11, "isFloatingAssistantView"))
      {
        if ((objc_msgSend(v11, "isInteractive") & 1) == 0)
        {
          +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "visualModeManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "windowingModeEnabled");

          if (v22)
          {
            +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v10);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "animationStyle");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v11);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
            v24 = objc_claimAutoreleasedReturnValue();
            goto LABEL_56;
          }
        }
      }
    }
LABEL_41:
    v23 = 0;
    v32 = 0;
    v18 = 0;
    goto LABEL_42;
  }
  if (objc_msgSend(v11, "accessoryViewWillAppear"))
  {
    if ((objc_msgSend(v11, "showsKeyboard") & 1) == 0)
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "inputAccessoryView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (!v31)
      {
        +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAnimationStyle:", v15);
LABEL_40:

        goto LABEL_41;
      }
    }
  }
  +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v10);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "showsInputOrAssistantViews"))
  {
LABEL_30:
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnimationStyle:", v28);

LABEL_53:
    v32 = 0;
    v23 = 0;
    goto LABEL_57;
  }
  v33 = objc_msgSend(v11, "accessoryViewWillAppear");
  v34 = off_1E167A998;
  if (!v33)
    v34 = off_1E167A9C8;
  -[__objc2_class placement](*v34, "placement");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "animationStyle");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v35;
LABEL_57:
  if (v54)
  {
    _UIInputWindowControllerLogger();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_DEFAULT, "chainPlacementsIfNecessaryFrom, intermediate 1: %@, intermediate 2: %@", buf, 0x16u);
    }

    -[UIInputWindowController setPlacementDuringAnimation:](self, "setPlacementDuringAnimation:", v54);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v75) = 0;
    if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "visualModeManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v46, "shouldShowWithinAppWindow");

      if (v53)
      {
        -[UIViewController _window](self, "_window");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "_isRemoteKeyboardWindow");

        if ((v48 & 1) != 0)
          goto LABEL_62;
      }
      else
      {
        -[UIViewController _window](self, "_window");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "_isRemoteKeyboardWindow");

        if (!v50)
          goto LABEL_62;
      }
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setLockFloating:", 1);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setSuppressUpdateLayout:", 1);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setSuppressUpdateShiftState:", 1);

    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 1;
LABEL_62:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke;
    aBlock[3] = &unk_1E16B9698;
    v73 = buf;
    aBlock[4] = self;
    v42 = v10;
    v72 = v42;
    v52 = _Block_copy(aBlock);
    +[_UIWeakReference weakReferenceWrappingObject:](_UIWeakReference, "weakReferenceWrappingObject:", self);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_2;
    v65[3] = &unk_1E16B6F18;
    v66 = v43;
    v51 = v54;
    v67 = v51;
    v68 = v42;
    v69 = v11;
    v70 = self;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_3;
    v56[3] = &unk_1E16D5F38;
    v57 = v12;
    v55 = v52;
    v63 = v55;
    v58 = self;
    v23 = v23;
    v59 = v23;
    v44 = v66;
    v60 = v44;
    v32 = v32;
    v61 = v32;
    v62 = v69;
    v64 = v13;
    objc_msgSend(v18, "launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", v65, 0, v56, v70, 0);

    _Block_object_dispose(buf, 8);
    goto LABEL_43;
  }
LABEL_42:
  v13[2](v13);
LABEL_43:

}

- (void)postValidatedEndNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  BOOL v10;
  _QWORD aBlock[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIInputWindowController_postValidatedEndNotifications_withInfo___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "layoutIsResizing") & 1) != 0)
  {

  }
  else
  {
    v10 = -[UIInputWindowController isTransitioningBetweenFloatingStates](self, "isTransitioningBetweenFloatingStates");

    if (!v10)
    {
      v8[2](v8);
      goto LABEL_6;
    }
  }
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
LABEL_6:

}

- (BOOL)isTransitioningBetweenFloatingStates
{
  BOOL v3;
  void *v4;
  UIInputWindowController *v5;
  BOOL v6;

  v3 = -[UIKeyboardFloatingTransitionController isTransitioning](self->_floatingTransitionController, "isTransitioning");
  if (!self->_floatingTransitionController)
  {
    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inputWindowRootViewController");
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_rootInputWindowController");
    }
    v5 = (UIInputWindowController *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = v5 == self;
    else
      v6 = 1;
    if (!v6)
      v3 = -[UIInputWindowController isTransitioningBetweenFloatingStates](v5, "isTransitioningBetweenFloatingStates");

  }
  return v3;
}

void __66__UIInputWindowController_postValidatedEndNotifications_withInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  const char *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString **v28;
  id *v29;
  id v30;
  __CFString *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  const char *v35;
  os_signpost_id_t v36;
  os_signpost_id_t v37;
  os_signpost_id_t v38;
  os_signpost_id_t v39;
  os_signpost_id_t v40;
  NSObject *v41;
  uint64_t v42;
  char v43;
  _BYTE v44[12];
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.none";
          goto LABEL_20;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v7 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v7;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.frameChange";
          goto LABEL_20;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v8;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.show";
          goto LABEL_20;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v9 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v9;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.hide";
          goto LABEL_20;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v10;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.rotate";
          goto LABEL_20;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v6;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v44 = 0;
          v5 = "notificationDid.unknown";
LABEL_20:
          _os_signpost_emit_with_name_impl(&dword_185066000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, v5, "", v44, 2u);
        }
      }
      break;
  }

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWasCausedRemotely:", objc_msgSend(v12, "isRemoteKeyboard") | objc_msgSend(v11, "wasCausedRemotely"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "keyboardControlsNotifications", *(_QWORD *)v44))
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "shouldSendInClient") & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 32), "isRotating") & 1) == 0)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keyboardSendNotification:withInfo:isStart:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
LABEL_32:

      }
    }
    else if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
           && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "placementIgnoringRotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "accessoryViewWillAppear") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "shouldSendInClient") & 1) != 0)
      {
        goto LABEL_32;
      }
      v43 = objc_msgSend(*(id *)(a1 + 32), "isRotating");

      if ((v43 & 1) == 0)
        return;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "placement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "setAssistantOnScreenOnly:", objc_opt_isKindOfClass() & 1);

  objc_msgSend(*(id *)(a1 + 40), "privateUserInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", CFSTR("UIKeyboardDidChangeFrameNotification"), v14);
  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v16);
  objc_msgSend(*(id *)(a1 + 32), "updateAmbiguousControlCenterActivationMargin:withInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if (!objc_msgSend((id)UIApp, "isSuspended")
    || (objc_msgSend(*(id *)(a1 + 32), "_window"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "_isHostedInAnotherProcess"),
        v18,
        v19))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "keyboard");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = objc_msgSend(*(id *)(a1 + 32), "isOnScreen");
      v23 = *(void **)(a1 + 32);
      if (v22)
      {
        objc_msgSend(v23, "placement");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "showsKeyboard") & 1) != 0)
          v25 = 1;
        else
          v25 = objc_msgSend(*(id *)(a1 + 32), "isUndocked");

      }
      else
      {
        v25 = objc_msgSend(v23, "isUndocked");
      }
    }
    else
    {
      v25 = 0;
    }

    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setKeyboardOnScreenNotifyKey:", v25);

  }
  v27 = *(_QWORD *)(a1 + 48);
  if (v27 == 2)
  {
    v28 = UIKeyboardPrivateDidShowNotification;
    v29 = (id *)&UIKeyboardDidShowNotification;
    goto LABEL_48;
  }
  if (v27 == 3)
  {
    v28 = UIKeyboardPrivateDidHideNotification;
    v29 = (id *)&UIKeyboardDidHideNotification;
LABEL_48:
    v30 = *v29;
    v31 = *v28;
    if (v30)
      objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", v30, v14);
    if (v31)
      objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", v31, v16);
    v27 = *(_QWORD *)(a1 + 48);
    goto LABEL_54;
  }
  v30 = 0;
  v31 = 0;
LABEL_54:
  switch(v27)
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.none";
          goto LABEL_73;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v37 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v37;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.frameChange";
          goto LABEL_73;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v38 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v38;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.show";
          goto LABEL_73;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v39 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v39;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.hide";
          goto LABEL_73;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v40 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v40;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.rotate";
          goto LABEL_73;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v36;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)v44 = 0;
          v35 = "notificationDid.unknown";
LABEL_73:
          _os_signpost_emit_with_name_impl(&dword_185066000, v32, OS_SIGNPOST_INTERVAL_END, v34, v35, "", v44, 2u);
        }
      }
      break;
  }

  _UIInputWindowControllerLogger();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v44 = 138412546;
    *(_QWORD *)&v44[4] = v30;
    v45 = 2112;
    v46 = v42;
    _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "Posted notifications (end): %@ %@", v44, 0x16u);
  }

}

void __68__UIInputWindowController_postValidatedStartNotifications_withInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  const char *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString **v19;
  id *v20;
  id v21;
  __CFString *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  const char *v26;
  os_signpost_id_t v27;
  os_signpost_id_t v28;
  os_signpost_id_t v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  NSObject *v32;
  uint64_t v33;
  char v34;
  _BYTE v35[12];
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.none";
          goto LABEL_20;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v7 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v7;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.frameChange";
          goto LABEL_20;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v8;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.show";
          goto LABEL_20;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v9 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v9;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.hide";
          goto LABEL_20;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v10;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.rotate";
          goto LABEL_20;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v4 = v6;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)v35 = 0;
          v5 = "notificationWill.unknown";
LABEL_20:
          _os_signpost_emit_with_name_impl(&dword_185066000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, v5, "", v35, 2u);
        }
      }
      break;
  }

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWasCausedRemotely:", objc_msgSend(v12, "isRemoteKeyboard") | objc_msgSend(v11, "wasCausedRemotely"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "keyboardControlsNotifications", *(_QWORD *)v35))
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "shouldSendInClient") & 1) == 0
        && (objc_msgSend(*(id *)(a1 + 32), "isRotating") & 1) == 0)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keyboardSendNotification:withInfo:isStart:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
LABEL_32:

      }
    }
    else if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
           && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "placementIgnoringRotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "accessoryViewWillAppear") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "shouldSendInClient") & 1) != 0)
      {
        goto LABEL_32;
      }
      v34 = objc_msgSend(*(id *)(a1 + 32), "isRotating");

      if ((v34 & 1) == 0)
        return;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "placement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "setAssistantOnScreenOnly:", objc_opt_isKindOfClass() & 1);

  objc_msgSend(*(id *)(a1 + 40), "privateUserInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", CFSTR("UIKeyboardWillChangeFrameNotification"), v14);
  objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", CFSTR("UIKeyboardPrivateWillChangeFrameNotification"), v16);
  v18 = *(_QWORD *)(a1 + 48);
  if (v18 == 2)
  {
    v19 = &UIKeyboardPrivateWillShowNotification;
    v20 = (id *)&UIKeyboardWillShowNotification;
    goto LABEL_37;
  }
  if (v18 == 3)
  {
    v19 = &UIKeyboardPrivateWillHideNotification;
    v20 = (id *)&UIKeyboardWillHideNotification;
LABEL_37:
    v21 = *v20;
    v22 = *v19;
    if (v21)
      objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", v21, v14);
    if (v22)
      objc_msgSend(*(id *)(a1 + 32), "postNotificationName:userInfo:", v22, v16);
    v18 = *(_QWORD *)(a1 + 48);
    goto LABEL_43;
  }
  v21 = 0;
  v22 = 0;
LABEL_43:
  switch(v18)
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.none";
          goto LABEL_62;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v28 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v28;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.frameChange";
          goto LABEL_62;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v29 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v29;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.show";
          goto LABEL_62;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v30 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v30;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.hide";
          goto LABEL_62;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v31 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v31;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.rotate";
          goto LABEL_62;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v25 = v27;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v35 = 0;
          v26 = "notificationWill.unknown";
LABEL_62:
          _os_signpost_emit_with_name_impl(&dword_185066000, v23, OS_SIGNPOST_INTERVAL_END, v25, v26, "", v35, 2u);
        }
      }
      break;
  }

  _UIInputWindowControllerLogger();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v35 = 138412546;
    *(_QWORD *)&v35[4] = v21;
    v36 = 2112;
    v37 = v33;
    _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_DEFAULT, "Posted notifications (start): %@ %@", v35, 0x16u);
  }

}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[UIViewController view](self, "view");
    v23 = v8;
    v15 = v6;
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screen");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v16;
    v6 = v15;
    v8 = v23;
  }

  if (-[UIInputWindowController needsConvertToSceneCoordinates](self, "needsConvertToSceneCoordinates"))
  {
    -[UIInputWindowController convertUserInfo:](self, "convertUserInfo:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v6, v14, v19);
    _UIInputWindowControllerLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[UIViewController _window](self, "_window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "windowScene");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Posting converted notifications: %@ %@ for scene %@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v6, v14, v7);
  }

}

- (BOOL)needsConvertToSceneCoordinates
{
  void *v2;
  void *v3;
  char v4;

  if (qword_1ECD7A268 != -1)
    dispatch_once(&qword_1ECD7A268, &__block_literal_global_417_1);
  if (!_MergedGlobals_29_2)
    return 0;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "windowingModeEnabled");

  return v4;
}

- (BOOL)keyboardControlsNotifications
{
  void *v2;
  void *v3;
  char v4;

  if (TIGetNotificationsFromKeyboardValue_onceToken != -1)
    dispatch_once(&TIGetNotificationsFromKeyboardValue_onceToken, &__block_literal_global_1006_0);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("NotificationsFromKeyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "integerValue");
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isSnapshotting
{
  return self->_isSnapshotting;
}

- (void)_getRotationContentSettings:(id *)a3
{
  a3->var6 = 0;
  a3->var4 = 1;
}

- (void)setExclusiveTouch:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "hostView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setExclusiveTouch:", v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (UIInputViewSetPlacement)animationAwarePlacement
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIInputWindowController placementDuringAnimation](self, "placementDuringAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIInputWindowController placementIgnoringRotation](self, "placementIgnoringRotation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIInputViewSetPlacement *)v6;
}

- (UIInputViewSetPlacement)placementDuringAnimation
{
  return self->_placementDuringAnimation;
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  _OWORD v19[3];
  _OWORD v20[3];
  _OWORD v21[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  v2 = a1[4];
  memset(&t1, 0, sizeof(t1));
  v3 = *(_OWORD *)(v2 + 1096);
  v4 = *(_OWORD *)(v2 + 1128);
  *(_OWORD *)&t2.c = *(_OWORD *)(v2 + 1112);
  *(_OWORD *)&t2.tx = v4;
  *(_OWORD *)&t2.a = v3;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v5 = (void *)a1[5];
    v7 = *(_OWORD *)(v2 + 1112);
    v6 = *(_OWORD *)(v2 + 1128);
    v21[0] = *(_OWORD *)(v2 + 1096);
    v21[1] = v7;
    v21[2] = v6;
    objc_msgSend(v5, "setTransform:", v21);
    v2 = a1[4];
  }
  memset(&t1, 0, sizeof(t1));
  v8 = *(_OWORD *)(v2 + 1144);
  v9 = *(_OWORD *)(v2 + 1176);
  *(_OWORD *)&t2.c = *(_OWORD *)(v2 + 1160);
  *(_OWORD *)&t2.tx = v9;
  *(_OWORD *)&t2.a = v8;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v10 = (void *)a1[6];
    v12 = *(_OWORD *)(v2 + 1160);
    v11 = *(_OWORD *)(v2 + 1176);
    v20[0] = *(_OWORD *)(v2 + 1144);
    v20[1] = v12;
    v20[2] = v11;
    objc_msgSend(v10, "setTransform:", v20);
    v2 = a1[4];
  }
  memset(&t1, 0, sizeof(t1));
  v13 = *(_OWORD *)(v2 + 1192);
  v14 = *(_OWORD *)(v2 + 1224);
  *(_OWORD *)&t2.c = *(_OWORD *)(v2 + 1208);
  *(_OWORD *)&t2.tx = v14;
  *(_OWORD *)&t2.a = v13;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v15 = (void *)a1[7];
    v17 = *(_OWORD *)(v2 + 1208);
    v16 = *(_OWORD *)(v2 + 1224);
    v19[0] = *(_OWORD *)(v2 + 1192);
    v19[1] = v17;
    v19[2] = v16;
    objc_msgSend(v15, "setTransform:", v19);
    v2 = a1[4];
  }
  return objc_msgSend((id)v2, "updateKeyboardLayoutGuideForRotationOrientation:", a1[8]);
}

- (void)updateKeyboardLayoutGuideForRotationOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[6];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[UIInputWindowController placementIgnoringRotation](self, "placementIgnoringRotation");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isFloating"))
    goto LABEL_4;
  -[UIInputWindowController placement](self, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFloatingAssistantView"))
  {

LABEL_4:
    v6 = v34;
LABEL_5:

    return;
  }
  -[UIInputWindowController placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showsKeyboard");

  if (v8)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentUIState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v10, "assistantBarVisible") & 1) != 0)
        v11 = 1;
      else
        v11 = objc_msgSend(v10, "requiresHeightForIntegratedAssistantBar");
      if ((unint64_t)(a3 - 3) >= 2)
        v12 = 1;
      else
        v12 = 4;
      +[UIKeyboard sizeForInterfaceOrientation:includingAssistantBar:ignoreInputView:](UIKeyboard, "sizeForInterfaceOrientation:includingAssistantBar:ignoreInputView:", v12, v11, 0);
      v14 = v13;
      v16 = v15;

      goto LABEL_19;
    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      +[UIKeyboard sizeForInterfaceOrientation:ignoreInputView:](UIKeyboard, "sizeForInterfaceOrientation:ignoreInputView:", a3, 0);
      v14 = v17;
      v16 = v18;
LABEL_19:
      -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v14, v16);
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke;
      aBlock[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
      *(double *)&aBlock[4] = v14;
      *(double *)&aBlock[5] = v16;
      v20 = _Block_copy(aBlock);
      -[UIViewController _window](self, "_window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "_isHostedInAnotherProcess");

      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasActiveKeyboardResponder");

      if ((v24 & 1) != 0 || v22)
      {
        v40[0] = v19;
        v40[1] = 3221225472;
        v40[2] = __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke_2;
        v40[3] = &unk_1E16D5D90;
        v41 = v20;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v40);
        v27 = v41;
      }
      else
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[UIViewController _window](self, "_window");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "windowScene");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "windows");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v37 != v30)
                objc_enumerationMutation(v27);
              (*((void (**)(void *, _QWORD))v20 + 2))(v20, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
          }
          while (v29);
        }
      }

      return;
    }
    -[UIViewController _window](self, "_window");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "_isRemoteKeyboardWindow"))
    {
      v6 = v35;
      goto LABEL_5;
    }
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isInputViewPlaceholder");

    if (v33)
      -[UIInputWindowController updateKeyboardLayoutGuideForRefreshedPlaceholder](self, "updateKeyboardLayoutGuideForRefreshedPlaceholder");
  }
}

- (UIInputViewSetPlacement)placementIgnoringRotation
{
  if (-[UIInputWindowController isRotating](self, "isRotating"))
    -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  else
    -[UIInputWindowController placement](self, "placement");
  return (UIInputViewSetPlacement *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:(BOOL)a3 layoutSubviews:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 externalTrackingUpdateInProgress;
  void *v22;
  id v23;

  v4 = a4;
  v5 = a3;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInputViewPlaceholder");

  if (v8)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "refreshPlaceholder");

  }
  else
  {
    v11 = 0;
  }
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isInputAssistantViewPlaceholder");

  if (v13)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputAssistantView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v11 | objc_msgSend(v15, "refreshPlaceholder");

  }
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isInputAccessoryViewPlaceholder");

  if (v17)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputAccessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v11 | objc_msgSend(v19, "refreshPlaceholder");

    if ((v11 & 1) == 0)
      return;
  }
  else if (!(_DWORD)v11)
  {
    return;
  }
  if (v5
    || v4
    || (-[UIInputWindowController postRotationPlacement](self, "postRotationPlacement"),
        (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isInputViewPlaceholder"))
    {
      externalTrackingUpdateInProgress = self->_externalTrackingUpdateInProgress;

      if (!v5 && !v4)
      if (!externalTrackingUpdateInProgress)
        -[UIInputWindowController updateKeyboardLayoutGuideForRefreshedPlaceholder](self, "updateKeyboardLayoutGuideForRefreshedPlaceholder");
    }
    else
    {

      if (!v5 && !v4)
    }
  }
  if (v5)
    -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
  -[UIViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v4)
    objc_msgSend(v22, "layoutIfNeeded");
  else
    objc_msgSend(v22, "setNeedsLayout");

}

- (CGRect)_defaultInitialViewFrame
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

  -[UIViewController _screen](self, "_screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!__SplashBoardOverrideStatusBarOrientation)
    objc_msgSend((id)UIApp, "_safeInterfaceOrientationForNoWindow");
  objc_msgSend(v2, "_boundsForInterfaceOrientation:");
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

- (BOOL)isTransitioning
{
  void *v2;
  BOOL v3;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)sizesWindowToScene
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "windowingModeEnabled");

  return v4;
}

- (void)transferPlacementStateToInputWindowController:(id)a3
{
  UIInputViewSet *v4;
  UIInputViewSetPlacement *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = self->_inputViewSet;
  v5 = self->_placement;
  if (-[UIInputWindowController isTransitioning](self, "isTransitioning"))
  {
    -[UIInputWindowController transientInputViewSet](self, "transientInputViewSet");
    v6 = objc_claimAutoreleasedReturnValue();

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromPlacement");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (UIInputViewSetPlacement *)v8;
    v4 = (UIInputViewSet *)v6;
  }
  if (-[UIInputViewSet isInputViewPlaceholder](v4, "isInputViewPlaceholder"))
  {
    -[UIInputViewSet inputView](v4, "inputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fallbackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSet inputAccessoryView](v4, "inputAccessoryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fallbackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "associatedView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v10, v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    -[UIViewController _window](self, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPeripheralHost endPlacementForInputViewSet:windowScene:](UIPeripheralHost, "endPlacementForInputViewSet:windowScene:", v18, v16);
    v17 = v5;
    v5 = (UIInputViewSetPlacement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIInputViewSet inputView](v4, "inputView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSet inputAccessoryView](v4, "inputAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewSet inputSetWithInputView:accessoryView:](UIInputViewSet, "inputSetWithInputView:accessoryView:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v20, "changeToInputViewSet:", v18);
  objc_msgSend(v20, "setPlacement:quietly:animated:generateSplitNotification:", v5, 1, 0, 0);
  if (self->_disablePlacementChanges)
  {
    if (-[UIInputWindowController isRotating](self, "isRotating"))
      -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
    else
      -[UIInputWindowController placement](self, "placement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPlacementChangeDisabled:withPlacement:", 1, v19);

  }
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setChangedAccessoryOnly:", objc_msgSend(WeakRetained, "changeToInputViewSet:", *(_QWORD *)(a1 + 32)) == 4);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_9;
  v3[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 40);
  v5 = WeakRetained;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);

}

void __43__UIInputWindowController_setInputViewSet___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "changeToInputViewSet:", *(_QWORD *)(a1 + 32));

  }
}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  BOOL v15;

  v6 = a6;
  v8 = a4;
  v11 = a3;
  -[UIViewController _window](self, "_window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (a5)
    {
      if (v8)
      {
        -[UIInputWindowController _updatePlacementWithPlacement:](self, "_updatePlacementWithPlacement:", v11);
        -[UIInputWindowController updateToPlacement:withNormalAnimationsAndNotifications:](self, "updateToPlacement:withNormalAnimationsAndNotifications:", v11, 0);
        if (!v6)
          goto LABEL_9;
        goto LABEL_8;
      }
      -[UIInputWindowController setPlacement:](self, "setPlacement:", v11);
      if (v6)
LABEL_8:
        -[UIInputWindowController postTransitionEndNotification](self, "postTransitionEndNotification");
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __83__UIInputWindowController_setPlacement_quietly_animated_generateSplitNotification___block_invoke;
      v12[3] = &unk_1E16B4E20;
      v12[4] = self;
      v13 = v11;
      v14 = v8;
      v15 = v6;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);

    }
  }
LABEL_9:

}

- (BOOL)isTransitionStarted
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "animationState") > 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)inhibitRotationAnimation
{
  return self->_disablePlacementChanges;
}

- (void)willResume:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *keyboardShowTimestamp;
  UIView *keyboardSnapshot;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  -[UIInputWindowController placement](self, "placement", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "showsKeyboard") & 1) != 0)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowController registerPowerLogEvent:](self, "registerPowerLogEvent:", v6 != 0);

  }
  else
  {
    -[UIInputWindowController registerPowerLogEvent:](self, "registerPowerLogEvent:", 0);
  }

  if (!-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards")
    && self->_keyboardShowTimestamp)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    keyboardShowTimestamp = self->_keyboardShowTimestamp;
    self->_keyboardShowTimestamp = v7;

  }
  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    -[UIView frame](keyboardSnapshot, "frame");
    v11 = v10;
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    if (v11 != v14)
      -[UIInputWindowController clearKeyboardSnapshot](self, "clearKeyboardSnapshot");
  }
}

void __57__UIInputWindowController_needsConvertToSceneCoordinates__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  if (qword_1ECD7A290 != -1)
    dispatch_once(&qword_1ECD7A290, &__block_literal_global_1013_0);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("AlwaysConvertToSceneCoordinates"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  _MergedGlobals_29_2 = objc_msgSend(v1, "BOOLValue");
  if (!_MergedGlobals_29_2)
  {
    _UIMainBundleIdentifier();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_29_2 = objc_msgSend(&unk_1E1A94148, "containsObject:");
    if ((_MergedGlobals_29_2 & 1) != 0)
      goto LABEL_9;
    v2 = dyld_program_sdk_at_least();
    v3 = objc_msgSend(&unk_1E1A94160, "containsObject:", v6);
    _MergedGlobals_29_2 = v3;
    if (v3 && v2)
    {
      _MergedGlobals_29_2 = 0;
      NSLog(CFSTR("Warning - Keyboard frames in keyboard notifications are in UIScreen coordinates"));
      v3 = _MergedGlobals_29_2;
    }
    if (v3)
    {
LABEL_9:
      if (qword_1ECD7A298 != -1)
        dispatch_once(&qword_1ECD7A298, &__block_literal_global_1016_0);
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForPreferenceKey:", CFSTR("AlwaysNotConvertToSceneCoordinates"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v4) = objc_msgSend(v5, "BOOLValue");
      if ((_DWORD)v4)
        _MergedGlobals_29_2 = 0;
    }

  }
}

uint64_t __55__UIInputWindowController_invalidateInputAssistantView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inputAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsView:", v5) & 1) != 0)
  {

  }
  else
  {
    v6 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");

    if (!v6)
      goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "_inputAssistantViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "removeInputAssistantHostView");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "clearInputAssistantViewEdgeConstraints");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "clearInputAccessoryViewEdgeConstraints");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "clearInputViewEdgeConstraints");
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "_inputAssistantViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);

  if (v10 == v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_inputAssistantViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromParentViewController");

  }
  return objc_msgSend(*(id *)(a1 + 32), "set_inputAssistantViewController:", 0);
}

- (void)setFullScreenPresentationAssertion:(id)a3
{
  SBSAssertion *v4;
  SBSAssertion *fullScreenPresentationAssertion;
  BOOL v6;

  v4 = (SBSAssertion *)a3;
  fullScreenPresentationAssertion = self->_fullScreenPresentationAssertion;
  if (fullScreenPresentationAssertion)
    v6 = fullScreenPresentationAssertion == v4;
  else
    v6 = 1;
  if (!v6)
  {
    -[SBSAssertion invalidate](fullScreenPresentationAssertion, "invalidate");
    fullScreenPresentationAssertion = self->_fullScreenPresentationAssertion;
  }
  self->_fullScreenPresentationAssertion = v4;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v6[1] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[2] = 0x1E1784B20;
  v6[3] = 0x1E1784A40;
  v6[4] = 0x1E1784A60;
  v6[5] = CFSTR("UITextInputNextInputModeInputModeDidChangeNotification");
  v6[6] = CFSTR("UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification");
  v6[7] = CFSTR("UIKeyboardWillBeginIndirectSelectionGestureNotification");
  v6[8] = CFSTR("UIKeyboardDidEndIndirectSelectionGestureNotification");
  v6[9] = CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification");
  v6[10] = CFSTR("UIPresentationControllerDismissalTransitionDidEndNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UIInputWindowController setFullScreenPresentationAssertion:](self, "setFullScreenPresentationAssertion:", 0);
  v5.receiver = self;
  v5.super_class = (Class)UIInputWindowController;
  -[UIViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClassCollectionOverride, 0);
  objc_storeStrong((id *)&self->_placementDuringAnimation, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_notificationInfoWaitingForInputUI, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assistantViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pathEffectView, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_templateNotificationInfo, 0);
  objc_storeStrong((id *)&self->_postRotationInputViewNotificationInfo, 0);
  objc_storeStrong(&self->_postRotationPendingBlock, 0);
  objc_storeStrong((id *)&self->_postRotationInputViewSet, 0);
  objc_storeStrong((id *)&self->_postRotationPlacement, 0);
  objc_storeStrong((id *)&self->_inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_fullScreenPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_passcodeObscuringInteraction, 0);
  objc_storeStrong((id *)&self->_floatingTransitionController, 0);
  objc_storeStrong(&self->_pendingCompleteAnimation, 0);
  objc_storeStrong((id *)&self->_keyboardShowTimestamp, 0);
  objc_storeStrong((id *)&self->_lastKeyboardID, 0);
  objc_storeStrong((id *)&self->_keyboardHeightChangeNotificationInfo, 0);
  objc_storeStrong((id *)&self->_rotationInfo, 0);
  objc_storeStrong((id *)&self->_preRotationSnapshot, 0);
  objc_storeStrong((id *)&self->_hosting, 0);
  objc_storeStrong(&self->_pendingTransitionActivity, 0);
  objc_storeStrong((id *)&self->_animationStyleStack, 0);
}

- (BOOL)_isSecure
{
  return 1;
}

void __57__UIInputWindowController__updatePlacementWithPlacement___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIInputWindowController;
  -[UIViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)crescendoEnabled
{
  void *v2;
  char v3;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crescendoEnabled");

  return v3;
}

- (void)setInputViewSet:(id)a3 forKeyboardAssistantBar:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setKeyboardAssistantBar:", a4);
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[UIInputWindowController updateInputAssistantView:](self, "updateInputAssistantView:", v8);
    -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
    v7 = v8;
  }

}

- (void)prepareForInputAssistant:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_isTextEffectsWindow");

  if ((objc_msgSend(v6, "isEmpty") & 1) == 0 && (objc_msgSend(v6, "isRemoteKeyboard") & v9 & 1) == 0)
  {
    objc_msgSend(v6, "inputAssistantView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "assistantViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "assistantViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "prepareTransition:animated:", v14, v4);

      }
    }
  }

}

- (void)didSuspend:(id)a3
{
  void *v4;
  double v5;
  double v6;

  if (!-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards", a3)
    && self->_keyboardShowTimestamp)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_keyboardShowTimestamp);
    v6 = v5;

    +[_UIKeyboardUsageTracking keyboardTotalOnScreenTime:orientation:](_UIKeyboardUsageTracking, "keyboardTotalOnScreenTime:orientation:", -[UIInputWindowController keyboardOrientation](self, "keyboardOrientation"), v6);
  }
  -[UIInputWindowController registerPowerLogEvent:](self, "registerPowerLogEvent:", 0);
}

- (void)hostViewWillDisappear
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIInputWindowController postRotationInputViewSet](self, "postRotationInputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[UIInputWindowController postRotationPlacement](self, "postRotationPlacement"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__UIInputWindowController_hostViewWillDisappear__block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
    return;
  }
  -[UIInputWindowController postRotationPendingBlock](self, "postRotationPendingBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
}

uint64_t __48__UIInputWindowController_hostViewWillDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didRotateFromInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "keyboardOrientation"));
}

- (void)hostViewDidEnterBackground
{
  void *v2;
  int v3;
  id v4;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isRemoteKeyboardWindow");

  if (v3)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardOnScreenNotifyKey:", 0);

  }
}

- (void)hostViewWillenterForeground
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isRemoteKeyboardWindow");

  if (v4)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (-[UIInputWindowController isOnScreen](self, "isOnScreen"))
      {
        -[UIInputWindowController placement](self, "placement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (objc_msgSend(v7, "showsKeyboard") & 1) != 0 || -[UIInputWindowController isUndocked](self, "isUndocked");

      }
      else
      {
        v8 = -[UIInputWindowController isUndocked](self, "isUndocked");
      }
    }
    else
    {
      v8 = 0;
    }

    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyboardOnScreenNotifyKey:", v8);

  }
}

- (UIKeyboardPathEffectView)_pathEffectView
{
  UIKeyboardPathEffectView *pathEffectView;
  objc_class *v4;
  void *v5;
  id v6;
  UIKeyboardPathEffectView *v7;
  UIKeyboardPathEffectView *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  pathEffectView = self->_pathEffectView;
  if (!pathEffectView)
  {
    if (objc_msgSend(MEMORY[0x1E0CA58E0], "isCurrentProcessAnApplicationExtension"))
    {
      v4 = (objc_class *)objc_opt_class();
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v5 = (void *)qword_1ECD7A280;
      v15 = qword_1ECD7A280;
      if (!qword_1ECD7A280)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __getTUIKeyboardPathEffectViewClass_block_invoke;
        v11[3] = &unk_1E16B14C0;
        v11[4] = &v12;
        __getTUIKeyboardPathEffectViewClass_block_invoke((uint64_t)v11);
        v5 = (void *)v13[3];
      }
      v4 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v12, 8);
    }
    v6 = [v4 alloc];
    v7 = (UIKeyboardPathEffectView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_pathEffectView;
    self->_pathEffectView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_pathEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAlpha:](self->_pathEffectView, "setAlpha:", 0.0);
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_pathEffectView);

    pathEffectView = self->_pathEffectView;
  }
  return pathEffectView;
}

- (CGPoint)_centerForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MidX;
  double MidY;
  void *v16;
  double v17;
  unint64_t v18;
  double v19;
  CGPoint result;
  CGRect v21;
  CGRect v22;

  -[UIViewController _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_boundsForInterfaceOrientation:", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  MidY = CGRectGetMidY(v22);
  -[UIViewController _window](self, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled") & 1) != 0)
  {

    v17 = MidX;
  }
  else
  {
    v18 = a3 - 3;

    if (v18 >= 2)
      v17 = MidX;
    else
      v17 = MidY;
    if (v18 < 2)
      MidY = MidX;
  }
  v19 = MidY;
  result.y = v19;
  result.x = v17;
  return result;
}

- (CGRect)_boundsForOrientation:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UIViewController _screen](self, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_boundsForInterfaceOrientation:", a3);
  v6 = v5;
  v8 = v7;

  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11 = v6;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)dismissViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ does not contain %@"), self, v7);
  objc_msgSend(v7, "willMoveToParentViewController:", 0);
  objc_msgSend(v7, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(v7, "removeFromParentViewController");
}

- (void)willBeginTransitionWithController:(id)a3
{
  void *v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForFloatingTransition:", 1);

  -[UIInputWindowController setInterfaceAutorotationDisabled:](self, "setInterfaceAutorotationDisabled:", 1);
}

- (void)didEndTransitionWithController:(id)a3
{
  void *v4;
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
  uint64_t v15;
  id v16;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForFloatingTransition:", 0);

  -[UIInputWindowController setInterfaceAutorotationDisabled:](self, "setInterfaceAutorotationDisabled:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "geometryChangeDone:", 1);

  -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationsFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v8, v10, v12, v14);
  objc_msgSend(v16, "populateEndInfoWithFrame:");
  objc_msgSend(v16, "addKeyboardNotificationDebuggingInfo:", CFSTR("didEndTransitionWithController:"));
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    v15 = 3;
  else
    v15 = 2;
  -[UIInputWindowController postValidatedStartNotifications:withInfo:](self, "postValidatedStartNotifications:withInfo:", v15, v16);
  -[UIInputWindowController postValidatedEndNotifications:withInfo:](self, "postValidatedEndNotifications:withInfo:", v15, v16);
  -[UIInputWindowController keyboardMoveOfType:info:](self, "keyboardMoveOfType:info:", 1, v16);
  -[UIInputWindowControllerHosting updateCombinedBackdropViewAnimated:forKeyboardUp:](self->_hosting, "updateCombinedBackdropViewAnimated:forKeyboardUp:", 0, 1);
  -[UIInputWindowController updateKeyboardSizeClass](self, "updateKeyboardSizeClass");

}

- (BOOL)shouldBeginTransitionForController:(id)a3
{
  void *v4;
  int v5;
  void *v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[UIKeyboardImpl supportsFloating](UIKeyboardImpl, "supportsFloating")
    || (objc_msgSend(v4, "isMinimized") & 1) != 0
    || (objc_msgSend(v4, "isTrackpadMode") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isCustomInputView") ^ 1;

  }
  return v5;
}

- (BOOL)isViewLandscape
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  return v4 > v6;
}

- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        NSLog(CFSTR("Keyboard cannot present view controllers (attempted to present %@)"), v5);
    }
  }

  return 1;
}

- (void)updateViewSizingConstraints
{
  -[UIInputWindowControllerHosting updateViewSizingConstraints](self->_hosting, "updateViewSizingConstraints");
}

- (UIEdgeInsets)_inputViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIInputWindowControllerHosting _inputViewPadding](self->_hosting, "_inputViewPadding");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

uint64_t __52__UIInputWindowController_hostAppSceneBoundsChanged__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "refreshKeyboardLayoutGuide");
}

- (void)takeKeyboardSnapshotIgnoringSpotlightCheck:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  char v13;
  UIView *v14;
  UIView *keyboardSnapshot;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  UIView *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[16];
  CGRect v32;
  CGRect v33;

  v3 = a3;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") || self->_keyboardSnapshot)
    return;
  +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "currentUIState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {
LABEL_13:

    return;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_12:

    goto LABEL_13;
  }
  v10 = (void *)v9;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isCustomInputView") & 1) != 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inputView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  if (v12 <= 0.0 || +[UIKeyboard isSpotlight](UIKeyboard, "isSpotlight") && !v3)
  {

    goto LABEL_11;
  }
  v13 = objc_msgSend((id)UIApp, "_isSpringBoard");

  if ((v13 & 1) == 0)
  {
    +[UIKeyboard snapshotViewForOptions:](UIKeyboard, "snapshotViewForOptions:", 1);
    v14 = (UIView *)objc_claimAutoreleasedReturnValue();
    keyboardSnapshot = self->_keyboardSnapshot;
    self->_keyboardSnapshot = v14;

    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertPoint:fromView:", v18, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v21 = v20;
    v23 = v22;

    -[UIView frame](self->_keyboardSnapshot, "frame");
    v33 = CGRectOffset(v32, 0.0, -v23);
    -[UIView setFrame:](self->_keyboardSnapshot, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
    v24 = [UIView alloc];
    objc_msgSend(v18, "frame");
    v25 = -[UIView initWithFrame:](v24, "initWithFrame:", v21, v23);
    -[UIView setClipsToBounds:](v25, "setClipsToBounds:", 1);
    -[UIView addSubview:](v25, "addSubview:", self->_keyboardSnapshot);
    -[UIViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v25);

    _UIInputWindowControllerLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot taken", buf, 2u);
    }

  }
}

- (void)willSnapshot
{
  id v2;

  self->_isSnapshotting = 1;
  if (-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSnapshotting:", 1);

  }
}

- (void)didSnapshot
{
  void *v3;

  if (-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSnapshotting:", 0);

  }
  self->_isSnapshotting = 0;
}

- (BOOL)trackingElementsShouldUseActualFrame
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIInputWindowController placement](self, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUndocked") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIInputWindowController placement](self, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isFloating") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UIInputWindowController placement](self, "placement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isFloatingAssistantView") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[UIInputWindowController placement](self, "placement");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "isHiddenForFloatingTransition");

      }
    }

  }
  return v4 ^ 1;
}

- (void)updateTrackingElementsWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  double v7;
  _QWORD v8[6];

  height = a3.height;
  width = a3.width;
  if (!-[UIInputWindowController trackingElementsShouldUseActualFrame](self, "trackingElementsShouldUseActualFrame"))
  {
    -[UIViewController _window](self, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    width = v7;

    height = 0.0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__UIInputWindowController_updateTrackingElementsWithSize___block_invoke;
  v8[3] = &__block_descriptor_48_e33_v16__0__UIKeyboardSceneDelegate_8l;
  *(CGFloat *)&v8[4] = width;
  *(CGFloat *)&v8[5] = height;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v8);
}

uint64_t __58__UIInputWindowController_updateTrackingElementsWithSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateTrackingElementsWithOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  _BOOL4 v5;
  double v6;
  double v7;
  _QWORD v8[6];

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v5 = -[UIInputWindowController trackingElementsShouldUseActualFrame](self, "trackingElementsShouldUseActualFrame");
  v6 = 0.0;
  if (v5)
    v7 = horizontal;
  else
    v7 = 0.0;
  if (v5)
    v6 = vertical;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__UIInputWindowController_updateTrackingElementsWithOffset___block_invoke;
  v8[3] = &__block_descriptor_48_e33_v16__0__UIKeyboardSceneDelegate_8l;
  *(double *)&v8[4] = v7;
  *(double *)&v8[5] = v6;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v8);
}

uint64_t __60__UIInputWindowController_updateTrackingElementsWithOffset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForOffset:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)refreshKeyboardLayoutGuide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
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
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;

  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    return;
  if (!-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))return;
  -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return;
  -[UIInputWindowController currentTransition](self, "currentTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromPlacement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
  }
  -[UIInputWindowController placement](self, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "showsInputOrAssistantViews") & 1) == 0)
  {
    -[UIInputWindowController placement](self, "placement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isFloatingAssistantView"))
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inputAccessoryView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        -[UIInputWindowController updateOffscreenKeyboardLayoutGuide](self, "updateOffscreenKeyboardLayoutGuide");
        return;
      }
      goto LABEL_11;
    }

  }
LABEL_11:
  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationsFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasActiveKeyboardResponder");

    if (v20)
    {
      -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v12, v14, v16, v18);
      v12 = v21;
      v14 = v22;
      v16 = v23;
      v18 = v24;
    }
  }
  -[UIInputWindowController keyboardMovedToScreenPosition:animated:](self, "keyboardMovedToScreenPosition:animated:", 0, v12, v14, v16, v18);
}

- (void)changeGuideAnimationOptions:(unint64_t)a3 duration:(double)a4
{
  _QWORD v6[6];

  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__UIInputWindowController_changeGuideAnimationOptions_duration___block_invoke;
    v6[3] = &__block_descriptor_48_e22_v24__0__UIWindow_8_B16l;
    *(double *)&v6[4] = a4;
    v6[5] = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v6);
  }
}

void __64__UIInputWindowController_changeGuideAnimationOptions_duration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    objc_msgSend(v4, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateAnimationDuration:options:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 32));

  }
}

- (void)changeGuideAnimationState:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__UIInputWindowController_changeGuideAnimationState___block_invoke;
    v4[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
    v5 = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v4);
  }
}

void __53__UIInputWindowController_changeGuideAnimationState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    objc_msgSend(v4, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableAnimations:", *(unsigned __int8 *)(a1 + 32));

  }
}

- (void)hideGuideBackdrop:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__UIInputWindowController_hideGuideBackdrop___block_invoke;
  v3[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
  v4 = a3;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v3);
}

void __45__UIInputWindowController_hideGuideBackdrop___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    objc_msgSend(v4, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hideLightEffectsView:", *(unsigned __int8 *)(a1 + 32));

  }
}

- (id)transitionGuideBackdrop:(BOOL)a3
{
  id v5;
  _QWORD v7[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__129;
  v13 = __Block_byref_object_dispose__129;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__UIInputWindowController_transitionGuideBackdrop___block_invoke;
  v7[3] = &unk_1E16D5D40;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v7);
  if (objc_msgSend((id)v10[5], "count"))
  {
    objc_msgSend((id)v10[5], "setObject:forKey:", MEMORY[0x1E0C9AAB0], 0x1E174E660);
    v5 = (id)v10[5];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __51__UIInputWindowController_transitionGuideBackdrop___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "isTrackingKeyboard");
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v11, "_primaryKeyboardTrackingGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionBackdropForAnimationStart:", *(unsigned __int8 *)(a1 + 48));

    objc_msgSend(v11, "_primaryKeyboardTrackingGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "guideBackdropMatchLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v8, "_infoForBackdropMatchMoveForLayer:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, 0x1E174E680);

    }
    v4 = v11;
  }

}

- (BOOL)updateGuideBackdropRenderConfig:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__UIInputWindowController_updateGuideBackdropRenderConfig_animated___block_invoke;
  v9[3] = &unk_1E16D5D40;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a4;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v9);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __68__UIInputWindowController_updateGuideBackdropRenderConfig_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    objc_msgSend(v4, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "updateLightEffectsRenderConfig:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)keyboardIsDocking:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__UIInputWindowController_keyboardIsDocking___block_invoke;
    v4[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
    v5 = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v4);
  }
}

void __45__UIInputWindowController_keyboardIsDocking___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isTrackingKeyboard"))
  {
    objc_msgSend(v4, "_primaryKeyboardTrackingGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDocked:", *(unsigned __int8 *)(a1 + 32));

  }
}

- (void)moveKeyboardLayoutGuideOffscreen
{
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    -[UIInputWindowController updateOffscreenKeyboardLayoutGuide](self, "updateOffscreenKeyboardLayoutGuide");
}

- (void)updateOffscreenKeyboardLayoutGuide
{
  void *v3;
  double v4;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v4, 0.0);

  if (-[UIInputWindowController currentControllerShouldUpdateKeyboardLayoutGuide](self, "currentControllerShouldUpdateKeyboardLayoutGuide"))
  {
    +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, &__block_literal_global_345);
  }
}

void __61__UIInputWindowController_updateOffscreenKeyboardLayoutGuide__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  int v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isTrackingKeyboard"))
  {
    objc_msgSend(v7, "_primaryKeyboardTrackingGuide");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v4 = v3;
    objc_msgSend(v7, "insetForDismissedKeyboardGuide");
    v6 = objc_msgSend(v2, "changeSizingConstants:", v4, v5);

    if (v6)
      objc_msgSend(v7, "layoutViewsForTrackedGuides");
  }

}

- (void)updateGuideForOffscreenRotationWithDuration:(double)a3
{
  void *v4;
  BOOL v5;
  id v6;

  -[UIInputWindowController placement](self, "placement", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFloating"))
    goto LABEL_4;
  -[UIInputWindowController placement](self, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFloatingAssistantView"))
  {

LABEL_4:
    return;
  }
  v5 = +[UIKeyboardCameraSession updatesGuideDuringRotation](UIKeyboardCameraSession, "updatesGuideDuringRotation");

  if (!v5)
    -[UIInputWindowController updateOffscreenKeyboardLayoutGuide](self, "updateOffscreenKeyboardLayoutGuide");
}

- (void)updateKeyboardLayoutGuideWithFrame:(CGRect)a3 layoutViews:(BOOL)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double MaxY;
  void *v11;
  double v12;
  double MinX;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[9];
  BOOL v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36 = *MEMORY[0x1E0C80C00];
  if (UIRectIsDiscrete(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    if (!CGRectIsNull(v37))
    {
      -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", width, height);
      v38.origin.x = x;
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      MaxY = CGRectGetMaxY(v38);
      -[UIViewController _window](self, "_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v12 = CGRectGetMaxY(v39);

      if (MaxY < v12)
      {
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        MinX = CGRectGetMinX(v40);
        -[UIViewController _window](self, "_window");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "frame");
        v15 = CGRectGetMaxY(v41);
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        -[UIInputWindowController updateTrackingElementsWithOffset:](self, "updateTrackingElementsWithOffset:", MinX, v15 - CGRectGetMaxY(v42));

      }
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke;
      aBlock[3] = &unk_1E16D5D68;
      *(CGFloat *)&aBlock[5] = x;
      *(CGFloat *)&aBlock[6] = y;
      *(double *)&aBlock[7] = width;
      *(double *)&aBlock[8] = height;
      aBlock[4] = self;
      v34 = a4;
      v17 = _Block_copy(aBlock);
      -[UIViewController _window](self, "_window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "_isHostedInAnotherProcess");

      if (v19)
      {
        v31[0] = v16;
        v31[1] = 3221225472;
        v31[2] = __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke_2;
        v31[3] = &unk_1E16D5D90;
        v32 = v17;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v31);
        v20 = v32;
      }
      else
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        -[UIViewController _window](self, "_window", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "windowScene");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "windows");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v28;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v28 != v25)
                objc_enumerationMutation(v20);
              (*((void (**)(void *, _QWORD))v17 + 2))(v17, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v26++));
            }
            while (v24 != v26);
            v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v24);
        }
      }

    }
  }
}

void __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  CGFloat MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  int v52;
  void *v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v54 = a2;
  if (objc_msgSend(v54, "isTrackingKeyboard"))
  {
    objc_msgSend(v54, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinateSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v15, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(*(id *)(a1 + 32), "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinateSpace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "coordinateSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v26, v4, v6, v8, v10);

    v55.origin.x = v4;
    v55.origin.y = v6;
    v55.size.width = v8;
    v55.size.height = v10;
    v61.origin.x = v17;
    v61.origin.y = v19;
    v61.size.width = v21;
    v61.size.height = v23;
    v56 = CGRectIntersection(v55, v61);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;
    if (CGRectIsNull(v56))
    {
      objc_msgSend(v54, "frame");
      MaxY = CGRectGetMaxY(v57);
      objc_msgSend(v54, "frame");
      v33 = v32;
      objc_msgSend(v54, "insetForDismissedKeyboardGuide");
      v35 = v34;
      v36 = 0.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_window");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "coordinateSpace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "coordinateSpace");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "convertRect:toCoordinateSpace:", v39, x, y, width, height);
      v36 = v40;
      MaxY = v41;
      v33 = v42;
      v35 = v43;

    }
    objc_msgSend(v54, "insetForDismissedKeyboardGuide");
    if (v35 < v44)
    {
      objc_msgSend(v54, "insetForDismissedKeyboardGuide");
      v35 = v45;
    }
    objc_msgSend(v54, "frame");
    v46 = CGRectGetMaxY(v58);
    v59.origin.x = v36;
    v59.origin.y = MaxY;
    v59.size.width = v33;
    v59.size.height = v35;
    v47 = v46 - CGRectGetMaxY(v59);
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v54, "_primaryKeyboardTrackingGuide");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "enableAnimations:", 0);

    }
    objc_msgSend(v54, "_primaryKeyboardTrackingGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v60.origin.x = v36;
    v60.origin.y = MaxY;
    v60.size.width = v33;
    v60.size.height = v35;
    v50 = objc_msgSend(v49, "changeOffsetConstants:", CGRectGetMinX(v60), v47);

    objc_msgSend(v54, "_primaryKeyboardTrackingGuide");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "changeSizingConstants:", v33, v35);

    if ((v50 & 1) != 0 || v52)
    {
      if (*(_BYTE *)(a1 + 72))
        objc_msgSend(v54, "layoutViewsForTrackedGuides");
    }
    objc_msgSend(v54, "_primaryKeyboardTrackingGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "enableAnimations:", 1);

  }
}

uint64_t __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_infoForBackdropMatchMoveForLayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t RenderId;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contextId");

    RenderId = CALayerGetRenderId();
    v12[0] = 0x1E174E6A0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = 0x1E174E6C0;
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", RenderId);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }

  return v4;
}

- (id)convertUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  const char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v49;
  id v50;
  void *v51;
  id obj;
  void *v54;
  id v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardWindow");
  v6 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v6;
  if (!v6)
  {
    v50 = v3;
    goto LABEL_16;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v62[0] = CFSTR("UIKeyboardFrameBeginUserInfoKey");
  v62[1] = CFSTR("UIKeyboardFrameEndUserInfoKey");
  v62[2] = CFSTR("UIKeyboardCenterBeginUserInfoKey");
  v62[3] = CFSTR("UIKeyboardCenterEndUserInfoKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v7)
    goto LABEL_14;
  v8 = v7;
  v9 = *(_QWORD *)v59;
  v54 = v4;
  v55 = v3;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v59 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const char *)objc_msgSend(v12, "objCType");
      if (!strcmp("{CGRect={CGPoint=dd}{CGSize=dd}}", v13))
      {
        objc_msgSend(v12, "CGRectValue");
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        objc_msgSend(v57, "windowScene");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "coordinateSpace");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _window](self, "_window");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "windowScene");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "coordinateSpace");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "convertRect:toCoordinateSpace:", v40, v29, v31, v33, v35);
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v42, v44, v46, v48);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (strcmp("{CGPoint=dd}", v13))
          goto LABEL_12;
        objc_msgSend(v12, "CGPointValue");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v57, "windowScene");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "coordinateSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _window](self, "_window");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "windowScene");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "coordinateSpace");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "convertPoint:toCoordinateSpace:", v22, v15, v17);
        v24 = v23;
        v26 = v25;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v24, v26);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v49 = (void *)v27;
      v4 = v54;
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v27, v11);

      v3 = v55;
LABEL_12:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  }
  while (v8);
LABEL_14:

  v50 = (id)objc_msgSend(v4, "copy");
LABEL_16:
  v51 = v50;

  return v51;
}

- (void)_forcePreLayoutHostViewFrame
{
  CGRect *p_preLayoutHostViewFrame;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  p_preLayoutHostViewFrame = &self->_preLayoutHostViewFrame;
  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationsFrame");
  p_preLayoutHostViewFrame->origin.x = v5;
  p_preLayoutHostViewFrame->origin.y = v6;
  p_preLayoutHostViewFrame->size.width = v7;
  p_preLayoutHostViewFrame->size.height = v8;

  self->_didOverridePreLayoutHostViewFrame = 1;
}

- (void)setHostingNeedsLayout
{
  -[UIInputWindowControllerHosting setNeedsLayout](self->_hosting, "setNeedsLayout");
}

- (id)_screenCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateForKeyplaneChangeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  int *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (self->_isChangingInputViews)
    goto LABEL_18;
  v15 = v4;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientInputViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  v4 = v15;
  if ((v7 & 1) != 0)
    goto LABEL_18;
  if (objc_msgSend(v15, "updateAssistantView"))
  {
    -[UIInputWindowControllerHosting clearInputViewEdgeConstraints](self->_hosting, "clearInputViewEdgeConstraints");
    -[UIInputWindowController updateKeyboardSizeClass](self, "updateKeyboardSizeClass");
    self->_layoutGuideNeedsUpdate = 1;
    if ((objc_msgSend(v15, "selfSizingChanged") & 1) == 0 && objc_msgSend(v15, "sizeDidChange"))
      self->_suppressUpdateViewConstraints = 1;
    -[UIInputWindowController updateInputAssistantViewForInputViewSet:](self, "updateInputAssistantViewForInputViewSet:", 0);
    v8 = 0;
    v9 = &OBJC_IVAR___UIInputWindowController__suppressUpdateViewConstraints;
    v10 = v15;
    goto LABEL_10;
  }
  v11 = objc_msgSend(v15, "sizeDidChange");
  v10 = v15;
  if (v11)
  {
    v8 = 1;
    v9 = &OBJC_IVAR___UIInputWindowController__layoutGuideNeedsUpdate;
LABEL_10:
    *((_BYTE *)&self->super.super.super.super.super.isa + *v9) = v8;
  }
  if (objc_msgSend(v10, "selfSizingChanged"))
  {
    -[UIInputWindowController updateViewSizingConstraints](self, "updateViewSizingConstraints");
LABEL_17:
    v4 = v15;
    goto LABEL_18;
  }
  if ((objc_msgSend(v15, "sizeDidChange") & 1) != 0 || (v12 = objc_msgSend(v15, "updateAssistantView"), v4 = v15, v12))
  {
    -[UIInputWindowController resetBackdropHeight](self, "resetBackdropHeight");
    -[UIInputWindowController updateViewConstraints](self, "updateViewConstraints");
    v13 = objc_msgSend(v15, "splitWidthsChanged");
    v4 = v15;
    if (v13)
    {
      -[UIInputWindowController inputViewSet](self, "inputViewSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshPresentation");

      -[UIInputWindowControllerHosting _updateBackdropViews](self->_hosting, "_updateBackdropViews");
      goto LABEL_17;
    }
  }
LABEL_18:

}

void __70__UIInputWindowController__collectTransitionTimeStatistics_withStart___block_invoke(uint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  if (_UIIsPrivateMainBundle())
  {
    +[UIApplication displayIdentifier](UIApplication, "displayIdentifier");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("thirdpartyapp");
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 == 3)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DBE7A8];
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DBE7B0];
LABEL_8:
    v7 = v2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticGetKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticDistributionPushValue();

    v2 = v7;
  }

}

- (void)addPendingActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id pendingTransitionActivity;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = _Block_copy(self->_pendingTransitionActivity);
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__UIInputWindowController_addPendingActivity___block_invoke;
    v11[3] = &unk_1E16B6740;
    v12 = v5;
    v13 = v4;
    v7 = (void *)objc_msgSend(v11, "copy");
    pendingTransitionActivity = self->_pendingTransitionActivity;
    self->_pendingTransitionActivity = v7;

    v9 = v12;
  }
  else
  {
    v10 = (void *)objc_msgSend(v4, "copy");
    v9 = self->_pendingTransitionActivity;
    self->_pendingTransitionActivity = v10;
  }

}

uint64_t __46__UIInputWindowController_addPendingActivity___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)animateKeyboardTrackingElementsWithNotificationInfo:(id)a3 notificationType:(unint64_t)a4 updateForStart:(BOOL)a5 updateForEnd:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void (**v31)(_QWORD);
  id v32;
  void (**v33)(void *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  UIInputWindowController *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t aBlock;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  UIInputWindowController *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v6 = a6;
  v7 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  _UIInputWindowControllerLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("for start");
    if (v6)
      v12 = CFSTR("using keyboard animation");
    if (!v7)
      v12 = CFSTR("for end");
    *(_DWORD *)buf = 138412546;
    v59 = v12;
    v60 = 2112;
    v61 = v10;
    _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Updating keyboard tracking elements %@ with notificationInfo:\n%@", buf, 0x16u);
  }

  -[UIViewController _window](self, "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isRemoteKeyboardWindow");

  if ((v14 & 1) == 0)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCancelled:", 1);

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animationStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelInterruptibleAnimations");

    -[UIInputWindowController setCurrentTransition:](self, "setCurrentTransition:", 0);
    -[UIInputWindowControllerHosting removeAllAnimations](self->_hosting, "removeAllAnimations");
  }
  self->_externalTrackingUpdateInProgress = 1;
  objc_msgSend(v10, "duration");
  if (v18 > 0.0)
  {
    objc_msgSend(v10, "duration");
    +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1);
  }
  else
  {
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNonKeyboardOverride:", 1);
  objc_msgSend(v10, "endFrame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v47 = 3221225472;
  v48 = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke;
  v49 = &unk_1E16C1120;
  v50 = self;
  v53 = v20;
  v54 = v22;
  v55 = v24;
  v56 = v26;
  v29 = v10;
  v51 = v29;
  v30 = v19;
  v52 = v30;
  v57 = a4;
  v31 = (void (**)(_QWORD))_Block_copy(&aBlock);
  v34 = v28;
  v35 = 3221225472;
  v36 = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_3;
  v37 = &unk_1E16D5E48;
  v40 = v21;
  v41 = v23;
  v42 = v25;
  v43 = v27;
  v38 = self;
  v39 = v29;
  LOBYTE(v45) = v7;
  v44 = a4;
  v32 = v29;
  v33 = (void (**)(void *, uint64_t))_Block_copy(&v34);
  if (v7 && v6)
  {
    objc_msgSend(v30, "launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", v31, 0, v33, self, 0, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45,
      aBlock,
      v47,
      v48,
      v49,
      v50,
      v51);
  }
  else
  {
    if (v7)
      v31[2](v31);
    if (v6)
      v33[2](v33, 1);
    else
      self->_externalTrackingUpdateInProgress = 0;
  }

}

void __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_2;
  v5[3] = &unk_1E16C1120;
  v9 = *(_OWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 72);
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 88);
  v8 = v3;
  v11 = v4;
  objc_msgSend(v6, "performWithSafeTransitionFrames:", v5);

}

uint64_t __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_2(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGRect v39;
  CGRect v40;

  x = *(double *)(a1 + 56);
  y = *(double *)(a1 + 64);
  width = *(double *)(a1 + 72);
  height = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInputViewPlaceholder");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFixedSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));

    }
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputAccessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v25, v16, v18, v20, v22);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v27, v29, v31, v33);
    v40.origin.x = v34;
    v40.origin.y = v35;
    v40.size.width = v36;
    v40.size.height = v37;
    v39 = CGRectUnion(*(CGRect *)(a1 + 56), v40);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:");
  }
  objc_msgSend(*(id *)(a1 + 32), "updateKeyboardLayoutGuideWithFrame:layoutViews:", objc_msgSend(*(id *)(a1 + 48), "animated"), x, y, width, height);
  return objc_msgSend(*(id *)(a1 + 32), "postStartNotifications:withInfo:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
}

void __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_4;
  v6[3] = &unk_1E16C10D0;
  v2 = *(_OWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = v2;
  v3 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  v12 = *(_BYTE *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 80);
  v8 = v4;
  v11 = v5;
  objc_msgSend(v7, "performWithSafeTransitionFrames:", v6);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1411) = 0;

}

uint64_t __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_4(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGRect v39;
  CGRect v40;

  x = *(double *)(a1 + 48);
  y = *(double *)(a1 + 56);
  width = *(double *)(a1 + 64);
  height = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInputViewPlaceholder");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFixedSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));

    }
    objc_msgSend(*(id *)(a1 + 32), "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputAccessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(*(id *)(a1 + 32), "inputViewSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v25, v16, v18, v20, v22);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v27, v29, v31, v33);
    v40.origin.x = v34;
    v40.origin.y = v35;
    v40.size.width = v36;
    v40.size.height = v37;
    v39 = CGRectUnion(*(CGRect *)(a1 + 48), v40);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:");
  }
  objc_msgSend(*(id *)(a1 + 32), "updateKeyboardLayoutGuideWithFrame:layoutViews:", *(unsigned __int8 *)(a1 + 88), x, y, width, height);
  return objc_msgSend(*(id *)(a1 + 32), "postEndNotifications:withInfo:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
}

- (void)updateSizingFromRemoteChange
{
  NSObject *v3;
  UIInputViewSetPlacement *placement;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
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
  _QWORD v36[7];
  _QWORD v37[5];
  _QWORD aBlock[7];
  _QWORD v39[4];
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    _UIInputWindowControllerLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      placement = self->_placement;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = placement;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Updating sizing for existing placement %@", (uint8_t *)&buf, 0xCu);
    }

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[UIInputWindowController nextAnimationStyle](self, "nextAnimationStyle");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__129;
    v50 = __Block_byref_object_dispose__129;
    -[UIInputWindowController placement](self, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewPlacementTransition transitionForExistingPlacement:animationStyle:](UIInputViewPlacementTransition, "transitionForExistingPlacement:animationStyle:", v10, v9);
    v51 = (id)objc_claimAutoreleasedReturnValue();

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__129;
    v45 = __Block_byref_object_dispose__129;
    v46 = 0;
    if (v11 && (objc_msgSend(v11, "cancelled") & 1) == 0)
    {
      -[UIInputWindowController currentTransition](self, "currentTransition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "notificationInfo");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v42[5];
      v42[5] = v14;

      objc_msgSend(v12, "fromPlacement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setFromPlacement:", v16);

      objc_msgSend(v12, "setCancelled:", 1);
      objc_msgSend(v12, "animationStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancelInterruptibleAnimations");

      -[UIInputWindowControllerHosting removeAllAnimations](self->_hosting, "removeAllAnimations");
    }
    v18 = v42[5];
    v19 = MEMORY[0x1E0C809B0];
    if (!v18)
    {
      -[UIInputWindowController notificationInfoWaitingForInputUI](self, "notificationInfoWaitingForInputUI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[UIInputWindowController notificationInfoWaitingForInputUI](self, "notificationInfoWaitingForInputUI");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v42[5];
        v42[5] = v21;

        -[UIInputWindowController setNotificationInfoWaitingForInputUI:](self, "setNotificationInfoWaitingForInputUI:", 0);
      }
      else
      {
        -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v42[5];
        v42[5] = v23;

        v25 = (void *)v42[5];
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "animationStyle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "populateWithAnimationStyle:", v26);

      }
      v40[0] = v19;
      v40[1] = 3221225472;
      v40[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke;
      v40[3] = &unk_1E16BC3A0;
      v40[4] = self;
      v40[5] = &v41;
      -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v40);
      v18 = v42[5];
    }
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setNotificationInfo:", v18);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "animationStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setExtraOptions:", objc_msgSend(v27, "extraOptions") & 0xFFFFFFFFFFFFFFFDLL);

    -[UIInputWindowController setCurrentTransition:](self, "setCurrentTransition:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 2;
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "didAdvanceAnimationToState:", 1);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "notificationInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWaitingForInputUI:", 0);

    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "notificationInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "currentUIState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWasCausedRemotely:", objc_msgSend(v29, "wasCausedRemotely") | objc_msgSend(v31, "isLocal") ^ 1);

    aBlock[0] = v19;
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_2;
    aBlock[3] = &unk_1E16C3488;
    aBlock[4] = self;
    aBlock[5] = &buf;
    aBlock[6] = v39;
    v32 = _Block_copy(aBlock);
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_6;
    v37[3] = &unk_1E16B14C0;
    v37[4] = &buf;
    v33 = _Block_copy(v37);
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_7;
    v36[3] = &unk_1E16D5E98;
    v36[4] = self;
    v36[5] = &buf;
    v36[6] = v39;
    v34 = _Block_copy(v36);
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "animationStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", v32, v33, v34, self, 0);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "populateStartInfoWithFrame:");
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  _QWORD v10[5];

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "didAdvanceAnimationToState:", 2))
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = (void *)a1[4];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_3;
    v10[3] = &unk_1E16B1B28;
    v10[4] = v3;
    objc_msgSend(v3, "performWithoutCallbacksOrNotifications:", v10);
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_4;
    v7[3] = &unk_1E16D5E70;
    v8 = *((_OWORD *)a1 + 2);
    v9 = a1[6];
    objc_msgSend((id)v8, "performWithSafeTransitionFrames:", v7);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    v5 = (void *)a1[4];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "notificationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postStartNotifications:withInfo:", v4, v6);

  }
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 0, 1);
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_4(uint64_t a1)
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD aBlock[5];
  int8x16_t v27;
  CGRect v28;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "notificationInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "populateEndInfoWithFrame:", v12, v14, v16, v18);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "notificationInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  v28.origin.x = v12;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  NSStringFromCGRect(v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("updatePlaceholders to %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addKeyboardNotificationDebuggingInfo:", v23);

  if (v18 == 0.0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_5;
  aBlock[3] = &unk_1E16D5E70;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v27 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v24 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "animationStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAnimationToCurrentAnimations:", v24);

}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_5(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = (void *)a1[4];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "notificationInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyboardMoveOfType:info:", v2, v3);

}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "didAdvanceAnimationToState:", 3);
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  int8x16_t v15;

  objc_msgSend(*(id *)(a1 + 32), "currentTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "setCurrentTransition:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 992) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "didAdvanceAnimationToState:", 4);
  if (v2 == v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "toPlacement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateAppearStatesForPlacement:start:animated:", v5, 0, 1);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completeMoveKeyboardForWindow:", v8);

  }
  v9 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_8;
  v14[3] = &unk_1E16D5E70;
  v14[4] = v9;
  v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v9, "performWithSafeTransitionFrames:", v14);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "animationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "animationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "completeAnimationWithHost:context:", v11, v12);

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAnimationContext:", 0);
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_8(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = (void *)a1[4];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "notificationInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEndNotifications:withInfo:", v2, v3);

}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_482(id *a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(id *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[16];

  kdebug_trace();
  kac_get_log();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "animationAnimating", ", buf, 2u);
    }
  }

  if ((objc_msgSend(a1[5], "didAdvanceAnimationToState:", 2) & 1) != 0)
  {
    if (objc_msgSend(a1[6], "showsKeyboard") && (objc_msgSend(a1[4], "dontDismissReachability") & 1) == 0)
      objc_msgSend((id)UIApp, "_deactivateReachability");
    objc_msgSend(*((id *)a1[4] + 129), "itemForPurpose:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareTranslationFromPlacement:to:", a1[7], a1[6]);

    objc_msgSend(a1[4], "_updatePlacementWithPlacement:", a1[6]);
    objc_msgSend(a1[4], "updateVisibilityConstraintsForPlacement:", a1[6]);
    objc_msgSend(a1[5], "animationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    objc_msgSend(a1[5], "animationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performAnimationWithHost:context:", v7, v8);

    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_483;
    v27 = &unk_1E16B51E8;
    v9 = a1[5];
    v28 = a1[4];
    v29 = v9;
    v30 = a1[7];
    v31 = a1[6];
    objc_msgSend(v28, "performWithSafeTransitionFrames:", &v24);
    *((_BYTE *)a1[4] + 992) = 1;
    objc_msgSend(*((id *)a1[4] + 129), "itemForPurpose:", 2, v24, v25, v26, v27, v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "willBeginTranslationFromPlacement:to:", a1[7], a1[6]);

    v11 = a1[4];
    v12 = objc_msgSend(a1[5], "notifications");
    objc_msgSend(a1[5], "notificationInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postStartNotifications:withInfo:", v12, v13);

    v14 = a1[4];
    objc_msgSend(v14, "placement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "showsKeyboard") & 1) != 0)
    {
      objc_msgSend(a1[4], "inputViewSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "keyboard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "registerPowerLogEvent:", v17 != 0);

    }
    else
    {
      objc_msgSend(v14, "registerPowerLogEvent:", 0);
    }

    kdebug_trace();
    kac_get_log();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_make_with_pointer(v21, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v21, OS_SIGNPOST_INTERVAL_END, v23, "animationAnimating", ", buf, 2u);
      }
    }

  }
  else
  {
    kdebug_trace();
    kac_get_log();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_signpost_id_make_with_pointer(v18, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v18, OS_SIGNPOST_INTERVAL_END, v20, "animationAnimating", ", buf, 2u);
      }
    }

  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_483(id *a1)
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;

  objc_msgSend(*((id *)a1[4] + 129), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(a1[4], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1[5], "notificationInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "waitingForInputUI");

  if (v20 && v18 > 0.0)
  {
    objc_msgSend(a1[5], "notificationInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWaitingForInputUI:", 0);

  }
  objc_msgSend(a1[5], "notificationInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "populateEndInfoWithFrame:", v12, v14, v16, v18);

  objc_msgSend(a1[5], "notificationInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1[5], "fromPlacement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();
  objc_msgSend(a1[5], "toPlacement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("moveFromPlacement: %@ toPlacement: %@"), v26, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addKeyboardNotificationDebuggingInfo:", v28);

  if (((objc_msgSend(a1[6], "isCompactAssistantView") & 1) == 0
     && (objc_msgSend(a1[6], "isFloating") & 1) == 0
     && !objc_msgSend(a1[7], "isFloating")
     || objc_msgSend(a1[5], "notifications") != 1)
    && (objc_msgSend(a1[6], "isInteractive") & 1) == 0
    && (objc_msgSend(a1[7], "isUndocked") & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_486;
    aBlock[3] = &unk_1E16B51E8;
    v34 = a1[5];
    v29 = a1[7];
    v30 = a1[4];
    v35 = v29;
    v36 = v30;
    v37 = a1[6];
    v31 = _Block_copy(aBlock);
    objc_msgSend(a1[5], "animationStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addAnimationToCurrentAnimations:", v31);

  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_486(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
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
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  CGRect v49;

  v2 = objc_msgSend(a1[4], "notifications");
  if (v2 || (objc_msgSend(a1[5], "isFloatingAssistantView") & 1) != 0)
  {
    if (objc_msgSend(a1[7], "isUndocked")
      && !objc_msgSend(a1[5], "showsInputOrAssistantViews"))
    {
      v2 = 3;
    }
    if (objc_msgSend(a1[5], "isFloatingAssistantView"))
    {
      objc_msgSend(a1[6], "inputViewSet");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "assistantViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(a1[6], "inputViewSet");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "assistantViewController");
      }
      else
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "systemInputAssistantViewController");
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "barFrame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v10, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "_window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20)
      {
        objc_msgSend(v10, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "convertRect:fromView:", v23, v12, v14, v16, v18);
        v12 = v24;
        v14 = v25;
        v16 = v26;
        v18 = v27;

      }
      else
      {
        v28 = objc_msgSend(v21, "_isRemoteKeyboardWindow");

        if ((v28 & 1) == 0)
        {
          objc_msgSend(a1[6], "_window");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)a1[6] + 129), "itemForPurpose:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "hostView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "convertRect:fromView:", v31, v12, v14, v16, v18);
          v12 = v32;
          v34 = v33;
          v16 = v35;
          v18 = v36;

          v14 = v34 - *(double *)&UIFloatingAssistantBottomMargin;
        }
      }
      v49.origin.x = v12;
      v49.origin.y = v14;
      v49.size.width = v16;
      v49.size.height = v18;
      if (!CGRectIsEmpty(v49))
      {
        objc_msgSend(a1[6], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v12, v14, v16, v18);
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v45 = a1[6];
        objc_msgSend(a1[4], "animationStyle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "keyboardMovedToScreenPosition:animated:", objc_msgSend(v46, "animated"), v38, v40, v42, v44);

      }
      v2 = 0;
    }
    v47 = a1[6];
    objc_msgSend(a1[4], "notificationInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    v48 = (id)v7;
    v8 = v47;
    v9 = v2;
  }
  else
  {
    if (!objc_msgSend(a1[5], "showsInputViews"))
      return;
    v6 = a1[6];
    objc_msgSend(a1[4], "notificationInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    v48 = (id)v7;
    v8 = v6;
    v9 = 1;
  }
  objc_msgSend(v8, "keyboardMoveOfType:info:", v9, v7);

}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_487(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  uint8_t v15[16];
  uint8_t buf[16];

  kdebug_trace();
  kac_get_log();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, (const void *)(*(_QWORD *)(a1 + 40) ^ *(_QWORD *)(a1 + 32)));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "animationStarted", ", buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "didAdvanceAnimationToState:", 3);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldNotifyRemoteKeyboards") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "animationStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "animated"))
    {
      objc_msgSend(*(id *)(a1 + 40), "animationStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "duration");
      v8 = v7;

      if (v8 <= 0.0)
        goto LABEL_9;
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "flushDelayedTasks");
    }

  }
LABEL_9:
  if (*(_BYTE *)(a1 + 56))
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "animationStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prepareForInputAssistant:animated:", v9, objc_msgSend(v11, "animated"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "initializeTranslateGestureRecognizerIfNecessary");
  }
  kdebug_trace();
  kac_get_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, (const void *)(*(_QWORD *)(a1 + 40) ^ *(_QWORD *)(a1 + 32)));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v12, OS_SIGNPOST_INTERVAL_END, v14, "animationStarted", ", v15, 2u);
    }
  }

  if (*(_BYTE *)(a1 + 57))
    +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 1);
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_488(uint64_t a1, _BOOL4 a2)
{
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void (**v35)(_QWORD);
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  dispatch_time_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  os_signpost_id_t v50;
  _QWORD block[5];
  _QWORD aBlock[4];
  id v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint8_t buf[4];
  _BOOL4 v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(_QWORD *)(a1 + 40) ^ *(_QWORD *)(a1 + 32)));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)buf = 67109376;
      v61 = a2;
      v62 = 1024;
      v63 = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "animationDone", " finished=%{signpost.description:attribute}d started=%{signpost.description}d", buf, 0xEu);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "setPlacementDuringAnimation:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "currentTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);

  if (v7 != v8)
    goto LABEL_23;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransition:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldNotifyRemoteKeyboards") & 1) != 0)
    goto LABEL_23;
  objc_msgSend(*(id *)(a1 + 40), "fromPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "showsKeyboard") & 1) == 0
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "showsKeyboard"))
  {

LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1344);
    *(_QWORD *)(v13 + 1344) = v12;
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 40), "fromPlacement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isUndocked"))
  {

  }
  else
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "isUndocked");

    if (v11)
      goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "fromPlacement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "showsKeyboard")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "showsKeyboard") & 1) == 0)
  {

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 40), "fromPlacement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isUndocked") & 1) == 0)
  {

    goto LABEL_22;
  }
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "isUndocked");

  if ((v16 & 1) == 0)
  {
LABEL_20:
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344))
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1344));
    v19 = v18;

    +[_UIKeyboardUsageTracking keyboardTotalOnScreenTime:orientation:](_UIKeyboardUsageTracking, "keyboardTotalOnScreenTime:orientation:", objc_msgSend(*(id *)(a1 + 32), "keyboardOrientation"), v19);
    v20 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v20 + 1344);
    *(_QWORD *)(v20 + 1344) = 0;
    goto LABEL_22;
  }
LABEL_23:
  if (objc_msgSend(*(id *)(a1 + 40), "didAdvanceAnimationToState:", 4))
  {
    objc_msgSend(*(id *)(a1 + 32), "_collectTransitionTimeStatistics:withStart:", objc_msgSend(*(id *)(a1 + 40), "notifications"), *(_QWORD *)(a1 + 56));
    v21 = 1;
  }
  else
  {
    v21 = objc_msgSend(*(id *)(a1 + 40), "didAdvanceAnimationToState:", 3);
  }
  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateAppearStatesForPlacement:start:animated:", *(_QWORD *)(a1 + 48), 0, 1);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "completeMoveKeyboardForWindow:", v24);

    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "remoteInputViewHost");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "updateInputViewsIfNecessary");
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 992) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "didFinishTranslationFromPlacement:to:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

    v28 = *(_QWORD *)(a1 + 72);
    if (v28)
      (*(void (**)(void))(v28 + 16))();
    objc_msgSend(*(id *)(a1 + 32), "flushPendingActivities");
  }
  v29 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_489;
    v55[3] = &unk_1E16B51E8;
    v30 = *(void **)(a1 + 32);
    v56 = *(id *)(a1 + 40);
    v57 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 48);
    v32 = *(_QWORD *)(a1 + 32);
    v58 = v31;
    v59 = v32;
    objc_msgSend(v30, "performWithSafeTransitionFrames:", v55);

  }
  aBlock[0] = v29;
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_500;
  aBlock[3] = &unk_1E16B1B50;
  v33 = *(id *)(a1 + 40);
  v34 = *(_QWORD *)(a1 + 32);
  v53 = v33;
  v54 = v34;
  v35 = (void (**)(_QWORD))_Block_copy(aBlock);
  v36 = v35;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1352))
  {
    v37 = _Block_copy(v35);
    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(void **)(v38 + 1360);
    *(_QWORD *)(v38 + 1360) = v37;

    v40 = dispatch_time(0, 100000000);
    block[0] = v29;
    block[1] = 3221225472;
    block[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3_501;
    block[3] = &unk_1E16B1B28;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v40, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v35[2](v35);
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && objc_msgSend(*(id *)(a1 + 48), "showsInputViews"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "remoteTextInputPartner");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "forwardKeyboardOperation:object:", sel_clearKeyboardSnapshot, 0);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldNotifyRemoteKeyboards") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "animationStyle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v43, "animated"))
    {
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(*(id *)(a1 + 40), "animationStyle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "duration");
    v46 = v45;

    if (v46 > 0.0)
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "flushDelayedTasks");
      goto LABEL_44;
    }
  }
LABEL_45:
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "flushDelayedTasks");

  kdebug_trace();
  kac_get_log();
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v49 = os_signpost_id_make_with_pointer(v48, (const void *)(*(_QWORD *)(a1 + 40) ^ *(_QWORD *)(a1 + 32)));
  if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v50 = v49;
    if (os_signpost_enabled(v48))
    {
      *(_DWORD *)buf = 67109376;
      v61 = v7 == v8;
      v62 = 1024;
      v63 = v21;
      _os_signpost_emit_with_name_impl(&dword_185066000, v48, OS_SIGNPOST_INTERVAL_END, v50, "animationDone", " finished=%{signpost.description:attribute}d started=%{signpost.description}d", buf, 0xEu);
    }
  }

}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_489(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  void *v32;
  const __CFString *v33;
  int v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  CGRect v42;
  CGRect v43;

  objc_msgSend(a1[4], "notificationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("moveFromPlacement: %@ toPlacement: %@ [didStart]"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyboardNotificationDebuggingInfo:", v5);

  v6 = a1[7];
  v7 = objc_msgSend(a1[4], "notifications");
  objc_msgSend(a1[4], "notificationInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEndNotifications:withInfo:", v7, v8);

  if ((objc_msgSend(a1[6], "isUndocked") & 1) != 0 || objc_msgSend(a1[6], "showsInputViews"))
  {
    +[UIInputViewSetNotificationInfo info](UIInputViewSetNotificationInfo, "info");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[7] + 129), "itemForPurpose:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notificationsFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(a1[7], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v11, v13, v15, v17);
    objc_msgSend(v41, "populateEndInfoWithFrame:");
    objc_msgSend(v41, "endFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(a1[4], "notificationInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endFrame");
    v43.origin.x = v27;
    v43.origin.y = v28;
    v43.size.width = v29;
    v43.size.height = v30;
    v42.origin.x = v19;
    v42.origin.y = v21;
    v42.size.width = v23;
    v42.size.height = v25;
    v31 = CGRectEqualToRect(v42, v43);

    if (!v31)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      if (objc_msgSend(a1[6], "isUndocked"))
        v33 = CFSTR("isUndocked ");
      else
        v33 = &stru_1E16EDF20;
      v34 = objc_msgSend(a1[6], "showsInputViews");
      v35 = CFSTR("showsInputViews");
      if (!v34)
        v35 = &stru_1E16EDF20;
      objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%@"), v33, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = objc_opt_class();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("moveFromPlacement: %@ toPlacement: %@ [%@]"), v38, objc_opt_class(), v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addKeyboardNotificationDebuggingInfo:", v39);

      objc_msgSend(a1[4], "notificationInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "endFrame");
      objc_msgSend(v41, "populateStartInfoWithFrame:");

      if ((objc_msgSend(a1[5], "isInteractive") & 1) == 0)
        objc_msgSend(a1[7], "keyboardMoveOfType:info:", 2, v41);
      objc_msgSend(a1[7], "postStartNotifications:withInfo:", 1, v41);
      objc_msgSend(a1[7], "postEndNotifications:withInfo:", 1, v41);

    }
  }
}

uint64_t __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_500(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "animationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "animationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completeAnimationWithHost:context:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setAnimationContext:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "setPlacementDuringAnimation:", 0);
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3_501(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1360);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1360);
    *(_QWORD *)(v3 + 1360) = 0;

  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_504(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "animationStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), 0);

}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLockFloating:", 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSuppressUpdateLayout:", 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSuppressUpdateShiftState:", 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateLayout");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateShiftState");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateCandidates");

    objc_msgSend(*(id *)(a1 + 32), "placement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isFloatingAssistantView") & 1) != 0)
    {

    }
    else
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "isFloatingAssistantView");

      if ((v9 & 1) == 0)
        return;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "initializeTranslateGestureRecognizerIfNecessary");
  }
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updatePlacementWithPlacement:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "updateToPlacement:withNormalAnimationsAndNotifications:", *(_QWORD *)(a1 + 40), 1);
  if (objc_msgSend(*(id *)(a1 + 48), "isFloatingAssistantView")
    && (objc_msgSend(*(id *)(a1 + 56), "showsInputOrAssistantViews") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "updateOffscreenKeyboardLayoutGuide");
  }

}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 32), "cancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    objc_msgSend(*(id *)(a1 + 40), "setPlacementDuringAnimation:", 0);
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlacementDuringAnimation:");
    objc_msgSend(*(id *)(a1 + 56), "object");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_4;
      v9[3] = &unk_1E16B1B50;
      v4 = *(void **)(a1 + 64);
      v10 = *(id *)(a1 + 56);
      v11 = *(id *)(a1 + 48);
      v5[0] = v3;
      v5[1] = 3221225472;
      v5[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_5;
      v5[3] = &unk_1E16D5F10;
      v5[4] = *(_QWORD *)(a1 + 40);
      v6 = *(id *)(a1 + 72);
      v7 = *(id *)(a1 + 80);
      v8 = *(id *)(a1 + 88);
      objc_msgSend(v4, "launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", v9, 0, v5, v2, 0);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlacementDuringAnimation:", *(_QWORD *)(a1 + 72));
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updatePlacementWithPlacement:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "updateToPlacement:withNormalAnimationsAndNotifications:", *(_QWORD *)(a1 + 40), 0);

}

uint64_t __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlacementDuringAnimation:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)viewForTransitionScreenSnapshot
{
  void *v2;
  void *v3;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)transitioningFrame
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

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
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

void __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_2()
{
  void *v0;
  id v1;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "inputWindowRootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:layoutSubviews:", 1, 1);
}

- (BOOL)isInputViewsHidden
{
  return self->_hiddenCount > 0;
}

- (void)setKeyboardWindowSnapshotOn:(BOOL)a3
{
  void (**pendingCompleteAnimation)(id, SEL);
  id v6;

  if (self->_keyboardWindowSnapshotOn)
  {
    pendingCompleteAnimation = (void (**)(id, SEL))self->_pendingCompleteAnimation;
    if (pendingCompleteAnimation)
    {
      pendingCompleteAnimation[2](pendingCompleteAnimation, a2);
      v6 = self->_pendingCompleteAnimation;
      self->_pendingCompleteAnimation = 0;

    }
  }
  self->_keyboardWindowSnapshotOn = a3;
}

- (void)setInputViewsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int hiddenCount;
  int v10;
  _QWORD v11[5];
  BOOL v12;
  const __CFString *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTextInputPartner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("hidden");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forwardApplicationOperation:object:", sel_setInputViewsHidden_, v8);

  }
  if (self->_inhibitingHiding)
  {
    hiddenCount = self->_hiddenCount;
    if (v3)
      v10 = hiddenCount + 1;
    else
      v10 = hiddenCount - 1;
    self->_hiddenCount = v10;
  }
  else
  {
    -[UIInputWindowControllerHosting removeAllAnimations](self->_hosting, "removeAllAnimations");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__UIInputWindowController_setInputViewsHidden___block_invoke;
    v11[3] = &unk_1E16B1B78;
    v11[4] = self;
    v12 = v3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  }
}

_DWORD *__47__UIInputWindowController_setInputViewsHidden___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  _DWORD *result;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 996);
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    v5 = v3 + 1;
  else
    v5 = v3 - 1;
  *(_DWORD *)(v2 + 996) = v5;
  result = *(_DWORD **)(a1 + 32);
  v7 = result[249];
  if (v4)
    v8 = v7 == 1;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(result, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOffsetOrigin:", 0.0, 4000.0);

    result = *(_DWORD **)(a1 + 32);
    v7 = result[249];
  }
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return result;
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(result, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOffsetOrigin:", 0.0, 0.0);

    result = *(_DWORD **)(a1 + 32);
    if ((result[249] & 0x80000000) != 0)
LABEL_12:
      result[249] = 0;
  }
  return result;
}

- (void)setHiddenCount:(int)a3
{
  int v5;
  double v6;
  void *v7;

  if (a3)
    v5 = 4000;
  else
    v5 = 0;
  v6 = (double)v5;
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOffsetOrigin:", 0.0, v6);

  self->_hiddenCount = a3;
}

- (void)prepareForSplitTransition
{
  id v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowController updateInputAssistantViewForInputViewSet:](self, "updateInputAssistantViewForInputViewSet:", v3);

}

- (void)finishSplitTransition
{
  id v3;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowController updateInputAssistantViewForInputViewSet:](self, "updateInputAssistantViewForInputViewSet:", v3);

}

void __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isTrackingKeyboard"))
  {
    v3 = *(double *)(a1 + 32);
    v4 = *(double *)(a1 + 40);
    objc_msgSend(v9, "insetForDismissedKeyboardGuide");
    if (v4 < v5)
    {
      objc_msgSend(v9, "insetForDismissedKeyboardGuide");
      v4 = v6;
    }
    objc_msgSend(v9, "_primaryKeyboardTrackingGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "changeSizingConstants:", v3, v4);

    if (v8)
      objc_msgSend(v9, "layoutViewsForTrackedGuides");
  }

}

uint64_t __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setBounds:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setCenter:");

}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, a2, a3, 0.0, 0.0);
}

void __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "placement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlacement:", v2);

}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_6(uint64_t a1)
{
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "postRotationPendingBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  return objc_msgSend(*(id *)(a1 + 32), "setPostRotationPendingBlock:", 0);
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputViewSet:", *(_QWORD *)(a1 + 40));
}

- (void)clearRotationState
{
  unint64_t rotationState;

  rotationState = self->_rotationState;
  if (rotationState == 1)
  {
    -[UIInputWindowController willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"), 0.0);
    rotationState = self->_rotationState;
  }
  if (rotationState == 2)
    -[UIInputWindowController didRotateFromInterfaceOrientation:](self, "didRotateFromInterfaceOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
  -[UIInputWindowControllerHosting removeAllAnimations](self->_hosting, "removeAllAnimations");
}

- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4 includeAssistantBar:(BOOL)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[UIKeyboard sizeForInterfaceOrientation:includingAssistantBar:ignoreInputView:](UIKeyboard, "sizeForInterfaceOrientation:includingAssistantBar:ignoreInputView:", -[UIInputWindowController keyboardOrientation](self, "keyboardOrientation", a3, a4), a5, 1);
  v7 = v6;
  v9 = v8;
  -[UIInputWindowController _inputViewPadding](self, "_inputViewPadding");
  v12 = v9 + v11 + v10;
  v13 = v7;
  result.height = v12;
  result.width = v13;
  return result;
}

- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v8 = (objc_msgSend(v6, "_autosizeToCurrentKeyboard") & 1) != 0
    || (dyld_program_sdk_at_least() & 1) != 0
    || SubviewAutoSizesWithPredictionBar(v7);
  -[UIInputWindowController sizeForInputViewController:inputView:includeAssistantBar:](self, "sizeForInputViewController:inputView:includeAssistantBar:", v6, v7, v8);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)isHostingView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIInputWindowControllerHosting allHostingItems](self->_hosting, "allHostingItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hostView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v4, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  double v8;

  -[UIInputViewSet _splittableInputAccessoryView](self->_inputViewSet, "_splittableInputAccessoryView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSet inputAccessoryView](self->_inputViewSet, "inputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "leftContentViewSize");
      if (v6 == 0.0)
        v7 = 14;
      else
        v7 = 12;
      objc_msgSend(v4, "rightContentViewSize");
      if (v8 == 0.0)
        v7 |= 1uLL;
    }
    else
    {
      v7 = 12;
    }
  }
  else
  {
    v7 = 15;
  }

  return v7;
}

- (void)postTransitionEndNotification
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
  void *v12;
  double v13;
  double v14;
  const __CFString *v15;
  uint64_t v16;
  id v17;

  if (-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
  {
    -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationsFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (-[UIInputWindowController isOnScreen](self, "isOnScreen"))
    {
      -[UIViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      v14 = v13 - v11;

      v15 = CFSTR("postTransitionEndNotification (isOnScreen)");
      v16 = 2;
    }
    else
    {
      v14 = v7 + v11;
      v15 = CFSTR("postTransitionEndNotification (!isOnScreen)");
      v16 = 3;
    }
    -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v5, v14, v9, v11);
    objc_msgSend(v17, "populateEndInfoWithFrame:");
    objc_msgSend(v17, "addKeyboardNotificationDebuggingInfo:", v15);
    -[UIInputWindowController postStartNotifications:withInfo:](self, "postStartNotifications:withInfo:", v16, v17);
    -[UIInputWindowController postEndNotifications:withInfo:](self, "postEndNotifications:withInfo:", v16, v17);

  }
}

- (void)generateNotificationsForStart:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v3 = a3;
  if (-[UIInputWindowController shouldNotifyRemoteKeyboards](self, "shouldNotifyRemoteKeyboards"))
  {
    -[UIInputWindowController initialNotificationInfo](self, "initialNotificationInfo");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__UIInputWindowController_generateNotificationsForStart___block_invoke;
      v16[3] = &unk_1E16B1B50;
      v16[4] = self;
      v17 = v15;
      v5 = v15;
      -[UIInputWindowController performWithSafeTransitionFrames:](self, "performWithSafeTransitionFrames:", v16);

    }
    else
    {
      -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notificationsFrame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v8, v10, v12, v14);
      objc_msgSend(v15, "populateEndInfoWithFrame:");
      objc_msgSend(v15, "addKeyboardNotificationDebuggingInfo:", CFSTR("generateNotificationsForStart:0"));
      -[UIInputWindowController postEndNotifications:withInfo:](self, "postEndNotifications:withInfo:", 1, v15);
    }

  }
}

uint64_t __57__UIInputWindowController_generateNotificationsForStart___block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationsFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  objc_msgSend(*(id *)(a1 + 40), "populateStartInfoWithFrame:");
  objc_msgSend(*(id *)(a1 + 40), "addKeyboardNotificationDebuggingInfo:", CFSTR("generateNotificationsForStart:1"));
  return objc_msgSend(*(id *)(a1 + 32), "postStartNotifications:withInfo:", 1, *(_QWORD *)(a1 + 40));
}

- (void)generateNotificationsForCompactAssistantFlickGestureCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  UIInputViewSetNotificationInfo *v21;

  v4 = a3;
  v21 = objc_alloc_init(UIInputViewSetNotificationInfo);
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E720);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E174E740);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInputViewSetNotificationInfo setAssistantPosition:](v21, "setAssistantPosition:", (int)objc_msgSend(v14, "intValue"));
  -[UIInputViewSetNotificationInfo setAssistantFrame:](v21, "setAssistantFrame:", v7, v9, v11, v13);
  -[UIInputViewSetNotificationInfo setForceNotification:](v21, "setForceNotification:", 1);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visualModeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "windowingModeEnabled");

  if (v17)
  {
    -[UIInputWindowController inputViewSet](self, "inputViewSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputAccessoryView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v21, "populateStartInfoWithFrame:", v7, v9, v11, v13);
      -[UIInputViewSetNotificationInfo populateEndInfoWithFrame:](v21, "populateEndInfoWithFrame:", v7, v9, v11, v13);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generateNotificationsForCompactAssistantFlickGestureCompletion (stageManager active: %d)"), v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetNotificationInfo addKeyboardNotificationDebuggingInfo:](v21, "addKeyboardNotificationDebuggingInfo:", v20);

  -[UIInputWindowController postStartNotifications:withInfo:](self, "postStartNotifications:withInfo:", 2, v21);
  -[UIInputWindowController postEndNotifications:withInfo:](self, "postEndNotifications:withInfo:", 2, v21);

}

- (void)validateInputView
{
  void *v3;
  char isKindOfClass;
  id v5;

  -[UIInputWindowController _inputViewController](self, "_inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIInputWindowController _inputViewController](self, "_inputViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validateInputModeIsDisplayed");

  }
}

- (void)invalidateInputAccessoryView
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIInputWindowController _inputAccessoryViewController](self, "_inputAccessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__UIInputWindowController_invalidateInputAccessoryView__block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  objc_msgSend(v4, "_preserveResponderOverridesWhilePerforming:", v5);

}

uint64_t __55__UIInputWindowController_invalidateInputAccessoryView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
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

  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inputAccessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsView:", v4) & 1) != 0)
  {

  }
  else
  {
    v5 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");

    if (!v5)
      goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "_inputAccessoryViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "clearInputAccessoryViewEdgeConstraints");
LABEL_5:
  objc_msgSend(*(id *)(a1 + 32), "_inputAccessoryViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);

  if (v9 == v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_inputAccessoryViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromParentViewController");

  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "_inputAccessoryViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "overrideTraitCollectionForChildViewController:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "_inputAccessoryViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOverrideTraitCollection:forChildViewController:", 0, v16);

  }
  return objc_msgSend(*(id *)(a1 + 32), "set_inputAccessoryViewController:", 0);
}

uint64_t __48__UIInputWindowController_changeToInputViewSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "inputAccessoryView");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "isEqual:", *(_QWORD *)(a1 + 40));
  v3 = (void *)v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "inputAccessoryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "isEqual:", *(_QWORD *)(a1 + 40));
}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 101);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInputAccessoryBackdropView");

}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "itemForPurpose:", 101);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateInputAccessoryBackdropView");

}

void __43__UIInputWindowController_setInputViewSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "changeToInputViewSet:", *(_QWORD *)(a1 + 40));
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentPresentationPlacement");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isEqual:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updatePlacementWithPlacement:", *(_QWORD *)(a1 + 48));
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_2;
  v7[3] = &unk_1E16B1B28;
  v7[4] = v5;
  objc_msgSend(v5, "ignoreLayoutNotifications:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "_updateBackdropViews");

}

void __43__UIInputWindowController_setInputViewSet___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __43__UIInputWindowController_setInputViewSet___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "changeToInputViewSet:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "isNullInputView"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completeMoveKeyboardForWindow:", v3);

  }
}

- (void)setPlacement:(id)a3 completion:(id)a4
{
  -[UIInputWindowController setPlacement:starting:completion:](self, "setPlacement:starting:completion:", a3, 0, a4);
}

- (void)setRotationAwarePlacement:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIInputWindowController postRotationPlacement](self, "postRotationPlacement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIInputWindowController setPostRotationPlacement:](self, "setPostRotationPlacement:", v5);
  else
    -[UIInputWindowController setPlacement:](self, "setPlacement:", v5);

}

- (void)setInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v6;

  +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputWindowController setInputViewSet:](self, "setInputViewSet:", v6);

}

- (id)inputViewSnapshotOfView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "convertRect:fromView:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, v9, v11, v13, v15, 0.0, 0.0, 0.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setUserInteractionEnabled:", 0);
  -[UIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  objc_msgSend(v17, "setContentScaleFactor:");

  return v17;
}

- (id)screenSnapshotOfView:(id)a3
{
  id v4;
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
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v10, "convertRect:fromView:", v4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toWindow:", 0, v12, v14, v16, v18);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v8, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v22, v24, v26, v28, 0.0, 0.0, 0.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUserInteractionEnabled:", 0);
  -[UIViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "window");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "screen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  objc_msgSend(v29, "setContentScaleFactor:");

  return v29;
}

- (CGRect)_visibleInputViewFrame
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat width;
  double v29;
  CGFloat y;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;
  CGRect v37;

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullInputViewAndAssistantFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v5, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "screen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;
  width = v27;
  y = v29;

  v33.origin.x = v13;
  v33.origin.y = v15;
  v33.size.width = v17;
  v33.size.height = v19;
  v36.origin.x = v24;
  v36.origin.y = v26;
  v36.size.width = width;
  v36.size.height = y;
  if (CGRectIntersectsRect(v33, v36))
  {
    v34.origin.x = v13;
    v34.origin.y = v15;
    v34.size.width = v17;
    v34.size.height = v19;
    v37.origin.x = v24;
    v37.origin.y = v26;
    v37.size.width = width;
    v37.size.height = y;
    result = CGRectIntersection(v34, v37);
    y = result.origin.y;
    width = result.size.width;
  }
  else
  {
    result.origin.x = 0.0;
    result.size.height = 0.0;
  }
  v31 = y;
  v32 = width;
  result.size.width = v32;
  result.origin.y = v31;
  return result;
}

- (CGRect)visibleInputViewFrame
{
  void *v3;
  UIInputWindowController *v4;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerRootController");
  v4 = (UIInputWindowController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[UIInputWindowController _visibleInputViewFrame](self, "_visibleInputViewFrame");
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerRootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_visibleInputViewFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)inputViewSetContainsView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hierarchyContainsView:", v4);

  return v6;
}

- (BOOL)hasInputOrAssistantViewsOnScreen
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  char v7;
  char v8;

  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  if (v5 <= 0.0)
  {

    v8 = 0;
LABEL_6:

    return v8;
  }
  -[UIInputWindowController inputViewSet](self, "inputViewSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocalMinimumHeightInputView");

  if ((v7 & 1) == 0)
  {
    -[UIInputWindowController placement](self, "placement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "showsInputOrAssistantViews");
    goto LABEL_6;
  }
  return 0;
}

- (void)animateAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  _QWORD v10[4];
  id v11;
  UIInputWindowController *v12;
  double v13;

  v5 = a3;
  -[UIInputWindowController _inputAccessoryView](self, "_inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (v5)
      v9 = 1.0;
    else
      v9 = 0.0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke;
    v10[3] = &unk_1E16B1C28;
    v13 = v9;
    v11 = v7;
    v12 = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v10, 0, a4, 0.0);

  }
}

uint64_t __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 1032);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke_2;
  v4[3] = &__block_descriptor_40_e31_v16__0__UIKBInputBackdropView_8l;
  v4[4] = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v2, "performForInputAccessoryBackdropViews:", v4);
}

uint64_t __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", *(double *)(a1 + 32));
}

- (void)resetBackdropHeight
{
  -[UIInputWindowControllerHosting resetBackdropHeight](self->_hosting, "resetBackdropHeight");
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  -[UIInputWindowControllerHosting extendKeyboardBackdropHeight:withDuration:](self->_hosting, "extendKeyboardBackdropHeight:withDuration:", a3, a4);
}

- (void)willBeginIndirectSelectionGesture
{
  -[UIInputWindowController setInterfaceAutorotationDisabled:](self, "setInterfaceAutorotationDisabled:", 1);
}

- (void)didEndIndirectSelectionGesture
{
  -[UIInputWindowController setInterfaceAutorotationDisabled:](self, "setInterfaceAutorotationDisabled:", 0);
}

- (void)presentationTransitionWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIInputWindowController *v8;
  char v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualModeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "presentingViewController");
    v8 = (UIInputWindowController *)objc_claimAutoreleasedReturnValue();
    if (v8 == self && objc_msgSend(v7, "windowingModeEnabled"))
    {
      v9 = objc_msgSend(v7, "shouldShowWithinAppWindow");

      if ((v9 & 1) == 0)
      {
        if (!qword_1ECD7A2A0)
        {
          v14 = xmmword_1E16D6110;
          v15 = 0;
          qword_1ECD7A2A0 = _sl_dlopen();
        }
        if (qword_1ECD7A2A0 && getSBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc())
        {
          dispatch_get_global_queue(25, 0);
          v10 = objc_claimAutoreleasedReturnValue();
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke;
          v11[3] = &unk_1E16B3F40;
          objc_copyWeak(&v12, &location);
          dispatch_async(v10, v11);

          objc_destroyWeak(&v12);
        }
      }
    }
    else
    {

    }
    objc_destroyWeak(&location);
  }

}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void (*SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc)(const __CFString *, uint64_t *);
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_2;
  v8 = &unk_1E16D6058;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v1 = &v5;
  SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc = (void (*)(const __CFString *, uint64_t *))getSBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc();
  if (SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc)
  {
    SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc(CFSTR("Presenting in keyboard window outside app scene"), v1);

    objc_destroyWeak(&v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void UIKBSBSAcquireFocusPreventingFullScreenPresentationAssertion(NSString *__strong, __strong _AssertionHandlerBlock)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UIInputWindowController.m"), 83, CFSTR("%s"), dlerror(), v5, v6, v7, v8);

    __break(1u);
  }
}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_3;
  v5[3] = &unk_1E16B1500;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setFullScreenPresentationAssertion:", v3);
  else
    objc_msgSend(v3, "invalidate");

}

- (void)presentationTransitionDidEnd:(id)a3
{
  -[UIInputWindowController setFullScreenPresentationAssertion:](self, "setFullScreenPresentationAssertion:", 0);
}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    objc_msgSend(v6, "beginDisablingInterfaceAutorotation");
  else
    objc_msgSend(v6, "endDisablingInterfaceAutorotation");

  -[UIInputWindowControllerHosting itemForPurpose:](self->_hosting, "itemForPurpose:", 3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterfaceAutorotationDisabled:", v3);

}

- (BOOL)disablePlacementChanges
{
  return self->_disablePlacementChanges;
}

- (void)setPlacementChangeDisabled:(BOOL)a3 withPlacement:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  UIInputWindowController *v12;
  id v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  id v17;
  __int16 v18;
  UIInputWindowController *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _UIInputWindowControllerLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "setPlacementChangeDisabled: %d, placement: %@ (self: %@)", buf, 0x1Cu);
  }

  if (!v4)
    self->_disablePlacementChanges = 0;
  if (!-[UIInputWindowController isRotating](self, "isRotating"))
  {
    if (self->_disableInRotating)
    {
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __68__UIInputWindowController_setPlacementChangeDisabled_withPlacement___block_invoke;
      v11 = &unk_1E16B1B50;
      v12 = self;
      v13 = v6;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v8);

      if (v4)
        goto LABEL_10;
    }
    else
    {
      -[UIInputWindowController setPlacement:](self, "setPlacement:", v6);
      if (v4)
        goto LABEL_10;
    }
LABEL_12:
    self->_disableInRotating = 0;
    goto LABEL_13;
  }
  -[UIInputWindowController setPostRotationPlacement:](self, "setPostRotationPlacement:", v6);
  if (!v4)
    goto LABEL_12;
LABEL_10:
  self->_disablePlacementChanges = 1;
  self->_disableInRotating = -[UIInputWindowController isRotating](self, "isRotating", v8, v9, v10, v11, v12);
LABEL_13:

}

uint64_t __68__UIInputWindowController_setPlacementChangeDisabled_withPlacement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlacement:", *(_QWORD *)(a1 + 40));
}

- (void)candidateBarWillChangeHeight:(double)a3 withDuration:(double)a4
{
  void *v7;
  int v8;
  _QWORD v9[6];

  -[UIInputWindowController placement](self, "placement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isUndocked");

  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__UIInputWindowController_candidateBarWillChangeHeight_withDuration___block_invoke;
    v9[3] = &unk_1E16B1888;
    v9[4] = self;
    *(double *)&v9[5] = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v9, &__block_literal_global_563, a4, 0.0);
  }
}

void __69__UIInputWindowController_candidateBarWillChangeHeight_withDuration___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = -*(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExtendedHeight:", v2);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateVisibilityConstraintsForPlacement:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)cancelCurrentTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputWindowController setInputViewsHidden:](self, "setInputViewsHidden:", 1);
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCancelled:", 1);

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelInterruptibleAnimations");

    -[UIInputWindowController currentTransition](self, "currentTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fromPlacement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowController updateToPlacement:withNormalAnimationsAndNotifications:](self, "updateToPlacement:withNormalAnimationsAndNotifications:", v8, 0);

    -[UIInputWindowController setInputViewsHidden:](self, "setInputViewsHidden:", 0);
  }
}

- (BOOL)isTransitioningBetweenKeyboardStates
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fromPlacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsKeyboard");
  objc_msgSend(v2, "toPlacement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "showsKeyboard");

  return v6;
}

- (UIInputViewSetPlacement)expectedPlacement
{
  void *v3;
  void *v4;
  void *v5;

  -[UIInputWindowController currentTransition](self, "currentTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIInputWindowController currentTransition](self, "currentTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toPlacement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIInputWindowController placement](self, "placement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIInputViewSetPlacement *)v5;
}

- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3
{
  -[UIKeyboardFloatingTransitionController beginTransitionFromPanGestureRecognizer:](self->_floatingTransitionController, "beginTransitionFromPanGestureRecognizer:", a3);
}

- (void)set_inputAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryViewController, a3);
}

- (UIInputWindowControllerHosting)hosting
{
  return self->_hosting;
}

- (BOOL)forceAccessoryViewToBottomOfHostView
{
  return self->_forceAccessoryViewToBottomOfHostView;
}

- (void)setForceAccessoryViewToBottomOfHostView:(BOOL)a3
{
  self->_forceAccessoryViewToBottomOfHostView = a3;
}

- (NSLayoutConstraint)inputViewHeightConstraint
{
  return self->_inputViewHeightConstraint;
}

- (void)setInputViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, a3);
}

- (NSLayoutConstraint)assistantViewHeightConstraint
{
  return self->_assistantViewHeightConstraint;
}

- (void)setAssistantViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_assistantViewHeightConstraint, a3);
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, a3);
}

- (UIInputViewSetNotificationInfo)notificationInfoWaitingForInputUI
{
  return self->_notificationInfoWaitingForInputUI;
}

- (void)setNotificationInfoWaitingForInputUI:(id)a3
{
  objc_storeStrong((id *)&self->_notificationInfoWaitingForInputUI, a3);
}

- (BOOL)layoutGuideNeedsUpdate
{
  return self->_layoutGuideNeedsUpdate;
}

- (void)setLayoutGuideNeedsUpdate:(BOOL)a3
{
  self->_layoutGuideNeedsUpdate = a3;
}

- (BOOL)externalTrackingUpdateInProgress
{
  return self->_externalTrackingUpdateInProgress;
}

- (void)setExternalTrackingUpdateInProgress:(BOOL)a3
{
  self->_externalTrackingUpdateInProgress = a3;
}

- (UITraitCollection)sizeClassCollectionOverride
{
  return self->_sizeClassCollectionOverride;
}

- (void)setSizeClassCollectionOverride:(id)a3
{
  objc_storeStrong((id *)&self->_sizeClassCollectionOverride, a3);
}

- (BOOL)dontDismissKeyboardOnScrolling
{
  return self->_dontDismissKeyboardOnScrolling;
}

- (void)setDontDismissKeyboardOnScrolling:(BOOL)a3
{
  self->_dontDismissKeyboardOnScrolling = a3;
}

@end
