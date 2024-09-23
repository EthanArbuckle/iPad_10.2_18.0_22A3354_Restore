@implementation SSBagKey

- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4
{
  return -[SSBagKey initWithStringRepresentation:valueType:defaultValue:](self, "initWithStringRepresentation:valueType:defaultValue:", a3, a4, 0);
}

- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  SSBagKey *v10;
  SSBagKey *v11;
  uint64_t v12;
  NSArray *stringRepresentation;
  id v15;

  v8 = a3;
  v9 = a5;
  if (v9 && !SSBagValueTypeIsPrimitive(a4))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Default values are only supported for primitive types."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v10 = -[SSBagKey init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultValue, a5);
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
    v12 = objc_claimAutoreleasedReturnValue();
    stringRepresentation = v11->_stringRepresentation;
    v11->_stringRepresentation = (NSArray *)v12;

    v11->_valueType = a4;
  }

  return v11;
}

- (id)valueFromDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  id v15;

  v4 = a3;
  -[SSBagKey stringRepresentation](self, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[SSBagKey stringRepresentation](self, "stringRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_9:
        v15 = 0;
        goto LABEL_11;
      }
      -[SSBagKey stringRepresentation](self, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") - 1;

      if (v7 == v12)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;

      ++v7;
      -[SSBagKey stringRepresentation](self, "stringRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      v4 = v10;
      if (v7 >= v14)
      {
        v15 = 0;
        v4 = v10;
        goto LABEL_12;
      }
    }
    v15 = v10;
LABEL_11:

  }
  else
  {
    v15 = 0;
  }
LABEL_12:

  return v15;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (NSArray)stringRepresentation
{
  return self->_stringRepresentation;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
