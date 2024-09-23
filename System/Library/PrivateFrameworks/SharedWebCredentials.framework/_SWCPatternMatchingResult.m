@implementation _SWCPatternMatchingResult

+ (id)new
{
  abort();
}

- (_SWCPatternMatchingResult)init
{
  abort();
}

- (id)_initWithIndex:(unint64_t)a3 excluded:(BOOL)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWCPatternMatchingResult;
  result = -[_SWCPatternMatchingResult init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = a3;
    *((_BYTE *)result + 8) = a4;
  }
  return result;
}

- (unint64_t)index
{
  return self->_index;
}

- (BOOL)isExcluded
{
  return self->_excluded;
}

@end
