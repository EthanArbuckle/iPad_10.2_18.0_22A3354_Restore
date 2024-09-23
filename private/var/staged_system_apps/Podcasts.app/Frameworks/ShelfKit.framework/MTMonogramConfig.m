@implementation MTMonogramConfig

+ (id)monogramWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithURL:", v4);

  return v6;
}

- (MTMonogramConfig)initWithURL:(id)a3
{
  id v4;
  MTMonogramConfig *v5;
  MTMonogramConfig *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  MTMonogramConfig *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MTMonogramConfig;
  v5 = -[MTMonogramConfig init](&v21, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig initalsFromURL:](v5, "initalsFromURL:", v4));
  if (v7)
  {
    -[MTMonogramConfig setValue:](v6, "setValue:", v7);
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig nameFromURL:](v6, "nameFromURL:", v4));
    -[MTMonogramConfig setValue:](v6, "setValue:", v9);

    v8 = 0;
  }
  -[MTMonogramConfig setType:](v6, "setType:", v8);
  -[MTMonogramConfig widthFromURL:](v6, "widthFromURL:", v4);
  v11 = v10;
  -[MTMonogramConfig heightFromURL:](v6, "heightFromURL:", v4);
  -[MTMonogramConfig setSize:](v6, "setSize:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue(-[MTMonogramConfig value](v6, "value"));
  if (!v13)
    goto LABEL_11;
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig value](v6, "value"));
  if (!objc_msgSend(v15, "length") || (-[MTMonogramConfig size](v6, "size"), v16 <= 0.0))
  {

LABEL_11:
    goto LABEL_12;
  }
  -[MTMonogramConfig size](v6, "size");
  v18 = v17;

  if (v18 <= 0.0)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
LABEL_9:
  v19 = v6;
LABEL_13:

  return v19;
}

- (id)initalsFromURL:(id)a3
{
  return -[MTMonogramConfig valueForKey:fromURL:](self, "valueForKey:fromURL:", CFSTR("initials"), a3);
}

- (id)nameFromURL:(id)a3
{
  return -[MTMonogramConfig valueForKey:fromURL:](self, "valueForKey:fromURL:", CFSTR("name"), a3);
}

- (double)widthFromURL:(id)a3
{
  double result;

  -[MTMonogramConfig floatForKey:fromURL:](self, "floatForKey:fromURL:", CFSTR("width"), a3);
  return result;
}

- (double)heightFromURL:(id)a3
{
  double result;

  -[MTMonogramConfig floatForKey:fromURL:](self, "floatForKey:fromURL:", CFSTR("height"), a3);
  return result;
}

- (double)floatForKey:(id)a3 fromURL:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig valueForKey:fromURL:](self, "valueForKey:fromURL:", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig numberFormatter](self, "numberFormatter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "numberFromString:", v5));
  objc_msgSend(v7, "doubleValue");
  if (v8 == 0.0)
    v9 = 0.0;
  else
    v9 = v8;

  return v9;
}

- (id)valueForKey:(id)a3 fromURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queryItems", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));
  return v17;
}

- (id)numberFormatter
{
  if (numberFormatter_onceToken != -1)
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global_4);
  return (id)numberFormatter_fmt;
}

void __35__MTMonogramConfig_numberFormatter__block_invoke(id a1)
{
  NSNumberFormatter *v1;
  void *v2;

  v1 = objc_opt_new(NSNumberFormatter);
  v2 = (void *)numberFormatter_fmt;
  numberFormatter_fmt = (uint64_t)v1;

}

- (NSString)formattedValue
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MTMonogramConfig type](self, "type"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig value](self, "value"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMonogramConfig value](self, "value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", v4, 0));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v5, 1002));
  }
  return (NSString *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
