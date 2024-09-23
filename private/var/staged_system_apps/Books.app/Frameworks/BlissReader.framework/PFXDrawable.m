@implementation PFXDrawable

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXDrawable;
  -[PFXDrawable dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  PFXDrawablePlacement *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->mPlacement = v5;
  v6 = -[PFXDrawablePlacement mapStartElementWithState:](v5, "mapStartElementWithState:", a3);
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  if (-[PFXDrawablePlacement mode](self->mPlacement, "mode") == 2)
  {
    if (objc_msgSend(v7, "hasHints"))
    {
      if ((objc_msgSend(a3, "inTable") & 1) == 0)
      {
        v8 = objc_msgSend(v7, "nextHintLocation");
        if (v8 == objc_msgSend(a3, "totalTextRead"))
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
          objc_msgSend(v7, "popHint");
        }
      }
    }
  }
  return v6;
}

- (void)mapEndElementWithState:(id)a3
{
  -[PFXDrawablePlacement mapEndElementWithState:](self->mPlacement, "mapEndElementWithState:", a3);
}

- (PFXDrawablePlacement)placement
{
  return self->mPlacement;
}

@end
