@implementation __NSTextLayoutFragmentForGap

- (BOOL)_isEnumerationGap
{
  return 1;
}

- (unint64_t)state
{
  return 3;
}

- (void)setLayoutFragmentFrame:(CGRect)a3
{
  double v3;
  double v4;
  objc_super v5;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v5.receiver = self;
  v5.super_class = (Class)__NSTextLayoutFragmentForGap;
  -[NSTextLayoutFragment setLayoutFragmentFrame:](&v5, sel_setLayoutFragmentFrame_, a3.origin.x, a3.origin.y, v3, v4);
}

@end
