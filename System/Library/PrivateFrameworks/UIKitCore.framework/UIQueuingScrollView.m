@implementation UIQueuingScrollView

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1, a2, a3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, v7, objc_msgSend(*(id *)(a1 + 40), "transitionDirection"), 1, 0, 0);

  objc_msgSend(*(id *)(a1 + 40), "cleanupWithFinishedState:completedState:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpCompletionState:didFinish:didComplete:", *(_QWORD *)(a1 + 40), a2, a3);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:", 0, v9, v10, 1);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v12, v13, objc_msgSend(*(id *)(a1 + 48), "transitionDirection"), 1, 0);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, v15, objc_msgSend(*(id *)(a1 + 48), "transitionDirection"), 1, 0, 0);

  objc_msgSend(*(id *)(a1 + 48), "cleanupWithFinishedState:completedState:", 0, 0);
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:", 0, v17, v18, 1);

  v19 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v20, v21, *(_QWORD *)(a1 + 72), 1, a3);

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), 1, a2, a3);
  v22 = *(_QWORD *)(a1 + 64);
  if (v22)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 16))(v22, 0, a3);
  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 2096);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "indexOfObject:", v24);

  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2096), "mutableCopy");
    if (!*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_UIQueuingScrollView.m"), 609, CFSTR("view is nil"));

    }
    objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v25);
    objc_msgSend(*(id *)(a1 + 32), "_replaceViews:updatingContents:adjustContentInsets:animated:", v26, 1, 0, 1);

  }
  v27 = *(void **)(*(_QWORD *)(a1 + 32) + 2096);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(v27, "containsObject:", v28);

  if ((v27 & 1) == 0)
  {
    v29 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "view");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_flushView:animated:", v31, 0);

  }
}

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1, a2, a3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __78___UIQueuingScrollView__enqueueAnimatedScrollInDirection_withView_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1, a2, a3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __103___UIQueuingScrollView__commitGestureDrivenScrollRevealingView_concealingView_inDirection_canComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidEndManualScroll:toRevealView:direction:animated:didFinish:didComplete:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, a2, a3);
}

BOOL __54___UIQueuingScrollView__didScrollWithAnimation_force___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  char v48;
  _QWORD *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  void *v56;
  __int128 v57;
  uint64_t v58;
  CGPoint v59;
  CGPoint v60;
  CGPoint v61;
  CGPoint v62;

  v58 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (a2 == 2)
      v4 = 1;
    else
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v4 = -1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  objc_msgSend(*(id *)(a1 + 32), "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", a2, 1, 0, *(unsigned __int8 *)(a1 + 112));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_68;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == -1)
  {
    v7 = _MergedGlobals_7_2;
    if (!_MergedGlobals_7_2)
    {
      v7 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_MergedGlobals_7_2);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(unsigned __int8 *)(a1 + 113);
      LODWORD(v57) = 67109120;
      DWORD1(v57) = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "isScrollInProgress: %d", (uint8_t *)&v57, 8u);
    }
    v10 = qword_1ECD7B0F0;
    if (!qword_1ECD7B0F0)
    {
      v10 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7B0F0);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(unsigned __int8 *)(a1 + 112);
      LODWORD(v57) = 67109120;
      DWORD1(v57) = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "animated: %d", (uint8_t *)&v57, 8u);
    }
    v13 = qword_1ECD7B0F8;
    if (!qword_1ECD7B0F8)
    {
      v13 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD7B0F8);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2088);
      LODWORD(v57) = 134217984;
      *(_QWORD *)((char *)&v57 + 4) = v15;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "orientation: %ld", (uint8_t *)&v57, 0xCu);
    }
    if (*(_BYTE *)(a1 + 112))
    {
      v16 = qword_1ECD7B100;
      if (!qword_1ECD7B100)
      {
        v16 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7B100);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 32);
        v19 = v17;
        objc_msgSend(v18, "_animatedTargetOffset");
        NSStringFromCGPoint(v59);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v57) = 138412290;
        *(_QWORD *)((char *)&v57 + 4) = v20;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "animatedTargetOffset: %@", (uint8_t *)&v57, 0xCu);

      }
      v21 = qword_1ECD7B108;
      if (!qword_1ECD7B108)
      {
        v21 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7B108);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      v23 = *(void **)(a1 + 32);
      v24 = v22;
      objc_msgSend(v23, "_animatedOriginalOffset");
      NSStringFromCGPoint(v60);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 138412290;
      *(_QWORD *)((char *)&v57 + 4) = v25;
      v26 = "animatedOriginalOffset: %@";
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "_isBouncing"))
        goto LABEL_39;
      v27 = qword_1ECD7B110;
      if (!qword_1ECD7B110)
      {
        v27 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&qword_1ECD7B110);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 32);
        v30 = v28;
        objc_msgSend(v29, "_pageDecelerationTarget");
        NSStringFromCGPoint(v61);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v57) = 138412290;
        *(_QWORD *)((char *)&v57 + 4) = v31;
        _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "pageDecelerationTarget: %@", (uint8_t *)&v57, 0xCu);

      }
      v32 = qword_1ECD7B118;
      if (!qword_1ECD7B118)
      {
        v32 = __UILogCategoryGetNode("ScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v32, (unint64_t *)&qword_1ECD7B118);
      }
      v33 = *(NSObject **)(v32 + 8);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      v34 = *(void **)(a1 + 32);
      v24 = v33;
      objc_msgSend(v34, "contentOffset");
      NSStringFromCGPoint(v62);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 138412290;
      *(_QWORD *)((char *)&v57 + 4) = v25;
      v26 = "contentOffset: %@";
    }
    _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v57, 0xCu);

LABEL_39:
    v6 = *(_QWORD *)(a1 + 48);
    if (v6 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_UIQueuingScrollView.m"), 818, CFSTR("Failed to determine navigation direction for scroll"));

      v6 = *(_QWORD *)(a1 + 48);
    }
  }
  if (v6 == 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != -1)
      goto LABEL_59;
  }
  else if (v6 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 1)
  {
    goto LABEL_59;
  }
  v35 = *(_QWORD *)(a1 + 32);
  v36 = *(void **)(v35 + 2112);
  if (v36 == v5)
  {
    objc_msgSend(*(id *)(v35 + 2136), "lastObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38 == v5)
      goto LABEL_59;
    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(void **)(v35 + 2112);
  }
  if (v36 != v5)
  {
    objc_storeStrong((id *)(v35 + 2112), v5);
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(unsigned __int8 *)(v39 + 2144);
    v41 = *(_QWORD *)(v39 + 2112);
    objc_msgSend((id)v39, "_visibleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v39, "_notifyDelegateWillManuallyScroll:toRevealView:concealingView:animated:", v40, v41, v42, 1);

    v35 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v35 + 2144))
    {
      v43 = *(_QWORD *)(v35 + 2112);
      objc_msgSend(*(id *)(a1 + 32), "_visibleView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v35, "_notifyDelegateDidCommitManualScroll:toRevealView:concealView:direction:animated:canComplete:", 0, v43, v44, *(_QWORD *)(a1 + 48), 1, 1);

      v35 = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_BYTE *)(v35 + 2144) && (objc_msgSend((id)v35, "isTracking") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2136), "lastObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "view");
    v46 = objc_claimAutoreleasedReturnValue();
    if ((void *)v46 == v5)
    {

    }
    else
    {
      v47 = (void *)v46;
      v48 = objc_msgSend(*(id *)(a1 + 32), "_isDeceleratingInOppositionToNavigationDirection:", *(_QWORD *)(a1 + 48));

      if ((v48 & 1) != 0)
        goto LABEL_59;
      v49 = *(_QWORD **)(a1 + 32);
      v50 = v49[264];
      objc_msgSend(v49, "_visibleView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_commitGestureDrivenScrollRevealingView:concealingView:inDirection:canComplete:", v50, v45, *(_QWORD *)(a1 + 48), 1);
    }

  }
LABEL_59:
  v51 = (id)objc_msgSend(*(id *)(a1 + 32), "_viewAtIndex:loadingIfNecessary:updatingContents:animated:", a2, 0, 1, *(unsigned __int8 *)(a1 + 112), v57);
  if (a2)
  {
    if (a2 == 2)
    {
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2088);
      if (v52 == 1)
      {
        v54 = *(double *)(a1 + 72) >= *(double *)(a1 + 104) + *(double *)(a1 + 104);
        goto LABEL_69;
      }
      if (!v52 && *(double *)(a1 + 64) >= *(double *)(a1 + 96) + *(double *)(a1 + 96))
        goto LABEL_71;
    }
  }
  else
  {
    v53 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2088);
    if (v53 == 1)
    {
      v54 = *(double *)(a1 + 72) <= 0.0;
      goto LABEL_69;
    }
    if (!v53 && *(double *)(a1 + 64) <= 0.0)
    {
LABEL_71:
      v54 = 1;
      goto LABEL_69;
    }
  }
LABEL_68:
  v54 = 0;
LABEL_69:

  return v54;
}

@end
