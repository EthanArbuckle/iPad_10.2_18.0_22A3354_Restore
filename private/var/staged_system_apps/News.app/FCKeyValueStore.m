@implementation FCKeyValueStore

- (id)ringBufferForKey:(id)a3 capacity:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  FRRingBuffer *v12;

  v6 = a3;
  v8 = objc_opt_class(NSDictionary, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FCKeyValueStore objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6));

  v10 = FCDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = -[FRRingBuffer initWithCapacity:dictionary:]([FRRingBuffer alloc], "initWithCapacity:dictionary:", a4, v11);
  return v12;
}

- (id)ringBufferForKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  FRRingBuffer *v10;

  v4 = a3;
  v6 = objc_opt_class(NSDictionary, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FCKeyValueStore objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4));

  v8 = FCDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = -[FRRingBuffer initWithCapacity:dictionary:]([FRRingBuffer alloc], "initWithCapacity:dictionary:", 75, v9);
  return v10;
}

- (void)setRingBuffers:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006CAD0;
  v3[3] = &unk_1000DE4E0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (BOOL)hasMinForKey:(id)a3
{
  double v3;

  -[FCKeyValueStore minForKey:](self, "minForKey:", a3);
  return v3 != 1.79769313e308;
}

- (BOOL)hasMaxForKey:(id)a3
{
  double v3;

  -[FCKeyValueStore maxForKey:](self, "maxForKey:", a3);
  return v3 != -1.79769313e308;
}

- (double)minForKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  v6 = objc_opt_class(NSDictionary, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FCKeyValueStore objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4));

  v8 = FCDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v11 = objc_opt_class(NSNumber, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Min")));
  v13 = FCDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = 1.79769313e308;
  }

  return v16;
}

- (double)maxForKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;

  v4 = a3;
  v6 = objc_opt_class(NSDictionary, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FCKeyValueStore objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4));

  v8 = FCDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v11 = objc_opt_class(NSNumber, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Max")));
  v13 = FCDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = -1.79769313e308;
  }

  return v16;
}

@end
