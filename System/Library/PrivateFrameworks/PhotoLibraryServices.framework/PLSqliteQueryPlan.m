@implementation PLSqliteQueryPlan

- (PLSqliteQueryPlan)init
{
  PLSqliteQueryPlan *v2;
  NSMutableArray *v3;
  NSMutableArray *nodes;
  PLSqliteQueryPlan *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLSqliteQueryPlan;
  v2 = -[PLSqliteQueryPlan init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addNodeWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  PLSqliteQueryPlanNode *v11;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = -[PLSqliteQueryPlanNode initWithIdentifier:parentIdentifier:unused:nodeDescription:]([PLSqliteQueryPlanNode alloc], "initWithIdentifier:parentIdentifier:unused:nodeDescription:", v8, v7, v6, v10);

  -[NSMutableArray addObject:](self->_nodes, "addObject:", v11);
}

- (void)addNodeWithStringRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  id v23;

  v23 = a3;
  -[PLSqliteQueryPlan _stringRepresentationRegex](self, "_stringRepresentationRegex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "rangeAtIndex:", 1);
    if (v8)
    {
      objc_msgSend(v23, "substringWithRange:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "intValue");

    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(v6, "rangeAtIndex:", 2);
    if (v12)
    {
      objc_msgSend(v23, "substringWithRange:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

    }
    else
    {
      v14 = 0;
    }
    v15 = objc_msgSend(v6, "rangeAtIndex:", 3);
    if (v16)
    {
      objc_msgSend(v23, "substringWithRange:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

    }
    else
    {
      v18 = 0;
    }
    v19 = objc_msgSend(v6, "rangeAtIndex:", 4);
    if (v20)
    {
      objc_msgSend(v23, "substringWithRange:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (__CFString *)objc_msgSend(v21, "copy");

    }
    else
    {
      v22 = &stru_1E36789C0;
    }
    -[PLSqliteQueryPlan addNodeWithIdentifier:parentIdentifier:unused:nodeDescription:](self, "addNodeWithIdentifier:parentIdentifier:unused:nodeDescription:", v10, v14, v18, v22);

  }
}

- (id)_stringRepresentationRegex
{
  NSRegularExpression *stringRepresentationRegex;
  NSRegularExpression *v4;
  NSRegularExpression *v5;

  stringRepresentationRegex = self->_stringRepresentationRegex;
  if (!stringRepresentationRegex)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s*(\\d+)[ |\\|](\\d+)[ |\\|](\\d+)[ |\\|](.*)$"), 0, 0);
    v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stringRepresentationRegex;
    self->_stringRepresentationRegex = v4;

    stringRepresentationRegex = self->_stringRepresentationRegex;
  }
  return stringRepresentationRegex;
}

- (NSString)listDescription
{
  pl_result_with_autoreleasepool();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)graphDescription
{
  pl_result_with_autoreleasepool();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_renderLevelWithParentIdentifier:(int)a3 prefix:(id)a4 intoLines:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSMutableArray *nodes;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PLSqliteQueryPlan *v18;
  uint64_t v19;
  _QWORD v20[4];
  int v21;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  nodes = self->_nodes;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke;
  v20[3] = &__block_descriptor_36_e31_B16__0__PLSqliteQueryPlanNode_8l;
  v21 = a3;
  -[NSMutableArray _pl_filter:](nodes, "_pl_filter:", v20);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke_2;
  v15[3] = &unk_1E366A040;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = objc_msgSend(v14, "count");
  v12 = v9;
  v13 = v8;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentationRegex, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

BOOL __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parentIdentifier") == *(_DWORD *)(a1 + 32);
}

void __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = *(_QWORD *)(a1 + 56) - 1;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  objc_msgSend(v8, "nodeDescription");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 <= a3)
  else
    v11 = CFSTR("|--");
  if (v5 <= a3)
    v12 = CFSTR("   ");
  else
    v12 = CFSTR("|  ");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), v7, v11, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 48);
  v15 = objc_msgSend(v8, "identifier");

  objc_msgSend(v14, "_renderLevelWithParentIdentifier:prefix:intoLines:", v15, v13, *(_QWORD *)(a1 + 40));
}

id __37__PLSqliteQueryPlan_graphDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_renderLevelWithParentIdentifier:prefix:intoLines:", 0, &stru_1E36789C0, v2);
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id __36__PLSqliteQueryPlan_listDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = objc_msgSend(v7, "identifier");
        v10 = objc_msgSend(v7, "parentIdentifier");
        v11 = objc_msgSend(v7, "unused");
        objc_msgSend(v7, "nodeDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%d|%d|%d|%@"), v9, v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", v13);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

@end
