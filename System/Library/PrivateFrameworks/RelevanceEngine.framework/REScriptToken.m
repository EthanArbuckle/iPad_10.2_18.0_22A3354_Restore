@implementation REScriptToken

- (REScriptToken)initWithValue:(id)a3 type:(unint64_t)a4 line:(int64_t)a5 column:(int64_t)a6
{
  id v10;
  REScriptToken *v11;
  uint64_t v12;
  NSString *value;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REScriptToken;
  v11 = -[REScriptToken init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    value = v11->_value;
    v11->_value = (NSString *)v12;

    v11->_type = a4;
    v11->_line = a5;
    v11->_column = a6;
  }

  return v11;
}

- (unint64_t)length
{
  return -[NSString length](self->_value, "length");
}

- (unint64_t)hash
{
  return -[NSString hash](self->_value, "hash");
}

- (BOOL)isEqual:(id)a3
{
  REScriptToken *v4;
  REScriptToken *v5;
  REScriptToken *v6;
  NSString *value;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = (REScriptToken *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_type == v5->_type && self->_line == v5->_line && self->_column == v5->_column)
      {
        value = self->_value;
        v8 = v5->_value;
        v9 = value;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSString isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_value);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithValue:type:line:column:", self->_value, self->_type, self->_line, self->_column);
}

- (int64_t)line
{
  return self->_line;
}

- (int64_t)column
{
  return self->_column;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
