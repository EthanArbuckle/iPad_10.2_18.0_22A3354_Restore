@implementation VIObjectKnowledgeProperty

- (VIObjectKnowledgeProperty)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  VIObjectKnowledgeProperty *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VIObjectKnowledgeProperty;
  v8 = -[VIObjectKnowledgeProperty init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  VIObjectKnowledgeProperty *v4;
  VIObjectKnowledgeProperty *v5;
  VIObjectKnowledgeProperty *v6;
  void *v7;
  void *v8;
  char IsEqual;

  v4 = (VIObjectKnowledgeProperty *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    -[VIObjectKnowledgeProperty name](v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)v7, (uint64_t)self->_name))
    {
      -[VIObjectKnowledgeProperty value](v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      IsEqual = VIObjectIsEqual((unint64_t)v8, (uint64_t)self->_value);

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
