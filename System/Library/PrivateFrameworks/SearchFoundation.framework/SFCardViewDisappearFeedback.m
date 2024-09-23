@implementation SFCardViewDisappearFeedback

- (SFCardViewDisappearFeedback)initWithCard:(id)a3 event:(unint64_t)a4
{
  id v7;
  SFCardViewDisappearFeedback *v8;
  SFCardViewDisappearFeedback *v9;

  v7 = a3;
  v8 = -[SFCardViewDisappearFeedback initWithEvent:](self, "initWithEvent:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_card, a3);

  return v9;
}

- (SFCardViewDisappearFeedback)initWithEvent:(unint64_t)a3
{
  SFCardViewDisappearFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCardViewDisappearFeedback;
  result = -[SFFeedback init](&v5, sel_init);
  if (result)
    result->_cardDisappearEvent = a3;
  return result;
}

- (SFCardViewDisappearFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCardViewDisappearFeedback *v5;
  uint64_t v6;
  SFCard *card;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardViewDisappearFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_card"));
    v6 = objc_claimAutoreleasedReturnValue();
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_cardDisappearEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_cardDisappearEvent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCardViewDisappearFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, CFSTR("_card"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cardDisappearEvent, CFSTR("_cardDisappearEvent"));

}

- (SFCard)card
{
  return self->_card;
}

- (unint64_t)cardDisappearEvent
{
  return self->_cardDisappearEvent;
}

- (void)setCardDisappearEvent:(unint64_t)a3
{
  self->_cardDisappearEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
