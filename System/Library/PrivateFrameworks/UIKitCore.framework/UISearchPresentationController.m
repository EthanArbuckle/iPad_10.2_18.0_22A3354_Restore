@implementation UISearchPresentationController

uint64_t __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showBackgroundObscuringView");
}

uint64_t __97___UISearchPresentationController__presentationTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "edgeForHidingNavigationBar");
  objc_msgSend(a2, "transitionDuration");
  result = objc_msgSend(v4, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 1, v5);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "searchBarContainerView"), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    return objc_msgSend(*(id *)(a1 + 48), "endRefreshing");
  }
  return result;
}

uint64_t __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideBackgroundObscuringView");
}

_BYTE *__94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _BYTE *result;

  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(*(id *)(a1 + 40), "edgeForHidingNavigationBar");
  objc_msgSend(a2, "transitionDuration");
  objc_msgSend(v4, "_setNavigationBarHidden:edgeIfNotNavigating:duration:", 0, v5);
  result = *(_BYTE **)(a1 + 40);
  if ((result[416] & 2) != 0)
    return (_BYTE *)objc_msgSend((id)objc_msgSend(result, "searchBarContainerView"), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return result;
}

uint64_t __94___UISearchPresentationController__dismissalTransitionWithSearchBarNotHostedByNavBarWillBegin__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarHidesCompletelyOffscreen:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setSearchHidNavigationBar:", 0);
}

uint64_t __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showBackgroundObscuringView");
}

uint64_t __94___UISearchPresentationController__presentationTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
}

uint64_t __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideBackgroundObscuringView");
}

uint64_t __91___UISearchPresentationController__dismissalTransitionWithSearchBarHostedByNavBarWillBegin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTopViewController");
}

uint64_t __69___UISearchPresentationController__exciseSearchBarFromCurrentContext__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(void **)(a1 + 32) != a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (void *)objc_msgSend(a2, "constraints", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
          if (v9)
          {
            v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "firstItem"), "_referenceView");
            v11 = *(_QWORD *)(a1 + 32);
            v12 = objc_msgSend((id)objc_msgSend(v9, "secondItem"), "_referenceView");
            if (v10 != v11)
            {
              v13 = *(_QWORD *)(a1 + 32);
              goto LABEL_10;
            }
          }
          else
          {
            v13 = *(_QWORD *)(a1 + 32);
            if (v13)
            {
              v12 = 0;
LABEL_10:
              if (v12 != v13)
                goto LABEL_14;
            }
          }
          v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 368), "objectForKey:", a2);
          if (!v14)
          {
            v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 368), "setObject:forKey:", v14, a2);
          }
          objc_msgSend(v14, "addObject:", objc_msgSend(*(id *)(a1 + 40), "_constraintCopyOfConstraint:replaceItem:withItem:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 360), *(_QWORD *)(a1 + 32)));
LABEL_14:
          ++v8;
        }
        while (v6 != v8);
        v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v6 = v15;
      }
      while (v15);
    }
  }
  return 1;
}

uint64_t __117___UISearchPresentationController__updatePresentingViewControllerContentScrollViewWithOffsets_transitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
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

  objc_msgSend(*(id *)(a1 + 32), "contentInset");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "contentOffset");
  v11 = v10;
  v12 = *(double *)(a1 + 48);
  v13 = v3 + v12;
  v15 = v14 - v12;
  objc_msgSend(*(id *)(a1 + 32), "setContentInset:", v13, v5, v7, v9);
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", v11, v15);
}

@end
