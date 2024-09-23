@implementation UIDescriptionBuilder

+ (UIDescriptionBuilder)descriptionBuilderWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return (UIDescriptionBuilder *)v5;
}

+ (id)descriptionForObject:(id)a3 namesAndObjects:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendNamesAndObjects:", v5);
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)descriptionForObject:(id)a3 keys:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendKeys:", v5);
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIDescriptionBuilder)initWithObject:(id)a3
{
  NSObject *v4;
  UIDescriptionBuilder *v5;
  UIDescriptionBuilder *v6;
  NSMutableString *v7;
  NSMutableString *descriptionString;
  NSString *separator;
  UIDescriptionBuilder *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDescriptionBuilder;
  v5 = -[UIDescriptionBuilder init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_object = v4;
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    descriptionString = v6->_descriptionString;
    v6->_descriptionString = v7;

    -[NSMutableString appendFormat:](v6->_descriptionString, "appendFormat:", CFSTR("<%s: %p"), object_getClassName(v6->_object), v6->_object);
    separator = v6->_separator;
    v6->_separator = (NSString *)CFSTR(":");

    v10 = v6;
  }

  return v6;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", a4, a3);
}

- (id)appendName:(id)a3 object:(id)a4
{
  return -[UIDescriptionBuilder appendName:object:usingLightweightDescription:](self, "appendName:object:usingLightweightDescription:", a3, a4, 0);
}

- (id)appendName:(id)a3 object:(id)a4 usingLightweightDescription:(BOOL)a5
{
  _BOOL4 v5;
  NSMutableString *descriptionString;
  NSString *separator;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;

  v5 = a5;
  descriptionString = self->_descriptionString;
  separator = self->_separator;
  v11 = a4;
  v12 = a3;
  v13 = v12;
  if (a4 && v5)
    -[NSMutableString appendFormat:](descriptionString, "appendFormat:", CFSTR("%@ %@=<%s: %p>"), separator, v12, object_getClassName(v11), v11);
  else
    -[NSMutableString appendFormat:](descriptionString, "appendFormat:", CFSTR("%@ %@=%@"), separator, v12, v11, v15);

  -[UIDescriptionBuilder setSeparator:](self, "setSeparator:", CFSTR(","));
  return self;
}

- (id)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  const __CFString *v5;
  id v6;

  if (a4)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", a3, v5);
  return self;
}

- (id)appendName:(id)a3 integerValue:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 intValue:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 doubleValue:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 pointerValue:(void *)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendName:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIDescriptionBuilder appendName:object:](self, "appendName:object:", v6, v7);

  return self;
}

- (id)appendNamesAndObjects:(id)a3
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__UIDescriptionBuilder_appendNamesAndObjects___block_invoke;
  v5[3] = &unk_1E16B4FF0;
  v5[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
  return self;
}

id __46__UIDescriptionBuilder_appendNamesAndObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendName:object:", a2, a3);
}

- (id)appendKey:(id)a3
{
  id v4;

  v4 = a3;
  -[UIDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", v4);

  return self;
}

- (id)appendKeys:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        -[UIDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return self;
}

- (void)tryAppendKey:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[NSObject valueForKey:](self->_object, "valueForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[UIDescriptionBuilder appendObject:withName:](self, "appendObject:withName:", v4, v6);

}

- (NSString)string
{
  return (NSString *)-[NSMutableString stringByAppendingString:](self->_descriptionString, "stringByAppendingString:", CFSTR(">"));
}

- (NSString)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  self->_object = a3;
}

- (NSMutableString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_separator, 0);
}

@end
