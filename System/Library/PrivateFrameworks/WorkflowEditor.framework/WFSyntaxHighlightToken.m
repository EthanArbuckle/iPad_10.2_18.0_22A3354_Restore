@implementation WFSyntaxHighlightToken

- (_NSRange)range
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[WFSyntaxHighlightToken start](self, "start");
  v4 = -[WFSyntaxHighlightToken length](self, "length");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)overflows
{
  return self->_overflows;
}

- (void)setOverflows:(BOOL)a3
{
  self->_overflows = a3;
}

- (int)start
{
  return self->_start;
}

- (void)setStart:(int)a3
{
  self->_start = a3;
}

- (int)length
{
  return self->_length;
}

- (void)setLength:(int)a3
{
  self->_length = a3;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)constructToken
{
  return objc_alloc_init(WFSyntaxHighlightToken);
}

@end
