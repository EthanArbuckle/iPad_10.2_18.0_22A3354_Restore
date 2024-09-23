@implementation SiriUILegacyCardSection

- (SiriUILegacyCardSection)init
{
  SiriUILegacyCardSection *v2;
  void *v3;
  uint64_t v4;
  NSString *cardSectionIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUILegacyCardSection;
  v2 = -[SiriUILegacyCardSection init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    cardSectionIdentifier = v2->_cardSectionIdentifier;
    v2->_cardSectionIdentifier = (NSString *)v4;

  }
  return v2;
}

- (SiriUILegacyCardSection)initWithCoder:(id)a3
{
  id v4;
  SiriUILegacyCardSection *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *cardSectionIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUILegacyCardSection;
  v5 = -[SiriUILegacyCardSection init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_cardSectionIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    cardSectionIdentifier = v5->_cardSectionIdentifier;
    v5->_cardSectionIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *cardSectionIdentifier;
  id v4;
  id v5;

  cardSectionIdentifier = self->_cardSectionIdentifier;
  v4 = a3;
  NSStringFromSelector(sel_cardSectionIdentifier);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", cardSectionIdentifier, v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCardSectionIdentifier:", self->_cardSectionIdentifier);
  return v4;
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (void)setCardSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionIdentifier, 0);
}

@end
