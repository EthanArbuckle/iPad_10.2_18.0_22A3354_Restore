@implementation TUISnap

- (BOOL)isEqual:(id)a3
{
  TUISnap *v4;
  uint64_t v5;
  TUISnap *v6;
  unsigned __int8 v7;
  BOOL v8;

  v4 = (TUISnap *)a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(self))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6 == self;
  if (v6)
    v8 = v6 == self;
  else
    v8 = 1;
  if (!v8)
    v7 = -[NSArray isEqualToArray:](self->_values, "isEqualToArray:", v6->_values);

  return v7;
}

- (TUISnap)initWithValue:(double)a3
{
  TUISnap *v4;
  _TUISnapValue *v5;
  uint64_t v6;
  NSArray *values;
  objc_super v9;
  _TUISnapValue *v10;

  v9.receiver = self;
  v9.super_class = (Class)TUISnap;
  v4 = -[TUISnap init](&v9, "init");
  if (v4)
  {
    v5 = -[_TUISnapValue initWithValue:]([_TUISnapValue alloc], "initWithValue:", a3);
    v10 = v5;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    values = v4->_values;
    v4->_values = (NSArray *)v6;

  }
  return v4;
}

- (TUISnap)initWithValues:(id)a3
{
  id v5;
  TUISnap *v6;
  TUISnap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISnap;
  v6 = -[TUISnap init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_values, a3);

  return v7;
}

- (id)description
{
  NSMutableString *v3;
  NSArray *values;
  NSMutableString *v5;
  _QWORD v7[4];
  NSMutableString *v8;

  v3 = objc_opt_new(NSMutableString);
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("["));
  values = self->_values;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_78948;
  v7[3] = &unk_23FE30;
  v5 = v3;
  v8 = v5;
  -[NSArray enumerateObjectsUsingBlock:](values, "enumerateObjectsUsingBlock:", v7);
  -[NSMutableString appendString:](v5, "appendString:", CFSTR("]"));

  return v5;
}

- (id)snapByAddingValue:(double)a3
{
  NSArray *values;
  _TUISnapValue *v4;
  void *v5;
  TUISnap *v6;

  values = self->_values;
  v4 = -[_TUISnapValue initWithValue:]([_TUISnapValue alloc], "initWithValue:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](values, "arrayByAddingObject:", v4));

  v6 = -[TUISnap initWithValues:]([TUISnap alloc], "initWithValues:", v5);
  return v6;
}

- (TUISnap)snapWithIdentifier:(id)a3
{
  NSArray *values;
  id v5;
  void *v6;
  void *v7;
  id v8;
  TUISnap *v9;

  values = self->_values;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](values, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueWithIdentifier:", v5));

  v8 = -[NSArray mutableCopy](self->_values, "mutableCopy");
  objc_msgSend(v8, "removeLastObject");
  objc_msgSend(v8, "addObject:", v7);
  v9 = -[TUISnap initWithValues:]([TUISnap alloc], "initWithValues:", v8);

  return v9;
}

- (TUISnap)snapWithStep:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  TUISnap *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_values, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueWithStep:", a3));

  v7 = -[NSArray mutableCopy](self->_values, "mutableCopy");
  objc_msgSend(v7, "removeLastObject");
  objc_msgSend(v7, "addObject:", v6);
  v8 = -[TUISnap initWithValues:]([TUISnap alloc], "initWithValues:", v7);

  return v8;
}

- (TUISnap)snapWithMax:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  TUISnap *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_values, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueWithMax:", a3));

  v7 = -[NSArray mutableCopy](self->_values, "mutableCopy");
  objc_msgSend(v7, "removeLastObject");
  objc_msgSend(v7, "addObject:", v6);
  v8 = -[TUISnap initWithValues:]([TUISnap alloc], "initWithValues:", v7);

  return v8;
}

- (id)_valueForValue:(double)a3
{
  NSArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_values;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {

LABEL_14:
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_values, "firstObject", (_QWORD)v15));
    return v8;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  while (2)
  {
    v10 = 0;
    v11 = v8;
    do
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
      objc_msgSend(v12, "value", (_QWORD)v15);
      if (v13 > a3)
      {
        v8 = v11;
        goto LABEL_11;
      }
      v8 = v12;

      v10 = (char *)v10 + 1;
      v11 = v8;
    }
    while (v7 != v10);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
      continue;
    break;
  }
LABEL_11:

  if (!v8)
    goto LABEL_14;
  return v8;
}

- (double)valueForValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUISnap _valueForValue:](self, "_valueForValue:"));
  objc_msgSend(v4, "valueForStep:", objc_msgSend(v4, "stepForValue:", a3));
  v6 = v5;

  return v6;
}

- (id)identifierForValue:(double)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUISnap _valueForValue:](self, "_valueForValue:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  return v4;
}

- (unint64_t)stepForValue:(double)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUISnap _valueForValue:](self, "_valueForValue:"));
  v5 = objc_msgSend(v4, "stepForValue:", a3);

  return (unint64_t)v5;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
