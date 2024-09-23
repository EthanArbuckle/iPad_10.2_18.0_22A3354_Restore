@implementation PFAIBreak

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIBreak;
  -[PFAIBreak dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;
  objc_super v7;

  self->mContentState = (PFAIContentState *)a3;
  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIBreak;
    -[PFXBreak mapStartElementWithState:](&v7, "mapStartElementWithState:", a3);
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIBreak;
    -[PFXBreak mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
  }
  return 0;
}

- (BOOL)canAddColumnBreak
{
  return -[PFAIContentState paginatedIsCurrent](self->mContentState, "paginatedIsCurrent");
}

@end
