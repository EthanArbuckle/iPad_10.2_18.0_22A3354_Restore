@implementation TSKRemovedFromDocumentContext_Moving

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
  return +[TSKAddedToDocumentContext movingContext](TSKAddedToDocumentContext, "movingContext");
}

@end
