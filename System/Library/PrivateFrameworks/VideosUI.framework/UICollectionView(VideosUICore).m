@implementation UICollectionView(VideosUICore)

+ (id)collectionViewWithFrame:()VideosUICore parentView:collectionViewLayout:
{
  id v14;
  id v15;
  id v16;
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
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v14 = a7;
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___UICollectionView_0;
  v15 = a8;
  v16 = objc_msgSendSuper2(&v31, sel_alloc);
  v17 = (void *)objc_msgSend(v16, "initWithFrame:collectionViewLayout:", v15, a2, a3, a4, a5, v31.receiver, v31.super_class);

  if (v17)
  {
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "addSubview:", v17);
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    objc_msgSend(v17, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    objc_msgSend(v17, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    objc_msgSend(v17, "rightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

  }
  return v17;
}

- (double)vuiSize
{
  double v1;

  objc_msgSend(a1, "bounds");
  return v1;
}

- (uint64_t)setVuiContentOffset:()VideosUICore
{
  return objc_msgSend(a1, "setContentOffset:animated:", 0);
}

- (void)vui_scrollToItemAtIndexPath:()VideosUICore atScrollPosition:animated:
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a1, "vui_isIndexPathValid:"))
    objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, a4, a5);

}

- (uint64_t)vuiPreciseIndexPathsForVisibleItems
{
  return objc_msgSend(a1, "_preciseIndexPathsForVisibleItems:", 0);
}

- (uint64_t)vuiPreciseIndexPathsForFullyVisibleItems
{
  return objc_msgSend(a1, "_preciseIndexPathsForVisibleItems:", 1);
}

- (id)_preciseIndexPathsForVisibleItems:()VideosUICore
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "vuiIndexPathsForVisibleItems");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(a1, "contentOffset");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "bounds");
  v12 = v11;
  v14 = v13;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(a1, "cellForItemAtIndexPath:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "frame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          objc_msgSend(v22, "superview");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "convertRect:fromView:", v31, v24, v26, v28, v30);
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v40 = v8;
          v41 = v10;
          v42 = v12;
          v43 = v14;
          if (a3)
          {
            if (!CGRectContainsRect(*(CGRect *)&v40, *(CGRect *)&v33))
              goto LABEL_12;
LABEL_11:
            objc_msgSend(v6, "addObject:", v20);
          }
          else if (CGRectIntersectsRect(*(CGRect *)&v40, *(CGRect *)&v33))
          {
            goto LABEL_11;
          }
LABEL_12:

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v17);
  }

  v44 = (void *)objc_msgSend(v6, "copy");
  return v44;
}

- (BOOL)vui_isIndexPathValid:()VideosUICore
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= objc_msgSend(a1, "numberOfSections"))
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "item");
    v7 = v6 < objc_msgSend(a1, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  }

  return v7;
}

@end
