@implementation PKSettingsTableViewConfiguration

- (PKSettingsTableViewConfiguration)init
{
  PKSettingsTableViewConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *rowsForIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *sectionsForIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSettingsTableViewConfiguration;
  v2 = -[PKSettingsTableViewConfiguration init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rowsForIdentifier = v2->_rowsForIdentifier;
    v2->_rowsForIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionsForIdentifier = v2->_sectionsForIdentifier;
    v2->_sectionsForIdentifier = v5;

  }
  return v2;
}

- (void)appendSection:(id)a3 rows:(id)a4
{
  id v6;
  id v7;
  NSDiffableDataSourceSnapshot *v8;
  NSDiffableDataSourceSnapshot *currentSnapshot;
  void *v10;
  void *v11;
  NSDiffableDataSourceSnapshot *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_currentSnapshot)
  {
    v8 = (NSDiffableDataSourceSnapshot *)objc_alloc_init(MEMORY[0x1E0DC3398]);
    currentSnapshot = self->_currentSnapshot;
    self->_currentSnapshot = v8;

  }
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_sectionsForIdentifier, "setObject:forKey:", v6, v10);
  objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke_2;
  v14[3] = &unk_1E3E615F8;
  v14[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v12 = self->_currentSnapshot;
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v12, "appendSectionsWithIdentifiers:", v13);

  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:](self->_currentSnapshot, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, v10);
}

uint64_t __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (id)rowForItemIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_rowsForIdentifier, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionForSectionIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKey:](self->_sectionsForIdentifier, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)sections
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSDiffableDataSourceSnapshot sectionIdentifiers](self->_currentSnapshot, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PKSettingsTableViewConfiguration_sections__block_invoke;
  v6[3] = &unk_1E3E61620;
  v6[4] = self;
  objc_msgSend(v3, "pk_arrayByApplyingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __44__PKSettingsTableViewConfiguration_sections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", a2);
}

- (id)rowsForSection:(id)a3
{
  NSDiffableDataSourceSnapshot *currentSnapshot;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  currentSnapshot = self->_currentSnapshot;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceSnapshot itemIdentifiersInSectionWithIdentifier:](currentSnapshot, "itemIdentifiersInSectionWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PKSettingsTableViewConfiguration_rowsForSection___block_invoke;
  v9[3] = &unk_1E3E61648;
  v9[4] = self;
  objc_msgSend(v6, "pk_arrayByApplyingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__PKSettingsTableViewConfiguration_rowsForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
}

- (id)snapshot
{
  return self->_currentSnapshot;
}

- (void)diff:(id)a3 updatedIdentifiers:(id *)a4
{
  objc_class *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  if (a3 && a4)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99E20];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    v9 = (void *)v7[1];

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKSettingsTableViewConfiguration_diff_updatedIdentifiers___block_invoke;
    v11[3] = &unk_1E3E61670;
    v11[4] = self;
    v10 = v8;
    v12 = v10;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
    if (objc_msgSend(v10, "count"))
      *a4 = (id)objc_msgSend(v10, "copy");

  }
}

void __60__PKSettingsTableViewConfiguration_diff_updatedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (PKEqualObjects() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_sectionsForIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsForIdentifier, 0);
}

@end
