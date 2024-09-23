@implementation OADTabStop

- (void)setAlign:(unsigned __int8)a3
{
  self->mAlign = a3;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (unsigned)align
{
  return self->mAlign;
}

- (int)position
{
  return self->mPosition;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class() && self->mAlign == *((unsigned __int8 *)v4 + 8) && self->mPosition == v4[3];

  return v6;
}

- (unint64_t)hash
{
  return self->mPosition ^ self->mAlign;
}

@end
