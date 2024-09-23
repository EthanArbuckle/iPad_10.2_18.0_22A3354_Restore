@implementation FMFSaveFavoritesCommand

- (FMFSaveFavoritesCommand)initWithClientSession:(id)a3 andFavorites:(id)a4
{
  id v6;
  FMFSaveFavoritesCommand *v7;
  id v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMFSaveFavoritesCommand;
  v7 = -[FMFBaseCmd initWithClientSession:](&v11, "initWithClientSession:", a3);
  if (v7)
  {
    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesCommand initialized with favorites: %@", buf, 0xCu);
    }

    -[FMFSaveFavoritesCommand setFavorites:](v7, "setFavorites:", v6);
  }

  return v7;
}

- (id)pathSuffix
{
  return CFSTR("saveFavorites");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v22.receiver = self;
  v22.super_class = (Class)FMFSaveFavoritesCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v22, "jsonBodyDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[FMFSaveFavoritesCommand favorites](self, "favorites"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "favoriteOrder"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("id"), v11, CFSTR("order"), 0));

        objc_msgSend(v4, "addObject:", v12);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v16, "setObject:forKey:", v4, CFSTR("favorites"));
  v13 = sub_100011D0C();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesCommand jsonBodyDictionary: %@", buf, 0xCu);
  }

  return v16;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_favorites, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
}

@end
