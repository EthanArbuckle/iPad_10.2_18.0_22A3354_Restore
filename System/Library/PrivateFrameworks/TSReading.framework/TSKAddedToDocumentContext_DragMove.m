@implementation TSKAddedToDocumentContext_DragMove

- (id)description
{
  return CFSTR("Pasted/Drag-Move");
}

- (BOOL)wasDragMoved
{
  return 1;
}

@end
