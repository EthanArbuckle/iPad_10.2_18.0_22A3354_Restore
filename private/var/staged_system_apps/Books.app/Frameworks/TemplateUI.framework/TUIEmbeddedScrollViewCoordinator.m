@implementation TUIEmbeddedScrollViewCoordinator

- (void)registerEmbeddedScrollView:(id)a3
{
  id v4;
  NSHashTable *embeddedScrollViews;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  embeddedScrollViews = self->_embeddedScrollViews;
  v8 = v4;
  if (!embeddedScrollViews)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v7 = self->_embeddedScrollViews;
    self->_embeddedScrollViews = v6;

    v4 = v8;
    embeddedScrollViews = self->_embeddedScrollViews;
  }
  -[NSHashTable addObject:](embeddedScrollViews, "addObject:", v4);

}

- (void)unregisterEmbeddedScrollView:(id)a3
{
  -[NSHashTable removeObject:](self->_embeddedScrollViews, "removeObject:", a3);
}

- (void)updateWithImpressionSnapshot:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_embeddedScrollViews;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "updateWithImpressionSnapshot:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSHashTable)embeddedScrollViews
{
  return self->_embeddedScrollViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedScrollViews, 0);
}

@end
