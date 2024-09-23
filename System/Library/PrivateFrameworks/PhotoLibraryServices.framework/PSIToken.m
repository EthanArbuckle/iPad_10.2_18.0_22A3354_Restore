@implementation PSIToken

- (PSIToken)initWithString:(__CFString *)a3 range:(id)a4
{
  int64_t var1;
  int64_t var0;
  PSIToken *v7;
  objc_super v9;

  var1 = a4.var1;
  var0 = a4.var0;
  v9.receiver = self;
  v9.super_class = (Class)PSIToken;
  v7 = -[PSIToken init](&v9, sel_init);
  if (v7)
  {
    v7->_string = (__CFString *)CFRetain(a3);
    v7->_range.location = var0;
    v7->_range.length = var1;
  }
  return v7;
}

- (unint64_t)hash
{
  return CFHash(self->_string);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t location;
  int64_t length;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  location = self->_range.location;
  if (location == objc_msgSend(v4, "range"))
  {
    length = self->_range.length;
    objc_msgSend(v4, "range");
    v8 = length == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PSIToken setString:](self, "setString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSIToken;
  -[PSIToken dealloc](&v3, sel_dealloc);
}

- (__CFString)string
{
  return self->_string;
}

- (void)setString:(__CFString *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)range
{
  int64_t length;
  int64_t location;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  length = self->_range.length;
  location = self->_range.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setRange:(id)a3
{
  self->_range = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

@end
