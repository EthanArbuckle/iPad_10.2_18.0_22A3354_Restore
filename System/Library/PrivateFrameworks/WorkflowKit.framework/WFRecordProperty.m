@implementation WFRecordProperty

- (WFRecordProperty)initWithName:(id)a3 property:(objc_property *)a4
{
  id v7;
  WFRecordProperty *v8;
  WFRecordProperty *v9;
  id *p_name;
  objc_property_attribute_t *v11;
  objc_property_attribute_t *v12;
  unint64_t v13;
  const char **p_value;
  int v15;
  uint64_t v16;
  NSString *getter;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *setter;
  WFRecordProperty *v27;
  unsigned int outCount;
  objc_super v30;

  v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFRecordProperty;
  v8 = -[WFRecordProperty init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    p_name = (id *)&v8->_name;
    objc_storeStrong((id *)&v8->_name, a3);
    outCount = 0;
    v11 = property_copyAttributeList(a4, &outCount);
    v12 = v11;
    if (outCount)
    {
      v13 = 0;
      p_value = &v11->value;
      do
      {
        v15 = **(p_value - 1);
        if (v15 <= 77)
        {
          if (v15 == 68)
          {
            v9->_dynamic = 1;
            goto LABEL_16;
          }
          if (v15 == 71)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *p_value);
            v16 = objc_claimAutoreleasedReturnValue();
            getter = v9->_getter;
            v9->_getter = (NSString *)v16;
LABEL_14:

          }
        }
        else
        {
          if (v15 != 78)
          {
            if (v15 != 83)
            {
              if (v15 == 82)
                v9->_readOnly = 1;
              goto LABEL_16;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *p_value);
            v18 = objc_claimAutoreleasedReturnValue();
            getter = v9->_setter;
            v9->_setter = (NSString *)v18;
            goto LABEL_14;
          }
          v9->_nonAtomic = 1;
        }
LABEL_16:
        ++v13;
        p_value += 2;
      }
      while (v13 < outCount);
    }
    free(v12);
    if (!v9->_getter)
      objc_storeStrong((id *)&v9->_getter, *p_name);
    if (!v9->_setter && !v9->_readOnly)
    {
      v19 = objc_msgSend(*p_name, "characterAtIndex:", 0) - 97;
      objc_msgSend(*p_name, "substringToIndex:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 <= 0x19)
      {
        objc_msgSend(v20, "uppercaseString");
        v22 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v22;
      }
      v23 = (void *)MEMORY[0x1E0CB3940];
      -[NSString substringFromIndex:](v9->_name, "substringFromIndex:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("set%@%@:"), v21, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      setter = v9->_setter;
      v9->_setter = (NSString *)v25;

    }
    v27 = v9;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (BOOL)isNonAtomic
{
  return self->_nonAtomic;
}

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (NSString)getter
{
  return self->_getter;
}

- (NSString)setter
{
  return self->_setter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setter, 0);
  objc_storeStrong((id *)&self->_getter, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
