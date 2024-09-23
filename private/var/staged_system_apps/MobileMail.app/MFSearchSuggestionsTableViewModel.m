@implementation MFSearchSuggestionsTableViewModel

- (MFSearchSuggestionsTableViewModel)init
{
  -[MFSearchSuggestionsTableViewModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFSearchSuggestionsTableViewModel init]", "MFSearchSuggestionsTableViewModel.m", 74, "0");
}

- (MFSearchSuggestionsTableViewModel)initWithSectionComparator:(id)a3 defaultReuseConfiguration:(id)a4
{
  id v6;
  id v7;
  MFSearchSuggestionsTableViewModel *v8;
  id v9;
  id comparator;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v11;
  MFSearchSuggestionsTableViewModelReuseConfiguration *defaultReuseConfiguration;
  NSMutableDictionary *v13;
  NSMutableDictionary *categoryConfiguration;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFSearchSuggestionsTableViewModel;
  v8 = -[MFSearchSuggestionsTableViewModel init](&v16, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    comparator = v8->_comparator;
    v8->_comparator = v9;

    v11 = (MFSearchSuggestionsTableViewModelReuseConfiguration *)objc_msgSend(v7, "copy");
    defaultReuseConfiguration = v8->_defaultReuseConfiguration;
    v8->_defaultReuseConfiguration = v11;

    -[MFSearchSuggestionsTableViewModelReuseConfiguration validate](v8->_defaultReuseConfiguration, "validate");
    v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    categoryConfiguration = v8->_categoryConfiguration;
    v8->_categoryConfiguration = v13;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSMutableDictionary *objectsByIdentifier;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithSectionComparator:defaultReuseConfiguration:", self->_comparator, self->_defaultReuseConfiguration);
  if (!v4)
    __assert_rtn("-[MFSearchSuggestionsTableViewModel copyWithZone:]", "MFSearchSuggestionsTableViewModel.m", 103, "copy");
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_orderedIdentifiers);
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = (void *)v4[1];
  v4[1] = v7;

  objectsByIdentifier = self->_objectsByIdentifier;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A3AB0;
  v14[3] = &unk_100522868;
  v10 = v4;
  v15 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectsByIdentifier, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel categoryConfiguration](self, "categoryConfiguration"));
  v12 = objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v10, "setCategoryConfiguration:", v12);

  return v10;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel sectionForIdentifier:](self, "sectionForIdentifier:", a3));
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[MFSearchSuggestionsTableViewModel setSection:forIdentifier:](self, "setSection:forIdentifier:", a3, a4);
}

- (unint64_t)numberOfSections
{
  return (unint64_t)-[NSMutableArray count](self->_orderedIdentifiers, "count");
}

- (void)enumerateSections:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, void *, char *);
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];

  v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_orderedIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_objectsByIdentifier, "objectForKeyedSubscript:", v10, (_QWORD)v12));
      v4[2](v4, v7 + v9, v10, v11, &v16);

      if (v16)
        break;
      if (v6 == (id)++v9)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        v7 += v9;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_orderedIdentifiers, "objectAtIndexedSubscript:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel sectionForIdentifier:](self, "sectionForIdentifier:", v4));

  return v5;
}

- (id)identifierAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_orderedIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)indexOfIdentifier:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](self->_orderedIdentifiers, "indexOfObject:", a3);
}

- (id)sectionForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_objectsByIdentifier, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));

  return v4;
}

- (void)setSection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *orderedIdentifiers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *objectsByIdentifier;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_msgSend(v14, "count");
  orderedIdentifiers = self->_orderedIdentifiers;
  if (v7)
  {
    if (!orderedIdentifiers)
    {
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v10 = self->_orderedIdentifiers;
      self->_orderedIdentifiers = v9;

      v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      objectsByIdentifier = self->_objectsByIdentifier;
      self->_objectsByIdentifier = v11;

      orderedIdentifiers = self->_orderedIdentifiers;
    }
    -[NSMutableArray ef_insertObject:usingComparator:allowDuplicates:](orderedIdentifiers, "ef_insertObject:usingComparator:allowDuplicates:", v6, self->_comparator, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_objectsByIdentifier, "setObject:forKeyedSubscript:", v13, v6);

  }
  else
  {
    -[NSMutableArray ef_removeObject:usingComparator:](orderedIdentifiers, "ef_removeObject:usingComparator:", v6, self->_comparator);
    -[NSMutableDictionary removeObjectForKey:](self->_objectsByIdentifier, "removeObjectForKey:", v6);
  }

}

- (void)registerCategory:(id)a3 forReuseConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v6, "validate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel categoryConfiguration](self, "categoryConfiguration"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

- (id)tableViewModelByRemovingItemsAtIndexPaths:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v18 = a3;
  v17 = -[MFSearchSuggestionsTableViewModel copy](self, "copy");
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v18;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "section");
        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL && v10 < -[NSMutableArray count](self->_orderedIdentifiers, "count"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel identifierAtIndex:](self, "identifierAtIndex:", v10));
          v12 = objc_msgSend(v9, "row");
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "addIndex:", v12);
          }
          else
          {
            v14 = objc_msgSend(objc_alloc((Class)NSMutableIndexSet), "initWithIndex:", v12);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A41C8;
  v19[3] = &unk_100522890;
  v15 = v17;
  v20 = v15;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v19);

  return v15;
}

- (id)indexPathForSuggestion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v6 = -[NSMutableArray indexOfObject:](self->_orderedIdentifiers, "indexOfObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_objectsByIdentifier, "objectForKeyedSubscript:", v5));
  v8 = objc_msgSend(v7, "indexOfObject:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, v6));
  return v9;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel objectsByIdentifier](self, "objectsByIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> %@"), v3, self, v4));

  return (NSString *)v5;
}

- (id)_reuseConfigurationForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel categoryConfiguration](self, "categoryConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (!v7)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel defaultReuseConfiguration](self, "defaultReuseConfiguration"));
    if (!v7)
      __assert_rtn("-[MFSearchSuggestionsTableViewModel _reuseConfigurationForSuggestion:]", "MFSearchSuggestionsTableViewModel.m", 226, "reuseConfiguration");
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel identifierAtIndex:](self, "identifierAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel _reuseConfigurationForSuggestion:](self, "_reuseConfigurationForSuggestion:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7));

  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellPopulator"));
  ((void (**)(_QWORD, void *, id, void *))v13)[2](v13, v9, v7, v12);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double (**v9)(_QWORD, _QWORD, _QWORD);
  double v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel _reuseConfigurationForSuggestion:](self, "_reuseConfigurationForSuggestion:", v7));
  v9 = (double (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rowHeightCalculator"));
  v10 = ((double (**)(_QWORD, void *, id))v9)[2](v9, v7, v5);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v9, "row")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel _reuseConfigurationForSuggestion:](self, "_reuseConfigurationForSuggestion:", v6));
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rowSelector"));
  ((void (**)(_QWORD, void *, id))v8)[2](v8, v6, v9);

}

- (NSMutableDictionary)objectsByIdentifier
{
  return self->_objectsByIdentifier;
}

- (void)setObjectsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectsByIdentifier, a3);
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)orderedIdentifiers
{
  return self->_orderedIdentifiers;
}

- (void)setOrderedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, a3);
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration
{
  return self->_defaultReuseConfiguration;
}

- (void)setDefaultReuseConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)categoryConfiguration
{
  return self->_categoryConfiguration;
}

- (void)setCategoryConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_categoryConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_objectsByIdentifier, 0);
}

@end
