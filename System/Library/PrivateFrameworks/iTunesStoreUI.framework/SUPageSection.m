@implementation SUPageSection

- (SUPageSection)init
{
  SUPageSection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPageSection;
  result = -[SUPageSection init](&v3, sel_init);
  if (result)
    result->_expirationTime = 1.79769313e308;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPageSection;
  -[SUPageSection dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  char isKindOfClass;
  NSString *v6;
  uint64_t v7;
  int v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;

  objc_opt_class();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = -[SUPageSection identifier](self, "identifier");
  v7 = objc_msgSend(a3, "identifier");
  if ((isKindOfClass & 1) != 0)
    v8 = v6 == (NSString *)v7 || -[NSString isEqualToString:](v6, "isEqualToString:", v7);
  else
    v8 = 0;
  v9 = -[SUPageSection title](self, "title");
  v10 = objc_msgSend(a3, "title");
  if (v8 && ((v11 = v10, v9 == (NSString *)v10) || -[NSString isEqualToString:](v9, "isEqualToString:", v10)))
    return -[SSURLRequestProperties isEqual:](-[SUPageSection URLRequestProperties](self, "URLRequestProperties", v11), "isEqual:", objc_msgSend(a3, "URLRequestProperties"));
  else
    return 0;
}

- (BOOL)loadFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", a3);
  v5 = (void *)objc_msgSend(v4, "dictionaryByEvaluatingConditions");

  v6 = objc_msgSend(v5, "objectForKey:", CFSTR("template-name"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUPageSection setStructuredPageType:](self, "setStructuredPageType:", +[SUStructuredPage pageTypeForStorePageString:](SUStructuredPage, "pageTypeForStorePageString:", v6));
  v7 = objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUPageSection setTitle:](self, "setTitle:", v7);
  v8 = objc_msgSend(v5, "objectForKey:", CFSTR("url-bag-key"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUPageSection _setURLBagKey:](self, "_setURLBagKey:", v8);
  v9 = objc_msgSend(v5, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v9);
    if (v10)
    {
      v11 = (void *)v10;
      -[SUPageSection _setURL:](self, "_setURL:", v10);

    }
  }
  v12 = -[NSString length](-[SUPageSection title](self, "title"), "length");
  if (v12)
    LOBYTE(v12) = ((uint64_t)self->_urlRequestProperties | v6) != 0;
  return v12;
}

- (id)segmentedControlItem
{
  id result;

  result = self->_image;
  if (!result)
    return self->_title;
  return result;
}

- (void)setURLRequestProperties:(id)a3
{
  SSMutableURLRequestProperties *urlRequestProperties;

  urlRequestProperties = self->_urlRequestProperties;
  if (urlRequestProperties != a3)
  {

    self->_urlRequestProperties = (SSMutableURLRequestProperties *)objc_msgSend(a3, "mutableCopy");
  }
}

- (void)_setURL:(id)a3
{
  SSMutableURLRequestProperties *urlRequestProperties;

  urlRequestProperties = self->_urlRequestProperties;
  if (!urlRequestProperties)
  {
    urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    self->_urlRequestProperties = urlRequestProperties;
  }
  -[SSMutableURLRequestProperties setURL:](urlRequestProperties, "setURL:", a3);
}

- (void)_setURLBagKey:(id)a3
{
  SSMutableURLRequestProperties *urlRequestProperties;

  urlRequestProperties = self->_urlRequestProperties;
  if (!urlRequestProperties)
  {
    urlRequestProperties = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    self->_urlRequestProperties = urlRequestProperties;
  }
  -[SSMutableURLRequestProperties setURLBagKey:](urlRequestProperties, "setURLBagKey:", a3);
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)structuredPageType
{
  return self->_structuredPageType;
}

- (void)setStructuredPageType:(int64_t)a3
{
  self->_structuredPageType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (SSURLRequestProperties)URLRequestProperties
{
  return self->_urlRequestProperties;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
