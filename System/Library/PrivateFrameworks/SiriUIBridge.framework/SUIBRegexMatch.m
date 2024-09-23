@implementation SUIBRegexMatch

- (SUIBRegexMatch)initWithBridgedMatch:(id)a3
{
  id v5;
  SUIBRegexMatch *v6;
  SUIBRegexMatch *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUIBRegexMatch;
  v6 = -[SUIBRegexMatch init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bridgedMatch, a3);

  return v7;
}

- (_NSRange)range
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[SUIBRegexMatch bridgedMatch](self, "bridgedMatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)captured
{
  void *v2;
  void *v3;

  -[SUIBRegexMatch bridgedMatch](self, "bridgedMatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captured");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SUIBBridgedMatch)bridgedMatch
{
  return self->_bridgedMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedMatch, 0);
}

@end
