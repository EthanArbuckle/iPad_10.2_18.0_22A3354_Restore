@implementation TUIFilterRegistry

- (TUIFilterRegistry)init
{
  TUIFilterRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *imageFilters;
  NSMutableDictionary *v5;
  NSMutableDictionary *imageSetFilters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIFilterRegistry;
  v2 = -[TUIFilterRegistry init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    imageFilters = v2->_imageFilters;
    v2->_imageFilters = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    imageSetFilters = v2->_imageSetFilters;
    v2->_imageSetFilters = v5;

  }
  return v2;
}

- (void)registerImageFilters:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        if (objc_msgSend(v10, "length"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageFilters, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)registerImageSetFilters:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        if (objc_msgSend(v10, "length"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageSetFilters, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)imageFilterWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageFilters, "objectForKeyedSubscript:", v4));
  else
    v5 = 0;

  return v5;
}

- (id)imageSetFilterWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageSetFilters, "objectForKeyedSubscript:", v4));
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSetFilters, 0);
  objc_storeStrong((id *)&self->_imageFilters, 0);
}

@end
