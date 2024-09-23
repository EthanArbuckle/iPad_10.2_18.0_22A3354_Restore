@implementation TSKAddedToDocumentContext_Unarchiving

- (id)description
{
  return CFSTR("Unarchived");
}

- (BOOL)wasUnarchived
{
  return 1;
}

- (BOOL)autoUpdateSmartFields
{
  return 0;
}

@end
