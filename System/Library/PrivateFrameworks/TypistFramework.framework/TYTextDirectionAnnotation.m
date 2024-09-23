@implementation TYTextDirectionAnnotation

+ (id)initWithRange:(_NSRange)a3 textDirection:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  TYTextDirectionAnnotation *v7;

  length = a3.length;
  location = a3.location;
  v7 = objc_alloc_init(TYTextDirectionAnnotation);
  -[TYTextDirectionAnnotation setRange:](v7, "setRange:", location, length);
  -[TYTextDirectionAnnotation setTextDirection:](v7, "setTextDirection:", a4);
  return v7;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSRange v9;

  v3 = -[TYTextDirectionAnnotation textDirection](self, "textDirection");
  if (v3 - 1 > 3)
    v4 = CFSTR("Unknown direction");
  else
    v4 = off_251A7CBC0[v3 - 1];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v9.location = -[TYTextDirectionAnnotation range](self, "range");
  NSStringFromRange(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (unint64_t)textDirection
{
  return self->_textDirection;
}

- (void)setTextDirection:(unint64_t)a3
{
  self->_textDirection = a3;
}

@end
