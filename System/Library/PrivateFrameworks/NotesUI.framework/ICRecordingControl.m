@implementation ICRecordingControl

- (void)setRecordingControlState:(int64_t)a3
{
  -[ICRecordingControl setRecordingControlState:animated:force:](self, "setRecordingControlState:animated:force:", a3, 1, 0);
}

- (void)setRecordingControlState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  int64_t recordingControlState;

  recordingControlState = self->_recordingControlState;
  if (a5 || recordingControlState != a3)
  {
    self->_recordingControlState = a3;
    -[ICRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", a4, recordingControlState);
  }
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
  -[ICRecordingControl _syncLongPressGestureRecognizerEnablement](self, "_syncLongPressGestureRecognizerEnablement");
  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v4);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v5);

  -[ICRecordingControl pauseShapeLayer](self, "pauseShapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl updateLayerAlphaIfVisible:](self, "updateLayerAlphaIfVisible:", v6);

  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alpha");
  v9 = v8 != 0.0;

  -[ICRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", v9, 0);
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[ICRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", 1, self->_recordingControlState);
  }
}

- (void)setInnerColor:(id)a3
{
  objc_storeStrong((id *)&self->_innerColor, a3);
}

- (double)layerAlpha
{
  _BOOL4 v2;
  double result;

  v2 = -[ICRecordingControl enabled](self, "enabled");
  result = 0.5;
  if (v2)
    return 1.0;
  return result;
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
    -[ICRecordingControl layerAlpha](self, "layerAlpha");
    *(float *)&v5 = v5;
    objc_msgSend(v6, "setOpacity:", v5);
  }

}

- (ICRecordingControl)initWithDiameter:(double)a3
{
  ICRecordingControl *v4;
  ICRecordingControl *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICRecordingControl;
  v4 = -[ICRecordingControl initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_diameter = a3;
    -[ICRecordingControl _commonInit](v4, "_commonInit");
  }
  return v5;
}

- (double)_originalRecordingControlDiameter
{
  return 60.0;
}

- (double)recordingControlInnerSquareWidth
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  v4 = 24.0 / v3;
  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return v4 * v5;
}

- (double)recordingControlPauseGap
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  v4 = 4.0 / v3;
  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return v4 * v5;
}

- (double)recordingControlPauseStrokeCornerRadius
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  v4 = 2.0 / v3;
  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return v4 * v5;
}

- (double)recordingControlLozengeFixedWidth
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  v4 = 86.0 / v3;
  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return v4 * v5;
}

- (double)recordingControlOuterRingGapScaleFactor
{
  double v2;

  -[ICRecordingControl _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 6.0 / v2;
}

- (void)_commonInit
{
  void *v3;

  -[ICRecordingControl setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICRecordingControl resolveColors](self, "resolveColors");
  -[ICRecordingControl _styleView](self, "_styleView");
  self->_enabled = 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
  -[ICRecordingControl addInteraction:](self, "addInteraction:", v3);

  -[ICRecordingControl _buildSublayers](self, "_buildSublayers");
}

- (void)_buildSublayers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "layer did not exist when _buildSublayers was called.", v1, 2u);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICRecordingControl;
  -[ICRecordingControl layoutSubviews](&v3, sel_layoutSubviews);
  -[ICRecordingControl resolveColors](self, "resolveColors");
}

- (BOOL)_hasOuterRingLayer
{
  return 1;
}

- (id)recordingControlOuterColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_32);
}

id __48__ICRecordingControl_recordingControlOuterColor__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(a2, "ic_isDark") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_styleView
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[ICRecordingControl recordingControlOuterColor](self, "recordingControlOuterColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl setOuterColor:](self, "setOuterColor:", v6);
  -[ICRecordingControl _resolvedRingColorForState:](self, "_resolvedRingColorForState:", -[ICRecordingControl recordingControlState](self, "recordingControlState"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", v4);

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

  -[ICRecordingControl traitCollection](self, "traitCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIColor resolvedColorWithTraitCollection:](self->_innerColor, "resolvedColorWithTraitCollection:", v11);
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedInnerColor = self->_resolvedInnerColor;
  self->_resolvedInnerColor = v3;

  -[UIColor resolvedColorWithTraitCollection:](self->_innerColorResume, "resolvedColorWithTraitCollection:", v11);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedInnerColorResume = self->_resolvedInnerColorResume;
  self->_resolvedInnerColorResume = v5;

  -[UIColor resolvedColorWithTraitCollection:](self->_outerColor, "resolvedColorWithTraitCollection:", v11);
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedOuterColor = self->_resolvedOuterColor;
  self->_resolvedOuterColor = v7;

  -[UIColor resolvedColorWithTraitCollection:](self->_outerColorResume, "resolvedColorWithTraitCollection:", v11);
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  resolvedOuterColorResume = self->_resolvedOuterColorResume;
  self->_resolvedOuterColorResume = v9;

}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICRecordingControl;
  -[ICRecordingControl layoutSublayersOfLayer:](&v4, sel_layoutSublayersOfLayer_, a3);
  -[ICRecordingControl _commonLayerUpdate](self, "_commonLayerUpdate");
}

- (void)_commonLayerUpdate
{
  CGPath *v3;
  void *v4;

  v3 = -[ICRecordingControl _pausePath](self, "_pausePath");
  -[ICRecordingControl pauseShapeLayer](self, "pauseShapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v3);

  -[ICRecordingControl _updateVisualState:fromState:](self, "_updateVisualState:fromState:", 0, self->_recordingControlState);
}

- (void)_updateVisualState:(BOOL)a3 fromState:(int64_t)a4
{
  _BOOL8 v5;
  CGPath *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  float v14;
  double v15;
  void *v16;
  int64_t recordingControlState;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  CGPath *v29;
  CGPath *v30;
  id v31;

  v5 = a3;
  v7 = -[ICRecordingControl _ringPathForState:](self, "_ringPathForState:", self->_recordingControlState);
  -[ICRecordingControl _resolvedRingColorForState:](self, "_resolvedRingColorForState:", self->_recordingControlState);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");

  -[ICRecordingControl _ringOpacityForState:](self, "_ringOpacityForState:", self->_recordingControlState);
  v11 = v10;
  v30 = -[ICRecordingControl _fillPathAnimateStartForState:fromState:](self, "_fillPathAnimateStartForState:fromState:", self->_recordingControlState, a4);
  v29 = -[ICRecordingControl _fillPathAnimateEndForState:fromState:](self, "_fillPathAnimateEndForState:fromState:", self->_recordingControlState, a4);
  -[ICRecordingControl _resolvedFillColorForState:](self, "_resolvedFillColorForState:", self->_recordingControlState);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "CGColor");

  v14 = 0.5;
  if (!-[ICRecordingControl pressed](self, "pressed"))
  {
    -[ICRecordingControl layerAlpha](self, "layerAlpha");
    v14 = v15;
  }
  -[ICRecordingControl _buttonTextForState:](self, "_buttonTextForState:", self->_recordingControlState);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl _textColorForState:](self, "_textColorForState:", self->_recordingControlState);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  recordingControlState = self->_recordingControlState;
  if (recordingControlState == 5 || recordingControlState == 0)
  {
    -[ICRecordingControl setRecordAccessibilityLabel](self, "setRecordAccessibilityLabel");
  }
  else
  {
    -[ICRecordingControl _accessibilityLabelTextForState:](self, "_accessibilityLabelTextForState:", self->_recordingControlState);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ic_setPath:animated:", v7, v5);

  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ic_setStrokeColor:animated:", v9, v5);

  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v23 = v11;
  objc_msgSend(v22, "ic_setOpacity:animated:", v5, v23);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ic_setPath:fromPath:animated:", v29, v30, v5);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ic_setFillColor:animated:", v13, v5);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v27 = v14;
  objc_msgSend(v26, "ic_setOpacity:animated:", v5, v27);

  if (a4 == 1 || recordingControlState == 1)
    -[ICRecordingControl crossfadePauseLayer:animated:](self, "crossfadePauseLayer:animated:", recordingControlState == 1, v5);
  v28 = v31;
  if (v31)
  {
    -[ICRecordingControl crossfadeText:color:animated:](self, "crossfadeText:color:animated:", v31, v16, v5);
    v28 = v31;
    if (a4 == 1)
    {
      -[ICRecordingControl fadeOutPauseAndInText:](self, "fadeOutPauseAndInText:", v5);
      v28 = v31;
    }
  }
  -[ICRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", v28 != 0, v5);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (id)_resolvedRingColorForState:(int64_t)a3
{
  int *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v3 = &OBJC_IVAR___ICRecordingControl__resolvedOuterColorResume;
  else
    v3 = &OBJC_IVAR___ICRecordingControl__resolvedOuterColor;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_ringPathForState:(int64_t)a3
{
  return -[ICRecordingControl _ringPathForState:includingStrokeThickeness:](self, "_ringPathForState:includingStrokeThickeness:", a3, 0);
}

- (CGPath)_interactionPath
{
  return -[ICRecordingControl _ringPathForState:includingStrokeThickeness:](self, "_ringPathForState:includingStrokeThickeness:", -[ICRecordingControl recordingControlState](self, "recordingControlState"), 1);
}

- (CGPath)_ringPathForState:(int64_t)a3 includingStrokeThickeness:(BOOL)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return -[ICRecordingControl _ringLozengePath:](self, "_ringLozengePath:", a4);
  else
    return -[ICRecordingControl _ringPath:](self, "_ringPath:", a4);
}

- (double)_ringOpacityForState:(int64_t)a3
{
  double result;

  if ((unint64_t)(a3 - 7) < 4)
    return 0.0;
  -[ICRecordingControl layerAlpha](self, "layerAlpha");
  return result;
}

- (id)_resolvedFillColorForState:(int64_t)a3
{
  int *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v3 = &OBJC_IVAR___ICRecordingControl__resolvedInnerColorResume;
  else
    v3 = &OBJC_IVAR___ICRecordingControl__resolvedInnerColor;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (CGPath)_fillPathAnimateStartForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1)
    return -[ICRecordingControl _squarePath](self, "_squarePath");
  else
    return -[ICRecordingControl _fillPathForState:](self, "_fillPathForState:", a4);
}

- (CGPath)_fillPathAnimateEndForState:(int64_t)a3 fromState:(int64_t)a4
{
  if (a3 == 1 && a4 == 2 || a3 == 2 && a4 == 1)
    return -[ICRecordingControl _squarePath](self, "_squarePath");
  else
    return -[ICRecordingControl _fillPathForState:](self, "_fillPathForState:");
}

- (CGPath)_fillPathForState:(int64_t)a3
{
  if (a3 == 2)
    return -[ICRecordingControl _squarePath](self, "_squarePath");
  if (a3 == 1)
    return -[ICRecordingControl _microCirclePath](self, "_microCirclePath");
  if (a3)
    return -[ICRecordingControl _labelLozengePath](self, "_labelLozengePath");
  return -[ICRecordingControl _circlePath](self, "_circlePath");
}

- (id)_accessibilityLabelTextForState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("RECORD");
      goto LABEL_15;
    case 1:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("PAUSE");
      goto LABEL_15;
    case 2:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("STOP");
      goto LABEL_15;
    case 3:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("REPLACE");
      goto LABEL_15;
    case 4:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("RESUME");
      goto LABEL_15;
    case 5:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("BUSY");
      goto LABEL_15;
    case 6:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("INSERT");
      goto LABEL_15;
    case 7:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("DONE");
      goto LABEL_15;
    case 8:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("SAVE");
      goto LABEL_15;
    case 9:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("UNLOCK");
      goto LABEL_15;
    case 10:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("CANCEL");
LABEL_15:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)_buttonTextForState:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = 0;
  switch(a3)
  {
    case 3:
      v4 = (void *)MEMORY[0x1E0D64218];
      v5 = CFSTR("REPLACE");
      goto LABEL_5;
    case 4:
      v4 = (void *)MEMORY[0x1E0D64218];
      v5 = CFSTR("RESUME");
      goto LABEL_5;
    case 6:
      v4 = (void *)MEMORY[0x1E0D64218];
      v5 = CFSTR("INSERT");
LABEL_5:
      objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedUppercaseString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 7:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("DONE");
      goto LABEL_10;
    case 8:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("SAVE");
      goto LABEL_10;
    case 9:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("UNLOCK");
      goto LABEL_10;
    case 10:
      v7 = (void *)MEMORY[0x1E0D64218];
      v8 = CFSTR("CANCEL");
LABEL_10:
      objc_msgSend(v7, "localizedFrameworkStringForKey:value:table:allowSiri:", v8, v8, 0, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_textColorForState:(int64_t)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 4:
    case 6:
      v3 = 440;
      goto LABEL_5;
    case 7:
    case 9:
      -[ICRecordingControl fontColor](self, "fontColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 432;
LABEL_5:
      v4 = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
  }
  return v4;
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
  -[ICRecordingControl layerAlpha](self, "layerAlpha");
  v8 = v7;
  if (v5)
    v9 = v8;
  else
    v9 = 0.0;
  if (v5)
    v10 = 0.0;
  else
    v10 = v8;
  -[ICRecordingControl pauseShapeLayer](self, "pauseShapeLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v9;
  objc_msgSend(v11, "ic_setOpacity:animated:", v4, v12);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = v10;
  objc_msgSend(v14, "ic_setOpacity:animated:", v4, v13);

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
  -[ICRecordingControl pauseShapeLayer](self, "pauseShapeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "ic_setOpacity:animated:", v3, v6);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_setPath:animated:", -[ICRecordingControl _labelLozengePath](self, "_labelLozengePath"), v3);

  -[ICRecordingControl innerStateLayer](self, "innerStateLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl layerAlpha](self, "layerAlpha");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "ic_setOpacity:animated:", v3, v9);

  -[ICRecordingControl _updateVisibilityOfNamedStateLabel:animated:](self, "_updateVisibilityOfNamedStateLabel:animated:", 1, v3);
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
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v10);

    objc_msgSend(v9, "setType:", *MEMORY[0x1E0CD3170]);
    objc_msgSend(v9, "setDuration:", 0.2);
    -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("kCATransitionFade"));

  }
  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v8);

  -[ICRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v15);
}

- (void)_updateVisibilityOfNamedStateLabel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  id v9;
  _QWORD v10[6];
  BOOL v11;

  v4 = a4;
  v5 = a3;
  -[ICRecordingControl layerAlpha](self, "layerAlpha");
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__ICRecordingControl__updateVisibilityOfNamedStateLabel_animated___block_invoke;
    v10[3] = &unk_1E5C1FEC0;
    v10[4] = self;
    v11 = v5;
    *(double *)&v10[5] = v7;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v10, 0.2);
  }
  else
  {
    if (v5)
      v8 = v7;
    else
      v8 = 0.0;
    -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", v8);

  }
}

void __66__ICRecordingControl__updateVisibilityOfNamedStateLabel_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 48))
    v1 = *(double *)(a1 + 40);
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "namedStateLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

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

  -[ICRecordingControl bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[ICRecordingControl bounds](self, "bounds");
  v10 = v9 * 0.5;
  v11 = a4 * 0.5;
  v12 = v8 - a4 * 0.5;
  v13 = v11 + v8;
  v14 = a3 * 0.5;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 0, v12, v9 * 0.5, v14, 4.71238898, 1.57079633);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addLineToPoint:", v13, v14 + v10);
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v13, v10, v14, 1.57079633, 4.71238898);
  objc_msgSend(v15, "addLineToPoint:", v12, v10 - v14);
  v16 = objc_retainAutorelease(v15);
  v17 = (CGPath *)objc_msgSend(v16, "CGPath");

  return v17;
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
  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl frame](self, "frame");
  v7 = v6;
  v8 = v6 * 0.5;
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, v6);
  objc_msgSend(v5, "setPosition:", v8, v8);
  if (v3)
  {
    -[ICRecordingControl outerRingThickness](self, "outerRingThickness");
    v7 = v7 + v9;
  }
  v10 = -[ICRecordingControl _ringLozengePathWithHeight:extraWidth:](self, "_ringLozengePathWithHeight:extraWidth:", v7, 0.0);

  return v10;
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
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  CGPath *v15;

  v3 = a3;
  -[ICRecordingControl _labelWidth](self, "_labelWidth");
  v6 = v5;
  -[ICRecordingControl outerRingLayer](self, "outerRingLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRecordingControl frame](self, "frame");
  v9 = v8;
  v10 = v8 * 0.5;
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v8);
  objc_msgSend(v7, "setPosition:", v10, v10);
  if (v3)
  {
    v11 = -[ICRecordingControl _hasOuterRingLayer](self, "_hasOuterRingLayer");
    -[ICRecordingControl outerRingThickness](self, "outerRingThickness");
    v13 = v12;
    if (v11)
    {
      v9 = v9 + v12;
    }
    else
    {
      -[ICRecordingControl outerRingGap](self, "outerRingGap");
      v9 = v9 - (v13 + v14);
    }
  }
  v15 = -[ICRecordingControl _ringLozengePathWithHeight:extraWidth:](self, "_ringLozengePathWithHeight:extraWidth:", v9, v6);

  return v15;
}

- (CGPath)_circlePath
{
  -[ICRecordingControl outerRingGap](self, "outerRingGap");
  return -[ICRecordingControl _circlePath:](self, "_circlePath:");
}

- (CGPath)_microCirclePath
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl frame](self, "frame");
  v4 = v3;
  -[ICRecordingControl outerRingThickness](self, "outerRingThickness");
  return -[ICRecordingControl _circlePath:](self, "_circlePath:", v4 - v5 + -0.01);
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

  -[ICRecordingControl frame](self, "frame");
  v6 = v5;
  -[ICRecordingControl outerRingThickness](self, "outerRingThickness");
  v8 = v7;
  v9 = v6 - v7 - a3;
  -[ICRecordingControl _xInset](self, "_xInset");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", a3 * 0.5 + v10 + v8 * 0.5, a3 * 0.5 + v8 * 0.5, v9, v9, v9 * 0.5);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (CGPath *)objc_msgSend(v11, "CGPath");

  return v12;
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

  -[ICRecordingControl frame](self, "frame");
  v4 = v3;
  -[ICRecordingControl frame](self, "frame");
  v6 = v5;
  -[ICRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v8 = (v4 - v7) * 0.5;
  -[ICRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v10 = (v6 - v9) * 0.5;
  v11 = v8;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPath)_squarePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  CGPath *v12;

  -[ICRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v4 = v3;
  -[ICRecordingControl _getSquarePathPosition](self, "_getSquarePathPosition");
  v6 = v5;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0DC3508];
  -[ICRecordingControl innerSquareCornerRadius](self, "innerSquareCornerRadius");
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v4, v4, v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (CGPath *)objc_msgSend(v11, "CGPath");

  return v12;
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
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  CGPath *v19;

  -[ICRecordingControl _getSquarePathPosition](self, "_getSquarePathPosition");
  v4 = v3;
  v6 = v5;
  -[ICRecordingControl innerSquareWidth](self, "innerSquareWidth");
  v8 = v7;
  -[ICRecordingControl recordingControlPauseGap](self, "recordingControlPauseGap");
  v10 = (v8 - v9) * 0.5;
  v11 = v9 + v4 + v10;
  v12 = (void *)MEMORY[0x1E0DC3508];
  -[ICRecordingControl pauseStrokeCornerRadius](self, "pauseStrokeCornerRadius");
  objc_msgSend(v12, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v10, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3508];
  -[ICRecordingControl pauseStrokeCornerRadius](self, "pauseStrokeCornerRadius");
  objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v11, v6, v10, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendPath:", v17);
  v18 = objc_retainAutorelease(v14);
  v19 = (CGPath *)objc_msgSend(v18, "CGPath");

  return v19;
}

- (CGPath)_labelLozengePath
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  CGPath *v13;
  CGRect v15;
  CGRect v16;

  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  -[ICRecordingControl labelLozengeRectWithLabelIntrinsicWidth:](self, "labelLozengeRectWithLabelIntrinsicWidth:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  v16 = CGRectInset(v15, 4.0, 4.0);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v16.origin.x, v16.origin.y + 1.0, v16.size.width, v16.size.height, v16.size.height);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (CGPath *)objc_msgSend(v12, "CGPath");

  return v13;
}

- (double)recordingControlHeight
{
  double v2;

  -[ICRecordingControl diameter](self, "diameter");
  return v2 + -2.0;
}

- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[ICRecordingControl recordingControlHeight](self, "recordingControlHeight");
  v6 = v5;
  -[ICRecordingControl paddedLabelWidth:](self, "paddedLabelWidth:", a3);
  return v7 + v6 * 2.0;
}

- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3
{
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
  double v17;
  CGRect result;

  -[ICRecordingControl paddedLabelWidth:](self, "paddedLabelWidth:");
  v6 = v5;
  -[ICRecordingControl recordingControlHeight](self, "recordingControlHeight");
  v8 = v7;
  v9 = v6 + v7;
  -[ICRecordingControl recordingControlWidthWithLabelIntrinsicWidth:](self, "recordingControlWidthWithLabelIntrinsicWidth:", a3);
  v11 = v10 * 0.5;
  -[ICRecordingControl recordingControlHeight](self, "recordingControlHeight");
  v13 = v12 * 0.5;
  v14 = v11 - v9 * 0.5;
  v15 = v13 - v8 * 0.5;
  v16 = v9;
  v17 = v8;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)paddedLabelWidth:(double)a3
{
  double result;

  -[ICRecordingControl recordingControlLozengeFixedWidth](self, "recordingControlLozengeFixedWidth");
  if (result <= a3)
    return a3;
  return result;
}

- (double)_xInset
{
  double v3;
  double v4;
  double v5;

  -[ICRecordingControl frame](self, "frame");
  v4 = v3;
  -[ICRecordingControl frame](self, "frame");
  return (v4 - v5) * 0.5;
}

- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3
{
  double result;

  -[ICRecordingControl recordingControlLozengeFixedWidth](self, "recordingControlLozengeFixedWidth");
  if (result <= a3)
    return a3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  -[ICRecordingControl recordingControlWidthWithLabelIntrinsicWidth:](self, "recordingControlWidthWithLabelIntrinsicWidth:");
  v5 = v4;

  -[ICRecordingControl recordingControlHeight](self, "recordingControlHeight");
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_labelWidth
{
  void *v3;
  double v4;
  double v5;

  -[ICRecordingControl namedStateLabel](self, "namedStateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  -[ICRecordingControl paddedLabelWidthWithLabelIntrinsicWidth:](self, "paddedLabelWidthWithLabelIntrinsicWidth:");
  v5 = v4;

  return v5;
}

- (void)_handleUserTouch:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  ICRecordingControl *v10;
  _BOOL8 v11;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");

  if ((unint64_t)(v9 - 1) < 2)
  {
    v11 = -[ICRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8);
    v10 = self;
LABEL_6:
    -[ICRecordingControl setPressed:](v10, "setPressed:", v11);
    return;
  }
  if (v9 != 3)
  {
    if (v9 != 4)
      return;
    v10 = self;
    v11 = 0;
    goto LABEL_6;
  }
  -[ICRecordingControl setPressed:](self, "setPressed:", 0);
  if (-[ICRecordingControl _isInsideForLocation:](self, "_isInsideForLocation:", v6, v8))
    -[ICRecordingControl _processControlActuation](self, "_processControlActuation");
}

- (BOOL)_isInsideForLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[ICRecordingControl bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (void)_processControlActuation
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[ICRecordingControl _syncLongPressGestureRecognizerEnablement](self, "_syncLongPressGestureRecognizerEnablement");
  -[ICRecordingControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDidActivate:", self);

  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 200000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ICRecordingControl__processControlActuation__block_invoke;
  v5[3] = &unk_1E5C1F720;
  objc_copyWeak(&v6, &location);
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__ICRecordingControl__processControlActuation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_syncLongPressGestureRecognizerEnablement");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICRecordingControl;
  return *MEMORY[0x1E0DC46B8] | -[ICRecordingControl accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x1E0DC4660];
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect BoundingBox;
  CGRect result;

  BoundingBox = CGPathGetBoundingBox(-[ICRecordingControl _interactionPath](self, "_interactionPath"));
  -[ICRecordingControl convertRect:toView:](self, "convertRect:toView:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
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

  -[ICRecordingControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ICRecordingControl _xInset](self, "_xInset");
  v12 = v11;
  if ((-[ICRecordingControl recordingControlState](self, "recordingControlState") | 2) == 2)
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

  if ((-[ICRecordingControl recordingControlState](self, "recordingControlState") | 2) == 2)
  {
    -[ICRecordingControl _accessibilityCirclePathBasedOnBoundsWidth](self, "_accessibilityCirclePathBasedOnBoundsWidth");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[ICRecordingControl _ringPathForState:](self, "_ringPathForState:", -[ICRecordingControl recordingControlState](self, "recordingControlState"));
    -[ICRecordingControl frame](self, "frame");
    v6 = v5;
    v8 = v7;
    -[ICRecordingControl superview](self, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toView:", 0, v6, v8);
    v11 = v10;
    v13 = v12;

    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v11, v13);
    v14 = CGPathCreateMutableCopyByTransformingPath(v4, &v16);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v14);
  }
  return v3;
}

- (void)setRecordAccessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "objectAtIndex:", 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("en")),
        v4,
        v5))
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("RECORD"), CFSTR("RECORD"), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

    v10 = *MEMORY[0x1E0DC45E0];
    v11[0] = CFSTR("ɻɪ.ˈkwɔɻd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributes:range:", v9, 0, 6);

    -[ICRecordingControl setAccessibilityAttributedLabel:](self, "setAccessibilityAttributedLabel:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("RECORD"), CFSTR("RECORD"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICRecordingControl setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);
  }

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  CGRect BoundingBox;

  BoundingBox = CGPathGetBoundingBox(-[ICRecordingControl _interactionPath](self, "_interactionPath", a3, a4, a5));
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", 0, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithCGPath:", -[ICRecordingControl _interactionPath](self, "_interactionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisiblePath:", v6);

  v8 = (void *)MEMORY[0x1E0DC3B38];
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)recordingControlState
{
  return self->_recordingControlState;
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

- (void)setOuterColor:(id)a3
{
  objc_storeStrong((id *)&self->_outerColor, a3);
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

- (ICRecordingControlDelegate)delegate
{
  return (ICRecordingControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAShapeLayer)outerRingLayer
{
  return self->_outerRingLayer;
}

- (void)setOuterRingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerRingLayer, a3);
}

- (CAShapeLayer)innerStateLayer
{
  return self->_innerStateLayer;
}

- (void)setInnerStateLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerStateLayer, a3);
}

- (CAShapeLayer)pauseShapeLayer
{
  return self->_pauseShapeLayer;
}

- (void)setPauseShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pauseShapeLayer, a3);
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

- (BOOL)pressed
{
  return self->_pressed;
}

- (BOOL)didBuildSublayers
{
  return self->_didBuildSublayers;
}

- (void)setDidBuildSublayers:(BOOL)a3
{
  self->_didBuildSublayers = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (double)outerRingThickness
{
  return self->_outerRingThickness;
}

- (void)setOuterRingThickness:(double)a3
{
  self->_outerRingThickness = a3;
}

- (double)outerRingGap
{
  return self->_outerRingGap;
}

- (void)setOuterRingGap:(double)a3
{
  self->_outerRingGap = a3;
}

- (double)innerSquareWidth
{
  return self->_innerSquareWidth;
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

- (double)pauseStrokeCornerRadius
{
  return self->_pauseStrokeCornerRadius;
}

- (void)setPauseStrokeCornerRadius:(double)a3
{
  self->_pauseStrokeCornerRadius = a3;
}

- (UILabel)namedStateLabel
{
  return self->_namedStateLabel;
}

- (void)setNamedStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_namedStateLabel, a3);
}

- (void).cxx_destruct
{
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
