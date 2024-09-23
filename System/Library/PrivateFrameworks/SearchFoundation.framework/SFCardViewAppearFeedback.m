@implementation SFCardViewAppearFeedback

- (SFCardViewAppearFeedback)initWithCard:(id)a3
{
  id v5;
  SFCardViewAppearFeedback *v6;
  SFCardViewAppearFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardViewAppearFeedback;
  v6 = -[SFFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_card, a3);
    v7->super._queryId = objc_msgSend(v5, "queryId");
  }

  return v7;
}

- (SFCardViewAppearFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCardViewAppearFeedback *v5;
  uint64_t v6;
  SFCard *card;
  uint64_t v8;
  NSString *fbr;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCardViewAppearFeedback;
  v5 = -[SFFeedback initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_card"));
    v6 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_level = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_level"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fbr"));
    v8 = objc_claimAutoreleasedReturnValue();
    fbr = v5->_fbr;
    v5->_fbr = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCardViewAppearFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, CFSTR("_card"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_level, CFSTR("_level"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fbr, CFSTR("_fbr"));

}

- (SFCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
