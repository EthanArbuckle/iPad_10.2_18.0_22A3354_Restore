@implementation RBSAssertionDescriptor

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSAssertionDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  RBSAssertionDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explanation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("attributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (RBSAssertionDescriptor *)-[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:](self, v9, v8, v5, v7);
  return v10;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  NSString *explanation;
  RBSAssertionIdentifier *identifier;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  explanation = self->_explanation;
  identifier = self->_identifier;
  -[RBSTarget shortDescription](self->_target, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", CFSTR(",\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| \"%@\" ID:%@ target:%@ attributes:[\n\t%@\n\t]>"), v4, explanation, identifier, v7, v8);

  return (NSString *)v9;
}

- (void)setTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RBSAssertionDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[RBSAssertionDescriptor target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("target"));

  -[RBSAssertionDescriptor explanation](self, "explanation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("explanation"));

  -[RBSAssertionDescriptor attributes](self, "attributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("attributes"));

}

- (NSArray)attributes
{
  return self->_attributes;
}

- (RBSTarget)target
{
  return self->_target;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (id)copyWithIdentifier:(id)a3
{
  +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:](RBSAssertionDescriptor, "descriptorWithIdentifier:target:explanation:attributes:", a3, self->_target, self->_explanation, self->_attributes);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (RBSAssertionDescriptor)descriptorWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RBSAssertionDescriptor _initWithIdentifier:target:explanation:attributes:]([RBSAssertionDescriptor alloc], v12, v11, v10, v9);

  return (RBSAssertionDescriptor *)v13;
}

- (_QWORD)_initWithIdentifier:(void *)a3 target:(void *)a4 explanation:(void *)a5 attributes:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)RBSAssertionDescriptor;
    a1 = objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      v13 = objc_msgSend(v9, "copy");
      v14 = (void *)a1[1];
      a1[1] = v13;

      v15 = objc_msgSend(v10, "copy");
      v16 = (void *)a1[2];
      a1[2] = v15;

      v17 = objc_msgSend(v11, "copy");
      v18 = (void *)a1[3];
      a1[3] = v17;

      v19 = objc_msgSend(v12, "copy");
      v20 = (void *)a1[4];
      a1[4] = v19;

    }
  }

  return a1;
}

- (NSString)description
{
  id v3;
  void *v4;
  NSString *explanation;
  RBSAssertionIdentifier *identifier;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  explanation = self->_explanation;
  identifier = self->_identifier;
  -[RBSTarget shortDescription](self->_target, "shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| \"%@\" ID:%@ target:%@>"), v4, explanation, identifier, v7);

  return (NSString *)v8;
}

- (RBSAssertionDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertionDescriptor.m"), 39, CFSTR("-init is not allowed on RBSAssertionDescriptor"));

  return 0;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[RBSAssertionIdentifier hash](self->_identifier, "hash");
  v4 = -[RBSTarget hash](self->_target, "hash") ^ v3;
  v5 = -[NSString hash](self->_explanation, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_attributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RBSAssertionDescriptor *v4;
  uint64_t v5;
  BOOL v6;
  RBSAssertionIdentifier *identifier;
  RBSTarget *target;
  NSString *explanation;
  NSArray *attributes;

  v4 = (RBSAssertionDescriptor *)a3;
  v6 = 1;
  if (self != v4)
  {
    if ((v5 = objc_opt_class(), v5 != objc_opt_class())
      || (identifier = self->_identifier, identifier != v4->_identifier)
      && !-[RBSAssertionIdentifier isEqual:](identifier, "isEqual:")
      || (target = self->_target, target != v4->_target) && !-[RBSTarget isEqual:](target, "isEqual:")
      || (explanation = self->_explanation, explanation != v4->_explanation)
      && !-[NSString isEqualToString:](explanation, "isEqualToString:")
      || (attributes = self->_attributes, attributes != v4->_attributes)
      && !-[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
