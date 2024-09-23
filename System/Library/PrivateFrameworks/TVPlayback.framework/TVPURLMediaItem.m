@implementation TVPURLMediaItem

- (TVPURLMediaItem)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("TVPURLMediaItem Exception"), CFSTR("init is not supported.  Use initWithURL:traits: instead."));

  return 0;
}

- (TVPURLMediaItem)initWithURL:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  TVPURLMediaItem *v8;
  uint64_t v9;
  NSURL *url;
  uint64_t v11;
  NSSet *traits;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPURLMediaItem;
  v8 = -[TVPBaseMediaItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v7);
    traits = v8->_traits;
    v8->_traits = (NSSet *)v11;

  }
  return v8;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  TVPURLMediaItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (TVPURLMediaItem *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TVPURLMediaItem url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPURLMediaItem url](v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasTrait:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[TVPURLMediaItem traits](self, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
