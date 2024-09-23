@implementation ICURLBagMescalConfiguration

- (BOOL)shouldSignBody
{
  return self->_shouldSignBody;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setShouldSignBody:(BOOL)a3
{
  self->_shouldSignBody = a3;
}

- (void)setShouldIncludePath:(BOOL)a3
{
  self->_shouldIncludePath = a3;
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ICURLBagMescalConfiguration;
  -[ICURLBagMescalConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@; shouldSignBody=%d, shouldIncludePath=%d, fields=%@, headers=%@"),
    v4,
    self->_shouldSignBody,
    self->_shouldIncludePath,
    self->_fields,
    self->_headers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldIncludePath
{
  return self->_shouldIncludePath;
}

@end
