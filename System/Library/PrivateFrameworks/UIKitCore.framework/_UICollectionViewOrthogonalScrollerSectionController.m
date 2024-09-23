@implementation _UICollectionViewOrthogonalScrollerSectionController

- (id)subviewRouterForSection:(id *)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, a2, 1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      v4 = *(void **)(v2 + 2096);
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

- (_QWORD)_scrollViewForSection:(int)a3 createIfNecessary:
{
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  BOOL v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a1[3];
    objc_msgSend(v6, "numberWithInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = 1;
    else
      v10 = a3 == 0;
    if (!v10)
    {
      if (-[_UICollectionViewOrthogonalScrollerSectionController isSectionOrthogonallyScrolling:]((uint64_t)a1, a2))
      {
        WeakRetained = objc_loadWeakRetained(a1 + 2);
        if (WeakRetained)
        {
          v9 = -[_UICollectionViewOrthogonalScrollView initWithCollectionView:section:]([_UICollectionViewOrthogonalScrollView alloc], WeakRetained, a2);
          v12 = (void *)MEMORY[0x1E0CB37E8];
          v13 = a1[3];
          objc_msgSend(v12, "numberWithInteger:", a2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v9, v14);

          objc_msgSend(WeakRetained, "collectionViewLayout");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "_sectionDescriptorForSectionIndex:", a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "setDelegate:", a1);
          -[_UICollectionViewOrthogonalScrollView configureForDescriptor:]((uint64_t)v9, (uint64_t)v16);
          objc_msgSend(WeakRetained, "_subviewRouterForOrthogonalScrollViewAtSection:", a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UICollectionViewSubviewRouter addContainerView:]((uint64_t)v17, v9);
          v18 = objc_loadWeakRetained(a1 + 2);
          if (v18)
          {
            v38 = v16;
            v39 = WeakRetained;
            v40 = a2;
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v19 = a1[5];
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v46 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(v18, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
              }
              while (v21);
            }
            v37 = v17;

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v24 = a1[6];
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v42 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                  objc_msgSend(v29, "_layoutAttributes");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "indexPath");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v31, "length") == 2)
                  {
                    objc_msgSend(v29, "superview");
                    v32 = (id)objc_claimAutoreleasedReturnValue();

                    if (v32 == v18)
                      -[_UICollectionViewOrthogonalScrollerSectionController _placeView:belowOrthogonalScrollViewForSection:]((uint64_t)a1, v29, objc_msgSend(v31, "section"));
                  }

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              }
              while (v26);
            }

            WeakRetained = v39;
            a2 = v40;
            v17 = v37;
            v16 = v38;
          }

        }
        else
        {
          v9 = 0;
        }

        if (!v9)
          return v9;
        goto LABEL_30;
      }
      v9 = 0;
    }
    if (!v9)
      return v9;
LABEL_30:
    if (v9[261] != a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v9[261];
      v36 = objc_loadWeakRetained(a1 + 2);
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__scrollViewForSection_createIfNecessary_, a1, CFSTR("_UICollectionViewOrthogonalScrollerSectionController.m"), 269, CFSTR("UICollectionView internal inconsistency: attempted to retrieve _UICollectionViewOrthogonalScrollView for section %ld but received section %ld. Collection View: %@"), a2, v35, v36);

    }
    return v9;
  }
  return 0;
}

- (void)adjustElementHierarchyOrderingForOrthogonalElementIfNeeded:(void *)a3 layoutAttributes:
{
  _WORD *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11 && a1 && v5 && (v5[144] & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    v7 = WeakRetained;
    if (WeakRetained && (objc_msgSend(WeakRetained, "__hasTransitionLayoutAttributes") & 1) == 0)
    {
      objc_msgSend(v7, "collectionViewLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "_hasOrthogonalScrollingSections"))
      {
        if (objc_msgSend(v8, "_orthogonalScrollingElementShouldAppearAboveForAttributes:", v5))
        {
          objc_msgSend(v7, "bringSubviewToFront:", v11);
          objc_msgSend(a1[5], "addObject:", v11);
        }
        else if (objc_msgSend(v8, "_orthogonalScrollingElementShouldAppearBelowForAttributes:", v5))
        {
          objc_msgSend(a1[6], "addObject:", v11);
          objc_msgSend(v5, "indexPath");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "section");

          -[_UICollectionViewOrthogonalScrollerSectionController _placeView:belowOrthogonalScrollViewForSection:]((uint64_t)a1, v11, v10);
        }
      }

    }
  }

}

- (void)reconfigureScrollViewsForUpdate:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v15 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "collectionViewLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = *(id *)(a1 + 24);
        objc_msgSend(v5, "_orthogonalScrollingSections");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v9;

        if (objc_msgSend(v10, "count") || objc_msgSend(v6, "count"))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __88___UICollectionViewOrthogonalScrollerSectionController_reconfigureScrollViewsForUpdate___block_invoke;
          v16[3] = &unk_1E16BE550;
          v17 = v15;
          v18 = v10;
          v12 = v11;
          v19 = v12;
          v20 = a1;
          objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
          v13 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v12;
          v14 = v12;

        }
      }

    }
  }

}

- (void)layoutScrollViews
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "collectionViewLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "_hasOrthogonalScrollingSections"))
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(*(id *)(a1 + 24), "objectEnumerator");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v20;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v20 != v7)
                objc_enumerationMutation(obj);
              v9 = *(_QWORD **)(*((_QWORD *)&v19 + 1) + 8 * v8);
              if (v9)
                v10 = v9[261];
              else
                v10 = 0;
              objc_msgSend(v3, "_subviewRouterForOrthogonalScrollViewAtSection:", v10);
              v11 = objc_claimAutoreleasedReturnValue();
              v12 = (void *)v11;
              if (v11)
                v13 = *(void **)(v11 + 40);
              else
                v13 = 0;
              v14 = v13;
              objc_msgSend(v9, "superview");
              v15 = (id)objc_claimAutoreleasedReturnValue();

              if (v14 != v15)
                -[_UICollectionViewSubviewRouter addContainerView:]((uint64_t)v12, v9);
              objc_msgSend(v4, "_sectionDescriptorForSectionIndex:", v10);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UICollectionViewOrthogonalScrollView configureForDescriptor:]((uint64_t)v9, (uint64_t)v16);

              ++v8;
            }
            while (v6 != v8);
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            v6 = v17;
          }
          while (v17);
        }

      }
    }

  }
}

- (_QWORD)initWithCollectionView:(_QWORD *)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_UICollectionViewOrthogonalScrollerSectionController;
    v4 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 2, v3);
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = (void *)a1[3];
      a1[3] = v5;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)a1[5];
      a1[5] = v7;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)a1[6];
      a1[6] = v9;

    }
  }

  return a1;
}

- (void)processQueuedScrollViewRemovals
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = a1;
      obj = *(id *)(a1 + 32);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v3)
      {
        v4 = v3;
        v16 = *(_QWORD *)v22;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(obj);
            v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
            v17 = 0u;
            v18 = 0u;
            v19 = 0u;
            v20 = 0u;
            objc_msgSend(v6, "subviews");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v18;
              do
              {
                v11 = 0;
                do
                {
                  if (*(_QWORD *)v18 != v10)
                    objc_enumerationMutation(v7);
                  v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(WeakRetained, "_addControlledSubview:", v12);
                  ++v11;
                }
                while (v9 != v11);
                v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              }
              while (v9);
            }

            objc_msgSend(v6, "setDelegate:", 0);
            objc_msgSend(v6, "removeFromSuperview");
            ++v5;
          }
          while (v5 != v4);
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v4);
      }

      v13 = *(void **)(v14 + 32);
      *(_QWORD *)(v14 + 32) = 0;

    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;
  BOOL *p_isHandlingScrollViewDelegateCallout;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  BOOL isHandlingScrollViewDelegateCallout;
  _QWORD *v10;

  v10 = a3;
  if (!self)
  {
    WeakRetained = 0;
    goto LABEL_7;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (WeakRetained)
  {
    if (!v10)
    {
      v8 = 0;
      isHandlingScrollViewDelegateCallout = self->_isHandlingScrollViewDelegateCallout;
      p_isHandlingScrollViewDelegateCallout = &self->_isHandlingScrollViewDelegateCallout;
      v6 = isHandlingScrollViewDelegateCallout;
      *p_isHandlingScrollViewDelegateCallout = 1;
      goto LABEL_6;
    }
    if (!*((_BYTE *)v10 + 2072))
    {
      v7 = self->_isHandlingScrollViewDelegateCallout;
      p_isHandlingScrollViewDelegateCallout = &self->_isHandlingScrollViewDelegateCallout;
      v6 = v7;
      *p_isHandlingScrollViewDelegateCallout = 1;
      v8 = v10[261];
      objc_msgSend(v10, "contentOffset");
      objc_msgSend(v10, "_pointByRemovingBaseContentInsetsFromPoint:");
LABEL_6:
      objc_msgSend(WeakRetained, "_orthogonalScrollView:didScrollToOffset:inSection:", v10, v8);
      *p_isHandlingScrollViewDelegateCallout = v6;
    }
  }
LABEL_7:

}

- (uint64_t)isIndexPathInOrthogonalScrollingSection:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend(v3, "item") == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = -[_UICollectionViewOrthogonalScrollerSectionController isSectionOrthogonallyScrolling:](a1, objc_msgSend(v4, "section"));
  }

  return v5;
}

- (uint64_t)isSectionOrthogonallyScrolling:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  objc_msgSend(WeakRetained, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_orthogonalScrollingSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsIndex:", a2);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsBelowOrthogonalScrollView, 0);
  objc_storeStrong((id *)&self->_frontMostElements, 0);
  objc_storeStrong((id *)&self->_scrollViewsQueuedForRemoval, 0);
  objc_storeStrong((id *)&self->_sectionToScrollViewMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (uint64_t)isElementInOrthogonalScrollingSectionWithLayoutAttributes:(uint64_t)a1
{
  _WORD *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_12;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "_hasOrthogonalScrollingSections"))
    {
      v9 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v3, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "length") == 1)
    {
      v9 = 0;
LABEL_7:

LABEL_10:
      goto LABEL_11;
    }
    v11 = objc_msgSend(v8, "section");
    objc_msgSend(v6, "_orthogonalScrollingSections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "containsIndex:", v11);

    if (!(_DWORD)v9)
      goto LABEL_7;
    if (v3)
    {
      v13 = v3[144];
      if ((v13 & 3) != 0)
      {
        if ((v13 & 2) == 0)
          goto LABEL_17;
        -[UIBarButtonItemGroup _items]((id *)v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:elementKind:", v8, v14);
      }
      else
      {
        -[UIBarButtonItemGroup _items]((id *)v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:elementKind:", v8, v14);
      }
      v9 = v15;

      goto LABEL_7;
    }
LABEL_17:
    v9 = 1;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_11:

LABEL_12:
  return v9;
}

- (BOOL)isIndexPathInExtantOrthogonalScroller:(_BOOL8)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (-[_UICollectionViewOrthogonalScrollerSectionController isIndexPathInOrthogonalScrollingSection:](a1, v3))
    {
      -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:]((id *)a1, objc_msgSend(v3, "section"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = v4 != 0;

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)autoScrollAssistantForOrthogonalScrollingSectionAtIndexPath:(id *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (-[_UICollectionViewOrthogonalScrollerSectionController isIndexPathInExtantOrthogonalScroller:]((_BOOL8)a1, v3))
    {
      -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, objc_msgSend(v3, "section"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_autoScrollAssistant");
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_placeView:(uint64_t)a3 belowOrthogonalScrollViewForSection:
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, a3, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "superview");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == WeakRetained)
          objc_msgSend(WeakRetained, "insertSubview:belowSubview:", v9, v7);
      }

    }
  }

}

- (void)updateParentScrollViewForCellPromiseRegion:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    objc_msgSend(v3, "layoutAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "section");

    -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "setParentScrollView:", v7);

    v3 = v8;
  }

}

- (void)setShouldPreventFocusScrollPastContentSize:(uint64_t)a1
{
  void *v3;
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
  if (a1 && *(unsigned __int8 *)(a1 + 8) != a2)
  {
    *(_BYTE *)(a1 + 8) = a2;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_setShouldPreventFocusScrollPastContentSize:", *(unsigned __int8 *)(a1 + 8));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6
{
  id v15;
  BOOL v16;
  id *v17;
  id *v18;
  id v19;

  v15 = a2;
  if (a1)
  {
    if (v15)
    {
      v19 = v15;
      v16 = (unint64_t)objc_msgSend(v15, "length") >= 2;
      v15 = v19;
      if (v16)
      {
        -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, objc_msgSend(v19, "section"), 1);
        v17 = (id *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          -[_UICollectionViewOrthogonalScrollView scrollToItemAtIndexPath:atScrollPosition:additionalInsets:animated:](v17, (uint64_t)v19, a3, a4, a5, a6, a7, a8);

        v15 = v19;
      }
    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  BOOL isHandlingScrollViewDelegateCallout;
  CGFloat v8;

  if (self)
  {
    isHandlingScrollViewDelegateCallout = self->_isHandlingScrollViewDelegateCallout;
    self->_isHandlingScrollViewDelegateCallout = 1;
  }
  else
  {
    isHandlingScrollViewDelegateCallout = 0;
  }
  a5->x = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)a3, a5->x, a5->y, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  a5->y = v8;
  if (self)
    self->_isHandlingScrollViewDelegateCallout = isHandlingScrollViewDelegateCallout;
}

@end
