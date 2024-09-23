@implementation WDListDefinitionTable

- (WDListDefinitionTable)initWithDocument:(id)a3
{
  id v4;
  WDListDefinitionTable *v5;
  WDListDefinitionTable *v6;
  NSMutableArray *v7;
  NSMutableArray *mListDefinitions;
  uint64_t v9;
  NSMutableDictionary *mListDefinitionMapById;
  uint64_t v11;
  NSMutableDictionary *mListDefinitionMapByStyleId;
  WDListDefinition *v13;
  WDListDefinition *mNullListDefinition;
  void *v15;
  void *v16;
  WDListDefinition *v17;
  WDListDefinition *mDefaultListDefinition;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _WORD v25[2];
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WDListDefinitionTable;
  v5 = -[WDListDefinitionTable init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mListDefinitions = v6->mListDefinitions;
    v6->mListDefinitions = v7;

    v9 = objc_opt_new();
    mListDefinitionMapById = v6->mListDefinitionMapById;
    v6->mListDefinitionMapById = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    mListDefinitionMapByStyleId = v6->mListDefinitionMapByStyleId;
    v6->mListDefinitionMapByStyleId = (NSMutableDictionary *)v11;

    v13 = -[WDListDefinition initWithDocument:listDefinitionId:styleId:]([WDListDefinition alloc], "initWithDocument:listDefinitionId:styleId:", v4, 0xFFFFFFFFLL, 0);
    mNullListDefinition = v6->mNullListDefinition;
    v6->mNullListDefinition = v13;

    -[WDListDefinition setType:](v6->mNullListDefinition, "setType:", 0);
    -[WDListDefinition addLevel](v6->mNullListDefinition, "addLevel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNumberFormat:", 0);
    objc_msgSend(v15, "paragraphProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFirstLineIndent:", 0);
    objc_msgSend(v16, "setLeadingIndent:", 0);
    objc_msgSend(v16, "setFollowingIndent:", 0);
    objc_msgSend(v15, "setSuffix:", 0);
    v17 = -[WDListDefinition initWithDocument:listDefinitionId:styleId:]([WDListDefinition alloc], "initWithDocument:listDefinitionId:styleId:", v4, 4294967294, 0);
    mDefaultListDefinition = v6->mDefaultListDefinition;
    v6->mDefaultListDefinition = v17;

    -[WDListDefinition setType:](v6->mDefaultListDefinition, "setType:", 1);
    v24 = v4;
    for (i = 1; i != 10; ++i)
    {
      -[WDListDefinition addLevel](v6->mDefaultListDefinition, "addLevel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStartNumber:", 1);
      objc_msgSend(v20, "setNumberFormat:", 0);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%lu."), i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v21);

      objc_msgSend(v20, "setJustification:", 0);
      objc_msgSend(v20, "paragraphProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFirstLineIndent:", 4294966576);
      objc_msgSend(v22, "setLeadingIndent:", (__int16)(720 * i));
      v25[1] = 6;
      v25[0] = 720 * i;
      objc_msgSend(v22, "addTabStopAdded:", v25);

    }
    v4 = v24;
  }

  return v6;
}

- (id)definitions
{
  return self->mListDefinitions;
}

- (id)addDefinitionWithDefinitionId:(int)a3 styleId:(id)a4
{
  uint64_t v4;
  id v6;
  WDListDefinition *v7;
  id WeakRetained;
  WDListDefinition *v9;
  NSMutableDictionary *mListDefinitionMapById;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((_DWORD)v4 == 0x80000000)
    v4 = -[NSMutableArray count](self->mListDefinitions, "count");
  v7 = [WDListDefinition alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v9 = -[WDListDefinition initWithDocument:listDefinitionId:styleId:](v7, "initWithDocument:listDefinitionId:styleId:", WeakRetained, v4, v6);

  -[NSMutableArray addObject:](self->mListDefinitions, "addObject:", v9);
  mListDefinitionMapById = self->mListDefinitionMapById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mListDefinitionMapById, "setObject:forKeyedSubscript:", v9, v11);

  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mListDefinitionMapByStyleId, "setObject:forKeyedSubscript:", v9, v6);

  return v9;
}

- (id)definitionWithDefinitionId:(int)a3
{
  NSMutableDictionary *mListDefinitionMapById;
  void *v5;
  id v6;
  uint64_t v7;

  if (a3 == -1)
  {
    v7 = 40;
    goto LABEL_5;
  }
  mListDefinitionMapById = self->mListDefinitionMapById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mListDefinitionMapById, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = 48;
LABEL_5:
    v6 = *(id *)((char *)&self->super.isa + v7);
  }
  return v6;
}

- (id)definitionWithStyleId:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->mListDefinitionMapByStyleId, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)resolvedDefinitionWithDefinitionId:(int)a3
{
  WDListDefinition *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[WDListDefinitionTable definitionWithDefinitionId:](self, "definitionWithDefinitionId:", *(_QWORD *)&a3);
  v4 = (WDListDefinition *)objc_claimAutoreleasedReturnValue();
  -[WDListDefinition styleRefId](v4, "styleRefId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WDListDefinition styleRefId](v4, "styleRefId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDListDefinitionTable definitionWithStyleId:](self, "definitionWithStyleId:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (WDListDefinition *)v7;
    if (!v7)
      v4 = self->mNullListDefinition;
  }
  return v4;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDListDefinitionTable;
  -[WDListDefinitionTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultListDefinition, 0);
  objc_storeStrong((id *)&self->mNullListDefinition, 0);
  objc_storeStrong((id *)&self->mListDefinitionMapByStyleId, 0);
  objc_storeStrong((id *)&self->mListDefinitionMapById, 0);
  objc_storeStrong((id *)&self->mListDefinitions, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end
