@implementation _RESymbolDefinition

- (_RESymbolDefinition)initWithToken:(id)a3 type:(unint64_t)a4 options:(id)a5
{
  id v9;
  id v10;
  _RESymbolDefinition *v11;
  _RESymbolDefinition *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_RESymbolDefinition;
  v11 = -[_RESymbolDefinition init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_token, a3);
    v12->_type = a4;
    if (v10)
      v13 = v10;
    else
      v13 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v12->_options, v13);
  }

  return v12;
}

- (NSString)name
{
  return -[REScriptToken value](self->_token, "value");
}

- (unint64_t)type
{
  return self->_type;
}

- (REScriptToken)token
{
  return self->_token;
}

- (NSDictionary)options
{
  return self->_options;
}

- (REScriptASTNode)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (id)objectValue
{
  return self->_objectValue;
}

- (void)setObjectValue:(id)a3
{
  objc_storeStrong(&self->_objectValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
