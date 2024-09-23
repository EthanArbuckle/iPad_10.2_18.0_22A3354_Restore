@implementation GKNonFriendSuggestionModifier

- (GKNonFriendSuggestionModifier)initWithContactsController:(id)a3 transactionGroupProvider:(id)a4
{
  id v7;
  id v8;
  GKNonFriendSuggestionModifier *v9;
  GKNonFriendSuggestionModifier *v10;
  id v11;
  id transactionGroupProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKNonFriendSuggestionModifier;
  v9 = -[GKNonFriendSuggestionModifier init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactsController, a3);
    v11 = objc_retainBlock(v8);
    transactionGroupProvider = v10->_transactionGroupProvider;
    v10->_transactionGroupProvider = v11;

  }
  return v10;
}

- (id)modifySuggestions:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = (id)objc_claimAutoreleasedReturnValue(-[GKNonFriendSuggestionModifier nonFriendSuggestionsFromInitialSuggestions:](self, "nonFriendSuggestionsFromInitialSuggestions:", v4));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (id)nonFriendSuggestionsFromInitialSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _BYTE v43[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkValuesForKeyPath:", CFSTR("contactID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKNonFriendSuggestionModifier.m", 55, "-[GKNonFriendSuggestionModifier nonFriendSuggestionsFromInitialSuggestions:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKNonFriendSuggestionModifier contactsController](self, "contactsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkContactsWithContactIDs:", v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100132D18;
  v40[3] = &unk_1002BB4A0;
  v40[4] = self;
  v12 = v11;
  v41 = v12;
  v13 = v7;
  v42 = v13;
  objc_msgSend(v13, "perform:", v40);
  objc_msgSend(v13, "wait");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("relationships")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("contactAssociationIDMap")));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
  v17 = (void *)v16;
  if (v16)
  {
    if (!os_log_GKGeneral)
      v18 = (id)GKOSLoggers(v16);
    v19 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_1001331C8((uint64_t)v17, v19);
  }
  -[GKNonFriendSuggestionModifier populateContactAssocicationIDsForSuggestions:contactAssociationIDMap:](self, "populateContactAssocicationIDsForSuggestions:contactAssociationIDMap:", v4, v15);
  if (objc_msgSend(v14, "count"))
  {
    v31 = v15;
    v32 = v12;
    v33 = v5;
    v20 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v14, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v26, "relationship") != 2)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "handle"));
            objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v23);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100132E50;
    v34[3] = &unk_1002C0260;
    v35 = v20;
    v28 = v20;
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkFilterWithBlock:", v34));

    v12 = v32;
    v5 = v33;
    v15 = v31;
  }
  else
  {
    v29 = v4;
  }

  return v29;
}

- (void)populateContactAssocicationIDsForSuggestions:(id)a3 contactAssociationIDMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v5 = a3;
  v26 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v5, "count")));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "prefixedHandle"));
        if (objc_msgSend(v14, "length"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "prefixedHandle"));
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "prefixedHandle"));
        if (objc_msgSend(v22, "length"))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contactAssociationID"));
          v24 = objc_msgSend(v23, "length");

          if (!v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v22));
            if (objc_msgSend(v25, "length") && (objc_msgSend(v7, "containsObject:", v25) & 1) == 0)
            {
              objc_msgSend(v21, "setContactAssociationID:", v25);
              objc_msgSend(v7, "addObject:", v25);
            }

          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

}

- (GKContactsIntegrationController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsController, a3);
}

- (id)transactionGroupProvider
{
  return self->_transactionGroupProvider;
}

- (void)setTransactionGroupProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transactionGroupProvider, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
}

@end
