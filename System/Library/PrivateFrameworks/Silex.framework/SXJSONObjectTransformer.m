@implementation SXJSONObjectTransformer

+ (id)transformerWithKey:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  SXJSONObjectTransformer *v7;
  uint64_t v8;
  NSString *key;
  uint64_t v10;
  id block;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SXJSONObjectTransformer);
  v8 = objc_msgSend(v6, "copy");

  key = v7->_key;
  v7->_key = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  block = v7->_block;
  v7->_block = (id)v10;

  return v7;
}

+ (id)concatenatingTransformerWithKey:(id)a3
{
  return (id)objc_msgSend(a1, "transformerWithKey:block:", a3, &__block_literal_global_49);
}

id __59__SXJSONObjectTransformer_concatenatingTransformerWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  if (v4 | v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v5)
      objc_msgSend(v7, "addObject:", v5);
    if (v4)
      objc_msgSend(v6, "addObject:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)mergingTransformerWithKey:(id)a3
{
  return (id)objc_msgSend(a1, "transformerWithKey:block:", a3, &__block_literal_global_2_0);
}

id __53__SXJSONObjectTransformer_mergingTransformerWithKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v4 = a2;
  v5 = a3;
  if (v4 | v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "addObjectsFromArray:", v5);
    }
    else if (v5)
    {
      objc_msgSend(v6, "addObject:", v5);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "addObjectsFromArray:", v4);
    }
    else if (v4)
    {
      objc_msgSend(v6, "addObject:", v4);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)transformObject:(id)a3 otherObject:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SXJSONObjectTransformer block](self, "block");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v8)[2](v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transformKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SXJSONObjectTransformer key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
