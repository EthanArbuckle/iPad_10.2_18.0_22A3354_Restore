@implementation PFAIEmbed

- (void)propagateFirstChildResultFromState:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = objc_msgSend(a3, "childResultCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(a3, "childResultAtIndex:", v6);
      if (v7)
        break;
      if (v5 == (id)++v6)
        return;
    }
    objc_msgSend(a3, "setResult:", v7);
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "currentStackEntry");
  -[PFAIEmbed propagateFirstChildResultFromState:](self, "propagateFirstChildResultFromState:", objc_msgSend(v4, "paginatedState"));
  -[PFAIEmbed propagateFirstChildResultFromState:](self, "propagateFirstChildResultFromState:", objc_msgSend(v4, "flowState"));
}

@end
