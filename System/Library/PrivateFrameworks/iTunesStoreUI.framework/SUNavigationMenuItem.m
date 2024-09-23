@implementation SUNavigationMenuItem

- (SUNavigationMenuItem)init
{
  return -[SUNavigationMenuItem initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUNavigationMenuItem)initWithDictionary:(id)a3
{
  SUNavigationMenuItem *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUNavigationMenuItem;
  v4 = -[SUNavigationMenuItem init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "objectForKey:", CFSTR("rating"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      v4->_contentRating = -[SUItemContentRating initWithDictionary:]([SUItemContentRating alloc], "initWithDictionary:", v5);
    }
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_title = (NSString *)v6;
    v7 = objc_msgSend(a3, "objectForKey:", CFSTR("url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_url = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
    if (!-[NSString length](v4->_title, "length") || !v4->_url)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenuItem;
  -[SUNavigationMenuItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[SUItemContentRating copyWithZone:](self->_contentRating, "copyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v5[3] = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  return v5;
}

- (SUItemContentRating)contentRating
{
  return self->_contentRating;
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
