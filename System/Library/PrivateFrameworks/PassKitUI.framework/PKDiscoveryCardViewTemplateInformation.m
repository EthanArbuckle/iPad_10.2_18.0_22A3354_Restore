@implementation PKDiscoveryCardViewTemplateInformation

- (PKDiscoveryCardViewTemplateInformation)initWithCardSize:(int64_t)a3 displayType:(int64_t)a4
{
  PKDiscoveryCardViewTemplateInformation *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDiscoveryCardViewTemplateInformation;
  result = -[PKDiscoveryCardViewTemplateInformation init](&v7, sel_init);
  if (result)
  {
    result->_cardSize = a3;
    result->_displayType = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCardSize:displayType:", self->_cardSize, self->_displayType);
}

- (void)updateCardSize:(int64_t)a3
{
  if (self->_cardSize != a3)
    self->_cardSize = a3;
}

- (void)setDisplayType:(int64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)cardSize
{
  return self->_cardSize;
}

- (void)setCardSize:(int64_t)a3
{
  self->_cardSize = a3;
}

- (int64_t)displayType
{
  return self->_displayType;
}

@end
