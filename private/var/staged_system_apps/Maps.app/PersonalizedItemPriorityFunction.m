@implementation PersonalizedItemPriorityFunction

- (PersonalizedItemPriorityFunction)initWithEntries:(id)a3
{
  id v4;
  PersonalizedItemPriorityFunction *v5;
  NSArray *v6;
  NSArray *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedItemPriorityFunction;
  v5 = -[PersonalizedItemPriorityFunction init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    entries = v5->_entries;
    v5->_entries = v6;

  }
  return v5;
}

- (int64_t)priorityForPersonalizedAutocompleteItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if (objc_msgSend(v4, "hasPriorityOverride"))
  {
    v5 = objc_msgSend(v4, "priorityOverride");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemPriorityFunction entries](self, "entries", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v11, "matches:", v4) & 1) != 0)
          {
            v5 = objc_msgSend(v11, "priority");

            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return (int64_t)v5;
}

+ (id)priorityFunctionForGEOSortPriorityMapping:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PersonalizedItemPriorityFunctionEntry *v10;
  PersonalizedItemPriorityFunction *v11;
  void *v13;
  id obj;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entries"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = -[PersonalizedItemPriorityFunctionEntry initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:]([PersonalizedItemPriorityFunctionEntry alloc], "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", objc_msgSend(v9, "priority"), objc_msgSend(v9, "resultType") == (id)1, objc_msgSend(a1, "sourceTypeForGEOResultType:", objc_msgSend(v9, "resultType")), objc_msgSend(v9, "resultSubtype") == (id)1, objc_msgSend(a1, "sourceSubtypeForGEOResultSubtype:", objc_msgSend(v9, "resultSubtype")), 0);
        objc_msgSend(v15, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = -[PersonalizedItemPriorityFunction initWithEntries:]([PersonalizedItemPriorityFunction alloc], "initWithEntries:", v15);
  return v11;
}

+ (int64_t)sourceTypeForGEOResultType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 9)
    return 0;
  else
    return a3 - 1;
}

+ (int64_t)sourceSubtypeForGEOResultSubtype:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 0x1E)
    return 0;
  else
    return a3 - 1;
}

+ (id)defaultPriorityFunction
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002999E4;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D1F00 != -1)
    dispatch_once(&qword_1014D1F00, block);
  if (qword_1014D1F08)
    return (id)qword_1014D1F08;
  else
    return (id)qword_1014D1F10;
}

+ (id)defaultPriorityFunctionForCompoundItemResolution
{
  return _objc_msgSend(a1, "defaultPriorityFunction");
}

+ (id)defaultPriorityFunctionForAutocomplete
{
  return _objc_msgSend(a1, "defaultPriorityFunction");
}

+ (id)defaultPriorityFunctionForAutocompleteObject
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100299E28;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D1F18 != -1)
    dispatch_once(&qword_1014D1F18, block);
  return (id)qword_1014D1F20;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
