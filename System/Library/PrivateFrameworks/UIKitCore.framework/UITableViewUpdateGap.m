@implementation UITableViewUpdateGap

- (id)updateItems
{
  void *v2;

  if (a1)
  {
    if (!a2)
      return a1;
    objc_msgSend(a1, "arrayByAddingObjectsFromArray:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2)
      return a2;
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (uint64_t)initWithUpdateItem:(void *)a1
{
  id *v3;
  uint64_t v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)UITableViewUpdateGap;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = (uint64_t)v3;
  if (v3)
  {
    objc_storeStrong(v3 + 4, a2);
    objc_storeStrong((id *)(v4 + 40), a2);
    -[UITableViewUpdateGap addUpdateItem:](v4, (uint64_t)a2);
  }
  return v4;
}

- (void)addUpdateItem:(uint64_t)a1
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a2)
    goto LABEL_8;
  if (*(_QWORD *)(a2 + 32) == 100)
    *(_BYTE *)(a1 + 24) |= 1u;
  v4 = *(_DWORD *)(a2 + 20);
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = *(void **)(a1 + 8);
      if (!v5)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a2, 0);
        v7 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v6;

        return;
      }
      goto LABEL_9;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = a2;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Only delete or insert update items can be added to a UITableViewUpdateGap: %@", buf, 0xCu);
      }

    }
    else
    {
      v8 = addUpdateItem____s_category;
      if (!addUpdateItem____s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&addUpdateItem____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = a2;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Only delete or insert update items can be added to a UITableViewUpdateGap: %@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_8:
    v5 = *(void **)(a1 + 16);
    if (v5)
    {
LABEL_9:
      objc_msgSend(v5, "addObject:", a2);
      return;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a2, 0);
    v11 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v10;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateItem, 0);
  objc_storeStrong((id *)&self->_firstUpdateItem, 0);
  objc_storeStrong((id *)&self->_insertItems, 0);
  objc_storeStrong((id *)&self->_deleteItems, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  UIUpdateItem *firstUpdateItem;
  UIUpdateItem *lastUpdateItem;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)UITableViewUpdateGap;
  -[UITableViewUpdateGap description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  firstUpdateItem = self->_firstUpdateItem;
  lastUpdateItem = self->_lastUpdateItem;
  if (-[NSMutableArray count](self->_deleteItems, "count"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[NSMutableArray count](self->_insertItems, "count"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ first item: %@, last item: %@, deleteBased: %@, hasInserts: %@"), v4, firstUpdateItem, lastUpdateItem, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
