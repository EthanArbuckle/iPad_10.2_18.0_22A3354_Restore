@implementation PFAIAnchor

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v12.receiver = self;
    v12.super_class = (Class)PFAIAnchor;
    v6 = (id)-[PFXAnchor mapStartElementWithState:](&v12, "mapStartElementWithState:", a3);
LABEL_6:
    objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v6);
    goto LABEL_7;
  }
  if ((objc_msgSend(a3, "inFlowHeader") & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)PFAIAnchor;
    -[PFXAnchor mapStartElementWithState:](&v11, "mapStartElementWithState:", a3);
    v10.receiver = self;
    v10.super_class = (Class)PFAIAnchor;
    -[PFXAnchor mapEndElementWithState:](&v10, "mapEndElementWithState:", a3);
    v6 = 0;
    goto LABEL_6;
  }
  LOBYTE(v6) = 0;
LABEL_7:
  if ((objc_msgSend(a3, "setPaginatedAsCurrent") & 1) != 0
    || (objc_msgSend(a3, "inFlowHeader") & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PFAIAnchor;
    v7 = (id)-[PFXAnchor mapStartElementWithState:](&v9, "mapStartElementWithState:", a3);
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v7);
    LOBYTE(v6) = v6 | v7;
  }
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return (char)v6;
}

- (void)mapEndElementWithState:(id)a3
{
  objc_super v5;
  objc_super v6;

  if (objc_msgSend(a3, "setFlowAsCurrent"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PFAIAnchor;
    -[PFXAnchor mapEndElementWithState:](&v6, "mapEndElementWithState:", a3);
  }
  if (objc_msgSend(a3, "setPaginatedAsCurrent"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PFAIAnchor;
    -[PFXAnchor mapEndElementWithState:](&v5, "mapEndElementWithState:", a3);
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
  +[PFAIReferenceAnchor startReferenceAnchorWithStackEntry:contentState:](PFAIReferenceAnchor, "startReferenceAnchorWithStackEntry:contentState:", a3, a4);
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
  +[PFAIReferenceAnchor endCurrentReferenceAnchorForEntryOrientation:contentState:](PFAIReferenceAnchor, "endCurrentReferenceAnchorForEntryOrientation:contentState:", a3, a4);
}

@end
