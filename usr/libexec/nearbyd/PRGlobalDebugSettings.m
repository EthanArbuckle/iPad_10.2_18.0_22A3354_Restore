@implementation PRGlobalDebugSettings

+ (id)sharedSettings
{
  if (qword_10085DAA0 != -1)
    dispatch_once(&qword_10085DAA0, &stru_100815138);
  return (id)qword_10085DA98;
}

- (PRGlobalDebugSettings)init
{
  PRGlobalDebugSettings *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRGlobalDebugSettings;
  v2 = -[PRGlobalDebugSettings init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dict = v2->_dict;
    v2->_dict = v3;

  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[PRGlobalDebugSettings willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v6, v7);

  -[PRGlobalDebugSettings didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", a3);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v6 = -[PRGlobalDebugSettings objectForKey:ofClass:](self, "objectForKey:ofClass:", v4, objc_opt_class(NSNumber, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 0;

  return v8;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = -[PRGlobalDebugSettings objectForKey:ofClass:](self, "objectForKey:ofClass:", v4, objc_opt_class(NSNumber, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 0;

  return (int64_t)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
