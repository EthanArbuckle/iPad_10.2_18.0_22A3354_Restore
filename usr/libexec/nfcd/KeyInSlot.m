@implementation KeyInSlot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KeyInSlot)initWithCoder:(id)a3
{
  id v4;
  KeyInSlot *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSString *keyIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KeyInSlot;
  v5 = -[NFTrustObject initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v6 = sub_10002FC84();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("keyUniqueIdentifier")));
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_numQuery = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("numQuery"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numQuery;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyUniqueIdentifier"));
    numQuery = self->_numQuery;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("keyUniqueIdentifier"));
    numQuery = 0;
  }
  objc_msgSend(a3, "encodeInteger:forKey:", numQuery, CFSTR("numQuery"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
