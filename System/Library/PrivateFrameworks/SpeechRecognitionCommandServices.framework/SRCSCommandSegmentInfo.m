@implementation SRCSCommandSegmentInfo

+ (id)segmentInfoWith:(_NSRange)a3 text:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setRange:", location, length);
  objc_msgSend(v7, "setText:", v6);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("“%@”"), self->_text);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
