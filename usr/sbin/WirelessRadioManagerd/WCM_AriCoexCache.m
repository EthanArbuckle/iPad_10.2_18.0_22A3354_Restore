@implementation WCM_AriCoexCache

- (WCM_AriCoexCache)init
{
  WCM_AriCoexCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mProperty0;
  NSMutableDictionary *v5;
  NSMutableDictionary *mProperty1;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WCM_AriCoexCache;
  v2 = -[WCM_AriCoexCache init](&v8, "init");
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mProperty0 = v2->mProperty0;
  v2->mProperty0 = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mProperty1 = v2->mProperty1;
  v2->mProperty1 = v5;

  return v2;
}

- (void)removeKey:(id)a3 subId:(unsigned int)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v6 = 16;
    if (!a4)
      v6 = 8;
    objc_msgSend(*(id *)((char *)&self->super.isa + v6), "removeObjectForKey:", v7);
  }

}

- (void)update:(id)a3 value_object:(id)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  uint64_t v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  v8 = a4;
  if (v5 < 2)
  {
    v9 = 16;
    if (!(_DWORD)v5)
      v9 = 8;
    objc_msgSend(*(id *)((char *)&self->super.isa + v9), "setValue:forKey:", v8, v10);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ARI Driver: Cache update -- Invalid subId(%u)"), v5);
  }

}

- (void)update:(id)a3 value_uint64:(unint64_t)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4));
  -[WCM_AriCoexCache update:value_object:subId:](self, "update:value_object:subId:", v9, v8, v5);

}

- (void)update:(id)a3 value_int64:(int64_t)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  -[WCM_AriCoexCache update:value_object:subId:](self, "update:value_object:subId:", v9, v8, v5);

}

- (void)update:(id)a3 value_BOOL:(BOOL)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  -[WCM_AriCoexCache update:value_object:subId:](self, "update:value_object:subId:", v9, v8, v5);

}

- (void)update:(id)a3 value_double:(double)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  -[WCM_AriCoexCache update:value_object:subId:](self, "update:value_object:subId:", v9, v8, v5);

}

- (id)get:(id)a3 subId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (v4 < 2)
  {
    v8 = 16;
    if (!(_DWORD)v4)
      v8 = 8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v8), "objectForKeyedSubscript:", v6));
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("ARI Driver: Cache get -- Invalid subId(%u)"), v4);
    v7 = 0;
  }

  return v7;
}

- (BOOL)get:(id)a3 value_uint64:(unint64_t *)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self, "get:subId:", v8, v5));
  if (v9 && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    *a4 = (unint64_t)objc_msgSend(v9, "unsignedLongLongValue");
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)get:(id)a3 value_int64:(int64_t *)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self, "get:subId:", v8, v5));
  if (v9 && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    *a4 = (int64_t)objc_msgSend(v9, "longLongValue");
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)get:(id)a3 value_BOOL:(BOOL *)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self, "get:subId:", v8, v5));
  if (v9 && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    *a4 = objc_msgSend(v9, "BOOLValue");
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)get:(id)a3 value_double:(double *)a4 subId:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WCM_AriCoexCache get:subId:](self, "get:subId:", v8, v5));
  if (v9 && (v10 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
  {
    objc_msgSend(v9, "doubleValue");
    *(_QWORD *)a4 = v11;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperty1, 0);
  objc_storeStrong((id *)&self->mProperty0, 0);
}

@end
