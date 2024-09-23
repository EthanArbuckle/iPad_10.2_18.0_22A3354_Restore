@implementation TUIHSpacer

- (void)setWidth:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_width.value = a3;
  *(_QWORD *)&self->_width.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)width
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_width.value;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIHSpacerLayout, a2);
}

@end
