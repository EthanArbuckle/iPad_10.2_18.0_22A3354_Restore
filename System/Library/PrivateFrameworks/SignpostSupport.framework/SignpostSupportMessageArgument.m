@implementation SignpostSupportMessageArgument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentObject, 0);
}

- (unsigned)type
{
  return self->_type;
}

- (NSObject)argumentObject
{
  return self->_argumentObject;
}

- (SignpostSupportMessageArgument)initWithArgumentObject:(id)a3 privacy:(id)a4
{
  id v7;
  id v8;
  SignpostSupportMessageArgument *v9;
  SignpostSupportMessageArgument *v10;
  id v11;
  void *v12;
  unint64_t v13;
  unsigned __int8 v14;
  char v15;
  SignpostSupportMessageArgument *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SignpostSupportMessageArgument;
  v9 = -[SignpostSupportMessageArgument init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_argumentObject, a3);
    v11 = v8;
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "unsignedLongLongValue");
      if (v13 <= 2)
        v14 = v13 + 1;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }

    v10->_privacyLevel = v14;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = 0;
            goto LABEL_17;
          }
          v15 = 2;
        }
      }
    }
    else
    {
      v15 = 0;
    }
    v10->_type = v15;
  }
  v16 = v10;
LABEL_17:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SignpostSupportMessageArgument *v5;
  SignpostSupportMessageArgument *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = (SignpostSupportMessageArgument *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SignpostSupportMessageArgument argumentObject](self, "argumentObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[SignpostSupportMessageArgument argumentObject](v6, "argumentObject"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SignpostSupportMessageArgument argumentObject](self, "argumentObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportMessageArgument argumentObject](v6, "argumentObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          v12 = 1;
        }
        else
        {
          -[SignpostSupportMessageArgument argumentObject](self, "argumentObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostSupportMessageArgument argumentObject](v6, "argumentObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
        if (v7)
          goto LABEL_14;
      }
      else
      {
        v12 = 1;
      }

LABEL_14:
      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (unsigned)privacyLevel
{
  return self->_privacyLevel;
}

@end
