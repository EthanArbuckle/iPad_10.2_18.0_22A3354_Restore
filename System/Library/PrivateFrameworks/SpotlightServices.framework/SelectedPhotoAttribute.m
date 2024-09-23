@implementation SelectedPhotoAttribute

- (SelectedPhotoAttribute)initWithZeros
{
  SelectedPhotoAttribute *v2;
  SelectedPhotoAttribute *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SelectedPhotoAttribute;
  v2 = -[SelectedPhotoAttribute init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SelectedPhotoAttribute setSelectedAttribute:](v2, "setSelectedAttribute:", 0);
    LODWORD(v4) = 0;
    -[SelectedPhotoAttribute setMaxAttributeFreq:](v3, "setMaxAttributeFreq:", v4);
    LODWORD(v5) = 0;
    -[SelectedPhotoAttribute setSelectedTokenPercentage:](v3, "setSelectedTokenPercentage:", v5);
  }
  return v3;
}

- (unint64_t)selectedAttribute
{
  return self->_selectedAttribute;
}

- (void)setSelectedAttribute:(unint64_t)a3
{
  self->_selectedAttribute = a3;
}

- (float)maxAttributeFreq
{
  return self->_maxAttributeFreq;
}

- (void)setMaxAttributeFreq:(float)a3
{
  self->_maxAttributeFreq = a3;
}

- (float)selectedTokenPercentage
{
  return self->_selectedTokenPercentage;
}

- (void)setSelectedTokenPercentage:(float)a3
{
  self->_selectedTokenPercentage = a3;
}

@end
