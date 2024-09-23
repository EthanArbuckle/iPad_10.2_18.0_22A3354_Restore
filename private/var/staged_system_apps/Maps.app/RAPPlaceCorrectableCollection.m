@implementation RAPPlaceCorrectableCollection

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

}

- (void)removeObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)_invokeChangeHandlers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8));
        ((void (**)(_QWORD, RAPPlaceCorrectableCollection *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (NSString)localizedTitle
{
  NSString *localizedTitle;
  NSString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSString *v8;

  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    v4 = 0;
    switch(-[RAPPlaceCorrectableCollection kind](self, "kind"))
    {
      case 0:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Name [Report a Problem label]");
        goto LABEL_21;
      case 1:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Address [Report a Problem label]");
        goto LABEL_21;
      case 2:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Phone [Report a Problem label]");
        goto LABEL_21;
      case 3:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Hours [Report a Problem label]");
        goto LABEL_21;
      case 4:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Website [Report a Problem label]");
        goto LABEL_21;
      case 5:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Category [Report a Problem label]");
        goto LABEL_21;
      case 6:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Closed Temporarily [Report an Issue]");
        goto LABEL_21;
      case 7:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Closed Permanently [Report an Issue]");
        goto LABEL_21;
      case 8:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Street [Report a Problem Address Type]");
        goto LABEL_21;
      case 9:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Subpremise [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xALL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("SubLocality [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xBLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("City [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xCLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("State [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xDLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("ZIP [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xELL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Country [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xFLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Accepts Apple Pay [Report a Problem label]");
        goto LABEL_21;
      case 0x14:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Located Inside [Report an Issue]");
        goto LABEL_21;
      case 0x15:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Inside this place [Report an Issue]");
LABEL_21:
        v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

        break;
      default:
        break;
    }
    v8 = self->_localizedTitle;
    self->_localizedTitle = v4;

    localizedTitle = self->_localizedTitle;
  }
  return localizedTitle;
}

- (void)_setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (BOOL)hasReachedCapacity
{
  return (unint64_t)-[NSMutableArray count](self->_mutableValues, "count") >= self->_maxCount;
}

- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4
{
  return -[RAPPlaceCorrectableCollection initWithKind:originalValues:maxCount:](self, "initWithKind:originalValues:maxCount:", a3, a4, -1);
}

- (RAPPlaceCorrectableCollection)initWithKind:(int64_t)a3 originalValues:(id)a4 maxCount:(unint64_t)a5
{
  id v8;
  RAPPlaceCorrectableCollection *v9;
  RAPPlaceCorrectableCollection *v10;
  NSArray *v11;
  NSArray *originalValues;
  NSMutableArray *v13;
  NSMutableArray *mutableValues;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlaceCorrectableCollection;
  v9 = -[RAPPlaceCorrectableCollection init](&v16, "init");
  v10 = v9;
  if (!v8)
    v8 = &__NSArray0__struct;
  if (v9)
  {
    v9->_kind = a3;
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    originalValues = v10->_originalValues;
    v10->_originalValues = v11;

    v13 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:copyItems:", v10->_originalValues, 1);
    mutableValues = v10->_mutableValues;
    v10->_mutableValues = v13;

    v10->_maxCount = a5;
  }

  return v10;
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableArray containsObject:](self->_mutableValues, "containsObject:", a3);
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_mutableValues, "containsObject:") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_mutableValues, "addObject:", v4);
    -[RAPPlaceCorrectableCollection _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_mutableValues, "count") > a3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_mutableValues, "removeObjectAtIndex:", a3);
    -[RAPPlaceCorrectableCollection _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }
}

- (void)removeObject:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableValues, "containsObject:"))
  {
    -[NSMutableArray removeObject:](self->_mutableValues, "removeObject:", v4);
    -[RAPPlaceCorrectableCollection _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }

}

- (id)addedObjects
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", self->_mutableValues);
  v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->_originalValues);
  objc_msgSend(v3, "minusSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return v5;
}

- (id)removedObjects
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", self->_originalValues);
  v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->_mutableValues);
  objc_msgSend(v3, "minusSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return v5;
}

- (void)clearAndReplaceObjects:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *mutableValues;

  v4 = a3;
  v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v4);

  mutableValues = self->_mutableValues;
  self->_mutableValues = v5;

  -[RAPPlaceCorrectableCollection _invokeChangeHandlers](self, "_invokeChangeHandlers");
}

- (NSArray)values
{
  return (NSArray *)-[NSMutableArray copy](self->_mutableValues, "copy");
}

- (void)revertCorrections
{
  id v3;
  NSMutableArray *v4;
  NSMutableArray *mutableValues;
  id v6;

  v3 = objc_alloc((Class)NSMutableArray);
  v6 = -[NSArray copy](self->_originalValues, "copy");
  v4 = (NSMutableArray *)objc_msgSend(v3, "initWithArray:", v6);
  mutableValues = self->_mutableValues;
  self->_mutableValues = v4;

}

- (BOOL)isEdited
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->_originalValues);
  v4 = objc_alloc((Class)NSSet);
  v5 = -[NSMutableArray copy](self->_mutableValues, "copy");
  v6 = objc_msgSend(v4, "initWithArray:", v5);

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToSet:", v3) ^ 1;
  return (char)v5;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_mutableValues, "count");
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSArray)originalValues
{
  return self->_originalValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_mutableValues, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
