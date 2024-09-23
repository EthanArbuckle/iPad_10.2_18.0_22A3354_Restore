@implementation TCDumpEnum

- (TCDumpEnum)initWithTypeName:(id)a3 pairs:(TCDumpEnumPair *)a4
{
  id v7;
  TCDumpEnum *v8;
  TCDumpEnum *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mValueToNameMap;
  NSMutableDictionary *v12;
  NSMutableDictionary *mNameToValueMap;
  void *v14;
  id var1;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TCDumpEnum;
  v8 = -[TCDumpEnum init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mTypeName, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mValueToNameMap = v9->mValueToNameMap;
    v9->mValueToNameMap = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mNameToValueMap = v9->mNameToValueMap;
    v9->mNameToValueMap = v12;

    if (a4->var1)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a4->var0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v9->mValueToNameMap, "setObject:forKey:", a4->var1, v14);
        -[NSMutableDictionary setObject:forKey:](v9->mNameToValueMap, "setObject:forKey:", v14, a4->var1);

        var1 = a4[1].var1;
        ++a4;
      }
      while (var1);
    }
  }

  return v9;
}

- (id)typeName
{
  return self->mTypeName;
}

- (id)valueForName:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mNameToValueMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)nameForValue:(int)a3
{
  NSMutableDictionary *mValueToNameMap;
  void *v4;
  void *v5;

  mValueToNameMap = self->mValueToNameMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mValueToNameMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNameToValueMap, 0);
  objc_storeStrong((id *)&self->mValueToNameMap, 0);
  objc_storeStrong((id *)&self->mTypeName, 0);
}

@end
