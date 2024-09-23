@implementation GKFriendSuggester

+ (id)serialQueue
{
  if (qword_100317F78 != -1)
    dispatch_once(&qword_100317F78, &stru_1002C2C80);
  return (id)qword_100317F70;
}

- (GKFriendSuggester)initWithDeniedContactIDs:(id)a3 settingsProvider:(id)a4
{
  id v7;
  id v8;
  GKFriendSuggester *v9;
  GKFriendSuggester *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GKFriendSuggester;
  v9 = -[GKFriendSuggester init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deniedContactIDs, a3);
    objc_storeStrong((id *)&v10->_settingsProvider, a4);
  }

  return v10;
}

- (void)suggestionsWithRerankRequester:(id)a3 contactsIntegrationController:(id)a4 transactionGroupProvider:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD);
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t (**v17)(_QWORD);
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(_QWORD))a5;
  v13 = a6;
  v14 = v12[2](v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000F8B30;
  v20[3] = &unk_1002C2D10;
  v20[4] = self;
  v21 = v11;
  v22 = v10;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v15, "performOnManagedObjectContext:", v20);

}

- (id)cachedContactAssocicationIDsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDSuggestedFriends _gkFetchRequest](GKCDSuggestedFriends, "_gkFetchRequest"));
  objc_msgSend(v4, "setReturnsDistinctResults:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObject _gkRetrieveCleanEntry:request:](NSManagedObject, "_gkRetrieveCleanEntry:request:", v3, v4));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate")),
        v7 = objc_msgSend(v5, "_gkIsExpired:", v6),
        v6,
        (v7 & 1) == 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactAssociationIDs"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)rerankedHandlesWithContactsIntegrationController:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendSuggester cachedContactAssocicationIDsWithContext:](self, "cachedContactAssocicationIDsWithContext:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handleMapForContactAssociationIDs:withContext:", v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), (_QWORD)v20));
        if (objc_msgSend(v17, "length"))
          objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = objc_msgSend(v11, "copy");
  return v18;
}

- (void)gameInviteSuggestionsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  GKFriendSuggester *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendSuggester.m", 164, "-[GKFriendSuggester gameInviteSuggestionsWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F92EC;
  v17[3] = &unk_1002BB590;
  v17[4] = self;
  v7 = v6;
  v18 = v7;
  objc_msgSend(v7, "perform:", v17);
  v9 = objc_msgSend((id)objc_opt_class(self, v8), "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F9448;
  v13[3] = &unk_1002BB568;
  v14 = v7;
  v15 = self;
  v16 = v4;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v12, "notifyOnQueue:block:", v10, v13);

}

- (id)peopleSuggesterGameInviteSuggestionsWithLimit:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = objc_alloc_init((Class)_PSContactSuggester);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameCenterSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:includeGroupSuggestions:excludeContactsByIdentifiers:", -[GKFriendSuggester calculateCoreRecencyUpperLimit:](self, "calculateCoreRecencyUpperLimit:", v4), 0, 1, 1, &__NSArray0__struct));

  return v6;
}

- (id)peopleSuggesterConvertedFriendSuggestionsWithLimit:(unint64_t)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v5 = objc_alloc_init((Class)_PSContactSuggester);
  v6 = -[GKFriendSuggester calculateCoreRecencyUpperLimit:](self, "calculateCoreRecencyUpperLimit:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendSuggester deniedContactIDs](self, "deniedContactIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gameCenterSuggestionsWithMaxSuggestions:interactionDomains:appleUsersOnly:includeGroupSuggestions:excludeContactsByIdentifiers:", v6, 0, 1, 0, v8));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkMapWithBlock:", &stru_1002C2D78));
  v11 = (void *)v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_1000FA28C();

  return v11;
}

- (void)modifyCachedSuggestions:(id)a3 modifiers:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKFriendSuggester *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendSuggester.m", 226, "-[GKFriendSuggester modifyCachedSuggestions:modifiers:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000F9870;
  v27[3] = &unk_1002BB590;
  v27[4] = self;
  v13 = v12;
  v28 = v13;
  objc_msgSend(v13, "perform:", v27);
  v15 = objc_msgSend((id)objc_opt_class(self, v14), "serialQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000F9964;
  v21[3] = &unk_1002C2DA0;
  v22 = v13;
  v23 = v8;
  v24 = self;
  v25 = v10;
  v26 = v9;
  v17 = v9;
  v18 = v10;
  v19 = v8;
  v20 = v13;
  objc_msgSend(v20, "notifyOnQueue:block:", v16, v21);

}

- (id)modifiersWithSettings:(id)a3 contactsIntegrationController:(id)a4 hasCachedSuggestions:(BOOL)a5 cachedSortedAssociationIDs:(id)a6 rerankRequester:(id)a7 transactionGroupProvider:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  GKTrimSuggestionsModifier *v18;
  GKNonFriendSuggestionModifier *v19;
  GKSortSuggestionsModifier *v20;
  GKDeniedSuggestionsModifier *v21;
  void *v22;
  GKDeniedSuggestionsModifier *v23;
  GKAppendSuggestionsModifier *v24;
  GKNonFriendSuggestionModifier *v25;
  GKAppendSuggestionsModifier *v26;
  void *v27;
  _QWORD v30[4];
  GKNonFriendSuggestionModifier *v31;
  GKFriendSuggester *v32;
  _QWORD v33[3];
  _QWORD v34[5];

  v11 = a5;
  v13 = a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a4;
  v18 = -[GKTrimSuggestionsModifier initWithSettings:]([GKTrimSuggestionsModifier alloc], "initWithSettings:", v13);
  v19 = -[GKNonFriendSuggestionModifier initWithContactsController:transactionGroupProvider:]([GKNonFriendSuggestionModifier alloc], "initWithContactsController:transactionGroupProvider:", v17, v14);

  v20 = -[GKSortSuggestionsModifier initWithSettings:networkRequester:cachedSortedAssociationIDs:transactionGroupProvider:featureEnabledBlock:]([GKSortSuggestionsModifier alloc], "initWithSettings:networkRequester:cachedSortedAssociationIDs:transactionGroupProvider:featureEnabledBlock:", v13, v15, v16, v14, &stru_1002C2DE0);
  if (v11)
  {
    v21 = [GKDeniedSuggestionsModifier alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendSuggester deniedContactIDs](self, "deniedContactIDs"));
    v23 = -[GKDeniedSuggestionsModifier initWithDeniedContactIDs:](v21, "initWithDeniedContactIDs:", v22);

    v24 = [GKAppendSuggestionsModifier alloc];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000F9E18;
    v30[3] = &unk_1002C2E08;
    v25 = v19;
    v31 = v25;
    v32 = self;
    v26 = -[GKAppendSuggestionsModifier initWithSettings:suggestionsProvider:](v24, "initWithSettings:suggestionsProvider:", v13, v30);
    v34[0] = v23;
    v34[1] = v25;
    v34[2] = v20;
    v34[3] = v26;
    v34[4] = v18;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));

  }
  else
  {
    v33[0] = v19;
    v33[1] = v20;
    v33[2] = v18;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 3));
  }

  return v27;
}

- (unint64_t)calculateCoreRecencyUpperLimit:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v5 = objc_msgSend(v4, "coreRecentUpperLimit");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v7 = objc_msgSend(v6, "coreRecentMultiplier");

  v8 = (_QWORD)objc_msgSend(v3, "longValue") * (_QWORD)v7;
  v9 = objc_msgSend(v3, "longValue");

  if (v8 < (unint64_t)v9 || v8 > (unint64_t)v5)
    return 50;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
    v17 = 136315394;
    v18 = "-[GKFriendSuggester calculateCoreRecencyUpperLimit:]";
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Limiting upper boundry for core recent query to: %@", (uint8_t *)&v17, 0x16u);

  }
  return v8;
}

- (NSSet)deniedContactIDs
{
  return self->_deniedContactIDs;
}

- (void)setDeniedContactIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deniedContactIDs, a3);
}

- (GKFriendSuggesterSettingsProvider)settingsProvider
{
  return self->_settingsProvider;
}

- (void)setSettingsProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsProvider, 0);
  objc_storeStrong((id *)&self->_deniedContactIDs, 0);
}

@end
