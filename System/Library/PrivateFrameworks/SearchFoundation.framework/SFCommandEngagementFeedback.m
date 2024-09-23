@implementation SFCommandEngagementFeedback

- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4 result:(id)a5 button:(id)a6
{
  id v10;
  id v11;
  SFCommandEngagementFeedback *v12;
  SFCommandEngagementFeedback *v13;
  SFCommandEngagementFeedback *v14;

  v10 = a5;
  v11 = a6;
  v12 = -[SFCommandEngagementFeedback initWithCommand:cardSection:](self, "initWithCommand:cardSection:", a3, a4);
  v13 = v12;
  if (v12)
  {
    -[SFCommandEngagementFeedback setResult:](v12, "setResult:", v10);
    -[SFCommandEngagementFeedback setButton:](v13, "setButton:", v11);
    v14 = v13;
  }

  return v13;
}

- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4
{
  id v7;
  id v8;
  SFCommandEngagementFeedback *v9;
  SFCommandEngagementFeedback *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFCommandEngagementFeedback;
  v9 = -[SFFeedback init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    objc_storeStrong((id *)&v10->_cardSection, a4);
  }

  return v10;
}

- (SFCommandEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCommandEngagementFeedback *v5;
  uint64_t v6;
  SFSearchResult *v7;
  uint64_t v8;
  SFCardSection *cardSection;
  uint64_t v10;
  SFButtonItem *button;
  uint64_t v12;
  SFCommand *command;
  uint64_t v14;
  SFResultSection *resultSection;
  uint64_t v16;
  SFPhotosAttributes *photosAttributes;
  SFCommandEngagementFeedback *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFCommandEngagementFeedback;
  v5 = -[SFFeedback initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_result"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cardSection"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_button"));
    v10 = objc_claimAutoreleasedReturnValue();
    button = v5->_button;
    v5->_button = (SFButtonItem *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_command"));
    v12 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (SFCommand *)v12;

    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_triggerEvent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resultSection"));
    v14 = objc_claimAutoreleasedReturnValue();
    resultSection = v5->_resultSection;
    v5->_resultSection = (SFResultSection *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_photosAttributes"));
    v16 = objc_claimAutoreleasedReturnValue();
    photosAttributes = v5->_photosAttributes;
    v5->_photosAttributes = (SFPhotosAttributes *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCommandEngagementFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("_result"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSection, CFSTR("_cardSection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_button, CFSTR("_button"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_command, CFSTR("_command"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("_triggerEvent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultSection, CFSTR("_resultSection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_photosAttributes, CFSTR("_photosAttributes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SFCommandEngagementFeedback;
  v4 = -[SFFeedback copyWithZone:](&v24, sel_copyWithZone_, a3);
  -[SFCommandEngagementFeedback command](self, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[5];
  v4[5] = v6;

  -[SFCommandEngagementFeedback cardSection](self, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  -[SFCommandEngagementFeedback result](self, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  -[SFCommandEngagementFeedback button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v4[4] = -[SFCommandEngagementFeedback triggerEvent](self, "triggerEvent");
  -[SFCommandEngagementFeedback resultSection](self, "resultSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  v19 = (void *)v4[8];
  v4[8] = v18;

  -[SFCommandEngagementFeedback photosAttributes](self, "photosAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = (void *)v4[9];
  v4[9] = v21;

  return v4;
}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (SFButtonItem)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (SFResultSection)resultSection
{
  return self->_resultSection;
}

- (void)setResultSection:(id)a3
{
  objc_storeStrong((id *)&self->_resultSection, a3);
}

- (SFPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setPhotosAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_photosAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_resultSection, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
