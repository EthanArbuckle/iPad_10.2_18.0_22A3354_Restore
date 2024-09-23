@implementation ISAMSBagShim

- (ISAMSBagShim)initWithBag:(id)a3
{
  id v5;
  ISAMSBagShim *v6;
  ISAMSBagShim *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAMSBagShim;
  v6 = -[ISAMSBagShim init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    if (v5)
      v7->_type = 1;
  }

  return v7;
}

- (ISAMSBagShim)initWithURLBag:(id)a3
{
  id v5;
  ISAMSBagShim *v6;
  ISAMSBagShim *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISAMSBagShim;
  v6 = -[ISAMSBagShim init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URLBag, a3);
    if (v5)
      v7->_type = 2;
  }

  return v7;
}

- (NSDate)expirationDate
{
  return 0;
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)CFSTR("ISAMSBagShim");
}

- (NSString)profileVersion
{
  return (NSString *)CFSTR("1");
}

- (id)URLForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 5);
}

- (id)arrayForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 0);
}

- (id)BOOLForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 1);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  AMSError();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

}

- (id)dictionaryForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 6);
}

- (id)doubleForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 2);
}

- (id)integerForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 3);
}

- (id)stringForKey:(id)a3
{
  return -[ISAMSBagShim _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 4);
}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a3;
  -[ISAMSBagShim bag](self, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    switch(a4)
    {
      case 0uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v8, "arrayForKey:error:", v6, &v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v25;
        break;
      case 1uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        objc_msgSend(v8, "BOOLForKey:error:", v6, &v24);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v24;
        break;
      case 2uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v8, "doubleForKey:error:", v6, &v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v23;
        break;
      case 3uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        objc_msgSend(v8, "integerForKey:error:", v6, &v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v22;
        break;
      case 4uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v8, "stringForKey:error:", v6, &v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v21;
        break;
      case 5uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        objc_msgSend(v8, "URLForKey:error:", v6, &v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v20;
        break;
      case 6uLL:
        -[ISAMSBagShim bag](self, "bag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        objc_msgSend(v8, "dictionaryForKey:error:", v6, &v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v19;
        break;
      default:
        v13 = 0;
        v9 = 0;
        goto LABEL_11;
    }
    v14 = v10;

  }
  else
  {
    -[ISAMSBagShim URLBag](self, "URLBag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v13 = 0;
LABEL_11:
      v14 = 0;
      goto LABEL_22;
    }
    -[ISAMSBagShim URLBag](self, "URLBag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4 == 5)
      objc_msgSend(v11, "urlForKey:", v6);
    else
      objc_msgSend(v11, "valueForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  v13 = v9 != 0;
  if (!v14 && v9)
  {
    objc_msgSend(MEMORY[0x24BE08070], "frozenBagValueWithKey:value:valueType:", v6, v9, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_26;
  }
LABEL_22:
  if (!v14 && !v13)
  {
    v17 = v6;
    v18 = -[ISAMSBagShim type](self, "type");
    AMSErrorWithFormat();
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BE08070], "failingBagValueWithKey:valueType:error:", v6, a4, v14, v17, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v15;
}

- (SSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (ISURLBag)URLBag
{
  return self->_URLBag;
}

- (void)setURLBag:(id)a3
{
  objc_storeStrong((id *)&self->_URLBag, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLBag, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
