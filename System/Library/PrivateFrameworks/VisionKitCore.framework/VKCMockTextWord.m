@implementation VKCMockTextWord

- (VKCMockTextWord)initWithWordsDictionary:(id)a3
{
  id v4;
  VKCMockTextWord *v5;
  void *v6;
  void *v7;
  VKQuad *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKCMockTextWord;
  v5 = -[VKCMockTextWord init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultTextKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCMockTextWord setText:](v5, "setText:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultQuadKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VKQuad initWithDictionary:]([VKQuad alloc], "initWithDictionary:", v7);
    -[VKCMockTextWord setQuad:](v5, "setQuad:", v8);

  }
  return v5;
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

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
