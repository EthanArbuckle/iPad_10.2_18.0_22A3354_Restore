@implementation _UICompoundObjectMapKey

- (unint64_t)hash
{
  id object;

  object = self->_object;
  return (unint64_t)object + -[NSString hash](self->_property, "hash");
}

- (BOOL)isEqual:(id)a3
{
  return self->_object == (id)*((_QWORD *)a3 + 1)
      && -[NSString isEqualToString:](self->_property, "isEqualToString:", *((_QWORD *)a3 + 2));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong(&self->_object, 0);
}

+ (id)keyWithObject:(id)a3 andProperty:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", self->_object);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, self->_property);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
