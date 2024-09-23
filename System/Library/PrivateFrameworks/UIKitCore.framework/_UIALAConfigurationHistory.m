@implementation _UIALAConfigurationHistory

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIALAConfigurationHistory;
  v4 = -[_UILAConfigurationHistory copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAlignment:", self->_alignment);
  objc_msgSend(v4, "setHasEstablishedAlignmentValues:", self->_hasEstablishedAlignmentValues);
  objc_msgSend(v4, "setInAlignmentLayoutUpdateSection:", self->_inAlignmentLayoutUpdateSection);
  return v4;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setInAlignmentLayoutUpdateSection:(BOOL)a3
{
  self->_inAlignmentLayoutUpdateSection = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (BOOL)isInAlignmentLayoutUpdateSection
{
  return self->_inAlignmentLayoutUpdateSection;
}

- (void)setHasEstablishedAlignmentValues:(BOOL)a3
{
  self->_hasEstablishedAlignmentValues = a3;
}

- (BOOL)hasEstablishedAlignmentValues
{
  return self->_hasEstablishedAlignmentValues;
}

@end
