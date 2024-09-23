@implementation SUProtocolButton

- (SUProtocolButton)init
{
  return -[SUProtocolButton initWithButtonDictionary:](self, "initWithButtonDictionary:", 0);
}

- (SUProtocolButton)initWithButtonDictionary:(id)a3
{
  SUProtocolButton *v5;
  objc_super v7;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUProtocolButton.m"), 37, CFSTR("Must provide button dictionary"));
  v7.receiver = self;
  v7.super_class = (Class)SUProtocolButton;
  v5 = -[SUProtocolButton init](&v7, sel_init);
  if (v5)
  {
    v5->_buttonDictionary = (NSDictionary *)objc_msgSend(a3, "copy");
    if (!-[SUProtocolButton buttonTitle](v5, "buttonTitle") || !-[SUProtocolButton URL](v5, "URL"))
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
  v3.super_class = (Class)SUProtocolButton;
  -[SUProtocolButton dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSDictionary copyWithZone:](self->_buttonDictionary, "copyWithZone:", a3);
  return v5;
}

- (NSString)buttonLocation
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_buttonDictionary, "objectForKey:", CFSTR("location"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return (NSString *)CFSTR("left");
}

- (NSString)buttonTarget
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_buttonDictionary, "objectForKey:", CFSTR("target"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return (NSString *)CFSTR("new");
}

- (NSString)buttonTitle
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_buttonDictionary, "objectForKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSURL)URL
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_buttonDictionary, "objectForKey:", CFSTR("url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  else
    return 0;
}

- (NSDictionary)buttonDictionary
{
  return self->_buttonDictionary;
}

@end
