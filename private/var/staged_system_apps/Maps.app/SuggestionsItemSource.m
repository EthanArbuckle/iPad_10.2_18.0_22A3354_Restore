@implementation SuggestionsItemSource

- (SuggestionsItemSource)init
{
  SuggestionsItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  NSArray *suggestions;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SuggestionsItemSource;
  v2 = -[PersonalizedItemSource initWithSourceType:sourceSubtype:](&v9, "initWithSourceType:sourceSubtype:", 9, 0);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("SuggestionsItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

    suggestions = v2->_suggestions;
    v2->_suggestions = (NSArray *)&__NSArray0__struct;

  }
  return v2;
}

- (id)allItems
{
  NSObject *lockQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100292B30;
  v10 = sub_100292B40;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100292B48;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *suggestions;
  NSArray *v7;
  id v8;
  id v9;
  unsigned __int16 v10;
  uint64_t v11;
  void *i;
  void *v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  SuggestionsItem *v17;
  NSObject *lockQueue;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  suggestions = self->_suggestions;
  self->_suggestions = v5;

  v20 = v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_suggestions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 1;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "type") != (id)5
          && objc_msgSend(v13, "type") != (id)24
          && (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled")
           || objc_msgSend(v13, "type") != (id)18
           && objc_msgSend(v13, "type") != (id)1
           && objc_msgSend(v13, "type") != (id)2
           && objc_msgSend(v13, "type") != (id)19))
        {
          v14 = -[PersonalizedItemSource sourceType](self, "sourceType");
          v15 = -[PersonalizedItemSource sourceSubtype](self, "sourceSubtype");
          if (v14)
          {
            v16 = v15;
          }
          else
          {
            v14 = 9;
            v16 = 0;
          }
          if (v14 == 9 && !v16)
            v16 = +[SuggestionsItemSource itemSourceSubtypeForSuggestionsEntryType:](SuggestionsItemSource, "itemSourceSubtypeForSuggestionsEntryType:", objc_msgSend(v13, "type"));
          v17 = -[SuggestionsItem initWithSuggestion:order:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:]([SuggestionsItem alloc], "initWithSuggestion:order:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:", v13, v10, v14, v16, 0, 0);
          if (v17)
          {
            objc_msgSend(v21, "addObject:", v17);
            ++v10;
          }

        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100292E50;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v23 = v21;
  v19 = v21;
  dispatch_sync(lockQueue, block);
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

}

+ (int64_t)itemSourceSubtypeForSuggestionsEntryType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x18)
    return 13;
  else
    return qword_100E34C28[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
