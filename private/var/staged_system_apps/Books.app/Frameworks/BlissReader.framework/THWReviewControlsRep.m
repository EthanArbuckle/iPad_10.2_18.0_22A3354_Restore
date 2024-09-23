@implementation THWReviewControlsRep

- (THWReviewControlsRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWReviewControlsRep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsRep;
  result = -[THWReviewControlsRep initWithLayout:canvas:](&v5, "initWithLayout:canvas:", a3, a4);
  if (result)
    result->_checkAnswerButtonDisabled = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsRep;
  -[THWReviewControlsRep dealloc](&v3, "dealloc");
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setPrevButtonHidden:(BOOL)a3
{
  if (self->_prevButtonHidden != a3)
  {
    self->_prevButtonHidden = a3;
    self->_prevButtonHiddenStateChanged = 1;
    objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)setNextButtonHidden:(BOOL)a3
{
  if (self->_nextButtonHidden != a3)
  {
    self->_nextButtonHidden = a3;
    self->_nextButtonHiddenStateChanged = 1;
    objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)setCheckAnswerButtonDisabled:(BOOL)a3
{
  if (self->_checkAnswerButtonDisabled != a3)
  {
    self->_checkAnswerButtonDisabled = a3;
    objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (void)setCheckAnswerButtonState:(int)a3
{
  if (self->_checkAnswerButtonState != a3)
  {
    self->_checkAnswerButtonState = a3;
    objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  id v6;
  unint64_t v7;

  v6 = -[THWControlContainerRep controlHostRep](self, "controlHostRep", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "control:isInteractionEnabledForRep:") & 1) == 0
    || (LODWORD(v7) = objc_msgSend(v6, "control:isInteractionEnabledForRep:", a3, self), (_DWORD)v7))
  {
    v7 = (unint64_t)objc_msgSend(a3, "tag");
    LOBYTE(v7) = v7 > 2 || self->super.TSDContainerRep_opaque[*off_42A660[v7]] == 0;
  }
  return v7;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  if ((unint64_t)objc_msgSend(a3, "tag") <= 2)
  {
    v6 = objc_opt_class(THWButtonControlRep);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
    objc_msgSend(v8, "setDelegate:", self, v7);
  }
}

- (void)buttonControlWasPressed:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  THWReviewControlsDelegate *delegate;
  THWReviewControlsRep *v8;
  id v9;
  THWReviewControlsDelegate *v10;

  v4 = objc_msgSend(a3, "layout");
  v5 = (char *)objc_msgSend(v4, "tag");
  if (v5 == (_BYTE *)&dword_0 + 2)
  {
    if (self->_checkAnswerButtonDisabled)
      return;
    delegate = self->_delegate;
    v8 = self;
    v9 = &dword_0 + 2;
LABEL_11:
    -[THWReviewControlsDelegate reviewControls:buttonPressed:](delegate, "reviewControls:buttonPressed:", v8, v9);
    return;
  }
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    v6 = 297;
  }
  else
  {
    if (v5)
      return;
    v6 = 296;
  }
  if (!self->super.TSDContainerRep_opaque[v6])
  {
    v10 = self->_delegate;
    v9 = objc_msgSend(v4, "tag");
    delegate = v10;
    v8 = self;
    goto LABEL_11;
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = a5;
  v8 = objc_msgSend(a3, "layout");
  v9 = objc_msgSend(-[THWReviewControlsRep layout](self, "layout"), "primaryColor");
  if (!objc_msgSend(v8, "tag"))
  {
    objc_msgSend(-[THWReviewControlsRep layout](self, "layout"), "prevButtonFrame");
    v20 = v19;
    v22 = v21;
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    v15 = v23;
    v16 = v20;
    v17 = v22;
    v18 = 4;
    return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v18, v9, v5, v16, v17, v15);
  }
  if (objc_msgSend(v8, "tag") == (char *)&dword_0 + 1)
  {
    objc_msgSend(-[THWReviewControlsRep layout](self, "layout"), "nextButtonFrame");
    v11 = v10;
    v13 = v12;
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    v15 = v14;
    v16 = v11;
    v17 = v13;
    v18 = 2;
    return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v18, v9, v5, v16, v17, v15);
  }
  return 0;
}

- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3
{
  return 1;
}

- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3
{
  return 0;
}

- (void)p_animateButtonLayer:(id)a3 hide:(BOOL)a4
{
  _BOOL4 v4;
  CABasicAnimation *v6;
  double v7;
  float v8;
  double v9;

  v4 = a4;
  v6 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
  if (v4)
    *(float *)&v7 = 1.0;
  else
    *(float *)&v7 = 0.0;
  if (v4)
    v8 = 0.0;
  else
    v8 = 1.0;
  -[CABasicAnimation setFromValue:](v6, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  *(float *)&v9 = v8;
  -[CABasicAnimation setToValue:](v6, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  -[CABasicAnimation setDuration:](v6, "setDuration:", 0.15);
  -[CABasicAnimation setRemovedOnCompletion:](v6, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v6, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(a3, "addAnimation:forKey:", v6, CFSTR("opacity"));
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  uint64_t v12;
  _BOOL4 animatePrevButton;
  uint64_t v14;
  int v15;
  double v16;
  unsigned int v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  TSUColor *v24;
  void *v25;
  const __CFString *v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v7 = objc_msgSend(a3, "layout");
  objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "viewScale");
  v9 = v8;
  v10 = -[THWReviewControlsRep layout](self, "layout");
  objc_msgSend(a4, "setContentsGravity:", kCAGravityResize);
  if (!objc_msgSend(v7, "tag"))
  {
    if (self->_prevButtonHiddenStateChanged)
    {
      self->_prevButtonHiddenStateChanged = 0;
      v12 = 301;
      animatePrevButton = self->_animatePrevButton;
      v14 = 296;
      goto LABEL_7;
    }
LABEL_19:
    objc_msgSend(a4, "setBorderColor:", objc_msgSend(objc_msgSend(v10, "primaryColor"), "CGColor"));
    return;
  }
  if (objc_msgSend(v7, "tag") == (char *)&dword_0 + 1)
  {
    if (self->_nextButtonHiddenStateChanged)
    {
      self->_nextButtonHiddenStateChanged = 0;
      v12 = 302;
      animatePrevButton = self->_animateNextButton;
      v14 = 297;
LABEL_7:
      v15 = self->super.TSDContainerRep_opaque[v14];
      if (animatePrevButton)
      {
        -[THWReviewControlsRep p_animateButtonLayer:hide:](self, "p_animateButtonLayer:hide:", a4, v15 != 0);
      }
      else
      {
        LODWORD(v11) = 0;
        if (!v15)
          *(float *)&v11 = 1.0;
        objc_msgSend(a4, "setOpacity:", v11);
      }
      self->super.TSDContainerRep_opaque[v12] = 1;
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "tag") == (char *)&dword_0 + 2)
  {
    LODWORD(v16) = 1.0;
    if ((self->_checkAnswerButtonState - 1) <= 2)
    {
      v17 = objc_msgSend(a3, "highlighted", v16);
      LODWORD(v16) = 1.0;
      if (v17)
        *(float *)&v16 = 0.5;
    }
    objc_msgSend(a4, "setOpacity:", v16);
    objc_msgSend(v10, "buttonCornerRadius");
    objc_msgSend(a4, "setCornerRadius:", v9 * v18);
    if (self->_checkAnswerButtonState)
    {
      objc_msgSend(a4, "setBackgroundColor:", 0);
      v19 = v10;
    }
    else
    {
      if (!self->_checkAnswerButtonDisabled)
      {
        objc_msgSend(a4, "setBorderWidth:", 0.0);
        if (objc_msgSend(a3, "highlighted"))
          v30 = 0.5;
        else
          v30 = 1.0;
        objc_msgSend(a4, "setBackgroundColor:", -[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.09, 0.49, 0.98, v30), "CGColor"));
        objc_msgSend(a4, "setBorderColor:", 0);
LABEL_23:
        if (self->_checkAnswerButtonLabel
          || (self->_checkAnswerButtonLabel = objc_alloc_init(THWLabelLayer),
              -[THWLabelLayer setDelegate:](self->_checkAnswerButtonLabel, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance")), -[THWLabelLayer setFontName:](self->_checkAnswerButtonLabel, "setFontName:", objc_msgSend(v10, "buttonFontName")), -[THWLabelLayer setHorizontalAlignment:](self->_checkAnswerButtonLabel, "setHorizontalAlignment:", 1), -[THWLabelLayer setVerticalAlignment:](self->_checkAnswerButtonLabel, "setVerticalAlignment:", 1), self->_checkAnswerButtonLabel))
        {
          objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
          v22 = v21;
          -[THWLabelLayer contentsScale](self->_checkAnswerButtonLabel, "contentsScale");
          if (v23 != v22)
            -[THWLabelLayer setContentsScale:](self->_checkAnswerButtonLabel, "setContentsScale:", v22);
          switch(self->_checkAnswerButtonState)
          {
            case 0:
              -[THWLabelLayer setString:](self->_checkAnswerButtonLabel, "setString:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Check Answer"), &stru_43D7D8, 0));
              if (self->_checkAnswerButtonDisabled)
                v24 = (TSUColor *)objc_msgSend(v10, "disabledPrimaryColor");
              else
                v24 = +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 1.0, 1.0);
              goto LABEL_34;
            case 1:
              v25 = (void *)THBundle();
              v26 = CFSTR("Try Again");
              goto LABEL_33;
            case 2:
              v25 = (void *)THBundle();
              v26 = CFSTR("Clear Answer");
              goto LABEL_33;
            case 3:
              v25 = (void *)THBundle();
              v26 = CFSTR("Start Over");
LABEL_33:
              -[THWLabelLayer setString:](self->_checkAnswerButtonLabel, "setString:", objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_43D7D8, 0));
              v24 = (TSUColor *)objc_msgSend(v10, "primaryColor");
LABEL_34:
              -[THWLabelLayer setTextColor:](self->_checkAnswerButtonLabel, "setTextColor:", v24);
              break;
            default:
              break;
          }
          objc_msgSend(v10, "buttonFontSize");
          v28 = v27;
          objc_msgSend(-[THWReviewControlsRep canvas](self, "canvas"), "viewScale");
          -[THWLabelLayer setFontSize:](self->_checkAnswerButtonLabel, "setFontSize:", v28 * v29);
          objc_msgSend(a4, "bounds");
          -[THWLabelLayer setFrame:](self->_checkAnswerButtonLabel, "setFrame:");
          if (-[THWLabelLayer superlayer](self->_checkAnswerButtonLabel, "superlayer") != a4)
            objc_msgSend(a4, "addSublayer:", self->_checkAnswerButtonLabel);
        }
        return;
      }
      objc_msgSend(a4, "setBackgroundColor:", 0);
      v19 = -[THWReviewControlsRep layout](self, "layout");
    }
    objc_msgSend(a4, "setBorderColor:", objc_msgSend(objc_msgSend(objc_msgSend(v19, "primaryColor"), "colorWithAlphaComponent:", 0.4), "CGColor"));
    objc_msgSend(v10, "buttonStrokeWidth");
    objc_msgSend(a4, "setBorderWidth:", v9 * v20);
    goto LABEL_23;
  }
}

- (THWReviewControlsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWReviewControlsDelegate *)a3;
}

- (BOOL)prevButtonHidden
{
  return self->_prevButtonHidden;
}

- (BOOL)nextButtonHidden
{
  return self->_nextButtonHidden;
}

- (BOOL)checkAnswerButtonDisabled
{
  return self->_checkAnswerButtonDisabled;
}

- (int)checkAnswerButtonState
{
  return self->_checkAnswerButtonState;
}

- (THWLabelLayer)checkAnswerButtonLabel
{
  return self->_checkAnswerButtonLabel;
}

- (BOOL)prevButtonHiddenStateChanged
{
  return self->_prevButtonHiddenStateChanged;
}

- (void)setPrevButtonHiddenStateChanged:(BOOL)a3
{
  self->_prevButtonHiddenStateChanged = a3;
}

- (BOOL)nextButtonHiddenStateChanged
{
  return self->_nextButtonHiddenStateChanged;
}

- (void)setNextButtonHiddenStateChanged:(BOOL)a3
{
  self->_nextButtonHiddenStateChanged = a3;
}

- (BOOL)animatePrevButton
{
  return self->_animatePrevButton;
}

- (void)setAnimatePrevButton:(BOOL)a3
{
  self->_animatePrevButton = a3;
}

- (BOOL)animateNextButton
{
  return self->_animateNextButton;
}

- (void)setAnimateNextButton:(BOOL)a3
{
  self->_animateNextButton = a3;
}

@end
