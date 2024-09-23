@implementation SFCardSectionEngagementFeedback

- (SFCardSectionEngagementFeedback)initWithCardSection:(id)a3 destination:(id)a4 triggerEvent:(unint64_t)a5 actionCardType:(unint64_t)a6
{
  id v11;
  SFCardSectionEngagementFeedback *v12;
  SFCardSectionEngagementFeedback *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFCardSectionEngagementFeedback;
  v12 = -[SFCardSectionFeedback initWithCardSection:](&v15, sel_initWithCardSection_, a3);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_destination, a4);
    v13->_triggerEvent = a5;
    v13->_actionCardType = a6;
  }

  return v13;
}

- (SFCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFCardSectionEngagementFeedback *v5;
  uint64_t v6;
  SFPunchout *destination;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardSectionEngagementFeedback;
  v5 = -[SFCardSectionFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trigger_event"));
    v5->_actionCardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action_type_card"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destination"));
    v6 = objc_claimAutoreleasedReturnValue();
    destination = v5->_destination;
    v5->_destination = (SFPunchout *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFCardSectionEngagementFeedback;
  v4 = a3;
  -[SFCardSectionFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("trigger_event"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_actionCardType, CFSTR("action_type_card"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("_destination"));

}

- (SFPunchout)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)actionCardType
{
  return self->_actionCardType;
}

- (void)setActionCardType:(unint64_t)a3
{
  self->_actionCardType = a3;
}

- (unint64_t)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(unint64_t)a3
{
  self->_actionTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
