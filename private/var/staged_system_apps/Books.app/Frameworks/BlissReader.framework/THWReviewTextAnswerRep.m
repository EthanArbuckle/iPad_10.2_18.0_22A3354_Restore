@implementation THWReviewTextAnswerRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerRep;
  -[THWReviewTextAnswerRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateRadioState
{
  -[THWReviewTextAnswerRep setRadioState:](self, "setRadioState:", objc_msgSend(-[THWReviewTextAnswerRep p_questionHost](self, "p_questionHost"), "reviewQuestion:radioStateForChoice:pressed:", -[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep"), -[THWReviewTextAnswerRep p_choiceIndex](self, "p_choiceIndex"), self->_pressed));
}

- (void)setRadioState:(int)a3
{
  if (self->_radioState != a3)
  {
    self->_radioState = a3;
    objc_msgSend(-[THWReviewTextAnswerRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (unint64_t)p_choiceIndex
{
  return (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep"), "questionLayout"), "question"), "indexForChoice:", objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout"), "choice"));
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  CALayer *radioButtonLayer;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;

  v5 = -[THWReviewTextAnswerRep layout](self, "layout");
  v6 = -[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep");
  v7 = -[THWReviewTextAnswerRep p_questionHost](self, "p_questionHost");
  if (!self->_radioButtonLayer)
  {
    self->_radioButtonLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    -[CALayer setDelegate:](self->_radioButtonLayer, "setDelegate:", -[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  v8 = objc_msgSend(v7, "reviewQuestion:cachedImageNamed:", v6, *(&off_42A5E0[4 * self->_state] + self->_radioState));
  -[CALayer setBounds:](self->_radioButtonLayer, "setBounds:", 0.0, 0.0, 46.0, 46.0);
  objc_msgSend(-[THWReviewTextAnswerRep canvas](self, "canvas"), "viewScale");
  v10 = v9;
  objc_msgSend(v5, "labelFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v5, "horizontalOffset");
  v20 = v10 * (v19 + 46.0 * 0.5);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = v16;
  v34.size.height = v18;
  -[CALayer setPosition:](self->_radioButtonLayer, "setPosition:", v20, v10 * CGRectGetMidY(v34));
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v10, v10);
  v32 = v33;
  -[CALayer setAffineTransform:](self->_radioButtonLayer, "setAffineTransform:", &v32);
  objc_msgSend(-[THWReviewTextAnswerRep canvas](self, "canvas"), "contentsScale");
  v22 = v21;
  v23 = objc_msgSend(v8, "CGImageForContentsScale:");
  if (-[CALayer contents](self->_radioButtonLayer, "contents") != v23)
  {
    -[CALayer setContents:](self->_radioButtonLayer, "setContents:", v23);
    -[CALayer setContentsScale:](self->_radioButtonLayer, "setContentsScale:", v22);
  }
  radioButtonLayer = self->_radioButtonLayer;
  if (radioButtonLayer)
  {
    v25 = -[CALayer frame](radioButtonLayer, "frame");
    v27 = v26;
    v29 = v28;
    v30 = TSDFloorForScale(v25);
    -[CALayer setFrame:](self->_radioButtonLayer, "setFrame:", v30, TSDFloorForScale(v31), v27, v29);
    objc_msgSend(a3, "addObject:", self->_radioButtonLayer);
  }
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  return 0;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "gestureKind");
  return v4 == (id)TSWPImmediatePress
      && -[THWReviewTextAnswerRep state](self, "state") != 1
      && objc_msgSend(-[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep"), "questionState") != 6;
}

- (BOOL)handleGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  _BOOL8 v9;
  unsigned int v10;
  uint64_t v11;
  double v12;
  unsigned int v13;
  CGPoint v15;
  CGRect v16;

  objc_msgSend(a3, "naturalLocationForRep:", self);
  v6 = v5;
  v8 = v7;
  -[THWReviewTextAnswerRep naturalBounds](self, "naturalBounds");
  v15.x = v6;
  v15.y = v8;
  v9 = CGRectContainsPoint(v16, v15);
  v10 = objc_msgSend(a3, "gestureState");
  v11 = 0;
  switch(v10)
  {
    case 1u:
      goto LABEL_2;
    case 2u:
      if ((objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController", 0), "canvasView"), "isAncestorScrollViewDragging") & 1) != 0)goto LABEL_10;
      v13 = -[THWReviewTextAnswerRep pressed](self, "pressed");
      -[THWReviewTextAnswerRep setPressed:](self, "setPressed:", v9);
      if (v9 != v13)
      {
        if (v9)
        {
LABEL_2:
          objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout", v11), "horizontalOffset");
          if (v6 < v12 + 47.0)
            v11 = 1;
          else
            v11 = 2;
        }
        else
        {
LABEL_10:
          v11 = 0;
        }
LABEL_11:
        -[THWReviewTextAnswerRep setPressTarget:](self, "setPressTarget:", v11);
      }
      return 1;
    case 3u:
      if (-[THWReviewTextAnswerRep pressed](self, "pressed", 0))
        -[THWReviewTextAnswerRep p_selectAnswer](self, "p_selectAnswer");
      goto LABEL_10;
    case 4u:
    case 5u:
      goto LABEL_11;
    default:
      return 1;
  }
}

- (void)setPressTarget:(int)a3
{
  id v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  int pressTarget;
  CALayer *v15;
  CGFloat v16;
  CALayer *radioButtonLayer;
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  if (self->_pressTarget != a3)
  {
    self->_pressTarget = a3;
    v4 = -[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController");
    v5 = objc_msgSend(v4, "layerForRep:", objc_msgSend(v4, "repForLayout:", objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout"), "textLayout")));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    pressTarget = self->_pressTarget;
    if (pressTarget == 2)
    {
      -[THWReviewTextAnswerRep setPressed:](self, "setPressed:", 1);
      v19.origin.x = v7;
      v19.origin.y = v9;
      v19.size.width = v11;
      v19.size.height = v13;
      v16 = CGRectGetMinX(v19) + 47.0;
      v20.origin.x = v7;
      v20.origin.y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      objc_msgSend(v5, "addPressAnimationFromPoint:scale:", v16, CGRectGetMidY(v20), 0.85);
      radioButtonLayer = self->_radioButtonLayer;
      -[CALayer position](radioButtonLayer, "position");
    }
    else
    {
      if (pressTarget != 1)
      {
        if (!pressTarget)
        {
          -[THWReviewTextAnswerRep setPressed:](self, "setPressed:", 0);
          objc_msgSend(v5, "position");
          objc_msgSend(v5, "addRecoilAnimationFromPoint:hardRebound:", 0);
          v15 = self->_radioButtonLayer;
          -[CALayer position](v15, "position");
          -[CALayer addRecoilAnimationFromPoint:hardRebound:](v15, "addRecoilAnimationFromPoint:hardRebound:", 0);
        }
        goto LABEL_9;
      }
      -[THWReviewTextAnswerRep setPressed:](self, "setPressed:", 1);
      v21.origin.x = v7;
      v21.origin.y = v9;
      v21.size.width = v11;
      v21.size.height = v13;
      v18 = CGRectGetMinX(v21) + 47.0;
      v22.origin.x = v7;
      v22.origin.y = v9;
      v22.size.width = v11;
      v22.size.height = v13;
      objc_msgSend(v5, "addPressAnimationFromPoint:scale:", v18, CGRectGetMidY(v22), 1.17647059);
      radioButtonLayer = self->_radioButtonLayer;
      -[CALayer position](radioButtonLayer, "position");
    }
    -[CALayer addPressAnimationFromPoint:scale:](radioButtonLayer, "addPressAnimationFromPoint:scale:");
LABEL_9:
    objc_msgSend(-[THWReviewTextAnswerRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[THWReviewTextAnswerRep updateRadioState](self, "updateRadioState");
  }
}

- (void)setState:(int)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    objc_msgSend(-[THWReviewTextAnswerRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)p_selectAnswer
{
  id v3;

  v3 = -[THWReviewTextAnswerRep p_questionRep](self, "p_questionRep");
  objc_msgSend(-[THWReviewTextAnswerRep p_questionHost](self, "p_questionHost"), "reviewQuestion:selectChoice:", v3, objc_msgSend(objc_msgSend(objc_msgSend(v3, "questionLayout"), "question"), "indexForChoice:", objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout"), "choice")));
}

- (id)p_answerText
{
  return objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout"), "choice"), "contentStorage"), "stringValue");
}

- (id)p_answerAccessibilityDescription
{
  return objc_msgSend(objc_msgSend(-[THWReviewTextAnswerRep layout](self, "layout"), "choice"), "accessibilityDescription");
}

- (id)p_questionRep
{
  return objc_msgSend(-[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionRep);
}

- (id)p_questionHost
{
  return objc_msgSend(-[THWReviewTextAnswerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWReviewQuestionHosting);
}

- (int)state
{
  return self->_state;
}

- (int)radioState
{
  return self->_radioState;
}

- (CALayer)radioButtonLayer
{
  return self->_radioButtonLayer;
}

- (int)pressTarget
{
  return self->_pressTarget;
}

- (BOOL)pressed
{
  return self->_pressed;
}

@end
