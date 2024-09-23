@implementation THWReviewImageAnswerChoiceState

- (THWReviewImageAnswerChoiceState)initWithChoice:(id)a3 questionRep:(id)a4 questionHost:(id)a5
{
  THWReviewImageAnswerChoiceState *v8;
  THWReviewImageAnswerChoiceState *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWReviewImageAnswerChoiceState;
  v8 = -[THWReviewImageAnswerChoiceState init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_questionRep = (THWReviewQuestionRep *)a4;
    v8->_questionHost = (THWReviewQuestionHosting *)a5;
    v8->_choice = (THWReviewChoice *)a3;
    -[THWReviewImageAnswerChoiceState updateRadioState](v9, "updateRadioState");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageAnswerChoiceState;
  -[THWReviewImageAnswerChoiceState dealloc](&v3, "dealloc");
}

- (void)setChoiceState:(int)a3
{
  if (self->_choiceState != a3)
  {
    self->_choiceState = a3;
    -[THWReviewQuestionHosting reviewQuestionInvalidateLayers:](self->_questionHost, "reviewQuestionInvalidateLayers:", self->_questionRep);
  }
}

- (void)setRadioState:(int)a3
{
  if (self->_radioState != a3)
  {
    self->_radioState = a3;
    -[THWReviewQuestionHosting reviewQuestionInvalidateLayers:](self->_questionHost, "reviewQuestionInvalidateLayers:", self->_questionRep);
  }
}

- (void)updateRadioState
{
  -[THWReviewImageAnswerChoiceState setRadioState:](self, "setRadioState:", -[THWReviewQuestionHosting reviewQuestion:radioStateForChoice:pressed:](self->_questionHost, "reviewQuestion:radioStateForChoice:pressed:", self->_questionRep, -[THWReviewImageAnswerChoiceState p_choiceIndex](self, "p_choiceIndex"), self->_pressed));
}

- (void)buttonControlWasPressed:(id)a3
{
  -[THWReviewQuestionHosting reviewQuestion:selectChoice:](self->_questionHost, "reviewQuestion:selectChoice:", self->_questionRep, -[THWReviewImageAnswerChoiceState p_choiceIndex](self, "p_choiceIndex", a3));
}

- (int)buttonControlState:(id)a3
{
  if (-[THWReviewQuestionRep questionState](self->_questionRep, "questionState", a3) == 6)
    return 2;
  else
    return 2 * (-[THWReviewImageAnswerChoiceState choiceState](self, "choiceState") == 1);
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag"))
    return 0;
  else
    return -[THWReviewChoice contentImage](self->_choice, "contentImage");
}

- (void)buttonControlHighlightedDidChange:(id)a3
{
  self->_pressed = objc_msgSend(a3, "highlighted");
  -[THWReviewImageAnswerChoiceState setRadioState:](self, "setRadioState:", -[THWReviewQuestionHosting reviewQuestion:radioStateForChoice:pressed:](self->_questionHost, "reviewQuestion:radioStateForChoice:pressed:", self->_questionRep, -[THWReviewImageAnswerChoiceState p_choiceIndex](self, "p_choiceIndex"), objc_msgSend(a3, "highlighted")));
  -[THWReviewImageAnswerChoiceState p_setImagePressed:forButton:](self, "p_setImagePressed:forButton:", self->_pressed, a3);
}

- (void)p_setImagePressed:(BOOL)a3 forButton:(id)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v6 = objc_msgSend(objc_msgSend(a4, "interactiveCanvasController"), "layerForRep:", a4);
  if (v4)
  {
    if (self->_radioState == 2)
      -[CALayer addButtonShadow](self->_radioButtonLayer, "addButtonShadow");
    objc_msgSend(v6, "frame");
    objc_msgSend(v6, "addPressAnimationFromPoint:scale:", TSDCenterOfRect(v7, v8, v9, v10));
  }
  else
  {
    -[CALayer removeButtonShadow](self->_radioButtonLayer, "removeButtonShadow");
    objc_msgSend(v6, "removePressAnimation");
  }
}

- (void)buttonControl:(id)a3 addAdditionalChildLayersToArray:(id)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v22;
  double v23;
  double v24;
  id v25;
  CALayer *radioButtonLayer;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  if (!self->_radioButtonLayer)
  {
    self->_radioButtonLayer = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer](TSDNoDefaultImplicitActionLayer, "layer");
    -[CALayer setDelegate:](self->_radioButtonLayer, "setDelegate:", objc_msgSend(a3, "interactiveCanvasController"));
    -[CALayer setBounds:](self->_radioButtonLayer, "setBounds:", 0.0, 0.0, 46.0, 46.0);
  }
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerForRep:", a3), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
  v16 = v15;
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v17 = CGRectGetMinX(v36) + 46.0 * 0.5 * v16;
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  v18 = CGRectGetMaxY(v37) + 46.0 * -0.5 * v16;
  -[CALayer position](self->_radioButtonLayer, "position");
  if (v17 != v20 || v18 != v19)
    -[CALayer setPosition:](self->_radioButtonLayer, "setPosition:", v17, v18);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, v16, v16);
  v34 = v35;
  -[CALayer setAffineTransform:](self->_radioButtonLayer, "setAffineTransform:", &v34);
  v22 = -[THWReviewQuestionHosting reviewQuestion:cachedImageNamed:](self->_questionHost, "reviewQuestion:cachedImageNamed:", self->_questionRep, *(&off_42A758[4 * self->_choiceState] + self->_radioState));
  objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
  v24 = v23;
  v25 = objc_msgSend(v22, "CGImageForContentsScale:");
  if (-[CALayer contents](self->_radioButtonLayer, "contents") != v25)
  {
    -[CALayer setContents:](self->_radioButtonLayer, "setContents:", v25);
    -[CALayer setContentsScale:](self->_radioButtonLayer, "setContentsScale:", v24);
  }
  radioButtonLayer = self->_radioButtonLayer;
  if (radioButtonLayer)
  {
    v27 = -[CALayer frame](radioButtonLayer, "frame");
    v29 = v28;
    v31 = v30;
    v32 = TSDFloorForScale(v27);
    -[CALayer setFrame:](self->_radioButtonLayer, "setFrame:", v32, TSDFloorForScale(v33), v29, v31);
    objc_msgSend(a4, "addObject:", self->_radioButtonLayer);
  }
}

- (unint64_t)p_choiceIndex
{
  return (unint64_t)objc_msgSend(objc_msgSend(-[THWReviewQuestionRep questionLayout](self->_questionRep, "questionLayout"), "question"), "indexForChoice:", self->_choice);
}

- (NSString)choiceAccessibilityDescription
{
  return -[THWReviewChoice accessibilityDescription](-[THWReviewImageAnswerChoiceState choice](self, "choice"), "accessibilityDescription");
}

- (BOOL)selected
{
  return -[THWReviewImageAnswerChoiceState radioState](self, "radioState") == 2;
}

- (THWReviewQuestionRep)questionRep
{
  return self->_questionRep;
}

- (THWReviewQuestionHosting)questionHost
{
  return self->_questionHost;
}

- (THWReviewChoice)choice
{
  return self->_choice;
}

- (CALayer)radioButtonLayer
{
  return self->_radioButtonLayer;
}

- (int)choiceState
{
  return self->_choiceState;
}

- (int)radioState
{
  return self->_radioState;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

@end
