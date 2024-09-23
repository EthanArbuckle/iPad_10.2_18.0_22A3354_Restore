@implementation TTSStringTransformation

- (TTSStringTransformation)initWithRange:(_NSRange)a3 andReplacement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  TTSStringTransformation *v9;
  TTSStringTransformation *v10;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTSStringTransformation;
  v9 = -[TTSStringTransformation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_range.location = location;
    v9->_range.length = length;
    objc_storeStrong((id *)&v9->_replacement, a4);
  }

  return v10;
}

- (int64_t)sizeDelta
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;

  objc_msgSend_replacement(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_length(v6, v7, v8, v9, v10);
  objc_msgSend_range(self, v12, v13, v14, v15);
  v17 = v11 - v16;

  return v17;
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

- (NSString)replacement
{
  return self->_replacement;
}

- (void)setReplacement:(id)a3
{
  objc_storeStrong((id *)&self->_replacement, a3);
}

- (unint64_t)offsetFromEnd
{
  return self->_offsetFromEnd;
}

- (void)setOffsetFromEnd:(unint64_t)a3
{
  self->_offsetFromEnd = a3;
}

- (_NSRange)finalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_finalRange.length;
  location = self->_finalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setFinalRange:(_NSRange)a3
{
  self->_finalRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacement, 0);
}

@end
