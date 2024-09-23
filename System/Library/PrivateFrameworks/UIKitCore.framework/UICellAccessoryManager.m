@implementation UICellAccessoryManager

- (UICellAccessoryConfiguration)currentConfiguration
{
  return (UICellAccessoryConfiguration *)-[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:", self->_currentConfigurationIdentifier);
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_2;
  v5[3] = &unk_1E16E3848;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  v7 = *(id *)(a1 + 48);
  v4 = WeakRetained;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

- (CGRect)contentFrame
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UICellAccessoryManager containerBounds](self, "containerBounds");
  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v6 = v5 + left;
  v8 = top + v7;
  v10 = v9 - (left + self->_contentInset.right);
  v12 = v11 - (top + self->_contentInset.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (CGRect)containerBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UICellAccessoryManager containerSize](self, "containerSize");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)layoutIfNeeded
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  BOOL v7;
  UICellAccessoryConfiguration *obj;

  -[UICellAccessoryManager _configurationWithIdentifier:](self, "_configurationWithIdentifier:", self->_currentConfigurationIdentifier);
  obj = (UICellAccessoryConfiguration *)objc_claimAutoreleasedReturnValue();
  -[UICellAccessoryManager containerSize](self, "containerSize");
  v5 = v3;
  v6 = v4;
  if (self->_needsLayout
    || obj != self->_previousConfiguration
    || (v3 == self->_previousContainerSize.width ? (v7 = v4 == self->_previousContainerSize.height) : (v7 = 0),
        !v7 || -[UICellAccessoryConfiguration alwaysNeedsLayout](obj, "alwaysNeedsLayout")))
  {
    -[UICellAccessoryManager _updateFromPreviousConfiguration:](self, "_updateFromPreviousConfiguration:", self->_previousConfiguration);
    objc_storeStrong((id *)&self->_previousConfiguration, obj);
    self->_previousContainerSize.width = v5;
    self->_previousContainerSize.height = v6;
    self->_needsLayout = 0;
  }

}

- (CGSize)containerSize
{
  double width;
  double height;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = self->_enforcedContainerSize.width;
  height = self->_enforcedContainerSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    objc_msgSend(WeakRetained, "bounds");
    width = v6;
    height = v7;

  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_configurationWithIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKeyedSubscript:](self->_configurations, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_updateAccessories:(id)a3 previousAccessories:(id)a4 withLayout:(id)a5 edge:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD);
  uint64_t v44;
  void *v45;
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
  double v56;
  double v57;
  void *v58;
  SEL v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  UICellAccessoryManager *v63;
  _QWORD v64[5];
  void (**v65)(_QWORD);
  SEL v66;
  _QWORD aBlock[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;
  CGRect result;

  v84 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v13, "setManager:", self);
  objc_msgSend(v13, "setEdge:", a6);
  v14 = 136;
  if (a6 == 8)
    v14 = 152;
  objc_msgSend(v13, "setSafeAreaInset:", *(double *)((char *)&self->super.isa + v14));
  -[UICellAccessoryManager standardLayoutWidthProvider](self, "standardLayoutWidthProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStandardLayoutWidthProvider:", v15);

  -[UICellAccessoryManager disclosureLayoutWidthProvider](self, "disclosureLayoutWidthProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDisclosureLayoutWidthProvider:", v16);

  v63 = self;
  v60 = v13;
  v61 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  objc_msgSend(v13, "prepareLayoutForAccessories:previousAccessories:configurationIdentifier:animated:", v11, v12, self->_currentConfigurationIdentifier);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v79 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v25);

        objc_msgSend(v24, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend(v17, "count");
  if (v27 != objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, v63, CFSTR("UICellAccessoryManager.m"), 334, CFSTR("Having the same view in multiple accessories is unsupported."));

  }
  v59 = a2;
  v62 = v19;
  v28 = (void *)objc_msgSend(v19, "mutableCopy");
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v29 = v12;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v75 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v34, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v18, "containsObject:", v35);

        if ((v36 & 1) == 0)
          objc_msgSend(v28, "addObject:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    }
    while (v31);
  }

  v37 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke;
  v71[3] = &unk_1E16B47A8;
  v71[4] = v63;
  v38 = v28;
  v72 = v38;
  v39 = v60;
  v73 = v39;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v71);
  v69[0] = v37;
  v69[1] = 3221225472;
  v69[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_3;
  v69[3] = &unk_1E16E3870;
  v69[4] = v63;
  v40 = v39;
  v70 = v40;
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", v69);
  -[UICellAccessoryManager _configurationWithIdentifier:](v63, "_configurationWithIdentifier:", v63->_currentConfigurationIdentifier);
  v41 = v37;
  aBlock[0] = v37;
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_4;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = v63;
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v68 = v42;
  v43 = (void (**)(_QWORD))_Block_copy(aBlock);
  v44 = -[UICellAccessoryManager animatedLayoutUpdatesCount](v63, "animatedLayoutUpdatesCount");
  if (v61)
  {
    -[UICellAccessoryManager setAnimatedLayoutUpdatesCount:](v63, "setAnimatedLayoutUpdatesCount:", v44 + 1);
    v64[0] = v41;
    v64[1] = 3221225472;
    v64[2] = __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_5;
    v64[3] = &unk_1E16C31E8;
    v64[4] = v63;
    v66 = v59;
    v65 = v43;
    +[UIView _addCompletion:](UIView, "_addCompletion:", v64);

    v45 = v62;
  }
  else
  {
    v45 = v62;
    if (!v44)
      v43[2](v43);
  }
  objc_msgSend(v40, "endLayout");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  v54 = v47;
  v55 = v49;
  v56 = v51;
  v57 = v53;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (int64_t)animatedLayoutUpdatesCount
{
  return self->_animatedLayoutUpdatesCount;
}

- (NSDictionary)configurations
{
  return self->_configurations;
}

- (id)standardLayoutWidthProvider
{
  return self->_standardLayoutWidthProvider;
}

- (id)disclosureLayoutWidthProvider
{
  return self->_disclosureLayoutWidthProvider;
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_configurationWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

    v6 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v2, "leadingAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeObject:", v15);

          objc_msgSend(v14, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v11);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v2, "trailingAccessories");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeObject:", v23);

          objc_msgSend(v22, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObject:", v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v19);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v5;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k), (_QWORD)v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v27);
    }

    objc_msgSend(v8, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  }

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setConfigurations:(id)a3
{
  NSDictionary *v5;
  id WeakRetained;
  NSDictionary *v7;

  v5 = (NSDictionary *)a3;
  if (self->_configurations != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_configurations, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

    v5 = v7;
  }

}

- (void)_updateFromPreviousConfiguration:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
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
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat MaxX;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  id v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v67 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  if (WeakRetained)
  {
    -[UICellAccessoryManager _configurationWithIdentifier:](self, "_configurationWithIdentifier:", self->_currentConfigurationIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");
    objc_msgSend(v5, "leadingAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = v5;
    objc_msgSend(v5, "trailingAccessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reverseObjectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = (void *)MEMORY[0x1E0C9AA60];
    if (v13)
      v16 = (void *)v13;
    else
      v16 = (void *)MEMORY[0x1E0C9AA60];
    v17 = v16;

    objc_msgSend(v67, "trailingAccessories");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v15;
    v21 = v20;

    if (v6)
      v22 = 8;
    else
      v22 = 2;
    if (v6)
      v23 = 2;
    else
      v23 = 8;
    -[UICellAccessoryManager _updateAccessories:previousAccessories:withLayout:edge:](self, "_updateAccessories:previousAccessories:withLayout:edge:", v9, v17, self->_leadingLayout, v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v62 = v28;
    v31 = v30;
    -[UICellAccessoryManager _updateAccessories:previousAccessories:withLayout:edge:](self, "_updateAccessories:previousAccessories:withLayout:edge:", v10, v21, self->_trailingLayout, v23);
    v36 = v32;
    v37 = v33;
    v38 = v34;
    v39 = v35;
    if (v6)
      v40 = v32;
    else
      v40 = v25;
    if (v6)
      v41 = v33;
    else
      v41 = v27;
    v60 = v41;
    v61 = v40;
    if (v6)
      v42 = v34;
    else
      v42 = v29;
    v59 = v42;
    if (v6)
      v43 = v35;
    else
      v43 = v31;

    if ((v6 & 1) != 0)
      v44 = v25;
    else
      v44 = v36;
    if ((v6 & 1) != 0)
      v45 = v27;
    else
      v45 = v37;
    v64 = v45;
    v65 = v44;
    if ((v6 & 1) != 0)
    {
      v38 = v62;
      v46 = v31;
    }
    else
    {
      v46 = v39;
    }
    v63 = v46;
    -[UICellAccessoryManager containerBounds](self, "containerBounds");
    v55 = v47;
    v56 = v48;
    v57 = v50;
    v58 = v49;
    v68.origin.x = v61;
    v68.origin.y = v60;
    v68.size.width = v59;
    v51 = v43;
    v68.size.height = v43;
    v52 = 0.0;
    MaxX = 0.0;
    if (!CGRectIsNull(v68))
    {
      v69.origin.x = v61;
      v69.origin.y = v60;
      v69.size.width = v59;
      v69.size.height = v51;
      MaxX = CGRectGetMaxX(v69);
    }
    v70.origin.x = v65;
    v70.origin.y = v64;
    v70.size.width = v38;
    v70.size.height = v63;
    if (!CGRectIsNull(v70))
    {
      v71.origin.x = v55;
      v71.size.height = v56;
      v71.size.width = v57;
      v71.origin.y = v58;
      v54 = CGRectGetMaxX(v71);
      v72.origin.x = v65;
      v72.origin.y = v64;
      v72.size.width = v38;
      v72.size.height = v63;
      v52 = v54 - CGRectGetMinX(v72);
    }
    self->_contentInset.top = 0.0;
    self->_contentInset.left = MaxX;
    self->_contentInset.bottom = 0.0;
    self->_contentInset.right = v52;

  }
}

- (void)setStandardLayoutWidthProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDisclosureLayoutWidthProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UICellAccessoryLayout)trailingLayout
{
  return self->_trailingLayout;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_safeAreaInsets.left || a3.right != self->_safeAreaInsets.right)
  {
    self->_safeAreaInsets = a3;
    -[UICellAccessoryManager setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UICellAccessoryLayout)leadingLayout
{
  return self->_leadingLayout;
}

- (void)setNeedsLayout
{
  id WeakRetained;

  self->_needsLayout = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)setTrailingLayout:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLayout, a3);
}

- (void)setLeadingLayout:(id)a3
{
  objc_storeStrong((id *)&self->_leadingLayout, a3);
}

- (void)setCurrentConfigurationIdentifier:(id)a3
{
  NSString *v5;
  id WeakRetained;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_currentConfigurationIdentifier != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_currentConfigurationIdentifier, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

    v5 = v7;
  }

}

- (UICellAccessoryManager)initWithContainerView:(id)a3
{
  id v3;
  UICellAccessoryManager *v4;
  uint64_t v5;
  NSMutableDictionary *accessoryViews;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryManager;
  v3 = a3;
  v4 = -[UICellAccessoryManager init](&v8, sel_init);
  objc_storeWeak((id *)&v4->_containerView, v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  accessoryViews = v4->_accessoryViews;
  v4->_accessoryViews = (NSMutableDictionary *)v5;

  return v4;
}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;

  v14 = a2;
  objc_msgSend(v14, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = v5;
  if (v5 != v4)
  {
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "layoutIfNeeded");
    objc_msgSend(v6, "removeFromSuperview");

LABEL_4:
    v7 = 0;
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v4, v3);
    goto LABEL_6;
  }
  objc_msgSend(v4, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);

  v7 = v4;
  if (v12 != v13)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 48), "initialFrameForAccessory:", v14);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (!CGRectIsNull(v15))
  {
    objc_msgSend(v4, "setFrame:", x, y, width, height);
    objc_msgSend(v4, "layoutIfNeeded");
  }
  objc_msgSend(*(id *)(a1 + 48), "initialAlphaForAccessory:", v14);
  objc_msgSend(v4, "setAlpha:");

}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double x;
  double y;
  double width;
  double height;
  id v9;
  CGRect v10;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "finalFrameForAccessory:", v9);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  if (!CGRectIsNull(v10))
    objc_msgSend(v4, "setFrame:", x, y, width, height);
  objc_msgSend(*(id *)(a1 + 40), "finalAlphaForAccessory:", v9);
  objc_msgSend(v4, "setAlpha:");

}

void __81__UICellAccessoryManager__updateAccessories_previousAccessories_withLayout_edge___block_invoke_5(uint64_t a1, int a2)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatedLayoutUpdatesCount:", objc_msgSend(*(id *)(a1 + 32), "animatedLayoutUpdatesCount") - 1);
  if (objc_msgSend(*(id *)(a1 + 32), "animatedLayoutUpdatesCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("UICellAccessoryManager.m"), 431, CFSTR("UICollectionView internal inconsistency: unexpected cell accessory layout animation"));

    if (!a2)
      return;
  }
  else if (!a2)
  {
    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "animatedLayoutUpdatesCount"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setAnimatedLayoutUpdatesCount:(int64_t)a3
{
  self->_animatedLayoutUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_previousConfiguration, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_currentConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_trailingLayout, 0);
  objc_storeStrong((id *)&self->_leadingLayout, 0);
  objc_storeStrong(&self->_disclosureLayoutWidthProvider, 0);
  objc_storeStrong(&self->_standardLayoutWidthProvider, 0);
}

- (void)updateContainerView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerView, obj);
    -[UICellAccessoryManager setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (void)performWithEnforcedContainerSize:(CGSize)a3 block:(id)a4
{
  CGSize enforcedContainerSize;

  enforcedContainerSize = self->_enforcedContainerSize;
  self->_enforcedContainerSize = a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_enforcedContainerSize = enforcedContainerSize;
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, &unk_1E1A94C40);
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSString)currentConfigurationIdentifier
{
  return self->_currentConfigurationIdentifier;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (CGSize)previousContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousContainerSize.width;
  height = self->_previousContainerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousContainerSize:(CGSize)a3
{
  self->_previousContainerSize = a3;
}

- (UICellAccessoryConfiguration)previousConfiguration
{
  return self->_previousConfiguration;
}

- (void)setPreviousConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_previousConfiguration, a3);
}

- (NSMutableDictionary)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViews, a3);
}

@end
