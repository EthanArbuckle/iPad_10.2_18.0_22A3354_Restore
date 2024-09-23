@implementation MessageListLayoutFactory

+ (id)layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 layout:(int64_t)a6 configuration:(id)a7
{
  void *v7;
  double trailing;
  double bottom;
  double leading;
  double top;
  id v15;
  id v16;
  uint64_t v17;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v15 = a4;
  v16 = a7;
  switch(a6)
  {
    case 2:
      v17 = objc_claimAutoreleasedReturnValue(+[MessageListLayoutFactory _groupedSenderLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_groupedSenderLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v15, v16, top, leading, bottom, trailing));
      goto LABEL_7;
    case 1:
      v17 = objc_claimAutoreleasedReturnValue(+[MessageListLayoutFactory _searchLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_searchLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v15, v16, top, leading, bottom, trailing));
      goto LABEL_7;
    case 0:
      v17 = objc_claimAutoreleasedReturnValue(+[MessageListLayoutFactory _defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, v15, v16, top, leading, bottom, trailing));
LABEL_7:
      v7 = (void *)v17;
      break;
  }

  return v7;
}

+ (id)_defaultLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  double trailing;
  double leading;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  trailing = a5.trailing;
  leading = a5.leading;
  v9 = a4;
  v10 = a6;
  v26 = v9;
  v27 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
  v12 = objc_msgSend(v11, "mf_useSplitViewStyling");

  v13 = objc_alloc((Class)UICollectionLayoutListConfiguration);
  if (v12)
    v14 = 4;
  else
    v14 = 0;
  v15 = objc_msgSend(v13, "initWithAppearance:", v14);
  (*((void (**)(id, id))v10 + 2))(v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithListConfiguration:layoutEnvironment:](NSCollectionLayoutSection, "sectionWithListConfiguration:layoutEnvironment:", v15, v9));
  v17 = v16;
  if (v12)
  {
    objc_msgSend(v16, "setContentInsets:", 0.0, leading, 0.0, trailing);
    objc_msgSend(v17, "setContentInsetsReference:", 2);
  }
  else
  {
    objc_msgSend(v16, "contentInsets");
    objc_msgSend(v17, "setContentInsets:", 0.0);
  }
  if (_os_feature_enabled_impl("Mail", "CatchUpHighlights")
    && EMIsGreymatterSupportedWithOverride())
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "boundarySupplementaryItems"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "elementKind"));
          v24 = objc_msgSend(v23, "isEqualToString:", UICollectionElementKindSectionHeader);

          if (v24)
            objc_msgSend(v22, "setPinToVisibleBounds:", 0);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }

  }
  return v17;
}

+ (id)_searchLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListLayoutFactory _defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:](MessageListLayoutFactory, "_defaultLayoutSectionAtSection:layoutEnvironment:layoutMargins:configuration:", a3, a4, a6, a5.top, a5.leading, a5.bottom, a5.trailing));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boundarySupplementaryItems", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "setPinToVisibleBounds:", 0);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)_groupedSenderLayoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layoutMargins:(NSDirectionalEdgeInsets)a5 configuration:(id)a6
{
  id v7;
  void (**v8)(id, id);
  id v9;
  void *v10;

  v7 = a4;
  v8 = (void (**)(id, id))a6;
  v9 = objc_msgSend(objc_alloc((Class)UICollectionLayoutListConfiguration), "initWithAppearance:", 0);
  v8[2](v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithListConfiguration:layoutEnvironment:](NSCollectionLayoutSection, "sectionWithListConfiguration:layoutEnvironment:", v9, v7));

  return v10;
}

@end
