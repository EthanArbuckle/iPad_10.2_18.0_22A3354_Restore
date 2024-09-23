@implementation PKISO18013DataElements

- (PKISO18013DataElements)initWithElements:(id)a3
{
  id v5;
  PKISO18013DataElements *v6;
  PKISO18013DataElements *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKISO18013DataElements;
  v6 = -[PKISO18013DataElements init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elements, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKISO18013DataElements)initWithCoder:(id)a3
{
  id v4;
  PKISO18013DataElements *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *elements;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKISO18013DataElements;
  v5 = -[PKISO18013DataElements init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("elements"));
    v11 = objc_claimAutoreleasedReturnValue();
    elements = v5->_elements;
    v5->_elements = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_elements, CFSTR("elements"));
}

- (NSDictionary)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
