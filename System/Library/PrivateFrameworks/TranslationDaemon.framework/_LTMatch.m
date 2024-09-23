@implementation _LTMatch

- (_LTMatch)initWithNode:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _LTMatch *v9;
  _LTMatch *v10;
  _LTMatch *v11;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = -[_LTMatch init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10->_range.location = location;
    v10->_range.length = length;
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  NSString *token;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  token = self->_token;
  NSStringFromRange(self->_range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), token, v5, self->_node);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
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

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
