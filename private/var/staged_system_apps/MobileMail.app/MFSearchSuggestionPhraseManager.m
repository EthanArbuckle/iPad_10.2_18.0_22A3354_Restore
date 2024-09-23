@implementation MFSearchSuggestionPhraseManager

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A0AA4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA370 != -1)
    dispatch_once(&qword_1005AA370, block);
  return (id)qword_1005AA368;
}

+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 filterQuery:(id)a7 implicitSuggestions:(id)a8 excludedMailboxes:(id)a9 inputLanguages:(id)a10 feedbackQueryID:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = objc_msgSend(objc_alloc((Class)a1), "initWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:scopeIdentifierForPeopleSuggestions:inputLanguages:implicitSuggestions:filterQuery:excludedMailboxes:customFlags:feedbackQueryID:", v17, v18, v19, v20, 0, v24, v22, v21, v23, 0, a11);

  return v25;
}

+ (id)phraseManagerWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 generateCannedSuggestions:(BOOL)a10 excludedMailboxes:(id)a11 feedbackQueryID:(int64_t)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;

  v27 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v25 = objc_msgSend(objc_alloc((Class)a1), "initWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:scopeIdentifierForPeopleSuggestions:inputLanguages:implicitSuggestions:filterQuery:excludedMailboxes:customFlags:feedbackQueryID:", v27, v18, v19, v20, v21, v22, v23, 0, v24, 0, a12);
  objc_msgSend(v25, "setGenerateCannedSuggestions:", a10);

  return v25;
}

- (id)implicitAndSelectedSuggestions
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager implicitSuggestions](self, "implicitSuggestions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager selectedSuggestions](self, "selectedSuggestions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return v5;
}

- (BOOL)hasMailboxSuggestion
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory"));
  LOBYTE(self) = -[MFSearchSuggestionPhraseManager hasCategory:andScope:](self, "hasCategory:andScope:", v3, MFSearchSuggestionMailboxCategoryScope);

  return (char)self;
}

- (BOOL)hasSuggestionWithPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager selectedSuggestions](self, "selectedSuggestions", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "predicate"));
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)hasCategory:(id)a3 andScope:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager implicitAndSelectedSuggestions](self, "implicitAndSelectedSuggestions"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "category", (_QWORD)v19));
        v14 = objc_msgSend(v13, "isGroupedInCategory:", v6);

        if (v7)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedScope"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

        }
        else
        {
          v17 = 1;
        }
        if ((v14 & v17 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v9;
}

- (BOOL)generateCannedSuggestions
{
  return self->_generateCannedSuggestions;
}

- (void)setGenerateCannedSuggestions:(BOOL)a3
{
  self->_generateCannedSuggestions = a3;
}

- (id)_spotlightQueryStringForVIP
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager vipManager](self, "vipManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allVIPEmailAddresses"));

  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v4);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      v8 = MDItemAuthorEmailAddresses;
      v9 = MDItemAuthors;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(obj);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "em_stringForQuotingWithCharacter:", 39));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@ = '%@'cd) || (%@ = '%@'cd)"), v8, v11, v9, v11));
          objc_msgSend(v5, "addObject:", v12);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EMSearchableIndexQuery queryStringByJoiningQueries:withOperand:](EMSearchableIndexQuery, "queryStringByJoiningQueries:withOperand:", v5, 2));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)spotlightQueryStrings
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v22 = objc_alloc_init((Class)NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager implicitAndSelectedSuggestions](self, "implicitAndSelectedSuggestions"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForIsVIP:](EMMessageListItemPredicates, "predicateForIsVIP:", 1));
        v10 = objc_msgSend(v8, "ef_containsSubpredicate:", v9);

        if (v10)
        {
          v11 = objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager _spotlightQueryStringForVIP](self, "_spotlightQueryStringForVIP"));
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "category"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory"));
          v14 = v12 == v13;

          if (!v14)
          {
            v15 = 0;
            goto LABEL_13;
          }
          v11 = objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager mailboxSpotlightQueryStringForPredicate:excluding:](self, "mailboxSpotlightQueryStringForPredicate:excluding:", v8, 0));
        }
        v15 = (void *)v11;
        if (v11)
          objc_msgSend(v22, "addObject:", v11);
LABEL_13:

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager excludedMailboxes](self, "excludedMailboxes"));
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager excludedMailboxes](self, "excludedMailboxes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxes:](EMMessageListItemPredicates, "predicateForExcludingMessagesInMailboxes:", v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager mailboxSpotlightQueryStringForPredicate:excluding:](self, "mailboxSpotlightQueryStringForPredicate:excluding:", v19, 1));
    objc_msgSend(v22, "addObject:", v20);

  }
  return v22;
}

- (id)mailboxSpotlightQueryStringForPredicate:(id)a3 excluding:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  BOOL v13;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates mailboxURLsForPredicate:](EMMessageListItemPredicates, "mailboxURLsForPredicate:", v5));
  if (!objc_msgSend(v6, "count"))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MFSearchSuggestionPhraseManager log](MFSearchSuggestionPhraseManager, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_100394960((uint64_t)v5, v7);

  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A1834;
  v12[3] = &unk_1005227C0;
  v13 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_map:", v12));
  if (v4)
    v9 = 1;
  else
    v9 = 2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EMSearchableIndexQuery queryStringByJoiningQueries:withOperand:](EMSearchableIndexQuery, "queryStringByJoiningQueries:withOperand:", v8, v9));

  return v10;
}

- (id)mailboxURLs
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v19 = objc_alloc_init((Class)NSMutableSet);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionPhraseManager implicitAndSelectedSuggestions](self, "implicitAndSelectedSuggestions"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    v6 = MFSearchSuggestionMailboxCategoryScope;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestion"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "category"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory mailboxCategory](MUISearchSuggestionCategory, "mailboxCategory"));
        v12 = v10 == v11;

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedScope"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
          v15 = objc_msgSend(v14, "isEqualToString:", v6);

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predicate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates mailboxURLsForPredicate:](EMMessageListItemPredicates, "mailboxURLsForPredicate:", v16));
            objc_msgSend(v19, "addObjectsFromArray:", v17);

          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  return v19;
}

@end
