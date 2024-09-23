@implementation _UIBoxedAutoreleasePoolMark

- (_UIBoxedAutoreleasePoolMark)initWithAutoreleasePoolMark:(void *)a3
{
  _UIBoxedAutoreleasePoolMark *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBoxedAutoreleasePoolMark;
  result = -[_UIBoxedAutoreleasePoolMark init](&v5, sel_init);
  if (result)
    result->_mark = a3;
  return result;
}

- (void)mark
{
  return self->_mark;
}

- (void)setMark:(void *)a3
{
  self->_mark = a3;
}

@end
