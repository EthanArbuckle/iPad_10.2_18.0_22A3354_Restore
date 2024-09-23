@implementation __NSScratchTextLineFragment

- (__NSScratchTextLineFragment)initWithVerticalOffset:(double)a3
{
  __NSScratchTextLineFragment *v4;
  __NSScratchTextLineFragment *v5;

  v4 = -[NSTextLineFragment initWithString:attributes:range:](self, "initWithString:attributes:range:", &stru_1E260C7D0, MEMORY[0x1E0C9AA70], 0, 0);
  v5 = v4;
  if (v4)
    -[NSTextLineFragment setTypographicBounds:](v4, "setTypographicBounds:", 0.0, a3, 0.0, 0.0);
  return v5;
}

- (__NSScratchTextLineFragment)initWithString:(id)a3 characterIndex:(unint64_t)a4
{
  return -[NSTextLineFragment initWithString:attributes:range:](self, "initWithString:attributes:range:", a3, MEMORY[0x1E0C9AA70], a4, 0);
}

@end
