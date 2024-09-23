@implementation RBSHandshakeRequest

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSSet *assertionDescriptors;
  id v5;

  assertionDescriptors = self->_assertionDescriptors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", assertionDescriptors, CFSTR("_assertionDescriptors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_savedEndowments, CFSTR("_savedEndowments"));

}

- (RBSHandshakeRequest)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSHandshakeRequest *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *assertionDescriptors;
  uint64_t v9;
  uint64_t v10;
  NSArray *savedEndowments;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSHandshakeRequest;
  v5 = -[RBSHandshakeRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("_assertionDescriptors"));
    v7 = objc_claimAutoreleasedReturnValue();
    assertionDescriptors = v5->_assertionDescriptors;
    v5->_assertionDescriptors = (NSSet *)v7;

    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("_savedEndowments"));
    v10 = objc_claimAutoreleasedReturnValue();
    savedEndowments = v5->_savedEndowments;
    v5->_savedEndowments = (NSArray *)v10;

  }
  return v5;
}

- (void)setEuid:(unsigned int)a3
{
  self->_euid = a3;
}

- (NSSet)assertionDescriptors
{
  NSSet *assertionDescriptors;

  assertionDescriptors = self->_assertionDescriptors;
  if (assertionDescriptors)
    return assertionDescriptors;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_assertionDescriptors, 0);
}

- (NSArray)savedEndowments
{
  NSArray *savedEndowments;

  savedEndowments = self->_savedEndowments;
  if (savedEndowments)
    return savedEndowments;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSavedEndowments:(id)a3
{
  objc_storeStrong((id *)&self->_savedEndowments, a3);
}

- (void)setAssertionDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_assertionDescriptors, a3);
}

- (BOOL)isEqual:(id)a3
{
  RBSHandshakeRequest *v4;
  uint64_t v5;
  char v6;
  NSSet *assertionDescriptors;
  NSArray *savedEndowments;
  NSArray *v9;

  v4 = (RBSHandshakeRequest *)a3;
  if (self == v4)
    goto LABEL_10;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || (assertionDescriptors = self->_assertionDescriptors, assertionDescriptors != v4->_assertionDescriptors)
    && !-[NSSet isEqualToSet:](assertionDescriptors, "isEqualToSet:"))
  {
    v6 = 0;
    goto LABEL_11;
  }
  savedEndowments = self->_savedEndowments;
  v9 = v4->_savedEndowments;
  if (savedEndowments == v9)
  {
LABEL_10:
    v6 = 1;
    goto LABEL_11;
  }
  v6 = 0;
  if (savedEndowments && v9)
    v6 = -[NSArray isEqual:](savedEndowments, "isEqual:");
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return -[NSSet hash](self->_assertionDescriptors, "hash");
}

- (unsigned)auid
{
  return self->_auid;
}

- (void)setAuid:(unsigned int)a3
{
  self->_auid = a3;
}

- (unsigned)euid
{
  return self->_euid;
}

@end
