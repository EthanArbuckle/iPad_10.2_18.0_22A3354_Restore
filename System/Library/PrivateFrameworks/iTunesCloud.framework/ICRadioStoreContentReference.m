@implementation ICRadioStoreContentReference

- (ICRadioStoreContentReference)initWithStoreIdentifier:(id)a3
{
  id v4;
  ICRadioStoreContentReference *v5;
  uint64_t v6;
  NSNumber *storeIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioStoreContentReference;
  v5 = -[ICRadioStoreContentReference init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v6;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICRadioStoreContentReference storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioStoreContentReference: %p adamID=%@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioStoreContentReference rawContentDictionaryWithSubscriptionStatus:](self, "rawContentDictionaryWithSubscriptionStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("store"));
  return v6;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_storeIdentifier, CFSTR("id"));
  if (-[NSString length](self->_containerID, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_containerID, CFSTR("container-id"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICRadioStoreContentReference;
  v5 = -[ICRadioContentReference copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSNumber copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSString copyWithZone:](self->_containerID, "copyWithZone:", a3);
    v9 = (void *)v5[1];
    v5[1] = v8;

  }
  return v5;
}

- (ICRadioStoreContentReference)initWithCoder:(id)a3
{
  id v4;
  ICRadioStoreContentReference *v5;
  uint64_t v6;
  NSNumber *storeIdentifier;
  uint64_t v8;
  NSString *containerID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICRadioStoreContentReference;
  v5 = -[ICRadioContentReference initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerID"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioStoreContentReference;
  v4 = a3;
  -[ICRadioContentReference encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerID, CFSTR("containerID"));

}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
