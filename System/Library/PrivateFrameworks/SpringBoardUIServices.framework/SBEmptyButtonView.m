@implementation SBEmptyButtonView

- (id)initForCharacter:(int64_t)a3
{
  return -[SBEmptyButtonView initForCharacter:style:](self, "initForCharacter:style:", a3, 0);
}

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBEmptyButtonView;
  result = -[SBEmptyButtonView initWithFrame:](&v6, sel_initWithFrame_, a3, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    *((_QWORD *)result + 52) = a3;
  return result;
}

- (int64_t)character
{
  return self->_char;
}

- (void)setCharacter:(int64_t)a3
{
  self->_char = a3;
}

@end
