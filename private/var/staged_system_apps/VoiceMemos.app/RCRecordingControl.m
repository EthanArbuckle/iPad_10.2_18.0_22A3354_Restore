@implementation RCRecordingControl

- (CGSize)intrinsicContentSize
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *layoutHelper;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  layoutHelper = self->_layoutHelper;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v4, "intrinsicContentSize");
  -[RCRecordingControlLayoutHelper recordingControlWidthWithLabelIntrinsicWidth:](layoutHelper, "recordingControlWidthWithLabelIntrinsicWidth:");
  v6 = v5;

  -[RCRecordingControlLayoutHelper recordingControlHeight](self->_layoutHelper, "recordingControlHeight");
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setRecordingControlState:(int64_t)a3
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "isInAndromeda");

  -[RCRecordingControl setRecordingControlState:animated:force:](self, "setRecordingControlState:animated:force:", a3, v6 ^ 1, 0);
}

- (double)_labelWidth
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *layoutHelper;
  void *v3;
  double v4;
  double v5;

  layoutHelper = self->_layoutHelper;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v3, "intrinsicContentSize");
  -[RCRecordingControlLayoutHelper paddedLabelWidthWithLabelIntrinsicWidth:](layoutHelper, "paddedLabelWidthWithLabelIntrinsicWidth:");
  v5 = v4;

  return v5;
}

- (void)_styleView
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingControlOuterColor"));
  -[RCRecordingControl setOuterColor:](self, "setOuterColor:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _resolvedRingColorForState:](self, "_resolvedRingColorForState:", -[RCRecordingControl recordingControlState](self, "recordingControlState"))));
  v5 = objc_msgSend(v4, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  objc_msgSend(v6, "setStrokeColor:", v5);

}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  _BOOL8 v9;

  self->_enabled = a3;
  -[RCRecordingControl _syncLongPressGestureRecognizerEnablement](self, "_syncLongPressGestureRecognizerEnablement");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  -[RCRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  -[RCRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl pauseShapeLayer](self, "pauseShapeLayer"));
  -[RCRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v7, "alpha");
  v9 = v8 != 0.0;

  -[RCRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", v9, 0);
}

- (void)updateLayerAlphaIfVisible:(id)a3
{
  float v4;
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "opacity");
  if (v4 != 0.0)
  {
    -[RCRecordingControl layerAlpha](self, "layerAlpha");
    *(float *)&v5 = v5;
    objc_msgSend(v6, "setOpacity:", v5);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCRecordingControl;
  -[RCRecordingControl layoutSubviews](&v3, "layoutSubviews");
  -[RCRecordingControl resolveColors](self, "resolveColors");
}

- (void)resolveColors
{
  UIColor *v3;
  UIColor *resolvedInnerColor;
  UIColor *v5;
  UIColor *resolvedInnerColorResume;
  UIColor *v7;
  UIColor *resolvedOuterColor;
  UIColor *v9;
  UIColor *resolvedOuterColorResume;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl traitCollection](self, "traitCollection"));
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self->_innerColor, "resolvedColorWithTraitCollection:", v11));
  resolvedInnerColor = self->_resolvedInnerColor;
  self->_resolvedInnerColor = v3;

  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self->_innerColorResume, "resolvedColorWithTraitCollection:", v11));
  resolvedInnerColorResume = self->_resolvedInnerColorResume;
  self->_resolvedInnerColorResume = v5;

  v7 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self->_outerColor, "resolvedColorWithTraitCollection:", v11));
  resolvedOuterColor = self->_resolvedOuterColor;
  self->_resolvedOuterColor = v7;

  v9 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](self->_outerColorResume, "resolvedColorWithTraitCollection:", v11));
  resolvedOuterColorResume = self->_resolvedOuterColorResume;
  self->_resolvedOuterColorResume = v9;

}

- (void)layoutSublayersOfLayer:(id)a3
{
  CGPath *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingControl;
  -[RCRecordingControl layoutSublayersOfLayer:](&v6, "layoutSublayersOfLayer:", a3);
  v4 = -[RCRecordingControl _pausePath](self, "_pausePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl pauseShapeLayer](self, "pauseShapeLayer"));
  objc_msgSend(v5, "setPath:", v4);

  -[RCRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", 0, self->_recordingControlState);
}

- (CAShapeLayer)pauseShapeLayer
{
  return self->_pauseShapeLayer;
}

- (void)_commonInit
{
  void *v3;
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *v4;
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *layoutHelper;
  double v6;
  double v7;
  double v8;
  double v9;
  UIColor *v10;
  UIColor *fontColor;
  UIColor *v12;
  UIColor *innerColor;
  UIColor *v14;
  UIColor *fontColorResume;
  UIColor *v16;
  UIColor *innerColorResume;
  UIColor *v18;
  UIColor *outerColorResume;
  double v20;
  void *v21;
  CAShapeLayer *v22;
  id v23;
  CAShapeLayer *v24;
  CAShapeLayer *v25;
  double v26;
  UILabel *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  id v34;

  -[RCRecordingControl setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = -[RCRecordingControlLayoutHelper initWithDiameter:]([_TtC10VoiceMemos30RCRecordingControlLayoutHelper alloc], "initWithDiameter:", self->_diameter);
  layoutHelper = self->_layoutHelper;
  self->_layoutHelper = v4;

  -[RCRecordingControlLayoutHelper recordingControlOuterRingThickness](self->_layoutHelper, "recordingControlOuterRingThickness");
  self->_outerRingThickness = v6;
  -[RCRecordingControlLayoutHelper recordingControlOuterRingGap](self->_layoutHelper, "recordingControlOuterRingGap");
  self->_outerRingGap = v7;
  -[RCRecordingControlLayoutHelper recordingControlInnerSquareWidth](self->_layoutHelper, "recordingControlInnerSquareWidth");
  self->_innerSquareWidth = v8;
  -[RCRecordingControlLayoutHelper recordingControlSquareCornerRadius](self->_layoutHelper, "recordingControlSquareCornerRadius");
  self->_innerSquareCornerRadius = v9;
  v10 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlFontColor"));
  fontColor = self->_fontColor;
  self->_fontColor = v10;

  v12 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlInnerColor"));
  innerColor = self->_innerColor;
  self->_innerColor = v12;

  v14 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlFontColorResume"));
  fontColorResume = self->_fontColorResume;
  self->_fontColorResume = v14;

  v16 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlInnerColorResume"));
  innerColorResume = self->_innerColorResume;
  self->_innerColorResume = v16;

  v18 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlOuterColorResume"));
  outerColorResume = self->_outerColorResume;
  self->_outerColorResume = v18;

  -[RCRecordingControlLayoutHelper recordingControlPauseStrokeCornerRadius](self->_layoutHelper, "recordingControlPauseStrokeCornerRadius");
  self->_pauseStrokeCornerRadius = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl layer](self, "layer"));
  if (-[RCRecordingControl _hasOuterRingLayer](self, "_hasOuterRingLayer"))
  {
    v22 = objc_opt_new(CAShapeLayer);
    -[RCRecordingControl setOuterRingLayer:](self, "setOuterRingLayer:", v22);
    -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", -[UIColor CGColor](self->_outerColor, "CGColor"));
    -[CAShapeLayer setLineWidth:](v22, "setLineWidth:", self->_outerRingThickness);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setFillColor:](v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

    objc_msgSend(v21, "addSublayer:", v22);
  }
  v24 = objc_opt_new(CAShapeLayer);
  -[RCRecordingControl setInnerStateLayer:](self, "setInnerStateLayer:", v24);
  -[CAShapeLayer setFillColor:](v24, "setFillColor:", -[UIColor CGColor](self->_innerColor, "CGColor"));
  -[CAShapeLayer setPath:](v24, "setPath:", -[RCRecordingControl _circlePath](self, "_circlePath"));
  objc_msgSend(v21, "addSublayer:", v24);
  v25 = objc_opt_new(CAShapeLayer);
  -[RCRecordingControl setPauseShapeLayer:](self, "setPauseShapeLayer:", v25);
  -[CAShapeLayer setFillColor:](v25, "setFillColor:", -[UIColor CGColor](self->_innerColor, "CGColor"));
  -[CAShapeLayer setPath:](v25, "setPath:", -[RCRecordingControl _pausePath](self, "_pausePath"));
  LODWORD(v26) = 0;
  -[CAShapeLayer setOpacity:](v25, "setOpacity:", v26);
  objc_msgSend(v21, "addSublayer:", v25);
  v27 = objc_opt_new(UILabel);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("APPEND"), &stru_1001B2BC0, 0));
  -[UILabel setText:](v27, "setText:", v29);

  -[RCRecordingControl setNamedStateLabel:](self, "setNamedStateLabel:", v27);
  -[RCRecordingControl addSubview:](self, "addSubview:", v27);
  -[UILabel alignCenterToCenterOfView:](v27, "alignCenterToCenterOfView:", self);
  -[UILabel setTextColor:](v27, "setTextColor:", self->_fontColor);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingControlTextFont"));
  -[UILabel setFont:](v27, "setFont:", v30);

  v31 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_handleUserTouch:");
  -[RCRecordingControl addGestureRecognizer:](self, "addGestureRecognizer:", v31);
  -[RCRecordingControl setLongPressRecognizer:](self, "setLongPressRecognizer:", v31);
  objc_msgSend(v31, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v31, "setDelegate:", self);
  v32 = OSLogForCategory(kVMLogCategoryDefault);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    sub_10010C214((uint64_t)self, v33);

  -[RCRecordingControl resolveColors](self, "resolveColors");
  -[RCRecordingControl _styleView](self, "_styleView");
  self->_enabled = 1;
  v34 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[RCRecordingControl addInteraction:](self, "addInteraction:", v34);

}

- (void)_updateVisibilityOfNamedStateLabel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[6];
  BOOL v12;

  v4 = a4;
  v5 = a3;
  -[RCRecordingControl layerAlpha](self, "layerAlpha");
  v8 = v7;
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v9, "recordingControlAnimationDuration");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100061278;
    v11[3] = &unk_1001AC5E0;
    v11[4] = self;
    v12 = v5;
    *(double *)&v11[5] = v8;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11);

  }
  else
  {
    if (!v5)
      v8 = 0.0;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
    objc_msgSend(v10, "setAlpha:", v8);

  }
}

- (UILabel)namedStateLabel
{
  return self->_namedStateLabel;
}

- (void)_updateVisualState:(BOOL)a3 fromState:(int64_t)a4
{
  _BOOL8 v5;
  CGPath *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  CGPath *v12;
  CGPath *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int64_t recordingControlState;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  id v31;
  id v32;
  id v33;

  v5 = a3;
  v7 = -[RCRecordingControl _ringPathForState:](self, "_ringPathForState:", self->_recordingControlState);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _resolvedRingColorForState:](self, "_resolvedRingColorForState:", self->_recordingControlState)));
  v9 = objc_msgSend(v8, "CGColor");

  -[RCRecordingControl _ringOpacityForState:](self, "_ringOpacityForState:", self->_recordingControlState);
  v11 = v10;
  v12 = -[RCRecordingControl _fillPathAnimateStartForState:fromState:](self, "_fillPathAnimateStartForState:fromState:", self->_recordingControlState, a4);
  v13 = -[RCRecordingControl _fillPathAnimateEndForState:fromState:](self, "_fillPathAnimateEndForState:fromState:", self->_recordingControlState, a4);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _resolvedFillColorForState:](self, "_resolvedFillColorForState:", self->_recordingControlState)));
  v15 = objc_msgSend(v14, "CGColor");

  v32 = v9;
  if (-[RCRecordingControl pressed](self, "pressed"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v16, "recordingControlAlphaWhenPressed");
    v18 = v17;

  }
  else
  {
    -[RCRecordingControl layerAlpha](self, "layerAlpha");
    v18 = v19;
  }
  v33 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _buttonTextForState:](self, "_buttonTextForState:", self->_recordingControlState));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _textColorForState:](self, "_textColorForState:", self->_recordingControlState));
  recordingControlState = self->_recordingControlState;
  if (recordingControlState != 5 && recordingControlState)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _accessibilityLabelTextForState:](self, "_accessibilityLabelTextForState:", self->_recordingControlState));
    -[RCRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v22);

  }
  else
  {
    -[RCRecordingControl setRecordAccessibilityLabel](self, "setRecordAccessibilityLabel");
  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  objc_msgSend(v23, "setPath:animated:", v7, v5);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  objc_msgSend(v24, "setStrokeColor:animated:", v32, v5);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  *(float *)&v26 = v11;
  objc_msgSend(v25, "setOpacity:animated:", v5, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  objc_msgSend(v27, "setPath:fromPath:animated:", v13, v12, v5);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  objc_msgSend(v28, "setFillColor:animated:", v15, v5);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  *(float *)&v30 = v18;
  objc_msgSend(v29, "setOpacity:animated:", v5, v30);

  if (a4 == 1 || recordingControlState == 1)
    -[RCRecordingControl crossfadePauseLayer:animated:](self, "crossfadePauseLayer:animated:", recordingControlState == 1, v5);
  v31 = v33;
  if (v33)
  {
    -[RCRecordingControl crossfadeText:color:animated:](self, "crossfadeText:color:animated:", v33, v20, v5);
    v31 = v33;
    if (a4 == 1)
    {
      -[RCRecordingControl fadeOutPauseAndInText:](self, "fadeOutPauseAndInText:", v5);
      v31 = v33;
    }
  }
  -[RCRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", v31 != 0, v5);
  +[CATransaction commit](CATransaction, "commit");

}

- (double)layerAlpha
{
  unsigned int v2;
  double result;

  v2 = -[RCRecordingControl enabled](self, "enabled");
  result = 0.5;
  if (v2)
    return 1.0;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (CAShapeLayer)outerRingLayer
{
  return self->_outerRingLayer;
}

- (CAShapeLayer)innerStateLayer
{
  return self->_innerStateLayer;
}

- (CGPath)_fillPathForState:(int64_t)a3
{
  if (a3 == 2)
    return -[RCRecordingControl _squarePath](self, "_squarePath");
  if (a3 == 1)
    return -[RCRecordingControl _microCirclePath](self, "_microCirclePath");
  if (a3)
    return -[RCRecordingControl _labelLozengePath](self, "_labelLozengePath");
  return -[RCRecordingControl _circlePath](self, "_circlePath");
}

- (CGPath)_circlePath
{
  -[RCRecordingControl outerRingGap](self, "outerRingGap");
  return -[RCRecordingControl _circlePath:](self, "_circlePath:");
}

- (double)outerRingGap
{
  return self->_outerRingGap;
}

- (void)setRecordAccessibilityLabel
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSAttributedStringKey v12;
  const __CFString *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  if (objc_msgSend(v3, "count")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0)),
        v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("en")),
        v4,
        v5))
  {
    v6 = objc_alloc((Class)NSMutableAttributedString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECORD"), &stru_1001B2BC0, 0));
    v9 = objc_msgSend(v6, "initWithString:", v8);

    v12 = UIAccessibilitySpeechAttributeIPANotation;
    v13 = CFSTR("ɻɪ.ˈkwɔɻd");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v9, "setAttributes:range:", v10, 0, 6);

    -[RCRecordingControl setAccessibilityAttributedLabel:](self, "setAccessibilityAttributedLabel:", v9);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RECORD"), &stru_1001B2BC0, 0));
    -[RCRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v11);

  }
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (id)_textColorForState:(int64_t)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 4:
    case 6:
      v3 = 32;
      goto LABEL_5;
    case 7:
    case 9:
      v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl fontColor](self, "fontColor"));
      break;
    default:
      v3 = 24;
LABEL_5:
      v4 = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
  }
  return v4;
}

- (CGPath)_ringPathForState:(int64_t)a3 includingStrokeThickeness:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return -[RCRecordingControl _ringLozengePath:](self, "_ringLozengePath:", a4);
  else
    return -[RCRecordingControl _ringPath:](self, "_ringPath:", a4);
}

- (CGPath)_ringPathForState:(int64_t)a3
{
  return -[RCRecordingControl _ringPathForState:includingStrokeThickeness:](self, "_ringPathForState:includingStrokeThickeness:", a3, 0);
}

- (CGPath)_ringPath:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPath *v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  -[RCRecordingControl frame](self, "frame");
  v7 = v6;
  v8 = v6 * 0.5;
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v6);
  objc_msgSend(v5, "setPosition:", v8, v8);
  if (v3)
  {
    -[RCRecordingControl outerRingThickness](self, "outerRingThickness");
    v7 = v7 + v9;
  }
  v10 = -[RCRecordingControl _ringLozengePathWithHeight:extraWidth:](self, "_ringLozengePathWithHeight:extraWidth:", v7, 0.0);

  return v10;
}

- (double)_ringOpacityForState:(int64_t)a3
{
  double result;

  if ((unint64_t)(a3 - 7) < 4)
    return 0.0;
  -[RCRecordingControl layerAlpha](self, "layerAlpha");
  return result;
}

- (CGPath)_ringLozengePathWithHeight:(double)a3 extraWidth:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  CGPath *v17;

  -[RCRecordingControl bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[RCRecordingControl bounds](self, "bounds");
  v10 = v9 * 0.5;
  v11 = a4 * 0.5;
  v12 = v8 - a4 * 0.5;
  v13 = v11 + v8;
  v14 = a3 * 0.5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v12, v9 * 0.5, v14, 4.71238898, 1.57079633));
  objc_msgSend(v15, "addLineToPoint:", v13, v14 + v10);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v13, v10, v14, 1.57079633, 4.71238898);
  objc_msgSend(v15, "addLineToPoint:", v12, v10 - v14);
  v16 = objc_retainAutorelease(v15);
  v17 = (CGPath *)objc_msgSend(v16, "CGPath");

  return v17;
}

- (id)_resolvedRingColorForState:(int64_t)a3
{
  int *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v3 = &OBJC_IVAR___RCRecordingControl__resolvedOuterColorResume;
  else
    v3 = &OBJC_IVAR___RCRecordingControl__resolvedOuterColor;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (id)_resolvedFillColorForState:(int64_t)a3
{
  int *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v3 = &OBJC_IVAR___RCRecordingControl__resolvedInnerColorResume;
  else
    v3 = &OBJC_IVAR___RCRecordingControl__resolvedInnerColor;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_pausePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  CGPath *v17;

  -[RCRecordingControl _getSquarePathPosition](self, "_getSquarePathPosition");
  v4 = v3;
  v6 = v5;
  -[RCRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v8 = v7;
  -[RCRecordingControlLayoutHelper recordingControlPauseGap](self->_layoutHelper, "recordingControlPauseGap");
  v10 = (v8 - v9) * 0.5;
  v11 = v9 + v4 + v10;
  -[RCRecordingControl pauseStrokeCornerRadius](self, "pauseStrokeCornerRadius");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v10, v8, v12));
  -[RCRecordingControl pauseStrokeCornerRadius](self, "pauseStrokeCornerRadius");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v6, v10, v8, v14));
  objc_msgSend(v13, "appendPath:", v15);
  v16 = objc_retainAutorelease(v13);
  v17 = (CGPath *)objc_msgSend(v16, "CGPath");

  return v17;
}

- (double)pauseStrokeCornerRadius
{
  return self->_pauseStrokeCornerRadius;
}

- (CGPoint)_getSquarePathPosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[RCRecordingControl frame](self, "frame");
  v4 = v3;
  -[RCRecordingControl frame](self, "frame");
  v6 = v5;
  -[RCRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v8 = (v4 - v7) * 0.5;
  -[RCRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v10 = (v6 - v9) * 0.5;
  v11 = v8;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)innerSquareWidth
{
  return self->_innerSquareWidth;
}

- (CGPath)_circlePath:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGPath *v12;

  -[RCRecordingControl frame](self, "frame");
  v6 = v5;
  -[RCRecordingControl outerRingThickness](self, "outerRingThickness");
  v8 = v7;
  v9 = v6 - v7 - a3;
  -[RCRecordingControl _xInset](self, "_xInset");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3 * 0.5 + v10 + v8 * 0.5, a3 * 0.5 + v8 * 0.5, v9, v9, v9 * 0.5)));
  v12 = (CGPath *)objc_msgSend(v11, "CGPath");

  return v12;
}

- (double)outerRingThickness
{
  return self->_outerRingThickness;
}

- (double)_xInset
{
  double v3;
  double v4;
  double v5;

  -[RCRecordingControl frame](self, "frame");
  v4 = v3;
  -[RCRecordingControl frame](self, "frame");
  return (v4 - v5) * 0.5;
}

- (CGPath)_fillPathAnimateStartForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1)
    return -[RCRecordingControl _squarePath](self, "_squarePath", a3);
  else
    return -[RCRecordingControl _fillPathForState:](self, "_fillPathForState:", a4);
}

- (CGPath)_fillPathAnimateEndForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1)
    return -[RCRecordingControl _squarePath](self, "_squarePath");
  else
    return -[RCRecordingControl _fillPathForState:](self, "_fillPathForState:");
}

- (id)_buttonTextForState:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = 0;
  switch(a3)
  {
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("REPLACE");
      goto LABEL_5;
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("RESUME");
      goto LABEL_5;
    case 6:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("INSERT");
LABEL_5:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1001B2BC0, 0));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedUppercaseString"));

      goto LABEL_11;
    case 7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v8;
      v9 = CFSTR("DONE");
      goto LABEL_10;
    case 8:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v8;
      v9 = CFSTR("SAVE");
      goto LABEL_10;
    case 9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v8;
      v9 = CFSTR("UNLOCK");
      goto LABEL_10;
    case 10:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v8;
      v9 = CFSTR("CANCEL");
LABEL_10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1001B2BC0, 0));
LABEL_11:

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)setRecordingControlState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  int64_t recordingControlState;

  recordingControlState = self->_recordingControlState;
  if (a5 || recordingControlState != a3)
  {
    self->_recordingControlState = a3;
    -[RCRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", a4, recordingControlState);
  }
}

- (void)setPauseShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pauseShapeLayer, a3);
}

- (void)setOuterRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerRingLayer, a3);
}

- (void)setOuterColor:(id)a3
{
  objc_storeStrong((id *)&self->_outerColor, a3);
}

- (void)setNamedStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_namedStateLabel, a3);
}

- (void)setLongPressRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressRecognizer, a3);
}

- (void)setInnerStateLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerStateLayer, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)recordingControlState
{
  return self->_recordingControlState;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (RCRecordingControl)initWithDiameter:(double)a3
{
  RCRecordingControl *v4;
  RCRecordingControl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCRecordingControl;
  v4 = -[RCRecordingControl initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_diameter = a3;
    -[RCRecordingControl _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (double)diameter
{
  return self->_diameter;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_syncLongPressGestureRecognizerEnablement
{
  _BOOL8 v3;
  id v4;

  if (-[RCRecordingControl enabled](self, "enabled"))
    v3 = !self->_longPressBeingThrottled;
  else
    v3 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl longPressRecognizer](self, "longPressRecognizer"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)_hasOuterRingLayer
{
  return 1;
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[RCRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", 1, self->_recordingControlState);
  }
}

- (void)setInnerColor:(id)a3
{
  objc_storeStrong((id *)&self->_innerColor, a3);
}

- (CGPath)_interactionPath
{
  return -[RCRecordingControl _ringPathForState:includingStrokeThickeness:](self, "_ringPathForState:includingStrokeThickeness:", -[RCRecordingControl recordingControlState](self, "recordingControlState"), 1);
}

- (id)_accessibilityLabelTextForState:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("RECORD");
      goto LABEL_14;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("PAUSE");
      goto LABEL_14;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("STOP");
      goto LABEL_14;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("REPLACE");
      goto LABEL_14;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("RESUME");
      goto LABEL_14;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("BUSY");
      goto LABEL_14;
    case 6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("INSERT");
      goto LABEL_14;
    case 7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("DONE");
      goto LABEL_14;
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SAVE");
      goto LABEL_14;
    case 9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("UNLOCK");
      goto LABEL_14;
    case 10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("CANCEL");
LABEL_14:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (void)crossfadePauseLayer:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  double v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  v4 = a4;
  v5 = a3;
  -[RCRecordingControl layerAlpha](self, "layerAlpha");
  v8 = v7;
  if (v5)
    v9 = v8;
  else
    v9 = 0.0;
  if (v5)
    v10 = 0.0;
  else
    v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl pauseShapeLayer](self, "pauseShapeLayer"));
  *(float *)&v12 = v9;
  objc_msgSend(v11, "setOpacity:animated:", v4, v12);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  *(float *)&v13 = v10;
  objc_msgSend(v14, "setOpacity:animated:", v4, v13);

}

- (void)fadeOutPauseAndInText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl pauseShapeLayer](self, "pauseShapeLayer"));
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setOpacity:animated:", v3, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  objc_msgSend(v7, "setPath:animated:", -[RCRecordingControl _labelLozengePath](self, "_labelLozengePath"), v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl innerStateLayer](self, "innerStateLayer"));
  -[RCRecordingControl layerAlpha](self, "layerAlpha");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "setOpacity:animated:", v3, v9);

  -[RCRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", 1, v3);
}

- (void)crossfadeText:(id)a3 color:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    objc_msgSend(v9, "setTimingFunction:", v10);

    objc_msgSend(v9, "setType:", kCATransitionFade);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v11, "recordingControlAnimationDuration");
    objc_msgSend(v9, "setDuration:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v13, "addAnimation:forKey:", v9, CFSTR("kCATransitionFade"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v14, "setText:", v16);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v15, "setTextColor:", v8);

  -[RCRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v16);
}

- (CGPath)_ringLozengePath:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  double v14;
  CGPath *v15;

  v3 = a3;
  -[RCRecordingControl _labelWidth](self, "_labelWidth");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl outerRingLayer](self, "outerRingLayer"));
  -[RCRecordingControl frame](self, "frame");
  v9 = v8;
  v10 = v8 * 0.5;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v8);
  objc_msgSend(v7, "setPosition:", v10, v10);
  if (v3)
  {
    v11 = -[RCRecordingControl _hasOuterRingLayer](self, "_hasOuterRingLayer");
    -[RCRecordingControl outerRingThickness](self, "outerRingThickness");
    v13 = v12;
    if (v11)
    {
      v9 = v9 + v12;
    }
    else
    {
      -[RCRecordingControl outerRingGap](self, "outerRingGap");
      v9 = v9 - (v13 + v14);
    }
  }
  v15 = -[RCRecordingControl _ringLozengePathWithHeight:extraWidth:](self, "_ringLozengePathWithHeight:extraWidth:", v9, v6);

  return v15;
}

- (CGPath)_microCirclePath
{
  double v3;
  double v4;
  double v5;

  -[RCRecordingControl frame](self, "frame");
  v4 = v3;
  -[RCRecordingControl outerRingThickness](self, "outerRingThickness");
  return -[RCRecordingControl _circlePath:](self, "_circlePath:", v4 - v5 + -0.01);
}

- (CGPath)_squarePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGPath *v11;

  -[RCRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v4 = v3;
  -[RCRecordingControl _getSquarePathPosition](self, "_getSquarePathPosition");
  v6 = v5;
  v8 = v7;
  -[RCRecordingControl innerSquareCornerRadius](self, "innerSquareCornerRadius");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v4, v4, v9)));
  v11 = (CGPath *)objc_msgSend(v10, "CGPath");

  return v11;
}

- (CGPath)_labelLozengePath
{
  _TtC10VoiceMemos30RCRecordingControlLayoutHelper *layoutHelper;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGPath *v14;

  -[RCRecordingControl frame](self, "frame");
  -[RCRecordingControl frame](self, "frame");
  layoutHelper = self->_layoutHelper;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl namedStateLabel](self, "namedStateLabel"));
  objc_msgSend(v4, "intrinsicContentSize");
  -[RCRecordingControlLayoutHelper labelLozengeRectWithLabelIntrinsicWidth:recordingControlCenterPoint:](layoutHelper, "labelLozengeRectWithLabelIntrinsicWidth:recordingControlCenterPoint:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v12)));
  v14 = (CGPath *)objc_msgSend(v13, "CGPath");

  return v14;
}

- (void)_handleUserTouch:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  char *v9;
  RCRecordingControl *v10;
  _BOOL8 v11;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = (char *)objc_msgSend(v4, "state");

  if ((unint64_t)(v9 - 1) < 2)
  {
    v11 = -[RCRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8);
    v10 = self;
LABEL_6:
    -[RCRecordingControl setPressed:](v10, "setPressed:", v11);
    return;
  }
  if (v9 != (char *)3)
  {
    if (v9 != (char *)4)
      return;
    v10 = self;
    v11 = 0;
    goto LABEL_6;
  }
  -[RCRecordingControl setPressed:](self, "setPressed:", 0);
  if (-[RCRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8))
    -[RCRecordingControl _processControlActuation](self, "_processControlActuation");
}

- (BOOL)_isInsideForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[RCRecordingControl bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)_processControlActuation
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];
  id v6;
  id location;

  self->_longPressBeingThrottled = 1;
  -[RCRecordingControl _syncLongPressGestureRecognizerEnablement](self, "_syncLongPressGestureRecognizerEnablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl delegate](self, "delegate"));
  objc_msgSend(v3, "controlActivated:", self);

  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061724;
  block[3] = &unk_1001AC608;
  block[4] = self;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unsigned __int8 v10;
  objc_class *v11;
  NSString *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingControl longPressRecognizer](self, "longPressRecognizer"));

  if (v8 == v7)
  {
    v11 = (objc_class *)objc_opt_class(v6, v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10 = objc_msgSend(v13, "isEqualToString:", CFSTR("_UIPassthroughScrollGestureRecognizer"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  double v14;
  double v15;
  CGPoint v17;
  CGRect BoundingBox;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  BoundingBox = CGPathGetBoundingBox(-[RCRecordingControl _ringPathForState:](self, "_ringPathForState:", -[RCRecordingControl recordingControlState](self, "recordingControlState")));
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v13, "recordingControlExtraHitOutset");
  v15 = v14;

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v20 = CGRectInset(v19, -v15, -v15);
  v17.x = v6;
  v17.y = v8;
  return CGRectContainsPoint(v20, v17);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCRecordingControl;
  return UIAccessibilityTraitStartsMediaSession | -[RCRecordingControl accessibilityTraits](&v3, "accessibilityTraits") | UIAccessibilityTraitButton;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect BoundingBox;
  CGRect result;

  BoundingBox = CGPathGetBoundingBox(-[RCRecordingControl _interactionPath](self, "_interactionPath"));
  -[RCRecordingControl convertRect:toView:](self, "convertRect:toView:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_accessibilityBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[RCRecordingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[RCRecordingControl _xInset](self, "_xInset");
  v12 = v11;
  if (((unint64_t)-[RCRecordingControl recordingControlState](self, "recordingControlState") | 2) == 2)
  {
    v8 = v8 + v12 * -2.0;
    v4 = v12;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityPath
{
  void *v3;
  CGPath *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  const CGPath *v14;
  CGAffineTransform v16;

  if (((unint64_t)-[RCRecordingControl recordingControlState](self, "recordingControlState") | 2) == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl _accessibilityCirclePathBasedOnBoundsWidth](self, "_accessibilityCirclePathBasedOnBoundsWidth"));
  }
  else
  {
    v4 = -[RCRecordingControl _ringPathForState:](self, "_ringPathForState:", -[RCRecordingControl recordingControlState](self, "recordingControlState"));
    -[RCRecordingControl frame](self, "frame");
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingControl superview](self, "superview"));
    objc_msgSend(v9, "convertPoint:toView:", 0, v6, v8);
    v11 = v10;
    v13 = v12;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v11, v13);
    v14 = CGPathCreateMutableCopyByTransformingPath(v4, &v16);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", v14));
    CGPathRelease(v14);
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGRect BoundingBox;

  BoundingBox = CGPathGetBoundingBox(-[RCRecordingControl _interactionPath](self, "_interactionPath", a3, a4, a5));
  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", -[RCRecordingControl _interactionPath](self, "_interactionPath")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parameters"));
  objc_msgSend(v7, "setVisiblePath:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerLiftEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v8, 0));

  return v9;
}

- (UIColor)fontColor
{
  return self->_fontColor;
}

- (void)setFontColor:(id)a3
{
  objc_storeStrong((id *)&self->_fontColor, a3);
}

- (UIColor)fontColorResume
{
  return self->_fontColorResume;
}

- (void)setFontColorResume:(id)a3
{
  objc_storeStrong((id *)&self->_fontColorResume, a3);
}

- (UIColor)innerColor
{
  return self->_innerColor;
}

- (UIColor)outerColor
{
  return self->_outerColor;
}

- (UIColor)innerColorResume
{
  return self->_innerColorResume;
}

- (void)setInnerColorResume:(id)a3
{
  objc_storeStrong((id *)&self->_innerColorResume, a3);
}

- (UIColor)outerColorResume
{
  return self->_outerColorResume;
}

- (void)setOuterColorResume:(id)a3
{
  objc_storeStrong((id *)&self->_outerColorResume, a3);
}

- (RCRecordingControlDelegate)delegate
{
  return (RCRecordingControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIColor)resolvedInnerColor
{
  return self->_resolvedInnerColor;
}

- (void)setResolvedInnerColor:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedInnerColor, a3);
}

- (UIColor)resolvedOuterColor
{
  return self->_resolvedOuterColor;
}

- (void)setResolvedOuterColor:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedOuterColor, a3);
}

- (UIColor)resolvedInnerColorResume
{
  return self->_resolvedInnerColorResume;
}

- (void)setResolvedInnerColorResume:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedInnerColorResume, a3);
}

- (UIColor)resolvedOuterColorResume
{
  return self->_resolvedOuterColorResume;
}

- (void)setResolvedOuterColorResume:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedOuterColorResume, a3);
}

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)layoutHelper
{
  return self->_layoutHelper;
}

- (void)setLayoutHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutHelper, a3);
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (void)setOuterRingThickness:(double)a3
{
  self->_outerRingThickness = a3;
}

- (void)setOuterRingGap:(double)a3
{
  self->_outerRingGap = a3;
}

- (void)setInnerSquareWidth:(double)a3
{
  self->_innerSquareWidth = a3;
}

- (double)innerSquareCornerRadius
{
  return self->_innerSquareCornerRadius;
}

- (void)setInnerSquareCornerRadius:(double)a3
{
  self->_innerSquareCornerRadius = a3;
}

- (void)setPauseStrokeCornerRadius:(double)a3
{
  self->_pauseStrokeCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutHelper, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_namedStateLabel, 0);
  objc_storeStrong((id *)&self->_resolvedOuterColorResume, 0);
  objc_storeStrong((id *)&self->_resolvedInnerColorResume, 0);
  objc_storeStrong((id *)&self->_resolvedOuterColor, 0);
  objc_storeStrong((id *)&self->_resolvedInnerColor, 0);
  objc_storeStrong((id *)&self->_pauseShapeLayer, 0);
  objc_storeStrong((id *)&self->_innerStateLayer, 0);
  objc_storeStrong((id *)&self->_outerRingLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outerColorResume, 0);
  objc_storeStrong((id *)&self->_innerColorResume, 0);
  objc_storeStrong((id *)&self->_outerColor, 0);
  objc_storeStrong((id *)&self->_innerColor, 0);
  objc_storeStrong((id *)&self->_fontColorResume, 0);
  objc_storeStrong((id *)&self->_fontColor, 0);
}

@end
