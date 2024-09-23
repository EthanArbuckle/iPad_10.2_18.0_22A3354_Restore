@implementation ISStoreVersion

- (ISStoreVersion)initWithDictionary:(id)a3
{
  ISStoreVersion *v4;
  uint64_t v5;

  v4 = -[ISStoreVersion init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "objectForKey:", CFSTR("redirect-url"));
    if (v5)
      v4->_redirectURL = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_redirectURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISStoreVersion;
  -[ISStoreVersion dealloc](&v3, sel_dealloc);
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
