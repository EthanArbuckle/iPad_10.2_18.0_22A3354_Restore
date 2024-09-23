@implementation _LTBatchedParagraphsHolder

- (_LTBatchedParagraphsHolder)init
{
  _LTBatchedParagraphsHolder *v2;
  uint64_t v3;
  NSMutableDictionary *paragraphs;
  uint64_t v5;
  NSMutableArray *orderedParagraphIds;
  _LTBatchedParagraphsHolder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTBatchedParagraphsHolder;
  v2 = -[_LTBatchedParagraphsHolder init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    paragraphs = v2->_paragraphs;
    v2->_paragraphs = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    orderedParagraphIds = v2->_orderedParagraphIds;
    v2->_orderedParagraphIds = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_paragraphs, "count");
}

- (id)paragraphWithId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_paragraphs, "objectForKeyedSubscript:", a3);
}

- (void)insertParagraph:(id)a3 withId:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_paragraphs, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[NSMutableArray addObject:](self->_orderedParagraphIds, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_paragraphs, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)removeParagraphWithId:(id)a3
{
  NSMutableDictionary *paragraphs;
  id v5;

  paragraphs = self->_paragraphs;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](paragraphs, "removeObjectForKey:", v5);
  -[NSMutableArray removeObject:](self->_orderedParagraphIds, "removeObject:", v5);

}

- (id)paragraphs
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_orderedParagraphIds;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_paragraphs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestParagraph");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)completeAllAndCleanWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_paragraphs, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "completion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "completion");
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v4);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_paragraphs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_orderedParagraphIds, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedParagraphIds, 0);
  objc_storeStrong((id *)&self->_paragraphs, 0);
}

@end
