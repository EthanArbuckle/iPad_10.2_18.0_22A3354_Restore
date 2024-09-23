@implementation TSKAddedToDocumentContext_DragCopy

- (id)description
{
  return CFSTR("Pasted/Drag-Copy");
}

- (BOOL)wasDragOperation
{
  return 1;
}

@end
