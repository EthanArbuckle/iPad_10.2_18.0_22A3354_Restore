@implementation PFStoryAutoEditFrequencyTable

- (PFStoryAutoEditFrequencyTable)initWithValueCounts:(id)a3 randomNumberGenerator:(id)a4 fallbackValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFStoryAutoEditFrequencyTable *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSArray *baseTable;
  uint64_t v19;
  NSMutableArray *workingElements;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PFStoryAutoEditFrequencyTable;
  v11 = -[PFStoryAutoEditFrequencyTable init](&v22, sel_init);
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    if (objc_msgSend(v8, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");

        if (v15 >= 1)
        {
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v16);

            --v15;
          }
          while (v15);
        }
        ++v13;
      }
      while (v13 < objc_msgSend(v8, "count"));
    }
    if (!objc_msgSend(v12, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v10;
        _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Empty frequency table. Inserting a default value of %{public}@ for safety.", buf, 0xCu);
      }
      objc_msgSend(v12, "addObject:", v10);
    }
    v17 = objc_msgSend(v12, "copy");
    baseTable = v11->_baseTable;
    v11->_baseTable = (NSArray *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * -[NSArray count](v11->_baseTable, "count"));
    workingElements = v11->_workingElements;
    v11->_workingElements = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v11->_randomNumberGenerator, a4);
    objc_storeStrong((id *)&v11->_fallbackValue, a5);

  }
  return v11;
}

- (PFStoryAutoEditFrequencyTable)init
{
  PFStoryAutoEditFrequencyTable *v2;
  SEL v3;

  v2 = (PFStoryAutoEditFrequencyTable *)_PFAssertFailHandler();
  return (PFStoryAutoEditFrequencyTable *)-[PFStoryAutoEditFrequencyTable description](v2, v3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; base table = %@; fallback value = %@>"),
               objc_opt_class(),
               self,
               self->_baseTable,
               self->_fallbackValue);
}

- (BOOL)hasValue:(id)a3
{
  return -[NSArray containsObject:](self->_baseTable, "containsObject:", a3);
}

- (id)nextValue
{
  return -[PFStoryAutoEditFrequencyTable nextValuePassingTest:](self, "nextValuePassingTest:", &__block_literal_global_10414);
}

- (id)nextValuePassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSUInteger v5;
  void *v6;
  NSNumber *v7;
  char v8;
  NSNumber *fallbackValue;
  NSNumber *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;

  v4 = (uint64_t (**)(id, void *))a3;
  v5 = 2 * -[NSArray count](self->_baseTable, "count") + 2;
  if (-[NSMutableArray count](self->_workingElements, "count") < v5)
  {
    PFShuffledArrayWithRandomNumberGenerator(self->_baseTable, self->_randomNumberGenerator);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](self->_workingElements, "addObjectsFromArray:", v6);

  }
  -[NSMutableArray firstObject](self->_workingElements, "firstObject");
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_workingElements, "removeObjectAtIndex:", 0);
  v8 = v4[2](v4, v7);
  fallbackValue = v7;
  if ((v8 & 1) != 0)
  {
LABEL_4:
    v10 = fallbackValue;
    goto LABEL_27;
  }
  if (!-[NSMutableArray count](self->_workingElements, "count"))
    goto LABEL_14;
  v11 = 1;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_workingElements, "objectAtIndexedSubscript:", v11 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4[2](v4, v12))
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_workingElements, "replaceObjectAtIndex:withObject:", v11 - 1, v7);
      v10 = v12;
    }
    else
    {
      v10 = 0;
    }

    v13 = -[NSMutableArray count](self->_workingElements, "count");
    if (v10)
      break;
    v14 = v11++ >= v13;
  }
  while (!v14);
  if (!v10)
  {
LABEL_14:
    PFShuffledArrayWithRandomNumberGenerator(self->_baseTable, self->_randomNumberGenerator);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {

LABEL_25:
      -[NSMutableArray insertObject:atIndex:](self->_workingElements, "insertObject:atIndex:", v7, 0);
      v10 = 0;
      if (!v4[2](v4, self->_fallbackValue))
        goto LABEL_27;
      fallbackValue = self->_fallbackValue;
      goto LABEL_4;
    }
    v16 = 1;
    do
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16 - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v17))
        v10 = v17;
      else
        v10 = 0;

      v18 = objc_msgSend(v15, "count");
      if (v10)
        break;
      v14 = v16++ >= v18;
    }
    while (!v14);

    if (!v10)
      goto LABEL_25;
  }
LABEL_27:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackValue, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_workingElements, 0);
  objc_storeStrong((id *)&self->_baseTable, 0);
}

uint64_t __42__PFStoryAutoEditFrequencyTable_nextValue__block_invoke()
{
  return 1;
}

@end
