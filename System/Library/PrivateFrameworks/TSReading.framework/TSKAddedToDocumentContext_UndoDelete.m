@implementation TSKAddedToDocumentContext_UndoDelete

- (id)description
{
  return CFSTR("Undo delete");
}

- (BOOL)wasUndoDelete
{
  return 1;
}

@end
