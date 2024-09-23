@implementation _UIStatusBarIdentifier

+ (id)identifierForObject:(id)a3 string:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _UIStatusBarIdentifier *v12;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  v8 = &stru_1E16EDF20;
  if (v6)
    v8 = v6;
  v9 = v8;
  objc_getAssociatedObject(v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, 0, v11, (void *)1);
LABEL_7:
    v12 = objc_alloc_init(_UIStatusBarIdentifier);
    -[_UIStatusBarIdentifier setObject:](v12, "setObject:", v5);
    -[_UIStatusBarIdentifier setString:](v12, "setString:", v7);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v9);
    goto LABEL_8;
  }
  v11 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v12 = (_UIStatusBarIdentifier *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_7;
LABEL_8:

  return v12;
}

+ (id)uninternedIdentifierForObject:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  _UIStatusBarIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_UIStatusBarIdentifier);
  -[_UIStatusBarIdentifier setObject:](v7, "setObject:", v6);

  -[_UIStatusBarIdentifier setString:](v7, "setString:", v5);
  return v7;
}

- (id)description
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIStatusBarIdentifier stringRepresentation](self, "stringRepresentation");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromSelector(sel_object);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    NSStringFromSelector(sel_string);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong(&self->_object, 0);
}

+ (id)displayIdentifierFromStringRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  Class v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
    v7 = 0;
  }
  else
  {
    v8 = v4;
    v9 = v5;
    objc_msgSend(v3, "substringToIndex:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringFromIndex:", v8 + v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("/"));
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    v14 = (NSString *)v10;
  }
  else
  {
    v15 = v11;
    v16 = v12;
    objc_msgSend(v10, "substringToIndex:", v11);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "substringFromIndex:", v15 + v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = NSClassFromString(v14);
  if (v17)
  {
    +[_UIStatusBarIdentifier identifierForObject:string:](_UIStatusBarIdentifier, "identifierForObject:string:", v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarIdentifier identifierForObject:string:](_UIStatusBarIdentifier, "identifierForObject:string:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)stringRepresentation
{
  char isKindOfClass;
  id object;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  object = self->_object;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = object;
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)objc_msgSend(v5, "object"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/%@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSStringFromClass((Class)objc_msgSend(v5, "object"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[NSString length](self->_string, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v11, self->_string);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v11;
    }
    v12 = v13;

  }
  else
  {
    NSStringFromClass((Class)object);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v12;
}

@end
