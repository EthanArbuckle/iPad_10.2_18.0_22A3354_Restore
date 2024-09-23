@implementation WBSPasswordCharacterClass

+ (id)customCharacterClassWithValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:value:", 6, v4);

  return v5;
}

+ (id)namedCharacterClassWithType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:value:", a3, &stru_1E64A2498);
}

+ (id)asciiPrintableCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 0);
}

+ (id)digitCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 1);
}

+ (id)lowercaseCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 2);
}

+ (id)uppercaseCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 3);
}

+ (id)specialCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 4);
}

+ (id)unicodeCharacterClass
{
  return (id)objc_msgSend(a1, "namedCharacterClassWithType:", 5);
}

- (WBSPasswordCharacterClass)initWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  WBSPasswordCharacterClass *v7;
  WBSPasswordCharacterClass *v8;
  uint64_t v9;
  NSString *value;
  WBSPasswordCharacterClass *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordCharacterClass;
  v7 = -[WBSPasswordCharacterClass init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t type;

  type = self->_type;
  return -[NSString hash](self->_value, "hash") ^ type;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordCharacterClass *v4;
  NSString *v5;
  int64_t type;
  char v7;

  v4 = (WBSPasswordCharacterClass *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBSPasswordCharacterClass value](v4, "value");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      type = self->_type;
      if (type == -[WBSPasswordCharacterClass type](v4, "type"))
      {
        if (v5 == self->_value)
          v7 = 1;
        else
          v7 = -[NSString isEqualToString:](v5, "isEqualToString:");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
