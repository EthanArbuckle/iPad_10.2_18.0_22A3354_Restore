@implementation PUIEnvironment

- (int)deviceClass
{
  return MGGetSInt32Answer();
}

- (int)mainScreenClass
{
  return MGGetSInt32Answer();
}

- (id)mainScreenScale
{
  return (id)MGCopyAnswer();
}

@end
