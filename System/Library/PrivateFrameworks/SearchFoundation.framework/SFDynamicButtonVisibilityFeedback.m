@implementation SFDynamicButtonVisibilityFeedback

- (SFDynamicButtonVisibilityFeedback)initWithCardSection:(id)a3 buttons:(id)a4
{
  id v6;
  id v7;
  SFDynamicButtonVisibilityFeedback *v8;
  uint64_t v9;
  NSArray *buttons;
  uint64_t v11;
  SFCardSection *cardSection;
  SFDynamicButtonVisibilityFeedback *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  v8 = -[SFFeedback init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    buttons = v8->_buttons;
    v8->_buttons = (NSArray *)v9;

    v11 = objc_msgSend(v6, "copy");
    cardSection = v8->_cardSection;
    v8->_cardSection = (SFCardSection *)v11;

    v13 = v8;
  }

  return v8;
}

- (SFDynamicButtonVisibilityFeedback)initWithCoder:(id)a3
{
  id v4;
  SFDynamicButtonVisibilityFeedback *v5;
  uint64_t v6;
  NSArray *buttons;
  uint64_t v8;
  SFCardSection *cardSection;
  SFDynamicButtonVisibilityFeedback *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  v5 = -[SFFeedback initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_buttons"));
    v6 = objc_claimAutoreleasedReturnValue();
    buttons = v5->_buttons;
    v5->_buttons = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_cardSection"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_buttons, CFSTR("_buttons"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSection, CFSTR("_cardSection"));

}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
