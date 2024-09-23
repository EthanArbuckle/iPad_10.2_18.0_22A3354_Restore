@implementation WebFeature

- (WebFeature)initWithKey:(id)a3 preferenceKey:(id)a4 name:(id)a5 status:(unint64_t)a6 category:(unint64_t)a7 details:(id)a8 defaultValue:(BOOL)a9 hidden:(BOOL)a10
{
  WebFeature *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WebFeature;
  v16 = -[WebFeature init](&v18, sel_init);
  if (v16)
  {
    v16->_key = (NSString *)objc_msgSend(a3, "copy");
    v16->_preferenceKey = (NSString *)objc_msgSend(a4, "copy");
    v16->_name = (NSString *)objc_msgSend(a5, "copy");
    v16->_status = a6;
    v16->_category = a7;
    v16->_details = (NSString *)objc_msgSend(a8, "copy");
    v16->_defaultValue = a9;
    v16->_hidden = a10;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebFeature;
  -[WebFeature dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[WebFeature name](self, "name");
  v7 = -[WebFeature key](self, "key");
  v8 = -[WebFeature defaultValue](self, "defaultValue");
  v9 = CFSTR("off");
  if (v8)
    v9 = CFSTR("on");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = %@; key = %@; defaultValue = %@>"),
               v5,
               self,
               v6,
               v7,
               v9);
}

- (NSString)key
{
  return self->_key;
}

- (NSString)preferenceKey
{
  return self->_preferenceKey;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)status
{
  return self->_status;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)details
{
  return self->_details;
}

- (BOOL)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

@end
