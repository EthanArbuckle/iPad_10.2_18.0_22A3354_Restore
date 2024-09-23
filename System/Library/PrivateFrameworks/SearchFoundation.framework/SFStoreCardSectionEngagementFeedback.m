@implementation SFStoreCardSectionEngagementFeedback

- (SFStoreCardSectionEngagementFeedback)initWithProductPageResult:(int64_t)a3
{
  SFStoreCardSectionEngagementFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  result = -[SFCardSectionEngagementFeedback initWithCardSection:destination:triggerEvent:actionCardType:](&v5, sel_initWithCardSection_destination_triggerEvent_actionCardType_, 0, 0, 2, 3);
  if (result)
    result->_productPageResult = a3;
  return result;
}

- (SFStoreCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4;
  SFStoreCardSectionEngagementFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  v5 = -[SFCardSectionEngagementFeedback initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_productPageResult = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_productPageResult"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  v4 = a3;
  -[SFCardSectionEngagementFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_productPageResult, CFSTR("_productPageResult"), v5.receiver, v5.super_class);

}

- (int64_t)productPageResult
{
  return self->_productPageResult;
}

- (void)setProductPageResult:(int64_t)a3
{
  self->_productPageResult = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
