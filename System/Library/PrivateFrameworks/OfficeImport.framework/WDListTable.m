@implementation WDListTable

- (WDListTable)initWithDocument:(id)a3
{
  id v4;
  WDListTable *v5;
  WDListTable *v6;
  NSMutableArray *v7;
  NSMutableArray *mLists;
  uint64_t v9;
  NSMutableDictionary *mListMapById;
  WDList *v11;
  WDList *mNullList;
  WDList *v13;
  WDList *mDefaultList;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WDListTable;
  v5 = -[WDListTable init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mLists = v6->mLists;
    v6->mLists = v7;

    v9 = objc_opt_new();
    mListMapById = v6->mListMapById;
    v6->mListMapById = (NSMutableDictionary *)v9;

    v11 = -[WDList initWithDocument:listId:listDefinitionId:]([WDList alloc], "initWithDocument:listId:listDefinitionId:", v4, 0, 0xFFFFFFFFLL);
    mNullList = v6->mNullList;
    v6->mNullList = v11;

    v13 = -[WDList initWithDocument:listId:listDefinitionId:]([WDList alloc], "initWithDocument:listId:listDefinitionId:", v4, 2147483649, 4294967294);
    mDefaultList = v6->mDefaultList;
    v6->mDefaultList = v13;

  }
  return v6;
}

- (unint64_t)listCount
{
  return -[NSMutableArray count](self->mLists, "count");
}

- (id)listAt:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mLists, "objectAtIndex:", a3);
}

- (id)lists
{
  return self->mLists;
}

- (id)addListWithListId:(int)a3 listDefinitionId:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  WDList *v7;
  id WeakRetained;
  WDList *v9;
  NSMutableDictionary *mListMapById;
  void *v11;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (a3 == 0x80000000)
    v5 = -[NSMutableArray count](self->mLists, "count") + 1;
  v7 = [WDList alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v9 = -[WDList initWithDocument:listId:listDefinitionId:](v7, "initWithDocument:listId:listDefinitionId:", WeakRetained, v5, v4);

  if (v9)
  {
    -[NSMutableArray addObject:](self->mLists, "addObject:", v9);
    mListMapById = self->mListMapById;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](mListMapById, "setObject:forKeyedSubscript:", v9, v11);

  }
  return v9;
}

- (id)listWithListId:(int)a3
{
  NSMutableDictionary *mListMapById;
  void *v5;
  id v6;
  uint64_t v7;

  if (!a3)
  {
    v7 = 32;
    goto LABEL_5;
  }
  mListMapById = self->mListMapById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mListMapById, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = 40;
LABEL_5:
    v6 = *(id *)((char *)&self->super.isa + v7);
  }
  return v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDListTable;
  -[WDListTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultList, 0);
  objc_storeStrong((id *)&self->mNullList, 0);
  objc_storeStrong((id *)&self->mListMapById, 0);
  objc_storeStrong((id *)&self->mLists, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
