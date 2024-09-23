@implementation SearchUICombinedCardSectionsView

- (SearchUICombinedCardSectionsView)init
{
  SearchUICombinedCardSectionsView *v2;
  SearchUICombinedCardSectionsView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SearchUICombinedCardSectionsView;
  v2 = -[SearchUICombinedCardSectionsView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NUIContainerStackView setAxis:](v2, "setAxis:", 1);
    -[NUIContainerStackView setDistribution:](v3, "setDistribution:", 6);
    -[SearchUICombinedCardSectionsView setArrangedSubviewRemovalPolicy:](v3, "setArrangedSubviewRemovalPolicy:", 1);
    -[SearchUICombinedCardSectionsView setArrangedSubviewAdditionPolicy:](v3, "setArrangedSubviewAdditionPolicy:", 1);
    v4 = (void *)objc_opt_new();
    -[SearchUICombinedCardSectionsView setCardSectionsMapping:](v3, "setCardSectionsMapping:", v4);

    v5 = (void *)objc_opt_new();
    -[SearchUICombinedCardSectionsView setUncacheableViews:](v3, "setUncacheableViews:", v5);

    v6 = (void *)objc_opt_new();
    -[SearchUICombinedCardSectionsView setSeparatorViews:](v3, "setSeparatorViews:", v6);

  }
  return v3;
}

- (SearchUICombinedCardSectionsView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  id v7;
  SearchUICombinedCardSectionsView *v8;
  SearchUICombinedCardSectionsView *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[SearchUICombinedCardSectionsView init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[SearchUICombinedCardSectionsView setFeedbackDelegate:](v8, "setFeedbackDelegate:", v7);
    -[SearchUICombinedCardSectionsView setRowModel:](v9, "setRowModel:", v6);
  }

  return v9;
}

- (int64_t)numberOfSeparators
{
  void *v2;
  int64_t v3;

  -[SearchUICombinedCardSectionsView separatorViews](self, "separatorViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setRowModel:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  unint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  SearchUICombinedCardSectionRowModel *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v60 = (SearchUICombinedCardSectionRowModel *)a3;
  if (self->_rowModel != v60)
  {
    objc_storeStrong((id *)&self->_rowModel, a3);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[SearchUICombinedCardSectionsView uncacheableViews](self, "uncacheableViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v72 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v7);
    }

    -[SearchUICombinedCardSectionsView uncacheableViews](self, "uncacheableViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    -[SearchUICombinedCardSectionsView separatorViews](self, "separatorViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObjects");

    v12 = (void *)objc_opt_new();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[SearchUICombinedCardSectionRowModel cardSectionRowModels](v60, "cardSectionRowModels");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v68 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "cardSection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v15);
    }

    +[SearchUITableModel tableModelWithCardSections:isInline:queryId:](SearchUITableModel, "tableModelWithCardSections:isInline:queryId:", v12, 1, -[SearchUIRowModel queryId](v60, "queryId"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_opt_new();
    v19 = (void *)objc_opt_new();
    -[SearchUICombinedCardSectionRowModel cardSectionRowModels](v60, "cardSectionRowModels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICombinedCardSectionsView setHasAttributionFooter:](self, "setHasAttributionFooter:", 0);
    v61 = v20;
    if (objc_msgSend(v20, "count"))
    {
      for (k = 0; k < objc_msgSend(v61, "count"); ++k)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", k, v58);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reuseIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v23);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lastObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "updateWithRowModel:", v22);
            -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v23);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "removeLastObject");

          }
          else
          {
            -[SearchUICombinedCardSectionsView feedbackDelegate](self, "feedbackDelegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[SearchUICardSectionCreator cardSectionViewForModel:feedbackDelegate:](SearchUICardSectionCreator, "cardSectionViewForModel:feedbackDelegate:", v22, v30);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v19, "objectForKeyedSubscript:", v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34)
          {
            v35 = (void *)objc_opt_new();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v35, v23);

          }
          objc_msgSend(v19, "objectForKeyedSubscript:", v23);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v29);

          if (v29)
            goto LABEL_27;
        }
        else
        {
          -[SearchUICombinedCardSectionsView feedbackDelegate](self, "feedbackDelegate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUICardSectionCreator cardSectionViewForModel:feedbackDelegate:](SearchUICardSectionCreator, "cardSectionViewForModel:feedbackDelegate:", v22, v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[SearchUICombinedCardSectionsView uncacheableViews](self, "uncacheableViews");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v29);

LABEL_27:
            objc_msgSend(v58, "addObject:", v29);
            objc_opt_class();
            v37 = 1;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[SearchUICombinedCardSectionsView setHasAttributionFooter:](self, "setHasAttributionFooter:", 1);
            goto LABEL_30;
          }
        }
        v37 = 0;
LABEL_30:
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", k, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v62, "separatorStyleForIndexPath:", v38);

        if (v37)
        {
          if (v39 != 1)
          {
            -[SearchUICombinedCardSectionRowModel cardSectionRowModels](v60, "cardSectionRowModels");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 != v41)
            {
              v42 = (void *)objc_opt_new();
              -[SearchUICombinedCardSectionsView uncacheableViews](self, "uncacheableViews");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v42);

              -[SearchUICombinedCardSectionsView separatorViews](self, "separatorViews");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v42);

              objc_msgSend(v29, "addSubview:", v42);
            }
          }
        }

        v20 = v61;
      }
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v19, "allKeys", v58);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v64;
      do
      {
        for (m = 0; m != v47; ++m)
        {
          if (*(_QWORD *)v64 != v48)
            objc_enumerationMutation(v45);
          v50 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m);
          -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectForKeyedSubscript:", v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
          {
            v53 = (void *)objc_opt_new();
            -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, v50);

          }
          -[SearchUICombinedCardSectionsView cardSectionsMapping](self, "cardSectionsMapping");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", v50);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v50);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObjectsFromArray:", v57);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v47);
    }

    -[SearchUICombinedCardSectionsView setArrangedSubviews:](self, "setArrangedSubviews:", v59);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUICombinedCardSectionsView;
  -[SearchUICombinedCardSectionsView layoutSubviews](&v3, sel_layoutSubviews);
  -[SearchUICombinedCardSectionsView layoutAllSeparators](self, "layoutAllSeparators");
}

- (void)layoutAllSeparators
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  SearchUICombinedCardSectionsView *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _UNKNOWN **v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v4 = v3;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[SearchUICombinedCardSectionsView separatorViews](self, "separatorViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v11 = &off_1EA1F4000;
    do
    {
      v12 = 0;
      v41 = v7;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        objc_msgSend(v13, "superview");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14
          && (v15 = (void *)v14,
              objc_msgSend(v13, "superview"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v16,
              v15,
              (isKindOfClass & 1) != 0))
        {
          objc_msgSend(v13, "superview");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "section");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "separatorStyle");

          v21 = v10;
          v22 = v9;
          if (v20 != 5)
          {
            v42 = v11[342];
            objc_msgSend(v18, "section");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = self;
            v24 = v8;
            v25 = v5;
            v26 = objc_msgSend(v43, "separatorStyle");
            objc_msgSend(v18, "leadingView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "leadingTextView");
            v28 = v11;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v26;
            v5 = v25;
            v8 = v24;
            self = v23;
            objc_msgSend(v42, "separatorInsetsForStyle:cellView:leadingView:leadingTextView:", v30, v23, v27, v29);
            v22 = v31;
            v21 = v32;

            v11 = v28;
            v7 = v41;

            if (v4 >= v22)
              v22 = v4;
          }
          objc_msgSend(v18, "bounds");
          v34 = v33;
          objc_msgSend(v13, "separatorHeight");
          v36 = v34 - v35;
          objc_msgSend(v18, "bounds");
          v38 = v37 - v22 - v21;
          objc_msgSend(v13, "separatorHeight");
          objc_msgSend(v13, "setFrame:", v22, v36, v38, v39);
        }
        else
        {
          objc_msgSend(v13, "removeFromSuperview");
          -[SearchUICombinedCardSectionsView separatorViews](self, "separatorViews");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "removeObject:", v13);

          -[SearchUICombinedCardSectionsView uncacheableViews](self, "uncacheableViews");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObject:", v13);
        }

        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v7);
  }

}

- (SearchUICombinedCardSectionRowModel)rowModel
{
  return self->_rowModel;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (NSMutableDictionary)cardSectionsMapping
{
  return self->_cardSectionsMapping;
}

- (void)setCardSectionsMapping:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionsMapping, a3);
}

- (NSMutableArray)uncacheableViews
{
  return self->_uncacheableViews;
}

- (void)setUncacheableViews:(id)a3
{
  objc_storeStrong((id *)&self->_uncacheableViews, a3);
}

- (NSMutableArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
  objc_storeStrong((id *)&self->_separatorViews, a3);
}

- (BOOL)hasAttributionFooter
{
  return self->_hasAttributionFooter;
}

- (void)setHasAttributionFooter:(BOOL)a3
{
  self->_hasAttributionFooter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_uncacheableViews, 0);
  objc_storeStrong((id *)&self->_cardSectionsMapping, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end
