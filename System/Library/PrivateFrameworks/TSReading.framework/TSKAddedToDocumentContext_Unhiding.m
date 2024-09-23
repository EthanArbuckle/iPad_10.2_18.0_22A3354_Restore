@implementation TSKAddedToDocumentContext_Unhiding

- (id)description
{
  return CFSTR("Unhiding");
}

- (BOOL)wasUnhidden
{
  return 1;
}

- (id)undoContext
{
  return +[TSKRemovedFromDocumentContext hidingContext](TSKRemovedFromDocumentContext, "hidingContext");
}

@end
