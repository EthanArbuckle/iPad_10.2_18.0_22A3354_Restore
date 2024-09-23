@implementation HashHelper

+ (HashHelper)hashHelper
{
  objc_opt_self();
  return objc_alloc_init(HashHelper);
}

- (HashHelper)init
{
  HashHelper *v2;
  HashHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HashHelper;
  v2 = -[HashHelper init](&v5, sel_init);
  v3 = v2;
  if (v2)
    CC_SHA256_Init(&v2->ctx);
  return v3;
}

- (char)getHash
{
  char *v1;
  unsigned __int8 *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x3417CE6CuLL);
    CC_SHA256_Final(v2, (CC_SHA256_CTX *)(v1 + 8));
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v2, 32, 1);
    a1 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (char)addData:(CC_LONG)a3 withLength:
{
  char *v4;

  if (a1)
  {
    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), a2, a3);
    v4 = a1;
  }
  return a1;
}

- (char)addData:(char *)a1
{
  id v3;
  const void *v4;
  CC_LONG v5;
  char *v6;

  if (a1)
  {
    v3 = objc_retainAutorelease(a2);
    v4 = (const void *)objc_msgSend(v3, "bytes");
    v5 = objc_msgSend(v3, "length");

    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), v4, v5);
    v6 = a1;
  }
  return a1;
}

- (char)addString:(char *)a1
{
  id v3;
  const void *v4;
  CC_LONG v5;
  char *v6;

  if (a1)
  {
    v3 = objc_retainAutorelease(a2);
    v4 = (const void *)objc_msgSend(v3, "UTF8String");
    v5 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);

    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), v4, v5);
    v6 = a1;
  }
  return a1;
}

- (char)addNumber:(char *)a1
{
  char *v3;
  uint64_t data;

  if (a1)
  {
    data = objc_msgSend(a2, "longLongValue");
    CC_SHA256_Update((CC_SHA256_CTX *)(a1 + 8), &data, 8u);
    v3 = a1;
  }
  return a1;
}

- (id)addDictionary:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__HashHelper_addDictionary___block_invoke;
    v9[3] = &unk_1E7D8AB30;
    v9[4] = a1;
    v10 = v4;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    v7 = a1;

  }
  return a1;
}

void __28__HashHelper_addDictionary___block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  id v8;

  v3 = *(char **)(a1 + 32);
  v4 = a2;
  v5 = -[HashHelper addObject:](v3, v4);
  v6 = *(char **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[HashHelper addObject:](v6, v8);
}

- (char)addObject:(char *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HashHelper addData:](a1, v3);
      objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HashHelper addString:](a1, v3);
        objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[HashHelper addNumber:](a1, v3);
          objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[HashHelper addDictionary:](a1, v3);
            objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[HashHelper addArray:](a1, v3);
              objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[HashHelper addDateComponents:](a1, v3);
                objc_claimAutoreleasedReturnValue();
              }
              else
              {
                a1 = 0;
              }
            }
          }
        }
      }
    }
  }

  return a1;
}

- (id)addArray:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          v9 = (id)-[HashHelper addObject:](a1, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    v10 = a1;
  }

  return a1;
}

- (char)addDateComponents:(char *)a1
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a2;
    objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "year"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HashHelper addNumber:](a1, v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "month"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HashHelper addNumber:](a1, v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "day"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HashHelper addNumber:](a1, v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "hour"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HashHelper addNumber:](a1, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "minute"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HashHelper addNumber:](a1, v13);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = objc_msgSend(v4, "second");

    objc_msgSend(v15, "numberWithInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HashHelper addNumber:](a1, v17);

    v19 = a1;
  }
  return a1;
}

@end
