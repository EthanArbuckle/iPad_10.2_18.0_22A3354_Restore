@implementation ICQCloudStorageGraphTableViewRow

- (ICQCloudStorageGraphTableViewRow)init
{
  void *v3;
  void *v4;
  ICQCloudStorageGraphTableViewRow *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ICQCloudStorageGraphTableViewRow initWithAccount:](self, "initWithAccount:", v4);
  return v5;
}

- (ICQCloudStorageGraphTableViewRow)initWithAccount:(id)a3
{
  id v5;
  ICQCloudStorageGraphTableViewRow *v6;
  ICQCloudStorageGraphTableViewRow *v7;
  NSLock *v8;
  NSLock *tableCellLock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQCloudStorageGraphTableViewRow;
  v6 = -[RUIElement init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    tableCellLock = v7->_tableCellLock;
    v7->_tableCellLock = v8;

  }
  return v7;
}

- (id)tableCell
{
  UITableViewCell *tableCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITableViewCell *v12;
  id v13;
  _QWORD v15[4];
  UITableViewCell *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  objc_super v25;

  -[NSLock lock](self->_tableCellLock, "lock");
  tableCell = self->_tableCell;
  if (tableCell)
  {
    v4 = tableCell;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)ICQCloudStorageGraphTableViewRow;
    -[RUITableViewRow tableCell](&v25, sel_tableCell);
    v4 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", CFSTR("CLOUD_STORAGE_GRAPH"));
      objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      v7 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE04CA8]);
      objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CASTLE"), &stru_24E400750, CFSTR("CloudGroup"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x24BE75D50]);

      objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x24BE75D18]);
      -[UITableViewCell setSpecifier:](v5, "setSpecifier:", v6);
      -[UITableViewCell refreshCellContentsWithSpecifier:](v5, "refreshCellContentsWithSpecifier:", v6);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v10, "startAnimating");
      -[UITableViewCell setAccessoryView:](v5, "setAccessoryView:", v10);
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__12;
      v23 = __Block_byref_object_dispose__12;
      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC72A8]), "initWithAccount:", self->_account);
      v11 = (void *)v20[5];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke;
      v15[3] = &unk_24E3F5810;
      v12 = v5;
      v16 = v12;
      v13 = v6;
      v17 = v13;
      v18 = &v19;
      objc_msgSend(v11, "fetchStorageSummaryWithCompletion:", v15);

      _Block_object_dispose(&v19, 8);
    }
    objc_storeStrong((id *)&self->_tableCell, v4);
  }
  -[NSLock unlock](self->_tableCellLock, "unlock");
  return v4;
}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2;
  block[3] = &unk_24E3F57E8;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "setAccessoryView:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE04CA8]);
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "displayLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, *MEMORY[0x24BE75D50]);

    objc_msgSend(*(id *)(a1 + 48), "totalStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE04C90]);

    objc_msgSend(*(id *)(a1 + 48), "freeStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE04C88]);

    objc_msgSend(*(id *)(a1 + 48), "usedStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE04CA0]);

    objc_msgSend(*(id *)(a1 + 48), "icqui_AAUIiCloudMediaUsageInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE04C98]);
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2_cold_1(a1, v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "setSpecifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "refreshCellContentsWithSpecifier:", *(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v8 = a6;
  v9 = a5;
  -[ICQCloudStorageGraphTableViewRow tableCell](self, "tableCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_contentWidthForCell:forRowAtIndexPath:", v10, v8);
  v12 = v11;

  -[ICQCloudStorageGraphTableViewRow tableCell](self, "tableCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1112014848;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v13, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v12, 0.0, v14, v15);
  *(float *)&v12 = v16;

  return *(float *)&v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
  objc_storeStrong((id *)&self->_tableCellLock, 0);
}

void __45__ICQCloudStorageGraphTableViewRow_tableCell__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "No summary response received, Can't show storage graph. Error: %@", (uint8_t *)&v3, 0xCu);
}

@end
