@implementation _REAggregateRuleCondition

- (unint64_t)hash
{
  return self->_type ^ -[NSSet hash](self->_conditions, "hash");
}

- (BOOL)_validForRanking
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[NSSet count](self->_conditions, "count"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_conditions;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_validForRanking", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (id)_inflectionFeatureValuePairs
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[NSSet count](self->_conditions, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_conditions;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_inflectionFeatureValuePairs", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v9);

        }
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = (void *)objc_msgSend(v3, "copy");
    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_dependentFeatures
{
  void *v3;
  NSSet *v4;
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
  +[REFeatureSet featureSet](REMutableFeatureSet, "featureSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_conditions;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "_dependentFeatures", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionFeatureSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (_REAggregateRuleCondition)initWithConditions:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _REAggregateRuleCondition *v23;
  uint64_t v24;
  NSSet *conditions;
  _REAggregateRuleCondition *v27;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v27 = self;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
        {
          v15 = objc_msgSend(v14, "_validForRanking");
          v10 += v15;
          v11 += v15 ^ 1;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "type") == a4)
          {
            objc_msgSend(v14, "conditions");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "unionSet:", v16);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v14, v27);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);

    self = v27;
    if (v10 && v11)
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Cannot mix REComparisonCondition and RECondition in the same condition"), v17, v18, v19, v20, v21, v22, (uint64_t)v27);
  }
  else
  {

  }
  v29.receiver = self;
  v29.super_class = (Class)_REAggregateRuleCondition;
  v23 = -[_REAggregateRuleCondition init](&v29, sel_init, v27);
  if (v23)
  {
    v24 = objc_msgSend(v6, "copy");
    conditions = v23->_conditions;
    v23->_conditions = (NSSet *)v24;

    v23->_type = a4;
  }

  return v23;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)_notCondition
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _REAggregateRuleCondition *v10;
  uint64_t v11;
  NSSet *conditions;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[NSSet count](self->_conditions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_conditions;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "_notCondition", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = objc_alloc_init(_REAggregateRuleCondition);
  v11 = objc_msgSend(v3, "copy");
  conditions = v10->_conditions;
  v10->_conditions = (NSSet *)v11;

  v10->_type = self->_type != 1;
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _REAggregateRuleCondition *v4;
  _REAggregateRuleCondition *v5;
  _REAggregateRuleCondition *v6;
  NSSet *conditions;
  NSSet *v8;
  NSSet *v9;
  NSSet *v10;
  char v11;

  v4 = (_REAggregateRuleCondition *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_type == v5->_type)
      {
        conditions = self->_conditions;
        v8 = v5->_conditions;
        v9 = conditions;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSSet isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)count
{
  return -[NSSet count](self->_conditions, "count");
}

- (BOOL)_requiresTwoFeatures
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_conditions;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_requiresTwoFeatures", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_needsProbability
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_conditions;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_needsProbability", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  unint64_t type;
  BOOL v18;
  NSSet *obj;
  _QWORD v21[2];
  uint64_t (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = a5;
  if (-[NSSet count](self->_conditions, "count"))
  {
    v10 = self->_type != 1;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = self->_conditions;
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v12 = v10;
    if (v11)
    {
      v13 = *(_QWORD *)v28;
      v12 = v10;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v22 = __74___REAggregateRuleCondition__acceptsFeatureMap_predictionSet_explanation___block_invoke;
          v23 = &unk_24CF90140;
          v24 = v8;
          v25 = v9;
          v26 = v31;
          v16 = v22(v21, v15);
          type = self->_type;
          if (type)
          {
            if (type == 1 && ((v12 | v16) & 1) != 0)
            {
              v12 = 1;
LABEL_19:

              goto LABEL_20;
            }
            v12 = 0;
          }
          else
          {
            if ((v12 & v16) != 1)
            {
              v12 = 0;
              goto LABEL_19;
            }
            v12 = 1;
          }

        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_20:

    v18 = v12 != 0;
  }
  else
  {
    v18 = 1;
  }
  _Block_object_dispose(v31, 8);

  return v18;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  unint64_t type;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[NSSet count](self->_conditions, "count"))
  {
    v8 = self->_type != 1;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_conditions;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_acceptsLeftFeatureMap:rightFeatureMap:", v6, v7, (_QWORD)v18);
          type = self->_type;
          if (type)
          {
            if (type == 1 && ((v8 | v14) & 1) != 0)
            {
              v16 = 1;
LABEL_19:

              goto LABEL_20;
            }
            v8 = 0;
          }
          else
          {
            if ((v8 & v14) != 1)
            {
              v16 = 0;
              goto LABEL_19;
            }
            v8 = 1;
          }
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = v8;
  }
  else
  {
    v16 = 1;
  }
LABEL_20:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_conditions);
  v4[1] = (id)self->_type;
  return v4;
}

- (NSSet)conditions
{
  return self->_conditions;
}

@end
