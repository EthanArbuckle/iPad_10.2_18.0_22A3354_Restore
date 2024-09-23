@implementation UGCRatingCategory

+ (id)overallRatingCategoryFromScorecard:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasRecommended"))
  {
    if (objc_msgSend(v3, "recommended"))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory overallRatingCategoryWithInitialState:](UGCRatingCategory, "overallRatingCategoryWithInitialState:", v4));

  return v5;
}

+ (id)overallRatingCategoryWithInitialState:(int64_t)a3
{
  UGCRatingCategory *v4;
  void *v5;
  void *v6;
  UGCRatingCategory *v7;

  v4 = [UGCRatingCategory alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Overall [UGC]"), CFSTR("localized string not found"), 0));
  v7 = -[UGCRatingCategory initWithKey:localizedTitle:initialState:ratingType:](v4, "initWithKey:localizedTitle:initialState:ratingType:", CFSTR("com.apple.client.ugc-overall-category"), v6, a3, 1);

  return v7;
}

+ (id)ratingCategoryListForScorecard:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  UGCRatingCategory *v16;
  uint64_t v17;
  UGCRatingCategory *v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categoryRatings"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
        v12 = objc_msgSend(v11, "score");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "categoryName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));

        v16 = [UGCRatingCategory alloc];
        if (v12 == -1)
          v17 = 1;
        else
          v17 = 2 * (v12 == 1);
        v18 = -[UGCRatingCategory initWithKey:localizedTitle:initialState:](v16, "initWithKey:localizedTitle:initialState:", v10, v15, v17);
        objc_msgSend(v4, "addObject:", v18);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  v19 = objc_msgSend(v4, "copy");
  return v19;
}

+ (id)ratingCategoryListForQuestionnaireCategories:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UGCRatingCategory *v11;
  void *v12;
  void *v13;
  UGCRatingCategory *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v9);
        v11 = [UGCRatingCategory alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key", (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedTitle"));
        v14 = -[UGCRatingCategory initWithKey:localizedTitle:initialState:](v11, "initWithKey:localizedTitle:initialState:", v12, v13, 0);

        objc_msgSend(v4, "addObject:", v14);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = objc_msgSend(v4, "copy");
  return v15;
}

- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5
{
  return -[UGCRatingCategory initWithKey:localizedTitle:initialState:ratingType:](self, "initWithKey:localizedTitle:initialState:ratingType:", a3, a4, a5, 0);
}

- (UGCRatingCategory)initWithKey:(id)a3 localizedTitle:(id)a4 initialState:(int64_t)a5 ratingType:(int64_t)a6
{
  id v11;
  id v12;
  UGCRatingCategory *v13;
  UGCRatingCategory *v14;
  GEOObserverHashTable *v15;
  GEOObserverHashTable *observers;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UGCRatingCategory;
  v13 = -[UGCRatingCategory init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_currentState = a5;
    v13->_initialState = a5;
    objc_storeStrong((id *)&v13->_key, a3);
    v14->_ratingType = a6;
    objc_storeStrong((id *)&v14->_localizedTitle, a4);
    v15 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___UGCRatingCategoryObserver, &_dispatch_main_q);
    observers = v14->_observers;
    v14->_observers = v15;

  }
  return v14;
}

- (void)revertCorrections
{
  -[UGCRatingCategory setCurrentState:](self, "setCurrentState:", -[UGCRatingCategory initialState](self, "initialState"));
}

- (void)setCurrentState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    -[GEOObserverHashTable ratingCategoryDidChange:](self->_observers, "ratingCategoryDidChange:", self);
  }
}

- (BOOL)isEdited
{
  return self->_initialState != self->_currentState;
}

- (BOOL)hasValidSelectedState
{
  return self->_currentState != 0;
}

- (GEORPCategoryRating)geoCategoryRating
{
  id v3;
  id v4;
  id v5;
  int64_t currentState;
  uint64_t v7;

  v3 = objc_alloc_init((Class)GEORPCategoryRating);
  objc_msgSend(v3, "setKey:", self->_key);
  v4 = objc_alloc_init((Class)GEORPRatingValue);
  objc_msgSend(v3, "setValue:", v4);
  v5 = objc_alloc_init((Class)GEOLocalizedString);
  objc_msgSend(v5, "setStringValue:", self->_localizedTitle);
  objc_msgSend(v4, "setCategoryName:", v5);
  currentState = self->_currentState;
  if (currentState == 1)
    v7 = 0xFFFFFFFFLL;
  else
    v7 = currentState == 2;
  objc_msgSend(v4, "setScore:", v7);

  return (GEORPCategoryRating *)v3;
}

- (void)addObserver:(id)a3
{
  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (int64_t)ratingType
{
  return self->_ratingType;
}

- (NSString)key
{
  return self->_key;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
