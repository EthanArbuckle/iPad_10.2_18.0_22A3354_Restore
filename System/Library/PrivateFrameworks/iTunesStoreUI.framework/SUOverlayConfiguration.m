@implementation SUOverlayConfiguration

- (SUOverlayConfiguration)init
{
  return -[SUOverlayConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUOverlayConfiguration)initWithDictionary:(id)a3
{
  SUOverlayConfiguration *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUOverlayConfiguration.m"), 42, CFSTR("Must have a dictionary"));
  v14.receiver = self;
  v14.super_class = (Class)SUOverlayConfiguration;
  v5 = -[SUOverlayConfiguration init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a3, "objectForKey:", CFSTR("bag-key-pattern"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_bagKeyPattern = (NSRegularExpression *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v6, 1, 0);
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("corner-radius"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_cornerRadius = (int)objc_msgSend(v7, "intValue");
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("height"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_size.height = (double)(int)objc_msgSend(v8, "intValue");
    v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("show-navigation-bar"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_shouldShowNavigationBar = objc_msgSend(v9, "BOOLValue");
    v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("transition"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_transitionName = (NSString *)v10;
    v11 = objc_msgSend(a3, "objectForKey:", CFSTR("url-pattern"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_urlPattern = (NSRegularExpression *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v11, 1, 0);
    v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("width"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_size.width = (double)(int)objc_msgSend(v12, "intValue");
    if (!v5->_bagKeyPattern && !v5->_urlPattern)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUOverlayConfiguration;
  -[SUOverlayConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)matchesURL:(id)a3
{
  void *v4;

  if (!self->_urlPattern)
    return 0;
  v4 = (void *)objc_msgSend(a3, "absoluteString");
  return -[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_urlPattern, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)matchesURLBagKey:(id)a3
{
  NSRegularExpression *bagKeyPattern;

  bagKeyPattern = self->_bagKeyPattern;
  return bagKeyPattern
      && -[NSRegularExpression rangeOfFirstMatchInString:options:range:](bagKeyPattern, "rangeOfFirstMatchInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)shouldShowNavigationBar
{
  return self->_shouldShowNavigationBar;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)transitionName
{
  return self->_transitionName;
}

@end
