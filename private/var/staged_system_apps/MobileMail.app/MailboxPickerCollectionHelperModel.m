@implementation MailboxPickerCollectionHelperModel

- (id)indexPathForItem:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel sections](self, "sections"));
  for (i = 0; ; ++i)
  {
    if (i >= (unint64_t)objc_msgSend(v5, "count"))
    {
      v16 = 0;
      goto LABEL_15;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
      v10 = objc_msgSend(v9, "indexOfObject:", v4);

      if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v10, i));
        goto LABEL_14;
      }
    }
    else
    {

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountFavoriteItem"));
    v12 = v11;
    if (v11)
      break;
LABEL_12:

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subItems"));
  if (!objc_msgSend(v13, "count"))
  {

    goto LABEL_12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subItems"));
  v15 = (char *)objc_msgSend(v14, "indexOfObject:", v4);

  if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v15 + 1, i));

LABEL_14:
LABEL_15:

  return v16;
}

- (NSArray)sections
{
  NSArray *sections;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MailboxPickerCollectionHelperSection *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *j;
  uint64_t v13;
  MailboxPickerCollectionHelperSection *v14;
  void *v15;
  MailboxPickerCollectionHelperSection *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  NSArray *v22;
  id v23;
  char v24;
  uint64_t v25;
  void *k;
  void *v27;
  NSArray *v28;
  MailboxPickerCollectionHelperModel *v30;
  id obj;
  uint64_t v32;
  id v33;
  void *i;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  _QWORD v51[4];
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  sections = self->_sections;
  if (!sections)
  {
    v30 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel manager](self, "manager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleMailboxCollections"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v5;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v6, "isAccountsCollection"))
          {
            v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "visibleItemsOfType:", 1));
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v8 = v7;
            v9 = -[MailboxPickerCollectionHelperSection countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
            if (v9)
            {
              v10 = 0;
              v11 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v37 != v11)
                    objc_enumerationMutation(v8);
                  v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
                  v14 = [MailboxPickerCollectionHelperSection alloc];
                  v52 = v13;
                  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
                  v16 = -[MailboxPickerCollectionHelperSection initWithAccountsCollection:index:items:](v14, "initWithAccountsCollection:index:items:", v6, (char *)j + v10, v15);
                  objc_msgSend(v35, "addObject:", v16);

                }
                v9 = -[MailboxPickerCollectionHelperSection countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
                v10 += (uint64_t)j;
              }
              while (v9);
            }

          }
          else
          {
            v8 = -[MailboxPickerCollectionHelperSection initWithCollection:]([MailboxPickerCollectionHelperSection alloc], "initWithCollection:", v6);
            objc_msgSend(v35, "addObject:", v8);
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v33);
    }

    v17 = v35;
    v18 = v17;
    if (-[NSArray count](v17, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](v17, "count")));
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10003A1A4;
      v48[3] = &unk_10051ACE8;
      v20 = v19;
      v49 = v20;
      v50 = v51;
      v21 = objc_retainBlock(v48);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v22 = v17;
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v23)
      {
        v24 = 0;
        v25 = *(_QWORD *)v45;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(_QWORD *)v45 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k);
            if (!(v24 & 1 | ((objc_msgSend(v27, "isAccounts") & 1) == 0)))
            {
              ((void (*)(_QWORD *))v21[2])(v21);
              v24 = 1;
            }
            objc_msgSend(v20, "addObject:", v27);
            if (objc_msgSend(v27, "isAccounts"))
              ((void (*)(_QWORD *))v21[2])(v21);
          }
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v23);
      }

      v18 = (NSArray *)v20;
      _Block_object_dispose(v51, 8);
    }
    v28 = v30->_sections;
    v30->_sections = v18;

    sections = v30->_sections;
  }
  return sections;
}

- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsByItemID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

  if (!v8)
  {
    objc_msgSend(v6, "_reloadItemsByItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsByItemID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v5));

  }
  return v8;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (FavoritesManager)manager
{
  return self->_manager;
}

- (void)invalidateSections
{
  -[MailboxPickerCollectionHelperModel setSections:](self, "setSections:", 0);
}

- (MailboxPickerCollectionHelperModel)initWithFavoritesManager:(id)a3
{
  id v5;
  MailboxPickerCollectionHelperModel *v6;
  MailboxPickerCollectionHelperModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MailboxPickerCollectionHelperModel;
  v6 = -[MailboxPickerCollectionHelperModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_manager, a3);

  return v7;
}

- (MailboxPickerCollectionHelperSection)favoritesSection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel sections](self, "sections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_firstObjectPassingTest:", &stru_10051E000));

  return (MailboxPickerCollectionHelperSection *)v3;
}

- (BOOL)hasMultipleAccounts
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel manager](self, "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleItemsOfType:", 1));
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

+ (int64_t)indexOfFirstAccountSection:(id)a3
{
  return (int64_t)objc_msgSend(a3, "indexOfObjectPassingTest:", &stru_10051DFA0);
}

+ (int64_t)indexOfLastAccountSection:(id)a3
{
  return (int64_t)_objc_msgSend(a3, "indexOfObjectWithOptions:passingTest:", 2, &stru_10051DFC0);
}

- (id)sectionForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel sections](self, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  return v6;
}

- (id)favoriteItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelperModel sectionForIndexPath:](self, "sectionForIndexPath:", v4));
  if (!objc_msgSend(v5, "isAccounts"))
    goto LABEL_11;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v4, "row");

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
LABEL_13:
      v12 = (void *)v9;
      goto LABEL_17;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountFavoriteItem"));
  if (!v8 || !objc_msgSend(v4, "row"))
  {

LABEL_11:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
    v13 = objc_msgSend(v4, "row");
    if (v13 >= objc_msgSend(v8, "count"))
    {
      v12 = 0;
      goto LABEL_17;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subItems"));
  v11 = (char *)objc_msgSend(v4, "row");
  if (v11 - 1 >= objc_msgSend(v10, "count"))
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:"));

LABEL_17:
  return v12;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
