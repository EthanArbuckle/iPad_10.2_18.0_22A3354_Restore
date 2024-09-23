@implementation NFJSONEncoder

+ (id)encoder
{
  return (id)objc_opt_new();
}

- (id)_JSONCompatibleArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NFJSONEncoder *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__NFJSONEncoder__JSONCompatibleArray___block_invoke;
  v9[3] = &unk_1E7D7F810;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = v6;
  return v7;
}

void __38__NFJSONEncoder__JSONCompatibleArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_JSONCompatibleArray:", v12);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    objc_msgSend(v3, "addObject:", v4);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_JSONCompatibleDictionary:", v12);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v12, "NF_asHexString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = *(void **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v12, "asDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_JSONCompatibleDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

    }
  }
LABEL_9:

}

- (id)_JSONCompatibleDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  NFJSONEncoder *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__NFJSONEncoder__JSONCompatibleDictionary___block_invoke;
  v9[3] = &unk_1E7D7F838;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = v6;
  return v7;
}

void __43__NFJSONEncoder__JSONCompatibleDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_JSONCompatibleArray:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    objc_msgSend(v6, "setObject:forKey:", v7, v15);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_JSONCompatibleDictionary:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v5, "NF_asHexString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v15);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = *(void **)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v5, "asDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_JSONCompatibleDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v14, v15);

    }
  }
LABEL_9:

}

- (id)stringFromArray:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  -[NFJSONEncoder _JSONCompatibleArray:](self, "_JSONCompatibleArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);

  return v5;
}

- (id)stringFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  -[NFJSONEncoder _JSONCompatibleDictionary:](self, "_JSONCompatibleDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);

  return v5;
}

@end
