@implementation TSDPreventScrollGestureRecognizer

- (TSDPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  TSDPreventScrollGestureRecognizer *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDPreventScrollGestureRecognizer;
  v4 = -[TSDPreventScrollGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, 0, 0);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDPreventScrollGestureRecognizer initWithInteractiveCanvasController:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPreventScrollGestureRecognizer.m"), 24, CFSTR("invalid nil value for '%s'"), "icc");
    }
    v4->mICC = (TSDInteractiveCanvasController *)a3;
  }
  return v4;
}

- (void)reset
{
  objc_super v3;

  self->mTouch = 0;
  self->mSecondTouch = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDPreventScrollGestureRecognizer;
  -[TSDPreventScrollGestureRecognizer reset](&v3, sel_reset);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  UITouch *mTouch;
  UITouch *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)TSDPreventScrollGestureRecognizer;
  -[TSDPreventScrollGestureRecognizer touchesBegan:withEvent:](&v18, sel_touchesBegan_withEvent_, a3, a4);
  if (!-[TSDPreventScrollGestureRecognizer state](self, "state")
    && -[TSDInteractiveCanvasController currentlyScrolling](self->mICC, "currentlyScrolling"))
  {
    -[TSDPreventScrollGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!-[TSDPreventScrollGestureRecognizer state](self, "state"))
        {
          mTouch = self->mTouch;
          v12 = v10;
          if (mTouch)
          {
            self->mSecondTouch = v12;
            v13 = 1;
LABEL_15:
            -[TSDPreventScrollGestureRecognizer setState:](self, "setState:", v13);
            continue;
          }
          self->mTouch = v12;
          if (-[UITouch tapCount](v12, "tapCount") != 1
            || !objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mICC, "layerHost"), "asiOSCVC"), "hitRepWithTouch:", self->mTouch), "repForDragging"))
          {
            v13 = 5;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDPreventScrollGestureRecognizer;
  -[TSDPreventScrollGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (self->mTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mTouch = 0;
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouch && !self->mSecondTouch)
    -[TSDPreventScrollGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDPreventScrollGestureRecognizer;
  -[TSDPreventScrollGestureRecognizer touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  if (self->mTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mTouch = 0;
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouch && !self->mSecondTouch)
    -[TSDPreventScrollGestureRecognizer setState:](self, "setState:", 3);
}

@end
