@implementation STRPPropertyListTypeEncoder

- (STRPPropertyListTypeEncoder)init
{
  STRPPropertyListTypeEncoder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STRPPropertyListTypeEncoder;
  v2 = -[STRPPropertyListTypeEncoder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v2->_storage;
    v2->_storage = v3;

  }
  return v2;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if ((objc_msgSend(v6, "conformsToProtocol:", &unk_2574647B8) & 1) != 0)
    {
      -[STRPPropertyListTypeEncoder _encodeRawObject:](self, "_encodeRawObject:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_storage, "setObject:forKey:", v8, v7);

    }
    else
    {
      STRPLogCoding();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[STRPPropertyListTypeEncoder encodeObject:forKey:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    }
  }

}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  STRPLogCoding();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[STRPPropertyListTypeEncoder encodeConditionalObject:forKey:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v8, v7);

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v8, v7);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v8, v7);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v8, v7);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  double v8;
  id v9;

  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v9, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  NSMutableDictionary *storage;
  void *v6;
  id v7;
  id v8;

  storage = self->_storage;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](storage, "setObject:forKey:", v8, v7);

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = a5;
  objc_msgSend(v8, "dataWithBytes:length:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_storage, "setObject:forKey:", v10, v9);

}

- (id)_encodeRawObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id *v18;
  _QWORD v19[4];
  id v20;
  STRPPropertyListTypeEncoder *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "numberWithDouble:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    v10 = objc_msgSend(v9, "count");
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STRPPropertyListTypeEncoder _encodeRawObject:](self, "_encodeRawObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:atIndexedSubscript:", v13, i);

      }
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v4;
      v15 = objc_msgSend(v14, "count");
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v15);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __48__STRPPropertyListTypeEncoder__encodeRawObject___block_invoke;
      v19[3] = &unk_2516438D0;
      v17 = v16;
      v20 = v17;
      v21 = self;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);

      v6 = v17;
    }
    else
    {
      v18 = (id *)objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(v4, "encodeWithCoder:", v18);
      v6 = (id)objc_msgSend(v18[1], "copy");

    }
  }
LABEL_7:

  return v6;
}

void __48__STRPPropertyListTypeEncoder__encodeRawObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_encodeRawObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)encodeObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245256000, a2, a3, "Must conform to secure coding. key='%{public}@'", a5, a6, a7, a8, 2u);
}

- (void)encodeConditionalObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_245256000, a2, a3, "-encodeConditionalObject: is not supported. key='%{public}@'", a5, a6, a7, a8, 2u);
}

@end
