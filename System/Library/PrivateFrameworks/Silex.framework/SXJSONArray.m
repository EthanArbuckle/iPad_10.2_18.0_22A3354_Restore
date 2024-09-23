@implementation SXJSONArray

BOOL __97__SXJSONArray_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v4 != v3
    && ((v5 = *(_QWORD *)(a1 + 40)) == 0
     || ((*(uint64_t (**)(uint64_t, id, _QWORD))(v5 + 16))(v5, v3, *(_QWORD *)(a1 + 32)) & 1) == 0)
    && v3 != 0;

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v7;
  id *v8;
  unint64_t v10;
  unint64_t v11;

  var0 = a3->var0;
  if (self->_count - a3->var0 >= a5)
    v7 = a5;
  else
    v7 = self->_count - a3->var0;
  a3->var1 = a4;
  a3->var2 = a3->var3;
  if (v7)
  {
    v8 = a4;
    v10 = var0;
    v11 = v7;
    do
    {
      *v8++ = -[SXJSONArray objectAtIndex:](self, "objectAtIndex:", v10++);
      --v11;
    }
    while (v11);
  }
  a3->var0 = v7 + var0;
  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_unfairLock;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (**objectValueClassBlock)(id, void *, _QWORD, NSString *);
  objc_class *v10;
  id v11;
  void *v12;
  SXJSONDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;

  if (self->_count <= a3)
  {
    v6 = 0;
  }
  else
  {
    p_unfairLock = &self->super._unfairLock;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_unfairLock);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[NSArray objectAtIndex:](self->_json, "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objectValueClassBlock = (uint64_t (**)(id, void *, _QWORD, NSString *))self->_objectValueClassBlock;
        if (objectValueClassBlock)
        {
          v10 = (objc_class *)objectValueClassBlock[2](objectValueClassBlock, v8, 0, self->super._specificationVersion);
        }
        else
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)(*((uint64_t (**)(void))self->_valueClassBlock + 2))();

        }
        if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
        {
          v13 = (SXJSONDictionary *)objc_msgSend([v10 alloc], "initWithJSONObject:andVersion:", v8, self->super._specificationVersion);
        }
        else if (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", 0);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "purgeClassBlockForPropertyWithName:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SXJSONDictionary initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:]([SXJSONDictionary alloc], "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", v14, v22, v15, v8, self->super._specificationVersion);

          v6 = (void *)v22;
        }
        else
        {
          if (!-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()))
            goto LABEL_17;
          objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", 0);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SXJSONArray initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:]([SXJSONArray alloc], "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", v17, v16, 0, v8, self->super._specificationVersion);

          v6 = (void *)v16;
        }

        v6 = v13;
      }
      else if (v8)
      {
        v11 = v8;

        v6 = v11;
        goto LABEL_18;
      }
LABEL_17:
      if (!v6)
      {
LABEL_22:

        return v6;
      }
LABEL_18:
      os_unfair_lock_lock_with_options();
      -[NSMutableArray objectAtIndex:](self->_objects, "objectAtIndex:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 == v19)
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_objects, "replaceObjectAtIndex:withObject:", a3, v6);
      }
      else
      {
        v20 = v18;

        v6 = v20;
      }
      os_unfair_lock_unlock(p_unfairLock);

      goto LABEL_22;
    }
  }
  return v6;
}

- (SXJSONArray)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  SXJSONArray *v15;
  id v16;
  SXJSONArray *v17;
  SXJSONArray *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *json;
  uint64_t v23;
  id objectValueClassBlock;
  uint64_t v25;
  id valueClassBlock;
  uint64_t v27;
  NSMutableArray *objects;
  unint64_t v29;
  NSMutableArray *v30;
  void *v31;
  SXJSONArray *v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  objc_super v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (SXJSONArray *)a6;
  v16 = a7;
  if (v12)
  {
    v38.receiver = self;
    v38.super_class = (Class)SXJSONArray;
    v17 = -[SXJSONObject init](&v38, sel_init);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._specificationVersion, a7);
      v19 = (void *)MEMORY[0x24BDD1758];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __97__SXJSONArray_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke;
      v35[3] = &unk_24D68AAC0;
      v34 = v14;
      v37 = v14;
      v36 = v16;
      objc_msgSend(v19, "predicateWithBlock:", v35);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXJSONArray filteredArrayUsingPredicate:](v15, "filteredArrayUsingPredicate:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      json = v18->_json;
      v18->_json = (NSArray *)v21;

      v23 = objc_msgSend(v13, "copy");
      objectValueClassBlock = v18->_objectValueClassBlock;
      v18->_objectValueClassBlock = (id)v23;

      v25 = objc_msgSend(v12, "copy");
      valueClassBlock = v18->_valueClassBlock;
      v18->_valueClassBlock = (id)v25;

      v18->_count = -[NSArray count](v18->_json, "count");
      v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v18->_count);
      objects = v18->_objects;
      v18->_objects = (NSMutableArray *)v27;

      if (v18->_count)
      {
        v29 = 0;
        do
        {
          v30 = v18->_objects;
          objc_msgSend(MEMORY[0x24BDBCEF8], "null", v34);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v30, "addObject:", v31);

          ++v29;
        }
        while (v29 < v18->_count);
      }

      self = v18;
      v14 = v34;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v18 = v15;
  }
  v32 = v18;

  return v32;
}

- (id)NSArray
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_count)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      -[SXJSONArray objectAtIndex:](self, "objectAtIndex:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      v4 = v5;
    }
    while (self->_count > v5++);
  }
  return v3;
}

- (id)firstObject
{
  void *v3;

  v3 = -[SXJSONArray count](self, "count");
  if (v3)
  {
    -[SXJSONArray objectAtIndex:](self, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)lastObject
{
  unint64_t count;
  void *v3;

  count = self->_count;
  if (count)
  {
    -[SXJSONArray objectAtIndex:](self, "objectAtIndex:", count - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)JSONRepresentation
{
  return self->_json;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{"));
  if (self->_count)
  {
    v4 = 0;
    do
    {
      -[SXJSONArray objectAtIndex:](self, "objectAtIndex:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v4 == self->_count - 1)
        v7 = CFSTR("%@");
      else
        v7 = CFSTR("%@,\n");
      objc_msgSend(v3, "appendFormat:", v7, v5);

      ++v4;
    }
    while (v4 < self->_count);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (id)objectValueClassBlock
{
  return self->_objectValueClassBlock;
}

- (id)valueClassBlock
{
  return self->_valueClassBlock;
}

- (NSArray)json
{
  return self->_json;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong(&self->_valueClassBlock, 0);
  objc_storeStrong(&self->_objectValueClassBlock, 0);
}

@end
