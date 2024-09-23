@implementation SBWindowHideState

- (id)description
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[SBWindowHideState isHidden](self, "isHidden"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[SBWindowHideState desiredAlpha](self, "desiredAlpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<SBWindowHideState: hidden = %@; desiredAlpha = %.f>"),
               v4,
               v5);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (double)desiredAlpha
{
  return self->_desiredAlpha;
}

- (void)setDesiredAlpha:(double)a3
{
  self->_desiredAlpha = a3;
}

@end
