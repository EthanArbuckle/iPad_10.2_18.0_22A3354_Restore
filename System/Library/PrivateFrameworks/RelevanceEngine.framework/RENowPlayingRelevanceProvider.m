@implementation RENowPlayingRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("now_playing");
}

- (RENowPlayingRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RENowPlayingRelevanceProvider *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RENowPlayingRelevanceProvider initWithState:bundleIdentifier:itemIdentifier:](self, "initWithState:bundleIdentifier:itemIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"), v6, v7);
  return v8;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  NSString *bundleIdentifier;
  NSString *itemIdentifer;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", bundleIdentifier, CFSTR("bundleIdentifier"));
  itemIdentifer = self->_itemIdentifer;
  if (itemIdentifer)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", itemIdentifer, CFSTR("itemIdentifier"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3
{
  return -[RENowPlayingRelevanceProvider initWithState:bundleIdentifier:itemIdentifier:](self, "initWithState:bundleIdentifier:itemIdentifier:", a3, 0, 0);
}

- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  RENowPlayingRelevanceProvider *v10;
  RENowPlayingRelevanceProvider *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSString *itemIdentifer;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RENowPlayingRelevanceProvider;
  v10 = -[RERelevanceProvider init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    itemIdentifer = v11->_itemIdentifer;
    v11->_itemIdentifer = (NSString *)v14;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithState:bundleIdentifier:itemIdentifier:", self->_state, self->_bundleIdentifier, self->_itemIdentifer);
}

- (BOOL)isEqual:(id)a3
{
  RENowPlayingRelevanceProvider *v4;
  RENowPlayingRelevanceProvider *v5;
  RENowPlayingRelevanceProvider *v6;
  NSString *bundleIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  char v12;
  NSString *itemIdentifer;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  objc_super v18;

  v4 = (RENowPlayingRelevanceProvider *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RENowPlayingRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v18, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        v6 = v5;
        if (self->_state == v5->_state)
        {
          bundleIdentifier = self->_bundleIdentifier;
          v8 = v5->_bundleIdentifier;
          if (bundleIdentifier == v8)
          {

          }
          else
          {
            v9 = v8;
            v10 = bundleIdentifier;
            v11 = -[NSString isEqual:](v10, "isEqual:", v9);

            if (!v11)
              goto LABEL_7;
          }
          itemIdentifer = self->_itemIdentifer;
          v14 = v6->_itemIdentifer;
          v15 = itemIdentifer;
          v16 = v15;
          if (v15 == v14)
            v12 = 1;
          else
            v12 = -[NSString isEqual:](v15, "isEqual:", v14);

          goto LABEL_15;
        }
LABEL_7:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)_hash
{
  unint64_t state;
  NSUInteger v4;

  state = self->_state;
  v4 = -[NSString hash](self->_itemIdentifer, "hash") ^ state;
  return v4 ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RENowPlayingRelevanceProvider;
  -[RENowPlayingRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" state=%lu, bundleIdentifier=%@, itemIdentifier=%@"), self->_state, self->_bundleIdentifier, self->_itemIdentifer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)itemIdentifer
{
  return self->_itemIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifer, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
