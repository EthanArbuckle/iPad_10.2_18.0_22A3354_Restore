@implementation UITabBarController(PhotosUICore)

- (uint64_t)px_hidesTabBarForCurrentHorizontalSizeClass
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 2)
    v3 = objc_msgSend(a1, "px_hidesTabBarForRegularHorizontalSizeClass");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)px_isTabBarHidden
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "tabBar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isHidden");

  return v2;
}

- (BOOL)px_canPerformAddToTabAnimationForTab:()PhotosUICore
{
  void *v5;
  void *v6;
  _BOOL8 v7;
  CGRect v9;

  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "px_frameForTabItem:inCoordinateSpace:", a3, v6);
    v7 = !CGRectIsEmpty(v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)px_hidesTabBarForRegularHorizontalSizeClass
{
  return 0;
}

- (void)px_performAddToTabAnimation:()PhotosUICore withSnapshotView:
{
  id v6;
  void *v7;
  NSObject *v8;
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
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void (**v34)(_QWORD);
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  id v65;
  void *v66;
  dispatch_time_t v67;
  BOOL IsEmpty;
  double x;
  double y;
  double width;
  double height;
  double v73;
  void *v74;
  dispatch_block_t block;
  void *v76;
  double v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  double v87;
  double v88;
  uint64_t v89;
  double v90;
  _QWORD v91[4];
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[4];
  id v98;
  uint8_t *v99;
  _QWORD v100[4];
  id v101;
  uint8_t *v102;
  uint8_t buf[8];
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD aBlock[4];
  id v108;
  id v109;
  id from;
  id location[2];
  CGRect v112;
  CGRect v113;

  v6 = a4;
  if ((objc_msgSend(a1, "px_canPerformAddToTabAnimationForTab:", a3) & 1) != 0)
  {
    objc_msgSend(a1, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      objc_msgSend(v6, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject convertRect:fromView:](v8, "convertRect:fromView:", v17, v10, v12, v14, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      objc_msgSend(v6, "removeFromSuperview");
      if (v21 >= -v25)
        v26 = v21;
      else
        v26 = -v25;
      v77 = v26;
      v78 = v23;
      objc_msgSend(v6, "setFrame:", v19);
      -[NSObject addSubview:](v8, "addSubview:", v6);
      objc_msgSend(a1, "selectedViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "selectedViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "navigationBar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = 0;
      }

      objc_msgSend(v29, "window");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 && (objc_msgSend(v29, "isHidden") & 1) == 0)
      {
        objc_msgSend(v29, "superview");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {

          goto LABEL_15;
        }
        objc_msgSend(v29, "bounds");
        IsEmpty = CGRectIsEmpty(v112);

        if (!IsEmpty)
        {
          objc_msgSend(v29, "bounds");
          -[NSObject convertRect:fromView:](v8, "convertRect:fromView:", v29);
          x = v113.origin.x;
          y = v113.origin.y;
          width = v113.size.width;
          height = v113.size.height;
          if (!CGRectIsEmpty(v113))
          {
            v73 = height + y;
            -[NSObject resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](v8, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, x, 0.0, width, v73, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setFrame:", x, 0.0, width, v73);
            -[NSObject addSubview:](v8, "addSubview:", v31);
            goto LABEL_15;
          }
        }
      }
      else
      {

      }
      v31 = 0;
LABEL_15:
      objc_initWeak(location, v6);
      v76 = v31;
      objc_initWeak(&from, v31);
      v32 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke;
      aBlock[3] = &unk_1E5144DF8;
      objc_copyWeak(&v108, location);
      objc_copyWeak(&v109, &from);
      *(_QWORD *)buf = 0;
      v104 = buf;
      v105 = 0x2020000000;
      v106 = 0;
      v100[0] = v32;
      v100[1] = 3221225472;
      v100[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_2;
      v100[3] = &unk_1E511B1F8;
      v102 = buf;
      block = _Block_copy(aBlock);
      v101 = block;
      v97[0] = v32;
      v97[1] = 3221225472;
      v97[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_3;
      v97[3] = &unk_1E511B220;
      v99 = buf;
      v33 = _Block_copy(v100);
      v98 = v33;
      v34 = (void (**)(_QWORD))_Block_copy(v97);
      +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "px_frameForTabItem:inCoordinateSpace:", a3, v8);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;
      objc_msgSend(v35, "addToTabDuration");
      v45 = v44;
      objc_msgSend(v35, "addToTabOpacity");
      objc_msgSend(v6, "setAlpha:");
      v74 = v33;
      objc_msgSend(v35, "addToTabTranslationDelay");
      v47 = v46;
      v48 = (void *)MEMORY[0x1E0DC3F10];
      v91[0] = v32;
      v91[1] = 3221225472;
      v91[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_4;
      v91[3] = &unk_1E51490B0;
      v49 = v6;
      v92 = v49;
      v93 = v37;
      v94 = v39;
      v95 = v41;
      v96 = v43;
      v34[2](v34);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "animateWithDuration:delay:options:animations:completion:", 0, v91, v50, v45 * (1.0 - v47), v45 * v47 + 0.1);

      objc_msgSend(v35, "addToTabScaleDelay");
      v52 = v51;
      v53 = (void *)MEMORY[0x1E0DC3F10];
      v85[0] = v32;
      v85[1] = 3221225472;
      v85[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_5;
      v85[3] = &unk_1E51490B0;
      v87 = v19;
      v88 = v77;
      v89 = v78;
      v90 = v25;
      v54 = v49;
      v86 = v54;
      v34[2](v34);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "animateWithDuration:delay:options:animations:completion:", 0, v85, v55, v45 * (1.0 - v52), v45 * v52 + 0.1);

      objc_msgSend(v35, "addToTabRotationDelay");
      v57 = v56;
      v58 = (void *)MEMORY[0x1E0DC3F10];
      v82[0] = v32;
      v82[1] = 3221225472;
      v82[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_6;
      v82[3] = &unk_1E5148D08;
      v59 = v35;
      v83 = v59;
      v60 = v54;
      v84 = v60;
      v34[2](v34);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "animateWithDuration:delay:options:animations:completion:", 0, v82, v61, v45 * (1.0 - v57), v45 * v57 + 0.1);

      objc_msgSend(v59, "addToTabFadeOutDelay");
      v63 = v62;
      v64 = (void *)MEMORY[0x1E0DC3F10];
      v79[0] = v32;
      v79[1] = 3221225472;
      v79[2] = __81__UITabBarController_PhotosUICore__px_performAddToTabAnimation_withSnapshotView___block_invoke_7;
      v79[3] = &unk_1E5148D08;
      v65 = v76;
      v80 = v65;
      v81 = v60;
      v34[2](v34);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "animateWithDuration:delay:options:animations:completion:", 196608, v79, v66, v45 * (1.0 - v63), v45 * v63 + 0.1);

      v67 = dispatch_time(0, (uint64_t)((v45 + v45) * 1000000000.0));
      dispatch_after(v67, MEMORY[0x1E0C80D38], block);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v109);
      objc_destroyWeak(&v108);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);

    }
  }
  else
  {
    objc_msgSend(v6, "removeFromSuperview");
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Unable to perform the requested add to tab bar animation.", buf, 2u);
    }
  }

}

- (double)px_frameForTabItem:()PhotosUICore inCoordinateSpace:
{
  return *MEMORY[0x1E0C9D628];
}

- (id)px_defaultKeyCommandsWithDelegate:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a1, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "selectedIndex");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__UITabBarController_PhotosUICore__px_defaultKeyCommandsWithDelegate___block_invoke;
  v14[3] = &unk_1E511B248;
  v17 = v7;
  v15 = v4;
  v9 = v8;
  v16 = v9;
  v10 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

- (void)_px_selectTabForKeyCommand:()PhotosUICore
{
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "propertyList");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITabBarController+PhotosUICore.m"), 164, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("keyCommand.propertyList"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITabBarController+PhotosUICore.m"), 164, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("keyCommand.propertyList"), v7, v9);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(a1, "setSelectedIndex:", objc_msgSend(v10, "unsignedIntValue"));

}

@end
