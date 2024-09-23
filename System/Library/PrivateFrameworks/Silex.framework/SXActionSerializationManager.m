@implementation SXActionSerializationManager

- (SXActionSerializationManager)init
{
  SXActionSerializationManager *v2;
  uint64_t v3;
  NSMutableDictionary *serializers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXActionSerializationManager;
  v2 = -[SXActionSerializationManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    serializers = v2->_serializers;
    v2->_serializers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v6 = a3;
    -[SXActionSerializationManager serializers](self, "serializers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLForAction:type:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)registerSerializer:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SXActionSerializationManager serializers](self, "serializers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (NSMutableDictionary)serializers
{
  return self->_serializers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializers, 0);
}

@end
