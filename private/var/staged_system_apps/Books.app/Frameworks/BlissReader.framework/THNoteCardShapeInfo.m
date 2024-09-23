@implementation THNoteCardShapeInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class(THNoteCardShapeLayout, a2);
}

- (BOOL)ignoreEquationAlignment
{
  return self->_ignoreEquationAlignment;
}

- (void)setIgnoreEquationAlignment:(BOOL)a3
{
  self->_ignoreEquationAlignment = a3;
}

@end
