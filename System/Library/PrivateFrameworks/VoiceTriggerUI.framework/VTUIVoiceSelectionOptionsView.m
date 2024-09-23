@implementation VTUIVoiceSelectionOptionsView

- (VTUIVoiceSelectionOptionsView)init
{
  VTUIVoiceSelectionOptionsView *v2;
  VTUIVoiceSelectionOptionsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIVoiceSelectionOptionsView;
  v2 = -[VTUIVoiceSelectionOptionsView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VTUIVoiceSelectionOptionsView _setupVoicesTableView](v2, "_setupVoicesTableView");
  return v3;
}

- (void)_setupVoicesTableView
{
  id v3;
  UITableView *v4;
  UITableView *voicesTableView;
  UITableViewDiffableDataSource *v6;
  UITableViewDiffableDataSource *tableViewDataSource;
  void *v8;
  void *v9;
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
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  voicesTableView = self->_voicesTableView;
  self->_voicesTableView = v4;

  -[VTUIVoiceSelectionOptionsView _diffableTableDataSource](self, "_diffableTableDataSource");
  v6 = (UITableViewDiffableDataSource *)objc_claimAutoreleasedReturnValue();
  tableViewDataSource = self->_tableViewDataSource;
  self->_tableViewDataSource = v6;

  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_tableViewDataSource, "setDefaultRowAnimation:", 5);
  -[UITableView setDelegate:](self->_voicesTableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_voicesTableView, "setDataSource:", self->_tableViewDataSource);
  -[UITableView setShowsHorizontalScrollIndicator:](self->_voicesTableView, "setShowsHorizontalScrollIndicator:", 0);
  -[UITableView setShowsVerticalScrollIndicator:](self->_voicesTableView, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_voicesTableView, "setBackgroundColor:", v8);

  -[UITableView layer](self->_voicesTableView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 8.0);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_voicesTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("VoiceCell"));
  -[VTUIVoiceSelectionOptionsView addSubview:](self, "addSubview:", self->_voicesTableView);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_voicesTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (void *)MEMORY[0x24BDD1628];
  -[UITableView topAnchor](self->_voicesTableView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionOptionsView topAnchor](self, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  -[UITableView leftAnchor](self->_voicesTableView, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionOptionsView leftAnchor](self, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  -[UITableView rightAnchor](self->_voicesTableView, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionOptionsView rightAnchor](self, "rightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  -[UITableView bottomAnchor](self->_voicesTableView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIVoiceSelectionOptionsView bottomAnchor](self, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v19);

}

- (id)_diffableTableDataSource
{
  id v3;
  UITableView *voicesTableView;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BEBDA08]);
  voicesTableView = self->_voicesTableView;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__VTUIVoiceSelectionOptionsView__diffableTableDataSource__block_invoke;
  v7[3] = &unk_24F33DF20;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v3, "initWithTableView:cellProvider:", voicesTableView, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

id __57__VTUIVoiceSelectionOptionsView__diffableTableDataSource__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[53], "voices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_tableCellForVoiceViewModel:indexPath:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  UITableView *voicesTableView;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  voicesTableView = self->_voicesTableView;
  v7 = a3;
  -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](voicesTableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("VoiceCell"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD728], "cellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(v8, "setContentConfiguration:", v9);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v11);

  LODWORD(v11) = objc_msgSend(v7, "isCurrentSiriVoice");
  if ((_DWORD)v11)
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v8, "setAccessoryType:", v12);
  objc_msgSend(v8, "setSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_voicesTableView, "semanticContentAttribute"));

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  -[VTUIVoiceSelectionOptionsView voiceSelectionEventHandler](self, "voiceSelectionEventHandler");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUICVoiceSelectionViewModel voices](self->_viewModel, "voices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "voiceSelectionView:receivedRequestToSelectVoice:", self, v8);

}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)voiceSelectionViewModelDidChange
{
  void *v3;
  SUICVoiceSelectionViewModel *v4;
  SUICVoiceSelectionViewModel *viewModel;

  -[VTUIVoiceSelectionOptionsView voiceSelectionViewModelProvider](self, "voiceSelectionViewModelProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceSelectionViewModel");
  v4 = (SUICVoiceSelectionViewModel *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  self->_viewModel = v4;

  -[VTUIVoiceSelectionOptionsView _createAndApplySnapshotForViewModel:](self, "_createAndApplySnapshotForViewModel:", self->_viewModel);
}

- (void)_createAndApplySnapshotForViewModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  VTUIVoiceSelectionOptionsView *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  void *v28;
  void *v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v18 = self;
  v31[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEBD348]);
  v31[0] = CFSTR("Voice");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = v3;
  objc_msgSend(v3, "voices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "localizedDisplayName", v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "localizedDisplayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v13;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, CFSTR("Voice"));

          objc_msgSend(v11, "localizedDisplayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "reloadItemsWithIdentifiers:", v16);

        }
        else
        {
          v17 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[VTUIVoiceSelectionOptionsView _createAndApplySnapshotForViewModel:]";
            v26 = 2112;
            v27 = v11;
            _os_log_error_impl(&dword_229EF7000, v17, OS_LOG_TYPE_ERROR, "%s Unable to determine localized display name for %@", buf, 0x16u);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v8);
  }

  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](v18->_tableViewDataSource, "applySnapshot:animatingDifferences:", v4, 0);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIVoiceSelectionOptionsView;
  -[VTUIVoiceSelectionOptionsView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[UITableView setSemanticContentAttribute:](self->_voicesTableView, "setSemanticContentAttribute:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SUICVoiceSelectionViewModel voices](self->_viewModel, "voices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(unint64_t)objc_msgSend(v6, "count");
  -[VTUIVoiceSelectionOptionsView _cellSizeForSize:](self, "_cellSizeForSize:", width, height);
  v9 = v8 * v7;

  v10 = width;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_cellSizeForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x24BEBD9F8]);
  objc_msgSend(MEMORY[0x24BEBD728], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", CFSTR("Height Check"));
  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "setSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_voicesTableView, "semanticContentAttribute"));
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  return (SUICVoiceSelectionViewModelProviding *)objc_loadWeakRetained((id *)&self->_voiceSelectionViewModelProvider);
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
  objc_storeWeak((id *)&self->_voiceSelectionViewModelProvider, a3);
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  return (SUICVoiceSelectionEventHandling *)objc_loadWeakRetained((id *)&self->_voiceSelectionEventHandler);
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
  objc_storeWeak((id *)&self->_voiceSelectionEventHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceSelectionEventHandler);
  objc_destroyWeak((id *)&self->_voiceSelectionViewModelProvider);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_voicesTableView, 0);
}

@end
