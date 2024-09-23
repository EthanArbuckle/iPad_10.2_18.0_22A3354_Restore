@implementation VCSTodo

- (unint64_t)entityType
{
  return 3;
}

- (BOOL)isValidStatus:(unint64_t)a3
{
  return (a3 < 9) & (0x19Cu >> a3);
}

@end
