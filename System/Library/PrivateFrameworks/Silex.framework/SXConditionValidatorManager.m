@implementation SXConditionValidatorManager

- (SXConditionValidatorManager)init
{
  SXConditionValidatorManager *v2;
  uint64_t v3;
  NSMutableArray *validators;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXConditionValidatorManager;
  v2 = -[SXConditionValidatorManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    validators = v2->_validators;
    v2->_validators = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addConditionValidator:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SXConditionValidatorManager validators](self, "validators");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SXConditionValidatorManager validators](self, "validators", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "validateCondition:context:", v6, v7))
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (NSMutableArray)validators
{
  return self->_validators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validators, 0);
}

@end
