@implementation SUConcernItem

- (SUConcernItem)initWithDictionary:(id)a3
{
  SUConcernItem *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = -[SUConcernItem init](self, "init");
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("default"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v5, "BOOLValue");
      else
        v6 = 0;
      -[SUConcernItem setDefaultConcern:](v4, "setDefaultConcern:", v6);
      v7 = objc_msgSend(a3, "objectForKey:", CFSTR("problem-id"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      -[SUConcernItem setIdentifier:](v4, "setIdentifier:", v8);
      v9 = objc_msgSend(a3, "objectForKey:", CFSTR("title"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      -[SUConcernItem setTitle:](v4, "setTitle:", v10);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_identifier = 0;
  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUConcernItem;
  -[SUConcernItem dealloc](&v3, sel_dealloc);
}

- (BOOL)isDefaultConcern
{
  return self->_default;
}

- (void)setDefaultConcern:(BOOL)a3
{
  self->_default = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
