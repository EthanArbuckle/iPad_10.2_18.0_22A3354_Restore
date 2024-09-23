@implementation AutocompleteItemSource

- (AutocompleteItemSource)init
{

  return 0;
}

- (AutocompleteItemSource)initWithServerCompletions:(id)a3 serverSections:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  AutocompleteItem *v13;
  void *v14;
  AutocompleteItem *v15;
  id v16;
  AutocompleteItemSource *v17;
  AutocompleteItemSource *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v19 = self;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "hasSortPriority", v19);
        if ((_DWORD)v11)
          v12 = objc_msgSend(v10, "sortPriority");
        else
          v12 = 0;
        v13 = [AutocompleteItem alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverResultScoreMetadata"));
        v15 = -[AutocompleteItem initWithServerCompletion:hasPriorityOverride:priorityOverride:serverResultScoreMetadata:](v13, "initWithServerCompletion:hasPriorityOverride:priorityOverride:serverResultScoreMetadata:", v10, v11, v12, v14);

        objc_msgSend(v5, "addObject:", v15);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v16 = objc_msgSend(v5, "copy");
  v17 = -[AutocompleteItemSource initWithAutocompleteItems:](v19, "initWithAutocompleteItems:", v16);

  if (v17)
    v17->_sourceType = 1;

  return v17;
}

- (AutocompleteItemSource)initWithAutocompleteItems:(id)a3
{
  id v4;
  AutocompleteItemSource *v5;
  NSArray *v6;
  NSArray *allItems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocompleteItemSource;
  v5 = -[AutocompleteItemSource init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    allItems = v5->_allItems;
    v5->_allItems = v6;

  }
  return v5;
}

- (id)allItems
{
  return self->_allItems;
}

- (unint64_t)count
{
  return -[NSArray count](self->_allItems, "count");
}

- (id)debugDescription
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[AutocompleteItemSource sourceType](self, "sourceType");
  v4 = CFSTR("Client Results");
  if (v3 == 1)
    v4 = CFSTR("Server results");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - type: %@"), self, v4);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end
