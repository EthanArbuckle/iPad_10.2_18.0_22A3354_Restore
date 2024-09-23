@implementation TVAppDocumentController

void __54___TVAppDocumentController__alertControllerWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

    WeakRetained = v4;
  }

}

void __74___TVAppDocumentController__updateModalPresentationStateWithTemplateView___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, WeakRetained, 0);
    WeakRetained = v3;
  }

}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  void *v4;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void (**v58)(_QWORD);
  void *v59;
  int v60;
  id v61;
  void *v62;
  double v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  NSObject *v70;
  os_signpost_id_t v71;
  os_signpost_id_t v72;
  char v73;
  void (*v74)(_QWORD, _QWORD);
  double v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  double v80;
  uint64_t v81;
  char v82;
  BOOL v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[4];
  void (**v87)(_QWORD);
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  void (**v94)(_QWORD);
  _QWORD v95[4];
  id v96;
  id v97;
  uint8_t buf[8];
  _QWORD v99[5];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  unsigned __int8 v117;
  unsigned __int8 v118;
  double v119;
  unsigned __int8 v120[9];

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(v9, "presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_15;
    }
    objc_msgSend(v9, "templateViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v7)
    {

      if (v10)
        v13 = v10;
      else
        v13 = v4;

    }
    else
    {
      v12 = *(unsigned __int8 *)(a1 + 72);

      if (v10)
      {

        if (!v12)
          goto LABEL_15;
      }
      else
      {

        if (!v12)
        {
LABEL_15:
          objc_msgSend(v9, "setTransitioning:", 0);
          goto LABEL_50;
        }
      }
    }
    v120[0] = 1;
    objc_msgSend(v9, "_willHostTemplateViewController:usesTransitions:", v7, v120);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v16 = v15;

    if (v16 >= 0.25)
    {
      v83 = 0;
    }
    else
    {
      objc_msgSend(v9, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (unint64_t)objc_msgSend(v18, "count") > 1;

    }
    +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v19, "isVisible");

    objc_msgSend(v9, "templateViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "conformsToProtocol:", &unk_2557DFDA8);

    if (v21)
    {
      objc_msgSend(v9, "mediaQueryEvaluator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDelegate:", v23);

    }
    objc_msgSend(*(id *)(a1 + 40), "willMoveToParentViewController:", 0);
    if (v7)
      objc_msgSend(v9, "addChildViewController:", v7);
    objc_msgSend(v9, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0.0;
    objc_msgSend(v26, "backgroundColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "getRed:green:blue:alpha:", 0, 0, 0, &v119);

    v28 = v119;
    v118 = (v119 != 1.0) & ~a4;
    if (*(_BYTE *)(a1 + 73))
      objc_msgSend(v7, "overrideVisualEffectDisablementNeeded:", &v118, v119);
    objc_msgSend(v9, "tabBarController", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      v31 = objc_msgSend(v9, "_isFlowcaseStack");

      if (v31)
      {
        objc_msgSend(v26, "setClipsToBounds:", 0);
        objc_msgSend(v26, "subviews");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setClipsToBounds:", 0);

      }
    }
    objc_msgSend(v7, "preferredContentSize");
    v35 = *MEMORY[0x24BDBF148];
    if (*MEMORY[0x24BDBF148] == v36)
    {
      v37 = *(double *)(MEMORY[0x24BDBF148] + 8);
      if (v37 == v34)
      {
        objc_msgSend(*(id *)(a1 + 40), "preferredContentSize");
        if (v35 == v39 && v37 == v38)
        {
          objc_msgSend(*(id *)(a1 + 48), "mediaQueryEvaluator");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "windowSizeAdaptor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "adjustedWindowSize");
          v43 = v42;
          v45 = v44;

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "preferredContentSize");
          v43 = v46;
          v45 = v47;
        }
        objc_msgSend(v26, "setFrame:", 0.0, 0.0, v43, v45);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "markTemplateDidRender");
    v48 = MEMORY[0x24BDAC760];
    v108[0] = MEMORY[0x24BDAC760];
    v108[1] = 3221225472;
    v108[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2;
    v108[3] = &unk_24EB85DB0;
    v116 = *(_QWORD *)(a1 + 56);
    v49 = v24;
    v109 = v49;
    v110 = *(id *)(a1 + 40);
    v111 = v9;
    v50 = v25;
    v112 = v50;
    v51 = v7;
    v113 = v51;
    v52 = v26;
    v53 = *(_QWORD *)(a1 + 48);
    v114 = v52;
    v115 = v53;
    v117 = v118;
    v85 = MEMORY[0x22767F470](v108);
    v99[0] = v48;
    v99[1] = 3221225472;
    v99[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3;
    v99[3] = &unk_24EB85DD8;
    v99[4] = v9;
    v54 = v50;
    v100 = v54;
    v101 = *(id *)(a1 + 40);
    v106 = v118;
    v55 = v52;
    v102 = v55;
    v56 = v51;
    v103 = v56;
    v57 = v49;
    v104 = v57;
    v107 = v120[0];
    v105 = *(_OWORD *)(a1 + 48);
    v58 = (void (**)(_QWORD))MEMORY[0x22767F470](v99);
    objc_msgSend(v57, "window");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v120[0];

    if (v59 && v60)
    {
      if (*(_BYTE *)(a1 + 74))
      {
        v61 = v54;
        objc_msgSend(v61, "setShouldShowSpinner:", 0);
        v62 = (void *)v85;
        (*(void (**)(uint64_t, uint64_t))(v85 + 16))(v85, 1);
        objc_msgSend(v55, "setAlpha:", 0.0);
        v84 = (void *)MEMORY[0x24BDF6F90];
        if (*(_BYTE *)(a1 + 72))
          v63 = 2.0;
        else
          v63 = 0.5;
        v64 = v57;
        v65 = v54;
        v66 = MEMORY[0x24BDAC760];
        v95[0] = MEMORY[0x24BDAC760];
        v95[1] = 3221225472;
        v95[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_141;
        v95[3] = &unk_24EB848C0;
        v96 = v55;
        v67 = v61;
        v97 = v67;
        v93[0] = v66;
        v93[1] = 3221225472;
        v93[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2_142;
        v93[3] = &unk_24EB85E00;
        v94 = v58;
        objc_msgSend(v84, "animateWithDuration:delay:options:animations:completion:", 6, v95, v93, v63, 0.0);
        v68 = (void *)MEMORY[0x24BDF6F90];
        v91[0] = v66;
        v54 = v65;
        v57 = v64;
        v91[1] = 3221225472;
        v91[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3_143;
        v91[3] = &unk_24EB85440;
        v92 = v67;
        v69 = v67;
        objc_msgSend(v68, "animateWithDuration:animations:", v91, 0.5);

      }
      else
      {
        if (*(_BYTE *)(a1 + 75))
          v73 = v83 & (v82 ^ 1);
        else
          v73 = 1;
        v62 = (void *)v85;
        v74 = *(void (**)(_QWORD, _QWORD))(v85 + 16);
        if ((v73 & 1) != 0)
        {
          v74(v85, 0);
          v58[2](v58);
        }
        else
        {
          v74(v85, 1);
          v75 = 0.0;
          objc_msgSend(v55, "setAlpha:", 0.0);
          +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v76, "isVisible"))
          {
            +[_TVAppLoadingView loadingScreen](_TVAppLoadingView, "loadingScreen");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "hideAnimationDuration");
            v75 = v78 + 0.2;

          }
          v79 = (void *)MEMORY[0x24BDF6F90];
          if (*(_BYTE *)(a1 + 72))
            v80 = 0.8;
          else
            v80 = 0.5;
          v81 = MEMORY[0x24BDAC760];
          v88[0] = MEMORY[0x24BDAC760];
          v88[1] = 3221225472;
          v88[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_4;
          v88[3] = &unk_24EB848C0;
          v89 = v55;
          v90 = v54;
          v86[0] = v81;
          v86[1] = 3221225472;
          v86[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_5;
          v86[3] = &unk_24EB85E00;
          v87 = v58;
          objc_msgSend(v79, "animateWithDuration:delay:options:animations:completion:", 6, v88, v86, v80, v75);

        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "markTemplateWillTransition");
      objc_msgSend(v9, "setTransitioning:", 0);
      if (objc_msgSend(v9, "isVisualEffectDisablementNeeded"))
        +[_TVVisualEffectView removeHostView:](_TVVisualEffectView, "removeHostView:", v54);
      objc_msgSend(v54, "removeFromSuperview");
      if (v55)
      {
        objc_msgSend(v57, "addSubview:", v55);
        if (v118)
          +[_TVVisualEffectView addHostView:](_TVVisualEffectView, "addHostView:", v55);
      }
      objc_msgSend(*(id *)(a1 + 40), "removeFromParentViewController");
      objc_msgSend(v56, "didMoveToParentViewController:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v9, "setVisualEffectDisablementNeeded:", v118);
      objc_msgSend(v9, "_didHostTemplateViewController:usedTransitions:", v56, v120[0]);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "markTemplateDidTransition");
      v70 = (id)TVMLKitSignpostLogObject;
      v71 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 48));
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v72 = v71;
        if (os_signpost_enabled(v70))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_222D98000, v70, OS_SIGNPOST_INTERVAL_END, v72, "TVAppDocumentControllerUpdateOffscreen-Loading", (const char *)&unk_222E7E612, buf, 2u);
        }
      }

      v62 = (void *)v85;
    }

  }
LABEL_50:

}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "markTemplateWillTransition");
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 40), "beginAppearanceTransition:animated:", 0, a2);
  if (objc_msgSend(*(id *)(a1 + 48), "isVisualEffectDisablementNeeded"))
    +[_TVVisualEffectView disableForHostView:](_TVVisualEffectView, "disableForHostView:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "beginAppearanceTransition:animated:", 1, a2);
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 80), "_updateModalPresentationStateWithTemplateView:");
    objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(a1 + 72), 0);
    if (*(_BYTE *)(a1 + 96))
    {
      +[_TVVisualEffectView addHostView:](_TVVisualEffectView, "addHostView:", *(_QWORD *)(a1 + 72));
      +[_TVVisualEffectView disableForHostView:](_TVVisualEffectView, "disableForHostView:", *(_QWORD *)(a1 + 72));
    }
  }
  return objc_msgSend(*(id *)(a1 + 64), "endAppearanceTransition");
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setNeedsFocusUpdate");
  if (objc_msgSend(*(id *)(a1 + 32), "isVisualEffectDisablementNeeded"))
  {
    +[_TVVisualEffectView enableForHostView:](_TVVisualEffectView, "enableForHostView:", *(_QWORD *)(a1 + 40));
    +[_TVVisualEffectView removeHostView:](_TVVisualEffectView, "removeHostView:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "endAppearanceTransition");
  objc_msgSend(*(id *)(a1 + 48), "removeFromParentViewController");
  if (*(_BYTE *)(a1 + 96))
    +[_TVVisualEffectView enableForHostView:](_TVVisualEffectView, "enableForHostView:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 64), "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
  objc_msgSend(*(id *)(a1 + 72), "setUserInteractionEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setVisualEffectDisablementNeeded:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "_didHostTemplateViewController:usedTransitions:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 97));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "markTemplateDidTransition");
  v2 = (id)TVMLKitSignpostLogObject;
  v3 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 80));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_222D98000, v2, OS_SIGNPOST_INTERVAL_END, v4, "TVAppDocumentControllerReplace", (const char *)&unk_222E7E612, buf, 2u);
    }
  }

  v5 = (id)TVMLKitSignpostLogObject;
  v6 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 80));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_222D98000, v5, OS_SIGNPOST_INTERVAL_END, v7, "TVAppDocumentControllerUpdate", (const char *)&unk_222E7E612, v15, 2u);
    }
  }

  v8 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_222D98000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", (const char *)&unk_222E7E612, v14, 2u);
  }
  v9 = (id *)MEMORY[0x24BDF74F8];
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "shouldRecordExtendedLaunchTime"))
  {
    v10 = *v9;
    objc_msgSend(*v9, "_launchTestName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "isRunningTest:", v11);

    if ((_DWORD)v10)
    {
      v12 = *v9;
      objc_msgSend(*v9, "_launchTestName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishedTest:extraResults:", v13, 0);

    }
  }
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_141(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3_143(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "spinnerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "loadingTitleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __68___TVAppDocumentController_updatePreferredFocusedViewStateForFocus___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutBelowIfNeeded");

}

@end
