@implementation EQKitMathMLMIdentifier

- (int)scriptVariant
{
  if ((*(_BYTE *)&self->super.mFlags & 3) != 0)
    return 1;
  else
    return 3;
}

@end
