@implementation WFActionGroupingCache

- (WFActionGroupingCache)init
{
  WFActionGroupingCache *v2;
  uint64_t v3;
  NSMutableDictionary *contents;
  WFActionGroupingCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFActionGroupingCache;
  v2 = -[WFActionGroupingCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    contents = v2->_contents;
    v2->_contents = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSDictionary)actionsByGroupingIdentifier
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_contents, "copy");
}

- (void)addAction:(id)a3 sortingWithWorkflowActions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "groupingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "addObject:", v10);
      if (v6)
        -[WFActionGroupingCache sortActionsForGroupingIdentifier:withWorkflowActions:](self, "sortActionsForGroupingIdentifier:withWorkflowActions:", v7, v6);
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, 0);
      -[NSMutableDictionary setObject:forKey:](self->_contents, "setObject:forKey:", v9, v7);
    }

  }
}

- (void)removeAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "groupingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1 && objc_msgSend(v5, "containsObject:", v6))
      -[NSMutableDictionary removeObjectForKey:](self->_contents, "removeObjectForKey:", v4);
    else
      objc_msgSend(v5, "removeObject:", v6);

  }
}

- (void)sortActionsForGroupingIdentifier:(id)a3 withWorkflowActions:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__WFActionGroupingCache_sortActionsForGroupingIdentifier_withWorkflowActions___block_invoke;
  v9[3] = &unk_1E7AEDAE0;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "sortUsingComparator:", v9);

}

- (id)actionsForGroupingIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_contents, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSMutableDictionary)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

uint64_t __78__WFActionGroupingCache_sortActionsForGroupingIdentifier_withWorkflowActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

@end
