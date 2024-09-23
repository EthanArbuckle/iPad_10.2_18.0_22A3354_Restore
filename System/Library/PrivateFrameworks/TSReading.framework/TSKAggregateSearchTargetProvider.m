@implementation TSKAggregateSearchTargetProvider

- (TSKAggregateSearchTargetProvider)initWithSearchTargetProviders:(id)a3
{
  TSKAggregateSearchTargetProvider *v4;
  TSKAggregateSearchTargetProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKAggregateSearchTargetProvider;
  v4 = -[TSKAggregateSearchTargetProvider init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TSKAggregateSearchTargetProvider setSearchTargetProviders:](v4, "setSearchTargetProviders:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAggregateSearchTargetProvider;
  -[TSKAggregateSearchTargetProvider dealloc](&v3, sel_dealloc);
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAggregateSearchTargetProvider rootSearchTargetCountThroughIndex:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAggregateSearchTargetProvider.m"), 44, CFSTR("no implementation because it's not currently used outside TSKDocumentRoot"));
  return 0;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  NSArray *searchTargetProviders;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  searchTargetProviders = self->_searchTargetProviders;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = a3;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(searchTargetProviders);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v13 = objc_msgSend(v12, "rootSearchTargetCountThroughIndex:", v11);
        a3 = v11 - v13;
        if (v11 < v13)
        {
          objc_msgSend(v12, "withRootSearchTargetAtIndex:executeBlock:", v11, a4);
          return;
        }
        ++v10;
        v11 -= v13;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  unint64_t v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__TSKAggregateSearchTargetProvider_nextRootSearchTargetIndexFromIndex_forString_options_inDirection___block_invoke;
  v8[3] = &unk_24D82ADD8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = self;
  v8[6] = &v9;
  v8[4] = a4;
  -[TSKAggregateSearchTargetProvider p_enumerateTargetProvidersFromTargetIndex:direction:action:](self, "p_enumerateTargetProvidersFromTargetIndex:direction:action:", a3, a6, v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL __101__TSKAggregateSearchTargetProvider_nextRootSearchTargetIndexFromIndex_forString_options_inDirection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "p_firstTargetIndexForProvider:", a2)+ v5;
  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)p_enumerateTargetProvidersFromTargetIndex:(unint64_t)a3 direction:(unint64_t)a4 action:(id)a5
{
  NSArray *searchTargetProviders;
  unint64_t v8;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  searchTargetProviders = self->_searchTargetProviders;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (v8 = a3, (v10 = -[NSArray count](self->_searchTargetProviders, "count")) == 0))
  {
LABEL_6:
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v11 = v10;
  v12 = 0;
  while (1)
  {
    v13 = -[NSArray objectAtIndex:](self->_searchTargetProviders, "objectAtIndex:", v12);
    v14 = objc_msgSend(v13, "rootSearchTargetCountThroughIndex:", v8);
    if (v8 < v14)
      break;
    ++v12;
    v8 -= v14;
    if (v11 == v12)
      goto LABEL_6;
  }
  if ((*((unsigned int (**)(id, id, unint64_t))a5 + 2))(a5, v13, v8))
  {
    v20 = self->_searchTargetProviders;
    if (!a4)
    {
      v21 = -[NSArray count](self->_searchTargetProviders, "count");
      if (v12 >= v21)
        v22 = v12 + 1;
      else
        v22 = v21;
      if (v12 < v21)
        v23 = v12 + 1;
      else
        v23 = v21;
      v15 = -[NSArray subarrayWithRange:](v20, "subarrayWithRange:", v23, v22 - v23);
      goto LABEL_8;
    }
    searchTargetProviders = -[NSArray subarrayWithRange:](self->_searchTargetProviders, "subarrayWithRange:", 0, v12);
LABEL_7:
    v15 = -[NSArray reverseObjectEnumerator](searchTargetProviders, "reverseObjectEnumerator");
LABEL_8:
    searchTargetProviders = (NSArray *)v15;
    goto LABEL_9;
  }
  searchTargetProviders = 0;
  if (a4)
    goto LABEL_7;
LABEL_9:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
LABEL_11:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v18)
        objc_enumerationMutation(searchTargetProviders);
      if (!(*((unsigned int (**)(id, _QWORD, uint64_t))a5 + 2))(a5, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19), 0x7FFFFFFFFFFFFFFFLL))break;
      if (v17 == ++v19)
      {
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v17)
          goto LABEL_11;
        return;
      }
    }
  }
}

- (unint64_t)p_firstTargetIndexForProvider:(id)a3
{
  NSArray *searchTargetProviders;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  searchTargetProviders = self->_searchTargetProviders;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(searchTargetProviders);
    v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (v10 == a3)
      return v7;
    v7 += objc_msgSend(v10, "rootSearchTargetCountThroughIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (v6 == ++v9)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](searchTargetProviders, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return v7;
    }
  }
}

- (NSArray)searchTargetProviders
{
  return self->_searchTargetProviders;
}

- (void)setSearchTargetProviders:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
