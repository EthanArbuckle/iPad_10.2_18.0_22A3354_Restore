@implementation _UIAbstractBSXPCCodingAdapter

+ (id)adapterWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return v5;
}

- (_UIAbstractBSXPCCodingAdapter)initWithObject:(id)a3
{
  id v5;
  _UIAbstractBSXPCCodingAdapter *v6;
  _UIAbstractBSXPCCodingAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  v6 = -[_UIAbstractBSXPCCodingAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_object, CFSTR("key"));
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3
{
  id v3;

  v3 = a3;
  objc_exception_throw(0);
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 clazz:(Class)a4
{
  id v6;
  _UIAbstractBSXPCCodingAdapter *v7;
  uint64_t v8;
  id object;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  v7 = -[_UIAbstractBSXPCCodingAdapter init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", a4, CFSTR("key"));
    v8 = objc_claimAutoreleasedReturnValue();
    object = v7->_object;
    v7->_object = (id)v8;

  }
  return v7;
}

- (_UIAbstractBSXPCCodingAdapter)initWithBSXPCCoder:(id)a3 collectionOfClass:(Class)a4 containingClass:(Class)a5
{
  id v8;
  _UIAbstractBSXPCCodingAdapter *v9;
  uint64_t v10;
  id object;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIAbstractBSXPCCodingAdapter;
  v9 = -[_UIAbstractBSXPCCodingAdapter init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "decodeCollectionOfClass:containingClass:forKey:", a4, a5, CFSTR("key"));
    v10 = objc_claimAutoreleasedReturnValue();
    object = v9->_object;
    v9->_object = (id)v10;

  }
  return v9;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
