@implementation SKUIRedeemResultsView

- (SKUIRedeemResultsView)init
{
  SKUIRedeemResultsView *v3;
  SKUIRedeemResultsView *v4;
  void *v5;
  objc_super v7;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemResultsView init].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIRedeemResultsView;
  v3 = -[SKUIRedeemResultsView initWithFrame:style:](&v7, sel_initWithFrame_style_, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[SKUIRedeemResultsView setDelegate:](v3, "setDelegate:", v3);
    -[SKUIRedeemResultsView setDataSource:](v4, "setDataSource:", v4);
    -[SKUIRedeemResultsView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemResultsView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[SKUIRedeemResultsView setSeparatorStyle:](v4, "setSeparatorStyle:", 0);
  }
  return v4;
}

- (void)setSections:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_sections != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sections, a3);
    -[SKUIRedeemResultsView reloadData](self, "reloadData");
    v5 = v6;
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableViewCellForTableView:indexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_resultsDelegate);
    objc_msgSend(v7, "redeemResultsView:didSelectRowAtIndexPath:", self, v8);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightForCellInTableView:indexPath:", v7, v6);
  v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  NSArray *sections;
  id v8;
  id v9;
  id v10;
  id v11;

  sections = self->_sections;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v8, "section"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView:willDisplayCell:forIndexPath:", v10, v9, v8);

}

- (void)layoutSubviews
{
  NSArray *sections;
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
  double top;
  void *v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  CGFloat v20;
  objc_super v21;
  _QWORD v22[6];
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  sections = self->_sections;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __39__SKUIRedeemResultsView_layoutSubviews__block_invoke;
  v22[3] = &unk_1E73A74D8;
  v22[4] = self;
  v22[5] = &v23;
  -[NSArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v22);
  -[SKUIRedeemResultsView contentInset](self, "contentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIRedeemResultsView bounds](self, "bounds");
  v13 = v12;
  top = self->_contentInsetAdjustments.top;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v17 = 15.0;
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v17 = 28.0;
  v18 = (v13 - (v5 - top) - v24[3]) * 0.5;
  v19 = floorf(v18);
  if (v17 >= v19)
    v19 = v17;
  v20 = v19;
  self->_contentInsetAdjustments.top = v20;
  -[SKUIRedeemResultsView setContentInset:](self, "setContentInset:", v5 + v20 - top, v7, v9, v11);
  v21.receiver = self;
  v21.super_class = (Class)SKUIRedeemResultsView;
  -[SKUIRedeemResultsView layoutSubviews](&v21, sel_layoutSubviews);
  _Block_object_dispose(&v23, 8);
}

void __39__SKUIRedeemResultsView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;

  v11 = a2;
  v5 = objc_msgSend(v11, "numberOfRowsInSection");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "heightForCellInTableView:indexPath:", v8, v9);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);

    }
  }

}

- (NSArray)sections
{
  return self->_sections;
}

- (SKUIRedeemResultsViewDelegate)resultsDelegate
{
  return (SKUIRedeemResultsViewDelegate *)objc_loadWeakRetained((id *)&self->_resultsDelegate);
}

- (void)setResultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemResultsView init]";
}

@end
