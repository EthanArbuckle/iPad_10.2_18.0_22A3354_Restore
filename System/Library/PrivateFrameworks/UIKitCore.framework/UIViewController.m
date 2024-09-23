@implementation UIViewController

- (_QWORD)_contentScrollViewHeuristic
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "_existingView");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_47;
  v3 = *(void **)(a1 + 304);
  if (v3 && (objc_msgSend(v3, "isDescendantOfView:", v2) & 1) == 0)
    objc_msgSend((id)a1, "_clearRecordedContentScrollView");
  v4 = *(id *)(a1 + 304);
  if (v4)
    goto LABEL_48;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend((id)a1, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "barStyle");
    objc_msgSend(v2, "_screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIBarStyleWithTintColorIsTranslucentOnScreen(v7, 0, v8))
    {

LABEL_12:
      v12 = v2;
      while (2)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v12, "subviews");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14)
          {
            if (objc_msgSend(v12, "_canHostViewControllerContentScrollView"))
            {
              objc_msgSend(v12, "subviews");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v44 = 0u;
              v45 = 0u;
              v42 = 0u;
              v43 = 0u;
              v16 = v15;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v43;
LABEL_18:
                v20 = 0;
                while (1)
                {
                  if (*(_QWORD *)v43 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
                  if (!-[UIViewController _useViewBasedTopAndBottomLayoutGuides](a1)
                    || v21 != *(void **)(a1 + 536) && v21 != *(void **)(a1 + 544))
                  {
                    break;
                  }
                  if (v18 == ++v20)
                  {
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
                    if (v18)
                      goto LABEL_18;
                    goto LABEL_50;
                  }
                }
                v12 = v21;

                if (v12)
                  continue;
                break;
              }
LABEL_50:

            }
            else
            {
              v16 = v12;
            }

            v12 = 0;
          }
        }
        break;
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v12;
      else
        v4 = 0;

      goto LABEL_48;
    }
    objc_msgSend((id)a1, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "barStyle");

    if (v11 == 4)
      goto LABEL_12;
    if ((v2[13] & 0x800000000000000) != 0)
    {
      objc_msgSend(v2, "subviews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 == 1)
      {
        objc_msgSend(v2, "subviews");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
        v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        v4 = 0;
        if ((v25[13] & 0x20000000000000) != 0)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v2, "_layoutEngine"),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                v26,
                v26))
          {
            -[UIView _updateConstraintsAtEngineLevelIfNeededWithViewForVariableChangeNotifications:](v2, v2);
            objc_msgSend(v25, "_nsis_origin");
            v28 = v27;
            v30 = v29;
            objc_msgSend(v25, "_nsis_bounds");
            v32 = v31;
            v34 = v33;
            objc_msgSend(v2, "_nsis_bounds");
            if (v36 == v34
              && v35 == v32
              && v30 == *(double *)(MEMORY[0x1E0C9D538] + 8)
              && v28 == *MEMORY[0x1E0C9D538])
            {
              v40 = v25;
            }
            else
            {
              v40 = 0;
            }
            v4 = v40;
          }
          else
          {
            v4 = 0;
          }
        }

        goto LABEL_48;
      }
    }
LABEL_47:
    v4 = 0;
    goto LABEL_48;
  }
  v4 = v2;
LABEL_48:

  return v4;
}

- (id)_ancestorViewControllerOfClass:(uint64_t)a3 allowModalParent:
{
  id v6;
  id v7;
  id v8;
  void *v9;

  if (a1)
  {
    v6 = *(id *)(a1 + 104);
    v7 = v6;
    if ((_DWORD)a3 && !v6)
      v7 = *(id *)(a1 + 120);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
    }
    else
    {
      -[UIViewController _ancestorViewControllerOfClass:allowModalParent:](v7, a2, a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)_useViewBasedTopAndBottomLayoutGuides
{
  _QWORD *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  if (result)
  {
    v1 = (_QWORD *)result;
    if ((*(_QWORD *)(result + 368) & 0x100000000000) == 0 && (dyld_program_sdk_at_least() & 1) == 0)
      v1[46] |= 0x100000000000uLL;
    v2 = dyld_program_sdk_at_least();
    v3 = v1[46];
    if (v2 && (v3 & 0x200000000000) == 0 && (v1[67] || v1[68]))
    {
      v4 = objc_opt_class();
      v5 = (void *)v1[67];
      if (v5)
        v6 = objc_msgSend(v5, "isMemberOfClass:", v4);
      else
        v6 = 1;
      v7 = (void *)v1[68];
      if (v7)
        v8 = objc_msgSend(v7, "isMemberOfClass:", v4);
      else
        v8 = 1;
      if ((v6 & v8 & 1) == 0)
      {
        v9 = *MEMORY[0x1E0C99778];
        if (((v6 | v8) & 1) != 0)
        {
          if ((v6 & 1) != 0)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Unexpected class for bottomLayoutGuide. This is an application bug. bottomlayoutGuide = %@"), v1[68], v10);
          else
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Unexpected class for topLayoutGuide. This is an application bug. topLayoutGuide = %@"), v1[67], v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Unexpected class for topLayoutGuide and bottomLayoutGuide. This is an application bug. topLayoutGuide = %@, bottomlayoutGuide = %@"), v1[67], v1[68]);
        }
      }
      v3 = v1[46] | 0x200000000000;
      v1[46] = v3;
    }
    return (v3 >> 44) & 1;
  }
  return result;
}

- (UINavigationController)navigationController
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (UINavigationController *)-[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
}

- (void)_performContentUnavailableConfigurationStateUpdate
{
  __int16 v2;

  if (a1)
  {
    v2 = *(_WORD *)(a1 + 376);
    if ((v2 & 0x10) != 0)
    {
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 368);
      *(_WORD *)(a1 + 376) = v2 & 0xFFEF;
      if (_UIObservationTrackingEnabled())
        objc_msgSend((id)a1, "_updateContentUnavailableConfigurationWithObservationTracking");
      else
        -[UIViewController _executeContentUnavailableConfigurationUpdate]((void *)a1);
    }
  }
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v3;
  id v4;
  _QWORD v5[7];

  sub_18547F580(a3, (uint64_t)v5);
  v3 = (void *)v5[0];
  v4 = (id)v5[4];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (id)viewControllerForView:(id)a3
{
  return -[UIView __viewDelegate]((id *)a3);
}

- (id)_appearanceGuideClass
{
  return 0;
}

- (id)_appearanceContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIViewController _parentModalViewController](self, "_parentModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIViewController _parentModalViewController](self, "_parentModalViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController _nonPresentationAppearanceContainer](self, "_nonPresentationAppearanceContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 0;
}

- (id)_nonPresentationAppearanceContainer
{
  void *v3;
  void *v4;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least() && !v4)
  {
    -[UIViewController _window](self, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (id)_independentContainedScrollViewIntermediateToDescendantViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = 1;
  -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (v5 = 4,
        -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "_existingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isDescendantOfView:", v6) & 1) == 0)
    {

LABEL_7:
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "_contentOrObservableScrollViewForEdge:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
      goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (UINavigationItem)navigationItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[UIViewController searchDisplayController](self, "searchDisplayController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UIViewController searchDisplayController](self, "searchDisplayController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "displaysSearchBarInNavigationBar"),
        v5,
        v4,
        v6))
  {
    -[UIViewController searchDisplayController](self, "searchDisplayController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController _navigationItemCreatingDefaultIfNotSet](self, "_navigationItemCreatingDefaultIfNotSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UINavigationItem *)v8;
}

- (UISearchDisplayController)searchDisplayController
{
  return (UISearchDisplayController *)objc_loadWeakRetained((id *)&self->_searchDisplayController);
}

- (UINavigationItem)_navigationItemCreatingDefaultIfNotSet
{
  UINavigationItem *navigationItem;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UINavigationItem *v11;
  UINavigationItem *v12;
  uint64_t v14;

  navigationItem = self->_navigationItem;
  if (!navigationItem)
  {
    -[UIViewController title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = +[UIViewController instanceMethodForSelector:](UIViewController, "instanceMethodForSelector:", sel_title);
        v7 = -[UIViewController methodForSelector:](self, "methodForSelector:", sel_title);
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_class();
        v10 = objc_opt_class();
        if (v6 == v7)
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 15014, CFSTR("ViewController class %@ returned a value of class %@ from -title, that is not a subclass of NSString. This is likely a memory error."), v9, v10, v14);
        else
          objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 15012, CFSTR("ViewController class %@ overrode -title and returned a value of class %@, that is not a subclass of NSString. This is an illegal override. overrideImplementation=%p"), v9, v10, v7);

      }
    }
    v11 = -[UINavigationItem initWithTitle:]([UINavigationItem alloc], "initWithTitle:", v5);
    v12 = self->_navigationItem;
    self->_navigationItem = v11;

    navigationItem = self->_navigationItem;
  }
  return navigationItem;
}

- (id)_contentOrObservableScrollViewForEdge:(unint64_t)a3
{
  if (self)
  {
    -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)self, a3);
    self = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_resolveContentScrollViewForEdge:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v14;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (a2 != 1 && a2 != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__resolveContentScrollViewForEdge_, a1, CFSTR("UIViewController.m"), 5328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edge == NSDirectionalRectEdgeTop || edge == NSDirectionalRectEdgeBottom"));

  }
  v5 = *(void **)(a1 + 584);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend((id)a1, "_defaultContentScrollViewForEdge:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "_temporaryCoordinatingReplacement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "_temporaryCoordinatingReplacement");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(*(id *)(a1 + 592), "objectForKey:", &unk_1E1A974E8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 592), "objectForKey:", &unk_1E1A97500);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v14 = a2 == 1 && v10 != v7;
  v16 = a2 == 4 && v11 != (_QWORD)v7;
  if (!v14 && !v16)
    goto LABEL_40;
  v17 = *(void **)(a1 + 592);
  if (v7)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v18;

      v17 = *(void **)(a1 + 592);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v7, v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v21);

    if (objc_msgSend(*(id *)(a1 + 592), "count"))
      goto LABEL_29;
    v20 = *(void **)(a1 + 592);
    *(_QWORD *)(a1 + 592) = 0;
  }

LABEL_29:
  if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__observableScrollViewDidChangeFrom_forViewController_edges_) & 1) != 0)goto LABEL_40;
  if (v14)
  {
    if (v12 != v7)
      objc_msgSend(v7, "_addScrollViewScrollObserver:", a1);
    v22 = v10;
    if (v10 == v12)
      goto LABEL_40;
LABEL_39:
    objc_msgSend(v22, "_removeScrollViewScrollObserver:", a1);
    goto LABEL_40;
  }
  if (v16)
  {
    if (v10 != v7)
      objc_msgSend(v7, "_addScrollViewScrollObserver:", a1);
    v22 = v12;
    if (v12 != v10)
      goto LABEL_39;
  }
LABEL_40:

  return v7;
}

- (id)_defaultContentScrollViewForEdge:(unint64_t)a3
{
  void *v6;
  void *v7;

  if ((_UIBarsApplyChromelessEverywhere() & 1) != 0)
    goto LABEL_6;
  if (qword_1EDDB0F80 != -1)
    dispatch_once(&qword_1EDDB0F80, &__block_literal_global_140);
  if (_MergedGlobals_138)
  {
LABEL_6:
    if (a3 != 1 && a3 != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 1600, CFSTR("NSDirectionalRectEdgeTop and NSDirectionalRectEdgeBottom are the only valid parameters for this internal method"));

    }
    if ((*(_QWORD *)&self->_viewControllerFlags & 0x200000000000000) != 0)
    {
      -[UIViewController _contentScrollView](self, "_contentScrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIViewController contentScrollViewForEdge:](self, "contentScrollViewForEdge:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if ((*(_QWORD *)&self->_viewControllerFlags & 0x400000000000000) != 0)
        {
          v7 = 0;
        }
        else
        {
          -[UIViewController _contentScrollViewHeuristic]((uint64_t)self);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  else
  {
    -[UIViewController _shim_contentScrollView](self, "_shim_contentScrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (UIScrollView)contentScrollViewForEdge:(NSDirectionalRectEdge)edge
{
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  char v8;
  char v9;
  char v10;
  NSMutableDictionary *observableScrollViews;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;

  v5 = (uint64_t *)MEMORY[0x1E0C99778];
  if (edge != 1 && edge != 4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid edge argument for -contentScrollViewForEdge:. Only values of NSDirectionalRectEdgeTop or NSDirectionalRectEdgeBottom are accepted."));
  if (self)
  {
    v6 = 0;
    v7 = 0;
    v16 = *v5;
    v8 = 1;
    v9 = 1;
    do
    {
      v10 = v8;
      if ((qword_18667A220[v6] & edge) != 0)
      {
        observableScrollViews = self->_observableScrollViews;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](observableScrollViews, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v9 & 1) != 0)
        {
          v14 = v13;

          v7 = v14;
        }
        else if (v7 != v13)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v16, CFSTR("Multiple scroll views found for edges: %ld"), edge);
        }

        v9 = 0;
      }
      v8 = 0;
      v6 = 1;
    }
    while ((v10 & 1) != 0);
  }
  else
  {
    v7 = 0;
  }
  return (UIScrollView *)v7;
}

- (unint64_t)__updateContentOverlayInsetsWithOurRect:(void *)a3 inBoundsOfAncestorViewController:(CGFloat)x viaImmediateChildOfAncestor:(CGFloat)y
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v29;
  double v30;
  double v31;
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
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int v62;
  id v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  double v72;
  double v73;
  _BOOL4 v74;
  _BOOL4 v75;
  CGFloat v76;
  CGFloat v77;
  _BOOL4 v78;
  double v79;
  double v80;
  double v81;
  double v82;
  _BOOL4 v83;
  int v84;
  _BOOL4 v85;
  _BOOL4 v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  int v91;
  int v92;
  unsigned int v93;
  uint64_t v94;
  void *v95;
  __n128 v96;
  __n128 v97;
  void *v98;
  char v99;
  double v100;
  double v101;
  double v102;
  void (**v103)(void *, uint64_t, double, double, __n128, __n128);
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  CGFloat v108;
  _BOOL4 v109;
  double MinY;
  double v111;
  double MinX;
  double v113;
  double MaxY;
  double v115;
  double MaxX;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  _BOOL4 v123;
  double v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  id v130;
  void *v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  CGRect rect;
  void *v141;
  id v142;
  unint64_t v143;
  id v144;
  id v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat v153;
  char v154;
  double v155;
  char v156;
  double v157[2];
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
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
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  v13 = a2;
  v14 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "_existingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_existingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v18)
    {
      a1 = 0;
      goto LABEL_13;
    }
    objc_msgSend((id)a1, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "_existingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_existingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v157[0] = 0.0;
      objc_msgSend(v19, "_baseContentInsetsWithLeftMargin:rightMargin:", v157, 0);
      objc_msgSend((id)a1, "_setContentMargin:", v157[0]);
    }
    else
    {
      objc_msgSend((id)a1, "parentViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_contentMarginForChildViewController:", a1);
      objc_msgSend((id)a1, "_setContentMargin:");

    }
    if ((objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren") & 1) != 0)
      goto LABEL_11;
    objc_msgSend(v20, "window");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_11;
    v24 = (void *)v23;
    objc_msgSend(v21, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25
      || (objc_msgSend(v20, "_window"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "_window"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v27,
          v26,
          v26 != v27))
    {
LABEL_11:
      a1 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v156 = 0;
    objc_msgSend(v13, "_edgeInsetsForChildViewController:insetsAreAbsolute:", v14, &v156);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    if (v156)
    {
      v157[0] = 0.0;
      v155 = 0.0;
      objc_msgSend(v13, "_marginInfoForChild:leftMargin:rightMargin:", v14, v157, &v155);
      if (v157[0] == -1.79769313e308)
      {
        objc_msgSend((id)a1, "_viewSafeAreaInsetsFromScene", v157[0]);
        v38 = fmax(v37, 0.0);
      }
      else
      {
        v38 = v32;
        v32 = v157[0];
      }
      v157[0] = v32;
      if (v155 == -1.79769313e308)
      {
        objc_msgSend((id)a1, "_viewSafeAreaInsetsFromScene", v155);
        v51 = fmax(v50, 0.0);
      }
      else
      {
        v51 = v36;
        v36 = v155;
      }
      v155 = v36;
      objc_msgSend((id)a1, "additionalSafeAreaInsets");
      objc_msgSend((id)a1, "_setContentOverlayInsets:andLeftMargin:rightMargin:", fmax(v30 + v52, 0.0), fmax(v38 + v53, 0.0), fmax(v34 + v54, 0.0), fmax(v51 + v55, 0.0), v157[0], v155);
      a1 = 1;
      goto LABEL_12;
    }
    objc_msgSend((id)a1, "additionalSafeAreaInsets");
    v40 = v30 + v39;
    v42 = v32 + v41;
    v138 = v34 + v43;
    v45 = v36 + v44;
    objc_msgSend(v21, "bounds");
    v133 = v48;
    v134 = v49;
    rect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    if (v46 == *MEMORY[0x1E0C9D538] && v47 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      rect.origin.x = v46;
    }
    else
    {
      v56 = -v46;
      v57 = -v47;
      v158.origin.x = x;
      v158.origin.y = y;
      v58 = v42;
      v59 = v45;
      v60 = v40;
      v61 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v158.size.width = width;
      v158.size.height = height;
      v159 = CGRectOffset(v158, v56, v57);
      x = v159.origin.x;
      y = v159.origin.y;
      width = v159.size.width;
      v47 = v61;
      v40 = v60;
      v45 = v59;
      v42 = v58;
      height = v159.size.height;
    }
    v132 = v47;
    v135 = fmax(v40, 0.0);
    v136 = fmax(v138, 0.0);
    v137 = fmax(v42, 0.0);
    v139 = fmax(v45, 0.0);
    if (qword_1EDDB0F90 != -1)
      dispatch_once(&qword_1EDDB0F90, &__block_literal_global_144);
    v62 = byte_1EDDB0F74;
    *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __121__UIViewController___updateContentOverlayInsetsWithOurRect_inBoundsOfAncestorViewController_viaImmediateChildOfAncestor___block_invoke;
    v141 = &unk_1E16C1E08;
    v142 = v19;
    v143 = a1;
    v130 = v20;
    v144 = v130;
    v63 = v13;
    v145 = v63;
    v154 = v62;
    v146 = x;
    v147 = y;
    v148 = width;
    v149 = height;
    v150 = rect.origin.x;
    v151 = v132;
    v152 = v133;
    v153 = v134;
    v131 = _Block_copy(&rect.origin.y);
    objc_msgSend(v21, "_screen");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "scale");
    v66 = -0.5 / v65;
    if (v66 == 0.0)
      v67 = 1.0;
    else
      v67 = v66;

    v160.origin.x = rect.origin.x;
    v160.origin.y = v132;
    v160.size.width = v133;
    v160.size.height = v134;
    v161 = CGRectInset(v160, v67, v67);
    v68 = v161.origin.x;
    v69 = v161.origin.y;
    v70 = v161.size.width;
    v71 = v161.size.height;
    v72 = fmin(v136, *(double *)(a1 + 888));
    v73 = fmin(v139, *(double *)(a1 + 896));
    v74 = fmin(v137, *(double *)(a1 + 880)) == v137;
    if (fmin(v135, *(double *)(a1 + 872)) != v135)
      v74 = 0;
    if (v73 != v139)
      v74 = 0;
    v75 = v72 == v136 && v74;
    v76 = v70;
    v77 = v71;
    v188.origin.x = x;
    v188.origin.y = y;
    v188.size.width = width;
    v188.size.height = height;
    v78 = CGRectIntersectsRect(v161, v188);
    if (!v62 && !v78)
    {
      if (!v75)
      {
        v90 = v131;
        (*((void (**)(void *, _QWORD, double, double, double, double))v131 + 2))(v131, 0, v135, v137, v136, v139);
        a1 = 1;
LABEL_89:

        goto LABEL_12;
      }
      a1 = 0;
LABEL_88:
      v90 = v131;
      goto LABEL_89;
    }
    v121 = *(double *)(a1 + 872);
    v122 = *(double *)(a1 + 880);
    v125 = *(_QWORD *)(a1 + 888);
    v128 = *(_QWORD *)(a1 + 896);
    objc_msgSend(v63, "_contentOverlayInsets");
    v124 = v79;
    v118 = v80;
    v119 = v81;
    v120 = v82;
    v162.origin.x = v68;
    v162.origin.y = v69;
    v162.size.width = v70;
    v162.size.height = v71;
    v189.origin.x = x;
    v189.origin.y = y;
    v189.size.width = width;
    v189.size.height = height;
    v123 = v75;
    if (CGRectContainsRect(v162, v189))
    {
      v83 = 1;
      v84 = 1;
      v85 = 1;
      v86 = 1;
      v87 = v121;
      v88 = v122;
      v89 = v124;
    }
    else
    {
      v163.origin.x = x;
      v163.origin.y = y;
      v163.size.width = width;
      v163.size.height = height;
      MinY = CGRectGetMinY(v163);
      v164.origin.x = v68;
      v164.origin.y = v69;
      v164.size.width = v70;
      v164.size.height = v71;
      if (MinY <= CGRectGetMinY(v164))
      {
        v109 = 0;
      }
      else
      {
        v165.origin.x = x;
        v165.origin.y = y;
        v165.size.width = width;
        v165.size.height = height;
        v111 = CGRectGetMinY(v165);
        v166.origin.x = v68;
        v166.origin.y = v69;
        v166.size.width = v70;
        v166.size.height = v71;
        v109 = v111 < CGRectGetMaxY(v166);
      }
      v167.origin.x = x;
      v167.origin.y = y;
      v167.size.width = width;
      v167.size.height = height;
      MinX = CGRectGetMinX(v167);
      v168.origin.x = v68;
      v168.origin.y = v69;
      v168.size.width = v70;
      v168.size.height = v71;
      if (MinX <= CGRectGetMinX(v168))
      {
        v85 = 0;
      }
      else
      {
        v169.origin.x = x;
        v169.origin.y = y;
        v169.size.width = width;
        v169.size.height = height;
        v113 = CGRectGetMinX(v169);
        v170.origin.x = v68;
        v170.origin.y = v69;
        v170.size.width = v70;
        v170.size.height = v71;
        v85 = v113 < CGRectGetMaxX(v170);
      }
      v171.origin.x = x;
      v171.origin.y = y;
      v171.size.width = width;
      v171.size.height = height;
      MaxY = CGRectGetMaxY(v171);
      v172.origin.x = v68;
      v172.origin.y = v69;
      v172.size.width = v70;
      v172.size.height = v71;
      if (MaxY <= CGRectGetMinY(v172))
      {
        v83 = 0;
      }
      else
      {
        v173.origin.x = x;
        v173.origin.y = y;
        v173.size.width = width;
        v173.size.height = height;
        v115 = CGRectGetMaxY(v173);
        v174.origin.x = v68;
        v174.origin.y = v69;
        v174.size.width = v70;
        v174.size.height = v71;
        v83 = v115 < CGRectGetMaxY(v174);
      }
      v175.origin.x = x;
      v175.origin.y = y;
      v175.size.width = width;
      v175.size.height = height;
      MaxX = CGRectGetMaxX(v175);
      v176.origin.x = v68;
      v176.origin.y = v69;
      v176.size.width = v70;
      v176.size.height = v71;
      if (MaxX <= CGRectGetMinX(v176))
      {
        v86 = 0;
      }
      else
      {
        v177.origin.x = x;
        v177.origin.y = y;
        v177.size.width = width;
        v177.size.height = height;
        v117 = CGRectGetMaxX(v177);
        v178.origin.x = v68;
        v178.origin.y = v69;
        v178.size.width = v70;
        v178.size.height = v71;
        v86 = v117 < CGRectGetMaxX(v178);
      }
      v87 = v121;
      v88 = v122;
      v89 = v124;
      v84 = v109;
    }
    v91 = v84 & v83;
    if (v62)
      v92 = 1;
    else
      v92 = v91;
    v93 = v85 && v86;
    if (v62)
      v94 = 1;
    else
      v94 = v93;
    objc_msgSend(v63, "_independentContainedScrollViewIntermediateToDescendantViewController:", a1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v95;
    if (v95 && (objc_msgSend(v95, "isDescendantOfView:", v130) & 1) == 0)
    {
      v99 = objc_msgSend(v98, "_edgesPropagatingSafeAreaInsetsToSubviews");
      v96.n128_u64[0] = v125;
      v97.n128_u64[0] = v128;
      if ((v99 & 5) == 0)
      {
        v96.n128_f64[0] = v136;
        v87 = v135;
        v92 = 0;
      }
      if ((v99 & 0xA) != 0)
      {
        v94 = v94;
      }
      else
      {
        v97.n128_f64[0] = v139;
        v88 = v137;
        v94 = 0;
      }
    }
    else
    {
      v96.n128_u64[0] = v125;
      v97.n128_u64[0] = v128;
    }
    a1 = !v123 | v92 | v94;
    if ((_DWORD)a1 != 1)
    {
LABEL_87:

      goto LABEL_88;
    }
    if (!v123)
    {
      v88 = v137;
      v97.n128_f64[0] = v139;
      v87 = v135;
      v96.n128_f64[0] = v136;
    }
    if (v92)
    {
      v129 = v97.n128_u64[0];
      v179.origin.x = x;
      v179.origin.y = y;
      v179.size.width = width;
      v179.size.height = height;
      v100 = fmax(v89, 0.0) - CGRectGetMinY(v179);
      v180.origin.x = rect.origin.x;
      v180.origin.y = v132;
      v180.size.width = v133;
      v180.size.height = v134;
      v101 = fmax(v120, 0.0) - CGRectGetMaxY(v180);
      v181.origin.x = x;
      v181.origin.y = y;
      v181.size.width = width;
      v181.size.height = height;
      v102 = v101 + CGRectGetMaxY(v181);
      if (v62)
      {
        v87 = v135 + fmax(fmin(v100, v124), 0.0);
        v96.n128_f64[0] = v136 + fmax(fmin(v102, v120), 0.0);
        v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
        v97.n128_u64[0] = v129;
        if ((v94 & 1) == 0)
          goto LABEL_86;
        goto LABEL_81;
      }
      v87 = v135 + fmax(v100, 0.0);
      v96.n128_f64[0] = v136 + fmax(v102, 0.0);
      v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
      v97.n128_u64[0] = v129;
      if ((v94 & 1) != 0)
        goto LABEL_84;
    }
    else
    {
      if ((v94 & 1) != 0)
      {
        v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
        if (v62)
        {
LABEL_81:
          v126 = v96.n128_u64[0];
          v182.origin.x = x;
          v182.origin.y = y;
          v182.size.width = width;
          v182.size.height = height;
          v88 = v137 + fmax(fmin(fmax(v118, 0.0) - CGRectGetMinX(v182), v118), 0.0);
          v183.origin.x = rect.origin.x;
          v183.origin.y = v132;
          v183.size.width = v133;
          v183.size.height = v134;
          v104 = fmax(v119, 0.0) - CGRectGetMaxX(v183);
          v184.origin.x = x;
          v184.origin.y = y;
          v184.size.width = width;
          v184.size.height = height;
          v105 = CGRectGetMaxX(v184);
          v96.n128_u64[0] = v126;
          v106 = fmax(fmin(v104 + v105, v119), 0.0);
LABEL_85:
          v97.n128_f64[0] = v139 + v106;
          goto LABEL_86;
        }
LABEL_84:
        v127 = v96.n128_u64[0];
        v185.origin.x = x;
        v185.origin.y = y;
        v185.size.width = width;
        v185.size.height = height;
        v88 = v137 + fmax(fmax(v118, 0.0) - CGRectGetMinX(v185), 0.0);
        v186.origin.x = rect.origin.x;
        v186.origin.y = v132;
        v186.size.width = v133;
        v186.size.height = v134;
        v107 = fmax(v119, 0.0) - CGRectGetMaxX(v186);
        v187.origin.x = x;
        v187.origin.y = y;
        v187.size.width = width;
        v187.size.height = height;
        v108 = CGRectGetMaxX(v187);
        v96.n128_u64[0] = v127;
        v106 = fmax(v107 + v108, 0.0);
        goto LABEL_85;
      }
      v103 = (void (**)(void *, uint64_t, double, double, __n128, __n128))v131;
    }
LABEL_86:
    v103[2](v103, v94, v87, v88, v96, v97);
    goto LABEL_87;
  }
LABEL_13:

  return a1;
}

- (uint64_t)_shouldSkipContentOverlayInsetsUpdate
{
  uint64_t v1;
  void *v2;
  char v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v1 = (uint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    if ((objc_msgSend((id)objc_opt_class(), "_wantsContentOverlayInsetsUpdatesWhileDismissing") & 1) == 0)
      v3 = objc_msgSend(v2, "_wantsContentOverlayInsetsUpdatesWhileDismissing") ^ 1;
    v4 = objc_msgSend((id)v1, "_appearState");
    if (!v4 || v4 == 3 && (v3 & 1) != 0 || (objc_msgSend((id)v1, "_transitioningOutWithoutDisappearing") & 1) != 0)
    {
      v1 = 1;
LABEL_22:

      return v1;
    }
    objc_msgSend((id)v1, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    if (v5)
      objc_msgSend(v5, "transform");
    if (_UIViewDirtiesDelegateContentInsetsForGeometryChange())
    {
      objc_msgSend((id)v1, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (objc_msgSend((id)v1, "presentedViewController"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        v9[0] = v10;
        v9[1] = v11;
        v9[2] = v12;
        if (_transformIsSupportedForSimpleContainment((double *)v9))
        {
LABEL_20:
          v1 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
    }
    if (v6)
    {
      v1 = 1;
      if (*((double *)&v10 + 1) != *(double *)(MEMORY[0x1E0C9BAA8] + 8)
        || *(double *)&v11 != *(double *)(MEMORY[0x1E0C9BAA8] + 16)
        || fabs(*(double *)&v10) != *MEMORY[0x1E0C9BAA8]
        || fabs(*((double *)&v11 + 1)) != *(double *)(MEMORY[0x1E0C9BAA8] + 24))
      {
        goto LABEL_21;
      }
    }
    goto LABEL_20;
  }
  return v1;
}

- (int)_appearState
{
  return (*(_DWORD *)&self->_viewControllerFlags >> 1) & 3;
}

- (NSArray)childViewControllers
{
  void *v3;

  if (-[NSMutableArray count](self->_childViewControllers, "count"))
    v3 = (void *)-[NSMutableArray copy](self->_childViewControllers, "copy");
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v3;
}

- (id)_rootAncestorViewControllerInWindow:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;

  if (a1)
  {
    objc_msgSend(a1, "_nonModalAncestorViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      do
      {
        if (a2 && (objc_msgSend(v5, "_isRootViewController") & 1) != 0)
          break;
        objc_msgSend(v5, "_parentModalViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
          break;
        objc_msgSend(v5, "_parentModalViewController");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
      }
      while (v7);
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v5, "parentViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8 && (v9 = (void *)v8, v10 = dyld_program_sdk_at_least(), v9, (v10 & 1) != 0))
    {
      objc_msgSend(v5, "_rootAncestorViewController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v5;
    }
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (UITraitCollection)traitCollection
{
  UITraitCollection *frozenTraitCollection;
  UITraitCollection *v3;
  _BYTE *TraitCollectionTSD;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UITraitCollection *v10;
  void *v11;

  frozenTraitCollection = self->_frozenTraitCollection;
  if (!frozenTraitCollection)
  {
    TraitCollectionTSD = GetTraitCollectionTSD();
    v6 = TraitCollectionTSD[9];
    TraitCollectionTSD[9] = 1;
    -[UIViewController _parentTraitEnvironment](self, "_parentTraitEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "_traitCollectionForChildEnvironment:", self);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (dyld_program_sdk_at_least())
      {
        v10 = self->_lastNotifiedTraitCollection;
        if (!v10)
        {
          UIViewControllerMissingInitialTraitCollection(self);
          v10 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, v10);
        }
        goto LABEL_10;
      }
      +[UITraitCollection _defaultTraitCollection]();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (UITraitCollection *)v9;
LABEL_10:
    -[UIViewController _traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:](self, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v11);
    v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();

    *((_BYTE *)GetTraitCollectionTSD() + 9) = v6;
    _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v3);

    return v3;
  }
  v3 = frozenTraitCollection;
  return v3;
}

- (id)_parentTraitEnvironment
{
  int v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIViewController *v10;
  id v11;
  id v12;
  id v13;

  v3 = _UIViewControllersInheritTraitsFromViewHierarchy();
  v4 = v3;
  if (v3)
  {
    if (!self)
      goto LABEL_12;
    if (qword_1EDDB0FB8 != -1)
      dispatch_once(&qword_1EDDB0FB8, &__block_literal_global_353);
    if (!byte_1EDDB0F76)
    {
LABEL_12:
      -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", 1, 1, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentedViewController");
      v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v10 == self)
      {
        v13 = v9;
      }
      else
      {
        v11 = -[UIView superview](self->_view, "superview");
        if (v11)
        {
          v12 = v11;
          while ((objc_msgSend(v12, "_canBeParentTraitEnvironment") & 1) == 0)
          {
            v12 = (id)objc_msgSend(v12, "superview");
            if (!v12)
              goto LABEL_17;
          }
          v13 = v12;
        }
        else
        {
LABEL_17:
          if ((v4 & 1) != 0)
          {
            v8 = 0;
LABEL_23:

            return v8;
          }
          -[UIViewController _window](self, "_window");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v8 = v13;
      goto LABEL_23;
    }
    -[UIViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || (objc_msgSend(v5, "window"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {

      goto LABEL_12;
    }

  }
  -[UIViewController parentViewController](self, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[UIViewController _departingParentViewController](self, "_departingParentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_12;
  }
  return v8;
}

- (id)_existingPresentationControllerImmediate:(char)a3 effective:(int)a4 includesRoot:(char)a5 prefersRoot:
{
  id v5;
  void *v10;
  void *v11;
  void *v12;

  v5 = a1;
  if (a1)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(a1, "_parentModalViewController");
    else
      objc_msgSend(a1, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (!a4 || !objc_msgSend(v5, "_isRootViewController") || (a5 & 1) == 0)
      {
        if ((a3 & 1) != 0)
          objc_msgSend(v10, "_presentationController");
        else
          objc_msgSend(v10, "_originalPresentationController");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      if (!a2)
        goto LABEL_20;
    }
    else if (!a2 || (a4 & 1) == 0)
    {
      if (!a4)
        goto LABEL_16;
      goto LABEL_20;
    }
    objc_msgSend(v5, "parentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_16:
      v5 = 0;
LABEL_21:

      return v5;
    }
LABEL_20:
    objc_msgSend(v5, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_rootPresentationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  return v5;
}

- (UIViewController)_parentModalViewController
{
  return self->_parentModalViewController;
}

- (UIViewController)presentingViewController
{
  UIViewController *v3;
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;

  v3 = self->_parentModalViewController;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIViewController presentingViewController](self->_parentViewController, "presentingViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4 includesRoot:(BOOL)a5
{
  return -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:prefersRoot:](self, a3, a4, a5, 1);
}

- (UIViewController)presentedViewController
{
  void *v3;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIViewController presentedViewController](self->_parentViewController, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIViewController *)v3;
}

- (UIViewController)childModalViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSMutableArray lastObject](self->_childModalViewControllers, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIViewController *)v6;
}

- (id)_traitCollectionByApplyingLocalOverridesToTraitCollection:(uint64_t)a1
{
  void *v3;
  void **v4;
  uint64_t v5;
  _QWORD v7[5];

  if (!a1)
    return 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__UIViewController__traitCollectionByApplyingLocalOverridesToTraitCollection___block_invoke;
  v7[3] = &unk_1E16C1EA0;
  v7[4] = a1;
  -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](a2, (uint64_t)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void ***)(a1 + 408);
  if (v4)
  {
    -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)_traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v5 = 0;
    goto LABEL_15;
  }
  v5 = v3;
  objc_msgSend(a1, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "_departingParentViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "_traitOverridesForChildViewController:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[UITraitCollection _emptyTraitCollection]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v12, "isEqual:", v13);

        if ((v15 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
      -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v5, (uint64_t)v12, 0);
      v12 = v5;
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_14:

LABEL_15:
  return v5;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (UIViewController)_departingParentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__departingParentViewController);
}

- (id)_nonModalAncestorViewController
{
  return -[UIViewController _nonModalAncestorViewControllerStopAtIsPresentationContext:](self, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", 0);
}

- (BOOL)_isRootViewController
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 8) & 1;
}

- (id)_existingPresentationControllerImmediate:(BOOL)a3 effective:(BOOL)a4
{
  return -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", a3, a4, 0);
}

- (id)_traitOverridesForChildViewController:(id)a3
{
  return 0;
}

- (UIEdgeInsets)_contentOverlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentOverlayInsets.top;
  left = self->_contentOverlayInsets.left;
  bottom = self->_contentOverlayInsets.bottom;
  right = self->_contentOverlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_transitioningOutWithoutDisappearing
{
  return 0;
}

- (double)_contentMarginForChildViewController:(id)a3
{
  return self->_contentMargin;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  *a4 = 0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 0;
}

void __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setHorizontalSizeClass:", v3);
  objc_msgSend(v4, "setVerticalSizeClass:", *(_QWORD *)(a1 + 40));

}

- (id)nextResponder
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  void *v10;
  void *v11;
  UIViewController *v12;
  UIViewController *v13;
  UIViewController *parentModalViewController;
  id v15;
  void *v16;
  _BOOL4 v17;
  UIViewController *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIViewController *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  UIViewController *v28;
  UIViewController *v29;
  void *v30;
  void *v31;
  UIViewController *v32;
  UIViewController *v33;
  UIViewController *v34;
  UIViewController *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;

  v3 = _UIResponderCrossSceneResponderChainEnabled();
  -[UIResponder _nextResponderOverride](self, "_nextResponderOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (v4)
      goto LABEL_11;
    parentModalViewController = self->_parentModalViewController;
    v15 = -[UIViewController childModalViewController](self, "childModalViewController");
    if (v15)
    {
      -[UIViewController _popoverController](self, "_popoverController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        objc_msgSend(v16, "contentViewController");
        v18 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        v17 = v18 != self;

      }
    }
    else
    {
      v17 = 0;
    }
    if (parentModalViewController)
      v19 = 0;
    else
      v19 = !v17;
    if (v19)
    {
      v8 = 0;
      v6 = 0;
    }
    else
    {
      -[UIViewController _existingView](self, "_existingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (parentModalViewController)
      {
        -[UIViewController _existingView](parentModalViewController, "_existingView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21 || (objc_msgSend(v6, "isDescendantOfView:", v20) & 1) == 0)
        {
          v13 = parentModalViewController;

LABEL_53:
          goto LABEL_54;
        }

      }
    }
    if (v17)
    {
      objc_msgSend(v15, "_existingView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (!v8 || (objc_msgSend(v22, "isDescendantOfView:", v6) & 1) == 0)
      {
        v24 = self;
        -[UIViewController childModalViewController](v24, "childModalViewController");
        v25 = objc_claimAutoreleasedReturnValue();
        v40 = v23;
        if (v25)
        {
          v26 = (void *)v25;
          v27 = 0;
          v28 = 0;
          v29 = v24;
          do
          {
            objc_msgSend(v26, "_existingView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "window");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              v32 = v26;

              v28 = v32;
            }
            v24 = v26;

            -[UIViewController childModalViewController](v24, "childModalViewController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = v31;
            v29 = v24;
          }
          while (v26);
        }
        else
        {
          v28 = 0;
          v31 = 0;
        }
        if (v28)
          v34 = v28;
        else
          v34 = v24;
        v35 = v34;

        -[UIViewController _existingView](v35, "_existingView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "window");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          -[UIViewController view](v35, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "superview");
          v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

          goto LABEL_53;
        }

        v23 = v40;
      }

    }
    if (!-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      v13 = 0;
      goto LABEL_53;
    }
    -[UIView superview](self->_view, "superview");
    v33 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  if (!v4)
  {
    -[UIViewController _existingView](self, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _window](self, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_nextResponderIgnoresWindowIfRootVC
      || (objc_msgSend(v7, "rootViewController"),
          v9 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
          v9,
          v9 != self))
    {
      -[UIViewController parentModalViewController](self, "parentModalViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && !-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(v6, "_window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v6, "superview");
        else
          -[UIViewController parentViewController](self, "parentViewController");
        v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;

      goto LABEL_53;
    }
    v33 = v8;
LABEL_51:
    v13 = v33;
    goto LABEL_53;
  }
LABEL_11:
  v13 = v4;
LABEL_54:

  return v13;
}

- (UIRectEdge)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (BOOL)extendedLayoutIncludesOpaqueBars
{
  _BOOL8 v3;

  if (-[UIViewController _ancestorViewControllerIsInPopover](self, "_ancestorViewControllerIsInPopover"))
    LOBYTE(v3) = 0;
  else
    return (*(_QWORD *)&self->_viewControllerFlags >> 37) & 1;
  return v3;
}

- (NSMutableArray)mutableChildViewControllers
{
  return self->_childViewControllers;
}

- (BOOL)_isNestedNavigationController
{
  return 0;
}

- (double)_contentMargin
{
  return self->_contentMargin;
}

- (UISplitViewController)splitViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[UIViewController _popoverController](self, "_popoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "_splitParentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v6 = objc_opt_class();
    -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UISplitViewController *)v5;
}

- (BOOL)_ancestorViewControllerIsInPopover
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_popoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_popoverController
{
  id WeakRetained;
  void *v4;
  id v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    v6 = self->_parentViewController;
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v9 = self->_parentModalViewController;
      if (!v9)
      {
        v5 = 0;
        goto LABEL_7;
      }
      v7 = v9;
      if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != UIModalPresentationCurrentContext
        && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != UIModalPresentationOverCurrentContext
        && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != 18)
      {
        v5 = 0;
        goto LABEL_6;
      }
    }
    -[UIViewController _popoverController](v7, "_popoverController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  v5 = WeakRetained;
LABEL_7:

  return v5;
}

- (id)_rootAncestorViewController
{
  return -[UIViewController _rootAncestorViewControllerInWindow:](self, 0);
}

- (BOOL)_monitorsSystemLayoutFittingSize
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 42) & 1;
}

uint64_t __47__UIViewController__setPresentationController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setAppearanceIsInvalid:", 1);
}

- (id)_effectiveStatusBarHiddenViewController
{
  void *v3;
  void *v4;
  UIViewController *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveStatusBarHiddenViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    v6 = v5;
  }
  else
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || (objc_msgSend(v7, "_shouldPresentedViewControllerControlStatusBarAppearance") & 1) != 0
      || (objc_msgSend(v8, "presentedViewController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "modalPresentationCapturesStatusBarAppearance"),
          v9,
          v10))
    {
      -[UIViewController childViewControllerForStatusBarHidden](self, "childViewControllerForStatusBarHidden");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_effectiveStatusBarHiddenViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v5 = v12;
        v6 = v5;
      }
      else
      {
        v6 = self;
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }

  }
  return v6;
}

- (UIViewController)_presentedStatusBarViewController
{
  return self->_presentedStatusBarViewController;
}

- (int)_preferredStatusBarVisibility
{
  if (!objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_prefersStatusBarHidden))return -[UIViewController _defaultViewControllerStatusBarVisibilityBehavior]((uint64_t)self);
  if (-[UIViewController prefersStatusBarHidden](self, "prefersStatusBarHidden"))
    return 1;
  return 2;
}

- (uint64_t)_defaultViewControllerStatusBarVisibilityBehavior
{
  uint64_t v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (objc_msgSend((id)UIApp, "_wantsCompactStatusBarHiding"))
    {
      objc_msgSend((id)v1, "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "verticalSizeClass") == 1)
        v1 = 1;
      else
        v1 = 2;

    }
    else
    {
      return 2;
    }
  }
  return v1;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  return 0;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_LinkCheckViewControllerParentFocusEnvironment, (uint64_t)CFSTR("LinkCheckViewControllerParentFocusEnvironment"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger) & 1) == 0&& qword_1ECD760B8)
  {
    if (qword_1ECD760B8 > 0)
      return (UIFocusEnvironment *)v4;
  }
  else if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    return (UIFocusEnvironment *)v4;
  }
  if (!v4)
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_existingView");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = v6 ? (void *)v6 : v5;
    v4 = v8;

    if (!v4)
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_existingView");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v9;
      v4 = v12;

    }
  }
  return (UIFocusEnvironment *)v4;
}

- (NSDictionary)_previousFittingSizeInfo
{
  return (NSDictionary *)objc_getAssociatedObject(self, &_UIViewControllerFittingSizeInfo);
}

- (id)_parentContentContainer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIViewController _parentModalViewController](self, "_parentModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)_updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:(double *)a1
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int *v15;
  unint64_t v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  void *v30;
  double *v32;
  double *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_safeAreaInsetsFrozen");

  if ((v3 & 1) != 0)
    return;
  v4 = a1[109];
  v5 = a1[110];
  v6 = a1[111];
  v7 = a1[112];
  objc_msgSend(a1, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSafeAreaInsets:", v4, v5, v6, v7);

  v9 = a1;
  objc_msgSend(v9, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v10)
      goto LABEL_24;
    objc_msgSend(v9, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_nestedTopViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_searchControllerIfAllowed");
    v15 = (unsigned int *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = ((unint64_t)v15[261] >> 5) & 3;
      if (!(_DWORD)v16)
      {
        v17 = dyld_program_sdk_at_least();
        v16 = 2;
        if (!v17)
          v16 = 3;
      }
      if (v16 == 2)
        v11 = v15;

      if (v10 == v11)
      {
LABEL_24:
        v26 = 0;
        v18 = 0;
        v27 = 1;
        while (1)
        {
          v28 = v27;
          objc_msgSend(v9, "_contentOrObservableScrollViewForEdge:", qword_18667A220[v26]);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v29 && v18 == 0)
            break;
          if (v29)
            goto LABEL_32;
LABEL_40:

          v27 = 0;
          v26 = 1;
          if ((v28 & 1) == 0)
            goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        if ((objc_msgSend(v18, "containsObject:", v30) & 1) == 0)
          objc_msgSend(v18, "addObject:", v30);
        objc_msgSend(v30, "_viewControllerForAncestor");
        v32 = (double *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32 == v9
          || (objc_msgSend(v32, "navigationController"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "navigationController"),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              v35,
              v34,
              v34 == v35))
        {
          if (v33)
            v36 = objc_msgSend(v33, "automaticallyAdjustsScrollViewInsets");
          else
            v36 = 0;
          objc_msgSend(v30, "_setApplyVerticalSafeAreaInsetsToNonscrollingContent:", v36);
        }

        goto LABEL_40;
      }
    }
  }
  v18 = 0;
LABEL_13:

  if (v18)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v9, "view", (_QWORD)v37);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView _eagerlyUpdateSafeAreaInsetsToDescendant:](v25, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v21);
    }

  }
}

- (void)_updateContentOverlayInsetsFromParentIfNecessary
{
  UIEdgeInsets *p_contentOverlayInsets;
  double top;
  double left;
  double bottom;
  double right;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD *v19;
  _QWORD *v20;
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
  double v31;
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
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  char v48;
  UIView *view;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v76;
  void *v77;
  unint64_t v78;
  NSObject *v79;
  NSObject *v80;
  float64x2_t v81;
  float64x2_t v82;
  double v83;
  id v84;
  id v85;
  double v86;
  _BYTE buf[24];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least()
    && (-[UIViewController _shouldSkipContentOverlayInsetsUpdate](self) & 1) == 0)
  {
    p_contentOverlayInsets = &self->_contentOverlayInsets;
    top = self->_contentOverlayInsets.top;
    left = self->_contentOverlayInsets.left;
    bottom = self->_contentOverlayInsets.bottom;
    right = self->_contentOverlayInsets.right;
    if (!byte_1EDDB0F71)
    {
      if (qword_1EDDB1068 != -1)
        dispatch_once(&qword_1EDDB1068, &__block_literal_global_2331);
      if (!byte_1EDDB0F7A)
        goto LABEL_12;
    }
    if ((*(_QWORD *)&self->_viewControllerFlags & 0x20000000000000) == 0
      && (-[UIView superview](self->_view, "superview"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v9 = (void *)v8,
          v10 = -[UIViewController _isDetachedFromWindowRootViewControllerHierarchy](self, "_isDetachedFromWindowRootViewControllerHierarchy"), v9, v10))
    {
      if ((-[UIViewController _shouldSkipContentOverlayInsetsUpdate](self) & 1) != 0)
      {
        v11 = 0;
        v12 = 0;
LABEL_22:

        return;
      }
      -[UIView superview](self->_view, "superview");
      v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", sel___updateContentOverlayInsetsDirectlyFromSuperview, self, CFSTR("UIViewController.m"), 1656, CFSTR("Can't update contentOverlayInsets directly from superview because _view.superview is unexpectedly nil. self = %@, _view = %@"), self, self->_view);

      }
      view = self->_view;
      -[UIView frame](view, "frame");
      v54 = -[UIView _safeAreaInsetsForFrame:inSuperview:ignoreViewController:]((uint64_t)view, v20, 1, v50, v51, v52, v53);
      v56 = v55;
      v58 = v57;
      v60 = v59;
      -[UIViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
      v83 = v54 + v61;
      v63 = v56 + v62;
      v65 = v58 + v64;
      v67 = v60 + v66;
      v68 = 0.0;
      if (-[UIViewController ignoresParentMargins](self, "ignoresParentMargins"))
      {
        objc_msgSend((id)objc_opt_class(), "_horizontalContentMarginForView:", self->_view);
        v68 = v69;
      }
      v70 = p_contentOverlayInsets->top;
      v71 = self->_contentOverlayInsets.bottom;
      v72 = self->_contentOverlayInsets.right;
      if (self->_contentOverlayInsets.left != v63 || v70 != v83 || v72 != v67 || v71 != v65)
      {
        -[UIView window](self->_view, "window", v70, v83, v71, v72);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "_noteOverlayInsetsDidChange");

      }
      -[UIView _shouldReverseLayoutDirection](self->_view, "_shouldReverseLayoutDirection");
      v81 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom;
      v82 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.top;
      self->_systemMinimumLayoutMargins.top = 0.0;
      self->_systemMinimumLayoutMargins.leading = v68;
      self->_systemMinimumLayoutMargins.bottom = 0.0;
      self->_systemMinimumLayoutMargins.trailing = v68;
      if ((*(_QWORD *)&self->_viewControllerFlags & 0x20000000000000) != 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_fault_impl(&dword_185066000, v80, OS_LOG_TYPE_FAULT, "Unexpectedly trying to update contentOverlayInsets directly from superview for UIViewController subclass that overrides -_setContentOverlayInsets. self = %@", buf, 0xCu);
          }

        }
        else
        {
          v78 = qword_1EDDB0FA0;
          if (!qword_1EDDB0FA0)
          {
            v78 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v78, (unint64_t *)&qword_1EDDB0FA0);
          }
          v79 = *(NSObject **)(v78 + 8);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_185066000, v79, OS_LOG_TYPE_ERROR, "Unexpectedly trying to update contentOverlayInsets directly from superview for UIViewController subclass that overrides -_setContentOverlayInsets. self = %@", buf, 0xCu);
          }
        }
      }
      p_contentOverlayInsets->top = v83;
      self->_contentOverlayInsets.left = v63;
      self->_contentOverlayInsets.bottom = v65;
      self->_contentOverlayInsets.right = v67;
      -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)self);
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v82, *(float64x2_t *)&self->_systemMinimumLayoutMargins.top), (int32x4_t)vceqq_f64(v81, *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom))), 0xFuLL))) & 1) == 0)-[UIView _updateInferredLayoutMargins](self->_view, "_updateInferredLayoutMargins");
      v11 = 0;
      v12 = 0;
    }
    else
    {
LABEL_12:
      v84 = 0;
      v85 = 0;
      v13 = -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&self->super.super.isa, &v85, &v84);
      v12 = v85;
      v11 = v84;
      if (v13)
      {
        if (!objc_msgSend(v12, "isViewLoaded"))
          goto LABEL_22;
        -[UIViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "_ignoresLayerTransformForSafeAreaInsets"))
          objc_msgSend(v14, "_frameIgnoringLayerTransform");
        else
          objc_msgSend(v14, "frame");
        v38 = v15;
        v39 = v16;
        v40 = v17;
        v41 = v18;
        if ((*(_QWORD *)&self->_viewControllerFlags & 0x10000000000000) == 0)
        {
          objc_msgSend(v12, "view");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "superview");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "convertRect:fromView:", v43, v38, v39, v40, v41);
          v38 = v44;
          v39 = v45;
          v40 = v46;
          v41 = v47;

        }
        v48 = -[UIViewController __updateContentOverlayInsetsWithOurRect:inBoundsOfAncestorViewController:viaImmediateChildOfAncestor:]((unint64_t)self, v12, v11, v38, v39, v40, v41);

        if ((v48 & 1) == 0)
          goto LABEL_22;
        goto LABEL_21;
      }
      -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
      v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v86 = 0.0;
      *(_QWORD *)buf = 0;
      if (v19)
      {
        objc_msgSend(v19, "_baseContentInsetsWithLeftMargin:rightMargin:", buf, &v86);
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
      }
      else
      {
        -[UIViewController _existingView](self, "_existingView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _window](self, "_window");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = _UIPresentationControllerBaseContentInsetsForControllersAndViewInWindow(0, self, v29, v30, buf, &v86);
        v24 = v31;
        v26 = v32;
        v28 = v33;

      }
      -[UIViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
      -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v22 + v34, v24 + v35, v26 + v36, v28 + v37, *(double *)buf, v86);
      -[UIViewController _setContentMargin:](self, "_setContentMargin:", *(double *)buf);
    }

LABEL_21:
    -[UIViewController _invalidateChildContentOverlayInsetsWithOldInsets:]((double *)self, top, left, bottom, right);
    goto LABEL_22;
  }
}

void __78__UIViewController__traitCollectionByApplyingLocalOverridesToTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(void);

  v37 = a2;
  v5 = a3;
  v37[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (_UIIsPrivateMainBundle())
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "preferredUserInterfaceStyle");
    if (v8)
    {
      v9 = v8;
      if (v7 != v8)
      {
        v5[2](v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setUserInterfaceStyle:", v9);

        v7 = v9;
      }
    }
  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "overrideUserInterfaceStyle");
  if (v11)
  {
    v12 = v11;
    if (v7 != v11)
    {
      v5[2](v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUserInterfaceStyle:", v12);

    }
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "_overrideHorizontalSizeClass");
  if (v14)
  {
    v15 = v14;
    v37[2]();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "horizontalSizeClass");

    if (v17 != v15)
    {
      v5[2](v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHorizontalSizeClass:", v15);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_vibrancy");

    if (v22 != -1)
    {
      v37[2]();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "_valueForNSIntegerTraitToken:", 0x1E1A996A8);

      if (v22 > v24)
      {
        v5[2](v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_setNSIntegerValue:forTraitToken:", v22, 0x1E1A996A8);

      }
    }
  }
  v26 = objc_msgSend(*(id *)(a1 + 32), "_overrideUserInterfaceRenderingMode");
  if (v26)
  {
    v27 = v26;
    v37[2]();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_valueForNSIntegerTraitToken:", 0x1E1A996C0);

    if (v29 != v27)
    {
      v5[2](v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_setNSIntegerValue:forTraitToken:", v27, 0x1E1A996C0);

    }
  }
  v37[2]();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForTrait:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EDDB1070[0] != -1)
    dispatch_once(qword_1EDDB1070, &__block_literal_global_2339);
  if ((byte_1EDDB0F7B & 1) == 0 && !v33)
  {
    objc_msgSend(*(id *)(a1 + 32), "_backdropBarGroupName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v5[2](v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forTrait:", v34, v36);

    }
  }

}

- (UIWindow)_window
{
  void *v3;
  void *v4;
  UIViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  UIViewController *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[UIViewController isViewLoaded](self, "isViewLoaded")
    || (-[UIViewController view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    -[UIViewController _rootAncestorViewControllerInWindow:](self, 1);
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (-[UIViewController isViewLoaded](v5, "isViewLoaded"))
    {
      -[UIViewController view](v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    if (UIApp)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v12, "rootViewController");
            v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

            if (v13 == v5)
            {
              v14 = v12;

              v4 = v14;
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_17:

    }
    if (!v4)
    {
      if (v5 == self)
      {
        v4 = 0;
      }
      else
      {
        -[UIViewController _window](v5, "_window");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  return (UIWindow *)v4;
}

- (id)_existingView
{
  return self->_view;
}

- (UIView)view
{
  -[UIViewController loadViewIfRequired](self, "loadViewIfRequired");
  return (UIView *)-[UIViewController _existingView](self, "_existingView");
}

- (void)loadViewIfRequired
{
  UITraitCollection *v3;
  UITraitCollection *v4;
  void *v5;
  UITraitCollection *v6;
  UITraitCollection *lastNotifiedTraitCollection;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  NSArray *v24;
  NSArray *storyboardSegueTemplates;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD block[5];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!self->_view)
  {
    if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x80) == 0)
    {
      v3 = self->_lastNotifiedTraitCollection;
      if (dyld_program_sdk_at_least() && v3)
      {
        v4 = v3;
        v5 = (void *)_UISetCurrentFallbackEnvironment(v4);
        -[UIViewController loadView](self, "loadView");
        _UIRestorePreviousFallbackEnvironment(v5);

      }
      else
      {
        if (!v3 && dyld_program_sdk_at_least())
        {
          UIViewControllerMissingInitialTraitCollection(self);
          v6 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
          lastNotifiedTraitCollection = self->_lastNotifiedTraitCollection;
          self->_lastNotifiedTraitCollection = v6;

        }
        -[UIViewController loadView](self, "loadView");
      }

      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 1);
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 0);
      -[UIViewController _window](self, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && -[UIViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_willChangeToIdiom:onScreen:", objc_msgSend(v9, "_userInterfaceIdiom"), v9);
        -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v10)
          objc_msgSend(v11, "_willChangeToIdiom:onScreen:", objc_msgSend(v9, "_userInterfaceIdiom"), v9);

      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[UIViewController storyboardSegueTemplates](self, "storyboardSegueTemplates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            if (objc_msgSend(v17, "performOnViewLoad"))
              v18 = (id)objc_msgSend(v17, "perform:", self);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v14);
      }

      if (-[NSArray count](self->_storyboardPreviewingRegistrants, "count"))
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v19 = self->_storyboardPreviewingRegistrants;
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v42 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "registerForPreviewing", (_QWORD)v41);
            }
            v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v21);
        }

      }
      if (-[NSArray count](self->_storyboardCommitSegueTemplates, "count", (_QWORD)v41))
      {
        -[NSArray arrayByAddingObjectsFromArray:](self->_storyboardSegueTemplates, "arrayByAddingObjectsFromArray:", self->_storyboardCommitSegueTemplates);
        v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
        storyboardSegueTemplates = self->_storyboardSegueTemplates;
        self->_storyboardSegueTemplates = v24;

      }
      if (dyld_program_sdk_at_least())
      {
        if (-[UIView translatesAutoresizingMaskIntoConstraints](self->_view, "translatesAutoresizingMaskIntoConstraints"))
        {
          -[UIView _setHostsLayoutEngine:](self->_view, "_setHostsLayoutEngine:", 1);
        }
      }
      -[UIViewController _sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled](self);
      -[UIViewController searchDisplayController](self, "searchDisplayController");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_47;
      v27 = (void *)v26;
      -[UIViewController searchDisplayController](self, "searchDisplayController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "displaysSearchBarInNavigationBar"))
      {
        -[UIViewController navigationController](self, "navigationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "navigationBar");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "topItem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController searchDisplayController](self, "searchDisplayController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "navigationItem");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31 == v33)
        {
LABEL_47:

          return;
        }
        -[UIViewController navigationController](self, "navigationController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "navigationBar");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "items");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "indexOfObject:", self->_navigationItem);

        if (v36 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_46:

          goto LABEL_47;
        }
        objc_msgSend(v27, "setLocked:", 0);
        objc_msgSend(v27, "items");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v37, "mutableCopy");

        v38 = objc_msgSend(v28, "indexOfObject:", self->_navigationItem);
        -[UIViewController searchDisplayController](self, "searchDisplayController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "navigationItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "replaceObjectAtIndex:withObject:", v38, v40);

        objc_msgSend(v27, "setItems:animated:", v28, 0);
        objc_msgSend(v27, "setLocked:", 1);
        objc_msgSend(v27, "setNeedsDisplay");
      }

      goto LABEL_46;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__UIViewController_loadViewIfRequired__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    if (loadViewIfRequired_once != -1)
      dispatch_once(&loadViewIfRequired_once, block);
  }
}

- (BOOL)isViewLoaded
{
  return self->_view != 0;
}

- (int64_t)_overrideUserInterfaceRenderingMode
{
  return ((unint64_t)*((unsigned __int16 *)&self->_viewControllerFlags + 4) >> 2) & 3;
}

- (int64_t)_overrideHorizontalSizeClass
{
  return *((_WORD *)&self->_viewControllerFlags + 4) & 3;
}

- (UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  return *(_QWORD *)&self->_viewControllerFlags >> 62;
}

- (UIUserInterfaceStyle)preferredUserInterfaceStyle
{
  return 0;
}

- (uint64_t)_getViewControllerToInheritInsetsFrom:(_QWORD *)a3 viaImmediateChild:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a1)
    return 0;
  v6 = a1[13];
  v7 = v6;
  if (v6)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v6);
    if (a3)
      *a3 = objc_retainAutorelease(a1);
    v8 = 1;
  }
  else
  {
    objc_msgSend(a1, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:](v11, a2, a3);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_nonModalAncestorViewControllerStopAtIsPresentationContext:(BOOL)a3
{
  _BOOL4 v3;
  UIViewController *parentViewController;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *v8;
  UIViewController *v9;
  BOOL v10;
  UIViewController *v11;

  v3 = a3;
  parentViewController = self;
  if (!a3)
    parentViewController = self->_parentViewController;
  v6 = parentViewController;
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      v8 = v7->_parentViewController;
      if (!v8)
        break;
      v9 = v8;
      if (v3)
      {
        v10 = -[UIViewController definesPresentationContext](v7, "definesPresentationContext");

        if (v10)
          return v7;
      }
      else
      {

      }
      v11 = v7->_parentViewController;

      v7 = v11;
      if (!v11)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v7 = self;
  }
  return v7;
}

- (id)_parentViewController
{
  if (a1)
    a1 = (id *)a1[13];
  return a1;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalSafeAreaInsets.top;
  left = self->_additionalSafeAreaInsets.left;
  bottom = self->_additionalSafeAreaInsets.bottom;
  right = self->_additionalSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_invalidateChildContentOverlayInsetsWithOldInsets:(double)a3
{
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "_existingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setViewDelegateContentOverlayInsetsAreClean:", 1);

    v11 = a3 == a1[110] && a2 == a1[109];
    v12 = v11 && a5 == a1[112];
    if (!v12 || a4 != a1[111])
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(a1, "childViewControllers", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v21 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "_existingView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_setViewDelegateContentOverlayInsetsAreClean:", 0);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v16);
      }

    }
  }
}

uint64_t __121__UIViewController___updateContentOverlayInsetsWithOurRect_inBoundsOfAncestorViewController_viaImmediateChildOfAncestor___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double v34;

  v33 = 0.0;
  v34 = 0.0;
  if (!a2)
  {
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(double *)(v13 + 512);
    v34 = v14;
    v15 = *(double *)(v13 + 520);
LABEL_12:
    v33 = v15;
    return objc_msgSend(*(id *)(a1 + 40), "_setContentOverlayInsets:andLeftMargin:rightMargin:", a3, a4, a5, a6, v14, v15, *(_QWORD *)&v33, *(_QWORD *)&v34);
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 56), "_leftContentMargin");
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 56), "_rightContentMargin");
    v19 = v18;
    v20 = *(unsigned __int8 *)(a1 + 128);
    v21 = fmax(v17, 0.0) - CGRectGetMinX(*(CGRect *)(a1 + 64));
    v22 = fmax(v19, 0.0);
    if (v20)
    {
      v14 = fmax(fmin(v21, v17), 0.0);
      v34 = v14;
      v23 = v22 - CGRectGetMaxX(*(CGRect *)(a1 + 96));
      v24 = fmin(v23 + CGRectGetMaxX(*(CGRect *)(a1 + 64)), v19);
    }
    else
    {
      v14 = fmax(v21, 0.0);
      v34 = v14;
      v31 = v22 - CGRectGetMaxX(*(CGRect *)(a1 + 96));
      v24 = v31 + CGRectGetMaxX(*(CGRect *)(a1 + 64));
    }
    v15 = fmax(v24, 0.0);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "_existingPresentationControllerImmediate:effective:", 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_baseContentInsetsWithLeftMargin:rightMargin:", &v34, &v33);
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_window");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPresentationController _statusBarOverlapAndMarginInfoForView:inWindow:](UIPresentationController, "_statusBarOverlapAndMarginInfoForView:inWindow:", v25, v26);
    v28 = v27;
    v30 = v29;

    v33 = v30;
    v34 = v28;
  }

  v15 = v33;
  v14 = v34;
  return objc_msgSend(*(id *)(a1 + 40), "_setContentOverlayInsets:andLeftMargin:rightMargin:", a3, a4, a5, a6, v14, v15, *(_QWORD *)&v33, *(_QWORD *)&v34);
}

- (double)_leftContentMargin
{
  return self->_leftContentMargin;
}

- (double)_rightContentMargin
{
  return self->_rightContentMargin;
}

- (BOOL)_isDetachedFromWindowRootViewControllerHierarchy
{
  void *v3;
  UIViewController *v4;
  void *v5;

  if ((-[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&self->super.super.isa, 0, 0) & 1) != 0)return 0;
  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    return 0;
  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 == 0;
}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 38) & 1;
}

- (NSArray)storyboardSegueTemplates
{
  return self->_storyboardSegueTemplates;
}

- (void)_sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = (void *)_UISetCurrentFallbackEnvironment(result);
    if (__isObjectTaggingEnabled == 1)
    {
      __isObjectTaggingEnabled = 0;
      objc_msgSend(v1, "viewDidLoad");
      __isObjectTaggingEnabled = 1;
    }
    else
    {
      objc_msgSend(v1, "viewDidLoad");
    }
    return (void *)_UIRestorePreviousFallbackEnvironment(v2);
  }
  return result;
}

- (void)_updateChildContentMargins
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_childViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_setContentMargin:", self->_contentMargin, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __54__UIViewController__windowForAutorotationBelowWindow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v3, "level"), v5 > *(double *)(a1 + 40)))
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "_shouldControlAutorotation");

  return v6;
}

- (BOOL)_providesCustomBasePresentationInsets
{
  return 0;
}

- (void)updateViewConstraints
{
  int v3;
  UIView *view;

  v3 = _UIObservationTrackingEnabled();
  view = self->_view;
  if (v3)
    -[UIView _updateConstraintsWithObservationTracking](view, "_updateConstraintsWithObservationTracking");
  else
    -[UIView updateConstraints](view, "updateConstraints");
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  UIViewController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UIViewController *v13;
  UIViewController *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  UIViewController *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  UIViewController *v30;
  void *v31;
  _BOOL4 v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _OWORD v43[2];
  uint64_t v44;
  _BYTE block[24];
  void *v46;
  _BYTE v47[10];
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  if (v4)
  {
    -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)v4, (uint64_t)v5, (uint64_t)v43);
  }
  else
  {
    +[UITraitCollection _emptyTraitCollection]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITraitCollection _createTraitTokenSetForChangesFromTraitCollection:]((uint64_t)v6, (uint64_t)v5, (uint64_t)v43);

  }
  if ((*(_QWORD *)&self->_viewControllerFlags & 0x2000000000000000) != 0
    && _UIShouldApplyTraitStorageRecordsForTraitChanges((uint64_t)v43))
  {
    -[NSObject _applyTraitStorageRecordsForTraitCollection:](self, "_applyTraitStorageRecordsForTraitCollection:", v5);
  }
  if (objc_msgSend(v4, "verticalSizeClass") == 1 && objc_msgSend(v5, "verticalSizeClass") == 2)
  {
    -[UIViewController _window](self, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      goto LABEL_26;
    -[UIViewController _effectiveStatusBarHiddenViewController](v8, "_effectiveStatusBarHiddenViewController");
    v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v9 == self)
    {
      -[UIViewController traitCollection](v8, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "verticalSizeClass");

      if (v11 != 2)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self;
      while (1)
      {
        v42 = 0;
        -[UIViewController _getViewControllerToInheritInsetsFrom:viaImmediateChild:]((id *)&v13->super.super.isa, &v42, 0);
        v14 = (UIViewController *)v42;

        if (!v14)
          break;
        objc_msgSend(v12, "addObject:", v14);

        v13 = v14;
        if (v14 == v8)
        {
          v14 = v8;
          break;
        }
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v9 = v12;
      v17 = -[UIViewController countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v39 != v19)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "_updateContentOverlayInsetsFromParentIfNecessary", (_QWORD)v38);
          }
          v18 = -[UIViewController countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        }
        while (v18);
      }

    }
LABEL_26:

    v21 = v4;
    v22 = v5;
    if (!self)
      goto LABEL_36;
    goto LABEL_27;
  }
  v15 = v4;
  v16 = v5;
LABEL_27:
  v23 = objc_msgSend(v5, "userInterfaceStyle", (_QWORD)v38);
  if (v23 != objc_msgSend(v4, "userInterfaceStyle")
    && -[UIViewController preferredStatusBarStyle](self, "preferredStatusBarStyle") == UIStatusBarStyleDefault)
  {
    -[UIView window](self->_view, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rootViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_effectiveStatusBarStyleViewController");
    v26 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v26 == self)
      goto LABEL_33;
  }
  v27 = objc_msgSend(v5, "verticalSizeClass");
  if (v27 != objc_msgSend(v4, "verticalSizeClass"))
  {
    if (objc_msgSend((id)UIApp, "_wantsCompactStatusBarHiding"))
    {
      -[UIView window](self->_view, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rootViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_effectiveStatusBarHiddenViewController");
      v30 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v30 == self)
      {
LABEL_33:
        if (pthread_main_np() == 1)
        {
          -[UIViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
        }
        else
        {
          *(_QWORD *)block = MEMORY[0x1E0C809B0];
          *(_QWORD *)&block[8] = 3221225472;
          *(_QWORD *)&block[16] = __105__UIViewController__invalidateStatusBarAppearanceIfNeededForChangeFromTraitCollection_toTraitCollection___block_invoke;
          v46 = &unk_1E16B1B28;
          *(_QWORD *)v47 = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
    }
  }
LABEL_36:

  if ((!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    && -[UIViewController _needsAutomaticContentUnavailableConfigurationUpdates]((uint64_t)self))
  {
    -[UIViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
  }
  if (v4)
    -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v43, self, v4);
  if (*(_QWORD *)&v43[0])

  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v31, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

  if (v32)
  {
    v33 = _traitCollectionDidChange____s_category;
    if (!_traitCollectionDidChange____s_category)
    {
      v33 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v33, (unint64_t *)&_traitCollectionDidChange____s_category);
    }
    v34 = *(NSObject **)(v33 + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = v34;
      NSStringFromSelector(sel_traitCollectionDidChange_);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", v4, v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 138413314;
      *(_QWORD *)&block[4] = v36;
      *(_WORD *)&block[12] = 2112;
      *(_QWORD *)&block[14] = self;
      *(_WORD *)&block[22] = 2112;
      v46 = v37;
      *(_WORD *)v47 = 2112;
      *(_QWORD *)&v47[2] = v4;
      v48 = 2112;
      v49 = v5;
      _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", block, 0x34u);

    }
  }
  -[UIViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", v4, (_QWORD)v38);

}

- (void)_setNeedsUpdateContentUnavailableConfiguration
{
  id v3;

  *((_WORD *)&self->_viewControllerFlags + 4) |= 0x10u;
  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIViewController _performContentUnavailableConfigurationStateUpdate]((uint64_t)self);
    }
    else
    {
      -[UIViewController view](self, "view");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setNeedsLayout");

    }
  }
}

void __86__UIViewController_window_willAnimateRotationToInterfaceOrientation_duration_newSize___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (id)traitOverrides
{
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v4;
  _UITraitOverrides *v5;

  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (BOOL)__isKindOfUIViewController
{
  return 1;
}

- (void)_executeAfterAppearanceBlock
{
  void (**v3)(void);

  if (self->_afterAppearance)
  {
    *(_QWORD *)&self->_viewControllerFlags |= 0x40000000uLL;
    -[UIViewController afterAppearanceBlock](self, "afterAppearanceBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    -[UIViewController setAfterAppearanceBlock:](self, "setAfterAppearanceBlock:", 0);
    *(_QWORD *)&self->_viewControllerFlags &= ~0x40000000uLL;
  }
}

- (id)afterAppearanceBlock
{
  return _Block_copy(self->_afterAppearance);
}

void __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3 andLeftMargin:(double)a4 rightMargin:(double)a5
{
  CGFloat right;
  double bottom;
  CGFloat left;
  double top;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  BOOL v21;
  UIView *view;
  float64x2_t *p_safeAreaInsets;
  float64x2_t v24;
  float64x2_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  void *v46;
  char v47;
  double leftContentMargin;
  double rightContentMargin;
  float64x2_t v50;
  float64x2_t v51;
  void *v52;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIViewController _existingView](self, "_existingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v12;
  if (v12)
  {
    UIRoundToViewScale(v12);
    top = v13;
    UIRoundToViewScale(v52);
    left = v14;
    UIRoundToViewScale(v52);
    bottom = v15;
    UIRoundToViewScale(v52);
    right = v16;
  }
  v18 = *(float64x2_t *)&self->_contentOverlayInsets.top;
  v17 = *(float64x2_t *)&self->_contentOverlayInsets.bottom;
  v21 = left == self->_contentOverlayInsets.left
     && top == v18.f64[0]
     && right == self->_contentOverlayInsets.right
     && bottom == v17.f64[0];
  if (!v21
    || self->_leftContentMargin != a4
    || self->_rightContentMargin != a5
    || ((view = self->_view) == 0
      ? (v24 = 0uLL, v25 = 0uLL)
      : (p_safeAreaInsets = (float64x2_t *)&view->_safeAreaInsets, v24 = *p_safeAreaInsets, v25 = p_safeAreaInsets[1]),
        (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v24, v18), (int32x4_t)vceqq_f64(v25, v17)))), 0xFuLL))) & 1) != 0))
  {
    if (a4 == -1.79769313e308)
    {
      -[UIViewController _viewSafeAreaInsetsFromScene](self, "_viewSafeAreaInsetsFromScene");
      v27 = fmax(v26, 0.0);
    }
    else
    {
      v27 = left;
      left = a4;
    }
    if (a5 == -1.79769313e308)
    {
      -[UIViewController _viewSafeAreaInsetsFromScene](self, "_viewSafeAreaInsetsFromScene");
      v29 = fmax(v28, 0.0);
    }
    else
    {
      v29 = right;
      right = a5;
    }
    v30 = -[UIViewController ignoresParentMargins](self, "ignoresParentMargins");
    if (v52)
    {
      if (v30)
      {
        objc_msgSend((id)objc_opt_class(), "_horizontalContentMarginForView:", v52);
        right = v31;
        left = v31;
      }
      else
      {
        UIRoundToViewScale(v52);
        left = v35;
        UIRoundToViewScale(v52);
        right = v36;
      }
      v37 = self->_contentOverlayInsets.top;
      if (self->_contentOverlayInsets.left == v27
        && v37 == top
        && self->_contentOverlayInsets.right == v29
        && self->_contentOverlayInsets.bottom == bottom)
      {
LABEL_43:
        -[UIViewController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", top, v27, bottom, v29);
        objc_msgSend(v52, "_setViewDelegateContentOverlayInsetsAreClean:", 1);
        self->_leftContentMargin = left;
        self->_rightContentMargin = right;
        -[NSLayoutConstraint setConstant:](self->_topBarInsetGuideConstraint, "setConstant:", top);
        -[NSLayoutConstraint setConstant:](self->_bottomBarInsetGuideConstraint, "setConstant:", bottom);
        v50 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom;
        v51 = *(float64x2_t *)&self->_systemMinimumLayoutMargins.top;
        v41 = objc_msgSend(v52, "_shouldReverseLayoutDirection");
        if (v41)
          v42 = 520;
        else
          v42 = 512;
        if (v41)
          v43 = 512;
        else
          v43 = 520;
        v44 = *(double *)((char *)&self->super.super.isa + v43);
        v45 = *(double *)((char *)&self->super.super.isa + v42);
        self->_systemMinimumLayoutMargins.top = 0.0;
        self->_systemMinimumLayoutMargins.leading = v45;
        self->_systemMinimumLayoutMargins.bottom = 0.0;
        self->_systemMinimumLayoutMargins.trailing = v44;
        -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)self);
        if (-[UIViewController viewRespectsSystemMinimumLayoutMargins](self, "viewRespectsSystemMinimumLayoutMargins")
          && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v51, *(float64x2_t *)&self->_systemMinimumLayoutMargins.top), (int32x4_t)vceqq_f64(v50, *(float64x2_t *)&self->_systemMinimumLayoutMargins.bottom))), 0xFuLL))) & 1) == 0)
        {
          objc_msgSend(v52, "_updateInferredLayoutMargins");
        }
        goto LABEL_52;
      }
      objc_msgSend(v52, "window", v37);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_noteOverlayInsetsDidChange");
    }
    else
    {
      if (!v30)
        goto LABEL_43;
      v32 = (void *)objc_opt_class();
      -[UIViewController traitCollection](self, "traitCollection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_slimHorizontalContentMarginForTraitCollection:", v33);
      right = v34;
      left = v34;
    }

    goto LABEL_43;
  }
LABEL_52:
  v46 = v52;
  if (v52)
  {
    v47 = dyld_program_sdk_at_least();
    v46 = v52;
    if ((v47 & 1) == 0)
    {
      leftContentMargin = self->_leftContentMargin;
      rightContentMargin = self->_rightContentMargin;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v52, "_setDefaultLayoutMargins:", 0.0, leftContentMargin, 0.0, rightContentMargin);
      else
        objc_msgSend(v52, "setLayoutMargins:", 0.0, leftContentMargin, 0.0, rightContentMargin);
      v46 = v52;
    }
  }

}

- (UIEdgeInsets)_minimumLayoutMarginsForView
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = -[UIViewController viewRespectsSystemMinimumLayoutMargins](self, "viewRespectsSystemMinimumLayoutMargins");
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
    -[UIViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins", 0.0, 0.0, 0.0, 0.0);
  result.right = v5;
  result.bottom = v4;
  result.left = v6;
  result.top = v7;
  return result;
}

- (BOOL)viewRespectsSystemMinimumLayoutMargins
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 51) & 1;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_systemMinimumLayoutMargins.top;
  leading = self->_systemMinimumLayoutMargins.leading;
  bottom = self->_systemMinimumLayoutMargins.bottom;
  trailing = self->_systemMinimumLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)_setContentMargin:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;

  if (-[UIViewController ignoresParentMargins](self, "ignoresParentMargins"))
  {
    -[UIViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "_horizontalContentMarginForView:", v5);
      a3 = v8;
    }
    else
    {
      -[UIViewController traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_slimHorizontalContentMarginForTraitCollection:", v9);
      a3 = v10;

    }
  }
  if (vabdd_f64(self->_contentMargin, a3) > 2.22044605e-16)
  {
    self->_contentMargin = a3;
    -[UIViewController _updateChildContentMargins](self, "_updateChildContentMargins");
  }
}

- (BOOL)ignoresParentMargins
{
  return self->_ignoresParentMargins;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  self->_contentOverlayInsets = a3;
}

- (UIPresentationController)activePresentationController
{
  return (UIPresentationController *)-[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4;
  NSMutableArray *childViewControllers;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((_UIViewControllersInheritTraitsFromViewHierarchy() & 1) != 0
    || (childViewControllers = self->_childViewControllers) == 0
    || -[NSMutableArray indexOfObjectIdenticalTo:](childViewControllers, "indexOfObjectIdenticalTo:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewController overrideTraitCollectionForChildViewController:](self, "overrideTraitCollectionForChildViewController:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    -[UIViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_traitCollectionWithParentTraitCollection:overrideTraitCollection:", v10, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (UITraitCollection)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController
{
  return (UITraitCollection *)-[NSMapTable objectForKey:](self->_overrideTraitCollectionsForChildren, "objectForKey:", childViewController);
}

+ (id)_traitCollectionWithParentTraitCollection:(id)a3 overrideTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5 && a4)
  {
    -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v5, (uint64_t)a4, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)_shouldSendLegacyMethodsFromViewWillTransitionToSize
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:", sel_viewWillTransitionToSize_withTransitionCoordinator_) ^ 1;
}

- (UIViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  NSString *v6;
  NSBundle *v7;
  UIViewController *v8;
  uint64_t v9;
  NSString *nibName;
  int v11;
  uint64_t v12;
  objc_super v14;

  v6 = nibNameOrNil;
  v7 = nibBundleOrNil;
  v14.receiver = self;
  v14.super_class = (Class)UIViewController;
  v8 = -[UIViewController init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    nibName = v8->_nibName;
    v8->_nibName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_nibBundle, nibBundleOrNil);
    -[UIViewController _populateInitialTraitCollection]((uint64_t)v8);
    -[UIViewController _doCommonSetup]((uint64_t)v8);
    v8->_edgesForExtendedLayout = 15;
    *(_QWORD *)&v8->_viewControllerFlags |= 0x4000000000uLL;
    -[UIViewController setDefinesPresentationContext:](v8, "setDefinesPresentationContext:", -[UIViewController _isPresentationContextByDefault](v8, "_isPresentationContextByDefault"));
    *(_QWORD *)&v8->_viewControllerFlags |= 0x8000000000000uLL;
    v8->_modalTransitionStyle = _UIViewControllerDefaultModalTransitionStyle(v8);
    v11 = dyld_program_sdk_at_least();
    v12 = -2;
    if (!v11)
      v12 = 0;
    v8->_modalPresentationStyle = v12;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
    CFAutorelease(v8);

  return v8;
}

- (void)setDefinesPresentationContext:(BOOL)definesPresentationContext
{
  uint64_t v3;

  v3 = 0x40000;
  if (!definesPresentationContext)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (void)_populateInitialTraitCollection
{
  uint64_t v2;
  void *v3;

  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection _fallbackTraitCollection]();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 488);
    *(_QWORD *)(a1 + 488) = v2;

  }
}

- (BOOL)_isPresentationContextByDefault
{
  return 0;
}

- (void)_setViewAppearState:(uint64_t)a3 isAnimating:
{
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  int v60;
  int v61;
  char v62;

  if (!a1)
    return;
  if ((*(_QWORD *)(a1 + 368) & 0x8000000) == 0)
  {
    objc_msgSend((id)a1, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend((id)a1, "isPerformingModalTransition") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend((id)a1, "childModalViewController");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        objc_msgSend((id)a1, "childModalViewController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "modalPresentationStyle");

        if (v34 == 3)
        {
          objc_msgSend((id)a1, "childModalViewController");
          v56 = (id)objc_claimAutoreleasedReturnValue();
          -[UIViewController _setViewAppearState:isAnimating:](v56, a2, a3);

          return;
        }
LABEL_7:
        v8 = *(_DWORD *)(a1 + 368);
        v9 = objc_msgSend((id)a1, "_forwardAppearanceMethods");
        if (v9)
        {
          objc_msgSend((id)a1, "_existingView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        if ((_DWORD)a2 == 1)
        {
          v54 = v10;
          *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 368) & 0xFFFFFFFFFFDFFFF9 | 0x200002;
          v11 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
          if ((a3 & 1) != 0 && -[UIViewController _shouldTrackAppearStateChange]((void *)a1))
          {
            objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)a1, "_effectiveInteractionActivityTrackingBaseName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringByAppendingString:", CFSTR("-Appearing"));
            v14 = v8;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "beginActivityWithOptions:reason:", 0x200000000000, v15);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = *(void **)(a1 + 248);
            *(_QWORD *)(a1 + 248) = v16;

            v8 = v14;
          }
          else
          {
            v12 = *(void **)(a1 + 248);
            *(_QWORD *)(a1 + 248) = 0;
          }

          objc_msgSend((id)a1, "viewWillAppear:", a3);
          objc_msgSend((id)a1, "_embeddedDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend((id)a1, "_embeddedDelegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "viewController:viewWillAppear:", a1, a3);

          }
          *(_QWORD *)(a1 + 368) |= 0x80000000000000uLL;
          v27 = *(void **)(a1 + 496);
          if (!v27
            || (objc_msgSend(v27, "presentedViewController"),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                v29 = objc_msgSend(v28, "_hasAppeared"),
                v28,
                !v29))
          {
            v10 = v54;
            goto LABEL_42;
          }
          objc_msgSend(*(id *)(a1 + 496), "containerView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setNeedsLayout");
          v10 = v54;
        }
        else
        {
          -[UIViewController __viewIsAppearing:skipWindowCheck:](a1, a3, 1);
          *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 368) & 0xFFFFFFFFFFFFFFF9 | (2 * (a2 & 3)) | 0x200000;
          v11 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
          if ((_DWORD)a2)
          {
            if ((_DWORD)a2 == 2)
            {
              if (*(_QWORD *)(a1 + 248))
              {
                objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "endActivity:", *(_QWORD *)(a1 + 248));

                v39 = *(void **)(a1 + 248);
                *(_QWORD *)(a1 + 248) = 0;

              }
              objc_msgSend((id)a1, "viewDidAppear:", a3);
              objc_msgSend((id)a1, "_embeddedDelegate");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v40)
                goto LABEL_42;
              objc_msgSend((id)a1, "_embeddedDelegate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "viewController:viewDidAppear:", a1, a3);
            }
            else
            {
              if ((_DWORD)a2 != 3)
                goto LABEL_42;
              if ((_DWORD)a3 && -[UIViewController _shouldTrackAppearStateChange]((void *)a1))
              {
                objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)a1, "_effectiveInteractionActivityTrackingBaseName");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "stringByAppendingString:", CFSTR("-Disappearing"));
                v55 = v11;
                v20 = v10;
                v21 = v8;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "beginActivityWithOptions:reason:", 0x200000000000, v22);
                v23 = objc_claimAutoreleasedReturnValue();
                v24 = *(void **)(a1 + 248);
                *(_QWORD *)(a1 + 248) = v23;

                v8 = v21;
                v10 = v20;
                v11 = v55;

              }
              else
              {
                v18 = *(void **)(a1 + 248);
                *(_QWORD *)(a1 + 248) = 0;
              }

              objc_msgSend((id)a1, "viewWillDisappear:", a3);
              objc_msgSend((id)a1, "_embeddedDelegate");
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v41)
                goto LABEL_42;
              objc_msgSend((id)a1, "_embeddedDelegate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "viewController:viewWillDisappear:", a1, a3);
            }
          }
          else
          {
            if (*(_QWORD *)(a1 + 248))
            {
              objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "endActivity:", *(_QWORD *)(a1 + 248));

              v36 = *(void **)(a1 + 248);
              *(_QWORD *)(a1 + 248) = 0;

            }
            objc_msgSend((id)a1, "viewDidDisappear:", a3);
            objc_msgSend((id)a1, "_embeddedDelegate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v37)
              goto LABEL_42;
            objc_msgSend((id)a1, "_embeddedDelegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "viewController:viewDidDisappear:", a1, a3);
          }
        }

LABEL_42:
        _UIRestorePreviousFallbackEnvironment(v11);
        v42 = *(_QWORD *)(a1 + 368);
        *(_QWORD *)(a1 + 368) = v42 & 0xFFFFFFFFFFDFFFFFLL;
        if ((a2 & 0xFFFFFFFD) == 0 && (v42 & 0x10000000) != 0)
        {
          objc_msgSend((id)a1, "parentViewController");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "didMoveToParentViewController:", v43);

        }
        if (v9)
        {
          if (objc_msgSend((id)a1, "childViewControllersCount"))
          {
            objc_msgSend((id)a1, "childViewControllers");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __52__UIViewController__setViewAppearState_isAnimating___block_invoke;
          v58[3] = &unk_1E16C1F10;
          v60 = (v8 >> 1) & 3;
          v61 = a2;
          v62 = a3;
          v59 = v10;
          objc_msgSend(v44, "enumerateObjectsUsingBlock:", v58);

        }
        goto LABEL_51;
      }
    }

    goto LABEL_7;
  }
LABEL_51:
  v45 = *(_QWORD **)(a1 + 32);
  if (v45)
  {
    v46 = v45[13];
    if ((v46 & 0x400000000000000) != 0)
    {
      if ((_DWORD)a2 != 3 && (_DWORD)a2)
      {
        if ((*(_QWORD *)(a1 + 368) & 0x100000000) != 0)
        {
          objc_msgSend(v45, "_setNeedsUpdateConstraints");
          *(_QWORD *)(a1 + 368) &= ~0x100000000uLL;
        }
      }
      else
      {
        if ((v46 & 0x100000000000) == 0)
        {
          objc_msgSend(v45, "_constraintsExceptingSubviewAutoresizingConstraints");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

          if (v48)
            *(_QWORD *)(a1 + 368) |= 0x100000000uLL;
        }
        if ((dyld_program_sdk_at_least() & 1) == 0)
        {
          objc_msgSend((id)a1, "navigationController");
          v57 = (id)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v57, "needsDeferredTransition");
          v50 = v57;
          if ((v49 & 1) == 0)
          {
            objc_msgSend(v57, "view");
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              if ((*(_QWORD *)(v51 + 104) & 0x60000000000000) == 0)
              {
                v52 = *(_QWORD *)(v51 + 112);
                v53 = *(_DWORD *)(v51 + 120);
                *(_QWORD *)(v51 + 104) |= 0x40000000000000uLL;
                *(_QWORD *)(v51 + 112) = v52;
                *(_DWORD *)(v51 + 120) = v53;
              }
            }

            v50 = v57;
          }

        }
      }
    }
  }
}

- (_UIViewControllerContentViewEmbedding)_embeddedDelegate
{
  return self->__embeddedDelegate;
}

- (void)__viewIsAppearing:(char)a3 skipWindowCheck:
{
  uint64_t v5;
  __int16 v6;
  void *v7;
  void *v8;
  unint64_t v9;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 368);
    v6 = *(_WORD *)(a1 + 376);
    if ((v5 & 0x80000000000000) == 0 || (a3 & 1) != 0)
    {
      if ((v5 & 0x80000000000000) == 0)
        return;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        return;
      v5 = *(_QWORD *)(a1 + 368);
      v6 = *(_WORD *)(a1 + 376);
    }
    *(_QWORD *)(a1 + 368) = v5 & 0xFF7FFFFFFFFFFFFFLL;
    *(_WORD *)(a1 + 376) = v6;
    if ((v5 & 0x8000000) == 0)
    {
      v8 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      v9 = *(_QWORD *)(a1 + 368);
      if (dyld_program_sdk_at_least())
        *(_QWORD *)(a1 + 368) |= 0x100000000000000uLL;
      -[UIViewController _executeViewIsAppearingBlock:](a1, a2);
      objc_msgSend((id)a1, "viewIsAppearing:", a2);
      *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 368) & 0xFEFFFFFFFFFFFFFFLL | ((HIBYTE(v9) & 1) << 56);
      _UIRestorePreviousFallbackEnvironment(v8);
    }
  }
}

- (BOOL)_forwardAppearanceMethods
{
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_shouldAutomaticallyForwardAppearanceMethods))return -[UIViewController shouldAutomaticallyForwardAppearanceMethods](self, "shouldAutomaticallyForwardAppearanceMethods");
  else
    return -[UIViewController automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers](self, "automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers");
}

- (BOOL)containmentSupport
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 20) & 1;
}

- (BOOL)isPerformingModalTransition
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 4) & 1;
}

- (unint64_t)childViewControllersCount
{
  return -[NSMutableArray count](self->_childViewControllers, "count");
}

- (void)_doCommonSetup
{
  id v2;
  void *v3;
  int v4;
  uint64_t *v5;
  __int16 v6;
  uint64_t v7;
  void *v8;
  __int16 v9;
  _QWORD block[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v2;

  if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_systemLayoutFittingSizeDidChangeForChildContentContainer_) & 1) != 0|| objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_systemLayoutFittingSizeDidChangeForChildViewController_))
  {
    *(_QWORD *)(a1 + 368) |= 0x40000000000uLL;
  }
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_contentScrollView))
    *(_QWORD *)(a1 + 368) |= 0x200000000000000uLL;
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__setContentOverlayInsets_))*(_QWORD *)(a1 + 368) |= 0x20000000000000uLL;
  v4 = objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_contentScrollViewForEdge_);
  v5 = (uint64_t *)(a1 + 368);
  v6 = *(_WORD *)(a1 + 376);
  v7 = *(_QWORD *)(a1 + 368);
  if (v4)
    v7 = *v5 | 0x400000000000000;
  *v5 = v7 & 0x3FFFFFFFFFFFFFFFLL;
  *(_WORD *)(a1 + 376) = v6 & 0xFFF0;
  objc_msgSend((id)a1, "_setAllowsAutorotation:", 1);
  objc_msgSend((id)objc_opt_class(), "defaultFormSheetSize");
  objc_msgSend((id)a1, "_setFormSheetSize:");
  *(_QWORD *)(a1 + 368) |= 0x100000uLL;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np() == 1 && (objc_msgSend((id)UIApp, "_isHandlingMemoryWarning") & 1) == 0)
  {
    objc_msgSend((id)qword_1EDDB0F88, "addObject:", a1);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__UIViewController__doCommonSetup__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (qword_1EDDB0FB0 != -1)
    dispatch_once(&qword_1EDDB0FB0, &__block_literal_global_244_0);
  objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel_applicationWillSuspend, CFSTR("UIApplicationSuspendedNotification"), UIApp);
  objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel_applicationDidResume, CFSTR("UIApplicationResumedNotification"), UIApp);
  objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel_applicationWantsViewsToDisappear, CFSTR("UIApplicationWantsViewsToDisappearNotification"), UIApp);
  objc_msgSend(v8, "addObserver:selector:name:object:", a1, sel_accessibilityLargeTextDidChange, CFSTR("UIAccessibilityLargeTextChangedNotification"), UIApp);
  -[UIViewController _inferLayoutGuidesFromSubviews](a1);
  -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:](a1, 1);
  -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:](a1, 0);
  v9 = *(_WORD *)(a1 + 376) & 0xFFDF;
  *(_QWORD *)(a1 + 368) &= 0xFFFFFE7FFFFFFFFFLL;
  *(_WORD *)(a1 + 376) = v9;
  if (-[UIViewController _needsAutomaticContentUnavailableConfigurationUpdates](a1))
    *(_WORD *)(a1 + 376) |= 0x10u;

}

+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3 inBaseClass:(Class)a4
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation((Class)a1, a3);
  return MethodImplementation != class_getMethodImplementation(a4, a3);
}

+ (BOOL)doesOverrideViewControllerMethod:(SEL)a3
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", a3, objc_opt_class());
}

- (void)_setUpLayoutGuideConstraintIfNecessaryAtTop:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = 12;
    if (a2)
      v4 = 11;
    v5 = *(id *)(a1 + OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v4]);
    v6 = v5;
    if (*(_QWORD *)(a1 + 32))
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      goto LABEL_32;
    if (a2)
      v8 = 6;
    else
      v8 = 7;
    v9 = *(id *)(a1 + OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v8]);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "container");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v10, "container");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(void **)(a1 + 32);

        if (v13 != v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__setUpLayoutGuideConstraintIfNecessaryAtTop_, a1, CFSTR("UIViewController.m"), 2732, CFSTR("Unexpected: The view changed out from under the guide constraint"));

        }
LABEL_31:

LABEL_32:
        return;
      }
      v15 = CFSTR("bottom");
      if (a2)
        v15 = CFSTR("top");
      NSLog(CFSTR("The %@ layout guide length constraint unexpectedly lost its container. Did the application remove all constraints from the view controller's view (which would be an app error)?"), v15);
      v16 = OBJC_IVAR___UIViewController__lastNotifiedTraitCollection[v8];
      v17 = *(void **)(a1 + v16);
      *(_QWORD *)(a1 + v16) = 0;

    }
    v28 = v8 * 4;
    v18 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides](a1);
    objc_msgSend(v6, "nsli_superitem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);

    if (v19 != v20)
    {
      v21 = *(void **)(a1 + 32);
      if (v18)
      {
        objc_msgSend(v21, "addSubview:", v6);
      }
      else
      {
        objc_msgSend(v21, "addLayoutGuide:", v6);
        objc_msgSend(v6, "_setLockedToOwningView:", 1);
      }
    }
    if (a2)
      v22 = 3;
    else
      v22 = 4;
    +[_UILayoutSupportConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UILayoutSupportConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, v22, 0, *(_QWORD *)(a1 + 32), v22, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UILayoutSupportConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](_UILayoutSupportConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 0, 0, 0, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(a1 + 32);
    v29[0] = v10;
    v29[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addConstraints:", v25);

    v26 = (double *)(a1 + 872);
    if (!a2)
      v26 = (double *)(a1 + 888);
    objc_msgSend(v10, "setConstant:", *v26);
    objc_storeStrong((id *)(a1 + *(int *)((char *)OBJC_IVAR___UIViewController__lastNotifiedTraitCollection + v28)), v10);
    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "_is_layout");

    goto LABEL_31;
  }
}

- (void)_inferLayoutGuidesFromSubviews
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  int *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  char v23;
  int *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id obja;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "layoutGuides");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v37 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v7 = v6;
          else
            v7 = 0;
          v8 = v7;
          objc_msgSend(v8, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_UIViewControllerTop"));
          v11 = &OBJC_IVAR___UIViewController__topLayoutGuide;
          if ((v10 & 1) != 0
            || (v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("_UIViewControllerBottom")),
                v11 = &OBJC_IVAR___UIViewController__bottomLayoutGuide,
                v12))
          {
            v13 = *v11;
            v14 = v8;
            v8 = *(id *)(a1 + v13);
            *(_QWORD *)(a1 + v13) = v14;
          }
          else
          {
            v14 = 0;
          }

          objc_msgSend(v14, "_constraintsToRemoveAtRuntime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v15);
            objc_msgSend(v14, "_setConstraintsToRemoveAtRuntime:", 0);
          }

        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v3);
    }

    if (!*(_QWORD *)(a1 + 536) && !*(_QWORD *)(a1 + 544))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "subviews");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(obja);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = v20;
              objc_msgSend(v21, "_archivedIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("_UIViewControllerTop"));

              v24 = &OBJC_IVAR___UIViewController__topLayoutGuide;
              if ((v23 & 1) != 0
                || (objc_msgSend(v21, "_archivedIdentifier"),
                    v25 = (void *)objc_claimAutoreleasedReturnValue(),
                    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("_UIViewControllerBottom")),
                    v25,
                    v24 = &OBJC_IVAR___UIViewController__bottomLayoutGuide,
                    v26))
              {
                objc_storeStrong((id *)(a1 + *v24), v20);
                *(_QWORD *)(a1 + 368) |= 0x100000000000uLL;
                objc_msgSend(v21, "_constraintsToRemoveAtRuntime");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27)
                {
                  v28 = *(void **)(a1 + 32);
                  objc_msgSend(v21, "_constraintsToRemoveAtRuntime");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "removeConstraints:", v29);

                  objc_msgSend(v21, "_setConstraintsToRemoveAtRuntime:", 0);
                }
              }

            }
          }
          v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v17);
      }

    }
  }
}

- (uint64_t)_needsAutomaticContentUnavailableConfigurationUpdates
{
  if (result)
  {
    if (*(_QWORD *)(result + 600)
      || (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__bridgedUpdateContentUnavailableConfigurationUsingState_) & 1) != 0|| (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_updateContentUnavailableConfigurationUsingState_) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__updateContentUnavailableConfigurationUsingState_);
    }
  }
  return result;
}

- (void)_setFormSheetSize:(CGSize)a3
{
  self->_formSheetSize = a3;
}

- (void)_setAllowsAutorotation:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFEFFFLL | v3;
}

+ (CGSize)defaultFormSheetSize
{
  void *v2;
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
  CGSize result;

  +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSheetMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "defaultFormSheetSizeForScreenSize:", v5, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unint64_t)__supportedInterfaceOrientations
{
  void *v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  UIViewController *v24;
  UIViewController *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  _BOOL4 v34;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "_windowCanDynamicallySpecifySupportedInterfaceOrientations"))
  {
    v5 = 30;
    goto LABEL_47;
  }
  v4 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
    || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet
    || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPageSheet;
  if (-[UIViewController _ignoreAppSupportedOrientations](self, "_ignoreAppSupportedOrientations"))
  {
    v6 = 30;
  }
  else
  {
    v7 = (void *)UIApp;
    -[UIViewController _window](self, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_supportedInterfaceOrientationsForWindow:", v8);
    if (v9)
      v6 = v9;
    else
      v6 = 30;

  }
  -[UIViewController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_originalPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_presentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController presentingViewController](self, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v4;
  else
    v16 = 1;
  if ((v16 & 1) != 0 || v11 == v13)
  {
    v23 = (v14 == 0) ^ v16;

    if ((v23 & 1) != 0)
      goto LABEL_22;
LABEL_24:
    v24 = self;
    goto LABEL_25;
  }
  -[UIViewController presentingViewController](self, "presentingViewController");
  v17 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    goto LABEL_24;
  }
  v18 = v17;
  objc_msgSend(v17, "_window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_traitCollectionWhenRotated");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18[95], "_shouldAdaptFromTraitCollection:toTraitCollection:", v20, v21);

  if ((v22 & 1) == 0)
    goto LABEL_24;
LABEL_22:
  -[UIViewController presentingViewController](self, "presentingViewController");
  v24 = (UIViewController *)objc_claimAutoreleasedReturnValue();
LABEL_25:
  v25 = v24;
  v26 = -[UIViewController supportedInterfaceOrientations](v24, "supportedInterfaceOrientations");
  if (!-[UIViewController _overrideInterfaceOrientationMechanics](v25, "_overrideInterfaceOrientationMechanics"))
  {
    -[UIViewController _viewControllersWhoseOrientationsMustCoincide](v25, "_viewControllersWhoseOrientationsMustCoincide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v36 = v6;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        v32 = v26;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            v32 &= objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "supportedInterfaceOrientations");
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v30);
      }
      else
      {
        v32 = v26;
      }
      if (v32)
        v26 = v32;
      v6 = v36;
    }

  }
  v34 = v26 == 0;
  v5 = v26 & v6;
  if (v5)
    v34 = 1;
  if (!v34
    && !v4
    && -[UIViewController shouldAutorotate](self, "shouldAutorotate")
    && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIApplicationInvalidInterfaceOrientation"), CFSTR("Supported orientations has no common orientation with the application, and [%@ shouldAutorotate] is returning YES"), objc_opt_class());
  }

LABEL_47:
  return v5;
}

- (UIModalPresentationStyle)modalPresentationStyle
{
  UIModalPresentationStyle modalPresentationStyle;
  void *v4;
  void *v5;
  void *v6;

  modalPresentationStyle = self->_modalPresentationStyle;
  if (modalPresentationStyle == UIModalPresentationAutomatic)
  {
    modalPresentationStyle = -[UIViewController _preferredModalPresentationStyle](self, "_preferredModalPresentationStyle");
    if (modalPresentationStyle == UIModalPresentationAutomatic)
    {
      -[UIViewController preferredTransition](self, "preferredTransition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4
        || (modalPresentationStyle = objc_msgSend(v4, "_preferredModalPresentationStyle"),
            modalPresentationStyle == UIModalPresentationAutomatic))
      {
        +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        modalPresentationStyle = objc_msgSend(v6, "defaultConcretePresentationStyleForViewController:", self);

      }
    }
  }
  return modalPresentationStyle;
}

- (int64_t)_preferredModalPresentationStyle
{
  return -2;
}

- (void)_updateTraitsIfNecessarySchedulingPropagation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;

  if (a1)
  {
    objc_msgSend((id)a1, "_parentModalViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateTraitsIfNecessary");

    objc_msgSend((id)a1, "_parentModalViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_originalPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateTraitsIfNecessary");

    objc_msgSend((id)a1, "_temporaryPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateTraitsIfNecessary");

    objc_msgSend((id)a1, "traitCollection");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 488);
    if (v9 != obj && (objc_msgSend(obj, "isEqual:", v9) & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 488), obj);
      v10 = (void *)_UISetCurrentFallbackEnvironment((void *)a1);
      +[UITraitCollection _currentTraitCollectionIfExists]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", obj);
      objc_msgSend((id)a1, "_traitCollectionDidChange:", v9);
      +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v11);
      _UIRestorePreviousFallbackEnvironment(v10);
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        _UIViewInvalidateTraitCollectionAndSchedulePropagation(v12, a2);

    }
  }
}

- (UIPresentationController)_temporaryPresentationController
{
  return self->_temporaryPresentationController;
}

- (int64_t)_overrideInterfaceOrientationMechanics
{
  return 0;
}

- (BOOL)_ignoreAppSupportedOrientations
{
  return self->_ignoreAppSupportedOrientations;
}

- (id)_viewControllersWhoseOrientationsMustCoincide
{
  void *v3;
  void *v4;
  UIModalPresentationStyle v5;
  UIModalPresentationStyle v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle");
  if (v3)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2;
    if (v6 == 17 || v6 == UIModalPresentationOverFullScreen)
      goto LABEL_13;
    if (v6)
      goto LABEL_12;
    objc_msgSend(v3, "_existingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v7 = 1;

    if (!v7)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    _viewControllersWhoseOrientationsMustCoincide(self, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_executeViewIsAppearingBlock:(uint64_t)a1
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = _Block_copy(*(const void **)(a1 + 312));
    if (v4)
    {
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
      do
      {
        v6 = *(void **)(a1 + 312);
        *(_QWORD *)(a1 + 312) = 0;

        v5[2](v5, a1, a2);
        v7 = _Block_copy(*(const void **)(a1 + 312));

        v5 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
      }
      while (v7);
    }
  }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
  __int16 v3;
  void *v4;
  void *v5;
  $3DCA1FCAFF514FD0F5EDC0B2943CCDEC *p_viewControllerFlags;
  UIInterfaceOrientationMask v7;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  if (!-[UIViewController _defersToPresentingViewControllerForSupportedInterfaceOrientations](self, "_defersToPresentingViewControllerForSupportedInterfaceOrientations"))return -[UIViewController _defaultSupportedInterfaceOrientations]((uint64_t)self);
  v3 = *((_WORD *)&self->_viewControllerFlags + 4);
  if ((v3 & 0x20) == 0)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      p_viewControllerFlags = &self->_viewControllerFlags;
      *((_WORD *)&self->_viewControllerFlags + 4) |= 0x20u;
      v7 = objc_msgSend(v4, "supportedInterfaceOrientations");
      *((_WORD *)p_viewControllerFlags + 4) &= ~0x20u;

      return v7;
    }
    return -[UIViewController _defaultSupportedInterfaceOrientations]((uint64_t)self);
  }
  *(_QWORD *)&self->_viewControllerFlags = self->_viewControllerFlags;
  *((_WORD *)&self->_viewControllerFlags + 4) = v3 & 0xFFDF;
  v9 = supportedInterfaceOrientations___s_category[0];
  if (!supportedInterfaceOrientations___s_category[0])
  {
    v9 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, supportedInterfaceOrientations___s_category);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "supportedInterfaceOrientations was invoked recursively. Will return the default supported interface orientations", v11, 2u);
    }
  }
  return -[UIViewController _defaultSupportedInterfaceOrientations]((uint64_t)self);
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 0;
}

- (uint64_t)_defaultSupportedInterfaceOrientations
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v1 = (void *)result;
    if (objc_msgSend((id)result, "modalPresentationStyle") == 16
      || objc_msgSend(v1, "modalPresentationStyle") == 2
      || objc_msgSend(v1, "modalPresentationStyle") == 1)
    {
      return 30;
    }
    else
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "userInterfaceIdiom");

      if (v3)
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "userInterfaceIdiom");

        if (v5 == 1)
          return 30;
        else
          return 2;
      }
      else
      {
        return 26;
      }
    }
  }
  return result;
}

- (void)viewDidAppear:(BOOL)animated
{
  _BOOL8 v3;

  if ((*(_QWORD *)&self->_viewControllerFlags & 6) != 4)
  {
    v3 = animated;
    UIViewControllerAlertForAppearanceCallbackMisuse(CFSTR("-viewDidAppear:"), self);
    -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, v3, 1);
    *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFF9 | 4;
  }
}

- (void)viewWillAppear:(BOOL)animated
{
  if ((*(_QWORD *)&self->_viewControllerFlags & 6) != 2)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(CFSTR("-viewWillAppear:"), self);
    *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFF7FFFFFFFFFFFF9 | 0x80000000000002;
  }
}

- (BOOL)_shouldTrackAppearStateChange
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;

  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_EnableViewControllerInteractionActivityTracking, (uint64_t)CFSTR("EnableViewControllerInteractionActivityTracking"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1ECD760C4)
  {
    return 0;
  }
  objc_msgSend(a1, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isSettingAppearState") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "_effectiveInteractionActivityTrackingBaseName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5 != 0;

  }
  return v2;
}

- (BOOL)isSettingAppearState
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 21) & 1;
}

- (NSString)_effectiveInteractionActivityTrackingBaseName
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  -[UIViewController interactionActivityTrackingBaseName](self, "interactionActivityTrackingBaseName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[UIViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      -[UIViewController nibName](self, "nibName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        -[UIViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessibilityIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSString *)v3;
      }
      -[UIViewController nibName](self, "nibName");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v5;
  }
  return (NSString *)v3;
}

- (NSString)interactionActivityTrackingBaseName
{
  return self->_interactionActivityTrackingBaseName;
}

- (id)_safePrimaryViewControllerForAutorotationBelowWindow:(id)a3
{
  void *v5;
  void *v6;

  -[UIViewController _primaryViewControllerForAutorotationBelowWindow:](self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_primaryViewControllerForAutorotationBelowWindow:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    -[UIViewController _windowForAutorotationBelowWindow:](a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "rootViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_existingPresentationControllerImmediate:effective:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_shouldKeepCurrentFirstResponder");

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v5, "presentingViewController");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          v10 = (void *)v8;
        else
          v10 = v5;
        v11 = v10;

        v5 = v11;
      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  if (dyld_program_sdk_at_least() && -[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_8;
  }
  else
  {
    -[UIViewController _window](self, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_8:
      v7 = (*(_QWORD *)&self->_viewControllerFlags >> 12) & 1;
      goto LABEL_9;
    }
  }
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    goto LABEL_8;
  LOBYTE(v7) = 0;
LABEL_9:

  return v7;
}

- (void)viewDidDisappear:(BOOL)animated
{
  if ((*(_QWORD *)&self->_viewControllerFlags & 6) != 0)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(CFSTR("-viewDidDisappear:"), self);
    *(_QWORD *)&self->_viewControllerFlags &= 0xFFFFFFFFFFFFFFF9;
  }
}

- (id)_safeWindowForAutorotationBelowWindow:(id)a3
{
  void *v5;
  void *v6;

  -[UIViewController _windowForAutorotationBelowWindow:](self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)applicationDidResume
{
  uint64_t viewControllerFlags;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFDFFLL;
  if ((viewControllerFlags & 0x100) != 0)
    -[UIViewController _updateLayoutForStatusBarAndInterfaceOrientation](self, "_updateLayoutForStatusBarAndInterfaceOrientation");
}

- (id)_windowForAutorotationBelowWindow:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "level");
    v6 = v5;
    objc_msgSend(a1, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_windowHostingScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__UIViewController__windowForAutorotationBelowWindow___block_invoke;
    v10[3] = &unk_1E16C2128;
    v11 = v4;
    v12 = v6;
    objc_msgSend(v8, "_topVisibleWindowPassingTest:", v10);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (void)_eagerlyUpdateSafeAreaInsetsToViewDescendant:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id *v17;
  double *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    v10 = v9;
    while (v10 && v10 != v8)
    {
      v11 = v10;
      objc_msgSend(v7, "insertObject:atIndex:", v10, 0);
      objc_msgSend(v10, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id **)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[UIView __viewDelegate](v17);
          v18 = (double *)objc_claimAutoreleasedReturnValue();
          -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:](v18);
          objc_msgSend(v17, "_updateSafeAreaInsets", (_QWORD)v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
}

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    -[UIViewController _updateContentOverlayInsetsFromParentIfNecessary](self, "_updateContentOverlayInsetsFromParentIfNecessary");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_childViewControllers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_updateContentOverlayInsetsFromParentIfNecessary", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  else if (-[UIViewController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar"))
  {
    -[UIViewController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation");
    -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:");
  }
}

- (NSLayoutConstraint)_bottomBarInsetGuideConstraint
{
  return self->_bottomBarInsetGuideConstraint;
}

- (NSLayoutConstraint)_topBarInsetGuideConstraint
{
  return self->_topBarInsetGuideConstraint;
}

- (void)_invalidatePreferences:(__int16)a3 excluding:
{
  if (a1)
  {
    if ((a2 & 1) != 0 && (a3 & 1) == 0)
      objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
    if ((a2 & 2) != 0 && (a3 & 2) == 0)
      objc_msgSend(a1, "_setNeedsUserInterfaceAppearanceUpdate");
    if ((a2 & 4) != 0 && (a3 & 4) == 0)
      objc_msgSend(a1, "setNeedsWhitePointAdaptivityStyleUpdate");
    if ((a2 & 8) != 0 && (a3 & 8) == 0)
      objc_msgSend(a1, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
    if ((a2 & 0x10) != 0 && (a3 & 0x10) == 0)
      objc_msgSend(a1, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    if ((a2 & 0x20) != 0 && (a3 & 0x20) == 0)
      objc_msgSend(a1, "setNeedsUpdateOfPrefersPointerLocked");
    if ((a2 & 0x40) != 0 && (a3 & 0x40) == 0)
      objc_msgSend(a1, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
    if ((a2 & 0x80) != 0 && (a3 & 0x80) == 0)
      objc_msgSend(a1, "setNeedsUpdateOfSupportedInterfaceOrientations");
    if ((a2 & 0x200) != 0 && (a3 & 0x200) == 0)
      -[UIViewController _setNeedsResolutionOfPhysicalButtonConfigurations](a1);
  }
}

+ (double)_horizontalContentMarginForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "_horizontalContentMarginForView:ofWidth:", v3, v5);
  v7 = v6;

  return v7;
}

+ (double)_horizontalContentMarginForView:(id)a3 ofWidth:(double)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  double v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  double v16;

  v6 = a3;
  objc_msgSend(v6, "_viewControllerForAncestor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_canvasSystemMinimumMargin");
  if (v8 == 0.0)
  {
    objc_msgSend(v7, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v11 = v10 > 0.0;
    if (v12 <= 0.0)
      v11 = 0;
    if (v9)
      v13 = v11;
    else
      v13 = 0;
    if (_UIScreenReferenceBoundsSizeForType(0x1BuLL) >= a4 || (v14 = 20.0, v13))
    {
      objc_msgSend(v6, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_slimHorizontalContentMarginForTraitCollection:", v15);
      v14 = v16;

    }
  }
  else
  {
    v14 = v8;
  }

  return v14;
}

- (double)_canvasSystemMinimumMargin
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_systemMinimumMargin");
  v5 = v4;

  return v5;
}

- (void)_updateSystemAppearanceWithRecursionBlock:(void *)a3 action:
{
  void (**v5)(id, void *);
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  v12 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(id *)(a1 + 120);
    if (v6)
    {
      v7 = (void (*)(void))v12[2];
    }
    else
    {
      if (!*(_QWORD *)(a1 + 104))
      {
        objc_msgSend((id)a1, "_window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_windowHostingScene");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rootViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == (void *)a1)
          v5[2](v5, v9);

        goto LABEL_7;
      }
      v7 = (void (*)(void))v12[2];
    }
    v7();
LABEL_7:

  }
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_768, &__block_literal_global_770);
}

- (void)_updateLayoutForStatusBarAndInterfaceOrientation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  _BOOL4 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v58 = *MEMORY[0x1E0C80C00];
  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  -[UIViewController _window](self, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](self, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (objc_msgSend(v4, "_isHostedInAnotherProcess"))
  {
    objc_msgSend(v4, "frame");
  }
  else
  {
    if (!objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
    {
      -[UIViewController _screen](self, "_screen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "windowScene");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "interfaceOrientation");
      __UIStatusBarManagerForWindow(v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultStatusBarHeightInOrientation:", 1);
      v27 = v26;

      objc_msgSend(v22, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", v24, 1, v27);
      v18 = v28;
      v19 = v29;
      v20 = v30;
      v21 = v31;

      goto LABEL_8;
    }
    objc_msgSend(v4, "_referenceFrameFromSceneUsingScreenBounds:", 1);
  }
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
LABEL_8:
  if (objc_msgSend((id)objc_opt_class(), "_directlySetsContentOverlayInsetsForChildren"))
  {
    v32 = -[UIViewController _viewControllerUnderlapsStatusBar](self, "_viewControllerUnderlapsStatusBar");
    v33 = 0.0;
    if (v32)
      -[UIViewController _statusBarHeightAdjustmentForCurrentOrientation](self, "_statusBarHeightAdjustmentForCurrentOrientation", 0.0);
    -[UIViewController _setContentOverlayInsets:andLeftMargin:rightMargin:](self, "_setContentOverlayInsets:andLeftMargin:rightMargin:", v33, 0.0, 0.0, 0.0, -1.79769313e308, -1.79769313e308);
  }
  else
  {
    -[UIViewController _updateContentOverlayInsetsForSelfAndChildren](self, "_updateContentOverlayInsetsForSelfAndChildren");
  }
  v59.origin.x = v7;
  v59.origin.y = v9;
  v59.size.width = v11;
  v59.size.height = v13;
  v62.origin.x = v18;
  v62.origin.y = v19;
  v62.size.width = v20;
  v62.size.height = v21;
  if (CGRectEqualToRect(v59, v62))
    goto LABEL_15;
  -[UIViewController _screen](self, "_screen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v63.origin.x = v35;
  v63.origin.y = v36;
  v63.size.width = v37;
  v63.size.height = v38;
  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  v39 = CGRectEqualToRect(v60, v63);

  if (v39)
  {
LABEL_15:
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[UIViewController mutableChildViewControllers](self, "mutableChildViewControllers", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v45, "_existingView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            if ((dyld_program_sdk_at_least() & 1) != 0)
              goto LABEL_23;
            objc_msgSend(v45, "_existingView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "frame");
            v64.origin.x = v48;
            v64.origin.y = v49;
            v64.size.width = v50;
            v64.size.height = v51;
            v61.origin.x = v7;
            v61.origin.y = v9;
            v61.size.width = v11;
            v61.size.height = v13;
            v52 = CGRectEqualToRect(v61, v64);

            if (v52)
LABEL_23:
              objc_msgSend(v45, "_updateLayoutForStatusBarAndInterfaceOrientation");
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v42);
    }

  }
}

+ (BOOL)_directlySetsContentOverlayInsetsForChildren
{
  return 0;
}

- (id)_screen
{
  UIView *view;

  view = self->_view;
  if (view)
    -[UIView _screen](view, "_screen");
  else
    +[UIScreen mainScreen](UIScreen, "mainScreen");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setNeedsUpdateOfScreenEdgesDeferringSystemGestures
{
  -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_775, &__block_literal_global_776);
}

- (void)setNeedsUpdateOfHomeIndicatorAutoHidden
{
  -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_777, &__block_literal_global_778);
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
  -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_772, &__block_literal_global_773);
}

- (void)_setNeedsUpdateOfMultitaskingDragExclusionRects
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_userInterfaceIdiom");

  if (v5 == 1)
    -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_781, &__block_literal_global_782);
}

- (void)setNeedsUpdateOfPrefersPointerLocked
{
  void *v3;
  void *v4;
  int IsAvailableForScene;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsAvailableForScene = _UIPointerLockStateIsAvailableForScene(v4);

  if (IsAvailableForScene)
    -[UIViewController _updateSystemAppearanceWithRecursionBlock:action:]((uint64_t)self, &__block_literal_global_779, &__block_literal_global_780);
}

uint64_t __53__UIViewController_setNeedsStatusBarAppearanceUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsStatusBarAppearanceUpdate");
}

uint64_t __70__UIViewController_setNeedsUpdateOfScreenEdgesDeferringSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
}

- (id)_uiCollectionView
{
  return 0;
}

- (void)setNeedsUpdateOfSupportedInterfaceOrientations
{
  id v2;

  -[UIViewController _window](self, "_window");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateOrientationPreferencesAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

void __53__UIViewController_setNeedsStatusBarAppearanceUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "statusBarManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateStatusBarAppearanceWithAnimationParameters:", _CurrentStatusBarAppearanceUpdateAnimationParameters);

  }
}

uint64_t __59__UIViewController_setNeedsUpdateOfHomeIndicatorAutoHidden__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

uint64_t __59__UIViewController_setNeedsWhitePointAdaptivityStyleUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsWhitePointAdaptivityStyleUpdate");
}

- (void)_viewSubtreeDidGainScrollView:(id)a3 enclosingViewController:(id)a4
{
  id v6;
  id v7;
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
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    if (v7 == v23)
    {
      -[UIViewController _navigationControllerContentInsetAdjustment](self, "_navigationControllerContentInsetAdjustment");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "adjustedScrollView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v18)
      {
        -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);

        -[UIViewController _setNavigationControllerContentInsetAdjustment:](self, "_setNavigationControllerContentInsetAdjustment:", v9, v11, v13, v15);
      }
    }
  }
  -[UIViewController parentViewController](self, "parentViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "_viewSubtreeDidGainScrollView:enclosingViewController:", v23, v6);
  }
  else
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_viewSubtreeDidGainScrollView:enclosingViewController:", v23, v6);

  }
}

- (BOOL)_isInPopoverPresentation
{
  return -[UIViewController _isInContextOfPresentationControllerOfClass:effective:](self, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1);
}

- (BOOL)_isInContextOfPresentationControllerOfClass:(Class)a3 effective:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      if (a4)
        objc_msgSend(v6, "_presentationController");
      else
        objc_msgSend(v6, "_originalPresentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_opt_isKindOfClass();
      if ((v8 & 1) != 0 || objc_msgSend(v7, "shouldPresentInFullscreen"))
        break;
      objc_msgSend(v6, "presentingViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
      if (!v8)
        return v8 & 1;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8 & 1;
}

- (id)_tabBarControllerEnforcingClass:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  char isKindOfClass;
  void *v8;
  unint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  UIViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[UIViewController tabBarController](self, "tabBarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    dyld_program_sdk_at_least();
    return v6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
      return v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 14970, CFSTR("-tabBarController must return an instance of a UITabBarController subclass. %@ returned %@, which is not a kind of UITabBarController."), self, v6);

  }
  else
  {
    if ((isKindOfClass & 1) != 0)
      return v6;
    v10 = _tabBarControllerEnforcingClass____s_category;
    if (!_tabBarControllerEnforcingClass____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_tabBarControllerEnforcingClass____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "-tabBarController must return an instance of a UITabBarController subclass. %@ returned %@, which is not a kind of UITabBarController.", buf, 0x16u);
    }
  }
  if (v3)
  {

    return 0;
  }
  return v6;
}

- (id)_containingTabBarController
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v1 = (uint64_t)a1;
    v2 = objc_opt_class();
    -[UIViewController _ancestorViewControllerOfClass:allowModalParent:](v1, v2, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (UIMultiColumnViewController)_multiColumnViewController
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (UIMultiColumnViewController *)-[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
}

- (BOOL)_isNavigationController
{
  return 0;
}

- (UIEdgeInsets)_navigationControllerContentInsetAdjustment
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
  UIEdgeInsets result;

  -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insetAdjustment");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v19;
  void *v20;
  UIViewController *v21;
  UIViewController *v22;
  void *v23;
  id v24;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insetAdjustment");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v19 = v12 == left && v10 == top && v16 == right && v14 == bottom;
  if (!v19 && objc_msgSend(v24, "_compatibleContentInsetAdjustmentBehavior") == 101)
  {
    -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInsetAdjustment:", top, left, bottom, right);

    objc_msgSend(v24, "_viewControllerForAncestor");
    v21 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21 || v21 == self)
    {
      if (v24)
      {
        _UIScrollViewAdjustForOverlayInsetsChangeIfNecessary(v24, 1, top, left, bottom, right, v10, v12, v14, v16);
        -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAdjustedScrollView:", v24);

      }
    }
    else
    {
      -[UIViewController _setNavigationControllerContentInsetAdjustment:](v21, "_setNavigationControllerContentInsetAdjustment:", top, left, bottom, right);
    }

  }
}

- (UINavigationContentAdjustments)navigationInsetAdjustment
{
  UINavigationContentAdjustments *navigationInsetAdjustment;
  UINavigationContentAdjustments *v4;
  UINavigationContentAdjustments *v5;

  navigationInsetAdjustment = self->_navigationInsetAdjustment;
  if (!navigationInsetAdjustment)
  {
    v4 = objc_alloc_init(UINavigationContentAdjustments);
    v5 = self->_navigationInsetAdjustment;
    self->_navigationInsetAdjustment = v4;

    navigationInsetAdjustment = self->_navigationInsetAdjustment;
  }
  return navigationInsetAdjustment;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  double v10;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (v3)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = objc_msgSend(v3, "_windowInterfaceOrientation");
    if (!v7)
      v7 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
    if ((unint64_t)(v7 - 1) <= 3)
    {
      __UIStatusBarManagerForWindow(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isStatusBarHidden");

      if (!v9
        || !v6
        && !+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton")
        && !+[UIApplication _isClassic](UIApplication, "_isClassic"))
      {
        +[UIStatusBar _viewControllerAdjustmentForOrientation:inWindow:](UIStatusBar, "_viewControllerAdjustmentForOrientation:inWindow:", v7, v3);
        v4 = v10;
      }
    }
  }

  return v4;
}

- (NSString)nibName
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;

  if (!self->_nibName)
  {
    v3 = objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_opt_class();
    if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:inBaseClass:", sel_loadView, v3) & 1) == 0)
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController nibBundle](self, "nibBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      objc_opt_self();
      if ((objc_msgSend(v7, "hasPrefix:", CFSTR("UI")) & 1) != 0)
      {
        v9 = 0;
LABEL_16:

        -[UIViewController setNibName:](self, "setNibName:", v9);
        return self->_nibName;
      }
      objc_msgSend(v8, "pathForResource:ofType:", v7, CFSTR("nib"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v9 = v7;
        goto LABEL_16;
      }
      _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_2(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(v8, "pathForResource:ofType:", v11, CFSTR("nib")),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        v9 = v11;
      }
      else
      {
        v13 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("."), 4);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13;
          if (v13 != objc_msgSend(v7, "length") - 1)
          {
            objc_msgSend(v7, "substringFromIndex:", v14 + 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "pathForResource:ofType:", v16, CFSTR("nib"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v9 = v16;
              goto LABEL_15;
            }
            _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_2(v16);
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "pathForResource:ofType:", v9, CFSTR("nib"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {

              goto LABEL_15;
            }

          }
        }
        v9 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  return self->_nibName;
}

- (NSBundle)nibBundle
{
  NSBundle *nibBundle;
  void *v4;

  nibBundle = self->_nibBundle;
  if (!nibBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setNibBundle:](self, "setNibBundle:", v4);

    nibBundle = self->_nibBundle;
  }
  return nibBundle;
}

- (void)setNibName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setNibBundle:(id)a3
{
  objc_storeStrong((id *)&self->_nibBundle, a3);
}

- (id)_contentOrObservableScrollViewInContainerForEdge:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;

  if (a1)
  {
    if ((objc_msgSend(a1, "_isNavigationController") & 1) == 0 && (objc_msgSend(a1, "_isSplitViewController") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel__contentOrObservableScrollViewInContainerForEdge_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__contentOrObservableScrollViewInContainerForEdge_, a1, CFSTR("UIViewController.m"), 1567, CFSTR("%@ supported only for UISplitViewController and UINavigationController at this time. self = %@"), v10, a1);

    }
    if (_UIViewControllerContainersShouldForwardContentScrollView_onceToken != -1)
      dispatch_once(&_UIViewControllerContainersShouldForwardContentScrollView_onceToken, &__block_literal_global_2334);
    if (_UIViewControllerContainersShouldForwardContentScrollView_shouldForward)
    {
      objc_msgSend(a1, "contentScrollViewForEdge:", a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(a1, "_viewControllerForObservableScrollView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (!v5 || v5 == a1)
        {
          -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)a1, a2);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "_contentOrObservableScrollViewForEdge:", a2);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        v4 = (void *)v7;

      }
    }
    else
    {
      -[UIViewController _resolveContentScrollViewForEdge:]((uint64_t)a1, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_transitionCoordinator
{
  _BOOL8 v3;
  void *v4;
  UIViewController *v5;
  void *v6;
  void (**v7)(void *, UIViewController *);
  void *v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  UIViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD aBlock[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v3 = _UIAppUseModernRotationAndPresentationBehaviors();
  if (!v3)
    goto LABEL_7;
  __42__UIViewController__transitionCoordinator__block_invoke(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v35 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__UIViewController__transitionCoordinator__block_invoke_2;
    aBlock[3] = &unk_1E16C2040;
    aBlock[4] = self;
    v30 = &__block_literal_global_534;
    v31 = &v32;
    v7 = (void (**)(void *, UIViewController *))_Block_copy(aBlock);
    v33[3] = (uint64_t)v7;
    v7[2](v7, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v5 = v8;

      _Block_object_dispose(&v32, 8);
      v6 = v5;
      goto LABEL_29;
    }

    _Block_object_dispose(&v32, 8);
LABEL_7:
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __42__UIViewController__transitionCoordinator__block_invoke_3;
    v28[3] = &unk_1E16C2068;
    v28[4] = self;
    v9 = (void (**)(void *, void *))_Block_copy(v28);
    -[UIViewController parentViewController](self, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIViewController parentViewController](self, "parentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = v12;
LABEL_27:
        v5 = v13;
        v6 = v13;
        goto LABEL_28;
      }
    }
    -[UIViewController presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (_UIAppUseModernRotationAndPresentationBehaviors())
      goto LABEL_13;
    -[UIViewController _existingView](self, "_existingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
LABEL_20:
      +[UIWindowController windowControllerForWindow:](UIWindowController, "windowControllerForWindow:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (self)
      {
        objc_msgSend(v23, "_transitionController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_transitionCoordinator");
          self = (UIViewController *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          self = 0;
        }

      }
      goto LABEL_26;
    }
    -[UIViewController presentedViewController](self, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[UIViewController presentedViewController](self, "presentedViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIViewController presentingViewController](self, "presentingViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_13;
      -[UIViewController presentingViewController](self, "presentingViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;
    objc_msgSend(v19, "_existingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_20;
LABEL_13:
    self = 0;
LABEL_26:
    v13 = self;
    goto LABEL_27;
  }
  v5 = v4;
  v6 = v5;
LABEL_29:

  return v6;
}

id __42__UIViewController__transitionCoordinator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "childModalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || ((*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))(), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "childViewControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 32), "_childControllerToIgnoreWhileLookingForTransitionCoordinator");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v12)
          {
            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 16))();
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v5 = (void *)v13;
              goto LABEL_14;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_14:

  }
  return v5;
}

- (UIViewController)_childControllerToIgnoreWhileLookingForTransitionCoordinator
{
  return self->__childControllerToIgnoreWhileLookingForTransitionCoordinator;
}

id __42__UIViewController__transitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      objc_msgSend(v4, "_presentationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        break;
      objc_msgSend(v4, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v6;
    }
    while (v6);
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_shouldRequestViewControllerForObservableScrollViewFromPresentedViewController
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_presentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || (objc_msgSend(v1, "dismissing") & 1) != 0 || (objc_msgSend(v2, "dismissed") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "_presentedViewControllerProvidesContentScrollView");

  return v3;
}

- (UIPresentationController)_presentationController
{
  return self->_presentationController;
}

id __42__UIViewController__transitionCoordinator__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "_setChildControllerToIgnoreWhileLookingForTransitionCoordinator:", v2);
  objc_msgSend(v3, "_transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setChildControllerToIgnoreWhileLookingForTransitionCoordinator:", 0);

  return v4;
}

- (void)_setChildControllerToIgnoreWhileLookingForTransitionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->__childControllerToIgnoreWhileLookingForTransitionCoordinator, a3);
}

- (BOOL)_freezeLayoutForOrientationChangeOnDismissal
{
  _BOOL8 v3;

  LODWORD(v3) = -[UIViewController _allowsFreezeLayoutForOrientationChangeOnDismissal](self, "_allowsFreezeLayoutForOrientationChangeOnDismissal");
  if (v3)
    return (*(_QWORD *)&self->_viewControllerFlags >> 50) & 1;
  return v3;
}

- (BOOL)_allowsFreezeLayoutForOrientationChangeOnDismissal
{
  return 0;
}

- (id)_effectiveStatusBarStyleViewController
{
  void *v3;
  void *v4;
  UIViewController *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveStatusBarStyleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    v6 = v5;
  }
  else
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](self, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || (objc_msgSend(v7, "_shouldPresentedViewControllerControlStatusBarAppearance") & 1) != 0
      || (objc_msgSend(v8, "presentedViewController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "modalPresentationCapturesStatusBarAppearance"),
          v9,
          v10))
    {
      -[UIViewController childViewControllerForStatusBarStyle](self, "childViewControllerForStatusBarStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_effectiveStatusBarStyleViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v5 = v12;
        v6 = v5;
      }
      else
      {
        v6 = self;
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }

  }
  return v6;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
  return 0;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return 0;
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  return self->_modalPresentationCapturesStatusBarAppearance;
}

- (UIStatusBarStyleAnimationParameters)_preferredStatusBarStyleAnimationParameters
{
  return 0;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (UIStatusBarHideAnimationParameters)_preferredStatusBarHideAnimationParameters
{
  return 0;
}

- (BOOL)inExplicitAppearanceTransition
{
  return self->_explicitAppearanceTransitionLevel > 0;
}

- (void)_setNeedsResolutionOfPhysicalButtonConfigurations
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "_existingView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "window");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_eventRoutingScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_existingPhysicalButtonInteractionArbiter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v3, v4, 1uLL);

  }
}

- (uint64_t)_tryBecomeRootViewControllerInWindow:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "_delegateViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 || (objc_msgSend((id)a1, "_popoverController"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend((id)a1, "_existingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_viewControllerForAncestor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        *(_QWORD *)(a1 + 368) |= 0x100uLL;
        objc_msgSend(v4, "_setDelegateViewController:", a1);
        a1 = 1;
        goto LABEL_6;
      }
    }
    a1 = 0;
  }
LABEL_6:

  return a1;
}

- (id)_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3
{
  UIViewController *parentViewController;
  UIViewController *v5;
  UIViewController *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *v11;
  UIViewController *v12;
  void *v13;
  char v14;
  void *v15;
  UIViewController *v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;

  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    -[UIViewController _viewControllerForSupportedInterfaceOrientations](parentViewController, "_viewControllerForSupportedInterfaceOrientations", a3);
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = v5;
    return v6;
  }
  v7 = a3;
  -[UIViewController _existingView](self, "_existingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (v7
      && (-[UIViewController childModalViewController](self, "childModalViewController"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = -[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](self, v13),
          v13,
          (v14 & 1) == 0))
    {
      -[UIViewController _nearestFullScreenAncestorViewController](self);
      v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIViewController childModalViewController](self, "childModalViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[UIViewController childModalViewController](self, "childModalViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:", v7);
        v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      v5 = self;
    }
    goto LABEL_3;
  }
  v6 = self;
  -[UIViewController presentedViewController](v6, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_34;
  v11 = v6;
  while (!v7
       || -[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](v11, v10))
  {
    v12 = v10;

    -[UIViewController presentedViewController](v12, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v12;
    if (!v10)
      goto LABEL_16;
  }
  v12 = v11;
LABEL_16:
  if (v12 == v6)
    goto LABEL_34;
  while (1)
  {
    v16 = v12;
    v17 = -[UIViewController modalPresentationStyle](v16, "modalPresentationStyle");
    v18 = dyld_program_sdk_at_least();
    if (v17 == 4)
      LOBYTE(v19) = 1;
    else
      v19 = (v17 < 0x12) & (0x20021u >> v17);
    v20 = v18 ? v19 : (v17 < 0x12) & (0x20021u >> v17);
    v21 = dyld_program_sdk_at_least();
    if ((v20 & 1) != 0 || (v21 & 1) != 0)
      break;
    -[UIViewController _existingPresentationControllerImmediate:effective:](v16, "_existingPresentationControllerImmediate:effective:", 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = v22;
      v24 = objc_msgSend(v22, "presentationStyle");

      if (v24 == 20)
        goto LABEL_33;
    }
    else
    {

    }
LABEL_31:
    -[UIViewController presentingViewController](v16, "presentingViewController");
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v12 == v6)
      goto LABEL_34;
  }

  if ((v20 & 1) == 0)
    goto LABEL_31;
LABEL_33:
  v6 = v16;
LABEL_34:

  return v6;
}

- (id)_viewControllerForSupportedInterfaceOrientations
{
  return -[UIViewController _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:](self, "_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:", _UIAppUseModernRotationAndPresentationBehaviors());
}

- (BOOL)isBeingPresented
{
  uint64_t viewControllerFlags;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((~*(_DWORD *)&self->_viewControllerFlags & 0x1800000) == 0)
    return 1;
  return (viewControllerFlags & 0x100000000200000) != 0
      && (viewControllerFlags & 0x800000) != 0
      && ((viewControllerFlags >> 1) & 3) - 1 < 2;
}

- (BOOL)isInWillRotateCallback
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 16) & 1;
}

- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4
{
  int64_t v6;
  void *v7;
  uint64_t viewControllerFlags;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v6 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
    if (self)
      self->_lastKnownInterfaceOrientation = a4;
    -[UIViewController viewControllerForRotation](self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_useSheetRotation"))
    {
      viewControllerFlags = (uint64_t)self->_viewControllerFlags;

      v9 = v12;
      if ((viewControllerFlags & 0x100) == 0)
      {
        -[UIViewController window:resizeFromOrientation:](self, "window:resizeFromOrientation:", v12, v6);
        goto LABEL_9;
      }
    }
    else
    {

      v9 = v12;
    }
    -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _centerForOrientation:](self, "_centerForOrientation:", a4);
    objc_msgSend(v10, "setCenter:");
    -[UIViewController _boundsForOrientation:](self, "_boundsForOrientation:", a4);
    objc_msgSend(v10, "setBounds:");
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

  }
LABEL_9:

}

- (uint64_t)_isPresentingInWindow:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  if (a1 && (objc_msgSend(a1, "presentedViewController"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    while (1)
    {
      if (objc_msgSend(v5, "isViewLoaded"))
      {
        objc_msgSend(v5, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "window");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        if (v7 == v3)
          break;
      }
      objc_msgSend(v5, "presentedViewController");
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
      if (!v8)
        goto LABEL_10;
    }
    v8 = 1;
LABEL_10:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  UINib *v14;
  UIView *v15;
  NSDictionary *externalObjectsTableForViewLoading;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  _QWORD *v26;
  UIView *v27;

  -[UIViewController nibName](self, "nibName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UIViewController nibBundle](self, "nibBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[UIViewController nibName](self, "nibName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController nibBundle](self, "nibBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    v8 = v7;
    if (self)
    {
      -[UIViewController storyboard](self, "storyboard");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9
        && (v10 = (void *)v9,
            -[UIViewController storyboard](self, "storyboard"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "containsNibNamed:", v27),
            v11,
            v10,
            v12))
      {
        -[UIViewController storyboard](self, "storyboard");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (UINib *)objc_msgSend(v13, "nibForStoryboardNibNamed:", v27);

      }
      else
      {
        v14 = -[UINib initWithNibName:directory:bundle:]([UINib alloc], "initWithNibName:directory:bundle:", v27, 0, v8);
      }
      externalObjectsTableForViewLoading = self->_externalObjectsTableForViewLoading;
      if (externalObjectsTableForViewLoading)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", externalObjectsTableForViewLoading, CFSTR("UINibExternalObjects"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      -[UINib instantiateWithOwner:options:](v14, "instantiateWithOwner:options:", self, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->_view)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_opt_self();
        v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel__loadViewFromNibNamed_bundle_);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("-[%@ %@]"), v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v18, "count");
        if (v24)
          v25 = CFSTR("%@ loaded the \"%@\" nib but the view outlet was not set.");
        else
          v25 = CFSTR("%@ was unable to load a nib named \"%@\");
        v26 = (_QWORD *)MEMORY[0x1E0C99778];
        if (v24)
          v26 = (_QWORD *)MEMORY[0x1E0C99768];
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v26, v25, v23, v27);

      }
      -[UIViewController autoresizeArchivedView](self);

    }
  }
  else
  {
    v15 = [UIView alloc];
    -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
    v27 = -[UIView initWithFrame:](v15, "initWithFrame:");
    -[UIView setAutoresizingMask:](v27, "setAutoresizingMask:", 18);
    -[UIViewController setView:](self, "setView:", v27);
  }

}

- (void)setView:(UIView *)view
{
  UIView *v5;
  UIView **p_view;
  _BOOL4 v7;
  UIViewController *v8;
  UIViewController *v9;
  UIResponder *modalPreservedFirstResponder;
  id *v11;
  void *v12;
  UIView *v13;
  id *v14;
  int v15;
  uint64_t v16;
  void *v17;
  UIView *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id *v30;
  id *v31;
  id *v32;
  NSLayoutConstraint *topBarInsetGuideConstraint;
  id *v34;
  NSLayoutConstraint *v35;
  id *v36;
  int v37;
  UILayoutSupport *topLayoutGuide;
  UILayoutSupport *v39;
  UILayoutSupport *bottomLayoutGuide;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *bottomBarInsetGuideConstraint;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  UIView *v54;

  v5 = view;
  p_view = &self->_view;
  if (self->_view != v5)
  {
    v54 = v5;
    v7 = -[UIView _cachedTraitCollectionIsValid](v5, "_cachedTraitCollectionIsValid");
    -[UIView __viewDelegate]((id *)&(*p_view)->super.super.isa);
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (*p_view)
    {
      v9 = (*p_view)->_viewDelegate;

      if (v9 == self)
        -[UIView __setViewDelegate:](*p_view, 0);
      *(_QWORD *)&(*p_view)->_viewFlags &= ~0x80000000uLL;
      modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
      self->_modalPreservedFirstResponder = 0;

      v11 = (id *)*p_view;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (!v54 || !-[UIView isDescendantOfView:](*p_view, "isDescendantOfView:", v54)))
    {
      if (v8 == self)
        -[UIView removeFromSuperview](*p_view, "removeFromSuperview");
      if (v54)
      {
        -[UIView frame](*p_view, "frame");
        -[UIView setFrame:](v54, "setFrame:");
        objc_msgSend(v12, "addSubview:", v54);
      }
    }
    v13 = *p_view;
    objc_storeStrong((id *)&self->_view, view);
    -[UIView _setViewDelegateContentOverlayInsetsAreClean:](*p_view, "_setViewDelegateContentOverlayInsetsAreClean:", 0);
    if (*p_view)
    {
      objc_msgSend((id)objc_opt_class(), "setViewController:forView:", self, *p_view);
      *(_QWORD *)&(*p_view)->_viewFlags |= 0x80000000uLL;
    }
    if (v7 && (dyld_program_sdk_at_least() & 1) == 0)
    {
      if (!*p_view)
        goto LABEL_29;
      _UIViewInvalidateTraitCollectionAndSchedulePropagation((uint64_t)*p_view, 1);
    }
    v14 = (id *)*p_view;
    if (self->_viewHostsLayoutEngine)
    {
      if (!v14)
        goto LABEL_29;
      v15 = objc_msgSend(v14, "translatesAutoresizingMaskIntoConstraints");
      v14 = (id *)*p_view;
      if (v15)
      {
        objc_msgSend(v14, "_setHostsLayoutEngine:", 1);
        v14 = (id *)*p_view;
      }
    }
    if (v14)
    {
      -[UIViewController _embeddingView](self, "_embeddingView");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[UIViewController _embeddingView](self, "_embeddingView");
        v18 = (UIView *)objc_claimAutoreleasedReturnValue();

        if (v18 != v54)
        {
          -[UIViewController _embeddingView](self, "_embeddingView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController _embeddedViewFrame](self, "_embeddedViewFrame");
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          -[UIViewController _embeddedDelegate](self, "_embeddedDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController _embedContentViewInView:withContentFrame:delegate:](self, "_embedContentViewInView:withContentFrame:delegate:", v19, v28, v21, v23, v25, v27);

          goto LABEL_31;
        }
      }
      if (*p_view)
        goto LABEL_31;
    }
LABEL_29:
    -[UIViewController _embeddedView](self, "_embeddedView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[UIViewController _setEmbeddedView:](self, "_setEmbeddedView:", 0);
      -[UIViewController _setEmbeddedDelegate:](self, "_setEmbeddedDelegate:", 0);
    }
LABEL_31:
    -[UIViewController _inferLayoutGuidesFromSubviews]((uint64_t)self);
    if (!self->_topBarInsetGuideConstraint && !self->_bottomBarInsetGuideConstraint)
    {
LABEL_53:
      if (self->_contentUnavailableWrapperView)
        -[UIViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
      -[UIView _updateInferredLayoutMargins](v13, "_updateInferredLayoutMargins");
      -[UIView _updateInferredLayoutMargins](*p_view, "_updateInferredLayoutMargins");
      if (!dyld_program_sdk_at_least())
        goto LABEL_61;
      v43 = _UIViewSetLayerNameDescriptionEnabled();
      -[UIView layer](*p_view, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v43)
      {
        -[UIView layer](*p_view, "layer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringByAppendingFormat:", CFSTR(", VC:%@"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setName:", v50);

      }
      else
      {
        objc_msgSend(v44, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
LABEL_61:
          -[UIViewController _setSecurityModeForViewsLayer](self, "_setSecurityModeForViewsLayer");

          v5 = v54;
          goto LABEL_62;
        }
        -[UIView layer](*p_view, "layer");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0CB3940];
        v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", CFSTR("VC:%@"), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setName:", v47);
      }

      goto LABEL_61;
    }
    -[UIViewController _embeddedView](self, "_embeddedView");
    v30 = (id *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
      v31 = (id *)*p_view;
    v32 = v31;

    topBarInsetGuideConstraint = self->_topBarInsetGuideConstraint;
    if (topBarInsetGuideConstraint)
    {
      -[NSLayoutConstraint container](self->_topBarInsetGuideConstraint, "container");
      v34 = (id *)objc_claimAutoreleasedReturnValue();
      if (v34 != v32)
      {

LABEL_44:
        if (self->_topBarInsetGuideConstraint || self->_bottomBarInsetGuideConstraint)
        {
          v37 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self);
          topLayoutGuide = self->_topLayoutGuide;
          if (v37)
          {
            -[UILayoutSupport removeFromSuperview](topLayoutGuide, "removeFromSuperview");
            -[UILayoutSupport removeFromSuperview](self->_bottomLayoutGuide, "removeFromSuperview");
          }
          else
          {
            _removeLayoutGuide(topLayoutGuide);
            _removeLayoutGuide(self->_bottomLayoutGuide);
          }
          v39 = self->_topLayoutGuide;
          self->_topLayoutGuide = 0;

          bottomLayoutGuide = self->_bottomLayoutGuide;
          self->_bottomLayoutGuide = 0;

          v41 = self->_topBarInsetGuideConstraint;
          self->_topBarInsetGuideConstraint = 0;

          bottomBarInsetGuideConstraint = self->_bottomBarInsetGuideConstraint;
          self->_bottomBarInsetGuideConstraint = 0;

          if (dyld_program_sdk_at_least())
            *(_QWORD *)&self->_viewControllerFlags &= 0xFFFFCFFFFFFFFFFFLL;
        }
        goto LABEL_52;
      }
      v35 = self->_bottomBarInsetGuideConstraint;
      if (v35)
      {
LABEL_41:
        -[NSLayoutConstraint container](v35, "container");
        v36 = (id *)objc_claimAutoreleasedReturnValue();

        if (topBarInsetGuideConstraint)
        if (v36 == v32)
          goto LABEL_52;
        goto LABEL_44;
      }

    }
    else
    {
      v35 = self->_bottomBarInsetGuideConstraint;
      if (v35)
        goto LABEL_41;
    }
LABEL_52:

    goto LABEL_53;
  }
LABEL_62:

}

- (void)_setSecurityModeForViewsLayer
{
  _BOOL4 v3;
  _QWORD *v4;
  id v5;

  -[UIView layer](self->_view, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)UIApp, "_supportedOnLockScreen") & 1) != 0)
  {
    v3 = -[UIViewController _canShowWhileLocked](self, "_canShowWhileLocked");
    v4 = (_QWORD *)MEMORY[0x1E0CD2FF8];
    if (!v3)
      v4 = (_QWORD *)MEMORY[0x1E0CD2FF0];
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x1E0CD2FF0];
  }
  objc_msgSend(v5, "setSecurityMode:", *v4);

}

- (UIView)_embeddingView
{
  return self->__embeddingView;
}

+ (void)setViewController:(id)a3 forView:(id)a4
{
  -[UIView __setViewDelegate:](a4, a3);
}

- (BOOL)_allowsSkippingLayout
{
  if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_viewWillLayoutSubviews) & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_viewDidLayoutSubviews) ^ 1;
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
  void *v11;
  void *v12;
  void *v13;
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
  double v24;
  double v25;
  CGRect result;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(v2, "_windowHostingScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v11
       || (objc_msgSend((id)UIApp, "_defaultUISceneOrMainScreenPlaceholderIfExists"),
           (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && objc_msgSend(v11, "_hostsWindows"))
    {
      objc_msgSend(v11, "_coordinateSpace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      if (v2)
        v13 = v2;
      else
        v13 = v12;
      objc_msgSend(v12, "convertRect:toCoordinateSpace:", v13);
    }
    else
    {
      if (v2)
        objc_msgSend(v2, "screen");
      else
        +[UIScreen mainScreen](UIScreen, "mainScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
    }
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;

    goto LABEL_17;
  }
  if (!v2)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v4 = v18;
    v6 = v19;
    v8 = v20;
    v10 = v21;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
LABEL_18:

  v22 = v4;
  v23 = v6;
  v24 = v8;
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIStoryboard)storyboard
{
  return self->_storyboard;
}

- (BOOL)isEditing
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 3) & 1;
}

- (UITabBarItem)tabBarItem
{
  UITabBarItem *tabBarItem;
  UITabBarItem *v4;
  void *v5;
  UITabBarItem *v6;
  UITabBarItem *v7;

  tabBarItem = self->_tabBarItem;
  if (!tabBarItem)
  {
    v4 = [UITabBarItem alloc];
    -[UIViewController title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UITabBarItem initWithTitle:image:tag:](v4, "initWithTitle:image:tag:", v5, 0, 0);
    v7 = self->_tabBarItem;
    self->_tabBarItem = v6;

    tabBarItem = self->_tabBarItem;
  }
  return tabBarItem;
}

- (NSString)title
{
  return (NSString *)(id)-[NSString copy](self->_title, "copy");
}

- (BOOL)hidesBottomBarWhenPushed
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 5) & 1;
}

- (BOOL)_suppressesBottomBar
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 29) & 1;
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _registerForTraitTokenChanges:withHandler:](self, "_registerForTraitTokenChanges:withHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v9;
  _UITraitChangeRegistry *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v9 = objc_alloc_init(_UITraitChangeRegistry);
    v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v9;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
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
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinY;
  double MinX;
  double MaxY;
  double v34;
  double v35;
  double MaxX;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat rect;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  UIEdgeInsets result;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_managedSafeAreaInsets");
  v62 = v8;
  if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x40) != 0)
  {
    v39 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
    if (!v39)
      v39 = objc_msgSend(v4, "interfaceOrientation");
    objc_msgSend(v4, "windowScene");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_safeAreaInsetsForInterfaceOrientation:", v39);
    v9 = v41;
    v10 = v42;
    v11 = v43;
    v62 = v44;

    if (v4)
      goto LABEL_3;
LABEL_13:
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "overscanCompensationInsets");
    v35 = v46;
    v37 = v47;
    v34 = v48;
    v38 = v49;

    goto LABEL_14;
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (!v4)
    goto LABEL_13;
LABEL_3:
  v56 = v9;
  v57 = v10;
  v59 = v11;
  -[UIViewController _viewFrameInWindowForContentOverlayInsetsCalculation](self, "_viewFrameInWindowForContentOverlayInsetsCalculation");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v4, "bounds");
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  height = v64.size.height;
  CGRectGetMinY(v64);
  UIRoundToViewScale(v3);
  v60 = v24;
  v55 = x;
  v65.origin.x = x;
  v25 = y;
  v65.origin.y = y;
  v65.size.width = width;
  v54 = height;
  v65.size.height = height;
  CGRectGetMaxY(v65);
  UIRoundToViewScale(v3);
  v27 = v26;
  v66.origin.x = v13;
  v66.origin.y = v15;
  v66.size.width = v17;
  v66.size.height = v19;
  CGRectGetMinY(v66);
  UIRoundToViewScale(v3);
  v29 = v28;
  v67.origin.x = v13;
  v67.origin.y = v15;
  rect = v17;
  v67.size.width = v17;
  v67.size.height = v19;
  CGRectGetMaxY(v67);
  UIRoundToViewScale(v3);
  if (v29 >= v60 && v30 <= v27 || !dyld_program_sdk_at_least())
    goto LABEL_9;
  if (qword_1EDDB0F90 != -1)
    dispatch_once(&qword_1EDDB0F90, &__block_literal_global_144);
  if (!byte_1EDDB0F74)
  {
    v38 = 0.0;
    v34 = 0.0;
    v37 = 0.0;
    v35 = 0.0;
  }
  else
  {
LABEL_9:
    v68.origin.x = v13;
    v68.origin.y = v15;
    v68.size.width = v17;
    v68.size.height = v19;
    MinY = CGRectGetMinY(v68);
    v69.origin.x = v55;
    v69.origin.y = v25;
    v69.size.width = width;
    v69.size.height = v54;
    v61 = fmax(v56 - fmax(MinY - CGRectGetMinY(v69), 0.0), 0.0);
    v70.origin.x = v13;
    v70.origin.y = v15;
    v70.size.width = v17;
    v70.size.height = v19;
    MinX = CGRectGetMinX(v70);
    v71.origin.x = v55;
    v71.origin.y = v25;
    v71.size.width = width;
    v71.size.height = v54;
    v58 = fmax(v57 - fmax(MinX - CGRectGetMinX(v71), 0.0), 0.0);
    v72.origin.x = v55;
    v72.origin.y = v25;
    v72.size.width = width;
    v72.size.height = v54;
    MaxY = CGRectGetMaxY(v72);
    v73.origin.x = v13;
    v73.origin.y = v15;
    v73.size.width = v17;
    v73.size.height = v19;
    v34 = fmax(v59 - fmax(MaxY - CGRectGetMaxY(v73), 0.0), 0.0);
    v74.origin.x = v55;
    v74.origin.y = v25;
    v74.size.width = width;
    v74.size.height = v54;
    v35 = v61;
    MaxX = CGRectGetMaxX(v74);
    v75.origin.x = v13;
    v75.origin.y = v15;
    v75.size.width = rect;
    v75.size.height = v19;
    v37 = v58;
    v38 = fmax(v62 - fmax(MaxX - CGRectGetMaxX(v75), 0.0), 0.0);
  }
LABEL_14:

  v50 = v35;
  v51 = v37;
  v52 = v34;
  v53 = v38;
  result.right = v53;
  result.bottom = v52;
  result.left = v51;
  result.top = v50;
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  int v3;

  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel__preferredStatusBarVisibility))v3 = -[UIViewController _preferredStatusBarVisibility](self, "_preferredStatusBarVisibility");
  else
    v3 = -[UIViewController _defaultViewControllerStatusBarVisibilityBehavior]((uint64_t)self);
  return v3 == 1;
}

- (void)_updateControlledViewsToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (void)_addChildViewController:(id)a3 performHierarchyCheck:(BOOL)a4 notifyWillMove:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  UIViewController *v9;
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
  id v20;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v20 = v8;
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v8, "parentViewController");
  v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v20, "_existingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_4;
    objc_msgSend(v20, "_existingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_viewControllerForAncestor");
    v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v9 && v9 != self)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIViewControllerHierarchyInconsistency"), CFSTR("child view controller:%@ should have parent view controller:%@ but requested parent is:%@"), v20, v9, self);
  }

LABEL_4:
  if (dyld_program_sdk_at_least())
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (v10 == v20)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIViewControllerHierarchyInconsistency"), CFSTR("trying to add child view controller that is already presented: %@"), v20);
    }
  }
LABEL_8:
  -[UIViewController _window](self, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "__willChangeToIdiom:onScreen:", objc_msgSend(v12, "_userInterfaceIdiom"), v12);
  objc_msgSend(v20, "parentViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v20, "willMoveToParentViewController:", 0);
    objc_msgSend(v20, "removeFromParentViewController");
  }
  -[UIViewController _addChildViewController:](self, "_addChildViewController:", v20);
  -[NSMutableArray addObject:](self->_childViewControllers, "addObject:", v20);
  -[UIResponder _didChangeDeepestActionResponder](self, "_didChangeDeepestActionResponder");
  if (v5)
    objc_msgSend(v20, "willMoveToParentViewController:", self);
  if (dyld_program_sdk_at_least())
  {
    -[UIViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_viewControllerSubtreeDidGainViewController:", self);

  }
  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_viewControllerChildViewControllersDidChange:", self);

}

- (id)_splitViewControllerEnforcingClass:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  char isKindOfClass;
  void *v8;
  unint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  UIViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[UIViewController splitViewController](self, "splitViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    dyld_program_sdk_at_least();
    return v6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
      return v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 14982, CFSTR("-splitViewController must return an instance of a UISplitViewController subclass. %@ returned %@, which is not a kind of UISplitViewController."), self, v6);

  }
  else
  {
    if ((isKindOfClass & 1) != 0)
      return v6;
    v10 = _splitViewControllerEnforcingClass____s_category;
    if (!_splitViewControllerEnforcingClass____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_splitViewControllerEnforcingClass____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "-splitViewController must return an instance of a UISplitViewController subclass. %@ returned %@, which is not a kind of UISplitViewController.", buf, 0x16u);
    }
  }
  if (v3)
  {

    return 0;
  }
  return v6;
}

- (void)__willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[UIViewController _window](self, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || objc_msgSend(v8, "_userInterfaceIdiom") != a3)
    {
      -[UIViewController _willChangeToIdiom:onScreen:](self, "_willChangeToIdiom:onScreen:", a3, v6);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[UIViewController childViewControllers](self, "childViewControllers", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "__willChangeToIdiom:onScreen:", a3, v6);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
  id v4;

  if (!-[UIViewController appearanceTransitionsAreDisabled](self, "appearanceTransitionsAreDisabled", parent))
    *(_QWORD *)&self->_viewControllerFlags |= 0x2000000uLL;
  -[UIViewController _existingView](self, "_existingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setViewDelegateContentOverlayInsetsAreClean:", 0);

}

- (BOOL)appearanceTransitionsAreDisabled
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 27) & 1;
}

- (void)_addChildViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *childViewControllers;
  __int16 v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4 && (*((_QWORD *)v4 + 46) & 0x100) != 0)
  {
    objc_msgSend(v4, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIViewControllerHierarchyInconsistency"), CFSTR("adding a root view controller %@ as a child of view controller:%@"), v10, self);
    v4 = v10;
    *((_QWORD *)v10 + 46) &= ~0x100uLL;
  }
  if (!self->_childViewControllers)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    childViewControllers = self->_childViewControllers;
    self->_childViewControllers = v7;

    v4 = v10;
  }
  if (v4)
  {
    v9 = *((_WORD *)v4 + 188);
    *((_WORD *)v4 + 188) = v9 | 0x100;
    objc_msgSend(v10, "setParentViewController:", self);
    v4 = v10;
    *((_WORD *)v10 + 188) = *((_WORD *)v10 + 188) & 0xFEFF | v9 & 0x100;
  }

}

- (void)setParentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  v5 = v4;
  v10 = v4;
  if ((*((_WORD *)&self->_viewControllerFlags + 4) & 0x100) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__UIViewController_setParentViewController___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v6 = v4;
    v7 = v6;
    v12 = v6;
    if (qword_1EDDB0FE8 == -1)
    {
      v8 = v6;
    }
    else
    {
      dispatch_once(&qword_1EDDB0FE8, block);
      v8 = v12;
    }

    v5 = v10;
    if (v7)
    {
      objc_getAssociatedObject(v7, &unk_1EDDB0F77);
      v9 = (id *)objc_claimAutoreleasedReturnValue();
      if (v9
        || (v9 = (id *)-[_UIUnsafeUnretainedCleanupHelper initWithParent:deallocationHandler:]([_UIUnsafeUnretainedCleanupHelper alloc], (uint64_t)v7, &__block_literal_global_452), objc_setAssociatedObject(v7, &unk_1EDDB0F77, v9, (void *)1), v9))
      {
        objc_msgSend(v9[3], "addObject:", self);
      }

      v5 = v10;
    }
  }
  -[UIViewController __setParentViewController:](self, v5);

}

- (id)_compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:(_QWORD *)a1
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;

  if (a2 && !a1[51])
  {
    v3 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
    v4 = (void *)a1[51];
    a1[51] = v3;

  }
  -[_UITraitOverrides _overridesAppliedBefore]((_QWORD *)a1[51]);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[_UITraitOverrides _overridesAppliedAfter](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isViewControllerForObservableScrollViewAmbiguous
{
  return 0;
}

- (void)addKeyCommand:(UIKeyCommand *)keyCommand
{
  NSArray *addedKeyCommands;
  NSArray *v6;
  void *v7;
  UIKeyCommand *v8;
  NSArray *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands)
  {
    -[NSArray arrayByAddingObject:](addedKeyCommands, "arrayByAddingObject:", keyCommand);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = keyCommand;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = keyCommand;
    objc_msgSend(v7, "arrayWithObjects:count:", v10, 1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v9 = self->_addedKeyCommands;
  self->_addedKeyCommands = v6;

}

- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  UIViewController *v9;
  UIViewController *v10;
  void *v11;
  UIViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  CGRect result;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v54 = v3;
  objc_msgSend(v3, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_24;
  v9 = self;
  if (!v9)
    goto LABEL_24;
  v10 = v9;
  v11 = 0;
  v12 = v9;
  do
  {
    -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:](v12, "_existingPresentationControllerImmediate:effective:includesRoot:", 0, 1, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_viewToIgnoreLayerTransformForViewFrameInWindowContentOverlayInsetsCalculation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerView");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v8;
    if (v14)
      v17 = v14;
    v18 = v17;
    if (v12 != v10)
    {
      v19 = v11;
      v20 = v4;
      v21 = v5;
      v22 = v6;
      v23 = v7;
      goto LABEL_16;
    }
    if (!-[UIViewController _ignoresWrapperViewForContentOverlayInsets](v10, "_ignoresWrapperViewForContentOverlayInsets")|| (objc_msgSend(v54, "superview"), v24 = (id)objc_claimAutoreleasedReturnValue(), v24, v24 == v18))
    {
      objc_msgSend(v54, "bounds");
      v19 = v54;
LABEL_16:
      objc_msgSend(v19, "convertRect:toView:", v18, v20, v21, v22, v23);
      v4 = v30;
      v5 = v31;
      v6 = v32;
      v7 = v33;
      if (!v14)
        goto LABEL_18;
LABEL_17:
      objc_msgSend(v14, "_frameIgnoringLayerTransform");
      v35 = v4 + v34;
      v37 = v5 + v36;
      objc_msgSend(v14, "superview");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "convertRect:toView:", v16, v35, v37, v6, v7);
      v4 = v39;
      v5 = v40;
      v6 = v41;
      v7 = v42;

      goto LABEL_18;
    }
    objc_msgSend(v54, "superview");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "superview");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "frame");
    objc_msgSend(v25, "convertRect:toView:", v18);
    v4 = v26;
    v5 = v27;
    v6 = v28;
    v7 = v29;

    if (v14)
      goto LABEL_17;
LABEL_18:
    if ((objc_msgSend(v13, "_isPresentedInFullScreen") & 1) != 0)
    {
      v43 = 0;
    }
    else
    {
      -[UIViewController presentingViewController](v12, "presentingViewController");
      v43 = objc_claimAutoreleasedReturnValue();
    }

    v44 = v16;
    v12 = (UIViewController *)v43;
    v11 = v44;
  }
  while (v43);
  if (v16)
  {
    objc_msgSend(v44, "convertRect:toView:", v8, v4, v5, v6, v7);
    v4 = v45;
    v5 = v46;
    v6 = v47;
    v7 = v48;

  }
LABEL_24:

  v49 = v4;
  v50 = v5;
  v51 = v6;
  v52 = v7;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (BOOL)_ignoresWrapperViewForContentOverlayInsets
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 52) & 1;
}

- (UIEdgeInsets)_overlayInsetsAdjustment
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- ($109F14CB9CD3811A6C59613AC76ACC48)_cumulativeOverlayInsetsInView:(SEL)a3
{
  $109F14CB9CD3811A6C59613AC76ACC48 *result;

  _UIViewControllerAccumulateSafeAreaInsetsIncludingChildrenIntoParentView(&retstr->var0.top, self, a4);
  return result;
}

- (void)setDropShadowView:(id)a3
{
  objc_storeStrong(&self->_dropShadowView, a3);
}

- (id)_backgroundColorForModalFormSheet
{
  return +[UIDimmingView defaultDimmingColor](UIDimmingView, "defaultDimmingColor");
}

- (void)setEdgesForExtendedLayout:(UIRectEdge)edgesForExtendedLayout
{
  self->_edgesForExtendedLayout = edgesForExtendedLayout;
}

void __70__UIViewController_setNeedsUpdateOfScreenEdgesDeferringSystemGestures__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "_systemAppearanceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateScreenEdgesDeferringSystemGestures");

  }
}

void __59__UIViewController_setNeedsWhitePointAdaptivityStyleUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "_systemAppearanceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWhitePointAdaptivityStyle");

  }
}

- (id)_effectiveWhitePointAdaptivityStyleViewController
{
  void *v3;
  UIViewController *v4;
  void *v5;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveWhitePointAdaptivityStyleViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIViewController childViewControllerForWhitePointAdaptivityStyle](self, "childViewControllerForWhitePointAdaptivityStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveWhitePointAdaptivityStyleViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = self;
  }
  return v4;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)UIApp;
  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_normativeWhitePointAdaptivityStyleForWindow:", v3);

  return v4;
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  return 0;
}

void __59__UIViewController_setNeedsUpdateOfHomeIndicatorAutoHidden__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "_systemAppearanceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateHomeIndicatorAutoHidden");

  }
}

- (id)_effectiveHomeIndicatorAutoHiddenViewController
{
  void *v3;
  UIViewController *v4;
  void *v5;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveHomeIndicatorAutoHiddenViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIViewController childViewControllerForHomeIndicatorAutoHidden](self, "childViewControllerForHomeIndicatorAutoHidden");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveHomeIndicatorAutoHiddenViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = self;
  }
  return v4;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (id)_effectiveScreenEdgesDeferringSystemGesturesViewController
{
  void *v3;
  UIViewController *v4;
  void *v5;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIViewController childViewControllerForScreenEdgesDeferringSystemGestures](self, "childViewControllerForScreenEdgesDeferringSystemGestures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveScreenEdgesDeferringSystemGesturesViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = self;
  }
  return v4;
}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return 0;
}

- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures
{
  return 0;
}

+ (void)initialize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1EDDB0F88;
    qword_1EDDB0F88 = v6;

  }
  else
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "instanceMethodForSelector:", sel_traitCollection);
    v4 = dyld_image_header_containing_address();
    objc_msgSend(a1, "instanceMethodForSelector:", sel_traitCollection);
    v5 = dyld_image_header_containing_address();

    if (v4 != v5)
    {
      v8 = qword_1EDDB0FA8;
      if (!qword_1EDDB0FA8)
      {
        v8 = __UILogCategoryGetNode("TraitCollection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&qword_1EDDB0FA8);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        NSStringFromClass((Class)a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Class %@ overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API.", (uint8_t *)&v12, 0xCu);

      }
    }
  }
}

- (_UIFocusSystemSceneComponent)_focusSystemSceneComponent
{
  return (_UIFocusSystemSceneComponent *)+[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", self);
}

- (void)setNeedsDidMoveCleanup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  int64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  unint64_t v40;
  _QWORD aBlock[5];

  if (!self)
    return 0;
  -[UIViewController _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_windowOwnsInterfaceOrientation");

  if ((v6 & 1) != 0)
  {
    v40 = -[UIViewController __supportedInterfaceOrientations](self, "__supportedInterfaceOrientations");
    if ((v40 & (1 << a3)) == 0)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v7, "orientation");

      -[UIViewController _existingView](self, "_existingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__UIViewController__preferredInterfaceOrientationGivenStatusBarAndDeviceOrientationAndMask___block_invoke;
      aBlock[3] = &__block_descriptor_40_e8_B16__0q8l;
      aBlock[4] = &v40;
      v10 = _Block_copy(aBlock);
      v11 = (uint64_t (**)(_QWORD, _QWORD))v10;
      if ((unint64_t)(a3 - 1) > 3
        || ((*((uint64_t (**)(void *, int64_t))v10 + 2))(v10, a3) & 1) == 0)
      {
        objc_msgSend(v9, "windowScene", v40);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11[2](v11, objc_msgSend(v12, "interfaceOrientation"));

        if (v13)
        {
          objc_msgSend(v9, "windowScene");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          a3 = objc_msgSend(v14, "interfaceOrientation");

        }
        else
        {
          a3 = 0;
        }
      }

    }
    -[UIViewController _existingView](self, "_existingView", v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
       || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet
       || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPageSheet;
    -[UIViewController presentingViewController](self, "presentingViewController");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_20;
    v24 = (void *)v23;
    -[UIViewController presentingViewController](self, "presentingViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_popoverController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26
      || !v22
      && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != 17
      && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != UIModalPresentationOverFullScreen)
    {

      goto LABEL_20;
    }
    if (v21)
    {
      objc_msgSend(v21, "rootViewController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 != v33)
        goto LABEL_20;
    }
    else
    {

    }
    -[UIViewController presentingViewController](self, "presentingViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v39, "interfaceOrientation");

    if (v22)
    {
LABEL_38:

      return a3;
    }
LABEL_20:
    -[UIViewController childModalViewController](self, "childModalViewController");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_22;
    v28 = (void *)v27;
    -[UIViewController _existingView](self, "_existingView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v34 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
      if ((unint64_t)(v34 - 1) < 4)
        a3 = v34;
    }
    else
    {
LABEL_22:
      if ((unint64_t)(a3 - 1) >= 4)
      {
        v31 = -[UIViewController _ignoreAppSupportedOrientations](self, "_ignoreAppSupportedOrientations");
        if (v21)
          a3 = 0;
        else
          a3 = v31;
      }
    }
    v35 = v40;
    -[UIViewController _window](self, "_window");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
      v38 = objc_msgSend(v36, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", v35, a3);
    else
      v38 = objc_msgSend((id)UIApp, "_fallbackInterfaceOrientationForSupportedOrientations:preferredOrientation:currentOrientation:", v35, a3, 0);
    a3 = v38;

    goto LABEL_38;
  }
  if ((unint64_t)(a3 - 1) >= 4)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v15, "orientation");

    if ((unint64_t)(a3 - 1) >= 4)
    {
      -[UIViewController _window](self, "_window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "interfaceOrientation");

      return v18;
    }
  }
  return a3;
}

BOOL __92__UIViewController__preferredInterfaceOrientationGivenStatusBarAndDeviceOrientationAndMask___block_invoke(uint64_t a1, char a2)
{
  return (**(_QWORD **)(a1 + 32) & (1 << a2)) != 0;
}

- (id)_safeViewControllerForSupportedInterfaceOrientationsWithDismissCheck:(BOOL)a3
{
  void *v5;
  void *v6;

  -[UIViewController _viewControllerForSupportedInterfaceOrientationsWithDismissCheck:](self, "_viewControllerForSupportedInterfaceOrientationsWithDismissCheck:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeKeyCommand:(UIKeyCommand *)keyCommand
{
  NSArray *addedKeyCommands;
  unint64_t v5;
  NSArray *v6;
  void *v7;
  NSArray **p_interfaceBuilderKeyCommands;
  unint64_t v9;
  UIKeyCommand *v10;

  v10 = keyCommand;
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands)
  {
    v5 = -[NSArray count](addedKeyCommands, "count");
    -[NSArray ui_arrayByRemovingLastObjectEqualTo:](self->_addedKeyCommands, "ui_arrayByRemovingLastObjectEqualTo:", v10);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](v6, "count") < v5)
    {
      v7 = self->_addedKeyCommands;
      self->_addedKeyCommands = v6;
LABEL_8:

      goto LABEL_9;
    }

  }
  p_interfaceBuilderKeyCommands = &self->_interfaceBuilderKeyCommands;
  if (*p_interfaceBuilderKeyCommands)
  {
    v9 = -[NSArray count](*p_interfaceBuilderKeyCommands, "count");
    -[NSArray ui_arrayByRemovingLastObjectEqualTo:](*p_interfaceBuilderKeyCommands, "ui_arrayByRemovingLastObjectEqualTo:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") < v9)
      objc_storeStrong((id *)p_interfaceBuilderKeyCommands, v7);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)_navControllerIsLayingOutTopViewController
{
  void *v2;
  char v3;

  -[UIViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isLayingOutTopViewController");

  return v3;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
  uint64_t viewControllerFlags;
  uint64_t v7;
  UIBarButtonItem *v8;
  void *v9;
  UIBarButtonItem *v10;
  void *v11;
  uint64_t v12;
  UIBarButtonItem *v13;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if (((((viewControllerFlags & 8) == 0) ^ editing) & 1) == 0)
  {
    v7 = 8;
    if (!editing)
      v7 = 0;
    *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
    *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFFF7 | v7;
    v8 = [UIBarButtonItem alloc];
    if (editing)
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Done"), CFSTR("Done"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = 2;
    }
    else
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Edit"), CFSTR("Edit"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = 0;
    }
    v13 = -[UIBarButtonItem initWithTitle:style:target:action:](v10, "initWithTitle:style:target:action:", v11, v12, 0, 0);

    -[UIBarButtonItem _setItemVariation:](self->_editButtonItem, "_setItemVariation:", v13);
  }
}

- (UIInterfaceOrientation)interfaceOrientation
{
  void *v3;
  UIInterfaceOrientation v4;
  UIViewController *v5;
  UIViewController *v6;
  UIViewController *v7;
  id *p_isa;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  if (!self)
    return 0;
  -[UIViewController _popoverController](self, "_popoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = self;
    v6 = v5->_parentViewController;
    if (v6)
    {
      v7 = v6;
      do
      {
        p_isa = v7;

        v7 = (UIViewController *)p_isa[13];
        v5 = (UIViewController *)p_isa;
      }
      while (v7);
    }
    else
    {
      p_isa = (id *)&v5->super.super.isa;
    }
    objc_msgSend(p_isa, "_existingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "_rootAncestorViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      v4 = objc_msgSend(p_isa, "_lastKnownInterfaceOrientation");
      if (!v10)
        goto LABEL_20;
    }
    else
    {
      if (v10 && objc_msgSend(v10, "_windowInterfaceOrientation"))
      {
        v4 = objc_msgSend(v10, "_windowInterfaceOrientation");
      }
      else
      {
        objc_msgSend((id)UIApp, "_defaultUISceneOrMainScreenPlaceholderIfExists");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v13, "interfaceOrientation");

      }
      if ((unint64_t)v4 <= UIInterfaceOrientationPortrait)
        v4 = UIInterfaceOrientationPortrait;
      if (!v10)
        goto LABEL_20;
    }
    v14 = objc_msgSend(p_isa, "_lastKnownInterfaceOrientation");
    objc_msgSend(v10, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "interfaceOrientation");

    if (v14 == v16)
    {
LABEL_21:

      return v4;
    }
LABEL_20:
    v4 = objc_msgSend(p_isa, "_preferredInterfaceOrientationGivenCurrentOrientation:", v4);
    goto LABEL_21;
  }
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  int64_t v15;
  UIView *view;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  UIViewController *v20;
  UIViewController *v21;
  void *v22;
  int v23;
  UIViewController *v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t viewControllerFlags;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  id *v33;
  void *v34;
  double v35;
  double v36;
  dispatch_time_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  dispatch_time_t v68;
  void *v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[4];
  id v73;
  char v74;
  _QWORD block[5];
  id v76;
  _QWORD v77[4];
  id v78;
  char v79;
  id location[2];

  v5 = a4;
  v7 = a3;
  v8 = v7;
  v9 = v7 == 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFBFFFFFFFFFFFFFLL | ((unint64_t)(v7 != 0) << 54);
  if (!v7)
  {
    -[UIViewController _existingView](self, "_existingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    self->_lastForwardedTransitionSize.width = v18;
    self->_lastForwardedTransitionSize.height = v19;

    if (!v5)
      goto LABEL_68;
LABEL_20:
    if (-[UIViewController isPerformingModalTransition](self, "isPerformingModalTransition"))
      goto LABEL_68;
    -[UIViewController presentedViewController](self->_parentModalViewController, "presentedViewController");
    v20 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v20 == self)
    {

      goto LABEL_68;
    }
    v21 = v20;
    -[UIViewController parentViewController](self, "parentViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (v8
        || (-[UIViewController parentViewController](self, "parentViewController"),
            v69 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v69, "_appearState") != 2))
      {
        -[UIViewController parentViewController](self, "parentViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v25;
        if (v25
          && objc_msgSend(v25, "isSettingAppearState")
          && (objc_msgSend(v4, "containmentSupport") & 1) != 0)
        {
          v26 = 0;
          goto LABEL_43;
        }
        v23 = 1;
      }
      else
      {
        v23 = 0;
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
      v23 = 0;
    }
    -[UIViewController _popoverController](self, "_popoverController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "_manuallyHandlesContentViewControllerAppearanceCalls") & 1) != 0
      || (*(_QWORD *)&self->_viewControllerFlags & 0x8000000) != 0)
    {

      v26 = 0;
      if (!v23)
      {
LABEL_38:
        if (v9)

        if ((v26 & 1) == 0)
          goto LABEL_68;
        goto LABEL_46;
      }
    }
    else
    {
      v26 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)self) ^ 1;

      if ((v23 & 1) == 0)
        goto LABEL_38;
    }
LABEL_43:

    if (v9)
    if (!v26)
      goto LABEL_68;
LABEL_46:
    viewControllerFlags = (unint64_t)self->_viewControllerFlags;
    v29 = viewControllerFlags & 0x400000;
    v30 = (viewControllerFlags >> 22) & 1;
    v31 = +[UIApplication _isCertainCheckpointInAppLaunchReached](UIApplication, "_isCertainCheckpointInAppLaunchReached");
    if (v8)
    {
      if (v31)
      {
        objc_initWeak(location, self);
        v32 = MEMORY[0x1E0C809B0];
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
        v77[3] = &unk_1E16BFC68;
        v33 = &v78;
        objc_copyWeak(&v78, location);
        v79 = v30;
        -[UIViewController setAfterAppearanceBlock:](self, "setAfterAppearanceBlock:", v77);
        v34 = _Block_copy(self->_afterAppearance);
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        if (v35 <= 0.0)
        {
          objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", self);
          goto LABEL_66;
        }
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        v37 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
        block[0] = v32;
        block[1] = 3221225472;
        block[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2;
        block[3] = &unk_1E16B1D18;
        block[4] = self;
        v76 = v34;
        dispatch_after(v37, MEMORY[0x1E0C80D38], block);
        v38 = v76;
LABEL_61:

LABEL_66:
        objc_destroyWeak(v33);
        objc_destroyWeak(location);
        goto LABEL_67;
      }
      -[UIViewController __viewDidAppear:](self, "__viewDidAppear:", v29 != 0);
    }
    else
    {
      if (v31)
      {
        objc_initWeak(location, self);
        v65 = MEMORY[0x1E0C809B0];
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_3;
        v72[3] = &unk_1E16BFC68;
        v33 = &v73;
        objc_copyWeak(&v73, location);
        v74 = v30;
        -[UIViewController setAfterAppearanceBlock:](self, "setAfterAppearanceBlock:", v72);
        v34 = _Block_copy(self->_afterAppearance);
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        if (v66 <= 0.0)
        {
          objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", self);
          goto LABEL_66;
        }
        +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
        v68 = dispatch_time(0, (uint64_t)(v67 * 1000000000.0));
        v70[0] = v65;
        v70[1] = 3221225472;
        v70[2] = __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_4;
        v70[3] = &unk_1E16B1D18;
        v70[4] = self;
        v71 = v34;
        dispatch_after(v68, MEMORY[0x1E0C80D38], v70);
        v38 = v71;
        goto LABEL_61;
      }
      -[UIViewController __viewDidDisappear:]((uint64_t)self, v29 != 0);
    }
LABEL_67:
    *(_QWORD *)&self->_viewControllerFlags &= ~0x400000uLL;
    goto LABEL_68;
  }
  objc_msgSend(v7, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_userInterfaceIdiom");

  if (v11 == 3 && !-[UIViewController _isInCustomTransition](self, "_isInCustomTransition"))
  {
    -[UIViewController presentedViewController](self->_parentModalViewController, "presentedViewController");
    v24 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v24 == self)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "userInterfaceIdiom");

      if ((v40 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v41 = -[UIViewController _isModalSheet](self, "_isModalSheet");
LABEL_53:
        v42 = (void *)objc_opt_class();
        -[UIViewController view](self, "view");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "_isViewSizeFullScreen:inWindow:ignoreInWindowCheck:", v43, v8, 1);

        -[UIViewController parentViewController](self, "parentViewController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4 && v41 != v44)
        {
          -[UIViewController view](self, "view");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "frame");
          v47 = v46;
          v49 = v48;
          -[UIViewController view](self, "view");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "superview");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bounds");
          v52 = v51;
          v54 = v53;

          if (v47 != v52 || v49 != v54)
          {
            -[UIViewController view](self, "view");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "superview");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "bounds");
            v58 = v57;
            v60 = v59;
            v62 = v61;
            v64 = v63;
            -[UIViewController view](self, "view");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setFrame:", v58, v60, v62, v64);

          }
        }
        goto LABEL_4;
      }
    }
    else
    {

    }
    v41 = 1;
    goto LABEL_53;
  }
LABEL_4:
  if (!-[UIViewController _isInCustomTransition](self, "_isInCustomTransition"))
  {
    -[UIViewController _updateLayoutForStatusBarAndInterfaceOrientation](self, "_updateLayoutForStatusBarAndInterfaceOrientation");
    -[UIViewController _popoverController](self, "_popoverController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = !_UIAppUseModernRotationAndPresentationBehaviors();
    if (v12)
      v14 = 0;
    else
      v14 = v13;
    if (!v13 && !v12)
      v14 = !-[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
    v15 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
    if (v14 && (unint64_t)(v15 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
      -[UIViewController setInterfaceOrientation:](self, "setInterfaceOrientation:", objc_msgSend(v8, "interfaceOrientation"));
  }
  -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  view = self->_view;
  if (!view || !-[CALayer needsLayout](view->_layer, "needsLayout"))
    -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, (*(_QWORD *)&self->_viewControllerFlags >> 22) & 1, 1);
  if (v5)
    goto LABEL_20;
LABEL_68:

}

- (int64_t)_lastKnownInterfaceOrientation
{
  void *v3;

  -[UIViewController _popoverController](self, "_popoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  else
    return self->_lastKnownInterfaceOrientation;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  -[UIViewController _focusSystem](self, "_focusSystem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (UIFocusSystem)_focusSystem
{
  return +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
}

- (BOOL)_isInCustomTransition
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 34) & 1;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  if ((unint64_t)(a3 - 1) <= 3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __44__UIViewController_setInterfaceOrientation___block_invoke;
    v5[3] = &unk_1E16B7A60;
    v5[4] = self;
    v5[5] = a3;
    -[UIViewController __withSupportedInterfaceOrientation:apply:](self, a3, v5);
  }
}

- (BOOL)__withSupportedInterfaceOrientation:(void *)a3 apply:
{
  void (**v5)(id, BOOL);
  char v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;

  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(a1, "__supportedInterfaceOrientations");
    switch(a2)
    {
      case 0:
        v7 = v6 & 1;
        v8 = 1;
        break;
      case 1:
        v7 = v6 & 2;
        v8 = 2;
        break;
      case 2:
        v7 = v6 & 4;
        v8 = 4;
        break;
      case 3:
        v7 = v6 & 8;
        v8 = 8;
        break;
      case 4:
        v7 = v6 & 0x10;
        v8 = 16;
        break;
      default:
        v7 = 0;
        v8 = 0;
        break;
    }
    v9 = v7 == v8;
    if (v5)
      v5[2](v5, v7 == v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __44__UIViewController_setInterfaceOrientation___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      *(_QWORD *)(v2 + 256) = *(_QWORD *)(result + 40);
  }
  return result;
}

- (void)setAfterAppearanceBlock:(id)a3
{
  void *v4;
  id afterAppearance;

  if (self->_afterAppearance != a3)
  {
    v4 = _Block_copy(a3);
    afterAppearance = self->_afterAppearance;
    self->_afterAppearance = v4;

  }
}

- (void)viewWillMoveToWindow:(id)a3
{
  BOOL v4;
  void *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  unint64_t viewControllerFlags;
  _BOOL4 v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = -[UIViewController isPerformingModalTransition](self, "isPerformingModalTransition");
  v5 = v16;
  if (v4)
    goto LABEL_24;
  -[UIViewController presentedViewController](self->_parentModalViewController, "presentedViewController");
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v7, "_existingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v16
        && -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)v7)
        && !self->_explicitAppearanceTransitionLevel)
      {
        -[UIViewController parentViewController](self, "parentViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v15, "_appearState") == 1
           && -[UIViewController _appearState](self, "_appearState") == 0;

      }
      else
      {
        v10 = 0;
      }

      if (!v7)
        goto LABEL_14;
    }
    else
    {
      v10 = 0;
      if (!v7)
        goto LABEL_14;
    }
    if (objc_msgSend(v7, "_appearState") != 2
      && objc_msgSend(v7, "isSettingAppearState")
      && (objc_msgSend(v7, "containmentSupport") & 1) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_14:
    -[UIViewController _popoverController](self, "_popoverController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "_manuallyHandlesContentViewControllerAppearanceCalls") & 1) != 0
      || (*(_QWORD *)&self->_viewControllerFlags & 0x8000000) != 0)
    {

    }
    else
    {
      v12 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition]((uint64_t *)self) ^ 1 | v10;

      if (v12 == 1)
      {
        viewControllerFlags = (unint64_t)self->_viewControllerFlags;
        if (v16)
          -[UIViewController __viewWillAppear:](self, "__viewWillAppear:", (viewControllerFlags >> 22) & 1);
        else
          -[UIViewController __viewWillDisappear:]((uint64_t)self, (viewControllerFlags >> 22) & 1);
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  v5 = v16;
  if (!v16)
  {
    v14 = -[UIViewController _isRootViewController](self, "_isRootViewController");
    v5 = 0;
    if (v14)
      *(_QWORD *)&self->_viewControllerFlags &= ~0x100uLL;
  }
LABEL_24:

}

- (uint64_t)_didSelfOrAncestorBeginAppearanceTransition
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (!a1)
    return 0;
  if (a1[41] > 0)
    return 1;
  objc_msgSend(a1, "parentViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v1 = -[UIViewController _didSelfOrAncestorBeginAppearanceTransition](v2);
  else
    v1 = 0;

  return v1;
}

- (void)__viewWillAppear:(BOOL)a3
{
  _BOOL8 v4;
  __int16 v5;
  _UIViewBlockVisitor *v6;
  _UIViewBlockVisitor *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  id *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if ((*(_QWORD *)&self->_viewControllerFlags & 6) == 2)
  {
    self->_explicitAppearanceTransitionLevel = 0;
  }
  else
  {
    v4 = a3;
    v5 = *((_WORD *)&self->_viewControllerFlags + 4);
    *(_QWORD *)&self->_viewControllerFlags |= 0x4000000uLL;
    *((_WORD *)&self->_viewControllerFlags + 4) = v5;
    -[UIViewController loadViewIfRequired](self, "loadViewIfRequired");
    -[UIViewController _setViewAppearState:isAnimating:]((uint64_t)self, 1, v4);
    if (-[UIViewController _shouldLoadInputAccessoryViewsOnAppearance](self, "_shouldLoadInputAccessoryViewsOnAppearance"))
    {
      v15 = 0;
      v16 = (id *)&v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__60;
      v19 = __Block_byref_object_dispose__60;
      v20 = 0;
      if (-[UIResponder _ownsInputAccessoryView](self, "_ownsInputAccessoryView"))
      {
        objc_storeStrong(v16 + 5, self);
      }
      else
      {
        v6 = [_UIViewBlockVisitor alloc];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __63__UIViewController__loadHierarchyInputAccessoryViewIfNecessary__block_invoke;
        v14[3] = &unk_1E16C1F88;
        v14[4] = self;
        v14[5] = &v15;
        v7 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v6, "initWithTraversalDirection:visitorBlock:", 2, v14);
        -[UIViewController view](self, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_receiveVisitor:", v7);

      }
      if (v16[5])
      {
        -[UIViewController _keyboardSceneDelegate](self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16[5];
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_beginPersistingInputAccessoryViewForResponder:withId:", v10, v11);

      }
      _Block_object_dispose(&v15, 8);

    }
    -[UIViewController preferredTransition](self, "preferredTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIViewController preferredTransition](self, "preferredTransition");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_viewControllerViewWillAppear");

    }
  }
}

- (BOOL)_shouldLoadInputAccessoryViewsOnAppearance
{
  return 0;
}

- (void)__viewWillDisappear:(uint64_t)a1
{
  __int16 v3;

  if (a1)
  {
    if ((~*(_DWORD *)(a1 + 368) & 6) != 0)
    {
      v3 = *(_WORD *)(a1 + 376);
      *(_QWORD *)(a1 + 368) &= ~0x4000000uLL;
      *(_WORD *)(a1 + 376) = v3;
      -[UIViewController _setViewAppearState:isAnimating:](a1, 3, a2);
      -[UIViewController _unloadHierarchyInputAccessoryViewIfNecessary]((void *)a1);
    }
    else
    {
      *(_QWORD *)(a1 + 328) = 0;
    }
  }
}

uint64_t __74__UIViewController__updateLastKnownInterfaceOrientationOnPresentionStack___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      *(_QWORD *)(v2 + 256) = *(_QWORD *)(result + 40);
  }
  return result;
}

+ (void)_scheduleTransition:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = a3;
  v4 = v3;
  if (_ShouldDeferTransitions)
  {
    v5 = dyld_program_sdk_at_least() ^ 1;
    _UIMainBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIUpdateCycleEnabled()
      && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_DisableDelayedScheduleTransition, (uint64_t)CFSTR("DisableDelayedScheduleTransition"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1ECD760AC)&& objc_msgSend(&unk_1E1A932A8, "containsObject:", v6))
    {
      v7 = dispatch_time(0, 50000000);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __40__UIViewController__scheduleTransition___block_invoke;
      v8[3] = &unk_1E16BFB78;
      v10 = v5;
      v9 = v4;
      dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

    }
    else
    {
      objc_msgSend((id)UIApp, "_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:", v5, v4);
    }

  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

- (void)_unloadHierarchyInputAccessoryViewIfNecessary
{
  void *v2;
  id v3;

  if (a1)
  {
    -[UIViewController _keyboardSceneDelegate](a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_endPersistingInputAccessoryViewWithId:", v2);

  }
}

void __27__UIViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_clearPreservedInputViewsWithRestorableResponder:", v3);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_clearPreservedInputViewsWithId:clearKeyboard:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endPersistingInputAccessoryViewWithId:", v6);

}

- (id)_keyboardSceneDelegate
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "_window");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "windowScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "keyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_objc_initiateDealloc
{
  if (self)
    *((_WORD *)&self->_viewControllerFlags + 4) |= 0x80u;
  _UIDeallocOnMainThread(self);
}

void __52__UIViewController__setViewAppearState_isAnimating___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  char v13;

  v3 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__UIViewController__setViewAppearState_isAnimating___block_invoke_2;
  v12[3] = &__block_descriptor_41_e26_v16__0__UIViewController_8l;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 48);
  v4 = (void (**)(void *, id))_Block_copy(v12);
  objc_msgSend(v3, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v5, "isDescendantOfView:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v4[2](v4, v3);
  }
  else
  {
    objc_msgSend(v3, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v3, "isPerformingModalTransition") & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v3, "childModalViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v3, "childModalViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "modalPresentationStyle");

        if (v11 != 3)
          goto LABEL_7;
        objc_msgSend(v3, "childModalViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v6);
      }
    }

  }
LABEL_7:

}

void __52__UIViewController__setViewAppearState_isAnimating___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "_appearState");
  v4 = *(_DWORD *)(a1 + 32);
  if (v3 != v4)
  {
    if (v7)
    {
      v7[46] = v7[46] & 0xFFFFFFFFFFFFFFF9 | (2 * (*(_DWORD *)(a1 + 32) & 3u));
      v4 = *(_DWORD *)(a1 + 32);
    }
    if ((v3 - 1) >= 2 && v4 == 1)
    {
      objc_msgSend(v7, "_existingView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && (objc_msgSend(v5, "_viewDelegateContentOverlayInsetsAreClean") & 1) == 0)
        objc_msgSend(v7, "_updateContentOverlayInsetsForSelfAndChildren");

    }
  }
  -[UIViewController _setViewAppearState:isAnimating:](v7, *(unsigned int *)(a1 + 36), *(unsigned __int8 *)(a1 + 40));

}

- (UIViewController)init
{
  return -[UIViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (void)_setIgnoreAppSupportedOrientations:(BOOL)a3
{
  self->_ignoreAppSupportedOrientations = a3;
}

- (void)setToolbarItems:(NSArray *)toolbarItems
{
  -[UIViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", toolbarItems, 0);
}

- (void)_setExpectedWindow:(id)a3
{
  objc_storeStrong((id *)&self->_expectedWindow, a3);
}

- (void)setAppearanceTransitionsAreDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)endAppearanceTransition
{
  -[UIViewController _endAppearanceTransition:]((uint64_t)self, 0);
}

- (void)setFinishingModalTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (void)setPerformingModalTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (double)durationForTransition:(int)a3
{
  double result;

  +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", *(_QWORD *)&a3);
  return result;
}

uint64_t __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "willAnimateRotationToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didRotateFromInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke(uint64_t result)
{
  void *v1;

  v1 = *(void **)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(result + 32), "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v1, "_setNeedsUserInterfaceAppearanceUpdate");
    return objc_msgSend(v1, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
  return result;
}

- (UIBarButtonItem)editButtonItem
{
  UIBarButtonItem *editButtonItem;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  UIBarButtonItem *v11;
  void *v12;

  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    if ((*(_QWORD *)&self->_viewControllerFlags & 8) != 0)
      v4 = CFSTR("Done");
    else
      v4 = CFSTR("Edit");
    _UINSLocalizedStringWithDefaultValue(v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_QWORD *)&self->_viewControllerFlags & 8) != 0)
      v6 = CFSTR("Edit");
    else
      v6 = CFSTR("Done");
    _UINSLocalizedStringWithDefaultValue(v6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(_QWORD *)&self->_viewControllerFlags >> 2) & 2;
    v9 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", v5, v8, self, sel__toggleEditing_);
    v10 = self->_editButtonItem;
    self->_editButtonItem = v9;

    v11 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", v7, v8 ^ 2, 0, 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_editButtonItem, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem _setPossibleItemVariations:](self->_editButtonItem, "_setPossibleItemVariations:", v12);

    editButtonItem = self->_editButtonItem;
  }
  return editButtonItem;
}

- (void)setAdditionalSafeAreaInsets:(UIEdgeInsets)additionalSafeAreaInsets
{
  if (additionalSafeAreaInsets.left != self->_additionalSafeAreaInsets.left
    || additionalSafeAreaInsets.top != self->_additionalSafeAreaInsets.top
    || additionalSafeAreaInsets.right != self->_additionalSafeAreaInsets.right
    || additionalSafeAreaInsets.bottom != self->_additionalSafeAreaInsets.bottom)
  {
    self->_additionalSafeAreaInsets = additionalSafeAreaInsets;
    -[UIViewController _updateContentOverlayInsetsForSelfAndChildren](self, "_updateContentOverlayInsetsForSelfAndChildren");
  }
}

- (void)dealloc
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  UILayoutSupport *topLayoutGuide;
  UILayoutSupport *v13;
  UILayoutSupport *bottomLayoutGuide;
  UIViewController *v15;
  UIView *view;
  UIView *embeddedView;
  NSString *title;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *childViewControllers;
  UIViewController *parentViewController;
  UIViewController *parentModalViewController;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  UIViewController *presentedStatusBarViewController;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  UIViewControllerAction *currentAction;
  UIBarButtonItem *editButtonItem;
  UINavigationItem *navigationItem;
  NSMapTable *overrideTraitCollectionsForChildren;
  id WeakRetained;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  SEL v51;
  void *context;
  objc_super v53;
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _QWORD v75[7];

  v75[4] = *MEMORY[0x1E0C80C00];
  if (!self || (*((_WORD *)&self->_viewControllerFlags + 4) & 0x80) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (objc_class *)objc_opt_class();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 3276, CFSTR("Application circumvented Objective-C runtime dealloc initiation for <%s> object."), class_getName(v48));

  }
  v51 = a2;
  context = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = CFSTR("UIApplicationSuspendedNotification");
  v75[1] = CFSTR("UIApplicationResumedNotification");
  v75[2] = CFSTR("UIApplicationWantsViewsToDisappearNotification");
  v75[3] = CFSTR("UIAccessibilityLargeTextChangedNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v6 = self->_previewSourceViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "unregister");
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v8);
  }

  v11 = -[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self);
  topLayoutGuide = self->_topLayoutGuide;
  if (v11)
  {
    -[UILayoutSupport removeFromSuperview](topLayoutGuide, "removeFromSuperview");
    -[UILayoutSupport removeFromSuperview](self->_bottomLayoutGuide, "removeFromSuperview");
  }
  else
  {
    _removeLayoutGuide(topLayoutGuide);
    _removeLayoutGuide(self->_bottomLayoutGuide);
  }
  v13 = self->_topLayoutGuide;
  self->_topLayoutGuide = 0;

  bottomLayoutGuide = self->_bottomLayoutGuide;
  self->_bottomLayoutGuide = 0;

  objc_msgSend((id)qword_1EDDB0F88, "removeObject:", self);
  -[UIView __viewDelegate]((id *)&self->_view->super.super.isa);
  v15 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v15 == self)
    -[UIView __setViewDelegate:](&self->_view->super.super.isa, 0);
  view = self->_view;
  if (view)
  {
    *(_QWORD *)&view->_viewFlags &= ~0x80000000uLL;
    view = self->_view;
  }
  self->_view = 0;

  if (dyld_program_sdk_at_least())
  {
    embeddedView = self->__embeddedView;
    self->__embeddedView = 0;

  }
  else
  {
    objc_storeWeak((id *)&self->_transitioningDelegate, 0);
  }
  title = self->_title;
  self->_title = 0;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v19 = self->_childViewControllers;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v64;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v64 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v23);
        if (*(_QWORD *)(v24 + 104))
        {
          if (os_variant_has_internal_diagnostics() && *(UIViewController **)(v24 + 104) != self)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", v51, self, CFSTR("UIViewController.m"), 3330, CFSTR("Child VC has a different parent VC than self <%@: %p>: %@, parent: %@"), v49, self, v24, *(_QWORD *)(v24 + 104));

          }
          *(_QWORD *)(v24 + 104) = 0;
        }
        ++v23;
      }
      while (v21 != v23);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      v21 = v26;
    }
    while (v26);
  }

  v27 = self->_childViewControllers;
  childViewControllers = self->_childViewControllers;
  self->_childViewControllers = 0;

  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    -[UIViewController removeChildViewController:](parentViewController, "removeChildViewController:", self);
    self->_parentViewController = 0;
  }
  parentModalViewController = self->_parentModalViewController;
  if (parentModalViewController)
  {
    v61 = 0u;
    v62 = 0u;
    v60 = 0u;
    v59 = 0u;
    v31 = parentModalViewController->_childModalViewControllers;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v60 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "setParentModalViewController:", 0);
        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v33);
    }

    self->_parentModalViewController = 0;
  }
  presentedStatusBarViewController = self->_presentedStatusBarViewController;
  self->_presentedStatusBarViewController = 0;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v37 = self->_childModalViewControllers;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v56 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "setParentModalViewController:", 0);
      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v39);
  }

  currentAction = self->_currentAction;
  self->_currentAction = 0;

  editButtonItem = self->_editButtonItem;
  self->_editButtonItem = 0;

  navigationItem = self->_navigationItem;
  self->_navigationItem = 0;

  overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
  self->_overrideTraitCollectionsForChildren = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchDisplayController);
  objc_msgSend(WeakRetained, "_clearViewController");

  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __27__UIViewController_dealloc__block_invoke;
  v54[3] = &unk_1E16C1E50;
  v54[4] = self;
  +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v54);
  -[UIViewController _setExtensionContextUUID:](self, "_setExtensionContextUUID:", 0);

  objc_autoreleasePoolPop(context);
  v53.receiver = self;
  v53.super_class = (Class)UIViewController;
  -[UIResponder dealloc](&v53, sel_dealloc);
}

- (void)_setExtensionContextUUID:(id)a3
{
  objc_setAssociatedObject(self, &kExtensionContextUUIDKey, a3, (void *)1);
}

- (NSExtensionContext)extensionContext
{
  void *v3;
  UIViewController *v4;
  BOOL v5;
  UIViewController *v6;
  UIViewController *v7;
  UIViewController *v8;
  void *v9;
  char isKindOfClass;
  UIViewController *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;

  -[UIViewController _extensionContextUUID](self, "_extensionContextUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  v5 = v3 == 0;
  if (v4 && !v3)
  {
    do
    {
      v6 = v4->_parentViewController;
      v7 = v6;
      if (v6)
      {
        v8 = v4;
        v4 = v6;
      }
      else
      {
        -[UIViewController _parentModalViewController](v4, "_parentModalViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v11 = v9;
        v8 = v11;
        if ((isKindOfClass & 1) != 0)
        {
          -[UIViewController localViewController](v11, "localViewController");
          v12 = objc_claimAutoreleasedReturnValue();

          v4 = v8;
        }
        else
        {
          v12 = (uint64_t)v11;
        }

        v4 = (UIViewController *)v12;
      }

      -[UIViewController _extensionContextUUID](v4, "_extensionContextUUID");
      v13 = objc_claimAutoreleasedReturnValue();
      v5 = v13 == 0;
      if (v13)
        v14 = 1;
      else
        v14 = v4 == 0;
    }
    while (!v14);
    v3 = (void *)v13;
  }
  if (v5)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B70], "_sharedExtensionContextVendor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_extensionContextForUUID:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSExtensionContext *)v15;
}

- (id)_extensionContextUUID
{
  return objc_getAssociatedObject(self, &kExtensionContextUUIDKey);
}

- (id)_viewControllerForObservableScrollView
{
  void *v3;
  UIViewController *v4;

  if (-[UIViewController _shouldRequestViewControllerForObservableScrollViewFromPresentedViewController](self))
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_viewControllerForObservableScrollView");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (_UIFocusPlatformBehavior)_focusBehavior
{
  void *v2;
  void *v3;

  -[UIViewController _focusSystem](self, "_focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIFocusPlatformBehavior *)v3;
}

- (BOOL)_containsFirstResponder
{
  void *v4;
  char v5;

  if (-[UIResponder isFirstResponder](self, "isFirstResponder")
    || -[UIView _isAncestorOfFirstResponder](self->_view, "_isAncestorOfFirstResponder"))
  {
    return 1;
  }
  -[UINavigationItem titleView](self->_navigationItem, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isAncestorOfFirstResponder");

  return v5;
}

- (BOOL)_isHostedRootViewController
{
  return 0;
}

- (void)_setNavigationControllerContentOffsetAdjustment:(double)a3
{
  void *v5;
  id v6;

  if (self->_navigationControllerContentOffsetAdjustment != a3)
  {
    -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "contentOffset");
      objc_msgSend(v6, "setContentOffset:");
      v5 = v6;
    }
    self->_navigationControllerContentOffsetAdjustment = a3;

  }
}

- (void)viewWillDisappear:(BOOL)animated
{
  if ((~*(_DWORD *)&self->_viewControllerFlags & 6) != 0)
  {
    UIViewControllerAlertForAppearanceCallbackMisuse(CFSTR("-viewWillDisappear:"), self);
    *(_QWORD *)&self->_viewControllerFlags |= 6uLL;
  }
}

void __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", *(unsigned __int8 *)(a1 + 40));

}

- (uint64_t)_endAppearanceTransition:(uint64_t)a1
{
  void (**v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if ((*(_QWORD *)(a1 + 368) & 0x8000000) != 0)
    {
LABEL_6:
      a1 = 0;
      goto LABEL_14;
    }
    v4 = objc_msgSend((id)a1, "isInAnimatedVCTransition");
    v5 = *(_QWORD *)(a1 + 328);
    *(_QWORD *)(a1 + 328) = v5 - 1;
    if (v5 <= 0)
    {
      NSLog(CFSTR("Unbalanced calls to begin/end appearance transitions for %@."), a1);
      *(_QWORD *)(a1 + 328) = 0;
    }
    else if (v5 != 1 && (objc_msgSend((id)a1, "_forwardAppearanceMethods") & 1) != 0)
    {
      goto LABEL_6;
    }
    objc_msgSend((id)a1, "setInAnimatedVCTransition:", 0);
    if ((*(_QWORD *)(a1 + 368) & 0x4000000) != 0)
    {
      objc_msgSend((id)a1, "__viewDidAppear:", v4);
      if (!v3)
      {
LABEL_13:
        a1 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      -[UIViewController __viewDidDisappear:](a1, v4);
      if (!v3)
        goto LABEL_13;
    }
    v3[2](v3);
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (BOOL)isInAnimatedVCTransition
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 22) & 1;
}

- (void)__viewDidAppear:(BOOL)a3
{
  uint64_t viewControllerFlags;
  _BOOL8 v5;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 6) == 4)
  {
    self->_explicitAppearanceTransitionLevel = 0;
  }
  else
  {
    v5 = a3;
    if ((viewControllerFlags & 0x40000000) == 0 && self->_afterAppearance)
      -[UIViewController setAfterAppearanceBlock:](self, "setAfterAppearanceBlock:", 0);
    if (self->_explicitAppearanceTransitionLevel >= 1)
      self->_explicitAppearanceTransitionLevel = 0;
    *(_QWORD *)&self->_viewControllerFlags |= 0x4000000uLL;
    -[UIViewController _setViewAppearState:isAnimating:]((uint64_t)self, 2, v5);
    -[UIViewController _setAvoidanceInsetsNeedsUpdate](self, "_setAvoidanceInsetsNeedsUpdate");
  }
}

- (void)_setAvoidanceInsetsNeedsUpdate
{
  void *v2;
  id v3;

  -[UIViewController _existingView](self, "_existingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_noteOverlayInsetsDidChange");

}

- (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated
{
  _BOOL8 v4;
  _BOOL4 v5;
  int64_t explicitAppearanceTransitionLevel;
  uint64_t viewControllerFlags;
  __int16 v9;
  uint64_t v10;

  if ((*(_QWORD *)&self->_viewControllerFlags & 0x8000000) == 0)
  {
    v4 = animated;
    v5 = isAppearing;
    explicitAppearanceTransitionLevel = self->_explicitAppearanceTransitionLevel;
    self->_explicitAppearanceTransitionLevel = explicitAppearanceTransitionLevel + 1;
    viewControllerFlags = (uint64_t)self->_viewControllerFlags;
    if (explicitAppearanceTransitionLevel < 1)
    {
      v9 = *((_WORD *)&self->_viewControllerFlags + 4);
    }
    else
    {
      if (((((*(_QWORD *)&self->_viewControllerFlags & 0x4000000) == 0) ^ isAppearing) & 1) != 0)
        return;
      self->_explicitAppearanceTransitionLevel = 1;
      viewControllerFlags = (uint64_t)self->_viewControllerFlags;
      v9 = *((_WORD *)&self->_viewControllerFlags + 4);
    }
    v10 = 0x4000000;
    if (!isAppearing)
      v10 = 0;
    *((_WORD *)&self->_viewControllerFlags + 4) = v9;
    *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v10;
    -[UIViewController setInAnimatedVCTransition:](self, "setInAnimatedVCTransition:", animated);
    if (v5)
      -[UIViewController __viewWillAppear:](self, "__viewWillAppear:", v4);
    else
      -[UIViewController __viewWillDisappear:]((uint64_t)self, v4);
  }
}

- (void)setInAnimatedVCTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (void)__viewDidDisappear:(uint64_t)a1
{
  uint64_t v3;
  __int16 v5;
  unint64_t v6;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 368);
    if ((v3 & 6) != 0)
    {
      v5 = *(_WORD *)(a1 + 376);
      v6 = v3 & 0xFFFFFFFFFBFFFFFFLL;
      *(_QWORD *)(a1 + 368) = v6;
      *(_WORD *)(a1 + 376) = v5;
      if (*(uint64_t *)(a1 + 328) >= 1)
      {
        *(_QWORD *)(a1 + 328) = 0;
        v6 = *(_QWORD *)(a1 + 368);
      }
      if ((v6 & 0x40000000) == 0)
      {
        if (*(_QWORD *)(a1 + 320))
          objc_msgSend((id)a1, "setAfterAppearanceBlock:", 0);
      }
      -[UIViewController _setViewAppearState:isAnimating:](a1, 0, a2);
      -[UIViewController _unloadHierarchyInputAccessoryViewIfNecessary]((void *)a1);
      *(_QWORD *)(a1 + 368) &= ~0x10000000000uLL;
    }
    else
    {
      *(_QWORD *)(a1 + 328) = 0;
    }
  }
}

- (BOOL)isBeingDismissed
{
  uint64_t viewControllerFlags;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x1800000) == 0x800000)
    return 1;
  return (viewControllerFlags & 0x100000000200000) != 0
      && (viewControllerFlags & 0x800000) != 0
      && ((viewControllerFlags >> 1) & 3) - 3 < 0xFFFFFFFE;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)preferredContentSize
{
  CGSize *p_preferredContentSize;
  double height;
  double width;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;

  p_preferredContentSize = &self->_preferredContentSize;
  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  if (width != preferredContentSize.width || height != preferredContentSize.height)
  {
    v8 = height != 0.0 && width != 0.0;
    p_preferredContentSize->width = preferredContentSize.width;
    self->_preferredContentSize.height = preferredContentSize.height;
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIViewController _existingView](self, "_existingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIPopoverView popoverViewContainingView:](_UIPopoverView, "popoverViewContainingView:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[UIViewController _popoverController](self, "_popoverController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v30 = v11;
          v13 = objc_msgSend(v11, "_embedsInView");
          v12 = v30;
          if ((v13 & 1) == 0)
          {
            objc_msgSend(v30, "contentViewController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "presentedViewController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "contentViewController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v20)
            {
              objc_msgSend(v21, "presentedViewController");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "preferredContentSize");
              v25 = v24;
              v27 = v26;

            }
            else
            {
              objc_msgSend(v21, "preferredContentSize");
              v25 = v28;
              v27 = v29;
            }

            if (v27 == 0.0 || v25 == 0.0)
            {
              v25 = p_preferredContentSize->width;
              v27 = p_preferredContentSize->height;
            }
            objc_msgSend(v30, "setPopoverContentSize:animated:", v8, v25, v27);
            goto LABEL_24;
          }
        }

      }
    }
    -[UIViewController _existingPresentationControllerImmediate:effective:includesRoot:prefersRoot:](self, 1, 1, 1, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_childPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && (objc_msgSend(v14, "shouldPresentInFullscreen") & 1) == 0)
    {
      if ((objc_msgSend(v15, "shouldRemovePresentersView") & 1) != 0)
      {
LABEL_23:

LABEL_24:
        return;
      }
      v16 = v15;
    }
    else
    {
      v16 = v30;
      if (!v30)
      {
        -[UIViewController parentViewController](self, "parentViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "_preferredContentSizeDidChangeForChildViewController:", self);
          objc_msgSend(v18, "preferredContentSizeDidChangeForChildContentContainer:", self);
        }

        goto LABEL_23;
      }
    }
    objc_msgSend(v16, "preferredContentSizeDidChangeForChildContentContainer:", self);
    goto LABEL_23;
  }
}

- (id)_firstResponder
{
  void *v3;
  void *v4;
  objc_super v6;

  if (!-[UIViewController isViewLoaded](self, "isViewLoaded")
    || (-[UIViewController view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_firstResponder"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIViewController;
    -[UIResponder _firstResponder](&v6, sel__firstResponder);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_canBecomeFirstResponder
{
  void *v3;
  int v4;
  objc_super v6;

  if ((~*(_DWORD *)&self->_viewControllerFlags & 6) == 0)
  {
    -[UIResponder _responderWindow](self, "_responderWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isHostedInAnotherProcess");

    if (!v4)
      return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIViewController;
  return -[UIResponder _canBecomeFirstResponder](&v6, sel__canBecomeFirstResponder);
}

+ (double)_boundsWidthWithMinimumHorizontalContentMarginForView:(id)a3 preservingContentWidth:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_slimHorizontalContentMarginForTraitCollection:", v7);
  v9 = v8 + v8 + a4;

  objc_msgSend((id)objc_opt_class(), "_horizontalContentMarginForView:ofWidth:", v5, v9);
  v11 = v10;

  return v11 + v11 + a4;
}

+ (double)_slimHorizontalContentMarginForTraitCollection:(id)a3
{
  return 16.0;
}

- (void)_updateLastKnownInterfaceOrientationOnPresentionStack:(uint64_t)a1
{
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[6];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_windowOwnsInterfaceOrientation");

    if ((v5 & 1) != 0)
    {
      if ((objc_msgSend((id)a1, "_isPresentedFormSheet") & 1) == 0
        && objc_msgSend((id)a1, "shouldAutorotate"))
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __74__UIViewController__updateLastKnownInterfaceOrientationOnPresentionStack___block_invoke;
        v15[3] = &unk_1E16B7A60;
        v15[4] = a1;
        v15[5] = a2;
        -[UIViewController __withSupportedInterfaceOrientation:apply:]((void *)a1, a2, v15);
      }
    }
    else
    {
      *(_QWORD *)(a1 + 256) = a2;
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = *(id *)(a1 + 112);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a2);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)_isPresentedFormSheet
{
  UIViewController *parentViewController;

  if (self->_parentModalViewController
    && (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
     || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet
     || self->_parentModalViewController
     && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationCurrentContext
     && -[UIViewController _isPresentedFormSheet](self->_parentModalViewController, "_isPresentedFormSheet")))
  {
    LOBYTE(parentViewController) = 1;
  }
  else
  {
    parentViewController = self->_parentViewController;
    if (parentViewController)
      LOBYTE(parentViewController) = -[UIViewController _isPresentedFormSheet](parentViewController, "_isPresentedFormSheet");
  }
  return (char)parentViewController;
}

- (id)_safeViewControllerForRotationWithDismissCheck:(BOOL)a3
{
  void *v5;
  void *v6;

  -[UIViewController _viewControllerForRotationWithDismissCheck:](self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__autorotationSanityCheckObjectFromSource:selector:", self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isViewControllerInWindowHierarchy
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)applicationWillSuspend
{
  *(_QWORD *)&self->_viewControllerFlags |= 0x200uLL;
}

- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6
{
  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1, a4, a5, a6.width, a6.height);
  -[UIViewController _willRotateToInterfaceOrientation](self);
}

- (double)_statusBarHeightForCurrentInterfaceOrientation
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.0;
  if (v3 && (unint64_t)(objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3) - 1) <= 3)
  {
    __UIStatusBarManagerForWindow(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusBarHeight");
    v4 = v6;

  }
  return v4;
}

- (UIViewController)parentModalViewController
{
  return self->_parentModalViewController;
}

- (UIViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIViewController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  CFMutableDictionaryRef v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  int v57;
  uint64_t v58;
  _BOOL4 v59;
  uint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char v79;
  __int16 v80;
  unint64_t v81;
  _QWORD *v82;
  _BOOL4 v83;
  __int16 v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = coder;
  v100.receiver = self;
  v100.super_class = (Class)UIViewController;
  v5 = -[UIViewController init](&v100, sel_init);
  v6 = (uint64_t)v5;
  if (!v5)
    goto LABEL_74;
  -[UIViewController _populateInitialTraitCollection]((uint64_t)v5);
  -[NSCoder _initializeClassSwapperWithCurrentDecodingViewControllerIfNeeded:](v4, "_initializeClassSwapperWithCurrentDecodingViewControllerIfNeeded:", v6);
  if (objc_msgSend((id)v6, "_shouldPersistViewWhenCoding"))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIView"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v7;

    if (*(_QWORD *)(v6 + 32))
    {
      objc_msgSend((id)objc_opt_class(), "setViewController:forView:", v6, *(_QWORD *)(v6 + 32));
      *(_QWORD *)(*(_QWORD *)(v6 + 32) + 104) |= 0x80000000uLL;
      *(_QWORD *)(v6 + 368) |= 0x80uLL;
    }
  }
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v10;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITabBarItem"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINavigationItem"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  *(_QWORD *)(v6 + 104) = -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIParentViewController"));
  v16 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIWantsFullScreenLayout"));
  v17 = 64;
  if (v16)
    v17 = 1088;
  *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFFFFFFFFBFFLL | v17;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAutoresizesArchivedViewToFullSize")))
  {
    v18 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIAutoresizesArchivedViewToFullSize"));
    v19 = 64;
    if (!v18)
      v19 = 0;
    *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFFFFFFFFFBFLL | v19;
  }
  -[UIViewController autoresizeArchivedView]((void *)v6);
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStoryboardSegueTemplates"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = *(void **)(v6 + 608);
  *(_QWORD *)(v6 + 608) = v21;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStoryboardPreviewSegueTemplates"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "copy");
  v25 = *(void **)(v6 + 712);
  *(_QWORD *)(v6 + 712) = v24;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStoryboardCommitSegueTemplates"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "copy");
  v28 = *(void **)(v6 + 720);
  *(_QWORD *)(v6 + 720) = v27;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStoryboardPreviewingRegistrants"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "copy");
  v31 = *(void **)(v6 + 728);
  *(_QWORD *)(v6 + 728) = v30;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIExternalObjectsTableForViewLoading"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFDictionaryCreateWithNonRetainedValuesFromNSDictionary(v32);
  v34 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v33;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITopLevelObjectsToKeepAliveFromStoryboard"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "copy");
  v37 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v36;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINibName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copy");
  v40 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v39;

  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UINibBundleIdentifier")))
  {
    v41 = (void *)MEMORY[0x1E0CB34D0];
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UINibBundleIdentifier"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bundleWithIdentifier:", v42);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = v43;

LABEL_15:
    goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(v6 + 88), "length"))
  {
    UIResourceBundleForNIBBeingDecodedWithCoder(v4);
    v45 = objc_claimAutoreleasedReturnValue();
    v42 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = v45;
    goto LABEL_15;
  }
LABEL_16:
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIToolbarItems"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v46;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIChildViewControllerSelectors"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "_setCustomChildViewControllerSelectorsNames:", v48);

  -[NSCoder _decodeObjectsAndTrackChildViewControllerIndexWithParent:forKey:](v4, "_decodeObjectsAndTrackChildViewControllerIndexWithParent:forKey:", v6, CFSTR("UIChildViewControllers"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = objc_opt_new();
    v51 = *(void **)(v6 + 456);
    *(_QWORD *)(v6 + 456) = v50;

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v52 = v49;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v97 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(*(id *)(v6 + 456), "addObject:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i), (_QWORD)v96);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      }
      while (v54);
    }

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIDefinesPresentationContext"), (_QWORD)v96))
    v57 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIDefinesPresentationContext"));
  else
    v57 = objc_msgSend((id)v6, "_isPresentationContextByDefault");
  v58 = 0x40000;
  if (!v57)
    v58 = 0;
  *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFFFFFFBFFFFLL | v58;
  v59 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIProvidesPresentationContextTransitionStyle"));
  v60 = 0x80000;
  if (!v59)
    v60 = 0;
  *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFFFFFF7FFFFLL | v60;
  v61 = -[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIRestoresFocusAfterTransition"));
  v62 = 0;
  if (v61)
  {
    v63 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIRestoresFocusAfterTransition"));
    v62 = 0x400000000000;
    if (v63)
      v62 = 0x800000000000;
  }
  *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFF3FFFFFFFFFFFLL | v62;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIModalTransitionStyle")))
    v64 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIModalTransitionStyle"));
  else
    v64 = _UIViewControllerDefaultModalTransitionStyle((void *)v6);
  *(_QWORD *)(v6 + 232) = v64;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIModalPresentationStyle")))
  {
    v65 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIModalPresentationStyle"));
  }
  else if (dyld_program_sdk_at_least())
  {
    v65 = -2;
  }
  else
  {
    v65 = 0;
  }
  *(_QWORD *)(v6 + 240) = v65;
  v66 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIHidesBottomBarWhenPushed"));
  v67 = 32;
  if (!v66)
    v67 = 0;
  *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFFFFFFFFFDFLL | v67;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIContentSizeForViewInPopover")))
  {
    -[NSCoder decodeCGSizeForKey:](v4, "decodeCGSizeForKey:", CFSTR("UIContentSizeForViewInPopover"));
    *(_QWORD *)(v6 + 272) = v68;
    *(_QWORD *)(v6 + 280) = v69;
  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIPreferredContentSize")))
  {
    -[NSCoder decodeCGSizeForKey:](v4, "decodeCGSizeForKey:", CFSTR("UIPreferredContentSize"));
    *(_QWORD *)(v6 + 808) = v70;
    *(_QWORD *)(v6 + 816) = v71;
  }
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIRestorationIdentifier"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
    objc_msgSend((id)v6, "setRestorationIdentifier:", v72);
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStoryboardIdentifier"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
    objc_storeStrong((id *)(v6 + 384), v73);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyCommands")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIKeyCommands"));
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = *(void **)(v6 + 336);
    *(_QWORD *)(v6 + 336) = v74;

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIAddedKeyCommands")))
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIAddedKeyCommands"));
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = *(void **)(v6 + 344);
    *(_QWORD *)(v6 + 344) = v76;

  }
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyEdgesForExtendedLayout")))
    v78 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyEdgesForExtendedLayout"));
  else
    v78 = 15;
  *(_QWORD *)(v6 + 680) = v78;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyExtendedLayoutIncludesOpaqueBars")))
    *(_QWORD *)(v6 + 368) = *(_QWORD *)(v6 + 368) & 0xFFFFFFDFFFFFFFFFLL | ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyExtendedLayoutIncludesOpaqueBars")) & 1) << 37);
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIKeyAutomaticallyAdjustsScrollViewInsets")))
  {
    v79 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIKeyAutomaticallyAdjustsScrollViewInsets"));
    v80 = *(_WORD *)(v6 + 376);
    v81 = *(_QWORD *)(v6 + 368) & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(v79 & 1) << 38);
  }
  else
  {
    v80 = *(_WORD *)(v6 + 376);
    v81 = *(_QWORD *)(v6 + 368) | 0x4000000000;
  }
  v82 = (_QWORD *)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v81;
  *(_WORD *)(v6 + 376) = v80;
  if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIViewControllerViewRespectsSystemMinimumLayoutMargins")))
  {
    v83 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIViewControllerViewRespectsSystemMinimumLayoutMargins"));
    v84 = *(_WORD *)(v6 + 376);
    v85 = 0x8000000000000;
    if (!v83)
      v85 = 0;
    v86 = *v82 & 0xFFF7FFFFFFFFFFFFLL | v85;
  }
  else
  {
    v84 = *(_WORD *)(v6 + 376);
    v86 = *v82 | 0x8000000000000;
  }
  *(_QWORD *)(v6 + 368) = v86;
  *(_WORD *)(v6 + 376) = v84;
  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIViewControllerTopLayoutGuide"));
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = *(void **)(v6 + 536);
  *(_QWORD *)(v6 + 536) = v87;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIViewControllerBottomLayoutGuide"));
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = *(void **)(v6 + 544);
  *(_QWORD *)(v6 + 544) = v89;

  if (*(_QWORD *)(v6 + 536) || *(_QWORD *)(v6 + 544))
    *(_QWORD *)(v6 + 368) |= 0x100000000000uLL;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIViewControllerInteractionActivityTrackingBaseName"));
  v91 = objc_claimAutoreleasedReturnValue();
  v92 = *(void **)(v6 + 568);
  *(_QWORD *)(v6 + 568) = v91;

  -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIViewControllerObservableScrollViews"));
  v93 = objc_claimAutoreleasedReturnValue();
  v94 = *(void **)(v6 + 576);
  *(_QWORD *)(v6 + 576) = v93;

  -[UIViewController _doCommonSetup](v6);
LABEL_74:

  return (UIViewController *)v6;
}

- (void)autoresizeArchivedView
{
  id v2;

  if (objc_msgSend(a1, "autoresizesArchivedViewToFullSize"))
  {
    if (objc_msgSend(a1, "isViewLoaded"))
    {
      objc_msgSend(a1, "_existingView");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_defaultInitialViewFrame");
      objc_msgSend(v2, "setFrame:");

    }
  }
}

- (BOOL)autoresizesArchivedViewToFullSize
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 6) & 1;
}

- (void)_setCustomChildViewControllerSelectorsNames:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_setAssociatedObject(self, &_UIViewControllerCustomChildViewControllerSelectorsNamesKey, v4, (void *)1);

}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 1;
}

- (SEL)_customSelectorToCreateChildViewControllerAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  const char *v10;

  -[UIViewController _customChildViewControllerSelectorsNames](self, "_customChildViewControllerSelectorsNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[UIViewController _customChildViewControllerSelectorsNames](self, "_customChildViewControllerSelectorsNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
    v10 = NSSelectorFromString(v8);
  else
    v10 = 0;

  return v10;
}

- (id)_customChildViewControllerSelectorsNames
{
  return objc_getAssociatedObject(self, &_UIViewControllerCustomChildViewControllerSelectorsNamesKey);
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  void *v6;
  void *v7;

  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v6, self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  UIViewController *v9;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v11;
  _UITraitChangeRegistry *v12;
  void *v13;

  v8 = a3;
  v9 = (UIViewController *)a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    v11 = objc_alloc_init(_UITraitChangeRegistry);
    v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v11;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)useLayoutToLayoutNavigationTransitions
{
  return 0;
}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_title != title)
  {
    v4 = title;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    v6 = self->_title;
    self->_title = v5;

    -[UIViewController _existingNavigationItem](self, "_existingNavigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v4);

    -[UIViewController _existingTabBarItem](self, "_existingTabBarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v4);

    -[UIViewController parentViewController](self, "parentViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateTitleForViewController:", self);

  }
}

- (id)_existingNavigationItem
{
  return self->_navigationItem;
}

- (id)_existingTabBarItem
{
  return self->_tabBarItem;
}

- (BOOL)_usesSharedView
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 36) & 1;
}

- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  UITraitCollection *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  UITraitCollection *v14;
  UITraitCollection *frozenTraitCollection;
  UITraitCollection *v16;
  UITraitCollection *v17;
  UITraitCollection *v18;
  id v19;
  _QWORD v20[5];
  UITraitCollection *v21;
  UITraitCollection *v22;
  id v23;

  v19 = a3;
  v8 = (UITraitCollection *)a4;
  v9 = a5;
  -[UIViewController _parentTraitEnvironment](self, "_parentTraitEnvironment");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v19)
  {
    if (!_UIViewControllersInheritTraitsFromViewHierarchy())
    {
LABEL_5:
      v14 = v8;
      goto LABEL_14;
    }
    -[UIViewController parentViewController](self, "parentViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    if ((id)v11 == v19)
    {

    }
    else
    {
      v12 = (void *)v11;
      -[UIViewController _departingParentViewController](self, "_departingParentViewController");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 != v19)
        goto LABEL_5;
    }
  }
  frozenTraitCollection = self->_frozenTraitCollection;
  if (frozenTraitCollection)
  {
    v16 = frozenTraitCollection;
  }
  else
  {
    -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v8);
    v16 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v16;

  -[UIViewController traitCollection](self, "traitCollection");
  v17 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v14 != v17 && !-[UITraitCollection isEqual:](v17, "isEqual:", v14))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__UIViewController__parent_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v20[3] = &unk_1E16B51E8;
    v20[4] = self;
    v21 = v18;
    v22 = v14;
    v23 = v9;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v20);

  }
LABEL_14:

}

+ (void)_performWithoutDeferringTransitionsAllowingAnimation:(void *)a3 actions:
{
  _BOOL8 v4;
  char v5;
  void (**v6)(void);

  v6 = a3;
  objc_opt_self();
  if (dyld_program_sdk_at_least())
  {
    v4 = +[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions");
    objc_opt_self();
    v5 = _ShouldAnimateImmediateTransitions;
    +[UIViewController _setShouldDeferTransitions:](UIViewController, "_setShouldDeferTransitions:", 0);
    objc_opt_self();
    _ShouldAnimateImmediateTransitions = a2;
    v6[2]();
    objc_opt_self();
    _ShouldAnimateImmediateTransitions = v5;
    +[UIViewController _setShouldDeferTransitions:](UIViewController, "_setShouldDeferTransitions:", v4);
  }
  else
  {
    v6[2]();
  }

}

+ (void)_setShouldDeferTransitions:(BOOL)a3
{
  _ShouldDeferTransitions = a3;
}

+ (void)_performWithoutDeferringTransitions:(id)a3
{
  +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)a1, 0, a3);
}

+ (BOOL)_shouldDeferTransitions
{
  return _ShouldDeferTransitions;
}

uint64_t __86__UIViewController__parent_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t *a1)
{
  void *v2;
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    v5 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke___s_category;
    if (!_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke___s_category)
    {
      v5 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", a1[5], a1[6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      v12 = a1[6];
      v13 = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v13, 0x34u);

    }
  }
  return objc_msgSend((id)a1[4], "willTransitionToTraitCollection:withTransitionCoordinator:", a1[6], a1[7]);
}

- (void)_addChildViewController:(id)a3 notifyWillMove:(BOOL)a4
{
  -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", a3, 1, a4);
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  +[UIViewController _whitelistOfSubclassableViewControllersMarkedSafe](UIViewController, "_whitelistOfSubclassableViewControllersMarkedSafe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", objc_opt_class());

  return v3;
}

+ (id)_whitelistOfSubclassableViewControllersMarkedSafe
{
  if (qword_1EDDB1058 != -1)
    dispatch_once(&qword_1EDDB1058, &__block_literal_global_783);
  return (id)qword_1EDDB1050;
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
  return (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
       || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet)
      && -[UIViewController _shouldAutoPinInputViewsForModalFormSheet](self, "_shouldAutoPinInputViewsForModalFormSheet");
}

- (BOOL)_isInViewControllerThatHandlesKeyboardAvoidance
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _popoverController](self, "_popoverController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if ((objc_msgSend(v3, "_handlesKeyboardAvoidance") & 1) == 0)
  {
    -[UIViewController _multiColumnViewController](self, "_multiColumnViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v6 != 0;
    goto LABEL_6;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (id)_contentScrollView
{
  void *v2;
  uint64_t v4;
  uint64_t viewControllerFlags;
  __int16 v6;

  if ((~*(_QWORD *)&self->_viewControllerFlags & 0x1200000000000000) == 0)
    goto LABEL_2;
  -[UIViewController contentScrollView](self, "contentScrollView");
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v4;
  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x200000000000000) != 0 && (viewControllerFlags & 0x800000000000000) == 0)
  {
    if (v4)
    {
      v6 = *((_WORD *)&self->_viewControllerFlags + 4);
      *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags | 0x800000000000000;
      *((_WORD *)&self->_viewControllerFlags + 4) = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *(_QWORD *)&self->_viewControllerFlags |= 0x1000000000000000uLL;

LABEL_2:
        v2 = 0;
      }
    }
  }
  return v2;
}

- (void)setTransitioningDelegate:(id)transitioningDelegate
{
  id obj;

  obj = transitioningDelegate;
  dyld_program_sdk_at_least();
  objc_storeWeak((id *)&self->_transitioningDelegate, obj);

}

- (void)setModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
{
  self->_modalTransitionStyle = modalTransitionStyle;
}

- (void)setModalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
{
  unint64_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  UIViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_modalPresentationStyle != modalPresentationStyle)
  {
    self->_modalPresentationStyle = modalPresentationStyle;
    if (self->_temporaryPresentationController)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          v10 = 138412290;
          v11 = self;
          _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Setting modalPresentationStyle once presentationController has been accessed will have no effect until %@ is presented, dismissed, and presented again.", (uint8_t *)&v10, 0xCu);
        }

      }
      else
      {
        v4 = qword_1EDDB0FF0;
        if (!qword_1EDDB0FF0)
        {
          v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&qword_1EDDB0FF0);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v10 = 138412290;
          v11 = self;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Setting modalPresentationStyle once presentationController has been accessed will have no effect until %@ is presented, dismissed, and presented again.", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    if (self->_parentModalViewController)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          v10 = 138412290;
          v11 = self;
          _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Setting modalPresentationStyle once %@ has been presented will have no effect until it is dismissed and presented again.", (uint8_t *)&v10, 0xCu);
        }

      }
      else
      {
        v6 = qword_1EDDB0FF8;
        if (!qword_1EDDB0FF8)
        {
          v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&qword_1EDDB0FF8);
        }
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v10 = 138412290;
          v11 = self;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Setting modalPresentationStyle once %@ has been presented will have no effect until it is dismissed and presented again.", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_isViewController
{
  return 1;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
{
  uint64_t v3;

  v3 = 32;
  if (!hidesBottomBarWhenPushed)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (void)updateTraitsIfNeeded
{
  if (self->_view)
    -[UIView updateTraitsIfNeeded](self->_view, "updateTraitsIfNeeded");
  else
    -[UIViewController _updateTraitsIfNecessarySchedulingPropagation:]((uint64_t)self, 0);
}

- (void)removeFromParentViewController
{
  UIViewController *parentViewController;

  parentViewController = self->_parentViewController;
  if (parentViewController)
    -[UIViewController removeChildViewController:](parentViewController, "removeChildViewController:", self);
}

- (void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController
{
  UIViewController *v6;
  _UIViewControllerNullAnimationTransitionCoordinator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *overrideTraitCollectionsForChildren;
  NSMapTable *v13;
  NSMapTable *v14;
  UITraitCollection *v15;

  v15 = collection;
  v6 = childViewController;
  if (v6)
  {
    v7 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
    -[UIViewController _existingView](self, "_existingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerNullAnimationTransitionCoordinator setContainerView:](v7, "setContainerView:", v8);

    if ((_UIViewControllersInheritTraitsFromViewHierarchy() & 1) == 0)
    {
      v9 = (void *)objc_opt_class();
      -[UIViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_traitCollectionWithParentTraitCollection:overrideTraitCollection:", v10, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController _parent:willTransitionToTraitCollection:withTransitionCoordinator:](v6, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", self, v11, v7);
    }
    overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
    if (!overrideTraitCollectionsForChildren)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v13 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v14 = self->_overrideTraitCollectionsForChildren;
      self->_overrideTraitCollectionsForChildren = v13;

      overrideTraitCollectionsForChildren = self->_overrideTraitCollectionsForChildren;
    }
    if (v15)
      -[NSMapTable setObject:forKey:](overrideTraitCollectionsForChildren, "setObject:forKey:", v15, v6);
    else
      -[NSMapTable removeObjectForKey:](overrideTraitCollectionsForChildren, "removeObjectForKey:", v6);
    -[UIViewController _applyCompatibilityTraitOverridesForOverrideTraitCollection:](v6, v15);
    -[UIViewController _updateTraitsIfNecessary](v6, "_updateTraitsIfNecessary");
    -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v7, "_runAlongsideAnimations");
    -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](v7, "_runAlongsideCompletionsAfterCommit");

  }
}

- (void)_updateTraitsIfNecessary
{
  -[UIViewController _updateTraitsIfNecessarySchedulingPropagation:]((uint64_t)self, 1);
}

- (void)_applyCompatibilityTraitOverridesForOverrideTraitCollection:(_QWORD *)a1
{
  void *v3;
  id v4;

  v4 = a2;
  if (_UIViewControllersInheritTraitsFromViewHierarchy())
  {
    -[UIViewController _compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:](a1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v3, v4);

  }
}

- (void)addChildViewController:(UIViewController *)childController
{
  -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:](self, "_addChildViewController:performHierarchyCheck:notifyWillMove:", childController, 1, 1);
}

- (void)_setViewHostsLayoutEngine:(BOOL)a3
{
  UIView *view;

  self->_viewHostsLayoutEngine = a3;
  if (a3)
  {
    view = self->_view;
    if (view)
    {
      if (-[UIView translatesAutoresizingMaskIntoConstraints](view, "translatesAutoresizingMaskIntoConstraints"))
        -[UIView _setHostsLayoutEngine:](self->_view, "_setHostsLayoutEngine:", 1);
    }
  }
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
  unint64_t v4;
  UIViewController *v5;

  v5 = parent;
  if (!v5)
  {
    -[UIResponder _clearOverrideNextResponder](self, "_clearOverrideNextResponder");
    if (-[UIViewController _appearState](self, "_appearState") == 3)
      goto LABEL_3;
LABEL_5:
    v4 = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFEDFFFFFFLL;
    goto LABEL_6;
  }
  if (-[UIViewController _appearState](self, "_appearState") != 1)
    goto LABEL_5;
LABEL_3:
  v4 = *(_QWORD *)&self->_viewControllerFlags | 0x10000000;
LABEL_6:
  *(_QWORD *)&self->_viewControllerFlags = v4;

}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a4;
  v6 = a3;
  -[NSMutableArray removeObjectIdenticalTo:](self->_childViewControllers, "removeObjectIdenticalTo:", v6);
  -[UIViewController _removeChildViewController:](self, "_removeChildViewController:", v6);
  -[UIResponder _didChangeDeepestActionResponder](self, "_didChangeDeepestActionResponder");
  -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_viewControllerChildViewControllersDidChange:", self);

  if (v4)
    objc_msgSend(v6, "didMoveToParentViewController:", 0);
  if ((dyld_program_sdk_at_least() & 1) == 0
    && -[UIViewController allowsWeakReference](self, sel_allowsWeakReference))
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__UIViewController_removeChildViewController_notifyDidMove___block_invoke;
    v8[3] = &unk_1E16B3F40;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_removeChildViewController:(id)a3
{
  UIViewController *v4;
  id *v5;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[UIViewController _parentViewController](v7);
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 && v4 == self)
  {
    v6 = *((_WORD *)v7 + 188);
    *((_WORD *)v7 + 188) = v6 | 0x100;
    objc_msgSend(v7, "setParentViewController:", 0);
    v5 = v7;
    *((_WORD *)v7 + 188) = (_WORD)v7[47] & 0xFEFF | v6 & 0x100;
  }

}

- (void)removeChildViewController:(id)a3
{
  -[UIViewController removeChildViewController:notifyDidMove:](self, "removeChildViewController:notifyDidMove:", a3, 1);
}

- (BOOL)_isTabBarController
{
  return 0;
}

- (BOOL)_wrapsNavigationController:(id *)a3
{
  UIViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[UIViewController _isNavigationController](self, "_isNavigationController"))
  {
    v5 = self;
  }
  else
  {
    -[UIViewController childViewControllers](self, "childViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIViewController *)objc_msgSend(v6, "count");

    if (v5)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      -[UIViewController childViewControllers](self, "childViewControllers", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            if (objc_msgSend(v11, "_isNavigationController"))
            {
              v5 = v11;
              LOBYTE(v8) = 1;
              goto LABEL_17;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            continue;
          break;
        }
      }
      v5 = 0;
LABEL_17:

      if (a3)
        goto LABEL_14;
      goto LABEL_15;
    }
  }
  LOBYTE(v8) = 0;
  if (a3)
LABEL_14:
    *a3 = objc_retainAutorelease(v5);
LABEL_15:

  return v8;
}

- (void)_setLastNotifiedTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, a3);
}

- (void)_setStoryboard:(id)a3
{
  objc_storeStrong((id *)&self->_storyboard, a3);
}

- (void)setContainmentSupport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)_viewControllerWasSelected
{
  return 0;
}

- (void)_enumerateAncestorViewControllersUntilStop:(BOOL *)a3 usingBlock:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, UIViewController *, BOOL *);

  v8 = (void (**)(id, UIViewController *, BOOL *))a4;
  -[UIViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "_enumerateAncestorViewControllersUntilStop:usingBlock:", a3, v8);
  if (!*a3)
    v8[2](v8, self, a3);

}

- (id)_backdropBarGroupName
{
  return 0;
}

- (void)_updateToolbarItemsFromViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIViewController parentViewController](self, "parentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateToolbarItemsFromViewController:animated:", v6, v4);

}

- (void)setToolbarItems:(NSArray *)toolbarItems animated:(BOOL)animated
{
  _BOOL8 v4;
  NSArray *v7;
  void *v8;
  NSArray *v9;

  v4 = animated;
  v7 = toolbarItems;
  if (self->_toolbarItems != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_toolbarItems, toolbarItems);
    -[UIViewController parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateToolbarItemsFromViewController:animated:", self, v4);

    v7 = v9;
  }

}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

uint64_t __34__UIViewController__doCommonSetup__block_invoke_2()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    objc_opt_class();
    return _class_setCustomDeallocInitiation();
  }
  return result;
}

- (int64_t)_rotatingToInterfaceOrientation
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "_fromWindowOrientation");
    v5 = objc_msgSend(v3, "_toWindowOrientation");
    if (v4 == v5)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "window:didRotateFromInterfaceOrientation:oldSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 48), "finishFullRotateUsingOnePartAnimation:", 1);
}

- (void)_window:(id)a3 viewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  UIClientRotationContext *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UIClientRotationContext *v23;
  _QWORD v24[5];
  id v25;
  double v26;
  double v27;
  _QWORD v28[5];
  id v29;
  UIClientRotationContext *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  UIClientRotationContext *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  _QWORD v41[5];
  id v42;
  double v43;
  double v44;
  CGAffineTransform v45;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "targetTransform");
  else
    memset(&v45, 0, sizeof(v45));
  if (CGAffineTransformIsIdentity(&v45))
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v41[3] = &unk_1E16B80A8;
    v41[4] = self;
    v43 = width;
    v44 = height;
    v42 = v11;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v41);

  }
  else
  {
    objc_msgSend(v11, "transitionDuration");
    v13 = v12;
    v14 = objc_msgSend(v9, "_toWindowOrientation");
    v15 = objc_msgSend(v9, "_fromWindowOrientation");
    v16 = -[UIClientRotationContext initWithClient:toOrientation:duration:andWindow:]([UIClientRotationContext alloc], "initWithClient:toOrientation:duration:andWindow:", self, v14, v9, v13);
    -[UIViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;

    -[UIViewController window:willRotateToInterfaceOrientation:duration:newSize:](self, "window:willRotateToInterfaceOrientation:duration:newSize:", v9, v14, v13, width, height);
    v22 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v34[3] = &unk_1E16C2488;
    v34[4] = self;
    v35 = v9;
    v37 = v14;
    v38 = v13;
    v39 = width;
    v40 = height;
    v36 = v16;
    v28[0] = v22;
    v28[1] = 3221225472;
    v28[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v28[3] = &unk_1E16C24B0;
    v28[4] = self;
    v30 = v36;
    v31 = v15;
    v32 = v19;
    v33 = v21;
    v29 = v35;
    v23 = v36;
    objc_msgSend(v11, "animateAlongsideTransition:completion:", v34, v28);
    -[UIViewController setInWillRotateCallback:](self, "setInWillRotateCallback:", 1);
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v24[3] = &unk_1E16B80A8;
    v24[4] = self;
    v26 = width;
    v27 = height;
    v25 = v11;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v24);
    -[UIClientRotationContext setupRotationOrderingKeyboardInAfterRotation:](v23, "setupRotationOrderingKeyboardInAfterRotation:", 0);
    -[UIViewController setInWillRotateCallback:](self, "setInWillRotateCallback:", 0);

  }
  if ((objc_msgSend((id)objc_opt_class(), "_shouldForwardViewWillTransitionToSize") & 1) == 0)
    -[UIViewController _sendViewWillTransitionToSizeToPresentationController:withTransitionCoordinator:](self, v11, width, height);

}

- (void)setInWillRotateCallback:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  _BOOL4 IsIdentity;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  UIViewController *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  UIViewController *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL4 v38;
  double v39;
  double v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  _QWORD v47[7];
  CGAffineTransform v48;
  _BYTE v49[128];
  uint64_t v50;

  height = a3.height;
  width = a3.width;
  v50 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "targetTransform");
  else
    memset(&v48, 0, sizeof(v48));
  IsIdentity = CGAffineTransformIsIdentity(&v48);
  if (!IsIdentity)
  {
    -[UIViewController _existingView](self, "_existingView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend((id)objc_opt_class(), "_shouldSendLegacyMethodsFromViewWillTransitionToSize");

      if (!v12)
        goto LABEL_12;
      objc_msgSend(v7, "transitionDuration");
      v14 = v13;
      objc_msgSend(v7, "containerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "window");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v9 = v16;
        v18 = self;
      }
      else
      {
        v18 = self;
        -[UIViewController _existingView](self, "_existingView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "window");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v20 = objc_msgSend(v9, "_toWindowOrientation");
      v21 = objc_msgSend(v9, "_fromWindowOrientation");
      -[UIViewController willRotateToInterfaceOrientation:duration:](v18, "willRotateToInterfaceOrientation:duration:", v20, v14);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v47[3] = &unk_1E16C1A08;
      v47[4] = v18;
      v47[5] = v20;
      *(double *)&v47[6] = v14;
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __71__UIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v46[3] = &unk_1E16C2100;
      v46[4] = v18;
      v46[5] = v21;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v47, v46);
    }

  }
LABEL_12:
  v22 = self;
  if (objc_msgSend((id)objc_opt_class(), "_shouldForwardViewWillTransitionToSize"))
  {
    v23 = v7;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[UIViewController _childViewControllersToSendViewWillTransitionToSize](self, "_childViewControllersToSendViewWillTransitionToSize");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = !IsIdentity;
      v28 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v24);
          v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((*(_QWORD *)(v30 + 368) & 0x40000000000000) != 0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "_existingView");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "frame");
            v32 = v34;
            v31 = v35;

            v22 = self;
          }
          else
          {
            v32 = *(double *)(v30 + 432);
            v31 = *(double *)(v30 + 440);
          }
          -[UIViewController sizeForChildContentContainer:withParentContainerSize:](v22, "sizeForChildContentContainer:withParentContainerSize:", v30, width, height);
          v38 = v32 != v36;
          if (v31 != v37)
            v38 = 1;
          if ((v38 | v27) == 1)
          {
            v39 = v36;
            v40 = v37;
            objc_msgSend((id)v30, "viewWillTransitionToSize:withTransitionCoordinator:", v23);
            *(double *)(v30 + 432) = v39;
            *(double *)(v30 + 440) = v40;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v26);
    }

    v7 = v23;
    -[UIViewController _sendViewWillTransitionToSizeToPresentationController:withTransitionCoordinator:](v22, v23, width, height);
  }

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_sendViewWillTransitionToSizeToPresentationController:(double)a3 withTransitionCoordinator:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  id v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    objc_msgSend(a1, "_presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __100__UIViewController__sendViewWillTransitionToSizeToPresentationController_withTransitionCoordinator___block_invoke;
      v31[3] = &unk_1E16C1C58;
      v31[4] = a1;
      v32 = v8;
      v34 = a3;
      v35 = a4;
      v33 = v7;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v31);

    }
    v26 = v9;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(a1, "childViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14);
          if ((objc_msgSend((id)objc_opt_class(), "_shouldForwardViewWillTransitionToSize") & 1) == 0)
          {
            if ((*(_QWORD *)(v15 + 368) & 0x40000000000000) != 0)
            {
              objc_msgSend((id)v15, "_existingView");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "frame");
              v16 = v19;
              v17 = v20;

            }
            else
            {
              v16 = *(double *)(v15 + 432);
              v17 = *(double *)(v15 + 440);
            }
            objc_msgSend(a1, "sizeForChildContentContainer:withParentContainerSize:", v15, a3, a4);
            v23 = v22;
            v24 = v21;
            if (v16 != v22 || v17 != v21)
              goto LABEL_22;
            if (v7)
              objc_msgSend(v7, "targetTransform");
            else
              memset(&v36, 0, sizeof(v36));
            if (!CGAffineTransformIsIdentity(&v36))
            {
LABEL_22:
              -[UIViewController _sendViewWillTransitionToSizeToPresentationController:withTransitionCoordinator:](v15, v7, v23, v24);
              *(double *)(v15 + 432) = v23;
              *(double *)(v15 + 440) = v24;
            }
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v12);
    }

  }
}

- (void)_willRotateToInterfaceOrientation
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  _QWORD *v6;

  if (a1)
  {
    if (objc_msgSend(a1, "_shouldFreezeUnderlapsStatusBar"))
      a1[46] |= 0x10000000000uLL;
    v6 = a1;
    if (objc_msgSend(v6, "childViewControllersCount")
      && (objc_msgSend(v6, "_existingView"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v3 = (void *)v2;
      objc_msgSend(v6, "_existingView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isHidden");

      if ((v5 & 1) == 0)
        -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v6, 0, &__block_literal_global_742);
    }
    else
    {

    }
  }
}

- (BOOL)_shouldFreezeUnderlapsStatusBar
{
  return (*(_QWORD *)&self->_viewControllerFlags & 0x20000000000) == 0;
}

- (void)_enumerateVisibleChildControllers:(void *)a1 includePresentedChildren:(int)a2 usingBlock:(void *)a3
{
  void (**v5)(id, void *, _BYTE *);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned __int8 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v23 = 0;
    objc_msgSend(a1, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(a1, "childViewControllers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (!v8)
      goto LABEL_26;
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = v12;
        if (a2)
        {
          objc_msgSend(v12, "childModalViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "childModalViewController");
            v15 = objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)v15;
              do
              {
                v17 = v16;

                objc_msgSend(v17, "childModalViewController");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                v13 = v17;
              }
              while (v16);
            }
            else
            {
              v17 = v13;
            }
            if (objc_msgSend(v17, "modalPresentationStyle") != 3 && objc_msgSend(v17, "modalPresentationStyle") != 15)
            {
              v13 = 0;
              goto LABEL_22;
            }
            v13 = v17;
          }
        }
        if (!v13)
          goto LABEL_23;
        objc_msgSend(v13, "_existingView");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isDescendantOfView:", v6) && (objc_msgSend(v17, "isHidden") & 1) == 0)
          v5[2](v5, v13, &v23);
LABEL_22:

LABEL_23:
        v18 = v23;

        if (v18)
          goto LABEL_26;
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (!v9)
      {
LABEL_26:

        break;
      }
    }
  }

}

- (void)_didRotateFromInterfaceOrientation
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  _QWORD *v5;

  if (a1)
  {
    a1[46] &= ~0x10000000000uLL;
    v5 = a1;
    if (objc_msgSend(v5, "childViewControllersCount")
      && (objc_msgSend(v5, "_existingView"), (v1 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v2 = (void *)v1;
      objc_msgSend(v5, "_existingView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isHidden");

      if ((v4 & 1) == 0)
        -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v5, 0, &__block_literal_global_750);
    }
    else
    {

    }
  }
}

void __53__UIViewController__willRotateToInterfaceOrientation__block_invoke(uint64_t a1, _QWORD *a2)
{
  -[UIViewController _willRotateToInterfaceOrientation](a2);
}

void __54__UIViewController__didRotateFromInterfaceOrientation__block_invoke(uint64_t a1, _QWORD *a2)
{
  -[UIViewController _didRotateFromInterfaceOrientation](a2);
}

- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4 oldSize:(CGSize)a5
{
  void *v6;

  -[UIViewController view](self, "view", a3, a4, a5.width, a5.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsDisplay");

  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
  -[UIViewController _didRotateFromInterfaceOrientation](self);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  UIViewController *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  id v55;
  char v56;
  char v57;
  CGAffineTransform v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v6 = a4;
  if (objc_msgSend((id)UIApp, "_wantsCompactStatusBarHiding"))
  {
    v7 = objc_msgSend(v48, "verticalSizeClass");
    -[UIViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "verticalSizeClass");

    if (v7 != v9)
    {
      if (v6)
        objc_msgSend(v6, "targetTransform");
      else
        memset(&v58, 0, sizeof(v58));
      if (!CGAffineTransformIsIdentity(&v58)
        && (-[UIViewController _window](self, "_window"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "rootViewController"),
            v11 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            v11 == self))
      {
        -[UIViewController _existingView](self, "_existingView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "window");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "windowScene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "statusBarManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "defaultStatusBarHeight");
          v30 = v29;
          objc_msgSend(v13, "_effectiveUISettings");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "peripheryInsets");
          v33 = v32;

          if (v30 > v33)
          {
            v14 = objc_msgSend(v12, "isStatusBarHidden");
            v15 = 1;
            goto LABEL_10;
          }
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
        v13 = 0;
      }
      v14 = 0;
      v15 = 0;
LABEL_10:
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __78__UIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
      v53[3] = &unk_1E16C1E78;
      v56 = v15;
      v57 = v14;
      v53[4] = self;
      v54 = v12;
      v55 = v13;
      v16 = v13;
      v17 = v12;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v53, 0);
      -[UIViewController _invalidateBehaviorPreferences](self);

    }
  }
  if (self && ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    -[UIViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_searchControllerIfAllowed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v18, "_navigationBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "topItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 == v18)
      {
        v22 = objc_msgSend(v18, "_hasInlineSearchBar");
        v23 = objc_msgSend(v18, "_hasInlineSearchBarForTraits:", v48);
        if (v22 != v23)
        {
          v24 = v23;
          objc_msgSend(v19, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (v24)
              v26 = 1;
            else
              v26 = 2;
            objc_msgSend(v25, "searchController:willChangeToSearchBarPlacement:", v19, v26);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (v24)
              v34 = 1;
            else
              v34 = 2;
            objc_msgSend(v25, "_dci_searchController:willChangeToSearchBarPlacement:", v19, v34);
          }

        }
      }
    }

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if ((_UIViewControllersInheritTraitsFromViewHierarchy() & 1) != 0)
        {
          v41 = 0;
        }
        else
        {
          -[UIViewController overrideTraitCollectionForChildViewController:](self, "overrideTraitCollectionForChildViewController:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[UIViewController _overrideTraitCollectionToPassDuringTraitChangeToChildViewController:](self, "_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v41 && v42)
        {
          -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v42, (uint64_t)v41, 0);
          v44 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v42)
            goto LABEL_45;
          v44 = v42;
        }
        v45 = v44;

        v41 = v45;
LABEL_45:
        objc_msgSend((id)objc_opt_class(), "_traitCollectionWithParentTraitCollection:overrideTraitCollection:", v48, v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", self, v46, v6);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v37);
  }

  -[UIViewController _presentationController](self, "_presentationController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", self, v48, v6);

}

- (id)_overrideTraitCollectionToPassDuringTraitChangeToChildViewController:(id)a3
{
  return 0;
}

void __70__UIViewController__forceParentViewControllerAsParentTraitEnvironment__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDB0F76 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilecal"));

}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
  UITabBarItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITabBarItem *v12;

  v5 = tabBarItem;
  if (self->_tabBarItem != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, tabBarItem);
    -[UIViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateTabBarItemForViewController:", self);

    if (dyld_program_sdk_at_least()
      && (-[UIViewController tab](self, "tab"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      -[UIViewController tab](self, "tab");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIViewController _uip_tabElement](self, "_uip_tabElement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[UIViewController _fallbackTabElementCreateIfNeeded:](self, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v11;
        if (v11)
          objc_msgSend(v11, "_reloadTabBarItem");
        goto LABEL_8;
      }
      -[UIViewController _uip_tabElement](self, "_uip_tabElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    objc_msgSend(v8, "_updateLinkedTabBarItem");
LABEL_8:

    v5 = v12;
  }

}

- (void)window:(id)a3 statusBarWillChangeFromHeight:(double)a4 toHeight:(double)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  id v36;
  CGRect v37;
  CGRect v38;

  v36 = a3;
  -[UIViewController _viewControllerForRotation](self, "_viewControllerForRotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_existingView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    while (1)
    {
      v9 = v36;
      v10 = v6;
      v11 = v10;
      if (self)
        break;
LABEL_17:

      _nextWindowSizedViewController(v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "_existingView");
      v35 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v35;
      if (!v35)
        goto LABEL_18;
    }
    objc_msgSend(v10, "_existingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      if (!v14 || !objc_msgSend(v12, "isDescendantOfView:", v14))
        goto LABEL_10;
      v15 = v14;
      v14 = v12;
      v12 = v15;
    }

    v14 = v15;
LABEL_10:
    objc_msgSend(v12, "window");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v9, "screen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "_isEmbeddedScreen");

      if (v19)
      {
        objc_msgSend(v9, "frame");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v9, "screen");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bounds");
        v38.origin.x = v29;
        v38.origin.y = v30;
        v38.size.width = v31;
        v38.size.height = v32;
        v37.origin.x = v21;
        v37.origin.y = v23;
        v37.size.width = v25;
        v37.size.height = v27;
        v33 = CGRectEqualToRect(v37, v38);

        if (v33)
        {
          objc_msgSend(v9, "windowScene");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "interfaceOrientation");

        }
        if ((objc_msgSend(v11, "_freezeLayoutForOrientationChangeOnDismissal") & 1) == 0)
          objc_msgSend(v11, "_updateLayoutForStatusBarAndInterfaceOrientation");
      }
    }

    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "window:willAnimateRotationToInterfaceOrientation:duration:newSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 48), "rotateSnapshots");
}

- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5 newSize:(CGSize)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[3];

  if (self)
    self->_lastKnownInterfaceOrientation = a4;
  v8 = a3;
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:]((uint64_t)self, a4);
  -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v20, 0, sizeof(v20));
  -[UIViewController getRotationContentSettings:forWindow:](self, "getRotationContentSettings:forWindow:", v20, v8);

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __86__UIViewController_window_willAnimateRotationToInterfaceOrientation_duration_newSize___block_invoke;
  v18 = &unk_1E16B1B28;
  v10 = v9;
  v19 = v10;
  v11 = _Block_copy(&v15);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v15, v16, v17, v18)&& (!LOBYTE(v20[0]) || BYTE3(v20[0])))
  {
    v12 = BYTE4(v20[0]);
    v13 = (unint64_t)BYTE4(v20[0]) << 11;
    if (dyld_program_sdk_at_least())
      v14 = ((unint64_t)v12 << 11) | 4;
    else
      v14 = v13;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v14, v11, 0, 0.0, 0.0);
  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  }

}

- (id)_visibleView
{
  void *v2;
  void *v3;
  void *v4;

  -[UIViewController viewControllerForRotation](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropShadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "dropShadowView");
  else
    objc_msgSend(v2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)viewControllerForRotation
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)MEMORY[0x186DC9484]();
    objc_msgSend(v1, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_rotationViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v1, "isPerformingModalTransition") & 1) == 0)
    {
      objc_msgSend(v1, "childModalViewController");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(v1, "childModalViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v4, "containsObject:", v7);

        if ((v8 & 1) == 0)
        {
          objc_msgSend(v1, "childModalViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController viewControllerForRotation]();
          v10 = objc_claimAutoreleasedReturnValue();

          v1 = (id)v10;
        }
      }
    }

    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (UIDropShadowView)dropShadowView
{
  return (UIDropShadowView *)self->_dropShadowView;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  id v5;

  -[UIViewController _viewControllerForRotation](self, "_viewControllerForRotation", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_getRotationContentSettings:", a3);

}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  unint64_t viewControllerFlags;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(void *, void *, double, double, double, double, double, double);
  void *v21;
  char v22;
  UIViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  UIViewController *v27;
  int v28;
  double v29;
  double v30;
  double v31;
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
  _BOOL8 v43;
  void *v44;
  char v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  char v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  __int16 v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  CGAffineTransform v72;
  _QWORD aBlock[7];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;

  if (-[UIViewController __knownPresentationWithoutPresentationControllerInstance](self, "__knownPresentationWithoutPresentationControllerInstance"))
  {
    goto LABEL_12;
  }
  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentationController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewController _parentModalViewController](self, "_parentModalViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        -[UIViewController presentationController](self, "presentationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      v4 = 0;
      goto LABEL_7;
    }
    v4 = (void *)v6;
    -[UIViewController presentationController](self, "presentationController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
LABEL_7:

  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  v9 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_popoverControllerStyle") != 1
    || v7 && !objc_msgSend(v7, "_presentationPotentiallyUnderlapsStatusBar"))
  {

    LOBYTE(v43) = 0;
    return v43;
  }

LABEL_12:
  viewControllerFlags = (unint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x10000000000) == 0)
  {
    -[UIViewController _existingView](self, "_existingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      LOBYTE(v43) = 0;
LABEL_61:

      return v43;
    }
    _UIAppStatusBarHeightForWindow(v12);
    v14 = 0;
    if (v15 == 0.0)
    {
      __UIStatusBarManagerForWindow(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isStatusBarHidden");

      if ((v17 & 1) == 0)
      {
        _UIAppStatusBarDefaultHeight();
        v14 = v18;
      }
    }
    v19 = objc_msgSend(v13, "_windowInterfaceOrientation");
    if (!v19)
      v19 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v13);
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIViewController__viewControllerUnderlapsStatusBar__block_invoke;
    aBlock[3] = &unk_1E16C1FB0;
    aBlock[6] = v14;
    aBlock[4] = &v74;
    aBlock[5] = v19;
    v20 = (uint64_t (**)(void *, void *, double, double, double, double, double, double))_Block_copy(aBlock);
    if (!v11)
    {
      v28 = 0;
LABEL_54:
      v67 = *((_WORD *)&self->_viewControllerFlags + 4);
      v69 = (unint64_t)self->_viewControllerFlags;
      if (*((_BYTE *)v75 + 24))
        LODWORD(v43) = (v69 >> 39) & 1;
      else
        LODWORD(v43) = v28;
      v70 = 0x8000000000;
      if (!v43)
        v70 = 0;
      v68 = v70 | v69 & 0xFFFFFF7FFFFFFFFFLL;
      goto LABEL_60;
    }
    objc_msgSend(v13, "_windowHostingScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

    if ((v22 & 1) != 0)
    {
      v23 = self;
      v24 = 0;
      do
      {
        -[UIViewController _expectedWindow](v23, "_expectedWindow");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _existingView](v23, "_existingView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIViewController parentViewController](v23, "parentViewController");
        v27 = (UIViewController *)objc_claimAutoreleasedReturnValue();

        if (!v27)
          break;
        v23 = v27;
        v24 = v26;
      }
      while (!v25);

      v28 = 0;
      if (!v25 || !v26)
        goto LABEL_53;
      objc_msgSend(v26, "transform");
      if (CGAffineTransformIsIdentity(&v72))
      {
        objc_msgSend(v11, "bounds");
        objc_msgSend(v26, "convertRect:fromView:", v11);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        objc_msgSend(v26, "frame");
        v38 = v37;
        v40 = v39;
        objc_msgSend(v11, "bounds");
        v28 = v20[2](v20, v25, v30 + v38, v32 + v40, v34, v36, v41, v42);
LABEL_53:

        goto LABEL_54;
      }
    }
    else
    {
      if (objc_msgSend(v13, "_isHostedInAnotherProcess"))
      {
        -[UIViewController _window](self, "_window");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "__hostViewUnderlapsStatusBar");

        if ((v45 & 1) == 0)
        {
          LOBYTE(v43) = 0;
          v67 = *((_WORD *)&self->_viewControllerFlags + 4);
          v68 = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFF7FFFFFFFFFLL;
LABEL_60:
          *(_QWORD *)&self->_viewControllerFlags = v68;
          *((_WORD *)&self->_viewControllerFlags + 4) = v67;

          _Block_object_dispose(&v74, 8);
          goto LABEL_61;
        }
      }
      objc_msgSend(v11, "bounds");
      objc_msgSend(v11, "convertRect:toView:", 0);
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;
      objc_msgSend(v11, "bounds");
      v28 = v20[2](v20, v13, v47, v49, v51, v53, v54, v55);
      -[UIViewController _viewControllerForRotation](self, "_viewControllerForRotation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_existingView");
      v56 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v56;
      if (v56)
        v57 = v28;
      else
        v57 = 1;
      if ((v57 & 1) != 0 || (void *)v56 == v11)
        goto LABEL_53;
      if (!objc_msgSend(v11, "isDescendantOfView:", v56))
      {
        v28 = 0;
        goto LABEL_53;
      }
      objc_msgSend(v11, "bounds");
      objc_msgSend(v11, "convertRect:toView:", v26);
      v59 = v58;
      v61 = v60;
      v63 = v62;
      objc_msgSend(v11, "bounds");
      if (vabdd_f64(v64, v61) < 0.01 && vabdd_f64(v65, v63) < 0.01
        || vabdd_f64(v64, v63) < 0.01 && vabdd_f64(v65, v61) < 0.01)
      {
        v28 = v59 < 0.0 || fabs(v59) < 0.01;
        goto LABEL_53;
      }
    }
    v28 = 0;
    *((_BYTE *)v75 + 24) = 1;
    goto LABEL_53;
  }
  return (viewControllerFlags >> 39) & 1;
}

- (id)_viewControllerForRotationWithDismissCheck:(void *)a1
{
  id v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a1, "_existingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v2 = v2;
    }
    else
    {
      objc_msgSend(v2, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)a2
        && (-[UIViewController _presentedViewControllerStateIsValidForSourcingSupportedOrientations:](v2, v6) & 1) == 0)
      {
        -[UIViewController _nearestFullScreenAncestorViewController](v2);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (v6)
      {
        -[UIViewController _viewControllerForRotationWithDismissCheck:](v6, a2);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v2;
      }
      v2 = v7;

    }
  }
  return v2;
}

- (BOOL)__knownPresentationWithoutPresentationControllerInstance
{
  UIViewController *parentModalViewController;

  parentModalViewController = self->_parentModalViewController;
  if (parentModalViewController)
    LOBYTE(parentModalViewController) = -[UIViewController __knownPresentationWithoutPresentationControllerInstance](parentModalViewController, "__knownPresentationWithoutPresentationControllerInstance");
  return (char)parentModalViewController;
}

- (id)_viewControllerForRotation
{
  _BOOL8 v3;

  v3 = _UIAppUseModernRotationAndPresentationBehaviors();
  return -[UIViewController _viewControllerForRotationWithDismissCheck:](self, v3);
}

BOOL __53__UIViewController__viewControllerUnderlapsStatusBar__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL8 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v15 = a2;
  if ((vabdd_f64(a7, a5) >= 0.01 || vabdd_f64(a8, a6) >= 0.01)
    && (vabdd_f64(a7, a6) >= 0.01 || vabdd_f64(a8, a5) >= 0.01))
  {
    v26 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else if (objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
  {
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 40) - 3;
    objc_msgSend(v17, "bounds");
    if (v20 >= 2)
      v23 = v22;
    else
      v23 = v21;
    _UIAppStatusBarDefaultHeight();
    v25 = v24;
    if (!objc_msgSend(v15, "_isHostedInAnotherProcess")
      || !v17
      || v19 == v23
      || vabdd_f64(v23, v19) == 0.0 - v25)
    {
      v31 = *(double *)(a1 + 48);
      v26 = a4 < v31 || vabdd_f64(a4, v31) < 0.01;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    objc_msgSend(v15, "bounds");
    switch(*(_QWORD *)(a1 + 40))
    {
      case 1:
        v29 = *(double *)(a1 + 48);
        if (a4 < v29)
          goto LABEL_28;
        v30 = vabdd_f64(a4, v29);
        goto LABEL_31;
      case 2:
        v32 = *(double *)(a1 + 48);
        if (a4 + a6 > v28 - v32)
          goto LABEL_28;
        v33 = a4 + a6 - v28;
        goto LABEL_26;
      case 3:
        v32 = *(double *)(a1 + 48);
        if (a3 + a5 > v27 - v32)
          goto LABEL_28;
        v33 = a3 + a5 - v27;
LABEL_26:
        v30 = vabdd_f64(v33, v32);
        goto LABEL_31;
      case 4:
        v34 = *(double *)(a1 + 48);
        if (a3 >= v34)
        {
          v30 = vabdd_f64(a3, v34);
LABEL_31:
          v26 = v30 < 0.01;
        }
        else
        {
LABEL_28:
          v26 = 1;
        }
        break;
      default:
        v26 = 0;
        break;
    }
  }

  return v26;
}

- (uint64_t)_presentedViewControllerStateIsValidForSourcingSupportedOrientations:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;

  v3 = a2;
  if (a1)
  {
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      objc_msgSend(a1, "_presentationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4
        && (objc_msgSend(v4, "presentedViewController"),
            v6 = (id)objc_claimAutoreleasedReturnValue(),
            v6,
            v6 == v3)
        && ((objc_msgSend(v3, "transitionCoordinator"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isCancelled"),
             v7,
             !objc_msgSend(v5, "presenting"))
         || (v8 & 1) == 0))
      {
        v9 = objc_msgSend(v5, "dismissing") ^ 1 | v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "currentAction");
      v10 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v10;
      if (v10 && *(__CFString **)(v10 + 8) == CFSTR("DismissModal"))
      {
        WeakRetained = objc_loadWeakRetained((id *)(v10 + 40));
        v9 = WeakRetained != v3;

      }
      else
      {
        v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_nearestFullScreenAncestorViewController
{
  void *v1;
  void *v2;
  id v3;
  id *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "presentingViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      if (objc_msgSend(v1, "modalPresentationStyle"))
      {
        -[UIViewController _nearestFullScreenAncestorViewController](v2);
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = v1;
      }
      v1 = v3;
    }
    else
    {
      v4 = v1;
      -[UIViewController _parentViewController](v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        do
        {
          -[UIViewController _parentViewController](v4);
          v1 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIViewController _parentViewController]((id *)v1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = (id *)v1;
        }
        while (v6);
      }
      else
      {
        v1 = v4;
      }
    }

  }
  return v1;
}

- (id)rotatingHeaderViewForWindow:(id)a3
{
  void *v3;
  void *v4;

  -[UIViewController viewControllerForRotation](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotatingHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)rotatingHeaderView
{
  void *v2;
  void *v3;

  -[UIViewController searchDisplayController](self, "searchDisplayController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)rotatingFooterViewForWindow:(id)a3
{
  void *v3;
  void *v4;

  -[UIViewController viewControllerForRotation](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotatingFooterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)rotatingFooterView
{
  return 0;
}

- (BOOL)_hasAppeared
{
  return (*(_QWORD *)&self->_viewControllerFlags & 6) == 4;
}

- (id)_contentUnavailableConfiguration
{
  void *v2;
  id v3;

  -[UIViewController contentUnavailableConfiguration](self, "contentUnavailableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)contentUnavailableConfiguration
{
  return -[_UIContentUnavailableWrapperView configuration](self->_contentUnavailableWrapperView, "configuration");
}

+ (int)_keyboardDirectionForTransition:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int result;
  void *v8;
  uint64_t v9;

  result = 4;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      return 5;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 10:
    case 11:
      return 0;
    case 8:
    case 9:
    case 12:
      goto LABEL_2;
    default:
      if (a3 != 18)
        return 0;
LABEL_2:
      +[UIDevice currentDevice](UIDevice, "currentDevice", v4, v3, v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        return 0;
      else
        return 3;
  }
}

- (BOOL)isMovingToParentViewController
{
  BOOL result;
  void *v6;

  if ((*(_QWORD *)&self->_viewControllerFlags & 0x100000000200000) == 0
    || (*(_QWORD *)&self->_viewControllerFlags & 0x2000000) == 0)
  {
    return 0;
  }
  if (!dyld_program_sdk_at_least())
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 < 2;
  -[UIViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 1 < 2;
  result = 0;
  *(_QWORD *)&self->_viewControllerFlags &= ~0x2000000uLL;
  return result;
}

- (void)setUserActivity:(id)a3
{
  id v4;
  void (**v5)(void *, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  UIViewController *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIViewController;
  -[UIResponder setUserActivity:](&v14, sel_setUserActivity_, v4);
  if (v4)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __58__UIViewController_ActivityContinuation__setUserActivity___block_invoke;
    v11 = &unk_1E16B2E68;
    v12 = self;
    v13 = v4;
    v5 = (void (**)(void *, _QWORD))_Block_copy(&v8);
    -[UIViewController transitionCoordinator](self, "transitionCoordinator", v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIViewController transitionCoordinator](self, "transitionCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v5);

    }
    else
    {
      v5[2](v5, 0);
    }

  }
}

- (id)_activityContinuationSuitableToBecomeCurrent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIViewController childModalViewController](self, "childModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "_activityContinuationSuitableToBecomeCurrent"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[UIViewController _additionalViewControllersToCheckForUserActivity](self, "_additionalViewControllersToCheckForUserActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v7;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "_activityContinuationSuitableToBecomeCurrent", (_QWORD)v16);
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v5 = (void *)v12;

              goto LABEL_18;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    -[UIViewController _existingView](self, "_existingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[UIResponder userActivity](self, "userActivity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
LABEL_18:

  return v5;
}

void __58__UIViewController_ActivityContinuation__setUserActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (_UIStateRestorationDebugLogEnabled())
    {
      v4 = *(void **)(a1 + 40);
      objc_msgSend(v4, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: Calling become current on activity %@ since UIViewController's view is in a window. Activity title = %@"), "-[UIViewController(ActivityContinuation) setUserActivity:]_block_invoke", v4, v5);

    }
    objc_msgSend(*(id *)(a1 + 40), "becomeCurrent");
  }
}

- (void)setContentUnavailableConfiguration:(id)contentUnavailableConfiguration
{
  id v4;
  void *v5;
  id v6;

  v4 = contentUnavailableConfiguration;
  -[UIViewController contentUnavailableConfigurationState](self, "contentUnavailableConfigurationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedConfigurationForState:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIViewController _applyContentUnavailableConfiguration:](self, v6);
}

- (_UIContentUnavailableWrapperView)_contentUnavailableWrapperView
{
  return self->_contentUnavailableWrapperView;
}

- (void)_setInternalContentScrollView:(id)a3
{
  UIScrollView *v5;
  UIScrollView *v6;

  v5 = (UIScrollView *)a3;
  if (self->_internalContentScrollView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_internalContentScrollView, a3);
    -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setContentScrollView:(UIScrollView *)scrollView forEdge:(NSDirectionalRectEdge)edge
{
  UIScrollView *v6;
  UIScrollView *v7;
  NSDirectionalRectEdge v8;
  UIScrollView *v9;
  UIScrollView *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *observableScrollViews;
  UIScrollView *v13;
  unint64_t v14;
  NSObject *v15;
  _BYTE v16[24];
  void *v17;
  UIScrollView *v18;
  UIViewController *v19;
  NSDirectionalRectEdge v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = scrollView;
  v7 = v6;
  v8 = edge & 5;
  if ((edge & 5) != 0)
  {
    v9 = v6;
    v10 = v9;
    if (self)
    {
      if (v9 && !self->_observableScrollViews)
      {
        v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        observableScrollViews = self->_observableScrollViews;
        self->_observableScrollViews = v11;

      }
      *(_QWORD *)v16 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v16[8] = 3221225472;
      *(_QWORD *)&v16[16] = __50__UIViewController__setContentScrollView_forEdge___block_invoke;
      v17 = &unk_1E16C1EC8;
      v20 = v8;
      v13 = v10;
      v18 = v13;
      v19 = self;
      __50__UIViewController__setContentScrollView_forEdge___block_invoke(v16, 1);
      __50__UIViewController__setContentScrollView_forEdge___block_invoke(v16, 4);
      -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);

    }
  }
  else
  {
    v14 = setContentScrollView_forEdge____s_category;
    if (!setContentScrollView_forEdge____s_category)
    {
      v14 = __UILogCategoryGetNode("ContentScrollView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&setContentScrollView_forEdge____s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v16 = 138412546;
      *(_QWORD *)&v16[4] = v7;
      *(_WORD *)&v16[12] = 2048;
      *(_QWORD *)&v16[14] = edge;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "setting contentScrollView, %@, ignored for edge value, %ld, not containing NSDirectionalRectEdgeTop or NSDirectionalRectEdgeBottom", v16, 0x16u);
    }
  }

}

void __50__UIViewController__setContentScrollView_forEdge___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if ((a2 & ~a1[6]) == 0)
  {
    v2 = a1[4];
    v3 = *(void **)(a1[5] + 576);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v4;
    if (v2)
      objc_msgSend(v3, "setObject:forKey:", v2, v4);
    else
      objc_msgSend(v3, "removeObjectForKey:", v4);

  }
}

- (void)_performContentScrollViewUpdatesNotifyingObservers
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  if (!a1)
    return;
  objc_msgSend(*(id *)(a1 + 592), "objectForKey:", &unk_1E1A974E8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 592), "objectForKey:", &unk_1E1A97500);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _resolveContentScrollViewForEdge:](a1, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _resolveContentScrollViewForEdge:](a1, 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_outermostNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend((id)a1, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_outermostNavigationController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(0, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _containingTabBarController](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v22 = v4;
    -[UIViewController _containingTabBarController](v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v14 = v15;
    }
    else
    {
      -[UIViewController _containingTabBarController](v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        -[UIViewController _containingTabBarController]((void *)a1);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v19;

    }
    v4 = v22;
  }

  if (v23 != v3 && v2 != v4)
  {
    if (v23 != v2)
    {
      objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:");
LABEL_22:
      objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:", v2, a1, 4, v22);
      v20 = v14;
      goto LABEL_23;
    }
    objc_msgSend(v9, "_observableScrollViewDidChangeFrom:forViewController:edges:");
    v20 = v14;
LABEL_23:
    objc_msgSend(v20, "_observableScrollViewDidChangeFrom:forViewController:edges:", v22);
    goto LABEL_24;
  }
  if (v23 != v3)
  {
    v20 = v9;
    goto LABEL_23;
  }
  if (v2 != v4)
    goto LABEL_22;
LABEL_24:
  if (((*(_DWORD *)(a1 + 368) >> 1) & 3u) - 1 <= 1)
    -[UIViewController _updateViewSafeAreaInsetsAndEagerlyUpdateContentScrollView:]((double *)a1);
  v21 = *(void **)(a1 + 600);
  if (v21)
    objc_msgSend(v21, "reconfigureContentScrollView");

}

- (UIContentUnavailableConfigurationState)_bridgedContentUnavailableConfigurationState
{
  UIViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[6];

  v2 = self;
  sub_18547F580(-[UIViewController _contentUnavailableConfigurationState](v2, sel__contentUnavailableConfigurationState), (uint64_t)v8);

  v3 = (void *)v8[0];
  v7 = (void *)v8[4];
  sub_18547FB14();
  v5 = v4;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return (UIContentUnavailableConfigurationState *)v5;
}

- (id)_contentUnavailableConfigurationState
{
  UIContentUnavailableConfigurationState *v3;
  void *v4;
  UIContentUnavailableConfigurationState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [UIContentUnavailableConfigurationState alloc];
  -[UIViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIContentUnavailableConfigurationState initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  -[UIViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableConfigurationState setSearchText:](v5, "setSearchText:", v9);

  return v5;
}

- (void)set_contentUnavailableWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_contentUnavailableWrapperView, a3);
}

- (void)_observeScrollView:(id)a3 temporaryCoordinatingReplacementDidChange:(id)a4
{
  if (self->_effectiveContentScrollViews)
    -[UIViewController _performContentScrollViewUpdatesNotifyingObservers]((uint64_t)self);
}

- (id)_definiteTransitionCoordinator
{
  _UIViewControllerImmediateAnimationTransitionCoordinator *v3;
  _UIViewControllerImmediateAnimationTransitionCoordinator *v4;
  void *v5;

  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v3 = (_UIViewControllerImmediateAnimationTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [_UIViewControllerImmediateAnimationTransitionCoordinator alloc];
    -[UIViewController _existingView](self, "_existingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[_UIViewControllerImmediateAnimationTransitionCoordinator initWithContainerView:](v4, "initWithContainerView:", v5);

  }
  return v3;
}

- (void)_invalidateBehaviorPreferences
{
  if (a1)
  {
    objc_msgSend(a1, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
    objc_msgSend(a1, "setNeedsUpdateOfHomeIndicatorAutoHidden");
    objc_msgSend(a1, "setNeedsUpdateOfPrefersPointerLocked");
    objc_msgSend(a1, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
    objc_msgSend(a1, "setNeedsUpdateOfSupportedInterfaceOrientations");
    -[UIViewController _setNeedsResolutionOfPhysicalButtonConfigurations](a1);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIViewController;
  -[UIViewController setValue:forKey:](&v11, sel_setValue_forKey_, a3, v7);
  if (dyld_program_sdk_at_least()
    && ((objc_msgSend(v7, "isEqualToString:", CFSTR("topLayoutGuide")) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", CFSTR("bottomLayoutGuide"))))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ is a readonly property. Do not use -%@ to set it. This is an application bug."), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("%@"), v10);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@"), v10);

  }
}

- (void)_removeNavigationItemsFromNavigationController:(uint64_t)a3 transition:
{
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  if (a1)
  {
    v15 = v5;
    if (objc_msgSend(v5, "_isNestedNavigationController"))
    {
      objc_msgSend(v15, "bottomViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == a1;

    }
    else
    {
      v7 = 0;
    }
    v8 = v15;
    v9 = v8;
    if (objc_msgSend(v8, "_isNestedNavigationController"))
    {
      v10 = v8;
      do
      {
        objc_msgSend(v10, "navigationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v9;
      }
      while ((objc_msgSend(v9, "_isNestedNavigationController") & 1) != 0);
    }
    objc_msgSend(a1, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_isNestedNavigationController"))
    {
      objc_msgSend(v8, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_popNestedNavigationItem");

    }
    objc_msgSend(v9, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setItemsUpToItem:transition:", v11, a3);

    if (v7)
    {
      objc_msgSend(v8, "navigationBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_redisplayItems");

    }
    v5 = v15;
  }

}

- (void)_appendNavigationItemsToNavigationController:(uint64_t)a3 transition:
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = objc_msgSend(a1, "_isNestedNavigationController");
    v7 = a3;
    if (v6)
    {
      objc_msgSend(a1, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "topViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v10)
        v7 = a3;
      else
        v7 = 0;

    }
    v11 = v5;
    v12 = v11;
    if (objc_msgSend(v11, "_isNestedNavigationController"))
    {
      v13 = v11;
      do
      {
        objc_msgSend(v13, "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v12;
      }
      while ((objc_msgSend(v12, "_isNestedNavigationController") & 1) != 0);
    }
    if (objc_msgSend(v11, "_isNestedNavigationController"))
    {
      objc_msgSend(v11, "navigationBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_pushNestedNavigationItem:", v15);

      if (objc_msgSend(v14, "_itemStackCount") == 1)
      {
        objc_msgSend(v12, "navigationBar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "navigationItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_addItem:withEffectiveDelegate:transition:", v17, v12, v7);

        if (!v6)
          goto LABEL_37;
        goto LABEL_17;
      }

    }
    objc_msgSend(a1, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_stackEntry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_addItem:withEffectiveDelegate:transition:", v18, v11, v7);

    if (!v6)
    {

LABEL_37:
      goto LABEL_38;
    }
    objc_msgSend(v18, "_stackEntry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateStateFromCounterpart:", v19);

LABEL_17:
    objc_msgSend(a1, "_lastNavigationItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v39 = v5;
      v23 = (void *)objc_opt_new();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v24 = v22;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v45 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "_stackEntry");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v23, "addObject:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v26);
      }

      objc_msgSend(v12, "navigationBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_addItems:withEffectiveDelegate:transition:", v24, a1, a3);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v31 = v23;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      v5 = v39;
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v41 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
            objc_msgSend(v36, "item");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "_stackEntry");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "updateStateFromCounterpart:", v36);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v33);
      }

    }
    goto LABEL_37;
  }
LABEL_38:

}

- (id)_effectiveControllersForAlwaysOnTimelines
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[UIViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveControllersForAlwaysOnTimelines");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend((id)-[UIViewController performSelector:](self, "performSelector:", sel_puic_childViewControllerForAlwaysOnTimelines), "_effectiveControllersForAlwaysOnTimelines"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[UIViewController _childViewControllersForAlwaysOnTimelines](self, "_childViewControllersForAlwaysOnTimelines");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__UIViewController__UIAlwaysOnEnvironment___effectiveControllersForAlwaysOnTimelines__block_invoke;
      v9[3] = &unk_1E16B40F8;
      v7 = v6;
      v10 = v7;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
      if (objc_msgSend(v7, "count"))
        v4 = (void *)objc_msgSend(v7, "copy");
      else
        v4 = 0;

      if (!v4)
      {
        v11[0] = self;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UIViewController _childViewControllerForAlwaysOnTimelines](self, "_childViewControllerForAlwaysOnTimelines");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_childViewControllerForAlwaysOnTimelines
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController performSelector:](self, "performSelector:", sel_puic_childViewControllerForAlwaysOnTimelines);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)awakeFromNib
{
  char v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIViewController;
  -[NSObject awakeFromNib](&v4, sel_awakeFromNib);
  if ((*(_QWORD *)&self->_viewControllerFlags & 0x80) != 0)
    v3 = 0;
  else
    v3 = -[UIViewController _doesSelfOrAncestorPassPredicate:]((uint64_t)self, &__block_literal_global_330);
  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    if ((v3 & 1) == 0)
      -[UIViewController _sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled](self);
  }
}

- (uint64_t)_doesSelfOrAncestorPassPredicate:(uint64_t)a1
{
  uint64_t (**v3)(id, uint64_t);
  void *v4;

  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3[2](v3, a1) & 1) != 0)
    {
      a1 = 1;
    }
    else if (v4)
    {
      a1 = -[UIViewController _doesSelfOrAncestorPassPredicate:](v4, v3);
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (BOOL)isFinishingModalTransition
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 17) & 1;
}

uint64_t __32__UIViewController_awakeFromNib__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(_QWORD *)(a2 + 368) >> 8) & 1;
}

- (id)_userActionDescription
{
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _addUserActionDescription(a1, v2);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (char)_descriptionForPrintingHierarchyIncludingInsets:(char *)a1
{
  char *v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v26;
  uint64_t v27;
  UIEdgeInsets v28;

  v2 = a1;
  if (a1)
  {
    if (a2 && ((*((_DWORD *)a1 + 92) >> 1) & 3u) - 1 <= 1)
    {
      v3 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)(a1 + 904)), (int32x4_t)vceqzq_f64(*(float64x2_t *)(a1 + 920)))))) & 1;
      v4 = 1;
    }
    else
    {
      v4 = 0;
      v3 = 0;
    }
    v5 = (void *)MEMORY[0x1E0CB37A0];
    v6 = objc_opt_class();
    objc_msgSend(&unk_1E1A93290, "objectAtIndexedSubscript:", (*((_QWORD *)v2 + 46) >> 1) & 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)(v2 + 904));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR(" minimum margins = %@,"), v26);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_1E16EDF20;
    }
    objc_msgSend(v2, "_existingView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v27 = v6;
      v11 = v5;
      v12 = v4;
      v13 = (void *)MEMORY[0x1E0CB37A0];
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringWithString:", v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (v12)
        {
          objc_msgSend(v10, "safeAreaInsets");
          if (v23 != 0.0 || v20 != 0.0 || v22 != 0.0 || v21 != 0.0)
          {
            objc_msgSend(v10, "safeAreaInsets");
            NSStringFromUIEdgeInsets(v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendFormat:](v18, "appendFormat:", CFSTR(" safeAreaInsets = %@"), v24);

          }
        }
      }
      else
      {
        -[__CFString appendString:](v18, "appendString:", CFSTR(" not in the window"));
      }
      v5 = v11;
      v6 = v27;
    }
    else
    {
      v18 = CFSTR("(view not loaded)");
    }

    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p>, state: %@,%@ view: %@"), v6, v2, v7, v9, v18);
    v2 = (char *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {

    }
  }
  return v2;
}

- (void)setEditing:(BOOL)editing
{
  -[UIViewController setEditing:animated:](self, "setEditing:animated:", editing, 0);
}

- (id)storyboardIdentifier
{
  return objc_retainAutorelease(self->_storyboardIdentifier);
}

- (void)setStoryboardIdentifier:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_storyboardIdentifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_storyboardIdentifier, a3);
    v5 = v6;
  }

}

- (int64_t)_horizontalSizeClass
{
  void *v2;
  int64_t v3;

  -[UIViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  return v3;
}

- (id)_nextResponderUsingTraversalStrategy:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v14;
  char v15;

  if (a3 == 2)
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v15 = 0;
      objc_msgSend(v6, "_nextResponderUsingTargetActionStrategyFromChildViewController:didTraverseToParentViewController:", self, &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v7, "presentedViewController");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(v7, "performsActionsWhilePresentingModally");

          if ((v11 & 1) == 0)
          {
            __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(v7);
            v12 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v12;
          }
        }
      }
    }
    else
    {
      __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v8;
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIResponder+UIResponderChainTraversal.m"), 246, CFSTR("Invalid call to %s with strategy: %u"), "-[UIViewController(UIResponderChainTraversal) _nextResponderUsingTraversalStrategy:]", a3);

    return 0;
  }
  else
  {
    -[UIViewController nextResponder](self, "nextResponder");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (sel__prepareForTapGesture_ == a3)
    return -[NSMutableArray count](self->_previewSourceViews, "count") != 0;
  v5.receiver = self;
  v5.super_class = (Class)UIViewController;
  return -[UIResponder canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

id __84__UIViewController_UIResponderChainTraversal___nextResponderUsingTraversalStrategy___block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (1)
    {
      v3 = v2;
      if ((objc_msgSend(v2, "performsActionsWhilePresentingModally") & 1) != 0)
        break;

      objc_msgSend(v3, "presentingViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v3;
      if (!v2)
      {
        v1 = v3;
        v3 = 0;
        break;
      }
    }

  }
  objc_msgSend(v1, "nextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_nextResponderUsingTargetActionStrategyFromChildViewController:(id)a3 didTraverseToParentViewController:(BOOL *)a4
{
  if (a4)
    *a4 = 1;
  return (id)objc_msgSend(a3, "nextResponder");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewControllerForPreferredContainerBackgroundStyle, 0);
  objc_destroyWeak((id *)&self->__departingParentViewController);
  objc_destroyWeak((id *)&self->_preferredFocusedItem);
  objc_storeStrong((id *)&self->_temporaryPresentationController, 0);
  objc_storeStrong((id *)&self->_originalPresentationController, 0);
  objc_storeStrong((id *)&self->__embeddingView, 0);
  objc_storeStrong((id *)&self->__embeddedView, 0);
  objc_storeStrong((id *)&self->_storyboardPreviewingRegistrants, 0);
  objc_storeStrong((id *)&self->_storyboardCommitSegueTemplates, 0);
  objc_storeStrong((id *)&self->_storyboardPreviewSegueTemplates, 0);
  objc_storeStrong((id *)&self->_navigationInsetAdjustment, 0);
  objc_destroyWeak((id *)&self->_presentingFocusedItem);
  objc_storeStrong((id *)&self->__childControllerToIgnoreWhileLookingForTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_preferredTransition, 0);
  objc_storeStrong((id *)&self->_spiTransition, 0);
  objc_storeStrong((id *)&self->_presentedUserInterfaceStyleViewController, 0);
  objc_storeStrong((id *)&self->_presentedStatusBarViewController, 0);
  objc_storeStrong((id *)&self->_expectedWindow, 0);
  objc_storeStrong((id *)&self->_segueResponsibleForModalPresentation, 0);
  objc_storeStrong((id *)&self->_storyboardSegueTemplates, 0);
  objc_storeStrong((id *)&self->_contentUnavailableWrapperView, 0);
  objc_storeStrong((id *)&self->_effectiveContentScrollViews, 0);
  objc_storeStrong((id *)&self->_internalContentScrollView, 0);
  objc_storeStrong((id *)&self->_observableScrollViews, 0);
  objc_storeStrong((id *)&self->_interactionActivityTrackingBaseName, 0);
  objc_storeStrong((id *)&self->_bottomBarInsetGuideConstraint, 0);
  objc_storeStrong((id *)&self->_topBarInsetGuideConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topLayoutGuide, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
  objc_storeStrong((id *)&self->_customTransitioningView, 0);
  objc_storeStrong((id *)&self->_childViewControllers, 0);
  objc_storeStrong((id *)&self->_accessibilityHUD, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_frozenTraitCollection, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
  objc_storeStrong((id *)&self->_storyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_previewSourceViews, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollectionsForChildren, 0);
  objc_storeStrong((id *)&self->_addedKeyCommands, 0);
  objc_storeStrong((id *)&self->_interfaceBuilderKeyCommands, 0);
  objc_storeStrong(&self->_afterAppearance, 0);
  objc_storeStrong(&self->_atViewIsAppearing, 0);
  objc_storeStrong((id *)&self->_recordedContentScrollView, 0);
  objc_destroyWeak((id *)&self->_popoverController);
  objc_storeStrong((id *)&self->_appearStateActivityToken, 0);
  objc_storeStrong((id *)&self->_strongSearchDisplayController, 0);
  objc_destroyWeak((id *)&self->_searchDisplayController);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_savedFooterSuperview, 0);
  objc_storeStrong((id *)&self->_savedHeaderSuperview, 0);
  objc_storeStrong((id *)&self->_topLevelObjectsToKeepAliveFromStoryboard, 0);
  objc_storeStrong((id *)&self->_externalObjectsTableForViewLoading, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong(&self->_dropShadowView, 0);
  objc_storeStrong(&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_modalPreservedFirstResponder, 0);
  objc_destroyWeak((id *)&self->_previousRootViewController);
  objc_storeStrong((id *)&self->_childModalViewControllers, 0);
  objc_storeStrong((id *)&self->_nibBundle, 0);
  objc_storeStrong((id *)&self->_nibName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_tabElement, 0);
  objc_destroyWeak((id *)&self->_tab);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_overrideTransitioningDelegate, 0);
}

- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "_window:willTransitionToTraitCollection:withTransitionCoordinator:", v8, v9, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  -[UIViewController _presentationController](self, "_presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_window:willTransitionToTraitCollection:withTransitionCoordinator:", v8, v9, v10);

}

- (void)_setIgnoresWrapperViewForContentOverlayInsets:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (void)_setOverrideUserInterfaceRenderingMode:(int64_t)a3
{
  int64_t v5;
  void *v7;

  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 4410, CFSTR("Attempt to set invalid _UIUserInterfaceRenderingMode value to overrideUserInterfaceRenderingMode: %ld"), a3);

  }
  v5 = -[UIViewController _overrideUserInterfaceRenderingMode](self, "_overrideUserInterfaceRenderingMode");
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4) & 0xFFF3 | (4 * (a3 & 3));
  if (-[UIViewController _overrideUserInterfaceRenderingMode](self, "_overrideUserInterfaceRenderingMode") != v5)
    -[UIViewController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
}

void __60__UIViewController_removeChildViewController_notifyDidMove___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSheetMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultFormSheetSizeForScreenSize:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v10;
  id v11;
  UIViewController *v12;
  void *v13;
  UIViewController *v14;
  UIViewController *v15;
  void *v16;
  void *v17;
  UIViewController *v18;
  UIViewController *v19;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "presentationStyle");
    if (v8 == 7 || v8 == 20)
      v10 = 0;
    else
      v10 = v6;
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v11, "_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController");
  v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _existingView](v12, "_existingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  if (!v15)
  {
    -[UIViewController _childViewControllerForExclusiveCollectionPhysicalButtonConfigurations](self, "_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController");
    v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    -[UIViewController _existingView](v12, "_existingView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = v12;
    else
      v18 = 0;
    v19 = v18;

    if (!v19)
      v12 = self;
  }

  return v12;
}

- (id)_childViewControllerForExclusiveCollectionPhysicalButtonConfigurations
{
  return 0;
}

- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!automaticallyAdjustsScrollViewInsets)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)_performAtViewIsAppearing:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__performAtViewIsAppearing_, a1, CFSTR("UIViewController.m"), 6800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    }
    v5 = _Block_copy(*(const void **)(a1 + 312));
    v6 = v5;
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__UIViewController__performAtViewIsAppearing___block_invoke;
      aBlock[3] = &unk_1E16C1F38;
      v13 = v5;
      v14 = v4;
      v7 = _Block_copy(aBlock);
      v8 = *(void **)(a1 + 312);
      *(_QWORD *)(a1 + 312) = v7;

    }
    else
    {
      v9 = _Block_copy(v4);
      v10 = *(void **)(a1 + 312);
      *(_QWORD *)(a1 + 312) = v9;

    }
  }

}

- (void)setExtendedLayoutIncludesOpaqueBars:(BOOL)extendedLayoutIncludesOpaqueBars
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!extendedLayoutIncludesOpaqueBars)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (void)setFocusGroupIdentifier:(NSString *)focusGroupIdentifier
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!focusGroupIdentifier)
    v3 = 0x1000000000000;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFCFFFFFFFFFFFFLL | v3;
  objc_setAssociatedObject(self, &FocusGroupIdentifierKey, focusGroupIdentifier, (void *)1);
}

- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle
{
  UIUserInterfaceStyle v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[6];
  uint8_t buf[16];

  if (pthread_main_np() == 1)
  {
    if ((unint64_t)overrideUserInterfaceStyle >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 4377, CFSTR("Attempt to set invalid UIUserInterfaceStyle value to overrideUserInterfaceStyle: %ld"), overrideUserInterfaceStyle);

    }
    v6 = -[UIViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
    *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0x3FFFFFFFFFFFFFFFLL | ((unint64_t)overrideUserInterfaceStyle << 62);
    if (-[UIViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") != v6)
      -[UIViewController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
  }
  else
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 4369, CFSTR("BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported."));

    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported.  This will become an assert in a future version.", buf, 2u);
      }

    }
    else
    {
      v8 = setOverrideUserInterfaceStyle____s_category;
      if (!setOverrideUserInterfaceStyle____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&setOverrideUserInterfaceStyle____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Attempting to set an overrideUserInterfaceStyle from a background thread. Modifying a view controller from a background thread is not supported.  This will become an assert in a future version.", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__UIViewController_setOverrideUserInterfaceStyle___block_invoke;
    block[3] = &unk_1E16B1888;
    block[4] = self;
    block[5] = overrideUserInterfaceStyle;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)setNeedsUserInterfaceAppearanceUpdate
{
  if (_UIIsPrivateMainBundle())
    -[UIViewController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
}

void __69__UIViewController__whitelistOfSubclassableViewControllersMarkedSafe__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EDDB1050;
  qword_1EDDB1050 = v9;

}

- (void)_beginDelayingPresentation:(double)a3 cancellationHandler:(id)a4
{
  _UIDelayedPresentationContext *v6;
  _UIDelayedPresentationContext *v7;
  id v8;

  v8 = a4;
  objc_getAssociatedObject(self, &unk_1EDDB0F73);
  v6 = (_UIDelayedPresentationContext *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[_UIDelayedPresentationContext incrementRequestCount](v6, "incrementRequestCount");
  }
  else
  {
    v7 = -[_UIDelayedPresentationContext initWithTimeout:cancellationHandler:]([_UIDelayedPresentationContext alloc], "initWithTimeout:cancellationHandler:", v8, a3);
    objc_setAssociatedObject(self, &unk_1EDDB0F73, v7, (void *)1);
  }

}

- (void)setRestoresFocusAfterTransition:(BOOL)restoresFocusAfterTransition
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (restoresFocusAfterTransition)
    v3 = 0x800000000000;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFF3FFFFFFFFFFFLL | v3;
}

- (id)registerForPreviewingWithDelegate:(id)delegate sourceView:(UIView *)sourceView
{
  id v6;
  UIView *v7;
  NSMutableArray *previewSourceViews;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  UIView *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = delegate;
  v7 = sourceView;
  previewSourceViews = self->_previewSourceViews;
  if (!previewSourceViews)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_previewSourceViews;
    self->_previewSourceViews = v9;

    previewSourceViews = self->_previewSourceViews;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = previewSourceViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "sourceView", (_QWORD)v20);
        v17 = (UIView *)objc_claimAutoreleasedReturnValue();

        if (v17 == v7)
        {
          v18 = v16;

          goto LABEL_13;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }

  _UIPreviewingContextForViewController(self, v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v6);
  -[NSMutableArray addObject:](self->_previewSourceViews, "addObject:", v18);
LABEL_13:

  return v18;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void *)completion
{
  _BOOL8 v6;
  UIViewController *v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  void *v15;
  _QWORD aBlock[4];
  _QWORD v17[2];
  id v18;
  BOOL v19;

  v6 = flag;
  v8 = viewControllerToPresent;
  v9 = completion;
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__UIViewController_presentViewController_animated_completion___block_invoke_2;
    v14[3] = &unk_1E16B1BA0;
    v10 = &v15;
    v15 = v9;
    v11 = v9;
    -[UIViewController _presentViewController:animated:completion:](self, "_presentViewController:animated:completion:", v8, v6, v14);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__UIViewController_presentViewController_animated_completion___block_invoke;
    aBlock[3] = &unk_1E16B1CF0;
    v19 = v6;
    v10 = (id *)v17;
    v17[0] = v8;
    v17[1] = self;
    v18 = v9;
    v12 = v9;
    v13 = _Block_copy(aBlock);
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v13, v6);

  }
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  _QWORD aBlock[4];
  id v20;
  UIViewController *v21;
  id v22;
  BOOL v23;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke;
  aBlock[3] = &unk_1E16B1CF0;
  v23 = v6;
  v11 = v8;
  v20 = v11;
  v21 = self;
  v12 = v9;
  v22 = v12;
  v13 = _Block_copy(aBlock);
  v14 = -[UIViewController _willPreemptRunningPresentationTransition](self, "_willPreemptRunningPresentationTransition");
  v15 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (v14)
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke_3;
    v16[3] = &unk_1E16BAFE8;
    v16[4] = self;
    v17 = v13;
    v18 = v6;
    +[UIView _performWithFluidPresentationTransitionsEnabled:](UIView, "_performWithFluidPresentationTransitionsEnabled:", v16);

  }
  else
  {
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v13, v6);
  }
  _UIRestorePreviousFallbackEnvironment(v15);

}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void *)completion
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  _QWORD aBlock[5];
  id v14;
  BOOL v15;

  v4 = flag;
  v6 = completion;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E16BAFE8;
  aBlock[4] = self;
  v15 = v4;
  v8 = v6;
  v14 = v8;
  v9 = _Block_copy(aBlock);
  if (-[UIViewController _willPreemptRunningTransitionForDismissal](self, "_willPreemptRunningTransitionForDismissal"))
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E16BAFE8;
    v10[4] = self;
    v11 = v9;
    v12 = v4;
    +[UIView _performWithFluidPresentationTransitionsEnabled:](UIView, "_performWithFluidPresentationTransitionsEnabled:", v10);

  }
  else
  {
    -[UIViewController _performCoordinatedPresentOrDismiss:animated:]((id *)&self->super.super.isa, v9, v4);
  }

}

- (void)_performCoordinatedPresentOrDismiss:(uint64_t)a3 animated:
{
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);

  v5 = a2;
  v6 = v5;
  if (a1 && v5)
  {
    objc_msgSend(a1, "_transitionCoordinator");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      if (!objc_msgSend(a1[62], "_requiresDeferralToCoordinateWithNavigationTransitionAnimated:", a3))
      {
        v9 = objc_msgSend(v8, "presentationStyle");
        if (dyld_program_sdk_at_least() && v9 == -1)
        {
          +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, a3, v6);
LABEL_19:

          goto LABEL_20;
        }
        if ((a3 & 1) == 0 && v9 == -1)
        {
          +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v6);
          goto LABEL_19;
        }
LABEL_16:
        objc_opt_self();
        if (fluidPresentationTransitionsEnabled == 1)
        {
          v6[2](v6);
        }
        else
        {
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __65__UIViewController__performCoordinatedPresentOrDismiss_animated___block_invoke;
          v14[3] = &unk_1E16B1CC8;
          v15 = v6;
          objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v14);

        }
        goto LABEL_19;
      }
LABEL_15:
      dyld_program_sdk_at_least();
      goto LABEL_16;
    }
    objc_msgSend(a1, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(a1, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v12, "_presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_adaptiveTransitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_15;
    if ((a3 & 1) != 0 || (dyld_program_sdk_at_least() & 1) != 0)
      v6[2](v6);
    else
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v6);
  }
LABEL_20:

}

uint64_t __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 9;
  else
    v1 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerWithTransition:completion:", v1, *(_QWORD *)(a1 + 40));
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  UIViewController *v9;
  char v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  UIViewController *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  char v20;
  UIViewControllerAction *currentAction;
  NSString *name;
  unint64_t v23;
  NSObject *v24;
  id v25;
  UIViewController *v26;
  UIViewController *v27;
  uint64_t v28;
  UIViewController *v29;
  UIViewController *v30;
  void *v31;
  void *v32;
  UIViewController *v33;
  uint64_t v34;
  UIViewController *v35;
  UIViewController *v36;
  UIViewController *v37;
  UIViewController *v38;
  UIViewController *v39;
  UIViewController *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UIViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  UIViewControllerAction *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  UIViewController *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  UIViewController *v60;
  uint64_t v61;
  id v62;
  id v63;
  void (**v64)(_QWORD);
  void (**v65)(_QWORD);
  _QWORD aBlock[4];
  id v67;
  uint8_t buf[4];
  UIViewController *v69;
  uint64_t v70;

  v4 = *(_QWORD *)&a3;
  v70 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIViewController_dismissViewControllerWithTransition_completion___block_invoke;
  aBlock[3] = &unk_1E16B1BF8;
  v7 = v6;
  v67 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_opt_self();
  if ((fluidPresentationTransitionsEnabled & 1) != 0)
  {
    if (!self)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_25;
    }
LABEL_10:
    objc_getAssociatedObject(self, &unk_1EDDB0F73);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && objc_msgSend(v13, "requestCount"))
    {
      v9 = self;
      goto LABEL_17;
    }
    objc_getAssociatedObject(self, &unk_1EDDB0F72);
    v15 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v15)
    {
      objc_getAssociatedObject(v15, &unk_1EDDB0F73);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && objc_msgSend(v16, "requestCount"))
      {
        v14 = v16;
LABEL_17:

        -[UIViewController _cancelDelayedPresentation:](v9, "_cancelDelayedPresentation:", 0);
        v10 = 0;
        if (v9 == self)
        {
          v17 = qword_1EDDB1040;
          if (!qword_1EDDB1040)
          {
            v17 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v17, (unint64_t *)&qword_1EDDB1040);
          }
          v18 = *(NSObject **)(v17 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v69 = self;
            _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "Not dismissing %@ because our presentation was delayed, and we were never presented.", buf, 0xCu);
          }
          v8[2](v8);
          v9 = self;
          goto LABEL_109;
        }
LABEL_25:
        if (_UIAppUseModernRotationAndPresentationBehaviors())
        {
          -[UIViewController _presentationController](self, "_presentationController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "_presentingOrPresented");

          if ((v20 & 1) != 0)
          {
            objc_opt_self();
            if (fluidPresentationTransitionsEnabled == 1
              && ((currentAction = self->_currentAction) == 0 ? (name = 0) : (name = currentAction->_name),
                  -[NSString isEqualToString:](name, "isEqualToString:", CFSTR("DismissModal"))))
            {
              v23 = qword_1EDDB1048;
              if (!qword_1EDDB1048)
              {
                v23 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v23, (unint64_t *)&qword_1EDDB1048);
              }
              v24 = *(NSObject **)(v23 + 8);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v69 = self;
                _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to dismiss from view controller %@ while a dismiss is in proress!", buf, 0xCu);
              }
              v8[2](v8);
            }
            else
            {
              v65 = v8;
              -[UIViewController childModalViewController](self, "childModalViewController");
              v33 = (UIViewController *)objc_claimAutoreleasedReturnValue();
              -[UIViewController presentedViewController](v33, "presentedViewController");
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34)
              {
                v35 = (UIViewController *)v34;
                do
                {
                  if (v33 == v35)
                    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIViewControllerHierarchyInconsistency"), CFSTR("presentedViewController for controller is itself on dismiss for: %@"), v35);
                  v36 = v35;

                  -[UIViewController presentedViewController](v36, "presentedViewController");
                  v35 = (UIViewController *)objc_claimAutoreleasedReturnValue();

                  v33 = v36;
                }
                while (v35);
              }
              else
              {
                v36 = v33;
              }
              -[UIViewController presentingViewController](v36, "presentingViewController");
              v55 = (UIViewController *)objc_claimAutoreleasedReturnValue();
              -[UIViewController _presentationController](self, "_presentationController");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "_childPresentationController");
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              if (v57 && (objc_msgSend(v57, "shouldPresentInFullscreen") & 1) == 0)
              {
                -[UIViewController _presentationController](self, "_presentationController");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "_coverWithSnapshot");

              }
              if (!v55 || v55 == self)
              {
                v60 = v36;
              }
              else
              {
                do
                {
                  -[UIViewController _presentationController](v55, "_presentationController");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v59, "dismissing") & 1) == 0)
                    -[UIViewController _dismissViewControllerWithTransition:from:completion:](v55, "_dismissViewControllerWithTransition:from:completion:", v4, v36, 0);
                  v60 = v55;

                  -[UIViewController presentingViewController](v60, "presentingViewController");
                  v55 = (UIViewController *)objc_claimAutoreleasedReturnValue();

                  if (!v55)
                    break;
                  v36 = v60;
                }
                while (v55 != self);
              }
              if ((_DWORD)v4)
              {
                v8 = v65;
                if (-[UIViewController definesPresentationContext](self, "definesPresentationContext")
                  && -[UIViewController providesPresentationContextTransitionStyle](self, "providesPresentationContextTransitionStyle"))
                {
                  LODWORD(v4) = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, -[UIViewController modalTransitionStyle](self, "modalTransitionStyle"), 0);
                }
              }
              else
              {
                v8 = v65;
              }
              if ((*(_QWORD *)&v60->_viewControllerFlags & 0x200000000) != 0)
                v61 = 0;
              else
                v61 = v4;
              -[UIViewController _dismissViewControllerWithTransition:from:completion:](self, "_dismissViewControllerWithTransition:from:completion:", v61, v60, v7);

            }
          }
          else
          {
            -[UIViewController _viewControllerForDismissal](self);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              objc_msgSend(v31, "dismissViewControllerWithTransition:completion:", v4, v7);
            }
            else
            {
              -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "_closeScene");
                -[UIViewController _setTemporaryPresentationController:](self, "_setTemporaryPresentationController:", 0);

              }
              v8[2](v8);
            }

          }
          goto LABEL_109;
        }
        objc_msgSend((id)UIApp, "_deactivateReachability");
        v25 = v7;
        if ((v10 & 1) != 0)
        {
LABEL_83:

LABEL_109:
          goto LABEL_110;
        }
        -[UIViewController childModalViewController](self, "childModalViewController");
        v26 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          -[UIViewController presentedViewController](self, "presentedViewController");
          v37 = (UIViewController *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (!v37
            || (-[UIViewController presentingViewController](v37, "presentingViewController"),
                (v39 = (UIViewController *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[UIViewController presentingViewController](self, "presentingViewController");
            v39 = (UIViewController *)objc_claimAutoreleasedReturnValue();
          }
          -[UIViewController dismissViewControllerWithTransition:completion:](v39, "dismissViewControllerWithTransition:completion:", v4, v25);
          self = v39;
          goto LABEL_82;
        }
        v27 = v26;
        v62 = v25;
        v64 = v8;
        -[UIViewController presentedViewController](v26, "presentedViewController");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (UIViewController *)v28;
          do
          {
            if (v27 == v29)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIViewControllerHierarchyInconsistency"), CFSTR("presentedViewController for controller is itself on dismiss for: %@"), v29);
            v30 = v29;

            -[UIViewController _presentingViewControllerWillChange:](v30, "_presentingViewControllerWillChange:", 0);
            -[UIViewController presentedViewController](v30, "presentedViewController");
            v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();

            v27 = v30;
          }
          while (v29);
        }
        else
        {
          v30 = v27;
        }
        v63 = v7;
        -[UIViewController _presentingViewControllerWillChange:](v30, "_presentingViewControllerWillChange:", 0);
        -[UIViewController presentingViewController](v30, "presentingViewController");
        v40 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        v41 = -[UIViewController modalPresentationStyle](v30, "modalPresentationStyle");
        -[UIViewController view](v30, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "window");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40 == self)
        {
          v38 = 0;
          if ((_DWORD)v4)
          {
LABEL_73:
            v7 = v63;
            v8 = v64;
            if (-[UIViewController definesPresentationContext](self, "definesPresentationContext")
              && -[UIViewController providesPresentationContextTransitionStyle](self, "providesPresentationContextTransitionStyle"))
            {
              LODWORD(v4) = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, -[UIViewController modalTransitionStyle](self, "modalTransitionStyle"), 0);
            }
            goto LABEL_78;
          }
        }
        else
        {
          v38 = 0;
          do
          {
            -[UIViewController view](v40, "view");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "window");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {
              -[UIViewController _dismissViewControllerWithTransition:from:completion:](v40, "_dismissViewControllerWithTransition:from:completion:", 0, v30, 0);
              v40 = v40;

              -[UIViewController presentingViewController](v40, "presentingViewController");
              v46 = (UIViewController *)objc_claimAutoreleasedReturnValue();
              v30 = v40;
            }
            else
            {
              -[UIViewController _presentingViewControllerWillChange:](v40, "_presentingViewControllerWillChange:", 0);
              -[UIViewController presentingViewController](v40, "presentingViewController");
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v41 == 3)
                -[UIViewController setModalPresentationStyle:](v30, "setModalPresentationStyle:", -[UIViewController modalPresentationStyle](v40, "modalPresentationStyle"));
              if (v40)
              {
                -[UIViewController childModalViewController](v40, "childModalViewController");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "_setModalSourceViewController:", 0);
                objc_msgSend(v48, "_setSegueResponsibleForModalPresentation:", 0);
                -[UIViewController childModalViewController](v40, "childModalViewController");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIViewController _removeChildModalViewController:]((id *)&v40->super.super.isa, v49);

                *(_QWORD *)&v40->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
                v50 = v40->_currentAction;
                v40->_currentAction = 0;

              }
              if (-[UIViewController _isModalSheet](v40, "_isModalSheet")
                || -[UIViewController modalPresentationStyle](v40, "modalPresentationStyle") == UIModalPresentationOverFullScreen
                || -[UIViewController modalPresentationStyle](v40, "modalPresentationStyle") == 17
                || -[UIViewController modalPresentationStyle](v40, "modalPresentationStyle") == UIModalPresentationCustom)
              {
                objc_msgSend(v43, "_removeRotationViewController:", v40);
              }
              objc_msgSend(v47, "childModalViewController");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIViewController _removeChildModalViewController:]((id *)v47, v51);

              -[UIViewController _addChildModalViewController:]((id *)v47, v30);
              -[UIViewController _presentingViewControllerDidChange:](v40, "_presentingViewControllerDidChange:", 0);
              v38 = v47;
              v46 = v38;
            }

            v40 = v46;
          }
          while (v46 != self);
          if ((_DWORD)v4)
            goto LABEL_73;
        }
        v7 = v63;
        v8 = v64;
LABEL_78:
        if ((*(_QWORD *)&v30->_viewControllerFlags & 0x200000000) != 0)
          v52 = 0;
        else
          v52 = v4;
        -[UIViewController _dismissViewControllerWithTransition:from:completion:](self, "_dismissViewControllerWithTransition:from:completion:", v52, v30, v62);

        v25 = v62;
LABEL_82:

        goto LABEL_83;
      }
    }
    else
    {
      v16 = v14;
    }

    v9 = 0;
    v10 = 0;
    goto LABEL_25;
  }
  if (!self->_currentAction)
    goto LABEL_10;
  v11 = qword_1EDDB1038;
  if (!qword_1EDDB1038)
  {
    v11 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&qword_1EDDB1038);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = self;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to dismiss from view controller %@ while a presentation or dismiss is in progress!", buf, 0xCu);
  }
  v8[2](v8);
LABEL_110:

}

uint64_t __67__UIViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = dyld_program_sdk_at_least();
    if ((_DWORD)result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)setRestorationClass:(id)restorationClass
{
  id v4;

  NSStringFromClass((Class)restorationClass);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &kViewControllerRestorationClassKey, v4, (void *)1);

}

- (id)_customAnimatorForPresentedController:(void *)a3 presentingController:(void *)a4 sourceController:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "preferredTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (objc_msgSend(v10, "_transitionControllerForViewController:inContainer:isAppearing:", v7, 0, 1),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "transitioningDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v13, "animationControllerForPresentedController:presentingController:sourceController:", v7, v8, v9);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v12 = (void *)v14;
LABEL_11:

        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v13, "animatorForPresentedController:presentingController:sourceController:", v7, v8, v9);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v12 = 0;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return v12;
}

- (id)transitioningDelegate
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;

  -[UIViewController _overrideTransitioningDelegate](self, "_overrideTransitioningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    WeakRetained = v3;
  else
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningDelegate);
  v6 = WeakRetained;

  return v6;
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  uint64_t viewControllerFlags;
  unint64_t v4;
  uint64_t v5;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  v4 = viewControllerFlags & 0xFFFFFFFFFE7FFFFFLL | 0x800000;
  v5 = viewControllerFlags | 0x1800000;
  if (!a3)
    v5 = v4;
  *(_QWORD *)&self->_viewControllerFlags = v5;
}

- (void)setParentModalViewController:(id)a3
{
  self->_parentModalViewController = (UIViewController *)a3;
}

- (void)_setPresentedUserInterfaceStyleViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *v6;

  v5 = (UIViewController *)a3;
  if (self->_presentedUserInterfaceStyleViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_presentedUserInterfaceStyleViewController, a3);
    -[UIViewController _setNeedsUserInterfaceAppearanceUpdate](self, "_setNeedsUserInterfaceAppearanceUpdate");
    v5 = v6;
  }

}

- (void)_setPresentedStatusBarViewController:(id)a3 shouldJoinAnimationsInProgress:(BOOL)a4
{
  _BOOL4 v4;
  UIViewController *v7;
  void *v8;
  char v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a4;
  v7 = (UIViewController *)a3;
  if (self->_presentedStatusBarViewController != v7)
  {
    objc_storeStrong((id *)&self->_presentedStatusBarViewController, a3);
    if (!v4)
      goto LABEL_4;
    -[UIViewController _definiteTransitionCoordinator](self, "_definiteTransitionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke;
    v11[3] = &unk_1E16B2150;
    v11[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke_2;
    v10[3] = &unk_1E16B2150;
    v9 = objc_msgSend(v8, "animateAlongsideTransition:completion:", v11, v10);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      -[UIViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
      -[UIViewController _setNeedsUserInterfaceAppearanceUpdate](self, "_setNeedsUserInterfaceAppearanceUpdate");
      -[UIViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
    }
    -[UIViewController _invalidateBehaviorPreferences](self);
  }

}

- (void)_setPresentedStatusBarViewController:(id)a3
{
  -[UIViewController _setPresentedStatusBarViewController:shouldJoinAnimationsInProgress:](self, "_setPresentedStatusBarViewController:shouldJoinAnimationsInProgress:", a3, 1);
}

- (void)_setPresentationController:(id)a3
{
  UIPresentationController *v5;
  UIPresentationController **p_presentationController;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  UIPresentationController *v11;

  v5 = (UIPresentationController *)a3;
  p_presentationController = &self->_presentationController;
  if (self->_presentationController != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_presentationController, a3);
    -[UIViewController childModalViewController](self, "childModalViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*p_presentationController)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      objc_msgSend(v7, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _UIViewTopDownSubtreeTraversal((uint64_t)v10, &__block_literal_global_697, 0);

    }
    v5 = v11;
  }

}

- (void)_setModalSourceViewController:(id)a3
{
  self->_modalSourceViewController = (UIViewController *)a3;
}

- (void)_presentViewController:(id)a3 withAnimationController:(id)a4 completion:(id)a5
{
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  UIViewController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  UIModalTransitionStyle v27;
  void *v28;
  UIViewController *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  _QWORD *v34;
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
  UIPresentationController *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  UIViewController *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  UIPresentationController *v58;
  void *v59;
  void *v60;
  UIViewController *v61;
  UIViewController *v62;
  void *v63;
  unint64_t v64;
  NSObject *v65;
  const char *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  unint64_t v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  int v91;
  int v92;
  UIViewController *v93;
  id v94;
  UIViewControllerBuiltinTransitionViewAnimator *v95;
  UIViewControllerBuiltinTransitionViewAnimator *v96;
  _BOOL4 v97;
  UIViewController *v98;
  UIViewController *v99;
  void *v100;
  UIViewControllerBuiltinTransitionViewAnimator *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  UIViewController *v105;
  UIViewControllerBuiltinTransitionViewAnimator *v106;
  UIViewController *v107;
  NSObject *v108;
  unint64_t v109;
  NSObject *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  BOOL v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  int isKindOfClass;
  UIViewController *v130;
  id v131;
  void *v132;
  UIPresentationController *v133;
  void *v134;
  id v135;
  UIViewController *v136;
  void *v137;
  void *v138;
  _QWORD v139[6];
  id v140;
  _QWORD v141[5];
  _QWORD block[4];
  _QWORD *v143;
  UIViewController *v144;
  UIViewControllerBuiltinTransitionViewAnimator *v145;
  id location;
  SEL v147;
  _BYTE buf[12];
  __int16 v149;
  UIViewController *v150;
  __int16 v151;
  UIViewController *v152;
  __int16 v153;
  void *v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v147 = a2;
  v9 = a3;
  location = v9;
  v145 = (UIViewControllerBuiltinTransitionViewAnimator *)a4;
  v10 = a5;
  -[UIViewController _focusSystem](self, "_focusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[UIViewController _rememberPresentingFocusedItem:](self, "_rememberPresentingFocusedItem:", v12);
  +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "incrementValueBy:", 1);

  +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSampleRate:", 0.0);

  objc_msgSend(v9, "_viewControllerPresentationDidInitiate");
  v15 = objc_msgSend(v9, "modalPresentationStyle");
  if (os_variant_has_internal_diagnostics())
  {
    if (v15 == -2)
    {
      __UIFaultDebugAssertLog();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = -2;
        _os_log_fault_impl(&dword_185066000, v108, OS_LOG_TYPE_FAULT, "Effective modal presentation style should never return automatic! It returned %lu.", buf, 0xCu);
      }

    }
  }
  else if (v15 == -2)
  {
    v109 = qword_1EDDB1000;
    if (!qword_1EDDB1000)
    {
      v109 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v109, (unint64_t *)&qword_1EDDB1000);
    }
    v110 = *(NSObject **)(v109 + 8);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = -2;
      _os_log_impl(&dword_185066000, v110, OS_LOG_TYPE_ERROR, "Effective modal presentation style should never return automatic! It returned %lu.", buf, 0xCu);
    }
  }
  if (-[UIViewController _isWaitingForDelayedPresentation](self))
  {
    objc_getAssociatedObject(self, &unk_1EDDB0F72);
    v16 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempt to present %@ on %@ which is waiting for a delayed presention of %@ to complete"), v9, self, v16);
    goto LABEL_119;
  }
  if (_UIAppUseModernRotationAndPresentationBehaviors()
    || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "userInterfaceIdiom"),
        v17,
        (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "_wantsWideContentMargins");

      if ((v20 & 1) == 0)
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "userInterfaceIdiom");

        if ((v22 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          -[UIViewController traitCollection](self, "traitCollection");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v15 <= 0x10 && ((1 << v15) & 0x10006) != 0 && objc_msgSend(v23, "horizontalSizeClass") == 1)
            objc_msgSend(v9, "setModalPresentationStyle:", 0);

        }
      }
    }
  }
  else if (v15 <= 0x10 && ((1 << v15) & 0x10006) != 0)
  {
    objc_msgSend(v9, "setModalPresentationStyle:", 0);
  }
  if (!v9)
  {
    v47 = (void *)MEMORY[0x1E0C99DA0];
    v48 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present a nil modal view controller on target %@."), self);
    goto LABEL_142;
  }
  v16 = self->_parentViewController;
  -[UIViewController presentedViewController](v16, "presentedViewController");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    v27 = -[UIViewController modalTransitionStyle](self, "modalTransitionStyle");

    if (v27 == UIModalTransitionStylePartialCurl)
    {
      v47 = (void *)MEMORY[0x1E0C99DA0];
      v48 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present a nested modal view controller while curled %@."), self);
      goto LABEL_142;
    }
  }
  -[UIViewController _popoverController](self, "_popoverController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 || v15)
  {
    v30 = objc_msgSend(v9, "modalTransitionStyle");

    if (v30 == 3)
    {
LABEL_43:
      v47 = (void *)MEMORY[0x1E0C99DA0];
      v48 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present UIModalTransitionStylePartialCurl to or from non-fullscreen view controller %@."), self);
LABEL_142:
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v47;
LABEL_143:
      objc_msgSend(v122, "exceptionWithName:reason:userInfo:", v48, v121, 0);
      v120 = (id)objc_claimAutoreleasedReturnValue();

LABEL_144:
      objc_exception_throw(v120);
    }
  }
  else
  {
    -[UIViewController presentedViewController](v16, "presentedViewController");
    v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v29 == self && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle"))
    {
      v46 = objc_msgSend(v9, "modalTransitionStyle");

      if (v46 == 3)
        goto LABEL_43;
    }
    else
    {

    }
  }
  if (!dyld_program_sdk_at_least()
    || (-[UIViewController popoverPresentationController:](v9, 0),
        (v31 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (v32 = v31, v33 = objc_msgSend(v31, "_isShimmingPopoverControllerPresentation"), v32, !v33))
  {
    objc_msgSend(v9, "parentViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v114 = (void *)MEMORY[0x1E0C99DA0];
      v115 = *MEMORY[0x1E0C99778];
      v116 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "parentViewController");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "stringWithFormat:", CFSTR("Application tried to present modally a view controller %@ that has a parent view controller %@."), v9, v117);
    }
    else
    {
      objc_msgSend(v9, "_parentModalViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        objc_msgSend(v9, "_popoverController");
        if (objc_claimAutoreleasedReturnValue())
        {
          v47 = (void *)MEMORY[0x1E0C99DA0];
          v48 = *MEMORY[0x1E0C99778];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present modally a view controller %@ that is presented with deprecated UIPopoverController."), v9);
          goto LABEL_142;
        }
        if (objc_msgSend(v9, "_isDelayingPresentation"))
        {
          objc_msgSend(v9, "__viewControllerWillBePresented:", 1);
          v141[0] = MEMORY[0x1E0C809B0];
          v141[1] = 3221225472;
          v141[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_572;
          v141[3] = &unk_1E16C1FF8;
          v141[4] = self;
          -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v9, 1, v141);
          *(_QWORD *)buf = self;
          v37 = (void *)MEMORY[0x1E0C99DB8];
          -[UIViewController methodSignatureForSelector:](self, "methodSignatureForSelector:", a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "invocationWithMethodSignature:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "setArgument:atIndex:", buf, 0);
          objc_msgSend(v39, "setTarget:", self);
          objc_msgSend(v39, "setArgument:atIndex:", &v147, 1);
          objc_msgSend(v39, "setArgument:atIndex:", &location, 2);
          objc_msgSend(v39, "setArgument:atIndex:", &v145, 3);
          v140 = _Block_copy(v10);
          objc_msgSend(v39, "setArgument:atIndex:", &v140, 4);
          objc_msgSend(v39, "retainArguments");
          objc_getAssociatedObject(location, &unk_1EDDB0F73);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController _window](self, "_window");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "windowScene");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setWindowSceneIgnoringEvents:", v42);

          objc_msgSend(v40, "setPresentInvocation:", v39);
          objc_setAssociatedObject(self, &unk_1EDDB0F72, location, (void *)1);
          -[_UIDelayedPresentationContext beginDelayedPresentation]((uint64_t)v40);

          goto LABEL_119;
        }
        objc_msgSend(v9, "__viewControllerWillBePresented:", 0);
        objc_msgSend(v9, "_temporaryPresentationController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          v45 = v43;
          objc_msgSend(v9, "_setTemporaryPresentationController:", 0);
          goto LABEL_51;
        }
        if (v15 == 4 || objc_msgSend(v9, "_requiresCustomPresentationController"))
        {
          objc_msgSend(v9, "_customPresentationControllerForPresentedController:presentingController:sourceController:", v9, 0, self);
          v45 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
          if (v45)
            goto LABEL_51;
          v45 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, 0);
        }
        else
        {
          +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController traitCollection](self, "traitCollection");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "presentationControllerForPresentedViewController:inIdiom:", v9, objc_msgSend(v50, "userInterfaceIdiom"));
          v45 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();

          v44 = 0;
        }
        if (!v45)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v111 = v44;
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 9526, CFSTR("The specified modal presentation style doesn't have a corresponding presentation controller."));

          v44 = v111;
          v45 = 0;
        }
LABEL_51:
        -[UIViewController _modalPresenterForPresentationController:]((uint64_t)self, v45);
        v51 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        if (-[UIPresentationController _shouldConvertToScene](v45, "_shouldConvertToScene"))
        {
          objc_msgSend(location, "_setTemporaryPresentationController:", v45);
          -[UIPresentationController _convertToSceneFromPresentingViewController:](v45, "_convertToSceneFromPresentingViewController:", v51);
LABEL_118:

          goto LABEL_119;
        }
        v138 = v44;
        -[UIPresentationController _setSourceViewController:](v45, "_setSourceViewController:", self);
        v136 = v51;
        -[UIPresentationController _setPresentingViewController:](v45, "_setPresentingViewController:", v51);
        v52 = -[UIPresentationController __sizeClassPair](v45, "__sizeClassPair");
        v54 = v53;
        -[UIPresentationController presentingViewController](v45, "presentingViewController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "traitCollection");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v139[0] = MEMORY[0x1E0C809B0];
        v139[1] = 3221225472;
        v139[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_2;
        v139[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
        v127 = v54;
        v128 = v52;
        v139[4] = v52;
        v139[5] = v54;
        objc_msgSend(v56, "traitCollectionByModifyingTraits:", v139);
        v57 = objc_claimAutoreleasedReturnValue();

        v134 = (void *)v57;
        -[UIPresentationController _presentationControllerForTraitCollection:](v45, "_presentationControllerForTraitCollection:", v57);
        v58 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
        v135 = v10;
        if (v58 == v45)
        {
          v60 = 0;
        }
        else
        {
          -[UIPresentationController traitCollection](v45, "traitCollection");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPresentationController _presentedViewControllerForPresentationController:traitCollection:](v45, "_presentedViewControllerForPresentationController:traitCollection:", v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            -[UIPresentationController _setPresentedViewController:](v58, "_setPresentedViewController:", v60);
            objc_storeStrong(&location, v60);
          }
        }
        v61 = v136;
        v137 = v60;
        v62 = v61;
        v131 = location;
        if (location == v61)
        {
          v123 = (void *)MEMORY[0x1E0C99DA0];
          v48 = *MEMORY[0x1E0C99778];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present modal view controller on itself. Presenting controller is %@."), v61);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v123;
          goto LABEL_143;
        }
        objc_opt_self();
        if ((fluidPresentationTransitionsEnabled & 1) == 0)
        {
          -[UIViewController currentAction](v62, "currentAction");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            v64 = qword_1EDDB1010;
            if (!qword_1EDDB1010)
            {
              v64 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v64, (unint64_t *)&qword_1EDDB1010);
            }
            v65 = *(NSObject **)(v64 + 8);
            v51 = v62;
            v10 = v135;
            if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              goto LABEL_117;
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v131;
            v149 = 2112;
            v150 = v51;
            v151 = 2112;
            v152 = self;
            v66 = "Attempt to present %@ on %@ (from %@) while a presentation is in progress.";
            goto LABEL_71;
          }
        }
        v133 = v58;
        -[UIViewController view](v62, "view");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "window");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v68)
        {
          v69 = qword_1EDDB1018;
          if (!qword_1EDDB1018)
          {
            v69 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v69, (unint64_t *)&qword_1EDDB1018);
          }
          v65 = *(NSObject **)(v69 + 8);
          v51 = v62;
          v10 = v135;
          v58 = v133;
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            goto LABEL_117;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v131;
          v149 = 2112;
          v150 = v51;
          v151 = 2112;
          v152 = self;
          v66 = "Attempt to present %@ on %@ (from %@) whose view is not in the window hierarchy.";
LABEL_71:
          _os_log_impl(&dword_185066000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0x20u);
LABEL_117:

          v44 = v138;
          goto LABEL_118;
        }
        objc_opt_self();
        v51 = v62;
        if ((fluidPresentationTransitionsEnabled & 1) != 0)
          -[UIViewController _appearingOrAppearedChildModalViewController]((uint64_t)v62);
        else
          -[UIViewController childModalViewController](v62, "childModalViewController");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = v133;
        if (v70)
        {
          v71 = qword_1EDDB1020;
          if (!qword_1EDDB1020)
          {
            v71 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v71, (unint64_t *)&qword_1EDDB1020);
          }
          v72 = *(NSObject **)(v71 + 8);
          v10 = v135;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v73 = v72;
            -[UIViewController childModalViewController](v51, "childModalViewController");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v131;
            v149 = 2112;
            v150 = v51;
            v151 = 2112;
            v152 = self;
            v153 = 2112;
            v154 = v74;
            _os_log_impl(&dword_185066000, v73, OS_LOG_TYPE_ERROR, "Attempt to present %@ on %@ (from %@) which is already presenting %@.", buf, 0x2Au);

          }
          goto LABEL_117;
        }
        -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController _existingView](self, "_existingView");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "window");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "rootViewController");
        v78 = objc_claimAutoreleasedReturnValue();
        if (v75 == (void *)v78)
        {

        }
        else
        {
          v79 = (void *)v78;
          v125 = -[UIViewController _ancestorViewControllerIsInPopover](self, "_ancestorViewControllerIsInPopover");

          v51 = v62;
          if (v125)
            goto LABEL_87;
          if (!os_variant_has_internal_diagnostics())
          {
            v80 = qword_1EDDB1028;
            if (!qword_1EDDB1028)
            {
              v80 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v80, (unint64_t *)&qword_1EDDB1028);
            }
            v81 = *(NSObject **)(v80 + 8);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v131;
              v149 = 2112;
              v150 = self;
              v151 = 2112;
              v152 = self;
              _os_log_impl(&dword_185066000, v81, OS_LOG_TYPE_ERROR, "Presenting view controller %@ from detached view controller %@ is not supported, and may result in incorrect safe area insets and a corrupt root presentation. Make sure %@ is in the view controller hierarchy before presenting from it. Will become a hard exception in a future release.", buf, 0x20u);
            }
LABEL_87:
            -[UIViewController _presentationController](v51, "_presentationController");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_transitionContext");
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v83, "_animator");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = v83;
            v126 = v84;
            if (objc_msgSend(v84, "conformsToProtocol:", &unk_1EDDCE3D0))
            {
              v85 = objc_msgSend(v84, "shouldPreemptWithContext:", v83);
              v86 = v84;
              v10 = v135;
              v88 = v127;
              v87 = v128;
              if (v85)
              {
                objc_msgSend(v86, "preemptWithContext:", v83);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v124 = 0;
              }
            }
            else
            {
              v124 = 0;
              v10 = v135;
              v88 = v127;
              v87 = v128;
            }
            -[UIViewController _setOriginalPresentationController:](v51, "_setOriginalPresentationController:", v45);
            -[UIViewController _setPresentationSizeClassPair:](v51, "_setPresentationSizeClassPair:", v87, v88);
            -[UIViewController view](v51, "view");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "superview");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v91 = !-[UIViewController definesPresentationContext](v51, "definesPresentationContext");
            if (v15 == 3)
              v92 = v91;
            else
              v92 = 1;
            v93 = (UIViewController *)location;
            objc_msgSend(location, "_overrideTransitioningDelegate");
            v94 = (id)objc_claimAutoreleasedReturnValue();
            if (!v94)
            {
              if (+[UIViewController _shouldAnimateTransitions](UIViewController, "_shouldAnimateTransitions"))
              {
                goto LABEL_99;
              }
              -[UIViewController _defaultAnimationController](v93, "_defaultAnimationController");
              v95 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
              v94 = v145;
              v145 = v95;
            }

LABEL_99:
            v96 = v145;
            if (!v145)
            {
              if (-[UIPresentationController _forcesPreferredAnimationControllers](v133, "_forcesPreferredAnimationControllers"))
              {
                -[UIPresentationController _preferredAnimationControllerForPresentation](v133, "_preferredAnimationControllerForPresentation");
                v96 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
                v145 = v96;
              }
              else
              {
                v96 = 0;
              }
            }
            if (((v92 | isKindOfClass) & 1) != 0)
            {
              v97 = 0;
              v98 = v93;
            }
            else
            {
              v97 = -[UIViewController providesPresentationContextTransitionStyle](v51, "providesPresentationContextTransitionStyle");
              if (v97)
                v98 = v51;
              else
                v98 = v93;
            }
            v99 = v98;
            v130 = v99;
            if (!v96)
            {
              v105 = v99;
              -[UIViewController _customAnimatorForPresentedController:presentingController:sourceController:](v99, v93, v51, self);
              v106 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
              v145 = v106;
              if (v106)
              {
                v96 = v106;
                -[UIViewController _customInteractionControllerForPresentation:](v105, v106);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                if (v100)
                  goto LABEL_110;
              }
              else
              {
                -[UIPresentationController _preferredAnimationControllerForPresentation](v133, "_preferredAnimationControllerForPresentation");
                v96 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
                v145 = v96;
                if (!v96)
                {
                  if (v97)
                    v107 = v51;
                  else
                    v107 = v93;
                  v96 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, -[UIViewController modalTransitionStyle](v107, "modalTransitionStyle"), 1));
                  v145 = v96;
                }
              }
            }
            -[UIPresentationController _preferredInteractionControllerForPresentation:](v133, "_preferredInteractionControllerForPresentation:", v96);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = v145;
            v93 = (UIViewController *)location;
LABEL_110:
            -[UIViewController _preparePresentationControllerForPresenting:](self, "_preparePresentationControllerForPresenting:", v133);
            v101 = v96;
            v58 = v133;
            -[UIViewController _presentViewController:modalSourceViewController:presentationController:animationController:interactionController:handoffData:completion:](v51, "_presentViewController:modalSourceViewController:presentationController:animationController:interactionController:handoffData:completion:", v93, self, v133, v101, v100, v124, v10);
            -[UIPresentationController presentingViewController](v133, "presentingViewController");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "_transitionCoordinator");
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            if (v133 == v45)
              v104 = -1;
            else
              v104 = -[UIPresentationController presentationStyle](v133, "presentationStyle");
            -[UIPresentationController _sendDelegateWillPresentWithAdaptiveStyle:transitionCoordinator:](v45, "_sendDelegateWillPresentWithAdaptiveStyle:transitionCoordinator:", v104, v103);

            goto LABEL_117;
          }
          __UIFaultDebugAssertLog();
          v113 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v131;
            v149 = 2112;
            v150 = self;
            v151 = 2112;
            v152 = self;
            _os_log_fault_impl(&dword_185066000, v113, OS_LOG_TYPE_FAULT, "Presenting view controller %@ from detached view controller %@ is not supported, and may result in incorrect safe area insets and a corrupt root presentation. Make sure %@ is in the view controller hierarchy before presenting from it. Will become a hard exception in a future release.", buf, 0x20u);
          }

        }
        v51 = v62;
        goto LABEL_87;
      }
      v114 = (void *)MEMORY[0x1E0C99DA0];
      v115 = *MEMORY[0x1E0C99778];
      v118 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "_parentModalViewController");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "stringWithFormat:", CFSTR("Application tried to present modally a view controller %@ that is already being presented by %@."), v9, v117);
    }
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "exceptionWithName:reason:userInfo:", v115, v119, 0);
    v120 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_144;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke;
  block[3] = &unk_1E16B1B50;
  v34 = v9;
  v143 = v34;
  v144 = self;
  if (qword_1EDDB1008 != -1)
  {
    dispatch_once(&qword_1EDDB1008, block);
    v34 = v143;
  }

LABEL_119:
}

- (void)setModalInPopover:(BOOL)modalInPopover
{
  uint64_t v4;
  void *v5;
  UIViewController *v6;
  void *v7;
  id v8;

  v4 = 0x8000;
  if (!modalInPopover)
    v4 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v4;
  -[UIViewController _popoverController](self, "_popoverController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "_containedViewControllerModalStateChanged");
  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[UIViewController popoverPresentationController](self, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containedViewControllerModalStateChanged");

  }
}

- (_QWORD)popoverPresentationController:(_QWORD *)a1
{
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a1, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "_originalPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "_originalPresentationController");
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v2 = (_QWORD *)v8;
LABEL_17:

        return v2;
      }
    }
    else if (a2)
    {
      if (!v2[96])
      {
        v9 = objc_msgSend(v2, "modalPresentationStyle");
        if (v9 == 100 || v9 == 7)
        {
          if (objc_msgSend(v2, "_requiresCustomPresentationController"))
          {
            objc_msgSend(v2, "_customPresentationControllerForPresentedController:presentingController:sourceController:", v2, 0, v2);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v2, "modalPresentationStyle");
            v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPresentedViewController:presentingViewController:", v2, 0);
          }
          v11 = (void *)v10;
          objc_msgSend(v2, "_setTemporaryPresentationController:", v10);

        }
      }
      objc_msgSend(v2, "_temporaryPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(v2, "_temporaryPresentationController");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    v2 = 0;
    goto LABEL_17;
  }
  return v2;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return (UIPopoverPresentationController *)-[UIViewController popoverPresentationController:](self, 1);
}

- (UIPresentationController)_originalPresentationController
{
  return self->_originalPresentationController;
}

- (BOOL)_isDelayingPresentation
{
  void *v2;
  BOOL v3;

  objc_getAssociatedObject(self, &unk_1EDDB0F73);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestCount") != 0;

  return v3;
}

- (UIPresentationController)presentationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIViewController _parentModalViewController](self, "_parentModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController _parentModalViewController](self, "_parentModalViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_originalPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!self->_temporaryPresentationController)
    {
      if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationCustom
        || -[UIViewController _requiresCustomPresentationController](self, "_requiresCustomPresentationController"))
      {
        -[UIViewController _customPresentationControllerForPresentedController:presentingController:sourceController:](self, "_customPresentationControllerForPresentedController:presentingController:sourceController:", self, 0, self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "presentationControllerForPresentedViewController:", self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[UIViewController _setTemporaryPresentationController:](self, "_setTemporaryPresentationController:", v6);

    }
    -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIPresentationController *)v5;
}

- (BOOL)_overrideUseCustomPresentation
{
  return self->overrideUseCustomPresentation;
}

- (void)_setTemporaryPresentationController:(id)a3
{
  id v5;
  id *p_temporaryPresentationController;
  id v7;
  id v8;

  v5 = a3;
  p_temporaryPresentationController = (id *)&self->_temporaryPresentationController;
  v7 = *p_temporaryPresentationController;
  v8 = v5;
  if (*p_temporaryPresentationController != v5)
  {
    if (v7)
      objc_msgSend(v7, "_setPresentedViewControllerStoredWeakly:", 0);
    objc_storeStrong(p_temporaryPresentationController, a3);
    if (*p_temporaryPresentationController && dyld_program_sdk_at_least())
      objc_msgSend(*p_temporaryPresentationController, "_setPresentedViewControllerStoredWeakly:", 1);
  }

}

- (void)_endDelayingPresentation
{
  UIViewController *v3;
  NSObject *v4;
  id *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (-[UIViewController _isDelayingPresentation](self, "_isDelayingPresentation"))
  {
    objc_getAssociatedObject(self, &unk_1EDDB0F73);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "decrementRequestCount"))
    {
      v3 = self;
      if (v12)
      {
        v4 = *((_QWORD *)v12 + 6);
        if (v4)
        {
          dispatch_source_cancel(v4);
          v5 = (id *)v12;
          if (!*((_BYTE *)v12 + 8))
          {
            objc_msgSend(v12, "delayingController");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = (objc_class *)objc_opt_class();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finishing delayed presentation of <%s: %p>"), class_getName(v7), v6);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "windowSceneIgnoringEvents");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "_endIgnoringInteractionEventsForReason:", v8);

            objc_msgSend(v12, "setWindowSceneIgnoringEvents:", 0);
            v5 = (id *)v12;
          }
          v10 = v5[3];
          objc_msgSend(v10, "target");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setAssociatedObject(v11, &unk_1EDDB0F72, 0, (void *)1);

          objc_setAssociatedObject(v3, &unk_1EDDB0F73, 0, (void *)1);
          objc_msgSend(v10, "invoke");

        }
        else
        {
          objc_setAssociatedObject(v3, &unk_1EDDB0F73, 0, (void *)1);
        }
      }

    }
  }
}

- (UIModalTransitionStyle)modalTransitionStyle
{
  return self->_modalTransitionStyle;
}

- (UIViewControllerTransitioningDelegate)_overrideTransitioningDelegate
{
  return self->_overrideTransitioningDelegate;
}

- (id)currentAction
{
  return self->_currentAction;
}

void __63__UIViewController__presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  if (!*(_BYTE *)(a1 + 56)
    || (v2 = *(_QWORD *)(a1 + 32)) != 0 && (*(_QWORD *)(v2 + 368) & 0x200000000) != 0
    || !+[UIViewController _shouldAnimateTransitions](UIViewController, "_shouldAnimateTransitions"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__UIViewController__presentViewController_animated_completion___block_invoke_2;
    v7[3] = &unk_1E16BAD68;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v8 = v3;
    v9 = v4;
    v10 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_presentViewController:withAnimationController:completion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("_UIInternalViewControllerPresentationWillBeginNotification"), *(_QWORD *)(a1 + 32));

}

+ (BOOL)_shouldAnimateTransitions
{
  if ((objc_msgSend(a1, "_shouldDeferTransitions") & 1) != 0)
    return 1;
  objc_opt_self();
  return _ShouldAnimateImmediateTransitions != 0;
}

- (BOOL)definesPresentationContext
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 18) & 1;
}

- (uint64_t)_transitionForModalTransitionStyle:(int)a3 appearing:
{
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;

  if (result)
  {
    if (_AXSReduceMotionReduceSlideTransitionsEnabled())
    {
      return 6;
    }
    else
    {
      result = 6;
      switch(a2)
      {
        case 1:
          v7 = a3 == 0;
          v8 = 10;
          goto LABEL_9;
        case 2:
          return result;
        case 3:
          v5 = a3 == 0;
          v6 = 13;
          goto LABEL_19;
        case 10:
          v7 = a3 == 0;
          v8 = 8;
LABEL_9:
          if (v7)
            return v8;
          else
            return v8 + 1;
        case 11:
          v9 = a3 == 0;
          v10 = 7;
          v11 = 3;
          goto LABEL_15;
        case 12:
          v5 = a3 == 0;
          v6 = 16;
          goto LABEL_19;
        case 13:
          v9 = a3 == 0;
          v10 = 12;
          v11 = 18;
LABEL_15:
          if (v9)
            return v10;
          else
            return v11;
        case 14:
          v5 = a3 == 0;
          v6 = 19;
          goto LABEL_19;
        case 15:
          return 2;
        case 16:
          return 1;
        default:
          v5 = a3 == 0;
          v6 = 8;
LABEL_19:
          if (v5)
            result = v6 + 1;
          else
            result = v6;
          break;
      }
    }
  }
  return result;
}

- (void)_setPresentationSizeClassPair:(id)a3
{
  self->_presentationSizeClassPair = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- (void)_setOriginalPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_originalPresentationController, a3);
}

- (id)_modalPresenterForPresentationController:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "_initialPresentationViewControllerForViewController:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", objc_msgSend(v4, "_shouldRespectDefinesPresentationContext"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "shouldPresentInFullscreen"))
    goto LABEL_12;
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_parentModalViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v9)
    {
      v11 = v8;
      do
      {
        v10 = (void *)v9;

        objc_msgSend(v10, "_parentModalViewController");
        v9 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
      }
      while (v9);
    }
  }
  else
  {
    v10 = 0;
  }
  -[UIViewController _parentViewController]((id *)v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_12:
    objc_msgSend(v6, "childModalViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    while (objc_msgSend(v6, "_mayForwardPresentationsToPresentedViewController") && v10)
    {
      v15 = v6;
      v6 = v10;

      objc_msgSend(v6, "childModalViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = v6;
    v14 = v8;
    goto LABEL_17;
  }
  v13 = (void *)v12;
  -[UIViewController _modalPresenterForPresentationController:](v12, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

  return v14;
}

- (BOOL)_mayForwardPresentationsToPresentedViewController
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 35) & 1;
}

- (void)_isWaitingForDelayedPresentation
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_getAssociatedObject(result, &unk_1EDDB0F72);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "_isDelayingPresentation");

    return (void *)v2;
  }
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[UIViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");
  v4 = objc_msgSend(v2, "verticalSizeClass");

  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setViewRespectsSystemMinimumLayoutMargins:(BOOL)viewRespectsSystemMinimumLayoutMargins
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;

  v3 = viewRespectsSystemMinimumLayoutMargins;
  if (-[UIViewController viewRespectsSystemMinimumLayoutMargins](self, "viewRespectsSystemMinimumLayoutMargins") != viewRespectsSystemMinimumLayoutMargins)
  {
    v5 = 0x8000000000000;
    if (!v3)
      v5 = 0;
    *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFF7FFFFFFFFFFFFLL | v5;
    -[UIViewController _existingView](self, "_existingView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateInferredLayoutMargins");

  }
}

- (void)_setUsesSharedView:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFEFFFFFFFFFLL | v3;
}

uint64_t __88__UIViewController__setPresentedStatusBarViewController_shouldJoinAnimationsInProgress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v4, "setNeedsStatusBarAppearanceUpdate");
      objc_msgSend(v4, "_setNeedsUserInterfaceAppearanceUpdate");
      return objc_msgSend(v4, "setNeedsWhitePointAdaptivityStyleUpdate");
    }
  }
  return result;
}

uint64_t __62__UIViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __104__UIViewController_AdaptiveSizing_Internal___window_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_presentingViewControllerDidChange:(id)a3
{
  *(_QWORD *)&self->_viewControllerFlags &= ~0x800000uLL;
}

- (id)topLayoutGuide
{
  void *v3;
  UILayoutSupport *v4;
  UILayoutSupport *topLayoutGuide;
  UILayoutSupport *v6;
  UILayoutSupport *v7;

  if (!self->_topLayoutGuide)
  {
    -[UIViewController _existingView](self, "_existingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if ((-[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self) & 1) != 0)
      {
        +[_UILayoutGuide _verticalLayoutGuide](_UILayoutGuide, "_verticalLayoutGuide");
        v4 = (UILayoutSupport *)objc_claimAutoreleasedReturnValue();
        topLayoutGuide = self->_topLayoutGuide;
        self->_topLayoutGuide = v4;

      }
      else
      {
        +[_UILayoutSpacer _verticalLayoutSpacer](_UILayoutSpacer, "_verticalLayoutSpacer");
        v6 = (UILayoutSupport *)objc_claimAutoreleasedReturnValue();
        v7 = self->_topLayoutGuide;
        self->_topLayoutGuide = v6;

        -[UILayoutSupport setIdentifier:](self->_topLayoutGuide, "setIdentifier:", CFSTR("UIVC-topLayoutGuide"));
      }
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 1);
    }
    else if ((topLayoutGuide_didLog & 1) == 0)
    {
      topLayoutGuide_didLog = 1;
      NSLog(CFSTR("%s: guide not available before the view controller's view is loaded"), "-[UIViewController topLayoutGuide]");
    }
  }
  return self->_topLayoutGuide;
}

- (id)bottomLayoutGuide
{
  void *v3;
  UILayoutSupport *v4;
  UILayoutSupport *bottomLayoutGuide;
  UILayoutSupport *v6;
  UILayoutSupport *v7;

  if (!self->_bottomLayoutGuide)
  {
    -[UIViewController _existingView](self, "_existingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if ((-[UIViewController _useViewBasedTopAndBottomLayoutGuides]((uint64_t)self) & 1) != 0)
      {
        +[_UILayoutGuide _verticalLayoutGuide](_UILayoutGuide, "_verticalLayoutGuide");
        v4 = (UILayoutSupport *)objc_claimAutoreleasedReturnValue();
        bottomLayoutGuide = self->_bottomLayoutGuide;
        self->_bottomLayoutGuide = v4;

      }
      else
      {
        +[_UILayoutSpacer _verticalLayoutSpacer](_UILayoutSpacer, "_verticalLayoutSpacer");
        v6 = (UILayoutSupport *)objc_claimAutoreleasedReturnValue();
        v7 = self->_bottomLayoutGuide;
        self->_bottomLayoutGuide = v6;

        -[UILayoutSupport setIdentifier:](self->_bottomLayoutGuide, "setIdentifier:", CFSTR("UIVC-bottomLayoutGuide"));
      }
      -[UIViewController _setUpLayoutGuideConstraintIfNecessaryAtTop:]((uint64_t)self, 0);
    }
    else if ((bottomLayoutGuide_didLog & 1) == 0)
    {
      bottomLayoutGuide_didLog = 1;
      NSLog(CFSTR("%s: guide not available before the view controller's view is loaded"), "-[UIViewController bottomLayoutGuide]");
    }
  }
  return self->_bottomLayoutGuide;
}

- (id)_modalPreservedFirstResponder
{
  if (a1)
    a1 = (id *)a1[17];
  return a1;
}

- (void)_didFinishPresentTransition
{
  UIViewControllerAction *currentAction;
  double curlUpRevealedHeight;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIViewControllerAction *v9;
  void *v10;
  id v11;
  double v12;

  -[UIViewController presentedViewController](self, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    currentAction = self->_currentAction;
    if (currentAction)
    {
      if (currentAction->_transition == 13)
      {
        curlUpRevealedHeight = currentAction->_curlUpRevealedHeight;
        v12 = curlUpRevealedHeight;
        v5 = v11;
        if (curlUpRevealedHeight == 0.0)
        {
          objc_msgSend(v11, "view");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "bounds");
          _UIViewCurlUpTransitionToTime(&v12, v7, v8);

          v5 = v11;
          curlUpRevealedHeight = v12;
        }
        -[UIViewController _addCurlUpTapGestureRecognizerWithRevealedHeight:](v5, curlUpRevealedHeight);
      }
    }
  }
  *(_QWORD *)&self->_viewControllerFlags &= ~0x400000uLL;
  v9 = self->_currentAction;
  self->_currentAction = 0;

  -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (id)_completionBlock
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (self->_currentAction)
  {
    -[UIViewController currentAction](self, "currentAction");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = *(void **)(v2 + 24);
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)attemptRotationToDeviceOrientation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() == 1)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:forScreen:", 0, 1, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_updateInterfaceOrientationFromDeviceOrientationIfRotationEnabled:", 1, (_QWORD)v11);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v9 = attemptRotationToDeviceOrientation___s_category;
    if (!attemptRotationToDeviceOrientation___s_category)
    {
      v9 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&attemptRotationToDeviceOrientation___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: +[UIViewController attemptRotationToDeviceOrientation] should not be called on a background thread.", buf, 2u);
    }
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_721);
  }
}

- (void)_updateViewConstraintsWithObservationTracking
{
  UIViewController *v2;

  v2 = self;
  sub_1857278D4();

}

- (void)_viewWillLayoutSubviewsWithObservationTracking
{
  UIViewController *v2;

  v2 = self;
  sub_185727D5C();

}

- (void)_viewDidLayoutSubviewsWithObservationTracking
{
  UIViewController *v2;

  v2 = self;
  sub_1857281E8();

}

- (void)_updateContentUnavailableConfigurationWithObservationTracking
{
  UIViewController *v2;

  v2 = self;
  sub_185728674();

}

- (id)_visualStyleOfContainingAlertController
{
  void *v2;
  void *v3;

  -[UIViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "_visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_hasDeepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__UIViewController_UIResponderChainTraversal___hasDeepestActionResponder__block_invoke;
  v3[3] = &unk_1E16B2268;
  v3[4] = self;
  return -[UIViewController _hasDeepestPresentedActionResponderOrBlock:](self, "_hasDeepestPresentedActionResponderOrBlock:", v3);
}

BOOL __73__UIViewController_UIResponderChainTraversal___hasDeepestActionResponder__block_invoke(uint64_t a1)
{
  _DWORD *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  v1 = *(_DWORD **)(a1 + 32);
  if (!v1 || ((v1[92] >> 1) & 3u) - 1 > 1)
    return 0;
  objc_msgSend(v1, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_hasDeepestPresentedActionResponderOrBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  char v6;
  char v7;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (dyld_program_sdk_at_least()
    && (-[UIViewController presentedViewController](self, "presentedViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_hasDeepestActionResponder"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v7 = v4[2](v4);
  }

  return v7;
}

- (id)_deepestActionResponder
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__UIViewController_UIResponderChainTraversal___deepestActionResponder__block_invoke;
  v3[3] = &unk_1E16BE5F0;
  v3[4] = self;
  -[UIViewController _deepestPresentedActionResponderOrBlock:](self, "_deepestPresentedActionResponderOrBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __70__UIViewController_UIResponderChainTraversal___deepestActionResponder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mutableChildViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v2, "reverseObjectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_DWORD **)(*((_QWORD *)&v16 + 1) + 8 * v7);
          if (v8
            && ((v8[92] >> 1) & 3u) - 1 <= 1
            && (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "_hasDeepestActionResponder") & 1) != 0)
          {
            v12 = v8;
            goto LABEL_19;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  v9 = *(_DWORD **)(a1 + 32);
  if (v9
    && ((v9[92] >> 1) & 3u) - 1 <= 1
    && (objc_msgSend(v9, "_existingView"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "window"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v9 = *(_DWORD **)(a1 + 32),
        v11))
  {
    objc_msgSend(v9, "_existingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v12;
LABEL_19:
    objc_msgSend(v12, "_deepestActionResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = v9;
    v15.super_class = (Class)UIViewController;
    objc_msgSendSuper2(&v15, sel__deepestActionResponder);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_deepestPresentedActionResponderOrBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = (void (**)(_QWORD))a3;
  -[UIViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasDeepestActionResponder");

  if (v6)
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_deepestActionResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (_UIActionSheetPresentationController)actionSheetPresentationController
{
  void *v2;
  id v3;

  -[UIViewController popoverPresentationController](self, "popoverPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "setCanOverlapSourceViewRect:", 1);
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return (_UIActionSheetPresentationController *)v3;
}

- (BOOL)_displaysFullScreen
{
  return 0;
}

- (int64_t)_imagePickerStatusBarStyle
{
  return 1;
}

- (CGSize)_resolvedPreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[UIViewController preferredContentSize](self, "preferredContentSize");
  v5 = v4;
  v6 = v3;
  if (v4 <= 0.0 || v3 <= 0.0)
  {
    -[UIViewController contentSizeForViewInPopover](self, "contentSizeForViewInPopover");
    if (v8 <= 0.0 || v8 == 1100.0 || v7 <= 0.0)
    {
      -[UIViewController parentViewController](self, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIViewController parentViewController](self, "parentViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_resolvedPreferredContentSize");
        v5 = v11;
        v6 = v12;

      }
      else
      {
        if (v5 <= 0.0)
          v5 = 320.0;
        if (v6 <= 0.0)
          v6 = 480.0;
      }
    }
    else
    {
      v6 = v8;
      v5 = v7;
    }
  }
  v13 = v5;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_ui_setObservationTrackingDictionary:(id)a3
{
  objc_super v3;

  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFFELL | (a3 != 0);
  v3.receiver = self;
  v3.super_class = (Class)UIViewController;
  -[NSObject _ui_setObservationTrackingDictionary:](&v3, sel__ui_setObservationTrackingDictionary_, a3);
}

- (id)_ui_observationTrackingDictionary
{
  objc_super v3;

  if ((*(_QWORD *)&self->_viewControllerFlags & 1) == 0)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIViewController;
  -[NSObject _ui_observationTrackingDictionary](&v3, sel__ui_observationTrackingDictionary);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_presentationControllerClassName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIViewController navigationInsetAdjustment](self, "navigationInsetAdjustment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsetAdjustment:", top, left, bottom, right);

}

- (void)_primitiveSetNavigationControllerContentOffsetAdjustment:(double)a3
{
  self->_navigationControllerContentOffsetAdjustment = a3;
}

- (void)_prepareForNavigationTransition:(BOOL)a3
{
  _BOOL4 v3;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = self->_view;
  v6 = v5;
  if (v5)
  {
    -[UIView window](v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v6, 0);
      if (v3)
        -[UIViewController __viewIsAppearing:skipWindowCheck:]((uint64_t)self, (*(_QWORD *)&self->_viewControllerFlags >> 22) & 1, 1);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[UIViewController childViewControllers](self, "childViewControllers", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
            if (-[UIViewController _isNestedNavigationController](self, "_isNestedNavigationController"))
            {
              -[UIViewController topViewController](self, "topViewController");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = v14 == v13;

            }
            else
            {
              v15 = 0;
            }
            objc_msgSend(v13, "_prepareForNavigationTransition:", v15);
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
  }

}

- (void)_updateContentOverlayInsetsFromParentForNavigationTransitionWithFinalRectInParent:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double top;
  double left;
  double bottom;
  double right;
  void *v14;
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIViewController _parentViewController]((id *)&self->super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 1322, CFSTR("Unexpected transition state"));

    v9 = 0;
  }
  top = self->_contentOverlayInsets.top;
  left = self->_contentOverlayInsets.left;
  bottom = self->_contentOverlayInsets.bottom;
  right = self->_contentOverlayInsets.right;
  if (-[UIViewController __updateContentOverlayInsetsWithOurRect:inBoundsOfAncestorViewController:viaImmediateChildOfAncestor:]((unint64_t)self, v9, self, x, y, width, height))-[UIViewController _invalidateChildContentOverlayInsetsWithOldInsets:]((double *)self, top, left, bottom, right);

}

- (UIEdgeInsets)_customBasePresentationInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_shim_contentScrollView
{
  void *v5;

  if ((_UIBarsApplyChromelessEverywhere() & 1) != 0)
    goto LABEL_6;
  if (qword_1EDDB0F80 != -1)
    dispatch_once(&qword_1EDDB0F80, &__block_literal_global_140);
  if (_MergedGlobals_138)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 1538, CFSTR("Unexpected code path for compatibility code only"));

  }
  return -[UIViewController contentScrollView](self, "contentScrollView");
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  *a4 = -1.79769313e308;
  *a5 = -1.79769313e308;
}

- (UIEdgeInsets)_avoidanceInsets
{
  double top;
  double bottom;
  double v4;
  double v5;
  UIEdgeInsets result;

  top = self->_contentOverlayInsets.top;
  bottom = self->_contentOverlayInsets.bottom;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = bottom;
  result.left = v4;
  result.top = top;
  return result;
}

- (UIEdgeInsets)_devicePeripheryInsets
{
  void *v2;
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
  UIEdgeInsets result;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_peripheryInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)safeAreaLayoutGuide
{
  void *v2;
  void *v3;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPreviousFittingSizeInfo:(id)a3
{
  objc_setAssociatedObject(self, &_UIViewControllerFittingSizeInfo, a3, (void *)1);
}

+ (BOOL)doesOverridePreferredInterfaceOrientationForPresentation
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", sel_preferredInterfaceOrientationForPresentation, objc_opt_class());
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  return objc_msgSend((id)objc_opt_class(), "doesOverridePreferredInterfaceOrientationForPresentation");
}

- (BOOL)_formSheetObeysContentContainerSize
{
  return 0;
}

- (CGSize)formSheetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_formSheetSize.width;
  height = self->_formSheetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_formSheetSizeForWindowWithSize:(CGSize)a3 screenSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance](_UIPresentationControllerDefaultVisualStyleProvider, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSheetMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formSheetSizeForViewController:windowSize:screenSize:", self, v7, v6, width, height);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setFormSheetSize:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  void *v23;
  id v24;

  height = a3.height;
  width = a3.width;
  -[UIViewController _existingView](self, "_existingView");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[UIViewController _existingView](self, "_existingView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "window"),
        v24 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v24))
  {
    objc_msgSend(v24, "screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[UIViewController _screen](self, "_screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v11 = v15;
    v13 = v16;

    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v17 = v13;
    v18 = v11;
    if (v24)
    {
      objc_msgSend(v24, "bounds", v11, v13);
      v18 = v19;
      v17 = v20;
    }
    -[UIViewController _formSheetSizeForWindowWithSize:screenSize:](self, "_formSheetSizeForWindowWithSize:screenSize:", v18, v17, v11, v13);
    height = v21;
    self->_formSheetSize.width = v22;
    v23 = v24;
    goto LABEL_14;
  }
  v23 = v24;
  if (width > 0.0 && height > 0.0 && width <= v11 && height <= v13)
  {
    self->_formSheetSize.width = width;
LABEL_14:
    self->_formSheetSize.height = height;
  }

}

- (void)setContentSizeForViewInPopover:(CGSize)contentSizeForViewInPopover
{
  double height;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  height = self->_contentSizeForViewInPopover.height;
  if (self->_contentSizeForViewInPopover.width != contentSizeForViewInPopover.width
    || height != contentSizeForViewInPopover.height)
  {
    self->_contentSizeForViewInPopover = contentSizeForViewInPopover;
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIViewController _existingView](self, "_existingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIPopoverView popoverViewContainingView:](_UIPopoverView, "popoverViewContainingView:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[UIViewController _popoverController](self, "_popoverController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v22 = v8;
          v10 = objc_msgSend(v8, "_embedsInView");
          v9 = v22;
          if ((v10 & 1) == 0)
          {
            objc_msgSend(v22, "contentViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "presentedViewController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "contentViewController");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v12)
            {
              objc_msgSend(v13, "presentedViewController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "contentSizeForViewInPopover");
              v17 = v16;
              v19 = v18;

            }
            else
            {
              objc_msgSend(v13, "contentSizeForViewInPopover");
              v17 = v20;
              v19 = v21;
            }

            objc_msgSend(v22, "setPopoverContentSize:animated:", height != 1100.0, v17, v19);
            v9 = v22;
          }
        }

      }
    }
  }
}

- (CGSize)contentSizeForViewInPopoverView
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeForViewInPopover.width;
  height = self->_contentSizeForViewInPopover.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)_preferredContentSizes
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3 childViewController:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UIViewController systemLayoutFittingSizeDidChangeForChildContentContainer:](self, "systemLayoutFittingSizeDidChangeForChildContentContainer:", a3);
  v6 = v7;
  if (v7)
  {
    -[UIViewController systemLayoutFittingSizeDidChangeForChildViewController:](self, "systemLayoutFittingSizeDidChangeForChildViewController:", v7);
    v6 = v7;
  }

}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_setMayForwardPresentationsToPresentedViewController:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)isModalInPopover
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_childModalViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "isModalInPopover", (_QWORD)v10) & 1) != 0)
        {

          LOBYTE(v8) = 1;
          return v8;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  return (*(_QWORD *)&self->_viewControllerFlags >> 15) & 1;
}

- (id)_viewForContentInPopover
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UIViewController childModalViewController](self, "childModalViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isModalInPresentation"),
        v5,
        v4,
        v6))
  {
    -[UIViewController childModalViewController](self, "childModalViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_viewForContentInPopover");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIViewController _popoverController](self, "_popoverController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[UIViewController _setPopoverController:](self, "_setPopoverController:", 0);
}

- (void)_setInCustomTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)_viewHostsLayoutEngine
{
  return self->_viewHostsLayoutEngine;
}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

uint64_t __34__UIViewController__doCommonSetup__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)qword_1EDDB0F88, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_childViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  UITabBarItem *tabBarItem;
  UINavigationItem *navigationItem;
  NSDictionary *externalObjectsTableForViewLoading;
  NSArray *topLevelObjectsToKeepAliveFromStoryboard;
  NSString *nibName;
  NSBundle *nibBundle;
  void *v11;
  UIViewController *parentViewController;
  uint64_t viewControllerFlags;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t modalTransitionStyle;
  int64_t modalPresentationStyle;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSString *storyboardIdentifier;
  NSArray *interfaceBuilderKeyCommands;
  NSArray *addedKeyCommands;
  unint64_t edgesForExtendedLayout;
  $3DCA1FCAFF514FD0F5EDC0B2943CCDEC *p_viewControllerFlags;
  uint64_t v32;
  UILayoutSupport *topLayoutGuide;
  UILayoutSupport *bottomLayoutGuide;
  NSMutableDictionary *observableScrollViews;
  NSString *interactionActivityTrackingBaseName;
  void *v37;
  id v38;

  v38 = a3;
  if (self->_view && -[UIViewController _shouldPersistViewWhenCoding](self, "_shouldPersistViewWhenCoding"))
    objc_msgSend(v38, "encodeObject:forKey:", self->_view, CFSTR("UIView"));
  title = self->_title;
  if (title)
    objc_msgSend(v38, "encodeObject:forKey:", title, CFSTR("UITitle"));
  tabBarItem = self->_tabBarItem;
  if (tabBarItem)
    objc_msgSend(v38, "encodeObject:forKey:", tabBarItem, CFSTR("UITabBarItem"));
  navigationItem = self->_navigationItem;
  if (navigationItem)
    objc_msgSend(v38, "encodeObject:forKey:", navigationItem, CFSTR("UINavigationItem"));
  externalObjectsTableForViewLoading = self->_externalObjectsTableForViewLoading;
  if (externalObjectsTableForViewLoading)
    objc_msgSend(v38, "encodeObject:forKey:", externalObjectsTableForViewLoading, CFSTR("UIExternalObjectsTableForViewLoading"));
  topLevelObjectsToKeepAliveFromStoryboard = self->_topLevelObjectsToKeepAliveFromStoryboard;
  if (topLevelObjectsToKeepAliveFromStoryboard)
    objc_msgSend(v38, "encodeObject:forKey:", topLevelObjectsToKeepAliveFromStoryboard, CFSTR("UITopLevelObjectsToKeepAliveFromStoryboard"));
  nibName = self->_nibName;
  if (nibName)
    objc_msgSend(v38, "encodeObject:forKey:", nibName, CFSTR("UINibName"));
  nibBundle = self->_nibBundle;
  if (nibBundle)
  {
    -[NSBundle bundleIdentifier](nibBundle, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "encodeObject:forKey:", v11, CFSTR("UINibBundleIdentifier"));

  }
  parentViewController = self->_parentViewController;
  if (parentViewController)
    objc_msgSend(v38, "encodeConditionalObject:forKey:", parentViewController, CFSTR("UIParentViewController"));
  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x40) == 0)
  {
    objc_msgSend(v38, "encodeBool:forKey:", 0, CFSTR("UIAutoresizesArchivedViewToFullSize"));
    viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  }
  if ((viewControllerFlags & 0x400) != 0)
    objc_msgSend(v38, "encodeBool:forKey:", 1, CFSTR("UIWantsFullScreenLayout"));
  if (-[NSArray count](self->_toolbarItems, "count"))
    objc_msgSend(v38, "encodeObject:forKey:", self->_toolbarItems, CFSTR("UIToolbarItems"));
  if (-[NSMutableArray count](self->_childViewControllers, "count"))
  {
    -[UIViewController _customChildViewControllerSelectorsNames](self, "_customChildViewControllerSelectorsNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      -[UIViewController _customChildViewControllerSelectorsNames](self, "_customChildViewControllerSelectorsNames");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "encodeObject:forKey:", v16, CFSTR("UIChildViewControllerSelectors"));

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableArray count](self->_childViewControllers, "count"));
    -[UIViewController _populateArchivedChildViewControllers:](self, "_populateArchivedChildViewControllers:", v17);
    if (objc_msgSend(v17, "count"))
    {
      UIArrayByKeepingObjectsInSet(self->_childViewControllers, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "encodeObject:forKey:", v18, CFSTR("UIChildViewControllers"));

    }
  }
  v19 = (uint64_t)self->_viewControllerFlags;
  if (((-[UIViewController _isPresentationContextByDefault](self, "_isPresentationContextByDefault") ^ ((v19 & 0x40000) == 0)) & 1) == 0)
    objc_msgSend(v38, "encodeBool:forKey:", (*(_QWORD *)&self->_viewControllerFlags >> 18) & 1, CFSTR("UIDefinesPresentationContext"));
  v20 = (uint64_t)self->_viewControllerFlags;
  if ((v20 & 0x80000) != 0)
  {
    objc_msgSend(v38, "encodeBool:forKey:", 1, CFSTR("UIProvidesPresentationContextTransitionStyle"));
    v20 = (uint64_t)self->_viewControllerFlags;
  }
  if ((v20 & 0xC00000000000) != 0)
    objc_msgSend(v38, "encodeBool:forKey:", -[UIViewController restoresFocusAfterTransition](self, "restoresFocusAfterTransition"), CFSTR("UIRestoresFocusAfterTransition"));
  modalTransitionStyle = self->_modalTransitionStyle;
  if (modalTransitionStyle != _UIViewControllerDefaultModalTransitionStyle(self))
    objc_msgSend(v38, "encodeInteger:forKey:", self->_modalTransitionStyle, CFSTR("UIModalTransitionStyle"));
  modalPresentationStyle = self->_modalPresentationStyle;
  v23 = dyld_program_sdk_at_least();
  v24 = -2;
  if (!v23)
    v24 = 0;
  if (modalPresentationStyle != v24)
    objc_msgSend(v38, "encodeInteger:forKey:", self->_modalPresentationStyle, CFSTR("UIModalPresentationStyle"));
  if ((*(_QWORD *)&self->_viewControllerFlags & 0x20) != 0)
    objc_msgSend(v38, "encodeBool:forKey:", 1, CFSTR("UIHidesBottomBarWhenPushed"));
  if (self->_contentSizeForViewInPopover.width != 320.0 || self->_contentSizeForViewInPopover.height != 1100.0)
    objc_msgSend(v38, "encodeCGSize:forKey:", CFSTR("UIContentSizeForViewInPopover"));
  if (self->_preferredContentSize.width != *MEMORY[0x1E0C9D820]
    || self->_preferredContentSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v38, "encodeCGSize:forKey:", CFSTR("UIPreferredContentSize"));
  }
  -[UIResponder restorationIdentifier](self, "restorationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[UIResponder restorationIdentifier](self, "restorationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "encodeObject:forKey:", v26, CFSTR("UIRestorationIdentifier"));

  }
  storyboardIdentifier = self->_storyboardIdentifier;
  if (storyboardIdentifier)
    objc_msgSend(v38, "encodeObject:forKey:", storyboardIdentifier, CFSTR("UIStoryboardIdentifier"));
  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  if (interfaceBuilderKeyCommands)
    objc_msgSend(v38, "encodeObject:forKey:", interfaceBuilderKeyCommands, CFSTR("UIKeyCommands"));
  addedKeyCommands = self->_addedKeyCommands;
  if (addedKeyCommands)
    objc_msgSend(v38, "encodeObject:forKey:", addedKeyCommands, CFSTR("UIAddedKeyCommands"));
  edgesForExtendedLayout = self->_edgesForExtendedLayout;
  if (edgesForExtendedLayout != 15)
    objc_msgSend(v38, "encodeInteger:forKey:", edgesForExtendedLayout, CFSTR("UIKeyEdgesForExtendedLayout"));
  p_viewControllerFlags = &self->_viewControllerFlags;
  v32 = (uint64_t)self->_viewControllerFlags;
  if ((v32 & 0x2000000000) != 0)
  {
    objc_msgSend(v38, "encodeInteger:forKey:", 1, CFSTR("UIKeyExtendedLayoutIncludesOpaqueBars"));
    v32 = *(_QWORD *)p_viewControllerFlags;
    if ((*(_QWORD *)p_viewControllerFlags & 0x4000000000) == 0)
    {
LABEL_64:
      if ((v32 & 0x8000000000000) != 0)
        goto LABEL_66;
      goto LABEL_65;
    }
  }
  else if ((v32 & 0x4000000000) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(v38, "encodeInteger:forKey:", 1, CFSTR("UIKeyAutomaticallyAdjustsScrollViewInsets"));
  if ((*(_QWORD *)&self->_viewControllerFlags & 0x8000000000000) == 0)
LABEL_65:
    objc_msgSend(v38, "encodeBool:forKey:", 0, CFSTR("UIViewControllerViewRespectsSystemMinimumLayoutMargins"));
LABEL_66:
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    topLayoutGuide = self->_topLayoutGuide;
    if (topLayoutGuide)
      objc_msgSend(v38, "encodeObject:forKey:", topLayoutGuide, CFSTR("UIViewControllerTopLayoutGuide"));
    bottomLayoutGuide = self->_bottomLayoutGuide;
    if (bottomLayoutGuide)
      objc_msgSend(v38, "encodeObject:forKey:", bottomLayoutGuide, CFSTR("UIViewControllerBottomLayoutGuide"));
  }
  observableScrollViews = self->_observableScrollViews;
  if (observableScrollViews)
    objc_msgSend(v38, "encodeObject:forKey:", observableScrollViews, CFSTR("UIViewControllerObservableScrollViews"));
  interactionActivityTrackingBaseName = self->_interactionActivityTrackingBaseName;
  v37 = v38;
  if (interactionActivityTrackingBaseName)
  {
    objc_msgSend(v38, "encodeObject:forKey:", interactionActivityTrackingBaseName, CFSTR("UIViewControllerInteractionActivityTrackingBaseName"));
    v37 = v38;
  }

}

- (void)_setTraitStorageList:(id)a3
{
  objc_super v3;

  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xDFFFFFFFFFFFFFFFLL | ((unint64_t)(a3 != 0) << 61);
  v3.receiver = self;
  v3.super_class = (Class)UIViewController;
  -[NSObject _setTraitStorageList:](&v3, sel__setTraitStorageList_);
}

- (void)_unsafeParentWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIViewController _parentTraitEnvironment](self, "_parentTraitEnvironment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _parent:willTransitionToTraitCollection:withTransitionCoordinator:](self, "_parent:willTransitionToTraitCollection:withTransitionCoordinator:", v8, v7, v6);

}

void __78__UIViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v4, "_setNeedsUserInterfaceAppearanceUpdate");
    objc_msgSend(v4, "setNeedsWhitePointAdaptivityStyleUpdate");
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v5 = *(unsigned __int8 *)(a1 + 57);
    if (v5 != objc_msgSend(*(id *)(a1 + 40), "isStatusBarHidden"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_existingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(*(id *)(a1 + 48), "_visibleWindows", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_BYTE **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (v13 != v7)
            {
              if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "_canAffectStatusBarAppearance"))
              {
                if ((v13[587] & 0x40) != 0 && (objc_msgSend(v13, "_isHostedInAnotherProcess") & 1) == 0)
                {
                  objc_msgSend(v13, "rootViewController");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "_existingView");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v15)
                  {
                    objc_msgSend(v13, "rootViewController");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "_existingView");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "_setViewDelegateContentOverlayInsetsAreClean:", 0);

                    objc_msgSend(v13, "rootViewController");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "presentedViewController");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "_existingView");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "_setViewDelegateContentOverlayInsetsAreClean:", 0);

                  }
                }
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v10);
      }

    }
  }

}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return -[UIViewController _traitTrace:](self, "_traitTrace:", 0);
}

- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_frozenTraitCollection)
  {
    v4[2](v4);
    v4 = v5;
  }
  if (self->_lastNotifiedTraitCollection)
  {
    v4[2](v5);
    v4 = v5;
  }

}

uint64_t __105__UIViewController__invalidateStatusBarAppearanceIfNeededForChangeFromTraitCollection_toTraitCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)_invalidateViewConstraints
{
  -[UIView _setNeedsUpdateConstraints](self->_view, "_setNeedsUpdateConstraints");
}

- (void)_invalidateViewLayout
{
  -[UIView setNeedsLayout](self->_view, "setNeedsLayout");
}

- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:
{
  _UITraitChangeRegistry *v8;
  void *v9;

  if (a1)
  {
    if (!a1[52])
    {
      if (_UITraitTokenSetCount(a2))
      {
        v8 = objc_alloc_init(_UITraitChangeRegistry);
        v9 = (void *)a1[52];
        a1[52] = (uint64_t)v8;

      }
    }
    -[_UITraitChangeRegistry recordTraitUsage:forTraitEnvironment:insideMethod:withInvalidationAction:](a1[52], a2, a1, a3, a4);
  }
}

- (void)unregisterForTraitChanges:(id)a3
{
  -[_UITraitChangeRegistry unregisterForTraitChanges:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4;
  _UITraitChangeRegistry *traitChangeRegistry;
  _UITraitChangeRegistry *v6;
  _UITraitChangeRegistry *v7;
  id v8;

  v4 = a3;
  traitChangeRegistry = self->_traitChangeRegistry;
  v8 = v4;
  if (!traitChangeRegistry)
  {
    v6 = objc_alloc_init(_UITraitChangeRegistry);
    v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v6;

    v4 = v8;
    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);

}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  -[_UITraitChangeRegistry unregisterAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)self->_traitChangeRegistry, a3);
}

- (void)setOverrideTraitCollection:(id)a3
{
  id v4;
  _UITraitOverrides *traitOverrides;
  _UITraitOverrides *v6;
  _UITraitOverrides *v7;
  void *v8;

  v4 = a3;
  traitOverrides = self->_traitOverrides;
  v8 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
    goto LABEL_5;
  }
  if (traitOverrides)
  {
LABEL_5:
    -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)traitOverrides, v8);
    v4 = v8;
  }

}

- (UITraitCollection)overrideTraitCollection
{
  return (UITraitCollection *)-[UIBarButtonItemGroup _items]((id *)&self->_traitOverrides->super.isa);
}

uint64_t __50__UIViewController_setOverrideUserInterfaceStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOverrideUserInterfaceStyle:", *(_QWORD *)(a1 + 40));
}

- (void)_setOverrideHorizontalSizeClass:(int64_t)a3
{
  int64_t v5;
  void *v7;

  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 4393, CFSTR("Attempt to set invalid UIUserInterfaceSizeClass value to overrideHorizontalSizeClass: %ld"), a3);

  }
  v5 = -[UIViewController _overrideHorizontalSizeClass](self, "_overrideHorizontalSizeClass");
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4) & 0xFFFC | a3 & 3;
  if (-[UIViewController _overrideHorizontalSizeClass](self, "_overrideHorizontalSizeClass") != v5)
    -[UIViewController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
}

- (UIViewController)childViewControllerForUserInterfaceStyle
{
  return 0;
}

- (id)_effectiveUserInterfaceStyleViewController
{
  void *v3;
  UIViewController *v4;

  -[UIViewController _presentedUserInterfaceStyleViewController](self, "_presentedUserInterfaceStyleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveUserInterfaceStyleViewController");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(0, "_effectiveUserInterfaceStyleViewController");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = self;
  }
  return v4;
}

- (void)forceUnloadView
{
  -[UIViewController unloadViewForced:](self, "unloadViewForced:", 1);
}

- (void)unloadViewIfReloadable
{
  -[UIViewController unloadViewForced:](self, "unloadViewForced:", 0);
}

- (void)unloadViewForced:(BOOL)a3
{
  _BOOL4 v3;
  UIResponder *modalPreservedFirstResponder;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (-[UIViewController isViewLoaded](self, "isViewLoaded")
    && (-[UIViewController _canReloadView](self, "_canReloadView") || v3))
  {
    -[UIViewController viewWillUnload](self, "viewWillUnload");
    -[UIViewController setView:](self, "setView:", 0);
    modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
    self->_modalPreservedFirstResponder = 0;

    if ((*(_QWORD *)&self->_viewControllerFlags & 0x2000) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_searchDisplayController);
      v7 = objc_msgSend(WeakRetained, "hidNavigationBar");

      -[UIViewController setSearchBarHidNavBar:](self, "setSearchBarHidNavBar:", v7);
      -[UIViewController setSearchDisplayController:](self, "setSearchDisplayController:", 0);
    }
    -[UIViewController viewDidUnload](self, "viewDidUnload");
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      v8 = objc_opt_class();
      NSLog(CFSTR("%@ implementation of -viewDidUnload caused the view to be reloaded. This will adversely impact system performance."), v8);
    }
  }
}

void __38__UIViewController_loadViewIfRequired__block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_4___s_category;
  if (!_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_4___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_4___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior (%@)", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_shouldAttemptToPreserveInputViewsForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (v4 && -[UIResponder _containsResponder:](self, "_containsResponder:", v4))
  {
    objc_msgSend(v4, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardMotionSupport supportForScreen:](UIScrollToDismissSupport, "supportForScreen:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = !v7 || (objc_msgSend(v7, "isFinishingDismissTransition") & 1) == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isTVSearchControllerContainer
{
  return 0;
}

- (void)_recordContentScrollView
{
  void *v3;
  id v4;
  id obj;

  -[UIViewController _clearRecordedContentScrollView](self, "_clearRecordedContentScrollView");
  -[UIViewController _contentOrObservableScrollViewForEdge:](self, "_contentOrObservableScrollViewForEdge:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    obj = v3;
    -[UIViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v3 = obj;
    if (obj != v4)
    {
      objc_storeStrong((id *)&self->_recordedContentScrollView, obj);
      v3 = obj;
    }
  }

}

- (void)_clearRecordedContentScrollView
{
  UIScrollView *recordedContentScrollView;

  recordedContentScrollView = self->_recordedContentScrollView;
  self->_recordedContentScrollView = 0;

}

- (BOOL)_isSearchController
{
  return 0;
}

- (void)_setExistingNavigationItem:(id)a3
{
  UINavigationItem *v5;
  UINavigationItem *v6;

  v5 = (UINavigationItem *)a3;
  if (self->_navigationItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_navigationItem, a3);
    v5 = v6;
  }

}

- (void)_setExistingTabBarItem:(id)a3
{
  UITabBarItem *v5;
  UITabBarItem *v6;

  v5 = (UITabBarItem *)a3;
  if (self->_tabBarItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tabBarItem, a3);
    v5 = v6;
  }

}

- (void)window:(id)a3 willAnimateFromContentFrame:(CGRect)a4 toContentFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  -[UIViewController _visibleView](self, "_visibleView", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17.origin.x = v12;
  v17.origin.y = v11;
  v17.size.width = v10;
  v17.size.height = v9;
  if (CGRectEqualToRect(v16, v17))
    objc_msgSend(v15, "setFrame:", x, y, width, height);
  -[UIViewController viewControllerForRotation](self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_updateLayoutForStatusBarAndInterfaceOrientation");

}

- (void)_sceneSettingsSafeAreaInsetsDidChangeForWindow:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[UIViewController _viewControllerForRotation](self, "_viewControllerForRotation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](v3);
      _nextWindowSizedViewController(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "_existingView");
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = v8;
      v5 = (void *)v6;
      v3 = v8;
    }
    while (v6);
  }
  else
  {
    v7 = v3;
  }

}

- (void)_recursiveUpdateContentOverlayInsetsFromParentIfNecessary
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "_updateContentOverlayInsetsFromParentIfNecessary");
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(a1, "mutableChildViewControllers", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](*(_QWORD *)(*((_QWORD *)&v7 + 1)
                                                                                                  + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)_setFreezeLayoutForOrientationChangeOnDismissal:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[UIViewController _allowsFreezeLayoutForOrientationChangeOnDismissal](self, "_allowsFreezeLayoutForOrientationChangeOnDismissal"))
  {
    v5 = 0x4000000000000;
    if (!v3)
      v5 = 0;
    *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFBFFFFFFFFFFFFLL | v5;
  }
}

- (void)setAutoresizesArchivedViewToFullSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
  NSString *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = identifier;
  v7 = sender;
  v20 = v6;
  if (!self)
  {

    goto LABEL_15;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIViewController storyboardSegueTemplates](self, "storyboardSegueTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v20);

        if (v14)
        {
          v9 = v12;
          goto LABEL_12;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  if (!v9)
  {
LABEL_15:
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Receiver (%@) has no segue with identifier '%@'"), self, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  v15 = (id)objc_msgSend(v9, "_perform:", v7);

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
  return 1;
}

+ (BOOL)_shouldUseLegacyUnwindDestinationSearch
{
  void *v5;

  if (qword_1EDDB0FE0 != -1)
    dispatch_once(&qword_1EDDB0FE0, &__block_literal_global_431);
  if (!dyld_program_sdk_at_least())
    return 1;
  if ((id)qword_1EDDB0FD0 == a1 || qword_1EDDB0FD8 == (_QWORD)a1)
    return 0;
  v5 = (void *)objc_msgSend(a1, "superclass");
  if (!objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", qword_1EDDB0FC0, v5)
    || objc_msgSend(a1, "doesOverrideViewControllerMethod:inBaseClass:", qword_1EDDB0FC8, v5))
  {
    return objc_msgSend(v5, "_shouldUseLegacyUnwindDestinationSearch");
  }
  else
  {
    return 1;
  }
}

uint64_t __59__UIViewController__shouldUseLegacyUnwindDestinationSearch__block_invoke()
{
  uint64_t result;

  qword_1EDDB0FC0 = (uint64_t)sel_viewControllerForUnwindSegueAction_fromViewController_withSender_;
  qword_1EDDB0FC8 = (uint64_t)sel_allowedChildViewControllersForUnwindingFromSource_;
  qword_1EDDB0FD0 = objc_opt_class();
  result = objc_opt_class();
  qword_1EDDB0FD8 = result;
  return result;
}

- (id)_destinationForUnwindingFromSource:(id)a3 visitedViewControllers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIViewController *v11;
  int has_internal_diagnostics;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  UIViewController *v24;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  UIViewController *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseLegacyUnwindDestinationSearch"))
  {
    v8 = objc_msgSend(v6, "unwindAction");
    objc_msgSend(v6, "sourceViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController viewControllerForUnwindSegueAction:fromViewController:withSender:](self, "viewControllerForUnwindSegueAction:fromViewController:withSender:", v8, v9, v10);
    v11 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v13 = objc_msgSend(v7, "containsObject:", self);
    if (has_internal_diagnostics)
    {
      if (v13)
      {
        __UIFaultDebugAssertLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = self;
          _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Should not have recursed into %@ since it was already visited", buf, 0xCu);
        }

      }
    }
    else if (v13)
    {
      v27 = _destinationForUnwindingFromSource_visitedViewControllers____s_category;
      if (!_destinationForUnwindingFromSource_visitedViewControllers____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&_destinationForUnwindingFromSource_visitedViewControllers____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Should not have recursed into %@ since it was already visited", buf, 0xCu);
      }
    }
    objc_msgSend(v7, "addObject:", self);
    -[UIViewController childModalViewController](self, "childModalViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(v7, "containsObject:", v14) & 1) != 0
      || (objc_msgSend(v14, "_destinationForUnwindingFromSource:visitedViewControllers:", v6, v7),
          (v11 = (UIViewController *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[UIViewController allowedChildViewControllersForUnwindingFromSource:](self, "allowedChildViewControllersForUnwindingFromSource:", v6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            if ((objc_msgSend(v7, "containsObject:", v20) & 1) == 0)
            {
              objc_msgSend(v20, "_destinationForUnwindingFromSource:visitedViewControllers:", v6, v7);
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v11 = (UIViewController *)v21;
                goto LABEL_22;
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v17)
            continue;
          break;
        }
      }

      v22 = objc_msgSend(v6, "unwindAction");
      objc_msgSend(v6, "sourceViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sender");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIViewController _canPerformUnwindSegueAction:fromViewController:sender:](self, "_canPerformUnwindSegueAction:fromViewController:sender:", v22, v15, v23))
      {
        v24 = self;
      }
      else
      {
        v24 = 0;
      }
      v11 = v24;

LABEL_22:
    }

  }
  return v11;
}

- (NSArray)allowedChildViewControllersForUnwindingFromSource:(UIStoryboardUnwindSegueSource *)source
{
  UIStoryboardUnwindSegueSource *v4;
  void *v5;
  void *v6;
  NSMutableArray *childViewControllers;
  id v8;
  id v9;
  void *v10;
  NSArray *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = source;
  v5 = (void *)objc_opt_new();
  -[UIViewController childViewControllerContainingSegueSource:](self, "childViewControllerContainingSegueSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  childViewControllers = self->_childViewControllers;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__UIViewController_allowedChildViewControllersForUnwindingFromSource___block_invoke;
  v13[3] = &unk_1E16C0CA0;
  v14 = v6;
  v8 = v5;
  v15 = v8;
  v9 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](childViewControllers, "enumerateObjectsUsingBlock:", v13);
  v10 = v15;
  v11 = (NSArray *)v8;

  return v11;
}

uint64_t __70__UIViewController_allowedChildViewControllersForUnwindingFromSource___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    return objc_msgSend(*(id *)(result + 40), "addObject:", a2);
  return result;
}

- (UIViewController)childViewControllerContainingSegueSource:(UIStoryboardUnwindSegueSource *)source
{
  return (UIViewController *)-[UIStoryboardUnwindSegueSource _childContainingUnwindSourceForViewController:](source, "_childContainingUnwindSourceForViewController:", self);
}

- (UIViewController)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender
{
  UIViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UIViewController *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = fromViewController;
  v9 = sender;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "_canPerformUnwindSegueAction:fromViewController:sender:", action, v8, v9) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v15;

    if (v16)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  if (-[UIViewController _canPerformUnwindSegueAction:fromViewController:sender:](self, "_canPerformUnwindSegueAction:fromViewController:sender:", action, v8, v9))
  {
    v16 = self;
  }
  else
  {
    v16 = 0;
  }
LABEL_14:

  return v16;
}

- (BOOL)_canPerformUnwindSegueAction:(SEL)a3 fromViewController:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;

  v8 = a5;
  v9 = a4;
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_canPerformUnwindSegueAction_fromViewController_sender_))v10 = -[UIViewController canPerformUnwindSegueAction:fromViewController:sender:](self, "canPerformUnwindSegueAction:fromViewController:sender:", a3, v9, v8);
  else
    v10 = -[UIViewController canPerformUnwindSegueAction:fromViewController:withSender:](self, "canPerformUnwindSegueAction:fromViewController:withSender:", a3, v9, v8);
  v11 = v10;

  return v11;
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController sender:(id)sender
{
  char v5;

  if (fromViewController == self)
    v5 = 0;
  else
    v5 = objc_opt_respondsToSelector();
  return v5 & 1;
}

- (UIStoryboardSegue)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
  NSString *v8;
  UIViewController *v9;
  UIViewController *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  UIViewController *v17;

  v8 = identifier;
  v9 = fromViewController;
  v10 = toViewController;
  _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v9, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__UIViewController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke;
  v15[3] = &unk_1E16B1B50;
  v16 = v11;
  v17 = self;
  v12 = v11;
  +[UIStoryboardSegue segueWithIdentifier:source:destination:performHandler:](UIStoryboardSegue, "segueWithIdentifier:source:destination:performHandler:", v8, v9, v10, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIStoryboardSegue *)v13;
}

void __84__UIViewController_segueForUnwindingToViewController_fromViewController_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "_popoverController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissPopoverAnimated:", 1);

  }
  objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)__setParentViewController:(_QWORD *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1 && (id)a1[13] != v3)
  {
    a1[13] = v3;
    v8 = v3;
    v4 = v3;
    if (_UIViewControllersInheritTraitsFromViewHierarchy())
    {
      if (v4
        && (objc_msgSend(v4, "overrideTraitCollectionForChildViewController:", a1),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v6 = v5;
        -[UIViewController _applyCompatibilityTraitOverridesForOverrideTraitCollection:](a1, v5);
      }
      else
      {
        -[UIViewController _compatibilityTraitOverridesFromParentViewControllerCreateIfNecessary:](a1, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          +[UITraitCollection _emptyTraitCollection]();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v6, v7);

        }
      }

    }
    v3 = v8;
  }

}

void __44__UIViewController_setParentViewController___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    v2 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_5___s_category;
    if (!_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_5___s_category)
    {
      v2 = __UILogCategoryGetNode("ViewController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_5___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Deprecated -setParentViewController: SPI called on UIViewController, which is dangerous and causes undefined behavior. This setter does not properly establish the bidirectional parent-child relationship; use the -addChildVie"
        "wController: and -removeFromParentViewController APIs to manage view controller containment. Make a symbolic bre"
        "akpoint at -[UIViewController setParentViewController:] to catch this in the debugger. Child: %@; Parent: %@",
        (uint8_t *)&v6,
        0x16u);
    }
  }
}

void __44__UIViewController_setParentViewController___block_invoke_450(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if (*(_QWORD *)(v9 + 104) == a2)
        {
          if (os_variant_has_internal_diagnostics())
          {
            if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              {
                v14 = (objc_class *)objc_opt_class();
                NSStringFromClass(v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v23 = v17;
                v24 = 2048;
                v25 = a2;
                v26 = 2112;
                v27 = v9;
                _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Parent view controller <%@: %p> is deallocating with one or more children still referencing it, due to use of deprecated -[UIViewController setParentViewController:] SPI in client code. Please stop calling this deprecated SPI. Child with stale reference: %@", buf, 0x20u);

              }
            }
            else
            {
              v10 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_6___s_category;
              if (!_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_6___s_category)
              {
                v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v10, (unint64_t *)&_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_6___s_category);
              }
              v11 = *(NSObject **)(v10 + 8);
              if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                goto LABEL_8;
              v12 = v11;
              v13 = (objc_class *)objc_opt_class();
              NSStringFromClass(v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v23 = v16;
              v24 = 2048;
              v25 = a2;
              v26 = 2112;
              v27 = v9;
              _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Parent view controller <%@: %p> is deallocating with one or more children still referencing it, due to use of deprecated -[UIViewController setParentViewController:] SPI in client code. Please stop calling this deprecated SPI. Child with stale reference: %@", buf, 0x20u);

            }
          }
LABEL_8:
          *(_QWORD *)(v9 + 104) = 0;
        }
        ++v8;
      }
      while (v6 != v8);
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      v6 = v15;
    }
    while (v15);
  }

}

- (void)setMutableChildViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_childViewControllers, a3);
}

- (BOOL)_transitionsChildViewControllers
{
  return 1;
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 0;
}

- (id)_viewsWithDisabledInteractionGivenTransitionContext:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_childViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "_existingView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_isInAWindow");

        if (v13)
        {
          objc_msgSend(v11, "_viewsWithDisabledInteractionGivenTransitionContext:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v8;
          v16 = v14;
          v17 = v16;
          if (v15)
          {
            objc_msgSend(v15, "addObjectsFromArray:", v16);
            v17 = v15;
          }
          v8 = v17;

        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = self->_childModalViewControllers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v23, "_existingView", (_QWORD)v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "_isInAWindow");

        if (v25)
        {
          objc_msgSend(v23, "_viewsWithDisabledInteractionGivenTransitionContext:", v4);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v8;
          v28 = v26;
          v29 = v28;
          if (v27)
          {
            objc_msgSend(v27, "addObjectsFromArray:", v28);
            v29 = v27;
          }
          v8 = v29;

        }
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v20);
  }

  return v8;
}

- (id)_modalPresenter:(void *)a1
{
  void *v2;
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = 0;
  if (a2 <= 14)
  {
    if (a2 != 3 && a2 != 6)
      goto LABEL_9;
LABEL_8:
    objc_msgSend(a1, "_popoverController", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2 == 0;
    goto LABEL_9;
  }
  if (a2 == 18)
    goto LABEL_8;
  if (a2 == 15)
    return a1;
LABEL_9:
  objc_msgSend(a1, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a2 > 0x12)
    goto LABEL_22;
  if (((1 << a2) & 0x10007) == 0)
  {
    if (((1 << a2) & 0x40048) == 0)
      goto LABEL_22;

    if (a2 != 16)
      goto LABEL_22;
  }
  v8 = v7;
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "_parentModalViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      do
      {
        v11 = (void *)v10;

        objc_msgSend(v11, "_parentModalViewController");
        v10 = objc_claimAutoreleasedReturnValue();
        v9 = v11;
      }
      while (v10);
    }
    else
    {
      v11 = v9;
    }
  }
  else
  {
    v11 = 0;
  }
  -[UIViewController _parentViewController]((id *)v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_22:
    v14 = v7;
    goto LABEL_23;
  }
  v13 = (void *)v12;
  -[UIViewController _modalPresenter:](v12, a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v14;
}

- (id)_previousRootViewController
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 16);
  return WeakRetained;
}

- (BOOL)_shouldOverlayTabBar
{
  void *v3;
  char v4;

  if (-[NSMutableArray count](self->_childViewControllers, "count") != 1)
    return 0;
  -[NSMutableArray firstObject](self->_childViewControllers, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldOverlayTabBar");

  return v4;
}

- (id)_hostingNavigationBar
{
  void *v3;
  void *v4;

  if (-[NSMutableArray count](self->_childViewControllers, "count") == 1)
  {
    -[NSMutableArray firstObject](self->_childViewControllers, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_hostingNavigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateTabBarLayout
{
  uint64_t v3;
  id v4;

  v3 = objc_opt_class();
  -[UIViewController _ancestorViewControllerOfClass:allowModalParent:]((uint64_t)self, v3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateTabBarLayout");

}

- (BOOL)_forwardRotationMethods
{
  if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_shouldAutomaticallyForwardRotationMethods))return -[UIViewController shouldAutomaticallyForwardRotationMethods](self, "shouldAutomaticallyForwardRotationMethods");
  else
    return -[UIViewController automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers](self, "automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers");
}

void __46__UIViewController__performAtViewIsAppearing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_addDescendantsToArray:(uint64_t)a3 visibleOnly:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (!(_DWORD)a3
        || (objc_msgSend(v6, "isHidden") & 1) == 0
        && (objc_msgSend(v7, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
      {
        objc_msgSend(v5, "addObject:", a1);
      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(a1, "mutableChildViewControllers", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v14, "_existingView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isDescendantOfView:", v7);

            if (v16)
              -[UIViewController _addDescendantsToArray:visibleOnly:](v14, v5, a3);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v11);
      }

    }
  }

}

+ (void)_withDisabledAppearanceTransitionsForVisibleDescendantsOf:(id)a3 perform:(id)a4
{
  objc_msgSend(a1, "_withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:", 1, a3, 1, a4);
}

+ (void)_withDisabledAppearanceTransitions:(BOOL)a3 forDescendantsOf:(id)a4 visibleOnly:(BOOL)a5 perform:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v8 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(_QWORD))a6;
  v11 = v10;
  if (!v8)
  {
    v13 = 0;
    if (!v10)
      goto LABEL_13;
    goto LABEL_12;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "addObject:", v9);
  -[UIViewController _addDescendantsToArray:visibleOnly:](v9, v12, v7);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17++), "setAppearanceTransitionsAreDisabled:", 1);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v15);
  }

  if (v11)
LABEL_12:
    v11[2](v11);
LABEL_13:
  if (v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "setAppearanceTransitionsAreDisabled:", 0, (_QWORD)v23);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

  }
}

- (BOOL)needsDidMoveCleanup
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 28) & 1;
}

- (void)_beginAppearanceTransitionToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  objc_msgSend(a3, "beginAppearanceTransition:animated:", 1);
  -[UIViewController beginAppearanceTransition:animated:](self, "beginAppearanceTransition:animated:", 0, v4);
}

- (void)_endAppearanceTransitionToViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[UIViewController endAppearanceTransition](self, "endAppearanceTransition");
  objc_msgSend(v4, "endAppearanceTransition");

}

- (uint64_t)_requiredNotificationsForRemoteServices
{
  void *v1;

  if (a1)
  {
    objc_msgSend(a1, "parentViewController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _requiredNotificationsForRemoteServices]();
    objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

uint64_t __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 320) == *(_QWORD *)(result + 40))
    return objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:");
  return result;
}

uint64_t __64__UIViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 320) == *(_QWORD *)(result + 40))
    return objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:");
  return result;
}

+ (void)removeViewControllerForView:(id)a3
{
  void *v3;
  id *v4;

  v4 = (id *)a3;
  -[UIView __viewDelegate](v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView __setViewDelegate:](v4, 0);

}

- (id)_description
{
  void *v3;
  void *v4;
  UIViewController *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGRect v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  if (self)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = self;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    NSStringFromCGRect(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" view:%@ frame:%@"), v10, v12);

  }
  else
  {
    objc_msgSend(v9, "appendString:", CFSTR(" (view not loaded)"));
  }
  if ((*(_QWORD *)&self->_viewControllerFlags & 0x100) != 0)
    objc_msgSend(v9, "appendString:", CFSTR(" ***Root***"));
  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  return v9;
}

- (void)_traverseViewControllerHierarchyFromLevel:(int64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, void *, uint64_t, int64_t);
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
  int64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t, int64_t))a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_childViewControllers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v6[2](v6, v12, 1, a3 + 1);
        objc_msgSend(v12, "_traverseViewControllerHierarchyFromLevel:withBlock:", a3 + 1, v6);
        v6[2](v6, v12, 0, a3 + 1);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_childModalViewControllers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    v17 = a3 + 1;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        v6[2](v6, v19, 1, v17);
        objc_msgSend(v19, "_traverseViewControllerHierarchyFromLevel:withBlock:", v17, v6, (_QWORD)v20);
        v6[2](v6, v19, 0, v17);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

}

+ (void)_traverseViewControllerHierarchyWithDelayedRelease:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)qword_1EDDB0F88, "setRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!v11 || !v11[13] && !v11[15])
        {
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "_isRootViewController") & 1) != 0
            || objc_msgSend(v11, "isViewLoaded"))
          {
            (*((void (**)(id, _QWORD *, uint64_t, _QWORD))v3 + 2))(v3, v11, 1, 0);
            objc_msgSend(v11, "_traverseViewControllerHierarchyFromLevel:withBlock:", 0, v3);
            (*((void (**)(id, _QWORD *, _QWORD, _QWORD))v3 + 2))(v3, v11, 0, 0);
          }
          else
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        (*((void (**)(id, void *, uint64_t, _QWORD))v3 + 2))(v3, v17, 1, 0);
        objc_msgSend(v17, "_traverseViewControllerHierarchyFromLevel:withBlock:", 0, v3, (_QWORD)v18);
        (*((void (**)(id, void *, _QWORD, _QWORD))v3 + 2))(v3, v17, 0, 0);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (id)_descriptionWithChildren:(int)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("    "));
      --v6;
    }
    while (v6);
  }
  -[UIViewController _description](self, "_description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__UIViewController__descriptionWithChildren___block_invoke;
  v10[3] = &unk_1E16C1F60;
  v8 = v5;
  v11 = v8;
  -[UIViewController _traverseViewControllerHierarchyFromLevel:withBlock:](self, "_traverseViewControllerHierarchyFromLevel:withBlock:", a3 + 1, v10);

  return v8;
}

void __45__UIViewController__descriptionWithChildren___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  if (a3)
  {
    v15 = v7;
    if (a4 < 1)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(v8, "appendString:", CFSTR("    "));
        --a4;
      }
      while (a4);
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      v7 = v15;
    }
    objc_msgSend(v7, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v15, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v9, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("Modally presented (presenter =%@) :\n"), v12);

        if (v8)
          objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      }
    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v15, "_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v14);

    v7 = v15;
  }

}

+ (id)_allDescriptions
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__UIViewController__allDescriptions__block_invoke;
  v6[3] = &unk_1E16C1F60;
  v4 = v3;
  v7 = v4;
  objc_msgSend(a1, "_traverseViewControllerHierarchy:", v6);

  return v4;
}

void __36__UIViewController__allDescriptions__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  if (a3)
  {
    v15 = v7;
    if (a4 < 1)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        objc_msgSend(v8, "appendString:", CFSTR("    "));
        --a4;
      }
      while (a4);
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      v7 = v15;
    }
    objc_msgSend(v7, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v15, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v9, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("Modally presented (presenter =%@) :\n"), v12);

        if (v8)
          objc_msgSend(*(id *)(a1 + 32), "appendString:", v8);
      }
    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v15, "_description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v14);

    v7 = v15;
  }

}

+ (id)_printHierarchy
{
  void *v2;
  void *v3;
  void *v4;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_printHierarchy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_safeAreaInsetsTrace
{
  void *v2;
  void *v3;
  void *v4;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_safeAreaInsetsTrace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_printHierarchy
{
  return recursiveDescription(self, 0);
}

- (id)_safeAreaInsetsTrace
{
  return recursiveDescription(self, 1);
}

uint64_t __63__UIViewController__loadHierarchyInputAccessoryViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  -[UIView __viewDelegate](v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5 || v5 == *(_QWORD *)(a1 + 32))
  {
    if (!objc_msgSend(v4, "_ownsInputAccessoryView"))
    {
      v7 = 1;
      goto LABEL_7;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_canReloadView
{
  BOOL v3;
  void *v4;

  if ((*(_QWORD *)&self->_viewControllerFlags & 0x80) != 0)
    return 0;
  if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_loadView) & 1) != 0)
    return 1;
  -[UIViewController nibName](self, "nibName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)applicationWantsViewsToDisappear
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id WeakRetained;
  int v7;

  if (self)
  {
    if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[UIViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
      v5 = 0;
    }
    if (self->_parentViewController)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
      v7 = objc_msgSend(WeakRetained, "isPopoverVisible");

    }
    else
    {
      v7 = 1;
    }
    if ((v5 & v7) == 1)
    {
      -[UIViewController __viewWillDisappear:]((uint64_t)self, 0);
      -[UIViewController __viewDidDisappear:]((uint64_t)self, 0);
    }
  }
}

+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4 ignoreInWindowCheck:(BOOL)a5
{
  id v7;
  id v8;
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
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  void *v30;
  BOOL v31;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "bounds");
  v12 = v11;
  v14 = v13;
  if (v8)
  {
    v15 = v9;
    v16 = v10;
    objc_msgSend(v7, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "convertRect:toView:", v8, v15, v16, v12, v14);
      objc_msgSend(v8, "convertRect:toWindow:", 0);
      v12 = v18;
      v14 = v19;
    }
  }
  objc_msgSend(v8, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinateSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinateSpace");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v23, "bounds");
  v26 = v25;
  v28 = v27;
  v29 = v14 == v27 && v12 == v25;
  if (v29 || a5)
  {
    if (v29)
    {
      v31 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(v7, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = 0;
      goto LABEL_19;
    }
  }
  v31 = v12 == v28 && v14 == v26;
LABEL_19:

  return v31;
}

- (BOOL)_shouldForceLayoutForHostedAnimation
{
  return 1;
}

- (void)_setShouldFreezeUnderlapsStatusBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

+ (BOOL)_isViewSizeFullScreen:(id)a3 inWindow:(id)a4
{
  return objc_msgSend(a1, "_isViewSizeFullScreen:inWindow:ignoreInWindowCheck:", a3, a4, 1);
}

- (BOOL)_shouldChildViewControllerUseFullScreenLayout:(id)a3
{
  int v4;
  _BOOL8 v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = objc_msgSend(a3, "wantsFullScreenLayout");
  LOBYTE(v5) = 0;
  if (self && v4)
  {
    v6 = self->_parentViewController;
    -[UIViewController _existingView](self, "_existingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isRotating"))
    {
      v5 = (*(_QWORD *)&self->_viewControllerFlags >> 11) & 1;
    }
    else
    {
      LODWORD(v5) = -[UIViewController _shouldUseFullScreenLayoutInWindow:parentViewController:](self, "_shouldUseFullScreenLayoutInWindow:parentViewController:", v8, v6);
      v9 = 2048;
      if (!v5)
        v9 = 0;
      *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v9;
    }

  }
  return v5;
}

- (BOOL)_shouldUseFullScreenLayoutInWindow:(id)a3 parentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!-[UIViewController wantsFullScreenLayout](self, "wantsFullScreenLayout")
    || v6
    && (objc_msgSend(v6, "_windowHostingScene"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal"),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else if (v7)
  {
    v10 = objc_msgSend(v7, "_shouldChildViewControllerUseFullScreenLayout:", self);
  }
  else
  {
    -[UIViewController _existingView](self, "_existingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v10 = objc_msgSend((id)objc_opt_class(), "_isViewSizeFullScreen:inWindow:", v11, v6);
    else
      v10 = 1;

  }
  return v10;
}

- (BOOL)_reallyWantsFullScreenLayout
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 10) & 1;
}

- (void)setWantsFullScreenLayout:(BOOL)wantsFullScreenLayout
{
  uint64_t viewControllerFlags;
  uint64_t v5;
  void *v6;
  UIViewController *v7;
  char v8;
  _QWORD *v9;

  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if (((((viewControllerFlags & 0x400) == 0) ^ wantsFullScreenLayout) & 1) == 0)
  {
    v5 = 1024;
    if (!wantsFullScreenLayout)
      v5 = 0;
    *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
    *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFFFFFBFFLL | v5;
    -[UIViewController _existingView](self, "_existingView");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v7 == self && (v9[13] & 0x400000000000000) != 0)
    {
      v8 = objc_msgSend(v9, "translatesAutoresizingMaskIntoConstraints");

      if ((v8 & 1) == 0)
        objc_msgSend(v6, "_setNeedsUpdateConstraints");
    }
    else
    {

    }
  }
}

- (BOOL)_viewControllerIgnoresClippedGlyphPathFrame
{
  return -[UIViewController isBeingDismissed](self, "isBeingDismissed")
      || -[UIViewController isBeingPresented](self, "isBeingPresented");
}

- (void)setShouldForceNonAnimatedTransition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (_DWORD)_appearingOrAppearedChildModalViewController
{
  id v1;
  _DWORD *v2;
  uint64_t v3;
  void *i;
  _DWORD *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(a1 + 112);
  v2 = (_DWORD *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(_DWORD **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (v5 && ((v5[92] >> 1) & 3u) - 1 < 2)
        {
          v2 = v5;
          goto LABEL_13;
        }
      }
      v2 = (_DWORD *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_13:

  return v2;
}

- (void)_addChildModalViewController:(id *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (a1[14])
    {
LABEL_12:
      objc_msgSend(a1, "_window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "__willChangeToIdiom:onScreen:", objc_msgSend(v11, "_userInterfaceIdiom"), v11);
      objc_msgSend(a1[14], "addObject:", v3);
      objc_msgSend(v3, "setParentModalViewController:", a1);
      objc_msgSend(a1, "_didChangeDeepestActionResponder");

      goto LABEL_13;
    }
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIViewController _addChildModalViewController:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInFunction:file:lineNumber:description:](v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UIViewController.m"), 8121, CFSTR("UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@"), a1);

    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v6 = _addChildModalViewController____s_category;
        if (!_addChildModalViewController____s_category)
        {
          v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v6, (unint64_t *)&_addChildModalViewController____s_category);
        }
        v7 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = a1;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@ Ensure you're calling a designated initializer of UIViewController. This will become an assert in a future version.", buf, 0xCu);
        }
        goto LABEL_11;
      }
      __UIFaultDebugAssertLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = a1;
        _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "UIViewController was not initialized before use. This is a serious bug, likely caused by accessing properties or methods on the view controller before calling a UIViewController initializer. View controller: %@ Ensure you're calling a designated initializer of UIViewController. This will become an assert in a future version.", buf, 0xCu);
      }
    }

LABEL_11:
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = a1[14];
    a1[14] = v8;

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_removeChildModalViewController:(id *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    v4 = objc_msgSend(a1[14], "indexOfObjectIdenticalTo:", v3);
    v3 = v6;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      objc_msgSend(v6, "setParentModalViewController:", 0);
      objc_msgSend(a1[14], "removeObjectAtIndex:", v5);
      objc_msgSend(a1, "_didChangeDeepestActionResponder");
      v3 = v6;
    }
  }

}

- (void)_prepareForWindowDealloc
{
  UIPresentationController *presentationController;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UIPresentationController _prepareForWindowDeallocRecursively:](self->_presentationController, "_prepareForWindowDeallocRecursively:", 1);
  presentationController = self->_presentationController;
  self->_presentationController = 0;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_childModalViewControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setParentModalViewController:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_childModalViewControllers, "removeAllObjects");
}

- (BOOL)isSheet
{
  return 0;
}

- (void)_setModalPresentationStyle:(int64_t)a3
{
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    self->_modalPresentationStyle = a3;
}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 0;
}

- (void)_setPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_popoverController, a3);
}

- (BOOL)_isDimmingBackground
{
  return (objc_msgSend(self->_dimmingView, "displayed") & 1) != 0
      || -[UIViewController _isDimmingBackground](self->_parentViewController, "_isDimmingBackground");
}

- (BOOL)_useCustomDimmingView
{
  return 0;
}

- (void)_keyboardWillShow:(id)a3
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
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double y;
  double v25;
  double v26;
  float64x2_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  double v43;
  double v44;
  CGFloat MidX;
  float64x2_t v46;
  double v47;
  _QWORD v48[4];
  id v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  -[UIViewController _visibleView](self, "_visibleView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v44 = v11;
  v13 = v12;

  -[UIViewController _keyboardSceneDelegate](self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleFrameInView:", 0);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = 0.0;
  if (-[UIViewController interfaceOrientation](self, "interfaceOrientation") != UIInterfaceOrientationPortrait)
  {
    if (-[UIViewController interfaceOrientation](self, "interfaceOrientation") == UIInterfaceOrientationLandscapeLeft)
    {
      v23 = -1.57079637;
    }
    else if (-[UIViewController interfaceOrientation](self, "interfaceOrientation") == UIInterfaceOrientationLandscapeRight)
    {
      v23 = 1.57079637;
    }
    else if (-[UIViewController interfaceOrientation](self, "interfaceOrientation") == UIInterfaceOrientationPortraitUpsideDown)
    {
      v23 = 3.14159274;
    }
    else
    {
      v23 = 0.0;
    }
  }
  +[UIScreen transformToRotateScreen:](UIScreen, "transformToRotateScreen:", v23);
  v55.origin.x = v16;
  v55.origin.y = v18;
  v55.size.width = v20;
  v55.size.height = v22;
  v56 = CGRectApplyAffineTransform(v55, &v54);
  y = v56.origin.y;
  if (objc_msgSend(v5, "_isHostedInAnotherProcess", v56.origin.x))
  {
    objc_msgSend(v5, "bounds");
    v25 = v57.origin.y;
    MidX = CGRectGetMidX(v57);
    objc_msgSend(v4, "bounds");
    v27.f64[0] = MidX;
    v27.f64[1] = v25 + v26 * 0.5;
    v46 = v27;
  }
  else
  {
    v47 = v8 + v44 * 0.5;
    __UIStatusBarManagerForWindow(v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "defaultStatusBarHeightInOrientation:", 1);
    v30 = v29;

    objc_msgSend(v4, "bounds");
    v43 = v10 + v13 * 0.5 - v47 + v30 + CGRectGetHeight(v58) * 0.5;
    +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v23);
    v46 = vaddq_f64(v53, vaddq_f64(vmulq_n_f64(v51, v47), vmulq_n_f64(v52, v43)));
  }
  if ((unint64_t)(-[UIViewController interfaceOrientation](self, "interfaceOrientation") - 3) <= 1
    && ((objc_msgSend(v5, "_isHostedInAnotherProcess") & 1) != 0 || y < v44))
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isPerformingModalTransition");

    if (v32)
    {
      objc_msgSend(v4, "superview");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v35 = v34 * 0.5;
      -[UIViewController formSheetSize](self, "formSheetSize");
      v37 = v36 * 0.5;
      __UIStatusBarManagerForWindow(v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "defaultStatusBarHeightInOrientation:", 1);
      v40 = v39;

      objc_msgSend(v4, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPosition:", v35, v37 + v40);

    }
    else
    {
      if (objc_msgSend(v5, "isRotating"))
        v42 = 4;
      else
        v42 = 0;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __38__UIViewController__keyboardWillShow___block_invoke;
      v48[3] = &unk_1E16B4E70;
      v49 = v4;
      v50 = v46;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v42, v48, 0, 0.25, 0.0);
      v33 = v49;
    }

  }
}

void __38__UIViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "convertPoint:fromView:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");

}

- (void)_keyboardWillHide:(id)a3
{
  UIInterfaceOrientation v4;
  UIInterfaceOrientation v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
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
  double v24;
  double v25;
  UIInterfaceOrientation v26;
  double v27;
  UIInterfaceOrientation v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  id v38;
  double v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  uint64_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  CGRect v47;
  CGRect v48;

  v4 = -[UIViewController interfaceOrientation](self, "interfaceOrientation", a3);
  if ((unint64_t)(v4 - 3) <= 1)
  {
    v5 = v4;
    -[UIViewController _visibleView](self, "_visibleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isHostedInAnotherProcess"))
    {
      objc_msgSend(v7, "bounds");
      x = v47.origin.x;
      y = v47.origin.y;
      width = v47.size.width;
      height = v47.size.height;
      MidX = CGRectGetMidX(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MidY = CGRectGetMidY(v48);
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v39 = v16 + v20 * 0.5;
      __UIStatusBarManagerForWindow(v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "defaultStatusBarHeightInOrientation:", v5);
      v25 = v24;

      v26 = -[UIViewController interfaceOrientation](self, "interfaceOrientation");
      v27 = 0.0;
      if (v26 != UIInterfaceOrientationPortrait)
      {
        if (-[UIViewController interfaceOrientation](self, "interfaceOrientation", 0.0) == UIInterfaceOrientationLandscapeLeft)
        {
          v27 = -1.57079633;
        }
        else if (-[UIViewController interfaceOrientation](self, "interfaceOrientation") == UIInterfaceOrientationLandscapeRight)
        {
          v27 = 1.57079633;
        }
        else
        {
          v28 = -[UIViewController interfaceOrientation](self, "interfaceOrientation");
          v27 = 3.14159265;
          if (v28 != UIInterfaceOrientationPortraitUpsideDown)
            v27 = 0.0;
        }
      }
      +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v27);
      objc_msgSend(v7, "convertPoint:fromView:", 0, vaddq_f64(v46, vaddq_f64(vmulq_n_f64(v44, v39), vmulq_n_f64(v45, v18 + v22 * 0.5 + v25 * 0.5))));
      MidX = v29;
      MidY = v30;
    }
    objc_msgSend(v6, "superview");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "convertPoint:fromView:", 0, MidX, MidY);
    v33 = v32;
    v35 = v34;

    v36 = objc_msgSend(v7, "isRotating");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    if (v36)
      v37 = 4;
    else
      v37 = 0;
    v40[2] = __38__UIViewController__keyboardWillHide___block_invoke;
    v40[3] = &unk_1E16B4E70;
    v41 = v6;
    v42 = v33;
    v43 = v35;
    v38 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v37, v40, 0, 0.25, 0.0);

  }
}

uint64_t __38__UIViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_isInSheetPresentation
{
  UIViewController *parentModalViewController;

  if (!self->_parentModalViewController)
    goto LABEL_9;
  if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != 16
    && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") != UIModalPresentationFormSheet)
  {
    parentModalViewController = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle");
    if (parentModalViewController == (UIViewController *)1)
      return (char)parentModalViewController;
    if (self->_parentModalViewController
      && -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationCurrentContext)
    {
      parentModalViewController = self->_parentModalViewController;
      goto LABEL_10;
    }
LABEL_9:
    parentModalViewController = self->_parentViewController;
    if (!parentModalViewController)
      return (char)parentModalViewController;
LABEL_10:
    LOBYTE(parentModalViewController) = -[UIViewController _isInSheetPresentation](parentModalViewController, "_isInSheetPresentation");
    return (char)parentModalViewController;
  }
  LOBYTE(parentModalViewController) = 1;
  return (char)parentModalViewController;
}

- (BOOL)_isModalSheet
{
  return -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
      || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet
      || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPageSheet;
}

- (BOOL)_useSheetRotation
{
  return self->_dropShadowView
      || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
      || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationCustom;
}

- (void)_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__UIViewController__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter___block_invoke;
  v6[3] = &unk_1E16C1FF8;
  v7 = v4;
  v5 = v4;
  -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](self, 1, v6);

}

uint64_t __107__UIViewController__childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:", *(_QWORD *)(a1 + 32));
}

- (void)_cancelDelayedPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  id v18;
  id v19;
  id v20;

  v3 = a3;
  objc_getAssociatedObject(self, &unk_1EDDB0F73);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = v5;
    objc_msgSend(v5, "invocationTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v6, &unk_1EDDB0F72, 0, (void *)1);
    objc_setAssociatedObject(self, &unk_1EDDB0F73, 0, (void *)1);
    v7 = *((_QWORD *)v20 + 4) == 0;
    v8 = *((id *)v20 + 6);
    if (v8)
    {
      v9 = v8;
      dispatch_source_cancel(v8);

    }
    v10 = v20;
    if (!*((_BYTE *)v20 + 8))
    {
      objc_msgSend(v20, "delayingController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cancelling delayed presentation of <%s: %p>"), class_getName(v12), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "windowSceneIgnoringEvents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_endIgnoringInteractionEventsForReason:", v13);

      objc_msgSend(v20, "setWindowSceneIgnoringEvents:", 0);
      v10 = v20;
    }
    v15 = *((_QWORD *)v10 + 4);
    if (v15)
    {
      v16 = (*(uint64_t (**)(uint64_t, _BOOL8))(v15 + 16))(v15, v3);
      v10 = v20;
      v7 = v16;
    }
    if (!v7 || !v3)
    {
      v19 = 0;
    }
    else
    {
      v18 = *((id *)v10 + 3);
      v10 = v20;
      v19 = v18;
    }
    objc_msgSend(v10, "setPresentInvocation:", 0);
    objc_msgSend(v20, "setCancellationHandler:", 0);
    if (v19)
      objc_msgSend(v19, "invoke");

    v5 = v20;
  }

}

- (void)_beginDelayingPresentation
{
  -[UIViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return 0;
}

- (id)_customPresentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "_overrideTransitioningDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v8, "_overrideTransitioningDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("_UIAlertControllerTransitioningDelegate"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_4;
  }
  -[UIViewController _presentationControllerForPresentedController:presentingController:sourceController:](self, "_presentationControllerForPresentedController:presentingController:sourceController:", v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_4:
    -[UIViewController transitioningDelegate](self, "transitioningDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "presentationControllerForPresentedViewController:presentingViewController:sourceViewController:", v8, v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (id)_customInteractionControllerForPresentation:(void *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "_interactionController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "transitioningDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "interactionControllerForPresentation:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_customAnimatorForDismissedController:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v3, "preferredTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "_transitionControllerForViewController:inContainer:isAppearing:", v4, 0, 0),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "transitioningDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "animationControllerForDismissedController:", v4);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v7 = (void *)v9;
LABEL_11:

        goto LABEL_12;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v8, "animatorForDismissedController:", v4);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return v7;
}

- (id)_defaultAnimationController
{
  return -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", 0);
}

- (id)_customInteractionControllerForDismissal:(void *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "_interactionController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "transitioningDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "interactionControllerForDismissal:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __40__UIViewController__scheduleTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)UIApp, "_performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:block:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_transitionToViewController:(id)a3 whilePerforming:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
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
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD aBlock[4];
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD v110[4];
  id v111;

  v8 = a3;
  v9 = a4;
  v94 = a5;
  -[UIViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "snapshotViewAfterScreenUpdates:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v16;
  if (v16)
    objc_msgSend(v16, "presentedView");
  else
    -[UIViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = v12;
  objc_msgSend(v12, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addSubview:", v15);
  -[UIViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[UIViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:fromView:", v31, v23, v25, v27, v29);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v18, "setFrame:", v33, v35, v37, v39);
  objc_msgSend(v15, "addSubview:", v18);
  objc_msgSend(v20, "addSubview:", v18);
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v110[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke;
  v110[3] = &unk_1E16B1BF8;
  v93 = v9;
  v111 = v93;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v110);
  objc_msgSend(v8, "parentViewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = v41;
  if (v41)
  {
    v42 = v41;
  }
  else
  {
    objc_msgSend(v8, "view");
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = v42;
  objc_msgSend(v8, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  objc_msgSend(v8, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "convertRect:fromView:", v53, v46, v48, v50, v52);
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;

  objc_msgSend(v43, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v55, v57, v59, v61, 0.0, 0.0, 0.0, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v33, v35, v37, v39);
  objc_msgSend(v20, "addSubview:", v62);
  objc_msgSend(v8, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "frame");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  objc_msgSend(v8, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "superview");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:fromView:", v73, v65, v67, v69, v71);
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v81 = v80;

  v82 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_3;
  aBlock[3] = &unk_1E16BDF18;
  v83 = v18;
  v103 = v83;
  v106 = v75;
  v107 = v77;
  v108 = v79;
  v109 = v81;
  v84 = v62;
  v104 = v84;
  v85 = v15;
  v105 = v85;
  v86 = _Block_copy(aBlock);
  v97[0] = v82;
  v97[1] = 3221225472;
  v97[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_4;
  v97[3] = &unk_1E16C2090;
  v87 = v85;
  v98 = v87;
  v88 = v83;
  v99 = v88;
  v89 = v84;
  v100 = v89;
  v90 = v94;
  v101 = v90;
  v91 = _Block_copy(v97);
  if (_AXSReduceMotionEnabled())
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v86, v91, 0.2, 0.0);
  else
    +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v86, v91, 0.0, 60.0);

}

void __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_2;
  v1[3] = &unk_1E16B1BF8;
  v2 = *(id *)(a1 + 32);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v1);

}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __75__UIViewController__transitionToViewController_whilePerforming_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_transitionToNavigationViewController:(id)a3 withWrapper:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
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
  _UISimpleTransitioningDelegate *v27;
  void *v28;
  UIViewController *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  UIViewController *v42;
  UIViewController *v43;
  _UISimpleTransitioningDelegate *v44;
  void *v45;
  void *v46;
  void (**v47)(void);
  id obj;
  _QWORD v49[4];
  id v50;
  id v51;
  _UISimpleTransitioningDelegate *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = (void (**)(void))a4;
  v42 = self;
  -[UIViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_viewsParticipatingInNavigationControllerTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v60 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v64[0] = CFSTR("view");
        v64[1] = CFSTR("frame");
        v65[0] = v13;
        v14 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v6, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend(v13, "superview");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "convertRect:fromView:", v24, v17, v19, v21, v23);
        objc_msgSend(v14, "valueWithCGRect:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v26);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v10);
  }

  objc_msgSend(v46, "_animatorForContainmentTransition");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_UISimpleTransitioningDelegate initWithAnimator:]([_UISimpleTransitioningDelegate alloc], "initWithAnimator:", v45);
  -[_UISimpleTransitioningDelegate _setSuppressCrossFadeNavigationBarAnimation:](v27, "_setSuppressCrossFadeNavigationBarAnimation:", 1);
  objc_msgSend(v6, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v27);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke;
  v58[3] = &unk_1E16B1B28;
  v58[4] = v42;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v58);
  v44 = v27;
  if (v47)
  {
    v47[2]();
    v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = v42;
  }
  v43 = v29;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v55 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("view"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("frame"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "CGRectValue");
        objc_msgSend(v36, "setFrame:");

        objc_msgSend(v6, "view");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("view"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addSubview:", v39);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v32);
  }

  objc_msgSend(v6, "pushViewController:animated:", v43, 1);
  v40 = (id)objc_opt_self();
  objc_msgSend(v6, "transitionCoordinator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke_2;
    v49[3] = &unk_1E16C0CE8;
    v50 = v6;
    v51 = v28;
    v52 = v44;
    v53 = v30;
    objc_msgSend(v41, "animateAlongsideTransition:completion:", 0, v49);

  }
}

uint64_t __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

void __70__UIViewController__transitionToNavigationViewController_withWrapper___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_opt_self();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 56);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "objectForKeyedSubscript:", CFSTR("view"), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4
{
  return 1;
}

- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  UIViewController *v25;
  UIViewControllerAction *v26;
  UIViewControllerAction *currentAction;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  UIResponder *v37;
  UIResponder *modalPreservedFirstResponder;
  __objc2_class **v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  UIViewController *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  int v59;
  UIViewController *v60;
  id obj;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (!-[UIViewController _shouldPresentViewController:withPresentationController:](self, "_shouldPresentViewController:withPresentationController:", v15, v17))goto LABEL_40;
  v64 = v19;
  v22 = objc_opt_class();
  v63 = v18;
  if (v22 == objc_opt_class())
  {
    v23 = objc_msgSend(v18, "transition");
    v24 = (_DWORD)v23 != 0;
  }
  else
  {
    v23 = 0;
    v24 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = self;
  }
  else
  {
    -[UIViewController _splitViewControllerEnforcingClass:](self, "_splitViewControllerEnforcingClass:", 1);
    v25 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  v65 = v20;
  v60 = v25;
  -[UIViewController _descendantWillPresentViewController:modalSourceViewController:presentationController:animated:](v25, "_descendantWillPresentViewController:modalSourceViewController:presentationController:animated:", v15, v16, v17, v24);
  v26 = -[UIViewControllerAction initWithViewController:name:transition:]([UIViewControllerAction alloc], "initWithViewController:name:transition:", v15, CFSTR("PresentModal"), v23);
  currentAction = self->_currentAction;
  self->_currentAction = v26;

  -[UIViewController currentAction](self, "currentAction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  if (v28)
    objc_setProperty_nonatomic_copy(v28, v29, v21, 24);

  objc_msgSend(v15, "_setModalSourceViewController:", v16);
  -[UIViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dismissCurrentMenu");

  v33 = 16;
  if (v24)
    v33 = 4194320;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v33;
  -[UIViewController view](self, "view");
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v34, "firstResponder");
  obj = (id)objc_claimAutoreleasedReturnValue();

  -[UIViewController _addChildModalViewController:]((id *)&self->super.super.isa, v15);
  objc_msgSend(v15, "_presentingViewControllerWillChange:", self);
  objc_getClass("UIActivityViewController");
  LODWORD(v34) = objc_opt_isKindOfClass();
  objc_opt_class();
  v35 = v34 & (objc_opt_isKindOfClass() ^ 1);
  v18 = v63;
  v59 = v35;
  if ((objc_msgSend(v17, "_shouldPreserveFirstResponder") & 1) != 0 || (v35 & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstResponder");
    v37 = (UIResponder *)objc_claimAutoreleasedReturnValue();
    modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
    self->_modalPreservedFirstResponder = v37;

    v19 = v64;
    if (!self->_modalPreservedFirstResponder)
      objc_storeStrong((id *)&self->_modalPreservedFirstResponder, obj);
  }
  else
  {
    v19 = v64;
  }
  v20 = v65;
  v39 = off_1E167B000;
  if (self->_modalPreservedFirstResponder)
  {
    v57 = v21;
    v58 = v16;
    -[UIViewController _keyboardSceneDelegate](self);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "window");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "responder");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_responderWindow");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 == v44)
    {
      v46 = 1;
    }
    else
    {
      objc_msgSend(v40, "responder");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
        v46 = objc_msgSend(v17, "_preserveResponderAcrossWindows");
      else
        v46 = 0;

      v20 = v65;
    }

    objc_msgSend(v40, "responder");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "_shouldRestorationInputViewsOnlyWhenKeepingFirstResponder") & 1) != 0)
    {
      v48 = objc_msgSend(v17, "_shouldKeepCurrentFirstResponder");

      v49 = v48 & v46;
      v20 = v65;
      v21 = v57;
      v16 = v58;
      v18 = v63;
      if (v49 != 1)
        goto LABEL_34;
    }
    else
    {

      v21 = v57;
      v16 = v58;
      v18 = v63;
      if ((v46 & 1) == 0)
        goto LABEL_34;
    }
    if (((objc_msgSend(v17, "_shouldKeepCurrentFirstResponder") | v59) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_preserveInputViewsWithId:animated:", v50, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
    }
    else
    {
      if (dyld_program_sdk_at_least() && !dyld_program_sdk_at_least())
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_preserveInputViewsWithId:", v50);
    }

LABEL_34:
    v19 = v64;
    v39 = off_1E167B000;
  }
  -[UIViewController _setPresentationController:](self, "_setPresentationController:", v17);
  objc_msgSend(v15, "_presentingViewControllerIsChanging:", self);
  objc_msgSend(v17, "presentingViewController");
  v51 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v51 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentingViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 9183, CFSTR("Attempt to present %@, which has a presentingViewController of %@, expected %@"), v17, v56, self);

    v20 = v65;
  }
  -[UIViewController _window](self, "_window");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_presentWithAnimationController:inWindow:interactionController:animated:handoffData:", v18, v52, v19, -[__objc2_class areAnimationsEnabled](v39[372], "areAnimationsEnabled"), v20);

  -[UIViewController transitionCoordinator](self, "transitionCoordinator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _setPresentedStatusBarViewController:](self, "_setPresentedStatusBarViewController:", v15);
  -[UIViewController _setPresentedUserInterfaceStyleViewController:](self, "_setPresentedUserInterfaceStyleViewController:", v15);
  if (v53)
  {
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __157__UIViewController__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke;
    v66[3] = &unk_1E16B2150;
    v66[4] = self;
    objc_msgSend(v53, "animateAlongsideTransition:completion:", 0, v66);
  }
  objc_msgSend(v17, "_parentPresentationController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_containedViewControllerModalStateChanged");

LABEL_40:
}

uint64_t __157__UIViewController__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPresentedStatusBarViewController:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_setPresentedUserInterfaceStyleViewController:", 0);
  }
  return result;
}

- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  return 0;
}

- (id)_adaptedPresentationControllerForTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UIPresentationController *originalPresentationController;
  void *v12;
  void *v13;
  char v14;
  UIPresentationController *v15;
  UIPresentationController *v17;
  UIPresentationController *v18;
  void *v19;
  UIPresentationController *v20;
  void *v21;
  UIPresentationController *v22;
  uint64_t v23;
  UIPresentationController *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if (self->_originalPresentationController)
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isBeingDismissed") & 1) != 0)
      goto LABEL_5;
    v9 = objc_msgSend(v6, "horizontalSizeClass");
    v10 = objc_msgSend(v6, "verticalSizeClass");
    originalPresentationController = self->_originalPresentationController;
    -[UIViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(originalPresentationController) = -[UIPresentationController _shouldAdaptFromTraitCollection:toTraitCollection:](originalPresentationController, "_shouldAdaptFromTraitCollection:toTraitCollection:", v12, v6);

    if (!(_DWORD)originalPresentationController
      || (-[UIViewController traitCollection](self, "traitCollection"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v8, "_shouldAbortAdaptationFromTraitCollection:toTraitCollection:withTransitionCoordinator:", v13, v6, v7), v13, (v14 & 1) != 0))
    {
LABEL_5:
      v15 = 0;
    }
    else
    {
      -[UIPresentationController _presentationControllerForTraitCollection:](self->_originalPresentationController, "_presentationControllerForTraitCollection:", v6);
      v17 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _presentationController](self, "_presentationController");
      v18 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
      {
        v15 = 0;
      }
      else
      {
        -[UIViewController _setPresentedStatusBarViewController:](self, "_setPresentedStatusBarViewController:", 0);
        -[UIViewController _setPresentedUserInterfaceStyleViewController:](self, "_setPresentedUserInterfaceStyleViewController:", 0);
        -[UIPresentationController _setAdaptiveTransitionCoordinator:](v17, "_setAdaptiveTransitionCoordinator:", v7);
        objc_msgSend(v7, "_mainContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPresentationController _setAdaptiveTransitionContext:](v17, "_setAdaptiveTransitionContext:", v19);

        v20 = self->_originalPresentationController;
        if (v17 == v20)
        {
          -[UIPresentationController presentedViewController](v17, "presentedViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = self->_originalPresentationController;
          v23 = -1;
        }
        else
        {
          -[UIPresentationController _presentedViewControllerForPresentationController:traitCollection:](v20, "_presentedViewControllerForPresentationController:traitCollection:", v17, v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = self->_originalPresentationController;
          v23 = -[UIPresentationController presentationStyle](v17, "presentationStyle");
          v24 = v22;
        }
        -[UIPresentationController _sendDelegateWillPresentWithAdaptiveStyle:transitionCoordinator:](v24, "_sendDelegateWillPresentWithAdaptiveStyle:transitionCoordinator:", v23, v7);
        -[UIPresentationController _setPresentedViewController:](v17, "_setPresentedViewController:", v21);
        -[UIPresentationController presentingViewController](v18, "presentingViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPresentationController _setPresentingViewController:](v17, "_setPresentingViewController:", v25);

        -[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:](v18, "_transitionToPresentationController:withTransitionCoordinator:", v17, v7);
        if (v21 != v8)
          objc_msgSend(v21, "_replaceViewControllerInPresentationHierarchy:", v8);
        -[UIViewController _setPresentationController:](self, "_setPresentationController:", v17);
        -[UIViewController _setPresentationSizeClassPair:](self, "_setPresentationSizeClassPair:", v9, v10);
        -[UIViewController _setPresentedStatusBarViewController:](self, "_setPresentedStatusBarViewController:", v21);
        -[UIViewController _setPresentedUserInterfaceStyleViewController:](self, "_setPresentedUserInterfaceStyleViewController:", v21);
        v15 = v17;

      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_replaceViewControllerInPresentationHierarchy:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "parentModalViewController");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIViewController _removeChildModalViewController:](v4, v12);
  -[UIViewController _addChildModalViewController:](v4, self);
  objc_msgSend(v12, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_childPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "_presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _setPresentationController:](self, "_setPresentationController:", v7);

    objc_msgSend(v12, "_setPresentationController:", 0);
    objc_msgSend(v12, "_originalPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _setOriginalPresentationController:](self, "_setOriginalPresentationController:", v8);

    objc_msgSend(v12, "_setOriginalPresentationController:", 0);
    v9 = objc_msgSend(v12, "_presentationSizeClassPair");
    -[UIViewController _setPresentationSizeClassPair:](self, "_setPresentationSizeClassPair:", v9, v10);
    objc_msgSend(v6, "_setPresentingViewController:", self);
    objc_msgSend(v6, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _removeChildModalViewController:]((id *)v12, v11);
    -[UIViewController _addChildModalViewController:]((id *)&self->super.super.isa, v11);

  }
}

- (BOOL)_wantsContentClippedToSafeAreaInSidebarContext
{
  return 1;
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  UIViewControllerBuiltinTransitionViewAnimator *v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  UIViewController *v20;
  uint64_t v21;
  void *v22;
  UIModalTransitionStyle v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  UIViewController *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id *v47;
  id *v48;
  void *v49;
  void *v50;
  int isKindOfClass;
  int v52;
  int v53;
  int v54;
  int v55;
  id *v56;
  UIViewControllerBuiltinTransitionViewAnimator *v57;
  BOOL v58;
  id *v59;
  UIViewControllerBuiltinTransitionViewAnimator *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  char v72;
  void *v73;
  UIViewControllerAction *v74;
  id v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  UIDropShadowView *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  UIDimmingView *v108;
  uint64_t v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  double v117;
  double v118;
  id v119;
  double v120;
  void *v121;
  void *v122;
  UITransitionView *v123;
  uint64_t v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  uint64_t v131;
  _BOOL4 v132;
  void *v133;
  char v134;
  uint64_t v135;
  id *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  UIViewController *v145;
  id *v146;
  void (*v147)(uint64_t, void *);
  id *v148;
  id *v149;
  void *v150;
  double v151;
  double v152;
  void *v153;
  id v154;
  void *v155;
  uint64_t v156;
  void *v157;
  id v158;
  void *v159;
  UIViewControllerBuiltinTransitionViewAnimator *v160;
  char v161;
  char v162;
  _BOOL4 v163;
  _BOOL4 v164;
  int v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  UIViewController *v170;
  id v171;
  _QWORD v172[4];
  id v173;
  double v174;
  UIViewController *v175;
  uint64_t v176;
  void (*v177)(uint64_t, void *);
  void *v178;
  id *v179;
  id *v180;
  _QWORD v181[2];
  void (*v182)(uint64_t);
  void *v183;
  id *v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  UIViewController *v189;
  id *v190;
  id newValue[4];
  id v192;
  char *v193;
  unsigned int v194;
  id v195[2];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v11 = (id *)v8;
    v195[0] = v11;
    v194 = v6;
    v12 = v9;
    if (!self)
    {
LABEL_182:

      goto LABEL_183;
    }
    v193 = sel__windowControllerBasedPresentViewController_withTransition_completion_;
    if (-[UIViewController _isWaitingForDelayedPresentation](self))
    {
      objc_getAssociatedObject(self, &unk_1EDDB0F72);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Attempt to present %@ on %@ which is waiting for a delayed presention of %@ to complete"), v11, self, v13);

      goto LABEL_182;
    }
    if ((dyld_program_sdk_at_least() & 1) != 0)
      goto LABEL_14;
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0
      || (+[UIApplication displayIdentifier](UIApplication, "displayIdentifier"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(CFSTR("com.apple.facetime"), "isEqualToString:", v16),
          v16,
          (v17 & 1) != 0))
    {
LABEL_14:
      if (!dyld_program_sdk_at_least())
        goto LABEL_19;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "userInterfaceIdiom");

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || objc_msgSend(v11, "modalPresentationStyle") != 16
        && objc_msgSend(v11, "modalPresentationStyle") != 2
        && objc_msgSend(v11, "modalPresentationStyle") != 1)
      {
        goto LABEL_19;
      }
    }
    else if (objc_msgSend(v11, "modalPresentationStyle") == 17 || objc_msgSend(v11, "modalPresentationStyle") == 4)
    {
      goto LABEL_19;
    }
    objc_msgSend(v11, "setModalPresentationStyle:", 0);
LABEL_19:
    if (v11)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present a nil modal view controller on target %@."), self);
      v20 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    }
    v170 = self->_parentViewController;
    -[UIViewController presentedViewController](v170, "presentedViewController");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = -[UIViewController modalTransitionStyle](self, "modalTransitionStyle");

      if (v23 == UIModalTransitionStylePartialCurl)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present a nested modal view controller while curled %@."), self);
        v24 = objc_claimAutoreleasedReturnValue();

        v20 = (UIViewController *)v24;
      }
    }
    -[UIViewController _popoverController](self, "_popoverController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 || objc_msgSend(v11, "modalPresentationStyle"))
    {
      v26 = objc_msgSend(v11, "modalTransitionStyle");

      v27 = 0x1E0CB3000uLL;
      if (v26 != 3)
      {
LABEL_30:
        if (objc_msgSend(v11, "modalPresentationStyle") == 3)
        {
          -[UIViewController _popoverController](self, "_popoverController");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            v32 = objc_msgSend(v11, "modalTransitionStyle");

            if (v32)
            {
              v27 = 0x1E0CB3000uLL;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present inside popover with transition style other than UIModalTransitionStyleCoverVertical %@."), self);
              v33 = objc_claimAutoreleasedReturnValue();

              v20 = (UIViewController *)v33;
            }
            else
            {
              v27 = 0x1E0CB3000uLL;
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!dyld_program_sdk_at_least())
          {
            v34 = CFSTR("Application tried to present a split view controller %@.");
            goto LABEL_44;
          }
          if (objc_msgSend(v11, "modalPresentationStyle")
            && objc_msgSend(v11, "modalPresentationStyle") != 17
            && objc_msgSend(v11, "modalPresentationStyle") != 4)
          {
            v34 = CFSTR("Application tried to present a split view controller with a modal presentation style other than full screen or custom %@.");
LABEL_44:
            objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", v34, self);
            v35 = objc_claimAutoreleasedReturnValue();

            v20 = (UIViewController *)v35;
          }
        }
        objc_msgSend(v11, "parentViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (objc_msgSend(v11, "_parentModalViewController"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

        }
        else
        {
          objc_msgSend(v11, "_popoverController");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v61)
          {
LABEL_49:
            if (v20)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
              v154 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v154);
            }
            v171 = v12;
            if (objc_msgSend(v11, "_isDelayingPresentation"))
            {
              objc_msgSend(v11, "__viewControllerWillBePresented:", 1);
              v185 = MEMORY[0x1E0C809B0];
              v186 = 3221225472;
              v187 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke;
              v188 = &unk_1E16C1FF8;
              v189 = self;
              -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](self, 1, &v185);
              v175 = self;
              v38 = (void *)MEMORY[0x1E0C99DB8];
              -[UIViewController methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__windowControllerBasedPresentViewController_withTransition_completion_);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "invocationWithMethodSignature:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "setArgument:atIndex:", &v175, 0);
              objc_msgSend(v40, "setTarget:", self);
              objc_msgSend(v40, "setArgument:atIndex:", &v193, 1);
              objc_msgSend(v40, "setArgument:atIndex:", v195, 2);
              objc_msgSend(v40, "setArgument:atIndex:", &v194, 3);
              newValue[0] = _Block_copy(v12);
              objc_msgSend(v40, "setArgument:atIndex:", newValue, 4);
              objc_msgSend(v40, "retainArguments");
              objc_getAssociatedObject(v195[0], &unk_1EDDB0F73);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIViewController _window](self, "_window");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "windowScene");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setWindowSceneIgnoringEvents:", v43);

              v12 = v171;
              objc_msgSend(v41, "setPresentInvocation:", v40);
              objc_setAssociatedObject(self, &unk_1EDDB0F72, v195[0], (void *)1);
              -[_UIDelayedPresentationContext beginDelayedPresentation]((uint64_t)v41);

LABEL_181:
              goto LABEL_182;
            }
            v168 = v8;
            objc_msgSend(v11, "__viewControllerWillBePresented:", 0);
            -[UIViewController view](self, "view");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "dismissCurrentMenu");

            v46 = objc_msgSend(v11, "modalPresentationStyle");
            -[UIViewController _modalPresenter:](self, v46);
            v47 = (id *)objc_claimAutoreleasedReturnValue();
            if (v47 == v11)
            {
              v155 = (void *)MEMORY[0x1E0C99DA0];
              v156 = *MEMORY[0x1E0C99778];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application tried to present modal view controller on itself. Presenting controller is %@."), v11);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v155, "exceptionWithName:reason:userInfo:", v156, v157, 0);
              v158 = (id)objc_claimAutoreleasedReturnValue();

              objc_exception_throw(v158);
            }
            v48 = v47;
            objc_msgSend(v47, "view");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "superview");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v52 = objc_msgSend(v48, "definesPresentationContext");
            if (v46 == 3)
              v53 = v52;
            else
              v53 = 0;
            v162 = isKindOfClass;
            v54 = v53 & (isKindOfClass ^ 1);
            v165 = v54;
            if ((_DWORD)v6)
            {
              if (v54)
              {
                v55 = objc_msgSend(v48, "providesPresentationContextTransitionStyle");
                if (v55)
                  v56 = v48;
                else
                  v56 = v11;
              }
              else
              {
                v55 = 0;
                v56 = v11;
              }
              v59 = v56;
              -[UIViewController _customAnimatorForPresentedController:presentingController:sourceController:](v59, v11, v48, self);
              v60 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
              v58 = v60 != 0;
              if (v60)
              {
                -[UIViewController _customInteractionControllerForPresentation:](v59, v60);
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v60;
              }
              else
              {
                if (v55)
                  v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, objc_msgSend(v48, "modalTransitionStyle"), 1);
                v194 = v6;
                v57 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", v6);
                v169 = 0;
              }

              v62 = v46 != 4;
              if (!(_DWORD)v6)
                v62 = 1;
              if (!v62)
                v46 = 4;
              if (v60 || v62)
              {
                v163 = v6 == 0;
              }
              else
              {
                NSLog(CFSTR("Warning: %@->%@ UIModalPresentationCustom presentation style can only be used with an animator or with unanimated presentations."), self, v11);
                v163 = 0;
                v58 = 0;
                v46 = 0;
              }
              v12 = v171;
            }
            else
            {
              v57 = 0;
              v169 = 0;
              v58 = 0;
              v163 = 1;
            }
            objc_msgSend(v11, "_setModalSourceViewController:", self);
            objc_msgSend(v48, "childModalViewController");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v167 = v9;
            v161 = v58;
            if (v63 || v48[20])
            {
              v64 = 0;
            }
            else
            {
              objc_msgSend(v48, "view");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "superview");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v102 != 0;

            }
            objc_msgSend(v48, "view");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "window");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v64 || !v66)
            {
              if (v48[20])
              {
                NSLog(CFSTR("Warning: Attempt to present %@ on %@ while a presentation is in progress!"), v11, v48);
                v8 = v168;
              }
              else
              {
                objc_msgSend(v48, "view");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "superview");
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v168;
                if (v99)
                {
                  objc_msgSend(v48, "childModalViewController");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog(CFSTR("Warning: Attempt to present %@  on %@ which is already presenting %@"), v11, v48, v100);

                }
                else
                {
                  NSLog(CFSTR("Warning: Attempt to present %@ on %@ whose view is not in the window hierarchy!"), v11, v48);
                }
              }
              v9 = v167;
LABEL_180:

              goto LABEL_181;
            }
            v160 = v57;
            objc_msgSend(v48, "_rootAncestorViewController");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "_existingView");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "window");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "rootViewController");
            v70 = objc_claimAutoreleasedReturnValue();
            if (v67 == (void *)v70)
            {

              v73 = v171;
            }
            else
            {
              v71 = (void *)v70;
              v72 = objc_msgSend(v48, "_ancestorViewControllerIsInPopover");

              v73 = v171;
              if ((v72 & 1) != 0)
                goto LABEL_91;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Presenting view controllers on detached view controllers is discouraged %@."), v48);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog(CFSTR("%@"), v67);
            }

LABEL_91:
            v74 = -[UIViewControllerAction initWithViewController:name:transition:]([UIViewControllerAction alloc], "initWithViewController:name:transition:", v11, CFSTR("PresentModal"), v6);
            v75 = v48[20];
            v48[20] = v74;

            objc_msgSend(v48, "currentAction");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            newValue[0] = (id)MEMORY[0x1E0C809B0];
            newValue[1] = (id)3221225472;
            newValue[2] = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_2;
            newValue[3] = &unk_1E16B1BA0;
            v192 = v73;
            if (v76)
              objc_setProperty_nonatomic_copy(v76, v77, newValue, 24);

            v78 = 4194320;
            if (v163)
              v78 = 16;
            v48[46] = (id)((unint64_t)v48[46] & 0xFFFFFFFFFFBFFFFFLL | v78);
            objc_msgSend(v48, "view");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "firstResponder");
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            -[UIViewController _addChildModalViewController:](v48, v11);
            objc_msgSend(v11, "_presentingViewControllerWillChange:", v48);
            objc_msgSend(v48, "view");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "firstResponder");
            v82 = objc_claimAutoreleasedReturnValue();
            v83 = v48[17];
            v48[17] = (id)v82;

            if (!v48[17])
              objc_storeStrong(v48 + 17, v80);
            v159 = v80;
            objc_msgSend(v48, "view");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "window");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIViewController _keyboardSceneDelegate](self);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "responder");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "_window");
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            if (v85 == v88)
            {
              -[UIViewController _keyboardSceneDelegate](self);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v48);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "_preserveInputViewsWithId:animated:", v90, 1);

            }
            if ((v46 == 15 || v46 == 3) && (v162 & 1) != 0)
            {
              v46 = 0;
            }
            else if (v46 == 15)
            {
              v46 = 3;
            }
            v12 = v171;
            if (v165)
              objc_msgSend(v11, "setDefinesPresentationContext:", 1);
            if (v46 == 16 || v46 == 2)
            {
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "childModalViewController");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "_screen");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "addObserver:selector:name:object:", v92, sel__keyboardWillShow_, CFSTR("UIKeyboardPrivateWillShowNotification"), v93);

              objc_msgSend(v48, "childModalViewController");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "_screen");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = v171;
              objc_msgSend(v91, "addObserver:selector:name:object:", v94, sel__keyboardWillHide_, CFSTR("UIKeyboardPrivateWillHideNotification"), v95);

            }
            if (objc_msgSend(v11, "_isModalSheet"))
            {
              objc_msgSend(v11, "view");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v96;
              if (v46 == 16)
              {
                objc_msgSend(v96, "setAutoresizingMask:", 45);
              }
              else
              {
                v103 = objc_alloc_init(UIDropShadowView);
                -[UIDropShadowView setContentView:](v103, "setContentView:", v97);
                if (v46 == 2)
                  v104 = 45;
                else
                  v104 = 21;
                -[UIView setAutoresizingMask:](v103, "setAutoresizingMask:", v104);
                objc_msgSend(v11, "setDropShadowView:", v103);

              }
            }
            objc_msgSend(v48, "view");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "window");
            v106 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "_popoverController");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend(v48, "modalPresentationStyle");
            if ((unint64_t)(v46 - 1) >= 2)
            {
              if (v46 == 4)
              {
LABEL_143:
                objc_msgSend(v48, "view");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "superview");
                v122 = (void *)objc_claimAutoreleasedReturnValue();

                v123 = [UITransitionView alloc];
                objc_msgSend(v122, "bounds");
                v124 = -[UITransitionView initWithFrame:](v123, "initWithFrame:");
                v125 = v48[60];
                v48[60] = (id)v124;

                v126 = v48[60];
                objc_msgSend(v48, "view");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "insertSubview:aboveSubview:", v126, v127);

                v12 = v171;
                v128 = v48[60];
                objc_msgSend(v48, "view");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v128, "addSubview:", v129);

LABEL_144:
                +[UIDevice currentDevice](UIDevice, "currentDevice");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = objc_msgSend(v130, "userInterfaceIdiom");

                if (v46 != 3 || (v131 & 0xFFFFFFFFFFFFFFFBLL) != 1 || v107 == 16 || v107 == 2 || v107 == 1 || !v166)
                {
                  +[UIWindowController windowControllerForWindow:](UIWindowController, "windowControllerForWindow:", v106);
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v133, "setPresenting:", 1);
                  v57 = v160;
                  if (v160)
                    v134 = v161;
                  else
                    v134 = 1;
                  if ((v134 & 1) == 0)
                    -[UIViewControllerBuiltinTransitionViewAnimator setDelegate:](v160, "setDelegate:", v133);
                  objc_msgSend(v133, "_setTransitionController:", v160);
                  objc_msgSend(v133, "_setInteractionController:", v169);
                  v135 = v194;
                  v136 = (id *)v195[0];
                  v185 = MEMORY[0x1E0C809B0];
                  v186 = 3221225472;
                  v187 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_3;
                  v188 = &unk_1E16B1B50;
                  v189 = v48;
                  v11 = v136;
                  v190 = v11;
                  objc_msgSend(v133, "_transition:fromViewController:toViewController:target:didFinish:animation:", v135, v189, v11, v189, 1, &v185);

                  v132 = 0;
                  v9 = v167;
                  v12 = v171;
                }
                else
                {
                  if (v11)
                  {
                    v11[46] = (id)((unint64_t)v11[46] & 0xFFFFFFFFFFFFBFFFLL | (v11[46] >> 1) & 0x4000);
                    objc_msgSend(v11, "setModalInPresentation:", 1);
                  }
                  objc_msgSend(v166, "_modalTransition:fromViewController:toViewController:target:didFinish:", v6, v48, v11, v48, 1);
                  v9 = v167;
                  v57 = v160;
                  v132 = v6 == 13;
                }
                if (!_UIAppUseModernRotationAndPresentationBehaviors()
                  && ((objc_msgSend(v11, "_isModalSheet") & 1) != 0 || v46 == 17 || v46 == 4))
                {
                  objc_msgSend(v48, "view");
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v137, "window");
                  v138 = v9;
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v139, "_addRotationViewController:", v11);

                  v9 = v138;
                }
                if (objc_msgSend(v11, "_isModalSheet"))
                {
                  objc_msgSend(v11, "view");
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "setTintAdjustmentMode:", 1);

                  objc_msgSend(v48, "transitionCoordinator");
                  v141 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v48, "presentingViewController");
                  v142 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v141)
                  {
                    v164 = v132;
                    objc_msgSend(v48, "transitionCoordinator");
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "view");
                    v144 = (void *)objc_claimAutoreleasedReturnValue();
                    v145 = (UIViewController *)MEMORY[0x1E0C809B0];
                    v181[0] = MEMORY[0x1E0C809B0];
                    v181[1] = 3221225472;
                    if (v142)
                    {
                      v182 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_6;
                      v183 = &unk_1E16B2150;
                      v146 = v48;
                      v184 = v146;
                      v175 = v145;
                      v176 = 3221225472;
                      v147 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_7;
                    }
                    else
                    {
                      v182 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_4;
                      v183 = &unk_1E16B2150;
                      v146 = v48;
                      v184 = v146;
                      v175 = v145;
                      v176 = 3221225472;
                      v147 = __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_5;
                    }
                    v177 = v147;
                    v178 = &unk_1E16B2E68;
                    v179 = v146;
                    v180 = v11;
                    objc_msgSend(v143, "animateAlongsideTransitionInView:animation:completion:", v144, v181, &v175);

                    v149 = v184;
                    v57 = v160;
                    v132 = v164;
                  }
                  else
                  {
                    objc_msgSend(v48, "view");
                    v148 = (id *)objc_claimAutoreleasedReturnValue();
                    v149 = v148;
                    if (v142)
                    {
                      objc_msgSend(v148, "setTintAdjustmentMode:", 0);
                    }
                    else
                    {
                      objc_msgSend(v148, "window");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v153, "_beginOcclusion:", v48);

                    }
                  }

                  v12 = v171;
                }
                if (v132)
                {
                  v174 = 40.0;
                  objc_msgSend(v11, "view");
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v150, "bounds");
                  _UIViewCurlUpTransitionToTime(&v174, v151, v152);

                  -[UIViewController _addCurlUpTapGestureRecognizerWithRevealedHeight:](v11, v174);
                }
                if (v46 == 16 || v46 == 2)
                {
                  if (objc_msgSend(v11, "disablesAutomaticKeyboardDismissal"))
                    objc_msgSend(v11, "_beginPinningInputViews");
                }

                v8 = v168;
                goto LABEL_180;
              }
              if (v46 != 16)
                goto LABEL_144;
            }
            if ((objc_msgSend(v48[15], "_isDimmingBackground") & 1) == 0
              && (objc_msgSend(v11, "_useCustomDimmingView") & 1) == 0)
            {
              v108 = [UIDimmingView alloc];
              objc_msgSend(v106, "bounds");
              v109 = -[UIDimmingView initWithFrame:](v108, "initWithFrame:");
              v110 = v48[18];
              v48[18] = (id)v109;

              objc_msgSend(v48[18], "setAutoresizingMask:", 18);
              objc_msgSend(v48[18], "setIgnoresTouches:", 1);
              objc_msgSend(v11, "_backgroundColorForModalFormSheet");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48[18], "setDimmingColor:", v111);

              objc_msgSend(v48[18], "setSuppressesBackdrops:", 1);
              if (v46 == 3)
              {
                objc_msgSend(v48, "view");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "superview");
                v113 = (void *)objc_claimAutoreleasedReturnValue();

                if (v113 == v106)
                {
                  v114 = v112;
                }
                else
                {
                  do
                  {
                    objc_msgSend(v112, "superview");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v114, "superview");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();

                    v112 = v114;
                  }
                  while (v115 != v106);
                }
                objc_msgSend(v106, "insertSubview:below:", v48[18], v114);

                v12 = v171;
              }
              else
              {
                objc_msgSend(v106, "addSubview:", v48[18]);
              }
              objc_msgSend((id)objc_opt_class(), "durationForTransition:", v6);
              v118 = v117;
              v119 = v48[18];
              v120 = 0.0;
              if ((_DWORD)v6 == 6)
                v120 = v117 * UIAnimationDragCoefficient();
              objc_msgSend(v119, "display:withAnimationDuration:afterDelay:", 1, v118, v120);
            }
            if (v46 != 4)
              goto LABEL_144;
            goto LABEL_143;
          }
        }
        objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", CFSTR("Application tried to present modally an active controller %@."), self);
        v37 = objc_claimAutoreleasedReturnValue();

        v20 = (UIViewController *)v37;
        goto LABEL_49;
      }
    }
    else
    {
      -[UIViewController presentedViewController](v170, "presentedViewController");
      v29 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (v29 != self)
      {
        v27 = 0x1E0CB3000;
        goto LABEL_29;
      }
      v27 = 0x1E0CB3000;
      if (-[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFullScreen)
      {
        v29 = self;
        goto LABEL_29;
      }
      v116 = objc_msgSend(v11, "modalTransitionStyle");

      if (v116 != 3)
        goto LABEL_30;
    }
    objc_msgSend(*(id *)(v27 + 2368), "stringWithFormat:", CFSTR("Application tried to present UIModalTransitionStylePartialCurl to or from non-fullscreen view controller %@."), self);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v20;
    v20 = (UIViewController *)v28;
LABEL_29:

    goto LABEL_30;
  }
  v10 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", v6);
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = __68__UIViewController_presentViewController_withTransition_completion___block_invoke;
  v172[3] = &unk_1E16B1BA0;
  v173 = v9;
  -[UIViewController _presentViewController:withAnimationController:completion:](self, "_presentViewController:withAnimationController:completion:", v8, v10, v172);

LABEL_183:
}

uint64_t __68__UIViewController_presentViewController_withTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_7___s_category;
  if (!_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_7___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_7___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Application tried to represent an active popover presentation %@ from %@.", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __78__UIViewController__presentViewController_withAnimationController_completion___block_invoke_572(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_childViewControllerWillBePresentedFromViewControllerDelayingPresentationWithPresenter:", *(_QWORD *)(a1 + 32));
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPresentedStatusBarViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setPresentedUserInterfaceStyleViewController:", *(_QWORD *)(a1 + 40));
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_beginOcclusion:", *(_QWORD *)(a1 + 32));

}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_endOcclusion:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintAdjustmentMode:", 0);

  }
}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTintAdjustmentMode:", 0);

}

void __90__UIViewController__windowControllerBasedPresentViewController_withTransition_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintAdjustmentMode:", 1);

    objc_msgSend(*(id *)(a1 + 40), "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintAdjustmentMode:", 0);

  }
}

- (void)_addCurlUpTapGestureRecognizerWithRevealedHeight:(void *)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  char isKindOfClass;
  double v8;
  void *v9;
  _UIDismissCurlUpTapGestureRecognizer *v10;

  if (a1)
  {
    if (objc_msgSend(a1, "isViewLoaded"))
    {
      objc_msgSend(a1, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gestureRecognizers");
      v10 = (_UIDismissCurlUpTapGestureRecognizer *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      while (v5 < -[_UIDismissCurlUpTapGestureRecognizer count](v10, "count"))
      {
        -[_UIDismissCurlUpTapGestureRecognizer objectAtIndex:](v10, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        ++v5;
        if ((isKindOfClass & 1) != 0)
          goto LABEL_9;
      }

    }
    v10 = -[UITapGestureRecognizer initWithTarget:action:]([_UIDismissCurlUpTapGestureRecognizer alloc], "initWithTarget:action:", a1, sel__handleTapToDismissModalCurl_);
    *(float *)&v8 = a2;
    -[_UIDismissCurlUpTapGestureRecognizer _setCurlUpDY:](v10, "_setCurlUpDY:", v8);
    objc_msgSend(a1, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", v10);

LABEL_9:
  }
}

- (BOOL)_willPreemptRunningPresentationTransition
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (qword_1EDDB1030 != -1)
    dispatch_once(&qword_1EDDB1030, &__block_literal_global_675);
  if (byte_1EDDB0F78
    || (v3 = 0,
        (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ZoomPreemptionInAllApps, (uint64_t)CFSTR("ZoomPreemptionInAllApps"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0)&& byte_1EDDA7EF4)
  {
    -[UIViewController _nonModalAncestorViewControllerStopAtIsPresentationContext:](self, "_nonModalAncestorViewControllerStopAtIsPresentationContext:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_transitionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_animator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = objc_msgSend(v7, "prefersPreemptionEnabledForPresentations");

  }
  return v3;
}

void __61__UIViewController__willPreemptRunningPresentationTransition__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDB0F78 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.weather"));

}

- (BOOL)_willPreemptRunningTransitionForDismissal
{
  void *v2;
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIViewController _viewControllerForDismissal](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingDismissed");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "_presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_animator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v8, "prefersPreemptionEnabledForPresentations");
    else
      v5 = 0;

  }
  return v5;
}

- (id)_viewControllerForDismissal
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  int v7;

  if (a1)
  {
    objc_msgSend(a1, "_presentationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_presentingOrPresented");

    if ((v3 & 1) != 0)
    {
      v4 = a1;
    }
    else
    {
      objc_msgSend(a1, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_existingPresentationControllerImmediate:effective:", 1, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_presentingOrPresented");

      if (!v7 || (objc_msgSend(v5, "presentingViewController"), (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(a1, "presentingViewController");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)presentModalViewController:(id)a3 withTransition:(int)a4
{
  -[UIViewController presentViewController:withTransition:completion:](self, "presentViewController:withTransition:completion:", a3, *(_QWORD *)&a4, 0);
}

void __63__UIViewController__presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_defaultAnimationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_presentViewController:withAnimationController:completion:", *(_QWORD *)(a1 + 32), v2, *(_QWORD *)(a1 + 48));

}

void __63__UIViewController__presentViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  -[UIViewController _performCoordinatedPresentOrDismiss:animated:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __62__UIViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  if (*(_BYTE *)(a1 + 56) && (v2 = *(_QWORD **)(a1 + 32)) != 0 && (v2[46] & 0x200000000) == 0)
    v3 = -[UIViewController _transitionForModalTransitionStyle:appearing:](*(_QWORD *)(a1 + 40), objc_msgSend(v2, "modalTransitionStyle"), 1);
  else
    v3 = 0;
  return objc_msgSend(*(id *)(a1 + 40), "presentViewController:withTransition:completion:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 48));
}

uint64_t __65__UIViewController__performCoordinatedPresentOrDismiss_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
{
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", modalViewController, animated, 0);
}

- (void)_windowControllerTransitionDidCancel
{
  id v3;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _removeChildModalViewController:]((id *)&self->super.super.isa, v3);

}

- (void)dismissModalViewControllerWithTransition:(int)a3
{
  -[UIViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", *(_QWORD *)&a3, 0);
}

- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5
{
  uint64_t v6;
  UIViewController *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIViewController *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
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
  _BOOL4 v30;
  _BOOL4 v31;
  id v32;
  char v33;
  UIViewController *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  UIViewControllerBuiltinTransitionViewAnimator *v39;
  unint64_t v40;
  NSObject *v41;
  UIViewController *v42;
  void *v43;
  int v44;
  _BOOL4 v45;
  _BOOL4 v46;
  UIViewController *v47;
  UIViewController *v48;
  UIViewController *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  UIViewControllerBuiltinTransitionViewAnimator *v54;
  UIViewControllerBuiltinTransitionViewAnimator *v55;
  void *v56;
  BOOL v57;
  UIViewControllerBuiltinTransitionViewAnimator *v58;
  _BOOL4 v59;
  UIViewController *v60;
  UIViewControllerBuiltinTransitionViewAnimator *v61;
  void *v62;
  int64_t v63;
  double v64;
  int64_t v65;
  void *v66;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v71;
  CGFloat v72;
  _BOOL8 v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  UIViewControllerAction *v79;
  UIViewControllerAction *currentAction;
  void *v81;
  CGFloat v82;
  const char *v83;
  uint64_t v84;
  double v85;
  id dimmingView;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  UIViewController *v93;
  void (**v94)(_QWORD);
  char v95;
  void *v96;
  void *v97;
  void *v98;
  UIResponder *modalPreservedFirstResponder;
  char v100;
  BOOL v101;
  UIViewControllerBuiltinTransitionViewAnimator *v102;
  void *v103;
  void *v104;
  void *v105;
  UIViewController *v106;
  void *v107;
  void *v108;
  void *v109;
  _QWORD v110[5];
  UIViewControllerBuiltinTransitionViewAnimator *v111;
  id v112;
  id v113;
  id v114;
  _QWORD v115[5];
  CGAffineTransform newValue;
  CGAffineTransform v117;
  CGAffineTransform buf;
  BOOL v119;
  uint64_t v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v6 = *(_QWORD *)&a3;
  v120 = *MEMORY[0x1E0C80C00];
  v8 = (UIViewController *)a4;
  v9 = a5;
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    v15 = v8;
    v16 = v9;
    if (!self)
      goto LABEL_117;
    v17 = -[UIViewController modalPresentationStyle](v15, "modalPresentationStyle");
    v18 = -[UIViewController _isModalSheet](v15, "_isModalSheet");
    if (!v15)
      goto LABEL_117;
    v106 = v8;
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _screen](self, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObserver:name:object:", v15, CFSTR("UIKeyboardPrivateWillShowNotification"), v21);

    -[UIViewController _screen](self, "_screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v20;
    objc_msgSend(v20, "removeObserver:name:object:", v15, CFSTR("UIKeyboardPrivateWillHideNotification"), v22);

    v101 = v19;
    if (v19 || v17 == 17 || v17 == 4)
    {
      -[UIViewController view](v15, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_removeRotationViewController:", v15);

    }
    -[UIViewController view](v15, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v25;
    objc_msgSend(v25, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindowController windowControllerForWindow:](UIWindowController, "windowControllerForWindow:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "transitionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 == v29)
    {
      NSLog(CFSTR("attempt to dismiss modal view controller whose view does not currently appear. self = %@ modalViewController = %@"), self, v15);
      v56 = v105;
      v8 = v106;
LABEL_116:

LABEL_117:
      goto LABEL_118;
    }
    if ((v17 == 16 || v17 == 2)
      && -[UIViewController disablesAutomaticKeyboardDismissal](v15, "disablesAutomaticKeyboardDismissal"))
    {
      -[UIResponder _endPinningInputViews](v15, "_endPinningInputViews");
    }
    v30 = -[UIViewController definesPresentationContext](self, "definesPresentationContext");
    v104 = v16;
    if (!(_DWORD)v6)
    {
      v57 = 0;
      v103 = 0;
      v58 = 0;
      v59 = 0;
LABEL_86:
      v100 = v57;
      v102 = v58;
      v79 = -[UIViewControllerAction initWithViewController:name:transition:]([UIViewControllerAction alloc], "initWithViewController:name:transition:", v15, CFSTR("DismissModal"), v6);
      currentAction = self->_currentAction;
      self->_currentAction = v79;

      -[UIViewController currentAction](self, "currentAction");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&newValue.a = MEMORY[0x1E0C809B0];
      *(_QWORD *)&newValue.b = 3221225472;
      *(_QWORD *)&newValue.c = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke;
      *(_QWORD *)&newValue.d = &unk_1E16B1BA0;
      *(_QWORD *)&newValue.tx = v104;
      if (v81)
        objc_setProperty_nonatomic_copy(v81, v83, &newValue, 24);

      v84 = 16;
      if (v59)
        v84 = 4194320;
      *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFBFFFFFLL | v84;
      objc_msgSend((id)objc_opt_class(), "durationForTransition:", v6);
      if ((_DWORD)v6 == 6)
        v85 = 0.0;
      objc_msgSend(self->_dimmingView, "display:withAnimationDuration:afterDelay:", 0, v85);
      dimmingView = self->_dimmingView;
      self->_dimmingView = 0;

      -[UIViewController view](v15, "view");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "window");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIWindowController windowControllerForWindow:](UIWindowController, "windowControllerForWindow:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController _popoverController](self, "_popoverController");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v91, "userInterfaceIdiom");

      if (v17 != 3
        || (v92 & 0xFFFFFFFFFFFFFFFBLL) != 1
        || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == 16
        || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationFormSheet
        || -[UIViewController modalPresentationStyle](self, "modalPresentationStyle") == UIModalPresentationPageSheet
        || !v90)
      {
        buf.a = v82;
        *(_QWORD *)&buf.b = 3221225472;
        *(_QWORD *)&buf.c = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_2;
        *(_QWORD *)&buf.d = &unk_1E16B4008;
        v119 = v101;
        *(_QWORD *)&buf.tx = self;
        v93 = v15;
        *(_QWORD *)&buf.ty = v93;
        v94 = (void (**)(_QWORD))_Block_copy(&buf);
        if (v89)
        {
          if (v102)
            v95 = v100;
          else
            v95 = 1;
          if ((v95 & 1) == 0)
            -[UIViewControllerBuiltinTransitionViewAnimator setDelegate:](v102, "setDelegate:", v89);
          objc_msgSend(v89, "_setTransitionController:", v102);
          objc_msgSend(v89, "_setInteractionController:", v103);
          *(CGFloat *)v115 = v82;
          v115[1] = 3221225472;
          v115[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_7;
          v115[3] = &unk_1E16B1B28;
          v115[4] = self;
          objc_msgSend(v89, "_transition:fromViewController:toViewController:target:didFinish:animation:", v6, v93, self, self, 2, v115);
          v94[2](v94);
        }
        else
        {
          -[UIViewController _didFinishDismissTransition](self, "_didFinishDismissTransition");
        }
        v8 = v106;

      }
      else
      {
        objc_msgSend(v90, "_modalTransition:fromViewController:toViewController:target:didFinish:", v6, v15, self, self, 2);
        -[UIViewController setModalInPresentation:](v15, "setModalInPresentation:", (*(_QWORD *)&v15->_viewControllerFlags >> 14) & 1);
        *(_QWORD *)&v15->_viewControllerFlags &= ~0x4000uLL;
        v8 = v106;
      }
      v16 = v104;
      v56 = v105;
      v15->_lastKnownInterfaceOrientation = 0;
      if (!(_DWORD)v6)
      {
        -[UIViewController view](self, "view");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "_clearAnimationFilters");

      }
      if (self->_modalPreservedFirstResponder)
      {
        if (-[UIResponder _containsResponder:](self, "_containsResponder:")
          && -[UIResponder _canBecomeFirstResponderWhenPossible](self->_modalPreservedFirstResponder, "_canBecomeFirstResponderWhenPossible"))
        {
          -[UIViewController _keyboardSceneDelegate](self);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "_restoreInputViewsWithId:animated:", v98, 1);

          -[UIResponder _clearBecomeFirstResponderWhenCapable](self->_modalPreservedFirstResponder, "_clearBecomeFirstResponderWhenCapable");
        }
        modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
        self->_modalPreservedFirstResponder = 0;

      }
      goto LABEL_116;
    }
    if ((_DWORD)v6 != 9
      || (v17 == 3 ? (v31 = v30) : (v31 = 0),
          v31
       && -[UIViewController providesPresentationContextTransitionStyle](self, "providesPresentationContextTransitionStyle")))
    {
      v32 = v9;
      v33 = 1;
      v34 = self;
    }
    else
    {
      v32 = v9;
      v33 = 0;
      v34 = v15;
    }
    v60 = v34;
    -[UIViewController _customAnimatorForDismissedController:](v60, v15);
    v61 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
    v57 = v61 != 0;
    if (v61)
    {
      v58 = v61;
      -[UIViewController _customInteractionControllerForDismissal:](v60, v61);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = v6 != 0;
      if (v59 && v17 == 4)
        v17 = 4;
    }
    else
    {
      if ((v33 & 1) == 0)
        v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, -[UIViewController modalTransitionStyle](v15, "modalTransitionStyle"), 0);
      v58 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", v6);

      v103 = 0;
      v59 = v6 != 0;
      if (v17 == 4)
      {
        v9 = v32;
        if ((_DWORD)v6)
        {
          NSLog(CFSTR("Warning: %@->%@ UIModalPresentationCustom presentation style can only be used with an animator or with unanimated dismissals."), v15, self);
          v17 = 0;
          v57 = 0;
          v103 = 0;
LABEL_73:
          v59 = 1;
          goto LABEL_86;
        }
LABEL_64:
        if (v17 != 1 || (_DWORD)v6 != 12)
          goto LABEL_86;
        if ((UIKeyboardAutomaticIsOffScreen() & 1) == 0)
        {
          memset(&buf, 0, sizeof(buf));
          v63 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
          v64 = 0.0;
          if (v63 != 1)
          {
            if (-[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation", 0.0) == 4)
            {
              v64 = -1.57079633;
            }
            else if (-[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation") == 3)
            {
              v64 = 1.57079633;
            }
            else
            {
              v65 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
              v64 = 3.14159265;
              if (v65 != 2)
                v64 = 0.0;
            }
          }
          +[UIScreen transformToRotateScreen:](UIScreen, "transformToRotateScreen:", v64);
          -[UIViewController _visibleView](v15, "_visibleView");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "frame");
          v117 = buf;
          v122 = CGRectApplyAffineTransform(v121, &v117);
          x = v122.origin.x;
          y = v122.origin.y;
          width = v122.size.width;
          height = v122.size.height;

          +[UIKeyboard sizeForInterfaceOrientation:](UIKeyboard, "sizeForInterfaceOrientation:", -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation"));
          v72 = height - (v71 + -10.0);
          v73 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
          newValue = buf;
          CGAffineTransformInvert(&v117, &newValue);
          v123.origin.x = x;
          v123.origin.y = y;
          v123.size.width = width;
          v123.size.height = v72;
          v124 = CGRectApplyAffineTransform(v123, &v117);
          v74 = v124.origin.x;
          v75 = v124.origin.y;
          v76 = v124.size.width;
          v77 = v124.size.height;
          -[UIViewController _visibleView](v15, "_visibleView");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setFrame:", v74, v75, v76, v77);

          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v73);
          v17 = 1;
          v6 = 12;
          v59 = 1;
          goto LABEL_86;
        }
        v17 = 1;
        v6 = 12;
        goto LABEL_73;
      }
    }
    v9 = v32;
    goto LABEL_64;
  }
  -[UIViewController _presentationController](self, "_presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIViewController _presentationController](self, "_presentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_transitionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_animator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EDDCE3D0)
      && objc_msgSend(v13, "shouldPreemptWithContext:", v12))
    {
      objc_msgSend(v13, "preemptWithContext:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    -[UIViewController _presentingViewControllerWillChange:](v8, "_presentingViewControllerWillChange:", 0);
    -[UIViewController _overrideTransitioningDelegate](v8, "_overrideTransitioningDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {

    }
    else if (!(_DWORD)v6
           || !+[UIViewController _shouldAnimateTransitions](UIViewController, "_shouldAnimateTransitions"))
    {
      v39 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", 0);
      if (v39)
      {
LABEL_38:
        v107 = v13;
        v42 = v8;
        v109 = v12;
        if (-[UIViewController definesPresentationContext](self, "definesPresentationContext"))
        {
          -[UIViewController _presentationController](self, "_presentationController");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "_shouldRespectDefinesPresentationContext");

          v45 = v6 == 0;
          if ((_DWORD)v6)
            v46 = v6 != 9;
          else
            v46 = 0;
          if (!v46 && v44)
            v46 = -[UIViewController providesPresentationContextTransitionStyle](self, "providesPresentationContextTransitionStyle");
        }
        else
        {
          v45 = v6 == 0;
          if ((_DWORD)v6)
            v46 = v6 != 9;
          else
            v46 = 0;
        }
        if (v46)
          v47 = self;
        else
          v47 = v42;
        v48 = v47;
        v49 = v48;
        if (!v39)
        {
          -[UIViewController _customAnimatorForDismissedController:](v48, v42);
          v55 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();
          if (v55)
          {
            v39 = v55;
            -[UIViewController _customInteractionControllerForDismissal:](v49, v55);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
              goto LABEL_53;
          }
          else
          {
            -[UIViewController _presentationController](self, "_presentationController");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "_preferredAnimationControllerForDismissal");
            v39 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();

            if (!v39)
            {
              if (!v45 && !v46)
                v6 = -[UIViewController _transitionForModalTransitionStyle:appearing:]((uint64_t)self, -[UIViewController modalTransitionStyle](v42, "modalTransitionStyle"), 0);
              v39 = -[UIViewControllerBuiltinTransitionViewAnimator initWithTransition:]([UIViewControllerBuiltinTransitionViewAnimator alloc], "initWithTransition:", v6);
            }
          }
        }
        -[UIViewController _presentationController](self, "_presentationController");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_preferredInteractionControllerForDismissal:", v39);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_53:
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __73__UIViewController__dismissViewControllerWithTransition_from_completion___block_invoke;
        v110[3] = &unk_1E16C0EF8;
        v110[4] = self;
        v111 = v39;
        v112 = v51;
        v113 = v14;
        v114 = v9;
        v52 = v14;
        v53 = v51;
        v54 = v39;
        +[UIView _conditionallyPerformWithoutAnimation:layout:](UIView, "_conditionallyPerformWithoutAnimation:layout:", (_DWORD)v6 == 0, v110);

        v8 = v42;
        goto LABEL_118;
      }
    }
    -[UIViewController _presentationController](self, "_presentationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "_forcesPreferredAnimationControllers");

    if (v37)
    {
      -[UIViewController _presentationController](self, "_presentationController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_preferredAnimationControllerForDismissal");
      v39 = (UIViewControllerBuiltinTransitionViewAnimator *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }
    goto LABEL_38;
  }
  v40 = _dismissViewControllerWithTransition_from_completion____s_category;
  if (!_dismissViewControllerWithTransition_from_completion____s_category)
  {
    v40 = __UILogCategoryGetNode("Presentation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v40, (unint64_t *)&_dismissViewControllerWithTransition_from_completion____s_category);
  }
  v41 = *(NSObject **)(v40 + 8);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.a) = 138412290;
    *(_QWORD *)((char *)&buf.a + 4) = self;
    _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_DEFAULT, "Cannot dismiss %@ because there is no _presentationController.", (uint8_t *)&buf, 0xCu);
  }
LABEL_118:

}

void __73__UIViewController__dismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int has_internal_diagnostics;
  uint64_t v13;
  void *v14;
  UIViewControllerAction *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  void (**v24)(void *, void *);
  void *v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  _QWORD *v34;
  _QWORD newValue[4];
  id v36;
  __int128 buf;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD *v41;
  id v42;
  id v43;
  id v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v31 = v2;
  v6 = v3;
  v30 = v4;
  if (v1)
  {
    v7 = objc_opt_class();
    if (v7 == objc_opt_class())
    {
      v8 = objc_msgSend(v5, "transition");
      v9 = v8 != 0;
    }
    else
    {
      v8 = 0;
      v9 = 1;
    }
    objc_msgSend(v1, "_presentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v13 = v1[20];
    v14 = v6;
    if (has_internal_diagnostics)
    {
      if (v13)
      {
        __UIFaultDebugAssertLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v11;
          _os_log_fault_impl(&dword_185066000, v27, OS_LOG_TYPE_FAULT, "Failed to complete already running transition on %@.", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    else if (v13)
    {
      v28 = _dismissViewControllerWithAnimationController_interactionController_handoffData_completion____s_category;
      if (!_dismissViewControllerWithAnimationController_interactionController_handoffData_completion____s_category)
      {
        v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&_dismissViewControllerWithAnimationController_interactionController_handoffData_completion____s_category);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Failed to complete already running transition on %@.", (uint8_t *)&buf, 0xCu);
      }
    }
    v15 = -[UIViewControllerAction initWithViewController:name:transition:]([UIViewControllerAction alloc], "initWithViewController:name:transition:", v11, CFSTR("DismissModal"), v8);
    v16 = (void *)v1[20];
    v1[20] = v15;

    objc_msgSend(v1, "currentAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    newValue[0] = MEMORY[0x1E0C809B0];
    newValue[1] = 3221225472;
    newValue[2] = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke;
    newValue[3] = &unk_1E16B1BA0;
    v36 = v30;
    if (v17)
      objc_setProperty_nonatomic_copy(v17, v19, newValue, 24);

    v20 = 16;
    if (v9)
      v20 = 4194320;
    v1[46] = v1[46] & 0xFFFFFFFFFFBFFFFFLL | v20;
    *(_QWORD *)&buf = v18;
    *((_QWORD *)&buf + 1) = 3221225472;
    v38 = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_2;
    v39 = &unk_1E16C20D8;
    v21 = v10;
    v40 = v21;
    v41 = v1;
    v45 = sel__dismissViewControllerWithAnimationController_interactionController_handoffData_completion_;
    v42 = v5;
    v43 = v31;
    v6 = v14;
    v44 = v14;
    +[UIView _conditionallyPerformWithoutAnimation:layout:](UIView, "_conditionallyPerformWithoutAnimation:layout:", !v9, &buf);
    objc_msgSend(v1, "_tabBarControllerEnforcingClass:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_viewControllerDidBeginDismissal:", v1);

    aBlock[0] = v18;
    aBlock[1] = 3221225472;
    aBlock[2] = __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_3;
    aBlock[3] = &unk_1E16B2E68;
    v23 = v11;
    v33 = v23;
    v34 = v1;
    v24 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v1, "_definiteTransitionCoordinator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v25);
    if ((dyld_program_sdk_at_least() & 1) != 0
      || objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_notifyWhenInteractionChangesUsingBlock_))
    {
      objc_msgSend(v25, "notifyWhenInteractionChangesUsingBlock:", v24);
    }
    if (v23)
      v23[32] = 0;
    if (!(_DWORD)v8)
    {
      objc_msgSend(v1, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_clearAnimationFilters");

    }
  }

}

uint64_t __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("UIViewController.m"), 10720, CFSTR("Attempt to dismiss %@, which has a presentingViewController of %@, expected %@"), v8, v9, *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_dismissWithAnimationController:interactionController:animated:handoffData:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), *(_QWORD *)(a1 + 64));
}

void __111__UIViewController__dismissViewControllerWithAnimationController_interactionController_handoffData_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isCancelled") & 1) != 0 || objc_msgSend(v6, "isInteractive"))
    v3 = *(void **)(a1 + 32);
  else
    v3 = 0;
  v4 = *(void **)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "_setPresentedStatusBarViewController:shouldJoinAnimationsInProgress:", v5, dyld_program_sdk_at_least() ^ 1);
  objc_msgSend(*(id *)(a1 + 40), "_setPresentedUserInterfaceStyleViewController:", v5);

}

- (void)_restoreInputViewsForPresentation
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  UIResponder *modalPreservedFirstResponder;

  if (self->_modalPreservedFirstResponder)
  {
    -[UIViewController _keyboardSceneDelegate](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_restoreInputAccessoryViewOverrideWithId:", v4);

    if (!-[UIResponder _containsResponder:](self, "_containsResponder:", self->_modalPreservedFirstResponder))
    {
LABEL_9:
      modalPreservedFirstResponder = self->_modalPreservedFirstResponder;
      self->_modalPreservedFirstResponder = 0;

      return;
    }
    v5 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    -[UIViewController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getClass("UIActivityViewController");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "_existingPresentationControllerImmediate:effective:", 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v6, "_existingPresentationControllerImmediate:effective:", 1, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[UIViewController _keyboardSceneDelegate](self);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "popAnimationStyle");
        goto LABEL_7;
      }
    }
LABEL_8:
    -[UIViewController _keyboardSceneDelegate](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_restoreInputViewsWithId:animated:", v11, v5);

    -[UIResponder _clearBecomeFirstResponderWhenCapable](self->_modalPreservedFirstResponder, "_clearBecomeFirstResponderWhenCapable");
    goto LABEL_9;
  }
}

uint64_t __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_2(uint64_t a1)
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
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  uint64_t v21;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v4, "transitionCoordinator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_5;
        v16[3] = &unk_1E16B2150;
        v7 = *(void **)(a1 + 40);
        v17 = *(_QWORD *)(a1 + 32);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_6;
        v14[3] = &unk_1E16B2E68;
        v14[4] = v17;
        v15 = v7;
        objc_msgSend(v5, "animateAlongsideTransitionInView:animation:completion:", v6, v16, v14);

        v8 = v15;
      }
      else
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_3;
        v20[3] = &unk_1E16B2150;
        v11 = *(void **)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 32);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_4;
        v18[3] = &unk_1E16B2E68;
        v18[4] = v21;
        v19 = v11;
        objc_msgSend(v5, "animateAlongsideTransitionInView:animation:completion:", v6, v20, v18);

        v8 = v19;
      }

    }
    else
    {
      objc_msgSend(v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v3)
      {
        objc_msgSend(v9, "setTintAdjustmentMode:", 1);
      }
      else
      {
        objc_msgSend(v9, "window");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_endOcclusion:", *(_QWORD *)(a1 + 32));

      }
      objc_msgSend(*(id *)(a1 + 40), "view");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTintAdjustmentMode:", 0);

    }
  }
}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_endOcclusion:", *(_QWORD *)(a1 + 32));

}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  if (objc_msgSend(a2, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_beginOcclusion:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintAdjustmentMode:", 0);
  }

}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTintAdjustmentMode:", 1);

}

void __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_6(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;

  v3 = objc_msgSend(a2, "isCancelled");
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintAdjustmentMode:", 0);

}

uint64_t __94__UIViewController__windowControllerBasedDismissViewControllerWithTransition_from_completion___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPresentedStatusBarViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setPresentedUserInterfaceStyleViewController:", 0);
}

- (void)dismissModalViewControllerAnimated:(BOOL)animated
{
  uint64_t v3;

  if (animated)
    v3 = 9;
  else
    v3 = 0;
  -[UIViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", v3, 0);
}

void __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_3;
  v3[3] = &unk_1E16BAFE8;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[1] = 3221225472;
  v4 = v2;
  v5 = *(_BYTE *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v3);

}

void __61__UIViewController_dismissViewControllerAnimated_completion___block_invoke_3(uint64_t a1)
{
  -[UIViewController _performCoordinatedPresentOrDismiss:animated:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (void)_didCancelPresentTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "_isPresentation") && !_UIAppUseModernRotationAndPresentationBehaviors())
  {
    objc_msgSend(v8, "fromViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customTransitioningView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:aboveSubview:", v7, v5);

    objc_msgSend(v5, "removeFromSuperview");
  }
  -[UIViewController _restoreInputViewsForPresentation](self, "_restoreInputViewsForPresentation");
  *(_QWORD *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  -[UIViewController _cleanupPresentation](self, "_cleanupPresentation");

}

- (void)_legacyModalPresentTransitionDidComplete
{
  _DWORD *v3;
  _BOOL8 v4;
  void *v5;

  if ((*(_QWORD *)&self->_viewControllerFlags & 0x200) == 0)
  {
    -[UIViewController currentAction](self, "currentAction");
    v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = v3[4] != 0;
    else
      v4 = 0;

    -[UIViewController viewDidDisappear:](self, "viewDidDisappear:", v4);
    -[UIViewController childModalViewController](self, "childModalViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewDidAppear:", v4);

  }
  -[UIViewController _didFinishPresentTransition](self, "_didFinishPresentTransition");
}

- (void)_didFinishDismissTransition
{
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
  id v13;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!_UIAppUseModernRotationAndPresentationBehaviors() && objc_msgSend(v13, "_isModalSheet"))
  {
    objc_msgSend(v13, "dropShadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v13, "setDropShadowView:", 0);

  }
  -[UIViewController customTransitioningView](self, "customTransitioningView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = _UIAppUseModernRotationAndPresentationBehaviors();

    if (!v6)
    {
      -[UIViewController customTransitioningView](self, "customTransitioningView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController customTransitioningView](self, "customTransitioningView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:aboveSubview:", v9, v10);

      -[UIViewController customTransitioningView](self, "customTransitioningView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[UIViewController setCustomTransitioningView:](self, "setCustomTransitioningView:", 0);
    }
  }
  objc_msgSend(v13, "_setModalSourceViewController:", 0);
  objc_msgSend(v13, "_setSegueResponsibleForModalPresentation:", 0);
  *(_QWORD *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  -[UIViewController _cleanupPresentation](self, "_cleanupPresentation");
  -[UIViewController _popoverController](self, "_popoverController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_containedViewControllerModalStateChanged");

}

- (void)_cleanupPresentation
{
  UIViewControllerAction *currentAction;
  void *v4;
  id v5;

  -[UIViewController childModalViewController](self, "childModalViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _removeChildModalViewController:]((id *)&self->super.super.isa, v5);
  currentAction = self->_currentAction;
  self->_currentAction = 0;

  -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateOfSupportedInterfaceOrientations");

  -[UIViewController _setPresentationController:](self, "_setPresentationController:", 0);
  -[UIViewController _setOriginalPresentationController:](self, "_setOriginalPresentationController:", 0);

}

- (void)_didCancelDismissTransition:(id)a3
{
  UIViewControllerAction *currentAction;

  *(_QWORD *)&self->_viewControllerFlags &= 0xFFFFFFFFFFBFFFEFLL;
  currentAction = self->_currentAction;
  self->_currentAction = 0;

}

- (UISheetPresentationController)sheetPresentationController
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  UIModalPresentationStyle v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = -[UIViewController modalPresentationStyle](self, "modalPresentationStyle");
    if (self->_temporaryPresentationController)
      v9 = 1;
    else
      v9 = (unint64_t)v8 > 0x10;
    if (!v9 && ((1 << v8) & 0x10006) != 0)
    {
      if (-[UIViewController _requiresCustomPresentationController](self, "_requiresCustomPresentationController"))
      {
        -[UIViewController _customPresentationControllerForPresentedController:presentingController:sourceController:](self, "_customPresentationControllerForPresentedController:presentingController:sourceController:", self, 0, self);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPresentedViewController:presentingViewController:", self, 0);
      }
      v12 = (void *)v11;
      -[UIViewController _setTemporaryPresentationController:](self, "_setTemporaryPresentationController:", v11);

    }
    -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIViewController _temporaryPresentationController](self, "_temporaryPresentationController");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v3, "_originalPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();

  if ((v6 & 1) == 0)
    goto LABEL_18;
  objc_msgSend(v4, "_originalPresentationController");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v15 = (void *)v7;
LABEL_19:

  return (UISheetPresentationController *)v15;
}

- (void)_clearCachedPopoverContentSize
{
  id v2;

  -[UIViewController popoverPresentationController:](self, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_clearCachedPopoverContentSize");

}

- (BOOL)providesPresentationContextTransitionStyle
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 19) & 1;
}

- (void)setProvidesPresentationContextTransitionStyle:(BOOL)providesPresentationContextTransitionStyle
{
  uint64_t v3;

  v3 = 0x80000;
  if (!providesPresentationContextTransitionStyle)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v3;
}

+ (id)_viewControllerForFullScreenPresentationFromView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController.m"), 11325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  objc_msgSend(v5, "_viewControllerForAncestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_popoverController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 || (objc_msgSend(v9, "rootViewController"), (v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v8, "presentedViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        v13 = v12;

        objc_msgSend(v13, "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v13;
      }
      while (v12);
    }
    else
    {
      v13 = v8;
    }
    objc_msgSend(v13, "_existingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v10)
    {
      v8 = v13;
    }
    else
    {
      NSLog(CFSTR("%@'s window is not equal to %@'s view's window!"), v5, v13);
      v8 = 0;
    }

  }
  return v8;
}

- (void)_handleTapToDismissModalCurl:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 3)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v6, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

  }
}

- (BOOL)_shouldAutoPinInputViewsForModalFormSheet
{
  return 1;
}

+ (double)durationForTransition:(int)a3
{
  double result;

  +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", *(_QWORD *)&a3);
  return result;
}

- (void)_showViewController:(id)a3 withAction:(SEL)a4 sender:(id)a5
{
  UIViewController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = (UIViewController *)a5;
  -[UIViewController targetViewControllerForAction:sender:](self, "targetViewControllerForAction:sender:", a4, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    if (v8)
      self = v8;
    if (dyld_program_sdk_at_least())
      objc_msgSend(v10, a4, v12, self);
    else
      objc_msgSend(v10, sel_performSelector_withObject_withObject_, a4, v12, self);
    goto LABEL_9;
  }
  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "presentViewController:animated:completion:", v12, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
LABEL_9:

  }
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
  -[UIViewController _showViewController:withAction:sender:](self, "_showViewController:withAction:sender:", vc, a2, sender);
}

- (void)showDetailViewController:(UIViewController *)vc sender:(id)sender
{
  -[UIViewController _showViewController:withAction:sender:](self, "_showViewController:withAction:sender:", vc, a2, sender);
}

- (id)_nextViewController
{
  void *v3;
  void *v4;

  -[UIViewController _parentViewController]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIViewController _popoverController](self, "_popoverController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_managingSplitViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (UIViewController)targetViewControllerForAction:(SEL)action sender:(id)sender
{
  id v6;
  UIViewController *v7;
  void *v8;

  v6 = sender;
  if (-[UIViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", action, v6)
    && objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", action))
  {
    v7 = self;
  }
  else
  {
    -[UIViewController _nextViewController](self, "_nextViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetViewControllerForAction:sender:", action, v6);
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __100__UIViewController__sendViewWillTransitionToSizeToPresentationController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldFreezeUnderlapsStatusBar");
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 368);
    *(_QWORD *)(v3 + 368) = v4 | 0x10000000000;
    v5 = (v4 >> 40) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 40), "viewWillTransitionToSize:withTransitionCoordinator:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (v2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) & 0xFFFFFEFFFFFFFFFFLL | ((unint64_t)(v5 & 1) << 40);
  return result;
}

- (void)unregisterPreviewing:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "unregister");
  -[NSMutableArray removeObject:](self->_previewSourceViews, "removeObject:", v4);

}

- (void)registerPreviewSourceView:(id)a3 previewingDelegate:(id)a4
{
  id v4;

  v4 = -[UIViewController registerForPreviewingWithDelegate:sourceView:](self, "registerForPreviewingWithDelegate:sourceView:", a4, a3);
}

- (void)unregisterPreviewSourceView:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_previewSourceViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "sourceView", (_QWORD)v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[UIViewController unregisterPreviewing:](self, "unregisterPreviewing:", v12);
    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

+ (void)_sendPrepareForTapGesture:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_opt_self();
  objc_msgSend(v6, "_viewControllerForAncestor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    do
    {
      if ((objc_msgSend(v4, "canPerformAction:withSender:", sel__prepareForTapGesture_, v6) & 1) != 0)
        break;
      objc_msgSend(v4, "_nextViewController");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "_prepareForTapGesture:", v6);

}

- (void)_prepareForTapGesture:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_previewSourceViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "sourceView", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isDescendantOfView:", v10);

        if (v11)
        {
          +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setSampleRate:", 1.0);

          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)previewActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)previewActionItems
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIViewController previewMenuItems](self, "previewMenuItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "_subitems");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10
            && (v11 = (void *)v10,
                objc_msgSend(v9, "_subitems"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "count"),
                v12,
                v11,
                v13))
          {
            +[UIPreviewActionGroup _actionGroupWithPreviewMenuItemWithSubactions:](UIPreviewActionGroup, "_actionGroupWithPreviewMenuItemWithSubactions:", v9);
            v14 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[UIPreviewAction _actionWithPreviewMenuItem:](UIPreviewAction, "_actionWithPreviewMenuItem:", v9);
            v14 = objc_claimAutoreleasedReturnValue();
          }
          v15 = (void *)v14;
          if (v14)
            objc_msgSend(v3, "addObject:", v14);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v18;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v16;
}

- (id)leadingPreviewAction
{
  return 0;
}

- (id)trailingPreviewAction
{
  return 0;
}

- (id)previewMenuItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController previewActions](self, "previewActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        +[UIPreviewMenuItem itemWithViewControllerPreviewAction:](UIPreviewMenuItem, "itemWithViewControllerPreviewAction:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_viewControllersForRotationCallbacks
{
  UIViewController *parentViewController;
  void *v4;
  UIViewController *v5;
  uint64_t v6;
  void *v7;
  UIViewController *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  parentViewController = self->_parentViewController;
  if (parentViewController)
  {
    -[UIViewController _viewControllersForRotationCallbacks](parentViewController, "_viewControllersForRotationCallbacks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self;
    -[UIViewController presentedViewController](v5, "presentedViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        v8 = v7;

        -[UIViewController presentedViewController](v8, "presentedViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v8;
      }
      while (v7);
    }
    else
    {
      v8 = v5;
    }
    v9 = -[UIViewController modalPresentationStyle](v8, "modalPresentationStyle");
    objc_msgSend(v4, "addObject:", v8);
    if (v9)
    {
      -[UIViewController presentingViewController](v8, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "modalPresentationStyle");
      if (v10)
      {
        while (1)
        {
          v12 = v9;
          v9 = v11;
          objc_msgSend(v10, "_existingView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if (v9 != v12 || (unint64_t)(v12 - 1) >= 2)
            {
              objc_msgSend(v4, "addObject:", v10);
              if (!v9)
                break;
            }
          }
          objc_msgSend(v10, "presentingViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v15, "modalPresentationStyle");
          v10 = v15;
          if (!v15)
            goto LABEL_17;
        }

      }
    }
LABEL_17:

  }
  return v4;
}

- (void)_beginDisablingInterfaceAutorotation
{
  void *v2;
  id v3;

  -[UIViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginDisablingInterfaceAutorotation");

}

- (void)_endDisablingInterfaceAutorotation
{
  void *v2;
  id v3;

  -[UIViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDisablingInterfaceAutorotation");

}

- (BOOL)_isInterfaceAutorotationDisabled
{
  void *v2;
  void *v3;
  char v4;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInterfaceAutorotationDisabled");

  return v4;
}

- (void)_updateInterfaceOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  int64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v3 = a3;
  -[UIViewController _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIScene _systemShellOwnsInterfaceOrientation](v6);

  if ((v7 & 1) != 0)
  {
    if (v3)
    {
      -[UIViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56__UIViewController__updateInterfaceOrientationAnimated___block_invoke;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    }
  }
  else
  {
    v8 = -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](self, "_preferredInterfaceOrientationGivenCurrentOrientation:", -[UIViewController interfaceOrientation](self, "interfaceOrientation"));
    -[UIViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateToInterfaceOrientation:animated:", v8, v3);

  }
}

uint64_t __56__UIViewController__updateInterfaceOrientationAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (BOOL)_allowsAutorotation
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 12) & 1;
}

+ (BOOL)_doesOverrideLegacyShouldAutorotateMethod
{
  return objc_msgSend(a1, "doesOverrideViewControllerMethod:", sel_shouldAutorotateToInterfaceOrientation_);
}

uint64_t __54__UIViewController_attemptRotationToDeviceOrientation__block_invoke()
{
  return +[UIViewController attemptRotationToDeviceOrientation](UIViewController, "attemptRotationToDeviceOrientation");
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
  void *v2;
  void *v3;
  UIInterfaceOrientation v4;

  -[UIViewController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "_windowInterfaceOrientation");
    if (v4 == UIInterfaceOrientationUnknown)
      v4 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v3);
  }
  else
  {
    v4 = UIInterfaceOrientationPortrait;
  }

  return v4;
}

- (uint64_t)_preferredInterfaceOrientationForPresentationInWindow:(uint64_t)a3 fromInterfaceOrientation:
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    a3 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v5, "_windowCanDynamicallySpecifySupportedInterfaceOrientations"))
  {
    if (objc_msgSend(a1, "_hasPreferredInterfaceOrientationForPresentation")
      && _UIViewControllerIsBeingPresentedOrDismissesFullscreen(a1))
    {
      v7 = objc_msgSend(a1, "preferredInterfaceOrientationForPresentation");
      v8 = objc_msgSend(a1, "supportedInterfaceOrientations");
      if (v7 > 4 || (v9 = v8, (v8 & qword_18667A9D8[v7]) != 0))
      {
        a3 = v7;
        goto LABEL_19;
      }
      v10 = _preferredInterfaceOrientationForPresentationInWindow_fromInterfaceOrientation____s_category;
      if (!_preferredInterfaceOrientationForPresentationInWindow_fromInterfaceOrientation____s_category)
      {
        v10 = __UILogCategoryGetNode("Orientation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&_preferredInterfaceOrientationForPresentationInWindow_fromInterfaceOrientation____s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        _UIInterfaceOrientationDebugDescription(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _UIInterfaceOrientationMaskDebugDescription(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "preferredInterfaceOrientationForPresentation '%@' must match a supported interface orientation: '%@'!", (uint8_t *)&v20, 0x16u);

      }
    }
    if ((objc_msgSend(v6, "isInterfaceAutorotationDisabled") & 1) == 0)
    {
      if (objc_msgSend(a1, "shouldAutorotate"))
      {
        v15 = objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate");
        objc_msgSend(v6, "windowScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = objc_msgSend(v16, "interfaceOrientation");

        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "orientation");

        if ((unint64_t)(v18 - 1) <= 3 && (!v15 || (objc_msgSend(a1, "_isModalSheet") & 1) == 0))
          a3 = v18;
      }
    }
    a3 = objc_msgSend(a1, "_preferredInterfaceOrientationGivenCurrentOrientation:", a3);
  }
LABEL_19:

  return a3;
}

+ (BOOL)_allViewControllersInArray:(id)a3 allowAutorotationToInterfaceOrientation:(int64_t)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__UIViewController__allViewControllersInArray_allowAutorotationToInterfaceOrientation_predicate___block_invoke;
  v11[3] = &unk_1E16C2170;
  v9 = v8;
  v13 = &v15;
  v14 = a4;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  LOBYTE(a4) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __97__UIViewController__allViewControllersInArray_allowAutorotationToInterfaceOrientation_predicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if (objc_msgSend((id)objc_opt_class(), "_doesOverrideLegacyShouldAutorotateMethod"))
    return -[UIViewController shouldAutorotateToInterfaceOrientation:](self, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    return a3 == 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  _BOOL4 v5;

  if (objc_msgSend((id)objc_opt_class(), "_doesOverrideLegacyShouldAutorotateMethod"))
  {
    LOBYTE(v5) = toInterfaceOrientation == UIInterfaceOrientationPortrait;
  }
  else
  {
    v5 = -[UIViewController _allowsAutorotation](self, "_allowsAutorotation");
    if (v5)
      LOBYTE(v5) = -[UIViewController _isSupportedInterfaceOrientation:](self, "_isSupportedInterfaceOrientation:", toInterfaceOrientation);
  }
  return v5;
}

- (void)_setInterfaceOrientationOnModalRecursively:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    objc_msgSend(a1, "setInterfaceOrientation:", a2);
    objc_msgSend(a1, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "childModalViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v8)
    {
      objc_msgSend(a1, "childModalViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[UIViewController _setInterfaceOrientationOnModalRecursively:](v9, a2);

    }
  }
}

- (CGPoint)_centerForOrientation:(int64_t)a3
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
  double v13;
  double v14;
  uint64_t v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint8_t v30[16];
  uint8_t buf[16];
  CGPoint result;

  -[UIViewController _window](self, "_window", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "self.window should be non-nil", buf, 2u);
      }

    }
    else
    {
      v27 = _centerForOrientation____s_category;
      if (!_centerForOrientation____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&_centerForOrientation____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "self.window should be non-nil", v30, 2u);
      }
    }
  }
  _UIAppStatusBarHeightForWindow(v4);
  v6 = v5;
  if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    objc_msgSend(v4, "_referenceFrameFromSceneUsingScreenBounds:", v6 != 0.0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    if (v4)
      v15 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v4);
    else
      v15 = 0;
    v16 = v6 != 0.0;
    -[UIViewController _screen](self, "_screen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultStatusBarHeightInOrientation:", 1);
    v20 = v19;

    objc_msgSend(v17, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", v15, v16, v20);
    v8 = v21;
    v10 = v22;
    v12 = v23;
    v14 = v24;

  }
  v25 = v8 + v12 * 0.5;
  v26 = v10 + v14 * 0.5;
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGRect)_boundsForOrientation:(int64_t)a3
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
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  __int16 v35[8];
  uint8_t buf[16];
  CGRect result;

  -[UIViewController _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v34, OS_LOG_TYPE_FAULT, "self.window should be non-nil", buf, 2u);
      }

    }
    else
    {
      v32 = _boundsForOrientation____s_category;
      if (!_boundsForOrientation____s_category)
      {
        v32 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v32, (unint64_t *)&_boundsForOrientation____s_category);
      }
      v33 = *(NSObject **)(v32 + 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35[0] = 0;
        _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "self.window should be non-nil", (uint8_t *)v35, 2u);
      }
    }
  }
  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  _UIAppStatusBarHeightForWindow(v5);
  v12 = v11;
  if (objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle"))
  {
    objc_msgSend(v5, "_referenceFrameFromSceneUsingScreenBounds:", v12 != 0.0);
    v14 = v13;
    v16 = v15;
  }
  else
  {
    if (v5)
      v17 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v5);
    else
      v17 = 0;
    v18 = v12 != 0.0;
    -[UIViewController _screen](self, "_screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultStatusBarHeightInOrientation:", 1);
    v22 = v21;

    objc_msgSend(v19, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", v17, v18, v22);
    v14 = v23;
    v16 = v24;

  }
  v25 = _UIAppUseModernRotationAndPresentationBehaviors();
  if ((unint64_t)(a3 - 3) >= 2)
    v26 = v16;
  else
    v26 = v14;
  if ((unint64_t)(a3 - 3) >= 2)
    v27 = v14;
  else
    v27 = v16;
  if (!v25)
  {
    v16 = v26;
    v14 = v27;
  }

  v28 = v8;
  v29 = v10;
  v30 = v14;
  v31 = v16;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)_willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  UIViewController *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v16[6];
  BOOL v17;

  if (-[UIViewController _shouldFreezeUnderlapsStatusBar](self, "_shouldFreezeUnderlapsStatusBar"))
    *(_QWORD *)&self->_viewControllerFlags |= 0x10000000000uLL;
  if (!a6)
  {
    -[UIViewController setInWillRotateCallback:](self, "setInWillRotateCallback:", 1);
    -[UIViewController willRotateToInterfaceOrientation:duration:](self, "willRotateToInterfaceOrientation:duration:", a3, a4);
  }
  v11 = self;
  if (!-[UIViewController childViewControllersCount](v11, "childViewControllersCount")
    || (-[UIViewController _existingView](v11, "_existingView"), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    if (a6)
      return;
LABEL_12:
    -[UIViewController setInWillRotateCallback:](v11, "setInWillRotateCallback:", 0);
    return;
  }
  v13 = (void *)v12;
  -[UIViewController _existingView](v11, "_existingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");

  if ((v15 & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__UIViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
    v16[3] = &__block_descriptor_49_e30_v24__0__UIViewController_8_B16l;
    v16[4] = a3;
    *(double *)&v16[5] = a4;
    v17 = a5;
    -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v11, 1, v16);
  }
  if (!a6)
    goto LABEL_12;
}

void __98__UIViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "_willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v5, "_forwardRotationMethods"), *(_BYTE *)(a1 + 48) == 0, v4);

}

- (void)window:(id)a3 willRotateToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8;
  void *v9;
  id v10;
  UIView *savedFooterSuperview;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  UIView *savedHeaderSuperview;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v8 = a3;
  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 1);
  if (a5 > 0.0 && (objc_msgSend(v8, "isUsingOnePartRotationAnimation") & 1) == 0)
  {
    -[UIViewController rotatingFooterViewForWindow:](self, "rotatingFooterViewForWindow:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    savedFooterSuperview = self->_savedFooterSuperview;
    self->_savedFooterSuperview = 0;

    if (v10 != v8)
    {
      objc_storeStrong((id *)&self->_savedFooterSuperview, v10);
      objc_msgSend(v9, "center");
      objc_msgSend(v8, "convertPoint:fromView:", v10);
      objc_msgSend(v9, "setCenter:");
      -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "transform");
      }
      else
      {
        v26 = 0u;
        v27 = 0u;
        v25 = 0u;
      }
      v24[0] = v25;
      v24[1] = v26;
      v24[2] = v27;
      objc_msgSend(v9, "setTransform:", v24);

      objc_msgSend(v8, "addSubview:", v9);
    }
    -[UIViewController rotatingHeaderViewForWindow:](self, "rotatingHeaderViewForWindow:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    savedHeaderSuperview = self->_savedHeaderSuperview;
    self->_savedHeaderSuperview = 0;

    if (v15 != v8)
    {
      objc_storeStrong((id *)&self->_savedHeaderSuperview, v15);
      objc_msgSend(v14, "center");
      objc_msgSend(v8, "convertPoint:fromView:", v15);
      objc_msgSend(v14, "setCenter:");
      -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "transform");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
      }
      v20[0] = v21;
      v20[1] = v22;
      v20[2] = v23;
      objc_msgSend(v14, "setTransform:", v20);

      objc_msgSend(v8, "addSubview:", v14);
    }

  }
  -[UIViewController viewControllerForRotation](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_willRotateToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v19, "_forwardRotationMethods"), 0, a5);

}

- (BOOL)shouldWindowUseOnePartInterfaceRotationAnimation:(id)a3
{
  void *v3;
  char v4;

  -[UIViewController viewControllerForRotation](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shouldUseOnePartRotation");

  return v4;
}

- (BOOL)_shouldUseOnePartRotation
{
  char v2;
  int v3;

  v2 = objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_willAnimateRotationToInterfaceOrientation_duration_);
  if ((objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_willAnimateFirstHalfOfRotationToInterfaceOrientation_duration_) & 1) != 0)LOBYTE(v3) = 0;
  else
    v3 = objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_willAnimateSecondHalfOfRotationFromInterfaceOrientation_duration_) ^ 1;
  return v3 | v2;
}

- (void)window:(id)a3 resizeFromOrientation:(int64_t)a4
{
  id v6;
  float v7;
  float v8;
  void *v9;
  unsigned int v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  double v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float v46;
  float v47;
  float v48;
  float v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v6 = a3;
  v7 = 0.0;
  v8 = 0.0;
  if (objc_msgSend(v6, "interfaceOrientation") != 1)
  {
    if (objc_msgSend(v6, "interfaceOrientation") == 4)
    {
      v8 = -1.5708;
    }
    else if (objc_msgSend(v6, "interfaceOrientation") == 3)
    {
      v8 = 1.5708;
    }
    else if (objc_msgSend(v6, "interfaceOrientation") == 2)
    {
      v8 = 3.1416;
    }
    else
    {
      v8 = 0.0;
    }
  }
  if (a4 != 1)
  {
    switch(a4)
    {
      case 3:
        v7 = 1.5708;
        break;
      case 4:
        v7 = -1.5708;
        break;
      case 2:
        v7 = 3.1416;
        break;
      default:
        v7 = 0.0;
        break;
    }
  }
  -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "autoresizingMask");
  -[UIViewController _screen](self, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = (float)-v7;
  +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v20);
  v58.origin.x = v13;
  v58.origin.y = v15;
  v58.size.width = v17;
  v58.size.height = v19;
  v59 = CGRectApplyAffineTransform(v58, &v57);
  width = v59.size.width;
  height = v59.size.height;
  +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", (float)-v8, v59.origin.y);
  v60.origin.x = v13;
  v60.origin.y = v15;
  v60.size.width = v17;
  v60.size.height = v19;
  v61 = CGRectApplyAffineTransform(v60, &v56);
  v23 = v61.size.width;
  v24 = v61.size.height;
  objc_msgSend(v9, "center", v61.origin.x, v61.origin.y);
  v26 = v25;
  v28 = v27;
  +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v20);
  v29 = v54 + v26 * v50 + v28 * v52;
  v30 = v55 + v26 * v51 + v28 * v53;
  *(float *)&v29 = v29;
  v49 = *(float *)&v29;
  objc_msgSend(v9, "bounds");
  v32 = v31;
  v34 = v33;
  v48 = v34;
  v35 = width;
  v36 = v23;
  adjustOffsetAndDimension(&v49, &v48, v10 & 7, v35, v36);
  v37 = v30;
  v38 = v32;
  v46 = v38;
  v47 = v37;
  v39 = height;
  v40 = v24;
  adjustOffsetAndDimension(&v47, &v46, (v10 >> 3) & 7, v39, v40);
  v42 = v49;
  v41 = v47;
  +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v8);
  objc_msgSend(v9, "setCenter:", vaddq_f64(v45, vaddq_f64(vmulq_n_f64(v43, v42), vmulq_n_f64(v44, v41))));
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v48, v46);

}

- (void)_willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4 forwardToChildControllers:(BOOL)a5 skipSelf:(BOOL)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  UIViewController *v14;
  _QWORD v15[6];
  BOOL v16;

  if (!a6)
    -[UIViewController willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
  v14 = self;
  if (-[UIViewController childViewControllersCount](v14, "childViewControllersCount")
    && (-[UIViewController _existingView](v14, "_existingView"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    -[UIViewController _existingView](v14, "_existingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHidden");

    if ((v13 & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __107__UIViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke;
      v15[3] = &__block_descriptor_49_e30_v24__0__UIViewController_8_B16l;
      v15[4] = a3;
      *(double *)&v15[5] = a4;
      v16 = a5;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v14, 1, v15);
    }
  }
  else
  {

  }
}

void __107__UIViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "_willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v5, "_forwardRotationMethods"), *(_BYTE *)(a1 + 48) == 0, v4);

}

- (void)window:(id)a3 willAnimateRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8;
  id dropShadowView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t viewControllerFlags;
  _BOOL8 v22;
  BOOL v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD v36[3];

  v8 = a3;
  dropShadowView = self->_dropShadowView;
  if (dropShadowView)
  {
    objc_msgSend(dropShadowView, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v18 = -[UIViewController _lastKnownInterfaceOrientation](self, "_lastKnownInterfaceOrientation");
  self->_lastKnownInterfaceOrientation = a4;
  -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v8);
  v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIViewController viewControllerForRotation](self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "_useSheetRotation"))
  {
    viewControllerFlags = (uint64_t)self->_viewControllerFlags;

    if ((viewControllerFlags & 0x100) == 0)
    {
      -[UIViewController window:resizeFromOrientation:](self, "window:resizeFromOrientation:", v8, v18);
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (v19
    && (v19[13] & 0x400000000000000) != 0
    && (objc_msgSend(v19, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    objc_msgSend(v8, "_setNeedsUpdateConstraints");
  }
  else
  {
    -[UIViewController _centerForOrientation:](self, "_centerForOrientation:", a4);
    objc_msgSend(v19, "setCenter:");
    -[UIViewController _boundsForOrientation:](self, "_boundsForOrientation:", a4);
    objc_msgSend(v19, "setBounds:");
  }
LABEL_12:
  memset(v36, 0, sizeof(v36));
  -[UIViewController getRotationContentSettings:forWindow:](self, "getRotationContentSettings:forWindow:", v36, v8);
  v22 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  if (LOBYTE(v36[0]))
    v23 = BYTE3(v36[0]) == 0;
  else
    v23 = 0;
  v24 = !v23 && v22;
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v24);
  objc_msgSend(v19, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v22);
  -[UIViewController viewControllerForRotation](self);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_willAnimateRotationToInterfaceOrientation:duration:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v26, "_forwardRotationMethods"), 0, a5);
  v27 = self->_dropShadowView;
  if (v27)
  {
    objc_msgSend(v27, "bounds");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
  }
  else
  {
    v29 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(v27, "willBeginRotationWithOriginalBounds:newBounds:", v11, v13, v15, v17, v29, v31, v33, v35);

}

- (void)window:(id)a3 willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  void *v8;
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
  double v24;
  double v25;
  double v26;
  id v27;

  if (a5 > 0.0)
  {
    -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v10 = v9;
    v12 = v11;
    -[UIViewController _centerForOrientation:](self, "_centerForOrientation:", a4);
    objc_msgSend(v8, "setCenter:", v10 + (v13 - v10) * 0.5, v12 + (v14 - v12) * 0.5);
    objc_msgSend(v8, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[UIViewController _boundsForOrientation:](self, "_boundsForOrientation:", a4);
    objc_msgSend(v8, "setBounds:", v16 + (v23 - v16) * 0.5, v18 + (v24 - v18) * 0.5, v20 + (v25 - v20) * 0.5, v22 + (v26 - v22) * 0.5);
    objc_msgSend(v8, "layoutIfNeeded");

  }
  -[UIViewController viewControllerForRotation](self);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:", a4, a5);

}

- (void)window:(id)a3 didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a4
{
  id v5;

  -[UIViewController viewControllerForRotation](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didAnimateFirstHalfOfRotationToInterfaceOrientation:", a4);

}

- (void)window:(id)a3 willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a4 duration:(double)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v8 = a3;
  v9 = objc_msgSend(v8, "interfaceOrientation");
  -[UIViewController _setInterfaceOrientationOnModalRecursively:](self, v9);
  -[UIViewController rotatingContentViewForWindow:](self, "rotatingContentViewForWindow:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[UIViewController _centerForOrientation:](self, "_centerForOrientation:", v9);
  objc_msgSend(v11, "setCenter:");
  -[UIViewController _boundsForOrientation:](self, "_boundsForOrientation:", v9);
  objc_msgSend(v11, "setBounds:");
  objc_msgSend(v11, "layoutIfNeeded");
  -[UIViewController viewControllerForRotation](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:", a4, a5);

}

- (void)_didRotateFromInterfaceOrientation:(int64_t)a3 forwardToChildControllers:(BOOL)a4 skipSelf:(BOOL)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  UIViewController *v12;
  _QWORD v13[5];
  BOOL v14;

  *(_QWORD *)&self->_viewControllerFlags &= ~0x10000000000uLL;
  if (!a5)
    -[UIViewController didRotateFromInterfaceOrientation:](self, "didRotateFromInterfaceOrientation:", a3);
  v12 = self;
  if (-[UIViewController childViewControllersCount](v12, "childViewControllersCount")
    && (-[UIViewController _existingView](v12, "_existingView"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    -[UIViewController _existingView](v12, "_existingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isHidden");

    if ((v11 & 1) == 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __90__UIViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke;
      v13[3] = &__block_descriptor_41_e30_v24__0__UIViewController_8_B16l;
      v13[4] = a3;
      v14 = a4;
      -[UIViewController _enumerateVisibleChildControllers:includePresentedChildren:usingBlock:](v12, 1, v13);
    }
  }
  else
  {

  }
}

void __90__UIViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:", v3, objc_msgSend(v4, "_forwardRotationMethods"), *(_BYTE *)(a1 + 40) == 0);

}

- (void)window:(id)a3 didRotateFromInterfaceOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIView *savedFooterSuperview;
  BOOL v11;
  UIView *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  UIView *savedHeaderSuperview;
  BOOL v17;
  UIView *v18;
  void *v19;
  void *v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v6 = a3;
  objc_msgSend(self->_dropShadowView, "didFinishRotation");
  -[UIViewController rotatingFooterViewForWindow:](self, "rotatingFooterViewForWindow:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  savedFooterSuperview = self->_savedFooterSuperview;
  if (savedFooterSuperview)
    v11 = v8 == (_QWORD)savedFooterSuperview;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v7, "center");
    objc_msgSend(v9, "convertPoint:toView:", self->_savedFooterSuperview);
    objc_msgSend(v7, "setCenter:");
    if (v9)
    {
      objc_msgSend(v9, "transform");
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
    }
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    objc_msgSend(v7, "setTransform:", v25);
    -[UIView addSubview:](self->_savedFooterSuperview, "addSubview:", v7);
    v12 = self->_savedFooterSuperview;
    self->_savedFooterSuperview = 0;

    objc_msgSend(v7, "layoutIfNeeded");
  }
  -[UIViewController rotatingHeaderViewForWindow:](self, "rotatingHeaderViewForWindow:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  savedHeaderSuperview = self->_savedHeaderSuperview;
  if (savedHeaderSuperview)
    v17 = v14 == (_QWORD)savedHeaderSuperview;
  else
    v17 = 1;
  if (!v17)
  {
    objc_msgSend(v13, "center");
    objc_msgSend(v15, "convertPoint:toView:", self->_savedHeaderSuperview);
    objc_msgSend(v13, "setCenter:");
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
    }
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v24;
    objc_msgSend(v13, "setTransform:", v21);
    -[UIView addSubview:](self->_savedHeaderSuperview, "addSubview:", v13);
    v18 = self->_savedHeaderSuperview;
    self->_savedHeaderSuperview = 0;

    objc_msgSend(v13, "layoutIfNeeded");
  }
  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNeedsDisplay");

  objc_msgSend((id)UIApp, "setIgnoresInteractionEvents:", 0);
  -[UIViewController viewControllerForRotation](self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_didRotateFromInterfaceOrientation:forwardToChildControllers:skipSelf:", a4, objc_msgSend(v20, "_forwardRotationMethods"), 0);

}

- (BOOL)_handlesCounterRotationForPresentation
{
  return 0;
}

- (void)_willBeginCounterRotationForPresentation
{
  UITraitCollection *v3;
  UITraitCollection *frozenTraitCollection;

  *((_WORD *)&self->_viewControllerFlags + 4) |= 0x40u;
  if (-[UIViewController _handlesCounterRotationForPresentation](self, "_handlesCounterRotationForPresentation"))
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    frozenTraitCollection = self->_frozenTraitCollection;
    self->_frozenTraitCollection = v3;

  }
}

- (void)_didEndCounterRotationForPresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _UIViewControllerNullAnimationTransitionCoordinator *v7;
  _UIViewControllerNullAnimationTransitionCoordinator *v8;
  UITraitCollection *frozenTraitCollection;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _UIViewControllerNullAnimationTransitionCoordinator *v14;

  *((_WORD *)&self->_viewControllerFlags + 4) &= ~0x40u;
  if (-[UIViewController _handlesCounterRotationForPresentation](self, "_handlesCounterRotationForPresentation"))
  {
    -[UIViewController traitCollection](self, "traitCollection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewController _parentTraitEnvironment](self, "_parentTraitEnvironment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_traitCollectionForChildEnvironment:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _traitCollectionByApplyingOverridesFromParentViewControllerToTraitCollection:](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController _traitCollectionByApplyingLocalOverridesToTraitCollection:]((uint64_t)self, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v10 && (objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
    {
      v7 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__UIViewController__didEndCounterRotationForPresentation__block_invoke;
      v11[3] = &unk_1E16B51E8;
      v11[4] = self;
      v12 = v10;
      v13 = v6;
      v14 = v7;
      v8 = v7;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v11);
      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v8, "_runAlongsideAnimations");
      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](v8, "_runAlongsideCompletionsAfterCommit");

    }
    frozenTraitCollection = self->_frozenTraitCollection;
    self->_frozenTraitCollection = 0;

    -[UIViewController _updateTraitsIfNecessary](self, "_updateTraitsIfNecessary");
  }
}

uint64_t __57__UIViewController__didEndCounterRotationForPresentation__block_invoke(uint64_t *a1)
{
  void *v2;
  _BOOL4 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    v5 = _UIInternalPreference_ZoomPreemptionInAllApps_block_invoke_8___s_category;
    if (!_UIInternalPreference_ZoomPreemptionInAllApps_block_invoke_8___s_category)
    {
      v5 = __UILogCategoryGetNode("TraitCollectionChange", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_UIInternalPreference_ZoomPreemptionInAllApps_block_invoke_8___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      +[UITraitCollection _descriptionForChangeFromTraitCollection:toTraitCollection:](UITraitCollection, "_descriptionForChangeFromTraitCollection:toTraitCollection:", a1[5], a1[6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[5];
      v12 = a1[6];
      v13 = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v13, 0x34u);

    }
  }
  return objc_msgSend((id)a1[4], "willTransitionToTraitCollection:withTransitionCoordinator:", a1[6], a1[7]);
}

- (void)_applyContentUnavailableConfiguration:(void *)a1
{
  id v3;
  uint64_t v4;
  _UIContentUnavailableWrapperView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[4];
  _UIContentUnavailableWrapperView *v16;
  id v17;
  id v18;
  id location;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "_contentUnavailableWrapperView");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (_UIContentUnavailableWrapperView *)v4;
    if (v3 && !v4)
    {
      v5 = -[_UIContentUnavailableWrapperView initWithViewController:]([_UIContentUnavailableWrapperView alloc], "initWithViewController:", a1);
      objc_msgSend(a1, "set_contentUnavailableWrapperView:", v5);
    }
    if (v5)
    {
      -[UIView superview](v5, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        objc_msgSend(a1, "view");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          -[UIView _backing_addPrivateSubview:positioned:relativeTo:](v8, v5, -1, 0);

      }
    }
    -[_UIContentUnavailableWrapperView configuration](v5, "configuration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v3;
    v12 = v11;
    if (v10 != v11)
    {
      if (v3 && v10)
      {
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_21;
      }
      else
      {

      }
      -[_UIContentUnavailableWrapperView setConfiguration:](v5, "setConfiguration:", v12);
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
      {
        objc_initWeak(&location, a1);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __58__UIViewController__applyContentUnavailableConfiguration___block_invoke;
        v15[3] = &unk_1E16B7270;
        objc_copyWeak(&v18, &location);
        v16 = v5;
        v17 = v10;
        +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v15);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        -[_UIContentUnavailableWrapperView configuration](v5, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          -[UIView removeFromSuperview](v5, "removeFromSuperview");
          objc_msgSend(a1, "set_contentUnavailableWrapperView:", 0);
        }
      }
      goto LABEL_21;
    }

LABEL_21:
  }

}

void __58__UIViewController__applyContentUnavailableConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_contentUnavailableWrapperView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);

    WeakRetained = v9;
    if (v6 == v7)
    {
      if (a3)
        objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v9;
      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
        objc_msgSend(v9, "set_contentUnavailableWrapperView:", 0);
        WeakRetained = v9;
      }
    }
  }

}

- (void)_executeContentUnavailableConfigurationUpdate
{
  void *v2;
  void *v3;
  void *v4;
  char *v5;
  _BYTE v6[352];
  _BYTE __dst[352];
  _OWORD __src[22];

  if (a1)
  {
    objc_msgSend(a1, "contentUnavailableConfigurationState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    objc_msgSend(a1, "contentUnavailableConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updatedConfigurationForState:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController _applyContentUnavailableConfiguration:](a1, v4);
    objc_msgSend(a1, "updateContentUnavailableConfigurationUsingState:", v2);
    objc_msgSend(a1, "_updateContentUnavailableConfigurationUsingState:", v2);
    objc_msgSend(a1, "_bridgedUpdateContentUnavailableConfigurationUsingState:", v2);
    memcpy(v6, __src, sizeof(v6));
    v5 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v5, sizeof(__dst));
    memcpy(v5, v6, 0x160uLL);
    -[UIViewController _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)a1, (uint64_t)&__dst[136], objc_msgSend(a1, "methodForSelector:", sel_updateContentUnavailableConfigurationUsingState_), sel_setNeedsUpdateContentUnavailableConfiguration);
    _UITraitUsageTrackingResultDestroy((uint64_t)__dst);

  }
}

- (void)_setNeedsStatusBarAppearanceUpdateWithAnimationParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (id)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  v6 = (void *)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  _CurrentStatusBarAppearanceUpdateAnimationParameters = (uint64_t)v4;
  v8 = v4;

  -[UIViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v7 = (void *)_CurrentStatusBarAppearanceUpdateAnimationParameters;
  _CurrentStatusBarAppearanceUpdateAnimationParameters = (uint64_t)v5;

}

- (BOOL)sendClientToHostAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIViewController *v9;
  UIViewController *v10;

  v4 = a3;
  -[UIViewController _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    self = (UIViewController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendActions:", self);
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "rootViewController");
    v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    if (v9 == self)
    {
      v8 = 0;
    }
    else
    {
      v10 = v9;
      v8 = -[UIViewController sendClientToHostAction:](v9, "sendClientToHostAction:", v4);
      self = v10;
    }
  }

  return v8;
}

- (BOOL)prefersPointerLocked
{
  return 0;
}

- (id)_effectivePointerLockViewController
{
  void *v3;
  void *v4;
  int IsAvailableForScene;
  void *v6;
  UIViewController *v7;
  void *v8;

  -[UIViewController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsAvailableForScene = _UIPointerLockStateIsAvailableForScene(v4);

  if (IsAvailableForScene)
  {
    -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_effectivePointerLockViewController");
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIViewController childViewControllerForPointerLock](self, "childViewControllerForPointerLock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_effectivePointerLockViewController");
      v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        v7 = self;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t __56__UIViewController_setNeedsUpdateOfPrefersPointerLocked__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsUpdateOfPrefersPointerLocked");
}

void __56__UIViewController_setNeedsUpdateOfPrefersPointerLocked__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "pointerLockState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_preferredPointerLockStatusUpdated");

  }
}

- (UIViewController)childViewControllerForPointerLock
{
  return 0;
}

- (id)_multitaskingDragExclusionRects
{
  return (id)MEMORY[0x1E0C9AA60];
}

uint64_t __67__UIViewController__setNeedsUpdateOfMultitaskingDragExclusionRects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setNeedsUpdateOfMultitaskingDragExclusionRects");
}

void __67__UIViewController__setNeedsUpdateOfMultitaskingDragExclusionRects__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "_systemAppearanceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMultitaskingDragExclusionRects");

}

- (id)_effectiveViewControllerForMultitaskingDragExclusionRects
{
  void *v3;
  UIViewController *v4;
  void *v5;

  -[UIViewController _presentedStatusBarViewController](self, "_presentedStatusBarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveViewControllerForMultitaskingDragExclusionRects");
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIViewController _childViewControllerForMultitaskingDragExclusionRects](self, "_childViewControllerForMultitaskingDragExclusionRects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_effectiveViewControllerForMultitaskingDragExclusionRects");
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = self;
  }
  return v4;
}

- (id)_childViewControllerForMultitaskingDragExclusionRects
{
  return 0;
}

- (id)defaultPNGName
{
  return 0;
}

- (void)_setSearchDisplayController:(int)a3 retain:
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id obj;

  v5 = a2;
  if (!a1)
    goto LABEL_17;
  obj = v5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 216));

  v5 = obj;
  v7 = *(_QWORD *)(a1 + 368);
  if (WeakRetained == obj)
  {
    if ((v7 & 0x2000) != 0 || !a3)
    {
      if ((v7 & 0x2000) == 0 || (a3 & 1) != 0)
        goto LABEL_14;
      v10 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = 0;
    }
    else
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 216));
      v10 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v11;
    }
  }
  else
  {
    if ((v7 & 0x2000) != 0)
    {
      v8 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = 0;

    }
    objc_storeWeak((id *)(a1 + 216), obj);
    v5 = obj;
    if (!a3)
      goto LABEL_14;
    v9 = obj;
    v10 = *(void **)(a1 + 224);
    *(_QWORD *)(a1 + 224) = v9;
  }

  v5 = obj;
LABEL_14:
  v12 = 0x2000;
  if (!a3)
    v12 = 0;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a1 + 368) & 0xFFFFFFFFFFFFDFFFLL | v12;
LABEL_17:

}

- (void)setSearchDisplayController:(id)a3
{
  -[UIViewController _setSearchDisplayController:retain:]((uint64_t)self, a3, 1);
}

- (void)_setSearchDisplayControllerUnretained:(id)a3
{
  -[UIViewController _setSearchDisplayController:retain:]((uint64_t)self, a3, 0);
}

- (BOOL)searchBarHidNavBar
{
  void *v2;
  void *v3;
  char v4;

  -[UIViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "searchBarHidNavBar");
  else
    v4 = 0;

  return v4;
}

- (void)setSearchBarHidNavBar:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setSearchBarHidNavBar:", v3);
    v4 = v5;
  }

}

- (id)_lastNavigationItems
{
  return 0;
}

- (BOOL)isMovingFromParentViewController
{
  BOOL result;
  void *v6;

  if ((*(_QWORD *)&self->_viewControllerFlags & 0x100000000200000) == 0
    || (*(_QWORD *)&self->_viewControllerFlags & 0x2000000) == 0)
  {
    return 0;
  }
  if (!dyld_program_sdk_at_least())
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 3 < 0xFFFFFFFE;
  -[UIViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return ((*(_DWORD *)&self->_viewControllerFlags >> 1) & 3u) - 3 < 0xFFFFFFFE;
  result = 0;
  *(_QWORD *)&self->_viewControllerFlags &= ~0x2000000uLL;
  return result;
}

- (id)keyCommands
{
  NSArray *interfaceBuilderKeyCommands;
  NSArray *addedKeyCommands;
  NSArray *v5;

  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  addedKeyCommands = self->_addedKeyCommands;
  if (!interfaceBuilderKeyCommands)
    return addedKeyCommands;
  if (addedKeyCommands)
  {
    -[NSArray arrayByAddingObjectsFromArray:](interfaceBuilderKeyCommands, "arrayByAddingObjectsFromArray:");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = interfaceBuilderKeyCommands;
  }
  return v5;
}

- (id)_keyCommands
{
  NSArray *v3;
  NSArray *v4;
  NSArray *interfaceBuilderKeyCommands;
  void *v6;
  void *v7;
  uint64_t v8;

  -[UIViewController keyCommands](self, "keyCommands");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  interfaceBuilderKeyCommands = self->_interfaceBuilderKeyCommands;
  if (interfaceBuilderKeyCommands)
  {
    if (v3)
    {
      -[NSArray lastObject](v3, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray lastObject](self->_interfaceBuilderKeyCommands, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        -[NSArray arrayByAddingObjectsFromArray:](self->_interfaceBuilderKeyCommands, "arrayByAddingObjectsFromArray:", v4);
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (NSArray *)v8;
      }
    }
    else
    {
      v4 = interfaceBuilderKeyCommands;
    }
  }
  return v4;
}

- (void)_setKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceBuilderKeyCommands, a3);
}

- (BOOL)_allowNestedNavigationControllers
{
  return 0;
}

- (int64_t)_verticalSizeClass
{
  void *v2;
  int64_t v3;

  -[UIViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass");

  return v3;
}

- (BOOL)_isMemberOfViewControllerHierarchy:(id)a3
{
  UIViewController *v4;
  uint64_t v5;
  UIViewController *v6;
  BOOL i;
  UIViewController *v8;

  v4 = (UIViewController *)a3;
  if (self == v4)
  {
    i = 1;
  }
  else
  {
    -[UIViewController parentViewController](self, "parentViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (UIViewController *)v5;
    for (i = v5 != 0; v6 != v4 && v6; i = v6 != 0)
    {
      v8 = v6;
      -[UIViewController parentViewController](v6, "parentViewController");
      v6 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    }
  }

  return i;
}

- (id)_focusFallbackScroller
{
  return 0;
}

- (BOOL)restoresFocusAfterTransition
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t);
  void *v13;
  UIViewController *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (*(_QWORD *)&self->_viewControllerFlags >> 46) & 3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __48__UIViewController_restoresFocusAfterTransition__block_invoke;
  v13 = &unk_1E16B2268;
  v14 = self;
  v4 = v11;
  if (v3 == 2)
  {
    v6 = 1;
  }
  else if (v3 == 1)
  {
    v6 = 0;
  }
  else if (v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v3;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
      }

    }
    else
    {
      v7 = _UITriStateToBool___s_category_0;
      if (!_UITriStateToBool___s_category_0)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_UITriStateToBool___s_category_0);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v16 = v3;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Found an invalid tri state of %tu. This is an indication of corrupted memory.", buf, 0xCu);
      }
    }
    v6 = v12((uint64_t)v4);
  }
  else
  {
    -[UIViewController _focusBehavior](self, "_focusBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "viewControllerPresentationRestoresLastFocusedItem");

  }
  return v6;
}

uint64_t __48__UIViewController_restoresFocusAfterTransition__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_focusBehavior");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "viewControllerPresentationRestoresLastFocusedItem");

  return v2;
}

- (BOOL)_canRestoreFocusAfterTransitionToItem:(id)a3
{
  id v5;
  char IsFocusedOrFocusable;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 14349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__UIViewController__canRestoreFocusAfterTransitionToItem___block_invoke;
  v9[3] = &unk_1E16C2418;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v5, v9);
  if (*((_BYTE *)v15 + 24) && *((_BYTE *)v11 + 24))
    IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v5);
  else
    IsFocusedOrFocusable = 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return IsFocusedOrFocusable;
}

void __58__UIViewController__canRestoreFocusAfterTransitionToItem___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "restoresFocusAfterTransition")
    || _IsKindOfUIView((uint64_t)v6)
    && ((objc_msgSend(v6, "isHidden") & 1) != 0 || (objc_msgSend(v6, "alpha"), v5 == 0.0)))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *a3 = 1;
  }
  if ((id)a1[4] == v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (id)__potentialOverridingFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[UIViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "presented"))
  {
    objc_msgSend(v5, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[UIViewController _childViewControllersEligibleForOverridingPreferredFocusEnvironments](self, "_childViewControllersEligibleForOverridingPreferredFocusEnvironments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "_existingView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_window");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v3, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v3;
}

- (id)_overridingPreferredFocusEnvironment
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__60;
  v14 = __Block_byref_object_dispose__60;
  v15 = 0;
  v16[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UIViewController__overridingPreferredFocusEnvironment__block_invoke;
  v9[3] = &unk_1E16C2440;
  v9[4] = self;
  v9[5] = &v10;
  _UITreeBreadthFirstTraversal(v3, sel___potentialOverridingFocusEnvironments, v9);

  v4 = (void *)v11[5];
  if (!v4)
  {
    -[UIViewController _retrievePresentingFocusedItemOrRemoveIfNotFocusable](self);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

    v4 = (void *)v11[5];
  }
  v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __56__UIViewController__overridingPreferredFocusEnvironment__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activePresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "presented"))
  {
    if ((objc_msgSend(v7, "_isPresentedInFullScreen") & 1) != 0
      || (objc_msgSend(v7, "presentingViewController"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = *(void **)(a1 + 32),
          v8,
          v8 == v9))
    {
      if ((objc_msgSend(v7, "_allowsFocusInPresentingViewController") & 1) == 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
        *a3 = 1;
      }
    }
  }
  else
  {
    -[UIViewController _retrievePresentingFocusedItemOrRemoveIfNotFocusable](v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
      *a3 = 1;
    }

  }
  return 1;
}

- (id)_retrievePresentingFocusedItemOrRemoveIfNotFocusable
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char IsFocusedOrFocusable;

  if (!a1)
    goto LABEL_14;
  objc_msgSend(a1, "_presentingFocusedItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v2)
  {
    v2 = v2;
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      v5 = objc_msgSend(a1, "_canRestoreFocusAfterTransitionToItem:", v2);

      if ((v5 & 1) != 0)
        return v2;
      goto LABEL_13;
    }
    if (objc_msgSend(a1, "restoresFocusAfterTransition"))
    {
      objc_msgSend(a1, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (_UIFocusEnvironmentIsAncestorOfEnvironment(v6, v2))
      {
        IsFocusedOrFocusable = _UIFocusItemIsFocusedOrFocusable(v2);

        if ((IsFocusedOrFocusable & 1) != 0)
          return v2;
        goto LABEL_13;
      }

    }
LABEL_13:

    objc_msgSend(a1, "_setPresentingFocusedItem:", 0);
LABEL_14:
    v2 = 0;
  }
  return v2;
}

- (NSString)focusGroupIdentifier
{
  int v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
  if (v3 == 2)
  {
    objc_getAssociatedObject(self, &FocusGroupIdentifierKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v4;
  }
  if (v3 == 1)
  {
LABEL_11:
    v4 = 0;
    return (NSString *)v4;
  }
  if (v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v10 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
        v11 = 67109120;
        v12 = v10;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unknown case for _viewControllerFlags.hasFocusGroupIdentifier (%d).", (uint8_t *)&v11, 8u);
      }

    }
    else
    {
      v5 = focusGroupIdentifier___s_category;
      if (!focusGroupIdentifier___s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&focusGroupIdentifier___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_DWORD *)((char *)&self->_viewControllerFlags + 6) & 3;
        v11 = 67109120;
        v12 = v7;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Unknown case for _viewControllerFlags.hasFocusGroupIdentifier (%d).", (uint8_t *)&v11, 8u);
      }
    }
    goto LABEL_11;
  }
  -[UIViewController _systemDefaultFocusGroupIdentifier](self, "_systemDefaultFocusGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v4;
}

- (UIFocusItemContainer)focusItemContainer
{
  void *v2;
  void *v3;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFocusItemContainer *)v3;
}

- (void)setPreferredFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_preferredFocusedItem, a3);
  -[UIViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
}

- (UIView)preferredFocusedView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIViewController preferredFocusedItem](self, "preferredFocusedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIViewController _existingView](self, "_existingView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[UIViewController preferredFocusedView](self, "preferredFocusedView");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v4;
}

- (void)updateFocusIfNeeded
{
  id v2;

  -[UIViewController _focusSystem](self, "_focusSystem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextFocusedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_UIFocusEnvironmentIsAncestorOfEnvironment(v5, v6))
  {
    -[UIViewController _presentationController](self, "_presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[UIViewController _setPresentingFocusedItem:](self, "_setPresentingFocusedItem:", 0);
  }
  else
  {

  }
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 14572, CFSTR("Received call to _didUpdateFocusInContext: outside of a focus update."));

  }
  -[UIViewController didUpdateFocusInContext:withAnimationCoordinator:](self, "didUpdateFocusInContext:withAnimationCoordinator:", v10, v8);

}

- (void)_setNeedsNonDeferredFocusUpdate
{
  void *v3;
  _UIFocusUpdateRequest *v4;

  v4 = -[_UIFocusUpdateRequest initWithEnvironment:]([_UIFocusUpdateRequest alloc], "initWithEnvironment:", self);
  -[_UIFocusUpdateRequest setAllowsDeferral:](v4, "setAllowsDeferral:", 0);
  -[UIViewController _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_requestFocusUpdate:", v4);

}

- (BOOL)_shouldIgnoreChildFocusRegions
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[UIViewController _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsViewTransparency");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[UIViewController presentedViewController](self, "presentedViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIViewController presentedViewController](self, "presentedViewController");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "popoverPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_allowsFocusInPresentingViewController");

      LODWORD(v5) = v7 ^ 1;
    }
    -[UIViewController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      LODWORD(v5) = objc_msgSend(v9, "presented") ^ 1 | v5;

  }
  return v5;
}

- (void)_setPreferredTransition:(id)a3
{
  _UIViewControllerTransition **p_spiTransition;
  id v6;
  id v7;

  p_spiTransition = &self->_spiTransition;
  objc_storeStrong((id *)&self->_spiTransition, a3);
  v6 = a3;
  -[_UIViewControllerTransition _apiTransition](*p_spiTransition, "_apiTransition");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIViewController setPreferredTransition:](self, "setPreferredTransition:", v7);
}

- (void)setPreferredTransition:(id)a3
{
  UIViewControllerTransition *v5;
  UIViewControllerTransition *preferredTransition;
  UIViewControllerTransition *v7;

  v5 = (UIViewControllerTransition *)a3;
  preferredTransition = self->_preferredTransition;
  if (preferredTransition != v5)
  {
    v7 = v5;
    -[UIViewControllerTransition _wasAssignedToViewController:](preferredTransition, "_wasAssignedToViewController:", 0);
    objc_storeStrong((id *)&self->_preferredTransition, a3);
    -[UIViewControllerTransition _wasAssignedToViewController:](self->_preferredTransition, "_wasAssignedToViewController:", self);
    v5 = v7;
  }

}

- (UIView)_showcaseView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  NSClassFromString(CFSTR("QLPreviewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController childViewControllers](self, "childViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "childViewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UIView *)v7;
}

- (double)customNavigationInteractiveTransitionDuration
{
  return self->_customNavigationInteractiveTransitionDuration;
}

- (void)setCustomNavigationInteractiveTransitionDuration:(double)a3
{
  self->_customNavigationInteractiveTransitionDuration = a3;
}

- (double)customNavigationInteractiveTransitionPercentComplete
{
  return self->_customNavigationInteractiveTransitionPercentComplete;
}

- (void)setCustomNavigationInteractiveTransitionPercentComplete:(double)a3
{
  self->_customNavigationInteractiveTransitionPercentComplete = a3;
}

- (UITransitionView)customTransitioningView
{
  return self->_customTransitioningView;
}

- (void)setCustomTransitioningView:(id)a3
{
  objc_storeStrong((id *)&self->_customTransitioningView, a3);
}

- (UITraitCollection)_lastNotifiedTraitCollection
{
  return self->_lastNotifiedTraitCollection;
}

- (double)_navigationControllerContentOffsetAdjustment
{
  return self->_navigationControllerContentOffsetAdjustment;
}

- (void)_setLeftContentMargin:(double)a3
{
  self->_leftContentMargin = a3;
}

- (void)_setRightContentMargin:(double)a3
{
  self->_rightContentMargin = a3;
}

- (void)setInteractionActivityTrackingBaseName:(NSString *)interactionActivityTrackingBaseName
{
  objc_setProperty_nonatomic_copy(self, a2, interactionActivityTrackingBaseName, 568);
}

- (BOOL)_nextResponderIgnoresWindowIfRootVC
{
  return self->_nextResponderIgnoresWindowIfRootVC;
}

- (void)set_nextResponderIgnoresWindowIfRootVC:(BOOL)a3
{
  self->_nextResponderIgnoresWindowIfRootVC = a3;
}

- (UIView)savedHeaderSuperview
{
  return self->_savedHeaderSuperview;
}

- (NSMutableDictionary)_observableScrollViews
{
  return self->_observableScrollViews;
}

- (UIScrollView)_internalContentScrollView
{
  return self->_internalContentScrollView;
}

- (NSMapTable)_effectiveContentScrollViews
{
  return self->_effectiveContentScrollViews;
}

- (UIStoryboardSegue)_segueResponsibleForModalPresentation
{
  return self->_segueResponsibleForModalPresentation;
}

- (void)_setSegueResponsibleForModalPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_segueResponsibleForModalPresentation, a3);
}

- (UIViewController)_sourceViewControllerIfPresentedViaPopoverSegue
{
  return self->_sourceViewControllerIfPresentedViaPopoverSegue;
}

- (void)_setSourceViewControllerIfPresentedViaPopoverSegue:(id)a3
{
  self->_sourceViewControllerIfPresentedViaPopoverSegue = (UIViewController *)a3;
}

- (UIViewController)_modalSourceViewController
{
  return self->_modalSourceViewController;
}

- (UIWindow)_expectedWindow
{
  return self->_expectedWindow;
}

- (void)_setOverrideUseCustomPresentation:(BOOL)a3
{
  self->overrideUseCustomPresentation = a3;
}

- (UIViewController)_presentedUserInterfaceStyleViewController
{
  return self->_presentedUserInterfaceStyleViewController;
}

- (_UIViewControllerTransition)_preferredTransition
{
  return self->_spiTransition;
}

- (UIViewControllerTransition)preferredTransition
{
  return self->_preferredTransition;
}

- (void)setModalPresentationCapturesStatusBarAppearance:(BOOL)modalPresentationCapturesStatusBarAppearance
{
  self->_modalPresentationCapturesStatusBarAppearance = modalPresentationCapturesStatusBarAppearance;
}

- (UIFocusItem)_presentingFocusedItem
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_presentingFocusedItem);
}

- (void)_setPresentingFocusedItem:(id)a3
{
  objc_storeWeak((id *)&self->_presentingFocusedItem, a3);
}

- (void)setNavigationInsetAdjustment:(id)a3
{
  objc_storeStrong((id *)&self->_navigationInsetAdjustment, a3);
}

- (NSArray)storyboardPreviewSegueTemplates
{
  return self->_storyboardPreviewSegueTemplates;
}

- (NSArray)storyboardCommitSegueTemplates
{
  return self->_storyboardCommitSegueTemplates;
}

- (NSArray)storyboardPreviewingRegistrants
{
  return self->_storyboardPreviewingRegistrants;
}

- (UIView)_embeddedView
{
  return self->__embeddedView;
}

- (void)_setEmbeddedView:(id)a3
{
  objc_storeStrong((id *)&self->__embeddedView, a3);
}

- (void)_setEmbeddingView:(id)a3
{
  objc_storeStrong((id *)&self->__embeddingView, a3);
}

- (CGRect)_embeddedViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__embeddedViewFrame.origin.x;
  y = self->__embeddedViewFrame.origin.y;
  width = self->__embeddedViewFrame.size.width;
  height = self->__embeddedViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setEmbeddedViewFrame:(CGRect)a3
{
  self->__embeddedViewFrame = a3;
}

- (void)_setEmbeddedDelegate:(id)a3
{
  self->__embeddedDelegate = (_UIViewControllerContentViewEmbedding *)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_presentationSizeClassPair
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 *p_presentationSizeClassPair;
  int64_t width;
  int64_t height;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_presentationSizeClassPair = &self->_presentationSizeClassPair;
  width = self->_presentationSizeClassPair.width;
  height = p_presentationSizeClassPair->height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (UIView)preferredFocusedItem
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_preferredFocusedItem);
}

- (void)setIgnoresParentMargins:(BOOL)a3
{
  self->_ignoresParentMargins = a3;
}

- (void)set_departingParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->__departingParentViewController, a3);
}

- (UIContainerBackgroundStyle)preferredContainerBackgroundStyle
{
  return self->_preferredContainerBackgroundStyle;
}

- (UIViewController)childViewControllerForPreferredContainerBackgroundStyle
{
  return self->_childViewControllerForPreferredContainerBackgroundStyle;
}

- (BOOL)performsActionsWhilePresentingModally
{
  if (qword_1EDDB1060 != -1)
    dispatch_once(&qword_1EDDB1060, &__block_literal_global_2072);
  return byte_1EDDB0F79;
}

void __76__UIViewController_UIPerformsActions__performsActionsWhilePresentingModally__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("UIViewControllerPerformsActionsWhilePresentingModally"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v4, "BOOLValue");
    else
      v3 = 1;
    v2 = v4;
  }
  else
  {
    v3 = 1;
  }
  byte_1EDDB0F79 = v3;

}

- (UITab)tab
{
  return (UITab *)objc_loadWeakRetained((id *)&self->_tab);
}

- (_UITabElement)_uip_tabElement
{
  return self->_tabElement;
}

- (void)_uip_setTabElement:(id)a3
{
  id WeakRetained;
  _UITabElement *tabElement;
  _UITabElement *v8;
  _UITabElement *v9;
  UIViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _UITabElement *v16;

  v16 = (_UITabElement *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tab);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewController.m"), 14711, CFSTR("Cannot use UITabElement SPI if the view controller already has a tab owner."));

  }
  tabElement = self->_tabElement;
  v8 = v16;
  if (tabElement != v16)
  {
    v9 = tabElement;
    if (v16)
    {
      -[_UITabElement _viewController](v16, "_viewController");
      v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      if (v10 != self)
      {
        -[_UITabElement _viewController](v16, "_viewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_uip_setTabElement:", 0);

      }
      -[_UITabElement _setViewController:](v16, "_setViewController:", self);
    }
    objc_storeStrong((id *)&self->_tabElement, a3);
    -[UIViewController parentViewController](self, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateTabBarItemForViewController:", self);

    if (v9)
      -[_UITabElement _setViewController:](v9, "_setViewController:", 0);
    -[UIViewController _tabElementChangeObserver](self, "_tabElementChangeObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "_viewController:tabElementDidChange:previousElement:", self, v16, v9);

    v8 = v16;
  }

}

- (_UITabBarItemBridgedElement)_fallbackTabElementCreateIfNeeded:(void *)a1
{
  _UITabBarItemBridgedElement *v4;

  if (a1)
  {
    objc_getAssociatedObject(a1, &_UIViewControllerFallbackTabElement);
    v4 = (_UITabBarItemBridgedElement *)objc_claimAutoreleasedReturnValue();
    if (!v4 && a2)
    {
      v4 = -[_UITabBarItemBridgedElement initWithViewController:]([_UITabBarItemBridgedElement alloc], "initWithViewController:", a1);
      objc_setAssociatedObject(a1, &_UIViewControllerFallbackTabElement, v4, (void *)1);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UITabElement)_resolvedTab
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIViewController _uip_tabElement](self, "_uip_tabElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIViewController _fallbackTabElementCreateIfNeeded:](self, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (_UITabElement *)v6;
}

- (_UIViewControllerTabElementObserver)_tabElementChangeObserver
{
  return (_UIViewControllerTabElementObserver *)objc_getAssociatedObject(self, &_UIViewControllerTabElementChangeObserver);
}

- (void)_setTabElementChangeObserver:(id)a3
{
  objc_setAssociatedObject(self, &_UIViewControllerTabElementChangeObserver, a3, 0);
}

- (void)_attachTab:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__attachTab_, a1, CFSTR("UIViewController.m"), 14783, CFSTR("Cannot reuse the same view controller for multiple UITab instances"));

    }
    objc_storeWeak((id *)(a1 + 48), obj);
    v3 = obj;
  }

}

- (id)_moreListTitle
{
  return 0;
}

- (BOOL)_tvTabBarShouldOverlap
{
  return 1;
}

- (BOOL)_tvTabBarShouldAutohide
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[UIViewController tabBarController](self, "tabBarController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[UIViewController tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[UIViewController tabBarController](self, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_displayStyle") == 0;

  return v9;
}

- (id)moreListImage
{
  return 0;
}

- (id)moreListSelectedImage
{
  return 0;
}

- (id)moreListTableCell
{
  return 0;
}

- (UIViewController)separateSecondaryViewControllerForSplitViewController:(UISplitViewController *)splitViewController
{
  return 0;
}

- (void)_toggleEditing:(id)a3
{
  -[UIViewController setEditing:animated:](self, "setEditing:animated:", -[UIViewController isEditing](self, "isEditing", a3) ^ 1, 1);
}

- (BOOL)canHandleSnapbackIdentifier:(id)a3 animated:(BOOL)a4
{
  return 0;
}

- (void)_setSuppressesBottomBar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_viewControllerFlags = *(_QWORD *)&self->_viewControllerFlags & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (double)_topBarHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIViewController view](self, "view", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "origin");
          v12 = v11;
          -[UIViewController _statusBarHeightForCurrentInterfaceOrientation](self, "_statusBarHeightForCurrentInterfaceOrientation");
          if (v12 == v13)
          {
            objc_msgSend(v10, "size");
            v15 = v14;
            -[UIViewController _statusBarHeightForCurrentInterfaceOrientation](self, "_statusBarHeightForCurrentInterfaceOrientation");
            v6 = v15 + v16;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion
{
  UIViewController *v15;
  void *v16;
  void *v17;
  BOOL v18;
  unint64_t v19;
  _QWORD *v20;
  void *v21;
  objc_class *v22;
  UIViewAnimationOptions v23;
  void *v24;
  void *v25;
  void *v26;
  UIViewController *v27;
  UIViewController *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  UIViewController *v36;

  v36 = fromViewController;
  v15 = toViewController;
  v16 = completion;
  v17 = animations;
  v18 = -[UIViewController _forwardAppearanceMethods](self, "_forwardAppearanceMethods");
  v19 = 0x1E0C99000;
  v20 = (_QWORD *)MEMORY[0x1E0C99778];
  if (!v18)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_self();
    v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v22);
    v23 = options;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("-[%@ %@]"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (_QWORD *)MEMORY[0x1E0C99778];
    options = v23;
    v19 = 0x1E0C99000uLL;

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v20, CFSTR("Parent view controller is using legacy containment in call to %@"), v26);
  }
  -[UIViewController parentViewController](v15, "parentViewController");
  v27 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if (v27 != self)
  {

LABEL_6:
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_opt_self();
    v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("-[%@ %@]"), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v19 + 3488), "raise:format:", *v20, CFSTR("Children view controllers %@ and %@ must have a common parent view controller when calling %@"), v36, v15, v33);
    goto LABEL_7;
  }
  -[UIViewController parentViewController](v36, "parentViewController");
  v28 = (UIViewController *)objc_claimAutoreleasedReturnValue();

  if (v28 != self)
    goto LABEL_6;
LABEL_7:
  -[UIViewController view](v36, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](v15, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _transitionFromView:toView:duration:options:animations:completion:](duration, (uint64_t)UIView, v34, v35, options, v17, v16);

}

- (BOOL)_hackFor11408026_beginAppearanceTransition:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int64_t explicitAppearanceTransitionLevel;
  uint64_t viewControllerFlags;
  uint64_t v9;

  v4 = a4;
  v5 = a3;
  explicitAppearanceTransitionLevel = self->_explicitAppearanceTransitionLevel;
  self->_explicitAppearanceTransitionLevel = explicitAppearanceTransitionLevel + 1;
  if (explicitAppearanceTransitionLevel >= 1)
  {
    if (((((*(_QWORD *)&self->_viewControllerFlags & 0x4000000) == 0) ^ a3) & 1) != 0)
      return 0;
    self->_explicitAppearanceTransitionLevel = 1;
  }
  viewControllerFlags = (uint64_t)self->_viewControllerFlags;
  if ((viewControllerFlags & 0x8000000) != 0)
    return 0;
  v9 = 0x4000000;
  if (!a3)
    v9 = 0;
  *((_WORD *)&self->_viewControllerFlags + 4) = *((_WORD *)&self->_viewControllerFlags + 4);
  *(_QWORD *)&self->_viewControllerFlags = viewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v9;
  -[UIViewController setInAnimatedVCTransition:](self, "setInAnimatedVCTransition:", a4);
  if (v5)
    -[UIViewController __viewWillAppear:](self, "__viewWillAppear:", v4);
  else
    -[UIViewController __viewWillDisappear:]((uint64_t)self, v4);
  return 1;
}

- (BOOL)_hackFor11408026_endAppearanceTransition
{
  return -[UIViewController _endAppearanceTransition:]((uint64_t)self, 0);
}

- (void)cancelBeginAppearanceTransition
{
  uint64_t v3;
  int v4;

  v3 = -[UIViewController isInAnimatedVCTransition](self, "isInAnimatedVCTransition");
  self->_explicitAppearanceTransitionLevel = 0;
  *(_QWORD *)&self->_viewControllerFlags &= ~0x4000000uLL;
  -[UIViewController setAfterAppearanceBlock:](self, "setAfterAppearanceBlock:", 0);
  -[UIViewController setInAnimatedVCTransition:](self, "setInAnimatedVCTransition:", 0);
  v4 = (*(_DWORD *)&self->_viewControllerFlags >> 1) & 3;
  if (v4 == 3)
  {
    -[UIViewController __viewWillAppear:](self, "__viewWillAppear:", v3);
    -[UIViewController __viewDidAppear:](self, "__viewDidAppear:", v3);
  }
  else if (v4 == 1)
  {
    -[UIViewController __viewWillDisappear:]((uint64_t)self, v3);
    -[UIViewController __viewDidDisappear:]((uint64_t)self, v3);
  }
}

- (BOOL)_isContainmentChanging
{
  return (*(_QWORD *)&self->_viewControllerFlags >> 25) & 1;
}

- (id)_restorationClassName
{
  return objc_getAssociatedObject(self, &kViewControllerRestorationClassKey);
}

- (id)restorationClass
{
  NSString *v2;
  NSString *v3;
  NSString *v4;

  -[UIViewController _restorationClassName](self, "_restorationClassName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v2 = (NSString *)NSClassFromString(v2);
  v4 = v2;

  return v4;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  _UIStoryboardProxy *v16;
  void *v17;
  objc_super v18;

  v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIViewController;
  -[UIResponder encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v4);
  -[UIViewController childModalViewController](self, "childModalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_restorationIdentifierPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_existingPresentationControllerImmediate:effective:", 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 && v8 && objc_msgSend(v8, "_shouldSavePresentedViewControllerForStateRestoration"))
    {
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: Presented view controller is %@: %@"), "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v7, v6);
      objc_msgSend(v6, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (_UIStateRestorationDebugLogEnabled())
        NSLog(CFSTR("%s: PresentationController is %@"), "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v10, "delegate"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v11,
            (isKindOfClass & 1) != 0))
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Presentation is a popover for old UIPopoverController, not saving to maintain compatibility with previous iOS before 8"), "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]");
      }
      else
      {
        -[NSCoder encodeObject:forKey:](v4, "encodeObject:forKey:", v6, CFSTR("kPresentedViewControllerKey"));
      }

    }
    else
    {
      objc_msgSend(v6, "_existingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (_UIStateRestorationDebugLogEnabled())
          NSLog(CFSTR("%s: Presented view controller is in window, but doesn't have a restoration identifier and/or the presentation controller doesn't support state restoration, so skipping it and marking that we should ignore snapshot: %@"), "-[UIViewController(StateRestoration) encodeRestorableStateWithCoder:]", v6);
        objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
      }
    }

  }
  -[UIViewController storyboard](self, "storyboard");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[_UIStoryboardProxy initWithStoryboard:]([_UIStoryboardProxy alloc], "initWithStoryboard:", v15);
    -[NSCoder encodeObject:forKey:](v4, "encodeObject:forKey:", v16, CFSTR("UIStateRestorationViewControllerStoryboard"));
    -[UIViewController storyboardIdentifier](self, "storyboardIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[NSCoder encodeObject:forKey:](v4, "encodeObject:forKey:", v17, CFSTR("UIStateRestorationViewControllerStoryboardIdentifier"));

  }
}

- (void)_presentViewControllerForStateRestoration:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id WeakRetained;
  int v7;
  int v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverController);
  if (WeakRetained)
    v7 = 1;
  else
    v7 = objc_msgSend(v9, "_isDelayingPresentation");
  v8 = v7 | v4;

  if (v8)
  {
    -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__UIViewController_StateRestoration___presentViewControllerForStateRestoration_animated___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v10[4] = self;
    v11 = v9;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v10);

  }
}

void __89__UIViewController_StateRestoration___presentViewControllerForStateRestoration_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_window");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateStatusBarAppearance");

}

- (id)_decodeRestorableStateAndReturnContinuationWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  UIViewController *v11;

  v4 = a3;
  -[UIResponder decodeRestorableStateWithCoder:](self, "decodeRestorableStateWithCoder:", v4);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPresentedViewControllerKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Decoded presented view controller %@"), "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]", v5);
  if (v5)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    v10 = v5;
    v11 = self;
    v6 = _Block_copy(aBlock);
    v7 = _Block_copy(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  int8x16_t v13;

  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Completion for view controller state restoration handling presented view controller %@"), "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]_block_invoke", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_existingView");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 40), "_existingView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "window"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v5))
  {
    v6 = objc_msgSend(v5, "isHidden");
    objc_msgSend(v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v5);
    if (objc_msgSend(v7, "horizontalSizeClass") == 2 && (unint64_t)(v8 - 5) >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle") != 3)
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle") == 6 ? 1 : v6;
        if ((v9 & 1) == 0)
        {
LABEL_19:
          if (objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle") == 3
            || objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle") == 6)
          {
            objc_msgSend(v5, "setNeedsLayout");
            objc_msgSend(v5, "layoutIfNeeded");
          }
          objc_msgSend(*(id *)(a1 + 40), "_presentViewControllerForStateRestoration:animated:", *(_QWORD *)(a1 + 32), 0);
          goto LABEL_17;
        }
      }
    }
    else if ((v6 & 1) == 0)
    {
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(0, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalSizeClass");
    v5 = 0;
  }
  if (_UIStateRestorationDebugLogEnabled())
    NSLog(CFSTR("%s: Warning - State Restoration for UIViewController has presented view controller, but view controller is either not in a window, or the window is hidden, or we have a current context presentation which needs to be deferred until after layout has run. Deferring presentation which might cause flashing when presentation is made after a turn of the run loop:\nself: %@, presented view controller: %@"), "-[UIViewController(StateRestoration) _decodeRestorableStateAndReturnContinuationWithCoder:]_block_invoke", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_2;
  block[3] = &unk_1E16B1B50;
  v11 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_17:
}

void __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_3;
    v6[3] = &unk_1E16B2E68;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v6);

  }
  else
  {
    objc_msgSend(v3, "_presentViewControllerForStateRestoration:animated:", *(_QWORD *)(a1 + 40), 1);
  }
}

uint64_t __91__UIViewController_StateRestoration___decodeRestorableStateAndReturnContinuationWithCoder___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewControllerForStateRestoration:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)_shouldLoadViewDuringRestoration:(id)a3
{
  return 1;
}

- (void)_unembedContentViewSettingDelegate:(id)a3
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
  id v16;

  v4 = a3;
  -[UIViewController _setEmbeddingView:](self, "_setEmbeddingView:", 0);
  -[UIViewController _setEmbeddedDelegate:](self, "_setEmbeddedDelegate:", v4);

  -[UIViewController _embeddedView](self, "_embeddedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIViewController view](self, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIViewController _embeddedView](self, "_embeddedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[UIViewController _embeddedView](self, "_embeddedView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setView:](self, "setView:", v15);

    -[UIViewController _setEmbeddedView:](self, "_setEmbeddedView:", 0);
  }
}

- (void)_embedContentViewInView:(id)a3 withContentFrame:(CGRect)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGRect v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = a3;
  v11 = a5;
  -[UIViewController _setEmbeddedDelegate:](self, "_setEmbeddedDelegate:", v11);
  -[UIViewController _setEmbeddedViewFrame:](self, "_setEmbeddedViewFrame:", x, y, width, height);
  if (-[UIViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (v22)
    {
      -[UIViewController _embeddedView](self, "_embeddedView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[UIViewController _embeddedView](self, "_embeddedView");
      else
        -[UIViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      objc_msgSend(v22, "setFrame:");

      -[UIViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertSubview:belowSubview:", v22, v17);

      objc_msgSend(v22, "addSubview:", v13);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      if (CGRectIsEmpty(v23))
      {
        objc_msgSend(v22, "frame");
        x = v18;
        y = v19;
        width = v20;
        height = v21;
      }
      objc_msgSend(v13, "setFrame:", x, y, width, height);
      -[UIViewController _setEmbeddedView:](self, "_setEmbeddedView:", v13);
      -[UIViewController setView:](self, "setView:", v22);
      -[UIViewController _setEmbeddingView:](self, "_setEmbeddingView:", 0);

    }
    else
    {
      -[UIViewController _unembedContentViewSettingDelegate:](self, "_unembedContentViewSettingDelegate:", v11);
    }
  }
  else
  {
    -[UIViewController _setEmbeddedView:](self, "_setEmbeddedView:", 0);
    -[UIViewController _setEmbeddingView:](self, "_setEmbeddingView:", v22);
  }

}

- (void)_unembedContentView
{
  -[UIViewController _unembedContentViewSettingDelegate:](self, "_unembedContentViewSettingDelegate:", 0);
}

- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  return 0;
}

- (void)_setOverrideTransitioningDelegate:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[UIViewController _overrideTransitioningDelegate](self, "_overrideTransitioningDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_overrideTransitioningDelegate, a3);
    -[UIViewController _setTemporaryPresentationController:](self, "_setTemporaryPresentationController:", 0);
  }

}

- (int64_t)_rotatingFromInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIViewController _existingView](self, "_existingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "_fromWindowOrientation");
    if (v4 == objc_msgSend(v3, "_toWindowOrientation"))
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_navigationBarForDragAffordance
{
  return 0;
}

- (BOOL)_isSplitViewController
{
  return 0;
}

- (void)_showAccessibilityHUDItem:(id)a3
{
  UIAccessibilityHUDView *accessibilityHUD;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  UIAccessibilityHUDView *v9;
  void *v10;
  UIAccessibilityHUDView *v11;
  UIAccessibilityHUDView *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UIAccessibilityHUDView *v23;
  void *v24;
  void *v25;
  UIAccessibilityHUDView *v26;
  void *v27;
  id v28;

  v28 = a3;
  accessibilityHUD = self->_accessibilityHUD;
  if (!accessibilityHUD)
  {
    v11 = -[UIAccessibilityHUDView initWithHUDItem:]([UIAccessibilityHUDView alloc], "initWithHUDItem:", v28);
    v12 = self->_accessibilityHUD;
    self->_accessibilityHUD = v11;

    -[UIViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_isHostedInAnotherProcess");

    if ((v16 & 1) == 0)
    {
      +[UIAccessibilityHUDWindow sharedWindow](UIAccessibilityHUDWindow, "sharedWindow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[UIViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "windowScene");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAccessibilityHUDWindow createSharedWindowWithScene:](UIAccessibilityHUDWindow, "createSharedWindowWithScene:", v20);

      }
      +[UIAccessibilityHUDWindow sharedWindow](UIAccessibilityHUDWindow, "sharedWindow");
      v21 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v21;
    }
    objc_msgSend(v8, "setHidden:", 0);
    objc_msgSend(v8, "addSubview:", self->_accessibilityHUD);
    +[UIAccessibilityHUDPositionManager sharedInstance](UIAccessibilityHUDPositionManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self->_accessibilityHUD;
    -[UIViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "adjustViewPropertiesForHUD:withReferenceView:", v23, v24);

    +[UIAccessibilityHUDPositionManager sharedInstance](UIAccessibilityHUDPositionManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_accessibilityHUD;
    -[UIViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginManagingPositionOfHUD:withReferenceView:", v26, v27);

    -[UIAccessibilityHUDView showAnimated:completion:](self->_accessibilityHUD, "showAnimated:completion:", 1, 0);
    goto LABEL_9;
  }
  -[UIAccessibilityHUDView item](accessibilityHUD, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v28, "isEqual:", v5);

  v7 = v28;
  if ((v6 & 1) == 0)
  {
    -[UIAccessibilityHUDView setItem:](self->_accessibilityHUD, "setItem:", v28);
    +[UIAccessibilityHUDPositionManager sharedInstance](UIAccessibilityHUDPositionManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_accessibilityHUD;
    -[UIViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustViewPropertiesForHUD:withReferenceView:", v9, v10);

LABEL_9:
    v7 = v28;
  }

}

- (void)_dismissAccessibilityHUD
{
  void *v3;
  UIAccessibilityHUDView *v4;
  id v5;
  UIAccessibilityHUDView *v6;
  UIAccessibilityHUDView *accessibilityHUD;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  UIAccessibilityHUDView *v12;
  id v13;

  -[UIView window](self->_accessibilityHUD, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_accessibilityHUD;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__UIViewController_AccessibilityHUD___dismissAccessibilityHUD__block_invoke;
  v11 = &unk_1E16B1B50;
  v12 = v4;
  v13 = v3;
  v5 = v3;
  v6 = v4;
  -[UIAccessibilityHUDView dismissAnimated:completion:](v6, "dismissAnimated:completion:", 1, &v8);
  accessibilityHUD = self->_accessibilityHUD;
  self->_accessibilityHUD = 0;

  +[UIAccessibilityHUDWindow removeSharedWindow](UIAccessibilityHUDWindow, "removeSharedWindow", v8, v9, v10, v11);
}

void __62__UIViewController_AccessibilityHUD___dismissAccessibilityHUD__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[UIAccessibilityHUDPositionManager sharedInstance](UIAccessibilityHUDPositionManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopManagingPositionOfHUD:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v3 = *(void **)(a1 + 40);
  +[UIAccessibilityHUDWindow sharedWindow](UIAccessibilityHUDWindow, "sharedWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  UIViewController *v13;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__UIViewController_OrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v8 = v6;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v11);

  v9 = v8;
  return v9;
}

id __97__UIViewController_OrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t IsBeingPresentedOrDismissesFullscreen;
  id result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "_ignoreAppSupportedOrientations"), CFSTR("ignoresAppSupportedOrientations"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "supportedInterfaceOrientations"), CFSTR("providedSupportedOrientations"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "__supportedInterfaceOrientations"), CFSTR("resolvedSupportedOrientations"));
  IsBeingPresentedOrDismissesFullscreen = _UIViewControllerIsBeingPresentedOrDismissesFullscreen(*(void **)(a1 + 40));
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", IsBeingPresentedOrDismissesFullscreen, CFSTR("canPreferOrientation"));
  if ((_DWORD)IsBeingPresentedOrDismissesFullscreen)
    return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:skipIfUnknown:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientationForPresentation"), CFSTR("preferred"), 1);
  return result;
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIViewController _orientationDebugDescriptionBuilderWithMultilinePrefix:](self, "_orientationDebugDescriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_orientationDebugDescription
{
  return -[UIViewController _orientationDebugDescriptionWithMultilinePrefix:](self, "_orientationDebugDescriptionWithMultilinePrefix:", 0);
}

+ (BOOL)_initializedByViewServices
{
  return 1;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "_UUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController _setExtensionContextUUID:](self, "_setExtensionContextUUID:", v4);

}

void __85__UIViewController__UIAlwaysOnEnvironment___effectiveControllersForAlwaysOnTimelines__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_effectiveControllersForAlwaysOnTimelines");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

- (id)_timelinesForDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController performSelector:withObject:](self, "performSelector:withObject:", sel_puic_timelinesForDateInterval_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00F38], "emptyTimelineWithIdentifier:", CFSTR("UIAlwaysOnFallbackTimelineIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_timelinesForDateInterval:(id)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[UIViewController _timelinesForDateInterval:](self, "_timelinesForDateInterval:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[UIViewController _updateWithFrameSpecifier:](self, "_updateWithFrameSpecifier:", a3);
  v6[2]();

}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIViewController performSelector:withObject:](self, "performSelector:withObject:", sel_puic_updateWithFrameSpecifier_, v4);

}

- (void)_willEnterAlwaysOn
{
  id v2;

  -[UIViewController _childViewControllersForAlwaysOnTimelines](self, "_childViewControllersForAlwaysOnTimelines");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_284);

}

uint64_t __62__UIViewController__UIAlwaysOnEnvironment___willEnterAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_willEnterAlwaysOn");
}

- (void)_didEnterAlwaysOn
{
  id v2;

  -[UIViewController _childViewControllersForAlwaysOnTimelines](self, "_childViewControllersForAlwaysOnTimelines");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_38_0);

}

uint64_t __61__UIViewController__UIAlwaysOnEnvironment___didEnterAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_didEnterAlwaysOn");
}

- (void)_willExitAlwaysOn
{
  id v2;

  -[UIViewController _childViewControllersForAlwaysOnTimelines](self, "_childViewControllersForAlwaysOnTimelines");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_39_0);

}

uint64_t __61__UIViewController__UIAlwaysOnEnvironment___willExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_willExitAlwaysOn");
}

- (void)_didExitAlwaysOn
{
  id v2;

  -[UIViewController _childViewControllersForAlwaysOnTimelines](self, "_childViewControllersForAlwaysOnTimelines");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_40_1);

}

uint64_t __60__UIViewController__UIAlwaysOnEnvironment___didExitAlwaysOn__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_didExitAlwaysOn");
}

- (id)_zoomTransitionController
{
  void *v3;

  objc_getAssociatedObject(self, &_UIViewControllerZoomTransitionControllerKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_setAssociatedObject(self, &_UIViewControllerZoomTransitionControllerKey, v3, (void *)1);
  }
  return v3;
}

- (id)_viewContainerForContainerWindowPortalInteraction
{
  return 0;
}

- (id)_nextViewControllerForUnwindSegueSearch
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIViewController _sourceViewControllerIfPresentedViaPopoverSegue](self, "_sourceViewControllerIfPresentedViaPopoverSegue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIViewController _modalSourceViewController](self, "_modalSourceViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[UIViewController parentModalViewController](self, "parentModalViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[UIViewController parentViewController](self, "parentViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  return v5;
}

- (id)_hostedWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowHostingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_allowsStylingSheetsAsCards
{
  return 0;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 0;
}

- (void)_supportedInterfaceOrientationsDidChange
{
  id v2;

  -[UIViewController _rootAncestorViewController](self, "_rootAncestorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (id)_hostApplicationBundleIdentifier
{
  return objc_getAssociatedObject(self, &__hostApplicationBundleIdentifierKey);
}

- (id)_remoteViewControllerProxy
{
  return objc_getAssociatedObject(self, &__remoteViewControllerProxyKey);
}

- (id)_remoteViewControllerProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_remoteViewControllerInterface
{
  return 0;
}

+ (id)_exportedInterface
{
  return 0;
}

- (int)_hostProcessIdentifier
{
  void *v2;
  int v3;

  objc_getAssociatedObject(self, &__hostProcessIdentifierKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_hostAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  id v5;

  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  objc_getAssociatedObject(self, &__hostAuditTokenKey);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!strcmp((const char *)objc_msgSend(v5, "objCType"), "{?=[8I]}"))
    objc_msgSend(v5, "getValue:", retstr);

  return result;
}

- (id)invalidate
{
  void *v2;
  void *v3;

  +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", &__block_literal_global_617);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__UIViewController_ViewService_Internal__invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)_setHostApplicationBundleIdentifier:(id)a3
{
  objc_setAssociatedObject(self, &__hostApplicationBundleIdentifierKey, a3, (void *)0x301);
}

- (void)_setRemoteViewControllerProxy:(id)a3
{
  objc_setAssociatedObject(self, &__remoteViewControllerProxyKey, a3, (void *)0x301);
}

- (void)_setHostProcessIdentifier:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &__hostProcessIdentifierKey, v4, (void *)0x301);

}

- (void)_setHostAuditToken:(id *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{?=[8I]}");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &__hostAuditTokenKey, v4, (void *)0x301);

}

+ (id)XPCInterface
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_1ECD821E8 != -1)
    dispatch_once(&qword_1ECD821E8, &__block_literal_global_25_2);
  objc_msgSend((id)qword_1ECD821E0, "lock");
  objc_getAssociatedObject(a1, &_MergedGlobals_1298);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "_exportedInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_remoteViewControllerInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewServiceViewControllerDeputyXPCInterface interfaceWithExportedInterface:remoteViewControllerInterface:](_UIViewServiceViewControllerDeputyXPCInterface, "interfaceWithExportedInterface:remoteViewControllerInterface:", v4, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, &_MergedGlobals_1298, v3, (void *)0x301);
  }
  objc_msgSend((id)qword_1ECD821E0, "unlock");
  return v3;
}

void __54__UIViewController_ViewService_Internal__XPCInterface__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)qword_1ECD821E0;
  qword_1ECD821E0 = (uint64_t)v0;

}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

@end
