@implementation SUNavigationHistoryItem

- (SUNavigationHistoryItem)init
{
  return -[SUNavigationHistoryItem initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUNavigationHistoryItem)initWithDictionary:(id)a3
{
  SUNavigationHistoryItem *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUNavigationHistoryItem;
  v4 = -[SUNavigationHistoryItem init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_title = (NSString *)v5;
    v6 = objc_msgSend(a3, "objectForKey:", CFSTR("url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
      if (v7)
      {
        v8 = (void *)v7;
        v4->_urlRequestProperties = (SSURLRequestProperties *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", v7);

      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationHistoryItem;
  -[SUNavigationHistoryItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v5[2] = -[SSURLRequestProperties copyWithZone:](self->_urlRequestProperties, "copyWithZone:", a3);
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (SSURLRequestProperties)URLRequestProperties
{
  return self->_urlRequestProperties;
}

@end
