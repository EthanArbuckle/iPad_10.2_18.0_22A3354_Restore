@implementation HomeOutlineSectionBuilder

+ (id)itemSnapshotsWithItems:(id)a3 sectionIdentifier:(id)a4 sectionExpanded:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HomeOutlineSectionBuilderStack *v21;
  void *v22;

  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (objc_msgSend(v15, "count"))
  {
    v21 = -[HomeOutlineSectionBuilderStack initWithSectionIdentifier:sectionIndex:]([HomeOutlineSectionBuilderStack alloc], "initWithSectionIdentifier:sectionIndex:", v16, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_itemSnapshotsWithStack:items:hidden:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v21, v15, !v12, v17, v18, v19, v20));

  }
  else
  {
    v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)_itemSnapshotsWithStack:(id)a3 items:(id)a4 hidden:(BOOL)a5 itemIdentifierBlock:(id)a6 viewModelBlock:(id)a7 childItemsBlock:(id)a8 expandedBlock:(id)a9
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  uint64_t (**v17)(id, _QWORD, id);
  uint64_t (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v35;
  id v37;
  id v38;
  _BOOL4 v39;
  uint64_t (**v41)(id, _QWORD, id);
  uint64_t (**v42)(id, _QWORD, id);
  uint64_t v43;
  uint64_t v44;
  uint64_t (**v45)(_QWORD, _QWORD, _QWORD);
  uint64_t (**v46)(id, _QWORD, id);
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];

  v12 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v46 = (uint64_t (**)(id, _QWORD, id))a7;
  v17 = (uint64_t (**)(id, _QWORD, id))a8;
  v18 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v16;
  v42 = v17;
  v41 = (uint64_t (**)(id, _QWORD, id))a9;
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v20 = v15;
  v48 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v48)
  {
    v21 = 0;
    v22 = *(_QWORD *)v50;
    v39 = v12;
    v38 = v20;
    v44 = *(_QWORD *)v50;
    v45 = v18;
    do
    {
      v23 = 0;
      v43 = v21;
      do
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v20);
        v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)v23);
        objc_msgSend(v14, "_pushItem:index:", v24, (char *)v23 + v21);
        v25 = ((uint64_t (**)(_QWORD, uint64_t, id))v18)[2](v18, v24, v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (v26 && !objc_msgSend(v19, "containsObject:", v26))
        {
          objc_msgSend(v14, "_setTopIdentifier:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifiers"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPathWithIdentifiers:](IdentifierPath, "identifierPathWithIdentifiers:", v27));

          if (v12)
          {
            v28 = objc_claimAutoreleasedReturnValue(+[HomeOutlineHiddenViewModel sharedViewModel](HomeOutlineHiddenViewModel, "sharedViewModel"));
          }
          else
          {
            v29 = v46[2](v46, v24, v14);
            v28 = objc_claimAutoreleasedReturnValue(v29);
          }
          v30 = (void *)v28;
          if (v28)
          {
            v31 = v41[2](v41, v24, v14);
            v32 = v42[2](v42, v24, v14);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v18 = v45;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_itemSnapshotsWithStack:items:hidden:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v14, v33, v12 | v31 ^ 1, v45, v46, v42, v41));
            v35 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:]([MapsUIDiffableDataSourceOutlineNodeSnapshot alloc], "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v47, v30, v34, v31);
            if (v35)
            {
              objc_msgSend(v37, "addObject:", v35);
              objc_msgSend(v19, "addObject:", v26);
            }
            objc_msgSend(v14, "_pop");

            v12 = v39;
            v20 = v38;
            v21 = v43;
          }
          else
          {
            objc_msgSend(v14, "_pop");
            v18 = v45;
          }

          v22 = v44;
        }
        else
        {
          objc_msgSend(v14, "_pop");
        }

        v23 = (char *)v23 + 1;
      }
      while (v48 != v23);
      v21 += (uint64_t)v23;
      v48 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v48);
  }

  return v37;
}

@end
