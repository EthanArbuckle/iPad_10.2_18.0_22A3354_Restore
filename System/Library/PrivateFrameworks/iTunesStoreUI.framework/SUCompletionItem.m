@implementation SUCompletionItem

- (SUCompletionItem)init
{
  return -[SUCompletionItem initWithPropertyList:](self, "initWithPropertyList:", 0);
}

- (SUCompletionItem)initWithPropertyList:(id)a3
{
  SUCompletionItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUCompletionItem;
  v4 = -[SUCompletionItem init](&v9, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("search-field-term"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_alternateTitle = (NSString *)v5;
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("term"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_title = (NSString *)v6;
    v7 = objc_msgSend(a3, "objectForKey:", CFSTR("url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_url = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUCompletionItem;
  -[SUCompletionItem dealloc](&v3, sel_dealloc);
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

@end
