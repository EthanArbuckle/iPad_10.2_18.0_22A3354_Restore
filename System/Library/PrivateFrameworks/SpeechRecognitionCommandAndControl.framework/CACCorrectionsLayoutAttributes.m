@implementation CACCorrectionsLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[CACCorrectionsLayoutAttributes availableWidth](self, "availableWidth");
  objc_msgSend(v4, "setAvailableWidth:");
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACCorrectionsLayoutAttributes;
  -[UICollectionViewLayoutAttributes description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsLayoutAttributes availableWidth](self, "availableWidth");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("available width: %f;"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

@end
