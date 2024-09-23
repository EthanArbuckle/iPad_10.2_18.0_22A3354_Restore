@implementation _TVStackViewFlowLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVStackViewFlowLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[_TVStackViewFlowLayoutAttributes showcaseFactor](self, "showcaseFactor");
  objc_msgSend(v4, "setShowcaseFactor:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TVStackViewFlowLayoutAttributes;
  if (-[UICollectionViewLayoutAttributes isEqual:](&v10, sel_isEqual_, v4))
  {
    -[_TVStackViewFlowLayoutAttributes showcaseFactor](self, "showcaseFactor");
    v6 = v5;
    objc_msgSend(v4, "showcaseFactor");
    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
}

@end
