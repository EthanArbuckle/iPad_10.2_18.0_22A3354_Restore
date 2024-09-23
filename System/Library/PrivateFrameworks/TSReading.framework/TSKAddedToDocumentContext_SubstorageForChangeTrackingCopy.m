@implementation TSKAddedToDocumentContext_SubstorageForChangeTrackingCopy

- (id)description
{
  return CFSTR("Substorage for change-tracking copy");
}

- (BOOL)changeTrackingSubstorage
{
  return 1;
}

@end
