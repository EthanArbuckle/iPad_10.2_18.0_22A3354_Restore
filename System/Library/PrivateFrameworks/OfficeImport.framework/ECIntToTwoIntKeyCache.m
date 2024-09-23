@implementation ECIntToTwoIntKeyCache

- (ECIntToTwoIntKeyCache)init
{
  ECIntToTwoIntKeyCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ECIntToTwoIntKeyCache;
  v2 = -[ECIntToTwoIntKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mCache = v2->mCache;
    v2->mCache = v3;

  }
  return v2;
}

+ (id)keyForKey1:(unint64_t)a3 key2:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu,%llu"), a3, a4);
}

- (BOOL)integerIsPresentForKey1:(unint64_t)a3 key2:(unint64_t)a4 outValue:(unint64_t *)a5
{
  void *v7;
  void *v8;
  void *v9;

  +[ECIntToTwoIntKeyCache keyForKey1:key2:](ECIntToTwoIntKeyCache, "keyForKey1:key2:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->mCache, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    *a5 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9 != 0;
}

- (void)setObject:(unint64_t)a3 forKey1:(unint64_t)a4 key2:(unint64_t)a5
{
  void *v7;
  id v8;

  +[ECIntToTwoIntKeyCache keyForKey1:key2:](ECIntToTwoIntKeyCache, "keyForKey1:key2:", a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->mCache, "setObject:forKeyedSubscript:", v7, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCache, 0);
}

@end
