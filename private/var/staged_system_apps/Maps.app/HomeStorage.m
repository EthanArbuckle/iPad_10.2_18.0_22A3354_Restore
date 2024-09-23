@implementation HomeStorage

- (HomeStorage)init
{
  HomeStorage *v2;
  HomeStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeStorage;
  v2 = -[HomeStorage init](&v5, "init");
  v3 = v2;
  if (v2)
    -[HomeStorage _loadFromUserDefaults](v2, "_loadFromUserDefaults");
  return v3;
}

- (void)_loadFromUserDefaults
{
  void *v3;
  HomeStorageOutlineNode *v4;
  HomeStorageOutlineNode *rootNode;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("SidebarOutlineState")));

  if (v6)
  {
    v4 = -[HomeStorageOutlineNode initWithDictionaryRepresentation:]([HomeStorageOutlineNode alloc], "initWithDictionaryRepresentation:", v6);
    rootNode = self->_rootNode;
    self->_rootNode = v4;

  }
}

- (void)_writeToUserDefaults
{
  HomeStorageOutlineNode *rootNode;
  void *v3;
  id v4;

  rootNode = self->_rootNode;
  if (rootNode)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[HomeStorageOutlineNode dictionaryRepresentation](rootNode, "dictionaryRepresentation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("SidebarOutlineState"));

  }
}

- (void)_visitAllNodesWithBlock:(id)a3
{
  HomeStorageOutlineNode *rootNode;
  id v5;
  id v6;

  rootNode = self->_rootNode;
  if (rootNode)
  {
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPath](IdentifierPath, "identifierPath"));
    -[HomeStorage _visitNode:identifierPath:block:](self, "_visitNode:identifierPath:block:", rootNode, v6, v5);

  }
}

- (void)_visitNode:(id)a3 identifierPath:(id)a4 block:(id)a5
{
  id v8;
  _QWORD *v9;
  void (*v10)(_QWORD *, id, id);
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = (void (*)(_QWORD *, id, id))v9[2];
  v11 = a3;
  v10(v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "children"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008E905C;
  v15[3] = &unk_1011DB560;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (id)expandedIdentifierPathsInSection:(id)a3 defaultExpandedIdentifierPaths:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = v6;
  if (self->_rootNode)
  {
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1008E91C0;
    v15 = &unk_1011DB588;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPathWithIdentifier:](IdentifierPath, "identifierPathWithIdentifier:", a3));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v7));
    v8 = v17;
    v9 = v16;
    -[HomeStorage _visitAllNodesWithBlock:](self, "_visitAllNodesWithBlock:", &v12);
    v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (void)storeExpandedIdentifierPaths:(id)a3 forSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  HomeStorageOutlineNode *rootNode;
  void *v19;
  void *v20;
  HomeStorageOutlineNode *v21;
  HomeStorageOutlineNode *v22;
  HomeStorageOutlineNode *v23;
  HomeStorageOutlineNode *v24;
  HomeStorageOutlineNode *v25;
  HomeStorageOutlineNode *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  void *v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPathWithIdentifier:](IdentifierPath, "identifierPathWithIdentifier:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "hasPrefix:", v8, (_QWORD)v27))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifierPathByRemovingFirstIdentifier"));
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeStorage _storageNodeForExpandedIdentifierPaths:](self, "_storageNodeForExpandedIdentifierPaths:", v9));
  rootNode = self->_rootNode;
  if (rootNode)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeStorageOutlineNode children](rootNode, "children"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19));

    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v7);
    v21 = [HomeStorageOutlineNode alloc];
    v22 = (HomeStorageOutlineNode *)objc_claimAutoreleasedReturnValue(-[HomeStorageOutlineNode expandedValue](self->_rootNode, "expandedValue"));
    v23 = -[HomeStorageOutlineNode initWithExpandedValue:children:](v21, "initWithExpandedValue:children:", v22, v20);
    v24 = self->_rootNode;
    self->_rootNode = v23;

  }
  else
  {
    v25 = [HomeStorageOutlineNode alloc];
    v31 = v7;
    v32 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v26 = -[HomeStorageOutlineNode initWithExpandedValue:children:](v25, "initWithExpandedValue:children:", 0, v20);
    v22 = self->_rootNode;
    self->_rootNode = v26;
  }

  -[HomeStorage _writeToUserDefaults](self, "_writeToUserDefaults");
}

- (id)_storageNodeForExpandedIdentifierPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  HomeStorageOutlineNode *v17;
  void *v18;
  HomeStorageOutlineNode *v19;
  unsigned int v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPath](IdentifierPath, "identifierPath"));
  v21 = objc_msgSend(v4, "containsObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstIdentifier"));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
          if (!v14)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifierPathByRemovingFirstIdentifier"));
          objc_msgSend(v14, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1008E9730;
  v22[3] = &unk_1011DB5B0;
  v22[4] = self;
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
  v16 = v23;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v22);
  v17 = [HomeStorageOutlineNode alloc];
  if (v21)
    v18 = &__kCFBooleanTrue;
  else
    v18 = &__kCFBooleanFalse;
  v19 = -[HomeStorageOutlineNode initWithExpandedValue:children:](v17, "initWithExpandedValue:children:", v18, v16);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
}

@end
