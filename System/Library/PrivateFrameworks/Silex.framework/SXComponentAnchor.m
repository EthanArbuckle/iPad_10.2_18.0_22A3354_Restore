@implementation SXComponentAnchor

- (SXComponentAnchor)initWithTargetComponentIdentifier:(id)a3
{
  id v5;
  SXComponentAnchor *v6;
  SXComponentAnchor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentAnchor;
  v6 = -[SXComponentAnchor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetComponentIdentifier, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSRange v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentAnchor targetComponentIdentifier](self, "targetComponentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; target component: %@"), v4);

  v7.location = -[SXComponentAnchor range](self, "range");
  NSStringFromRange(v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; range: %@"), v5);

  return (NSString *)v3;
}

- (NSString)targetComponentIdentifier
{
  return self->_targetComponentIdentifier;
}

- (int64_t)targetAnchorPosition
{
  return self->_targetAnchorPosition;
}

- (void)setTargetAnchorPosition:(int64_t)a3
{
  self->_targetAnchorPosition = a3;
}

- (int64_t)originAnchorPosition
{
  return self->_originAnchorPosition;
}

- (void)setOriginAnchorPosition:(int64_t)a3
{
  self->_originAnchorPosition = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComponentIdentifier, 0);
}

@end
