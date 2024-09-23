@implementation SharedTripSuggestionsDataSource

+ (void)prefetchSuggestionsAndCapabilitiesWithContext:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  id v20;

  v3 = a3;
  if ((MSPSharedTripSharingAvailable(v3, v4) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "automaticSharingContacts"));
    if (-[NSObject count](v5, "count"))
    {
      v6 = sub_10043237C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v20 = -[NSObject count](v5, "count");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will prefetch %lu autoshare contacts", buf, 0xCu);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
      objc_msgSend(v8, "requestCapabilityLevelsForContacts:", v5);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routingToContacts"));
    if (v9)
    {
      v10 = sub_10043237C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v9;
        if (objc_msgSend(v12, "count"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v12, v13));

        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v12));
        }

        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will provide routingToContacts: %@", buf, 0xCu);

      }
    }
    v16 = sub_10043237C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource:prefetch will now prefetch suggestions+capabilities", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
    objc_msgSend(v18, "requestFreshSuggestionsWithSeedContacts:", v9);

  }
  else
  {
    v15 = sub_10043237C();
    v5 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource will not prefetch suggestions/capabilities, sharing not available", buf, 2u);
    }
  }

}

- (SharedTripSuggestionsDataSource)initWithSoftCellCap:(unint64_t)a3 includeActiveContacts:(BOOL)a4
{
  SharedTripSuggestionsDataSource *v6;
  SharedTripSuggestionsDataSource *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SharedTripSuggestionsDataSource;
  v6 = -[SharedTripSuggestionsDataSource init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v6->_softCap = a3;
    v6->_includeActiveContacts = a4;
    v8 = objc_alloc((Class)NSOrderedSet);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "receivers"));
    v11 = objc_msgSend(v8, "initWithArray:", v10);
    -[SharedTripSuggestionsDataSource setActiveContacts:](v7, "setActiveContacts:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](v7, "activeContacts"));
    v13 = sub_10039DCD4(v12, &stru_1011D8E88);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[SharedTripSuggestionsDataSource setInitiallyActiveHandles:](v7, "setInitiallyActiveHandles:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v15, "addSendingObserver:", v7);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
    objc_msgSend(v16, "registerObserver:", v7);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
    objc_msgSend(v17, "addObserver:", v7);

    -[SharedTripSuggestionsDataSource _updateFromCache](v7, "_updateFromCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
    objc_msgSend(v18, "requestFreshSuggestions");

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v4, "removeSendingObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SharedTripSuggestionsDataSource;
  -[SharedTripSuggestionsDataSource dealloc](&v6, "dealloc");
}

- (void)setSoftCap:(unint64_t)a3
{
  if (self->_softCap != a3)
  {
    self->_softCap = a3;
    -[SharedTripSuggestionsDataSource dataDidUpdateAnimatingChanges:](self, "dataDidUpdateAnimatingChanges:", 0);
  }
}

- (void)_updateFromCache
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_10043237C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource updating from cached suggestions", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestedContacts"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v6));
  -[SharedTripSuggestionsDataSource setOrderedSuggestions:](self, "setOrderedSuggestions:", v7);

}

- (void)addTableView:(id)a3 cellProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource tableView](self, "tableView"));

  if (v7 != v12)
  {
    -[SharedTripSuggestionsDataSource setTableView:](self, "setTableView:", v12);
    v8 = objc_alloc((Class)UITableViewDiffableDataSource);
    v9 = sub_10046D908(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithTableView:cellProvider:", v12, v10);
    -[SharedTripSuggestionsDataSource setTableViewDataSource:](self, "setTableViewDataSource:", v11);

    -[SharedTripSuggestionsDataSource dataDidUpdate](self, "dataDidUpdate");
  }

}

- (void)clearTableView
{
  -[SharedTripSuggestionsDataSource setTableViewDataSource:](self, "setTableViewDataSource:", 0);
  -[SharedTripSuggestionsDataSource setTableView:](self, "setTableView:", 0);
}

- (BOOL)isRefreshing
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
  v3 = objc_msgSend(v2, "isRefreshing");

  return v3;
}

- (void)suggestionsWillUpdateInCache:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043237C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified cache updated", v6, 2u);
  }

  -[SharedTripSuggestionsDataSource dataWillUpdate](self, "dataWillUpdate");
}

- (void)suggestionsDidUpdateInCache:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043237C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified cache updated", v6, 2u);
  }

  -[SharedTripSuggestionsDataSource _updateFromCache](self, "_updateFromCache");
  -[SharedTripSuggestionsDataSource dataDidUpdate](self, "dataDidUpdate");
}

- (void)dataWillUpdate
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "suggestionsDataSourceWillUpdateContactsForDisplay:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource delegate](self, "delegate"));
    objc_msgSend(v5, "suggestionsDataSourceWillUpdateContactsForDisplay:", self);

  }
}

- (void)dataDidUpdate
{
  -[SharedTripSuggestionsDataSource dataDidUpdateAnimatingChanges:](self, "dataDidUpdateAnimatingChanges:", 1);
}

- (void)dataDidUpdateAnimatingChanges:(BOOL)a3
{
  -[SharedTripSuggestionsDataSource dataDidUpdateForHandles:animatingChanges:](self, "dataDidUpdateForHandles:animatingChanges:", 0, a3);
}

- (void)dataDidUpdateForHandles:(id)a3 animatingChanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  SharedTripContactSearchItem *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint8_t v27[16];
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  SharedTripContactSearchItem *contactSearchItem;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource tableViewDataSource](self, "tableViewDataSource"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactsForDisplay](self, "contactsForDisplay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:](NSDiffableDataSourceSnapshot, "_maps_singleSectionSnapshotWithIdentifiersForItems:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource changedContacts](self, "changedContacts"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource changedContacts](self, "changedContacts"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100843B58;
      v30[3] = &unk_1011D8EB0;
      v30[4] = self;
      v13 = sub_10039DCD4(v12, v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      objc_msgSend(v9, "reconfigureItemsWithIdentifiers:", v14);
    }
    if (objc_msgSend(v6, "count"))
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100843BB0;
      v28[3] = &unk_1011D8EB0;
      v29 = v6;
      v15 = sub_10039DCD4(v8, v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v9, "reconfigureItemsWithIdentifiers:", v16);

    }
    if (-[SharedTripSuggestionsDataSource showsContactSearchItem](self, "showsContactSearchItem"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifiers"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

      contactSearchItem = self->_contactSearchItem;
      v19 = contactSearchItem;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &contactSearchItem, 1));
      v21 = objc_msgSend(v9, "_maps_appendIdentifiersForSection:items:", v19, v20);

      if (v18
        && (id)-[SharedTripSuggestionsDataSource contactSearchItemPosition](self, "contactSearchItemPosition") == (id)2)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactSearchItemIdentifier](self, "contactSearchItemIdentifier"));
        objc_msgSend(v9, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", v22, v18);

      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource tableViewDataSource](self, "tableViewDataSource"));
    objc_msgSend(v23, "applySnapshot:animatingDifferences:", v9, v4);

  }
  v24 = sub_10043237C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource data did update", v27, 2u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource delegate](self, "delegate"));
  objc_msgSend(v26, "suggestionsDataSourceDidUpdateContactsForDisplay:", self);

  -[SharedTripSuggestionsDataSource setChangedContacts:](self, "setChangedContacts:", 0);
}

- (BOOL)showsContactSearchItem
{
  void *v2;
  unsigned __int8 v3;

  if (!self->_showContactSearchItem)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v3 = objc_msgSend(v2, "canAddReceivers");

  return v3;
}

- (void)setShowContactSearchItem:(BOOL)a3
{
  SharedTripContactSearchItem *v4;
  SharedTripContactSearchItem *contactSearchItem;

  if (self->_showContactSearchItem != a3)
  {
    self->_showContactSearchItem = a3;
    if (a3)
    {
      v4 = objc_alloc_init(SharedTripContactSearchItem);
      contactSearchItem = self->_contactSearchItem;
      self->_contactSearchItem = v4;
    }
    else
    {
      contactSearchItem = self->_contactSearchItem;
      self->_contactSearchItem = 0;
    }

    -[SharedTripSuggestionsDataSource dataDidUpdate](self, "dataDidUpdate");
  }
}

- (id)contactSearchItemIdentifier
{
  SharedTripContactSearchItem *contactSearchItem;
  id v3;

  contactSearchItem = self->_contactSearchItem;
  if (contactSearchItem)
  {
    v3 = sub_10046DCCC(contactSearchItem);
    contactSearchItem = (SharedTripContactSearchItem *)objc_claimAutoreleasedReturnValue(v3);
  }
  return contactSearchItem;
}

- (BOOL)isContactSearchItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_contactSearchItem)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource tableViewDataSource](self, "tableViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactSearchItemIdentifier](self, "contactSearchItemIdentifier"));
  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v7);

  return (char)v4;
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v5 = a4;
  v6 = sub_10043237C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218243;
    v9 = objc_msgSend(v5, "count");
    v10 = 2113;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified capabilityLevelsDidUpdate for %lu handles (%{private}@)", (uint8_t *)&v8, 0x16u);
  }

  -[SharedTripSuggestionsDataSource dataDidUpdateForHandles:animatingChanges:](self, "dataDidUpdateForHandles:animatingChanges:", v5, 1);
}

- (void)sharedTripService:(id)a3 sharingDidInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_10043237C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didInvalidateWithError: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[SharedTripSuggestionsDataSource _refreshWithActiveContacts:](self, "_refreshWithActiveContacts:", &__NSArray0__struct);
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didUpdateSendingAvailability", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receivers"));
  -[SharedTripSuggestionsDataSource _refreshWithActiveContacts:](self, "_refreshWithActiveContacts:", v7);

}

- (void)sharedTripService:(id)a3 didUpdateReceivers:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = sub_10043237C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource notified didUpdateReceivers", v8, 2u);
  }

  -[SharedTripSuggestionsDataSource _refreshWithActiveContacts:](self, "_refreshWithActiveContacts:", v5);
}

- (void)_refreshWithActiveContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
  v6 = objc_msgSend(v5, "copy");
  -[SharedTripSuggestionsDataSource setWereActiveContacts:](self, "setWereActiveContacts:", v6);

  v7 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithArray:", v4);
  -[SharedTripSuggestionsDataSource setActiveContacts:](self, "setActiveContacts:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource wereActiveContacts](self, "wereActiveContacts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource findChangedContactsWithNewActiveSet:previousActiveSet:](self, "findChangedContactsWithNewActiveSet:previousActiveSet:", v7, v8));
  -[SharedTripSuggestionsDataSource setChangedContacts:](self, "setChangedContacts:", v9);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        if (!-[NSArray containsObject:](self->_contactsForDisplay, "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)))
        {
          -[SharedTripSuggestionsDataSource resetContactsForDisplayOrdering](self, "resetContactsForDisplayOrdering");
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  -[SharedTripSuggestionsDataSource dataDidUpdate](self, "dataDidUpdate");
}

- (id)findChangedContactsWithNewActiveSet:(id)a3 previousActiveSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:", v6));
  objc_msgSend(v7, "minusOrderedSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:", v5));

  objc_msgSend(v8, "minusOrderedSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:", v8));
  objc_msgSend(v9, "unionOrderedSet:", v7);
  v10 = sub_10043237C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_msgSend(v9, "count");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKeyPath:", CFSTR("stringValue")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKeyPath:", CFSTR("stringValue")));
    v17 = 134218499;
    v18 = v12;
    v19 = 2113;
    v20 = v13;
    v21 = 2113;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource found changed %lu contacts:\nremoved: %{private}@\nadded: %{private}@", (uint8_t *)&v17, 0x20u);

  }
  v15 = objc_msgSend(v9, "copy");

  return v15;
}

- (id)_recommendedContactsForDisplay
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  if (-[SharedTripSuggestionsDataSource includeActiveContacts](self, "includeActiveContacts"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
    v4 = objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
  }
  v5 = objc_msgSend(v4, "count");
  if (v5 < (id)-[SharedTripSuggestionsDataSource softCap](self, "softCap"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource wereActiveContacts](self, "wereActiveContacts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource orderedSuggestions](self, "orderedSuggestions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "array"));
    objc_msgSend(v4, "addObjectsFromArray:", v9);

    v10 = objc_msgSend(v4, "count");
    if (v10 > (id)-[SharedTripSuggestionsDataSource softCap](self, "softCap"))
      objc_msgSend(v4, "removeObjectsInRange:", -[SharedTripSuggestionsDataSource softCap](self, "softCap"), (_BYTE *)objc_msgSend(v4, "count") - (_BYTE *)-[SharedTripSuggestionsDataSource softCap](self, "softCap"));
  }
  if (!-[SharedTripSuggestionsDataSource includeActiveContacts](self, "includeActiveContacts"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
    objc_msgSend(v4, "minusOrderedSet:", v11);

  }
  return v4;
}

- (NSArray)contactsForDisplay
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSArray *v18;
  NSArray *contactsForDisplay;
  NSArray *v20;
  id v21;
  NSObject *v22;
  void *v24;
  void *v25;
  NSArray *obj;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v4 = objc_msgSend(v3, "canAddReceivers");

  if ((v4 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource _recommendedContactsForDisplay](self, "_recommendedContactsForDisplay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_contactsForDisplay;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1008447FC;
          v27[3] = &unk_1011D8ED8;
          v27[4] = v10;
          v11 = objc_msgSend(v5, "indexOfObjectPassingTest:", v27);
          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v11));
            objc_msgSend(v25, "addObject:", v12);

            objc_msgSend(v5, "removeObject:", v10);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));
    v14 = v25;
    objc_msgSend(v25, "addObjectsFromArray:", v13);

    v15 = sub_10043237C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKeyPath:", CFSTR("stringValue")));
      *(_DWORD *)buf = 138477827;
      v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource calculated contacts for display: %{private}@", buf, 0xCu);

    }
    v18 = (NSArray *)objc_msgSend(v25, "copy");
    contactsForDisplay = self->_contactsForDisplay;
    self->_contactsForDisplay = v18;

    v20 = self->_contactsForDisplay;
  }
  else
  {
    v21 = sub_10043237C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SharedTripSuggestionsDataSource only showing active contacts, unable to add receivers at this time", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "array"));
  }

  return v20;
}

- (void)resetContactsForDisplayOrdering
{
  id v3;
  NSObject *v4;
  NSArray *contactsForDisplay;
  uint8_t v6[16];

  v3 = sub_10043237C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource reset contacts for display", v6, 2u);
  }

  contactsForDisplay = self->_contactsForDisplay;
  self->_contactsForDisplay = (NSArray *)&__NSArray0__struct;

}

- (void)toggleContact:(id)a3
{
  -[SharedTripSuggestionsDataSource toggleContact:startSharingCompletion:stopSharingCompletion:](self, "toggleContact:startSharingCompletion:stopSharingCompletion:", a3, 0, 0);
}

- (void)toggleContact:(id)a3 startSharingCompletion:(id)a4 stopSharingCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v12 = objc_msgSend(v11, "isSharingWithContact:", v8);

  v13 = sub_10043237C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
      *(_DWORD *)buf = 138477827;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource toggle contact off: %{private}@", buf, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100844BD4;
    v30[3] = &unk_1011AE218;
    v18 = &v31;
    v31 = v10;
    objc_msgSend(v17, "stopSharingWithContact:completion:", v8, v30);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource initiallyActiveHandles](self, "initiallyActiveHandles"));
    v20 = objc_msgSend(v19, "mutableCopy");

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    objc_msgSend(v20, "removeObject:", v21);

    v22 = objc_msgSend(v20, "copy");
    -[SharedTripSuggestionsDataSource setInitiallyActiveHandles:](self, "setInitiallyActiveHandles:", v22);

  }
  else
  {
    if (v15)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
      *(_DWORD *)buf = 138477827;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource toggle contact on: %{private}@", buf, 0xCu);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100844BE8;
    v27[3] = &unk_1011D8F00;
    v18 = &v28;
    v25 = v8;
    v28 = v25;
    v29 = v9;
    objc_msgSend(v24, "startSharingWithContact:completion:", v25, v27);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
    objc_msgSend(v26, "provideFeedbackForContact:", v25);

    v20 = v29;
  }

}

- (void)abandon
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_10043237C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharedTripSuggestionsDataSource abandon", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SharedTripSuggestionsCache sharedInstance](SharedTripSuggestionsCache, "sharedInstance"));
  objc_msgSend(v4, "provideAbandonmentFeedback");

}

- (unint64_t)sharingStateForContact:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v6 = objc_msgSend(v5, "isSharingWithContact:", v4);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource initiallyActiveHandles](self, "initiallyActiveHandles"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
      v10 = objc_msgSend(v8, "containsObject:", v9);

      if (v10)
        v11 = 2;
      else
        v11 = 3;
    }
    else
    {

      v11 = 3;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)contactForItemIdentifier:(id)a3
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
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource activeContacts](self, "activeContacts"));
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource wereActiveContacts](self, "wereActiveContacts"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource wereActiveContacts](self, "wereActiveContacts"));
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource orderedSuggestions](self, "orderedSuggestions"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource orderedSuggestions](self, "orderedSuggestions"));
    objc_msgSend(v5, "addObject:", v11);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v16);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100845008;
        v21[3] = &unk_1011D8ED8;
        v22 = v4;
        v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", v21);
        if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v18));

          goto LABEL_17;
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
        continue;
      break;
    }
  }

  v19 = objc_alloc_init((Class)MSPSharedTripContact);
LABEL_17:

  return v19;
}

- (id)contactForItemIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource tableViewDataSource](self, "tableViewDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSuggestionsDataSource contactForItemIdentifier:](self, "contactForItemIdentifier:", v6));
  return v7;
}

- (NSOrderedSet)changedContacts
{
  return self->_changedContacts;
}

- (void)setChangedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_changedContacts, a3);
}

- (int64_t)contactSearchItemPosition
{
  return self->_contactSearchItemPosition;
}

- (void)setContactSearchItemPosition:(int64_t)a3
{
  self->_contactSearchItemPosition = a3;
}

- (SharedTripSuggestionsDataSourceDelegate)delegate
{
  return (SharedTripSuggestionsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)softCap
{
  return self->_softCap;
}

- (BOOL)includeActiveContacts
{
  return self->_includeActiveContacts;
}

- (void)setIncludeActiveContacts:(BOOL)a3
{
  self->_includeActiveContacts = a3;
}

- (NSOrderedSet)orderedSuggestions
{
  return self->_orderedSuggestions;
}

- (void)setOrderedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSuggestions, a3);
}

- (NSOrderedSet)activeContacts
{
  return self->_activeContacts;
}

- (void)setActiveContacts:(id)a3
{
  objc_storeStrong((id *)&self->_activeContacts, a3);
}

- (NSOrderedSet)wereActiveContacts
{
  return self->_wereActiveContacts;
}

- (void)setWereActiveContacts:(id)a3
{
  objc_storeStrong((id *)&self->_wereActiveContacts, a3);
}

- (NSArray)initiallyActiveHandles
{
  return self->_initiallyActiveHandles;
}

- (void)setInitiallyActiveHandles:(id)a3
{
  objc_storeStrong((id *)&self->_initiallyActiveHandles, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewDataSource, a3);
}

- (SharedTripContactSearchItem)contactSearchItem
{
  return self->_contactSearchItem;
}

- (void)setContactSearchItem:(id)a3
{
  objc_storeStrong((id *)&self->_contactSearchItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSearchItem, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_initiallyActiveHandles, 0);
  objc_storeStrong((id *)&self->_wereActiveContacts, 0);
  objc_storeStrong((id *)&self->_activeContacts, 0);
  objc_storeStrong((id *)&self->_orderedSuggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changedContacts, 0);
  objc_storeStrong((id *)&self->_contactsForDisplay, 0);
}

@end
