@implementation REMListShareeContextChangeItem

- (REMListShareeContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5;
  REMListShareeContextChangeItem *v6;
  REMListShareeContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListShareeContextChangeItem;
  v6 = -[REMListShareeContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listChangeItem, a3);

  return v7;
}

- (void)addSharee:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Adding sharee {listChangeItem: %@, sharee: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "addObject:", v4);
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSharees:", v9);

}

- (NSArray)sharees
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 middleName:(id)a5 lastName:(id)a6 namePrefix:(id)a7 nameSuffix:(id)a8 nickname:(id)a9 address:(id)a10 status:(int64_t)a11 accessLevel:(int64_t)a12
{
  id v18;
  REMSharee *v19;
  void *v20;
  id v21;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;

  v32 = a10;
  v31 = a9;
  v29 = a8;
  v27 = a7;
  v25 = a6;
  v26 = a5;
  v18 = a4;
  v23 = a3;
  v30 = +[REMSharee newObjectID](REMSharee, "newObjectID");
  v19 = [REMSharee alloc];
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "accountID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[REMSharee initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:](v19, "initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:", v30, v24, v20, v23, v18, v26, v25, v27, v29, v31, v32, a11, a12);

  -[REMListShareeContextChangeItem addSharee:](self, "addSharee:", v21);
  return v21;
}

- (id)addShareeWithDisplayName:(id)a3 firstName:(id)a4 lastName:(id)a5 address:(id)a6 status:(int64_t)a7 accessLevel:(int64_t)a8
{
  return -[REMListShareeContextChangeItem addShareeWithDisplayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:](self, "addShareeWithDisplayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:", a3, a4, 0, a5, 0, 0, 0, a6, a7, a8);
}

- (id)addShareeWithPersonNameComponents:(id)a3 address:(id)a4 status:(int64_t)a5 accessLevel:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "givenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "middleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "namePrefix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nameSuffix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nickname");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListShareeContextChangeItem addShareeWithDisplayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:](self, "addShareeWithDisplayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:", 0, v11, v12, v13, v14, v15, v16, v9, a5, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)removeSharee:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing sharee {listChangeItem: %@, recurrenceRule: %@}", (uint8_t *)&v11, 0x16u);

  }
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v4);
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSharees:", v9);

}

- (void)removeAllSharees
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_INFO, "Removing all sharee {listChangeItem: %@}", (uint8_t *)&v6, 0xCu);

  }
  -[REMListShareeContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharees:", MEMORY[0x1E0C9AA60]);

}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_listChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listChangeItem, 0);
}

@end
