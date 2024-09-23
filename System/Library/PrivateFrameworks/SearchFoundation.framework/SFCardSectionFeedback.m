@implementation SFCardSectionFeedback

- (SFCardSectionFeedback)initWithCardSection:(id)a3
{
  id v5;
  SFCardSectionFeedback *v6;
  SFCardSectionFeedback *v7;
  uint64_t v8;
  NSString *cardSectionId;
  uint64_t v10;
  NSString *resultId;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFCardSectionFeedback;
  v6 = -[SFFeedback init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cardSection, a3);
    objc_msgSend(v5, "cardSectionId");
    v8 = objc_claimAutoreleasedReturnValue();
    cardSectionId = v7->_cardSectionId;
    v7->_cardSectionId = (NSString *)v8;

    objc_msgSend(v5, "resultIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    resultId = v7->_resultId;
    v7->_resultId = (NSString *)v10;

  }
  return v7;
}

- (SFCardSectionFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCardSectionFeedback *v5;
  uint64_t v6;
  SFCardSection *cardSection;
  uint64_t v8;
  NSString *cardSectionId;
  uint64_t v10;
  NSString *resultId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFCardSectionFeedback;
  v5 = -[SFFeedback initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("card_section"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("card_section_id"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardSectionId = v5->_cardSectionId;
    v5->_cardSectionId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result_id"));
    v10 = objc_claimAutoreleasedReturnValue();
    resultId = v5->_resultId;
    v5->_resultId = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCardSectionFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSection, CFSTR("card_section"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSectionId, CFSTR("card_section_id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultId, CFSTR("result_id"));

}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSectionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
