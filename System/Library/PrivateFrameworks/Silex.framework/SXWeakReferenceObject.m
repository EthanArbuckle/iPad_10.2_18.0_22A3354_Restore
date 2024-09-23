@implementation SXWeakReferenceObject

+ (id)withObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", v3);

  return v4;
}

- (SXWeakReferenceObject)initWithObject:(id)a3
{
  id v4;
  SXWeakReferenceObject *v5;
  SXWeakReferenceObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXWeakReferenceObject;
  v5 = -[SXWeakReferenceObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_object, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXWeakReferenceObject object](self, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "object");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v6 = 1;
        goto LABEL_7;
      }
    }
    -[SXWeakReferenceObject object](self, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SXWeakReferenceObject object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SXWeakReferenceObject object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<Weak: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
