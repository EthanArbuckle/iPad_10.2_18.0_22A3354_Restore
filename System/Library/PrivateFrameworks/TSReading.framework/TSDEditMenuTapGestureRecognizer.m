@implementation TSDEditMenuTapGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDEditMenuTapGestureRecognizer;
  -[TSDEditMenuTapGestureRecognizer reset](&v3, sel_reset);
  self->mIgnoreTargetAction = 0;

  self->mTouchedRep = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  objc_super v17;
  id v18;

  v7 = (void *)objc_msgSend((id)-[TSDEditMenuTapGestureRecognizer delegate](self, "delegate"), "interactiveCanvasController");
  if (!-[TSDEditMenuTapGestureRecognizer numberOfTouches](self, "numberOfTouches")
    && objc_msgSend(a3, "count") == 1
    && (objc_msgSend(v7, "currentlyScrolling") & 1) == 0)
  {
    v8 = (void *)objc_msgSend(a3, "anyObject");
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v8, "tapCount") == 1)
      {
        objc_msgSend(v9, "locationInView:", -[TSDEditMenuTapGestureRecognizer view](self, "view"));
        objc_msgSend(v7, "convertBoundsToUnscaledPoint:");
        v11 = v10;
        v13 = v12;
        v18 = 0;
        v14 = objc_msgSend(v7, "hitKnobAtPoint:returningRep:", &v18);
        if (v14)
        {
          if (objc_msgSend(v18, "wantsEditMenuForTapAtPoint:onKnob:", v14, v11, v13))
          {
            v15 = v18;
            if (v18)
              goto LABEL_12;
          }
        }
        v16 = (void *)objc_msgSend((id)objc_msgSend(v7, "hitRep:", v11, v13), "repForSelecting");
        if (v16)
        {
          v15 = v16;
          if (objc_msgSend(v16, "info"))
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "layerHost"), "asiOSCVC"), "shouldSelectAndShowEditMenuOnFirstTapForRep:", v15))
            {
LABEL_12:

              self->mTouchedRep = (TSDRep *)v15;
              self->mIgnoreTargetAction = 0;
              v17.receiver = self;
              v17.super_class = (Class)TSDEditMenuTapGestureRecognizer;
              -[TSDEditMenuTapGestureRecognizer touchesBegan:withEvent:](&v17, sel_touchesBegan_withEvent_, a3, a4);
            }
          }
        }
      }
    }
  }
  if (!self->mTouchedRep)
    -[TSDEditMenuTapGestureRecognizer setState:](self, "setState:", 5);
}

- (id)touchedRep
{
  return self->mTouchedRep;
}

- (BOOL)ignoreTargetAction
{
  return self->mIgnoreTargetAction;
}

- (void)setIgnoreTargetAction:(BOOL)a3
{
  self->mIgnoreTargetAction = a3;
}

@end
