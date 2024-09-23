@implementation PersonalizedItemSource

- (PersonalizedItemSource)initWithSourceType:(int64_t)a3 sourceSubtype:(int64_t)a4
{
  PersonalizedItemSource *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PersonalizedItemSource;
  result = -[PersonalizedItemSource init](&v7, "init");
  if (result)
  {
    result->_sourceType = a3;
    result->_sourceSubtype = a4;
  }
  return result;
}

- (NSArray)allItems
{
  return 0;
}

- (id)_observers
{
  NSHashTable *observers;
  NSHashTable *v4;
  NSHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSource _observers](self, "_observers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PersonalizedItemSource _observers](self, "_observers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_notifyObserversItemsDidChange
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "personalizedItemSourceDidChangeItems:", self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (id)clientFeatureIDFromAdornment:(id)a3 mapItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  long double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "styleAttributes"));
  v7 = (int)objc_msgSend(v6, "poiType");
  objc_msgSend(v5, "_coordinate");
  v9 = -v8;
  if (v8 >= 0.0)
    v9 = v8;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = fmod(v10, 1.84467441e19);
  v13 = 2654435761u * (unint64_t)v12;
  v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0)
    v14 = 2654435761u * (unint64_t)v12;
  v15 = v13 - (unint64_t)fabs(v11);
  if (v11 >= 0.0)
    v15 = v14;
  v16 = v15 ^ v7;
  objc_msgSend(v5, "_coordinate");
  if (v17 < 0.0)
    v17 = -v17;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = fmod(v18, 1.84467441e19);
  v21 = 2654435761u * (unint64_t)v20;
  v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0)
    v22 = 2654435761u * (unint64_t)v20;
  v23 = v21 - (unint64_t)fabs(v19);
  if (v19 >= 0.0)
    v23 = v22;
  v24 = v16 ^ v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geoMapItem"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    v24 ^= (unint64_t)objc_msgSend(v28, "hash");

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[PersonalizedItemClientFeatureIDAdornment adornmentWithClientFeatureID:](PersonalizedItemClientFeatureIDAdornment, "adornmentWithClientFeatureID:", v24));

  return v29;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
