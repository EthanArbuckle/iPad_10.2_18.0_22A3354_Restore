@implementation TSKRemovedFromDocumentContext_Hiding

- (id)description
{
  return CFSTR("Hidding");
}

- (BOOL)wasHidden
{
  return 1;
}

- (id)undoContext
{
  return +[TSKAddedToDocumentContext unhidingContext](TSKAddedToDocumentContext, "unhidingContext");
}

@end
