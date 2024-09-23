@implementation PQLNameInjection

+ (id)_appendString:(id)a3 toInjection:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  size_t v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v10 = objc_retainAutorelease(v6);
  v11 = (void *)objc_msgSend(v9, "initWithBytes:length:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  if (objc_msgSend(v11, "length"))
  {
    v12 = objc_msgSend(v11, "mutableBytes");
    *(_BYTE *)(objc_msgSend(v11, "length") + v12 - 1) = 47;
  }
  else
  {
    objc_msgSend(v11, "appendBytes:length:", "\", 1);
  }
  v13 = strcspn(v8, "\");
  objc_msgSend(v11, "appendBytes:length:", v8, v13);
  while (v8[v13])
  {
    objc_msgSend(v11, "appendBytes:length:", "\"\", 2);
    v8 += v13 + 1;
    v13 = strcspn(v8, "\");
    objc_msgSend(v11, "appendBytes:length:", v8, v13);
  }
  objc_msgSend(v11, "appendBytes:length:", "\", 1);

  return v11;
}

+ (id)nameWithString:(id)a3
{
  id v3;
  PQLNameInjection *v4;

  v3 = a3;
  v4 = -[PQLNameInjection initWithString:]([PQLNameInjection alloc], "initWithString:", v3);

  return v4;
}

+ (id)nameWithPrefix:(id)a3 suffix:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByAppendingPathComponent:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nameWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nameByAddingSuffix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_appendString:toInjection:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v5);
  return v6;
}

- (PQLNameInjection)initWithString:(id)a3
{
  id v4;
  void *v5;
  PQLNameInjection *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_appendString:toInjection:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PQLNameInjectionBase initWithData:](self, "initWithData:", v5);
  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<PQLName %s>"), -[PQLNameInjectionBase bytes](objc_retainAutorelease(self), "bytes"));
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 0;
}

@end
