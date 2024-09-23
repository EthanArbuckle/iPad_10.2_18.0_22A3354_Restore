@implementation RidesharingPartitionedAppSuggestions

- (RidesharingPartitionedAppSuggestions)initWithInstalledSuggestions:(id)a3 notInstalledSuggestions:(id)a4
{
  id v6;
  id v7;
  RidesharingPartitionedAppSuggestions *v8;
  NSArray *v9;
  NSArray *installedSuggestions;
  NSArray *v11;
  NSArray *notInstalledSuggestions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingPartitionedAppSuggestions;
  v8 = -[RidesharingPartitionedAppSuggestions init](&v14, "init");
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    installedSuggestions = v8->_installedSuggestions;
    v8->_installedSuggestions = v9;

    v11 = (NSArray *)objc_msgSend(v7, "copy");
    notInstalledSuggestions = v8->_notInstalledSuggestions;
    v8->_notInstalledSuggestions = v11;

  }
  return v8;
}

- (id)notInstalledSuggestions
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = -[NSArray copy](self->_notInstalledSuggestions, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_installedSuggestions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iOSBundleIdentifier", (_QWORD)v14));
        v11 = isExtensionHidden();

        if (v11)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v9));

          v3 = (id)v12;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)installedSuggestions
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_installedSuggestions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iOSBundleIdentifier", (_QWORD)v14));
        v11 = isExtensionHidden();

        if ((v11 & 1) == 0)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v9));

          v3 = (id)v12;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notInstalledSuggestions, 0);
  objc_storeStrong((id *)&self->_installedSuggestions, 0);
}

@end
