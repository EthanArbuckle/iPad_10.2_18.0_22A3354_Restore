@implementation SXIssueCoverLayoutOptions

- (SXIssueCoverLayoutOptions)initWithBoundingWidth:(double)a3
{
  SXIssueCoverLayoutOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXIssueCoverLayoutOptions;
  result = -[SXIssueCoverLayoutOptions init](&v5, sel_init);
  if (result)
    result->_boundingWidth = a3;
  return result;
}

- (double)boundingWidth
{
  return self->_boundingWidth;
}

@end
