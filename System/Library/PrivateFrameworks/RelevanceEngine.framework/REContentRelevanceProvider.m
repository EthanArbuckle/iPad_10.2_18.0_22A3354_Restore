@implementation REContentRelevanceProvider

- (REContentRelevanceProvider)initWithContent:(id)a3
{
  void *v4;
  REContentRelevanceProvider *v5;

  RETokenizeString(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REContentRelevanceProvider initWithKeywords:](self, "initWithKeywords:", v4);

  return v5;
}

- (REContentRelevanceProvider)initWithKeywords:(id)a3
{
  id v5;
  REContentRelevanceProvider *v6;
  REContentRelevanceProvider *v7;
  NSArray **p_keywords;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REContentRelevanceProvider;
  v6 = -[RERelevanceProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    p_keywords = &v6->_keywords;
    objc_storeStrong((id *)&v6->_keywords, a3);
    if (!*p_keywords)
    {
      *p_keywords = (NSArray *)MEMORY[0x24BDBD1A8];

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywords, 0);
}

- (REContentRelevanceProvider)init
{
  return -[REContentRelevanceProvider initWithContent:](self, "initWithContent:", &stru_24CF92178);
}

+ (id)relevanceSimulatorID
{
  return CFSTR("content_terms");
}

- (REContentRelevanceProvider)initWithDictionary:(id)a3
{
  void *v4;
  REContentRelevanceProvider *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REContentRelevanceProvider *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("keywords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[REContentRelevanceProvider init](self, "init");
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      v7 = (void *)v6;
      if (v6)
        v8 = (void *)v6;
      else
        v8 = (void *)MEMORY[0x24BDBD1A8];
      objc_storeStrong((id *)&v5->_keywords, v8);

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dictionaryEncoding
{
  NSArray *keywords;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  if (self->_keywords)
    keywords = self->_keywords;
  else
    keywords = (NSArray *)MEMORY[0x24BDBD1A8];
  v4 = CFSTR("keywords");
  v5[0] = keywords;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  REContentRelevanceProvider *v4;

  v4 = -[REContentRelevanceProvider init](+[REContentRelevanceProvider allocWithZone:](REContentRelevanceProvider, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_keywords, self->_keywords);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REContentRelevanceProvider *v4;
  NSArray *keywords;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  objc_super v11;

  v4 = (REContentRelevanceProvider *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)REContentRelevanceProvider,
          -[RERelevanceProvider isEqual:](&v11, sel_isEqual_, v4)))
    {
      keywords = self->_keywords;
      v6 = v4->_keywords;
      v7 = keywords;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSArray isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_keywords;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)REContentRelevanceProvider;
  -[REContentRelevanceProvider description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, keywords=%@"), v4, self->_keywords);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)keywords
{
  return self->_keywords;
}

@end
