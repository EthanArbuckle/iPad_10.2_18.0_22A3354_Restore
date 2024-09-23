@implementation _UIKeyShortcutHUDIndexPath

+ (id)hudIndexPathWithClient:(id)a3 indexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setClient:", v6);

  objc_msgSend(v7, "setIndexPath:", v5);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _UIKeyShortcutHUDIndexPath *v4;
  void *v5;
  char isKindOfClass;
  _UIKeyShortcutHUDIndexPath *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (_UIKeyShortcutHUDIndexPath *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[_UIKeyShortcutHUDIndexPath client](self, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyShortcutHUDIndexPath client](v7, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        -[_UIKeyShortcutHUDIndexPath indexPath](self, "indexPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyShortcutHUDIndexPath indexPath](v7, "indexPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id WeakRetained;
  uint64_t v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v4 = objc_msgSend(WeakRetained, "hash");
  v5 = -[NSIndexPath hash](self->_indexPath, "hash") ^ v4;

  return v5;
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)client
{
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_client);
}

@end
