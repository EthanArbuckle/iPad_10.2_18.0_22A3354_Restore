@implementation CMOutlineState

- (CMOutlineState)init
{
  CMOutlineState *v2;
  CMOutlineState *v3;
  CMOutlineState *v4;

  v2 = -[CMOutlineState initWithListDefinition:](self, "initWithListDefinition:", 0);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)reset
{
  unint64_t v3;
  WDListDefinition *listDefinition;
  NSMutableArray *counters;
  void *v6;
  void *v7;
  void *v8;

  -[NSMutableArray removeAllObjects](self->_counters, "removeAllObjects");
  if (-[CMOutlineState levelCount](self, "levelCount"))
  {
    v3 = 0;
    do
    {
      counters = self->_counters;
      listDefinition = self->_listDefinition;
      if (listDefinition)
      {
        v6 = (void *)MEMORY[0x24BDD16E0];
        -[WDListDefinition levelAt:](listDefinition, "levelAt:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberWithLong:", objc_msgSend(v7, "startNumber") - 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](counters, "addObject:", v8);

      }
      else
      {
        -[NSMutableArray addObject:](self->_counters, "addObject:", &unk_24F46A990);
      }
      ++v3;
    }
    while (-[CMOutlineState levelCount](self, "levelCount") > v3);
  }
}

- (void)setCounterTo:(unint64_t)a3 atLevel:(unsigned __int8)a4
{
  id v6;

  if (-[CMOutlineState levelCount](self, "levelCount") > a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_counters, "setObject:atIndexedSubscript:");

  }
}

- (void)increaseCounterAtLevel:(unsigned __int8)a3
{
  unsigned int v3;
  unint64_t i;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  if (-[CMOutlineState levelCount](self, "levelCount") > a3 && -[CMOutlineState levelCount](self, "levelCount"))
  {
    for (i = 0; -[CMOutlineState levelCount](self, "levelCount") > i; ++i)
    {
      -[CMOutlineState levelDescriptionAtIndex:](self, "levelDescriptionAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (i >= v3
        || (-[NSMutableArray objectAtIndexedSubscript:](self->_counters, "objectAtIndexedSubscript:", i),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "intValue"),
            v9 = objc_msgSend(v6, "startNumber"),
            v7,
            v9 <= v8))
      {
        if (v3 == i)
        {
          v11 = (void *)MEMORY[0x24BDD16E0];
          -[NSMutableArray objectAtIndexedSubscript:](self->_counters, "objectAtIndexedSubscript:", v3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray setObject:atIndexedSubscript:](self->_counters, "setObject:atIndexedSubscript:", v12, v3);

        }
        else
        {
          if (i <= v3)
            goto LABEL_16;
          v13 = objc_msgSend(v6, "restartLevelOverridden");
          v14 = i;
          if (v13)
            v14 = objc_msgSend(v6, "restartLevel");
          if (v14 <= (int)v3)
            goto LABEL_16;
          v15 = (void *)MEMORY[0x24BDD16E0];
          if (v6)
            v16 = objc_msgSend(v6, "startNumber") - 1;
          else
            v16 = 0;
          objc_msgSend(v15, "numberWithLong:", v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray setObject:atIndexedSubscript:](self->_counters, "setObject:atIndexedSubscript:", v10, i);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v6, "startNumber"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray setObject:atIndexedSubscript:](self->_counters, "setObject:atIndexedSubscript:", v10, i);
      }

LABEL_16:
    }
  }
}

- (unint64_t)counterAtLevel:(unsigned __int8)a3
{
  unsigned int v3;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (-[CMOutlineState levelCount](self, "levelCount") <= a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_counters, "objectAtIndexedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (CMOutlineState)initWithListDefinition:(id)a3
{
  id v5;
  CMOutlineState *v6;
  CMOutlineState *v7;
  NSMutableArray *v8;
  NSMutableArray *counters;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMOutlineState;
  v6 = -[CMOutlineState init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listDefinition, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    counters = v7->_counters;
    v7->_counters = v8;

    -[CMOutlineState reset](v7, "reset");
  }

  return v7;
}

- (unint64_t)levelCount
{
  WDListDefinition *listDefinition;

  listDefinition = self->_listDefinition;
  if (listDefinition)
    return -[WDListDefinition levelCount](listDefinition, "levelCount");
  else
    return 10;
}

- (id)levelDescriptionAtIndex:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[WDList levelOverrideForLevel:](self->_currentList, "levelOverrideForLevel:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isListLevelOverridden"))
    objc_msgSend(v5, "listLevel");
  else
    -[WDListDefinition levelAt:](self->_listDefinition, "levelAt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WDList)currentList
{
  return (WDList *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (WDListDefinition)listDefinition
{
  return (WDListDefinition *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentList, 0);
  objc_storeStrong((id *)&self->_listDefinition, 0);
  objc_storeStrong((id *)&self->_counters, 0);
}

@end
