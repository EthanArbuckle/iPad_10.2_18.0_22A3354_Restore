@implementation QLCacheHole

+ (id)holeWithLocation:(unint64_t)a3 length:(unint64_t)a4
{
  return -[QLCacheHole initWithLocation:length:]([QLCacheHole alloc], "initWithLocation:length:", a3, a4);
}

- (QLCacheHole)initWithLocation:(unint64_t)a3 length:(unint64_t)a4
{
  QLCacheHole *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLCacheHole;
  result = -[QLCacheHole init](&v7, sel_init);
  result->_location = a3;
  result->_length = a4;
  return result;
}

- (void)setLocation:(unint64_t)a3 length:(unint64_t)a4
{
  -[QLCacheHole setLocation:](self, "setLocation:", a3);
  self->_length = a4;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_length;
  location = self->_location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length;

  length = a3.length;
  -[QLCacheHole setLocation:](self, "setLocation:", a3.location);
  -[QLCacheHole setLength:](self, "setLength:", length);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %llu %llu>"), objc_opt_class(), self->_location, self->_length);
}

- (BOOL)isEqual:(id)a3
{
  QLCacheHole *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (QLCacheHole *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[QLCacheHole location](self, "location"), v5 == -[QLCacheHole location](v4, "location")))
    {
      v6 = -[QLCacheHole length](self, "length");
      v7 = v6 == -[QLCacheHole length](v4, "length");
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

@end
