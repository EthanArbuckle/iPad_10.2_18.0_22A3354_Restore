@implementation PLHighlightItemPromoter

- (PLHighlightItemPromoter)initWithRule:(id)a3
{
  id v5;
  PLHighlightItemPromoter *v6;
  PLHighlightItemPromoter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLHighlightItemPromoter;
  v6 = -[PLHighlightItemPromoter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rule, a3);

  return v7;
}

- (void)processHighlightItemsInHighlightItemList:(id)a3 currentlyPromotedHighlightItems:(id)a4 withSharingConsideration:(int64_t)a5 resultBlock:(id)a6
{
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(id, id, void *, BOOL);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = a4;
  v31 = (void (**)(id, id, void *, BOOL))a6;
  objc_msgSend(a3, "sortedChildHighlightItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16);
        -[PLHighlightItemPromoter rule](self, "rule");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "highlightItemHasMinimumRequirementToBePromoted:withSharingConsideration:", v17, a5);

        if (v19)
          objc_msgSend(v11, "addObject:", v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  -[PLHighlightItemPromoter rule](self, "rule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "maximumNumberOfHighlightItemsToPromote");

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") <= v21)
  {
    if (objc_msgSend(v11, "count"))
    {
      v25 = v22;
      v22 = v11;
      goto LABEL_15;
    }
    -[PLHighlightItemPromoter rule](self, "rule");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fallbackHighlightItemFromAllHighlightItems:withSharingConsideration:", v30, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLHighlightItemPromoter rule](self, "rule");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "highlightItemsSortedByImportance:withSharingConsideration:", v11, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "subarrayWithRange:", 0, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v26;

  v22 = v27;
LABEL_15:

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "minusSet:", v22);
  v31[2](v31, v22, v28, objc_msgSend(v22, "count") != 0);

}

- (PLHighlightItemPromoterRule)rule
{
  return self->_rule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
}

@end
