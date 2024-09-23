@implementation EDOptimizedStringsCollection

- (EDOptimizedStringsCollection)init
{
  EDOptimizedStringsCollection *v2;
  uint64_t v3;
  NSMutableDictionary *mStringDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDOptimizedStringsCollection;
  v2 = -[EDCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    mStringDictionary = v2->mStringDictionary;
    v2->mStringDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSMutableDictionary *mStringDictionary;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->mStringDictionary, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "unsignedIntValue");
    }
    else
    {
      -[NSMutableArray addObject:](self->super.mObjects, "addObject:", v4);
      mStringDictionary = self->mStringDictionary;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->super.mObjects, "count") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](mStringDictionary, "setObject:forKey:", v9, v4);

      v7 = -[NSMutableArray count](self->super.mObjects, "count") - 1;
    }

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStringDictionary, 0);
}

@end
