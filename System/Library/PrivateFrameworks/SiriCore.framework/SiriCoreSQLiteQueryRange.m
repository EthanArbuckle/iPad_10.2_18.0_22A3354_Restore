@implementation SiriCoreSQLiteQueryRange

- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3
{
  return -[SiriCoreSQLiteQueryRange initWithLimit:offset:](self, "initWithLimit:offset:", a3, 0);
}

- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3 offset:(unint64_t)a4
{
  SiriCoreSQLiteQueryRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSQLiteQueryRange;
  result = -[SiriCoreSQLiteQueryRange init](&v7, sel_init);
  if (result)
  {
    result->_limit = a3;
    result->_offset = a4;
  }
  return result;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (unint64_t)offset
{
  return self->_offset;
}

@end
