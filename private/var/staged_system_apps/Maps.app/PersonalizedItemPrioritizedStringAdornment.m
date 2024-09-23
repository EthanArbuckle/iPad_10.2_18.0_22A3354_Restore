@implementation PersonalizedItemPrioritizedStringAdornment

+ (id)defaultAdornment
{
  if (qword_1014D3E10 != -1)
    dispatch_once(&qword_1014D3E10, &stru_1011E11D0);
  return (id)qword_1014D3E08;
}

- (id)combineAdornment:(id)a3
{
  PersonalizedItemPrioritizedStringAdornment *v4;
  unint64_t v5;
  unint64_t v6;
  PersonalizedItemPrioritizedStringAdornment *v7;
  id v8;
  void *v9;
  id v10;
  PersonalizedItemPrioritizedStringAdornment *v11;

  v4 = (PersonalizedItemPrioritizedStringAdornment *)a3;
  v5 = -[PersonalizedItemPrioritizedStringAdornment priority](v4, "priority");
  v6 = -[PersonalizedItemPrioritizedStringAdornment priority](self, "priority");
  v7 = v4;
  if (v5 <= v6)
  {
    v8 = -[PersonalizedItemPrioritizedStringAdornment priority](v4, "priority");
    if (v8 == (id)-[PersonalizedItemPrioritizedStringAdornment priority](self, "priority"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemPrioritizedStringAdornment value](self, "value"));
      v10 = objc_msgSend(v9, "length");

      if (v10)
        v7 = self;
      else
        v7 = v4;
    }
    else
    {
      v7 = self;
    }
  }
  v11 = v7;

  return v11;
}

+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithString:locale:priority:", v9, v8, a5);

  return (PersonalizedItemPrioritizedStringAdornment *)v10;
}

+ (PersonalizedItemPrioritizedStringAdornment)adornmentWithString:(id)a3 priority:(unint64_t)a4
{
  return (PersonalizedItemPrioritizedStringAdornment *)_objc_msgSend(a1, "adornmentWithString:locale:priority:", a3, 0, a4);
}

- (PersonalizedItemPrioritizedStringAdornment)initWithString:(id)a3 locale:(id)a4 priority:(unint64_t)a5
{
  id v9;
  id v10;
  PersonalizedItemPrioritizedStringAdornment *v11;
  PersonalizedItemPrioritizedStringAdornment *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PersonalizedItemPrioritizedStringAdornment;
  v11 = -[PersonalizedItemPrioritizedStringAdornment init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_value, a3);
    objc_storeStrong((id *)&v12->_locale, a4);
    v12->_priority = a5;
  }

  return v12;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)locale
{
  return self->_locale;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
