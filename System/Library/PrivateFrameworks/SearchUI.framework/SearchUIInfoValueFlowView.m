@implementation SearchUIInfoValueFlowView

- (SearchUIInfoValueFlowView)init
{
  SearchUIInfoValueFlowView *v2;
  void *v3;
  char v4;
  double v5;
  double v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIInfoValueFlowView;
  v2 = -[SearchUIInfoValueFlowView init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SearchUIInfoValueFlowView setInfoValueViewControllers:](v2, "setInfoValueViewControllers:", v3);

    v4 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
    v5 = 7.0;
    v6 = 7.0;
    if ((v4 & 1) == 0)
    {
      v7 = TLKSnippetModernizationEnabled();
      v6 = 7.0;
      if (v7)
        objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", v2, 6.5);
    }
    -[NUIContainerFlowView setRowSpacing:](v2, "setRowSpacing:", v6);
    if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0)
    {
      if (TLKSnippetModernizationEnabled())
        v5 = 0.0;
      else
        v5 = 7.0;
    }
    -[NUIContainerFlowView setItemSpacing:](v2, "setItemSpacing:", v5);
    -[NUIContainerFlowView setVerticalAlignment:](v2, "setVerticalAlignment:", 2);
  }
  return v2;
}

- (void)setTuple:(id)a3
{
  SFInfoTuple *v5;
  SFInfoTuple *v6;

  v5 = (SFInfoTuple *)a3;
  if (self->_tuple != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tuple, a3);
    -[SearchUIInfoValueFlowView setIsExpanded:](self, "setIsExpanded:", 0);
    -[SearchUIInfoValueFlowView reloadViews](self, "reloadViews");
    v5 = v6;
  }

}

- (void)reloadViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__SearchUIInfoValueFlowView_reloadViews__block_invoke;
  v2[3] = &unk_1EA1F62F0;
  v2[4] = self;
  -[SearchUIInfoValueFlowView performBatchUpdates:](self, "performBatchUpdates:", v2);
}

uint64_t __40__SearchUIInfoValueFlowView_reloadViews__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  _QWORD *v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SearchUIButtonItem *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "infoValueViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v52 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHidden:", 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "tuple");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "initiallyVisibleValues");

  objc_msgSend(*(id *)(a1 + 32), "tuple");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "values");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - v9;

  if (v12 >= 2)
    v13 = v9;
  else
    v13 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tuple");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "values");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v48;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "infoValueViewControllers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v18 + j >= v23)
        {
          v25 = (void *)objc_opt_new();
          objc_msgSend(v25, "setButtonDelegate:", *(_QWORD *)(a1 + 32));
          v27 = (void *)MEMORY[0x1E0DBD940];
          v28 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
          v29 = (_QWORD *)MEMORY[0x1E0DC4B10];
          if ((v28 & 1) == 0)
          {
            v30 = TLKSnippetModernizationEnabled();
            v29 = (_QWORD *)MEMORY[0x1E0DC4B10];
            if (v30)
              v29 = (_QWORD *)MEMORY[0x1E0DC4A88];
          }
          objc_msgSend(v27, "cachedFontForTextStyle:", *v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setButtonFont:", v31);

          if (TLKSnippetModernizationEnabled())
          {
            if (v18 + j)
              v32 = -10.0;
            else
              v32 = 0.0;
            objc_msgSend(v25, "view");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setCustomAlignmentRectInsets:", 0.0, v32, 0.0, 0.0);

          }
          objc_msgSend(v25, "buttonItemView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setNeverCacheEffectiveLayoutSize:", 1);

          objc_msgSend(v25, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setNeverCacheEffectiveLayoutSize:", 1);

          objc_msgSend(*(id *)(a1 + 32), "infoValueViewControllers");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v25);

          v37 = *(void **)(a1 + 32);
          objc_msgSend(v25, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addArrangedSubview:", v26);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "infoValueViewControllers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v18 + j);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setHidden:", 0);
        }

        objc_msgSend(*(id *)(a1 + 32), "rowModel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setRowModel:", v38);

        objc_msgSend(*(id *)(a1 + 32), "feedbackDelegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFeedbackDelegate:", v39);

        if (!objc_msgSend(*(id *)(a1 + 32), "isExpanded")
          && v13 >= 1
          && v18 + j + 1 > (unint64_t)v13)
        {
          v40 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", 0);
          objc_msgSend(*(id *)(a1 + 32), "tuple");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "showMoreString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIButtonItem setTitle:](v40, "setTitle:", v42);

          if (TLKSnippetModernizationEnabled())
          {
            -[SearchUIButtonItem setImage:](v40, "setImage:", 0);
          }
          else
          {
            +[SearchUISymbolImage chevronImage](SearchUISymbolImage, "chevronImage");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIButtonItem setImage:](v40, "setImage:", v43);

          }
          objc_msgSend(v25, "updateWithButtonItem:buttonItemViewType:", v40, 0);
          objc_msgSend(v25, "buttonItemView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setEnabled:", 1);

          goto LABEL_37;
        }
        objc_msgSend(*(id *)(a1 + 32), "configureInfoValueButtonController:withButtonItem:", v25, v21);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v18 += j;
      if (v17)
        continue;
      break;
    }
  }
LABEL_37:

  return objc_msgSend(*(id *)(a1 + 32), "invalidateIntrinsicContentSize");
}

- (void)configureInfoValueButtonController:(id)a3 withButtonItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SearchUIButtonItem *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v5 = a3;
  objc_msgSend(v19, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v19, "image");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_4;
  }
  if ((TLKSnippetModernizationEnabled() & 1) == 0)
  {
    objc_msgSend(v19, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      +[SearchUISymbolImage chevronImage](SearchUISymbolImage, "chevronImage");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  objc_msgSend(v19, "command");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v19, "command");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "punchout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "urls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("http")) & 1) != 0
      || objc_msgSend(v18, "isEqualToString:", CFSTR("https")))
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setSymbolName:", CFSTR("arrow.up.forward.app.fill"));
      objc_msgSend(v8, "setIsTemplate:", 1);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
LABEL_4:
  v9 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", v19);
  -[SearchUIButtonItem setImage:](v9, "setImage:", v8);
  objc_msgSend(v5, "updateWithButtonItem:buttonItemViewType:", v9, objc_msgSend(v5, "buttonItemViewStyle"));

}

- (void)buttonItemPressed:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "sfButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SearchUIInfoValueFlowView setIsExpanded:](self, "setIsExpanded:", 1);
    -[SearchUIInfoValueFlowView reloadViews](self, "reloadViews");
    -[SearchUIInfoValueFlowView sizingDelegate](self, "sizingDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didInvalidateSizeAnimate:", 1);

  }
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (SearchUIInfoSizingDelegate)sizingDelegate
{
  return (SearchUIInfoSizingDelegate *)objc_loadWeakRetained((id *)&self->_sizingDelegate);
}

- (void)setSizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sizingDelegate, a3);
}

- (SearchUIRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (SFInfoTuple)tuple
{
  return self->_tuple;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NSMutableArray)infoValueViewControllers
{
  return self->_infoValueViewControllers;
}

- (void)setInfoValueViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_infoValueViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoValueViewControllers, 0);
  objc_storeStrong((id *)&self->_tuple, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

@end
