@implementation TSKAddedToDocumentContext_InsertingPrototype

- (id)description
{
  return CFSTR("Prototype");
}

- (BOOL)wasPasted
{
  return 0;
}

- (BOOL)autoUpdateSmartFields
{
  return 1;
}

- (BOOL)uniqueBookmarks
{
  return 1;
}

- (BOOL)syncChanges
{
  return 1;
}

@end
