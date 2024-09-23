@implementation TSKAddedToDocumentContext_Moving

- (id)description
{
  return CFSTR("Moving");
}

- (BOOL)wasMoved
{
  return 1;
}

- (id)undoContext
{
  return +[TSKRemovedFromDocumentContext movingContext](TSKRemovedFromDocumentContext, "movingContext");
}

@end
