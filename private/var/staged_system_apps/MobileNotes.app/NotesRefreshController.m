@implementation NotesRefreshController

+ (NotesRefreshController)sharedInstance
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1005DDFC8;
  if (!qword_1005DDFC8)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1005DDFC8;
    qword_1005DDFC8 = (uint64_t)v4;

    v3 = (void *)qword_1005DDFC8;
  }
  return (NotesRefreshController *)v3;
}

- (id)_accountStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountStore"));

  return v3;
}

- (BOOL)storesListNeedsRefresh
{
  NSDate *lastStoresListRefreshDate;
  double v3;

  lastStoresListRefreshDate = self->_lastStoresListRefreshDate;
  if (!lastStoresListRefreshDate)
    return 1;
  -[NSDate timeIntervalSinceNow](lastStoresListRefreshDate, "timeIntervalSinceNow");
  if (v3 < 0.0)
    v3 = -v3;
  return v3 >= 10.0;
}

- (void)refreshOrphanedAccounts
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v2 = objc_alloc((Class)NSMutableSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AccountUtilities sharedAccountUtilities](AccountUtilities, "sharedAccountUtilities"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountIDsEnabledForNotes"));
  v5 = objc_msgSend(v2, "initWithArray:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allAccounts"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    v12 = kLocalAccountIdentifier;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13), "accountIdentifier"));
        if ((objc_msgSend(v14, "isEqualToString:", v12) & 1) == 0)
          objc_msgSend(v5, "removeObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v18);
        v20 = objc_msgSend(sub_100110A60(), "sharedConnection");
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v21, "updateFolderListForAccountID:andDataclasses:", v19, 32);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

}

- (void)refreshStoresList
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSDate *v14;
  NSDate *lastStoresListRefreshDate;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccounts"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = kLocalAccountIdentifier;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10), "accountIdentifier"));
        if ((objc_msgSend(v11, "isEqualToString:", v9) & 1) == 0)
        {
          v12 = objc_msgSend(sub_100110A60(), "sharedConnection");
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          objc_msgSend(v13, "updateFolderListForAccountID:andDataclasses:", v11, 32);

        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastStoresListRefreshDate = self->_lastStoresListRefreshDate;
  self->_lastStoresListRefreshDate = v14;

}

- (BOOL)notesNeedRefresh
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccounts"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "objectID", (_QWORD)v15));
        v12 = -[NotesRefreshController notesNeedRefreshForCollectionWithID:](self, "notesNeedRefreshForCollectionWithID:", v11);

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)notesNeedRefreshForCollectionWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  NSMutableDictionary *lastNotesRefreshDates;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionForObjectID:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basicAccountIdentifier"));
    if ((objc_msgSend(v8, "isEqualToString:", kLocalAccountIdentifier) & 1) != 0)
    {
      v9 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v10 = objc_opt_class(NoteStoreObject);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lastNotesRefreshDates, "objectForKey:", v4));
      if (v11)
      {
LABEL_7:
        objc_msgSend(v11, "timeIntervalSinceNow");
        if (v12 < 0.0)
          v12 = -v12;
        v9 = v12 >= 10.0;
        goto LABEL_25;
      }
    }
    else
    {
      v24 = v8;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v23 = v7;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stores"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v11 = 0;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            lastNotesRefreshDates = self->_lastNotesRefreshDates;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "objectID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](lastNotesRefreshDates, "objectForKey:", v19));

            if (v20)
            {
              if (!v11)
                v11 = v20;
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "earlierDate:", v20));

              v11 = (id)v21;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }
      else
      {
        v11 = 0;
      }

      v8 = v24;
      if (v11)
        goto LABEL_7;
    }
    v9 = 1;
LABEL_25:

    goto LABEL_26;
  }
  v9 = 0;
LABEL_27:

  return v9;
}

- (void)refreshAllNotesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noteContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccounts"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "objectID", (_QWORD)v12));
        if (-[NotesRefreshController notesNeedRefreshForCollectionWithID:](self, "notesNeedRefreshForCollectionWithID:", v11))
        {
          -[NotesRefreshController refreshNotesForCollectionWithID:](self, "refreshNotesForCollectionWithID:", v11);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)refreshNotesForCollectionWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lastNotesRefreshDates;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  NSMutableDictionary *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noteContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionForObjectID:", v31));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "basicAccountIdentifier"));
  if ((objc_msgSend(v7, "isEqualToString:", kLocalAccountIdentifier) & 1) == 0)
  {
    if (!self->_lastNotesRefreshDates)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      lastNotesRefreshDates = self->_lastNotesRefreshDates;
      self->_lastNotesRefreshDates = v8;

    }
    v10 = objc_opt_class(NoteAccountObject);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      v11 = v6;
      v12 = objc_msgSend(sub_100110A60(), "sharedConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v13, "updateContentsOfAllFoldersForAccountID:andDataclass:", v7, 32);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stores"));
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v33;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v33 != v18)
                objc_enumerationMutation(v16);
              v20 = self->_lastNotesRefreshDates;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1)
                                                                                 + 8 * (_QWORD)v19), "objectID"));
              -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v15, v21);

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v17);
        }

      }
LABEL_17:

      goto LABEL_18;
    }
    v22 = objc_opt_class(NoteStoreObject);
    if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0)
    {
      v23 = v6;
      v24 = objc_msgSend(sub_100110A60(), "sharedConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "externalIdentifier"));
      v36 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v28 = objc_msgSend(v25, "updateContentsOfFoldersWithKeys:forAccountID:andDataclass:", v27, v7, 32);

      if (v28)
      {
        v29 = self->_lastNotesRefreshDates;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, v31);

      }
      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStoresListRefreshDate, 0);
  objc_storeStrong((id *)&self->_lastNotesRefreshDates, 0);
}

@end
