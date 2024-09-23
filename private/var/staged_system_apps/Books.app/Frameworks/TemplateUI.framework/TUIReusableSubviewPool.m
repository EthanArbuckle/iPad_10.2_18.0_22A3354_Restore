@implementation TUIReusableSubviewPool

- (TUIReusableSubviewPool)initWithRegistry:(id)a3
{
  id v5;
  TUIReusableSubviewPool *v6;
  TUIReusableSubviewPool *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *subviewsAvailableByIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIReusableSubviewPool;
  v6 = -[TUIReusableSubviewPool init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    v8 = objc_opt_new(NSMutableDictionary);
    subviewsAvailableByIdentifier = v7->_subviewsAvailableByIdentifier;
    v7->_subviewsAvailableByIdentifier = v8;

  }
  return v7;
}

- (id)dequeueReusableSubviewWithReuseIdentifier:(id)a3 host:(id)a4
{
  id *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subviewsAvailableByIdentifier, "objectForKeyedSubscript:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_hostingView"));
    v11 = v10;
    if (v10)
      v12 = v9 == 0;
    else
      v12 = 1;
    v13 = !v12;
    if (v12
      || (v23[0] = _NSConcreteStackBlock,
          v23[1] = 3221225472,
          v23[2] = sub_D37C4,
          v23[3] = &unk_241230,
          v4 = &v24,
          v24 = v10,
          v14 = objc_msgSend(v9, "indexOfObjectPassingTest:", v23),
          v14 == (id)0x7FFFFFFFFFFFFFFFLL))
    {
      if (objc_msgSend(v9, "count"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
        objc_msgSend(v9, "removeLastObject");
        if (v15)
        {
LABEL_12:
          if (objc_msgSend(v8, "isDescendantOfView:", v15))
            objc_msgSend(v8, "removeFromSuperview");
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_D3800;
          v21[3] = &unk_23D938;
          v16 = v15;
          v22 = v16;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);

          if (!v13)
            goto LABEL_23;
          goto LABEL_22;
        }
      }
    }
    else
    {
      v19 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v14));
      objc_msgSend(v9, "removeObjectAtIndex:", v19);
      if (v15)
        goto LABEL_12;
    }
    v16 = -[TUIViewRegistry newSubviewWithReuseIdentifier:](self->_registry, "newSubviewWithReuseIdentifier:", v7);
    if (!v13)
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
  v17 = TUIDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_17E8A8(v18);

  if (_TUIDeviceHasInternalInstall())
    objc_exception_throw(objc_msgSend(objc_alloc((Class)NSException), "initWithName:reason:userInfo:", CFSTR("Nil reuseIdentifier"), CFSTR("Requested a view with nil reuseIdentifier"), 0));
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)prepareToReuseHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_hostedSubviewsMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = objc_msgSend(v6, "copy");

  objc_msgSend(v4, "setTui_hostedSubviewsMap:", 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D3908;
  v9[3] = &unk_23D938;
  v10 = v7;
  v8 = v7;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
  -[TUIReusableSubviewPool reuseSubviews:host:](self, "reuseSubviews:host:", v8, v4);

}

- (void)reuseSubviews:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  uint8_t v27[4];
  uint64_t v28;
  _BYTE v29[128];

  v6 = a3;
  v20 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reuseIdentifier", v20));
        if (v13)
        {
          objc_msgSend(v12, "setHidden:", 1);
          v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subviewsAvailableByIdentifier, "objectForKeyedSubscript:", v13));
          if (!v14)
          {
            v14 = objc_opt_new(NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subviewsAvailableByIdentifier, "setObject:forKeyedSubscript:", v14, v13);
          }
          if (-[NSMutableArray indexOfObjectIdenticalTo:](v14, "indexOfObjectIdenticalTo:", v12) == (id)0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableArray addObject:](v14, "addObject:", v12);

        }
        else
        {
          v15 = TUIDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_17E8E8(v27, (uint64_t)v12, &v28, v16);

          if (_TUIDeviceHasInternalInstall())
          {
            v17 = objc_alloc((Class)NSException);
            v25 = CFSTR("view");
            v26 = v12;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
            v19 = objc_msgSend(v17, "initWithName:reason:userInfo:", CFSTR("Nil reuseIdentifier"), CFSTR("A reusable view should have a non-nil reuseIdentifier"), v18);

            objc_exception_throw(v19);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v9);
  }

}

- (void)clearPool
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_subviewsAvailableByIdentifier, "allKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subviewsAvailableByIdentifier, "objectForKeyedSubscript:", v8, 0));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "removeFromSuperview");
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_subviewsAvailableByIdentifier, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsAvailableByIdentifier, 0);
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
