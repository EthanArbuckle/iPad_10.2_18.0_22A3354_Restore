@implementation PLEnergyBucket

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLEnergyBucket (%d)"), -[PLEnergyBucket level](self, "level"));
}

- (signed)level
{
  return self->_level;
}

- (void)setLevel:(signed __int16)a3
{
  self->_level = a3;
}

@end
