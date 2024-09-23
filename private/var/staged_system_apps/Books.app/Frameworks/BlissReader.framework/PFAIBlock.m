@implementation PFAIBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  char isKindOfClass;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  objc_super v14;
  objc_super v15;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PFAIBlock;
    v6 = (id)-[PFXBlock mapStartElementWithState:](&v15, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
    if ((objc_msgSend(a3, "setPaginatedAsCurrent") & 1) == 0)
    {
      if ((v6 & 1) != 0)
      {
        isKindOfClass = 1;
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  else
  {
    if (!objc_msgSend(a3, "setPaginatedAsCurrent"))
    {
LABEL_9:
      v9 = objc_msgSend(v5, "nonDelegatedReader");
      v10 = objc_opt_class(PFAIDiv);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        v11 = objc_msgSend(objc_msgSend(v5, "parentEntry"), "nonDelegatedReader");
        v12 = objc_opt_class(PFAIDualBody);
        isKindOfClass = objc_opt_isKindOfClass(v11, v12);
      }
      else
      {
        isKindOfClass = 0;
      }
      goto LABEL_12;
    }
    LOBYTE(v6) = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)PFAIBlock;
  v8 = (id)-[PFXBlock mapStartElementWithState:](&v14, "mapStartElementWithState:", a3);
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v8);
  isKindOfClass = 1;
  if ((v6 & 1) == 0 && (v8 & 1) == 0)
    goto LABEL_9;
LABEL_12:
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return isKindOfClass & 1;
}

- (void)mapEndElementUsingCurrentLayoutWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  objc_super v12;

  v5 = objc_msgSend(a3, "currentStackEntry");
  v6 = objc_msgSend(v5, "currentEntryOrientationState");
  v7 = objc_msgSend(a3, "currentDocOrientationState");
  if (objc_msgSend(v7, "hasHints"))
  {
    if ((objc_msgSend(a3, "inTable") & 1) == 0)
    {
      v8 = objc_msgSend(a3, "totalTextRead");
      if (v8 == objc_msgSend(v7, "nextHintLocation"))
      {
        if (objc_msgSend(v7, "inList"))
        {
          v9 = objc_msgSend(a3, "totalTextRead");
          v10 = v9 == objc_msgSend(v7, "nextHintLocation") && objc_msgSend(v7, "nextHintShapeRef") == 0;
        }
        else
        {
          v10 = 1;
        }
        if (!xmlStrEqual((const xmlChar *)"div", (const xmlChar *)objc_msgSend(v5, "xmlElementName"))
          && v10
          && objc_msgSend(v7, "hasHints"))
        {
          do
          {
            if (objc_msgSend(v7, "nextHintShapeRef"))
              break;
            v11 = objc_msgSend(a3, "totalTextRead");
            if (v11 != objc_msgSend(v7, "nextHintLocation"))
              break;
            objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v6, "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
            objc_msgSend(v7, "popHint");
          }
          while ((objc_msgSend(v7, "hasHints") & 1) != 0);
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PFAIBlock;
  -[PFXBlock mapEndElementWithState:](&v12, "mapEndElementWithState:", a3);
}

- (void)mapEndElementWithState:(id)a3
{
  if (objc_msgSend(a3, "setFlowAsCurrent"))
    -[PFAIBlock mapEndElementUsingCurrentLayoutWithState:](self, "mapEndElementUsingCurrentLayoutWithState:", a3);
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
    -[PFAIBlock mapEndElementUsingCurrentLayoutWithState:](self, "mapEndElementUsingCurrentLayoutWithState:", a3);
}

- (BOOL)canAddColumnBreak:(id)a3
{
  return objc_msgSend(a3, "paginatedIsCurrent");
}

@end
