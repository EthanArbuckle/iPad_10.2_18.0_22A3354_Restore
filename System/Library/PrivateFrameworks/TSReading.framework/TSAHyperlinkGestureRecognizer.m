@implementation TSAHyperlinkGestureRecognizer

- (TSAHyperlinkGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  TSAHyperlinkGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSAHyperlinkGestureRecognizer;
  result = -[TSAHyperlinkGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_tapEnabled = 1;
    result->_tapHoldEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  objc_super v3;

  if (-[TSAHyperlinkGestureRecognizer state](self, "state") != 3)
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
  }
  -[TSAHyperlinkGestureRecognizer setHitRep:](self, "setHitRep:", 0);
  -[TSAHyperlinkGestureRecognizer setHitField:](self, "setHitField:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer reset](&v3, sel_reset);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer setEnabled:](&v3, sel_setEnabled_, a3);
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  if (a3 == 5)
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
    if (-[TSAHyperlinkGestureRecognizer hitRep](self, "hitRep"))
      objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
  }
  v5.receiver = self;
  v5.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer setState:](&v5, sel_setState_, a3);
}

- (id)p_smartFieldForTouch:(id)a3 outRep:(id *)a4
{
  TSDInteractiveCanvasController *icc;
  double v8;
  double v9;
  double v10;
  double v11;
  id result;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[TSDInteractiveCanvasController layoutIfNeeded](self->_icc, "layoutIfNeeded");
  icc = self->_icc;
  objc_msgSend(a3, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](icc, "convertBoundsToUnscaledPoint:");
  v9 = v8;
  v11 = v10;
  result = -[TSDInteractiveCanvasController hitRep:](self->_icc, "hitRep:");
  if (result)
  {
    objc_msgSend(result, "convertNaturalPointFromUnscaledCanvas:", v9, v11);
    v14 = v13;
    v16 = v15;
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:](self->_icc, "hitRep:", v9, v11);
    result = (id)TSUDynamicCast();
    if (result)
    {
      v17 = result;
      result = (id)objc_msgSend(result, "smartFieldAtPoint:", v14, v16);
      if (a4)
      {
        if (result)
          *a4 = v17;
      }
    }
  }
  return result;
}

- (void)p_delayElapsed:(id)a3
{
  self->_wasTapHold = 1;
  -[TSAHyperlinkGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, a3, a4);
  self->_wasTapHold = 0;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  if (!*(_WORD *)&self->_tapEnabled
    || -[TSDInteractiveCanvasController currentlyScrolling](self->_icc, "currentlyScrolling"))
  {
    goto LABEL_3;
  }
  if (!-[TSAHyperlinkGestureRecognizer state](self, "state"))
  {
    if (-[TSAHyperlinkGestureRecognizer numberOfTouches](self, "numberOfTouches") != 1)
      goto LABEL_3;
    v6 = (void *)objc_msgSend(a3, "anyObject");
    objc_msgSend(v6, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
    self->_touchBeginPoint.x = v7;
    self->_touchBeginPoint.y = v8;
    v11 = 0;
    objc_opt_class();
    -[TSAHyperlinkGestureRecognizer p_smartFieldForTouch:outRep:](self, "p_smartFieldForTouch:outRep:", v6, &v11);
    v9 = TSUDynamicCast();
    if (!v9)
    {
LABEL_3:
      -[TSAHyperlinkGestureRecognizer setState:](self, "setState:", 5);
      return;
    }
    v10 = v9;
    -[TSAHyperlinkGestureRecognizer setHitRep:](self, "setHitRep:", v11);
    -[TSAHyperlinkGestureRecognizer setHitField:](self, "setHitField:", v10);
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "startUISessionForHyperlinkField:inRep:", self->_hitField, self->_hitRep);
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "showHyperlinkHighlight");
    if (self->_tapHoldEnabled)
      -[TSAHyperlinkGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_delayElapsed_, v6, 1.0);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, a3, a4);
  v6 = (void *)objc_msgSend(a3, "anyObject");
  v7 = 14.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[TSWPHyperlinkHostRepProtocol isEditing](self->_hitRep, "isEditing"))
  {
    v7 = 0.0;
  }
  objc_msgSend(v6, "locationInView:", -[TSAHyperlinkGestureRecognizer view](self, "view"));
  if (TSDDistance(self->_touchBeginPoint.x, self->_touchBeginPoint.y, v8, v9) > v7
    || -[TSAHyperlinkGestureRecognizer p_smartFieldForTouch:outRep:](self, "p_smartFieldForTouch:outRep:", v6, 0) != self->_hitField)
  {
    -[TSAHyperlinkGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSAHyperlinkGestureRecognizer;
  -[TSAHyperlinkGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (!self->_wasTapHold)
  {
    if (self->_tapEnabled)
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
      objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
      v5 = 3;
    }
    else
    {
      if (!self->_tapHoldEnabled)
        return;
      v5 = 5;
    }
    -[TSAHyperlinkGestureRecognizer setState:](self, "setState:", v5);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (-[TSAHyperlinkGestureRecognizer state](self, "state") != 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSAHyperlinkGestureRecognizer;
    -[TSAHyperlinkGestureRecognizer touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, a3, a4);
    -[TSAHyperlinkGestureRecognizer setState:](self, "setState:", 5);
    objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "hideHyperlinkHighlight");
  }
}

- (BOOL)tapEnabled
{
  return self->_tapEnabled;
}

- (void)setTapEnabled:(BOOL)a3
{
  self->_tapEnabled = a3;
}

- (BOOL)tapHoldEnabled
{
  return self->_tapHoldEnabled;
}

- (void)setTapHoldEnabled:(BOOL)a3
{
  self->_tapHoldEnabled = a3;
}

- (BOOL)wasTapHold
{
  return self->_wasTapHold;
}

- (TSDInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  self->_icc = (TSDInteractiveCanvasController *)a3;
}

- (TSWPHyperlinkHostRepProtocol)hitRep
{
  return self->_hitRep;
}

- (void)setHitRep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (TSWPHyperlinkField)hitField
{
  return self->_hitField;
}

- (void)setHitField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

@end
