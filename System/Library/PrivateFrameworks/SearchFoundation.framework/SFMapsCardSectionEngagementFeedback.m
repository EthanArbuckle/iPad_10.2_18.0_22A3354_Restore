@implementation SFMapsCardSectionEngagementFeedback

- (SFMapsCardSectionEngagementFeedback)initWithFeedbackType:(int)a3
{
  SFMapsCardSectionEngagementFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  result = -[SFCardSectionEngagementFeedback initWithCardSection:destination:triggerEvent:actionCardType:](&v5, sel_initWithCardSection_destination_triggerEvent_actionCardType_, 0, 0, 2, 2);
  if (result)
    result->_feedbackType = a3;
  return result;
}

- (SFMapsCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFMapsCardSectionEngagementFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  v5 = -[SFCardSectionEngagementFeedback initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_feedbackType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_feedbackType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFMapsCardSectionEngagementFeedback;
  v4 = a3;
  -[SFCardSectionEngagementFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_feedbackType, CFSTR("_feedbackType"), v5.receiver, v5.super_class);

}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int)a3
{
  self->_feedbackType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
