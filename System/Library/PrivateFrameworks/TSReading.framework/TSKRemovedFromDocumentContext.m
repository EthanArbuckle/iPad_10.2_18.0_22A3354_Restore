@implementation TSKRemovedFromDocumentContext

+ (id)movingContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKRemovedFromDocumentContext movingContext]::sMovingContext = objc_alloc_init(TSKRemovedFromDocumentContext_Moving);
  }
  return (id)+[TSKRemovedFromDocumentContext movingContext]::sMovingContext;
}

+ (id)hidingContext
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[TSKRemovedFromDocumentContext hidingContext]::sHidingContext = objc_alloc_init(TSKRemovedFromDocumentContext_Hiding);
  }
  return (id)+[TSKRemovedFromDocumentContext hidingContext]::sHidingContext;
}

- (BOOL)wasMoved
{
  return 0;
}

- (BOOL)wasHidden
{
  return 0;
}

- (id)undoContext
{
  return 0;
}

@end
