@implementation PKPhysicalCardOrder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardOrder)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCardOrder *v5;
  uint64_t v6;
  NSString *nameOnCard;
  uint64_t v8;
  NSString *artworkIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicalCardOrder;
  v5 = -[PKPhysicalCardOrder init](&v11, sel_init);
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameOnCard, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkIdentifier, CFSTR("artworkIdentifier"));

}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
}

@end
