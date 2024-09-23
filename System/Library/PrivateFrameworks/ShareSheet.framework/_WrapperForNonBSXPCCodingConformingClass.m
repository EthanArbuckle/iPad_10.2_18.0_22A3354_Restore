@implementation _WrapperForNonBSXPCCodingConformingClass

- (_WrapperForNonBSXPCCodingConformingClass)initWithObject:(id)a3
{
  NSObject *v4;
  _WrapperForNonBSXPCCodingConformingClass *v5;
  NSObject *object;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_WrapperForNonBSXPCCodingConformingClass;
  v5 = -[_WrapperForNonBSXPCCodingConformingClass init](&v8, sel_init);
  object = v5->_object;
  v5->_object = v4;

  return v5;
}

- (_WrapperForNonBSXPCCodingConformingClass)initWithBSXPCCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  _WrapperForNonBSXPCCodingConformingClass *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString(v5), CFSTR("wrappedObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_WrapperForNonBSXPCCodingConformingClass initWithObject:](self, "initWithObject:", v6);
  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_WrapperForNonBSXPCCodingConformingClass object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("className"));

  -[_WrapperForNonBSXPCCodingConformingClass object](self, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("wrappedObject"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSObject)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
