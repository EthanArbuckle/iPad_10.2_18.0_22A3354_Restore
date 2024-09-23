@implementation _UIFluidSliderFeedbackConductor

- (_UIFluidSliderFeedbackConductor)initWithDetentCount:(unint64_t)a3 view:(id)a4 indirectFeedbackPlayer:(id)a5
{
  id v8;
  id v9;
  _UIFluidSliderFeedbackConductor *v10;
  _UIFluidSliderFeedbackConductor *v11;
  _UIFluidSliderFeedbackGenerator *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UIFluidSliderFeedbackConductor;
  v10 = -[_UIFluidSliderFeedbackConductor init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[_UIFluidSliderFeedbackConductor set_detentCount:](v10, "set_detentCount:", a3);
    v12 = -[_UIFluidSliderFeedbackGenerator initWithView:]([_UIFluidSliderFeedbackGenerator alloc], "initWithView:", v8);
    -[_UIFluidSliderFeedbackConductor set_directFeedbackPlayer:](v11, "set_directFeedbackPlayer:", v12);

    -[_UIFluidSliderFeedbackConductor set_indirectFeedbackPlayer:](v11, "set_indirectFeedbackPlayer:", v9);
    -[_UIFluidSliderFeedbackConductor setEpsilon:](v11, "setEpsilon:", 0.0001);
  }

  return v11;
}

- (void)moveToValue:(double)a3 snappingTarget:(double)a4 withUpdateType:(int64_t)a5 atLocation:(CGPoint)a6 forced:(BOOL)a7
{
  _BOOL4 v7;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint8_t buf[2];
  __int16 v35;

  v7 = a7;
  y = a6.y;
  x = a6.x;
  if (a7
    || (-[_UIFluidSliderFeedbackConductor _lastValue](self, "_lastValue"),
        v15 = vabdd_f64(a3, v14),
        -[_UIFluidSliderFeedbackConductor epsilon](self, "epsilon"),
        v15 > v16))
  {
    -[_UIFluidSliderFeedbackConductor _currentRegion](self, "_currentRegion");
    -[_UIFluidSliderFeedbackConductor epsilon](self, "epsilon");
    if (v17 <= a3)
    {
      -[_UIFluidSliderFeedbackConductor epsilon](self, "epsilon");
      v21 = 1.0 - v20;
      v18 = v21 >= a3;
      if (v21 < a3)
        v19 = 3;
      else
        v19 = 2;
      if (!a5)
        goto LABEL_17;
    }
    else
    {
      v18 = 0;
      v19 = 1;
      if (!a5)
        goto LABEL_17;
    }
    if (!v7 && -[_UIFluidSliderFeedbackConductor _currentRegion](self, "_currentRegion"))
    {
      if (v18)
      {
        if (a5 == 1)
        {
          if (a4 <= 0.0)
            goto LABEL_36;
          if (a4 >= 1.0)
            goto LABEL_36;
          -[_UIFluidSliderFeedbackConductor _lastSnappingTarget](self, "_lastSnappingTarget");
          v31 = vabdd_f64(a4, v30);
          -[_UIFluidSliderFeedbackConductor epsilon](self, "epsilon");
          if (v31 <= v32)
            goto LABEL_36;
          v23 = 2;
          goto LABEL_19;
        }
        if (a5 != 3)
          goto LABEL_17;
        -[_UIFluidSliderFeedbackConductor _lastValue](self, "_lastValue");
        if (floor(v22 * (double)-[_UIFluidSliderFeedbackConductor _detentCount](self, "_detentCount")) == floor((double)-[_UIFluidSliderFeedbackConductor _detentCount](self, "_detentCount") * a3))
          goto LABEL_36;
      }
      else if (v19 == -[_UIFluidSliderFeedbackConductor _currentRegion](self, "_currentRegion"))
      {
        goto LABEL_36;
      }
LABEL_18:
      v23 = 1;
LABEL_19:
      if (v19 == 3)
      {
        -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", 3, a5, a3, x, y);
        v28 = qword_1ECD81970;
        if (!qword_1ECD81970)
        {
          v28 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v28, (unint64_t *)&qword_1ECD81970);
        }
        v25 = *(NSObject **)(v28 + 8);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        LOWORD(v33) = 0;
        v26 = "[FluidSlider Feedback] Max";
        v27 = (uint8_t *)&v33;
      }
      else if (v19 == 2)
      {
        -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", v23, a5, a3, x, y);
        v29 = qword_1ECD81968;
        if (!qword_1ECD81968)
        {
          v29 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v29, (unint64_t *)&qword_1ECD81968);
        }
        v25 = *(NSObject **)(v29 + 8);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v26 = "[FluidSlider Feedback] Detent";
        v27 = buf;
      }
      else
      {
        -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", 0, a5, a3, x, y);
        v24 = _MergedGlobals_1243;
        if (!_MergedGlobals_1243)
        {
          v24 = __UILogCategoryGetNode("FluidSliderInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v24, (unint64_t *)&_MergedGlobals_1243);
        }
        v25 = *(NSObject **)(v24 + 8);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v35 = 0;
        v26 = "[FluidSlider Feedback] Min";
        v27 = (uint8_t *)&v35;
      }
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_DEFAULT, v26, v27, 2u);
LABEL_36:
      -[_UIFluidSliderFeedbackConductor set_currentRegion:](self, "set_currentRegion:", v19, v33);
      -[_UIFluidSliderFeedbackConductor set_lastValue:](self, "set_lastValue:", a3);
      -[_UIFluidSliderFeedbackConductor set_lastSnappingTarget:](self, "set_lastSnappingTarget:", a4);
      return;
    }
LABEL_17:
    if (!v7)
      goto LABEL_36;
    goto LABEL_18;
  }
}

- (void)_playFeedback:(int64_t)a3 forUpdateType:(int64_t)a4 value:(double)a5 atLocation:(CGPoint)a6
{
  double y;
  double x;
  void *v11;
  char v12;
  id v13;

  y = a6.y;
  x = a6.x;
  if (a4 == 1
    || (-[_UIFluidSliderFeedbackConductor _indirectFeedbackPlayer](self, "_indirectFeedbackPlayer"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "playFeedback:forValue:atLocation:", a3, a5, x, y),
        v11,
        (v12 & 1) == 0))
  {
    -[_UIFluidSliderFeedbackConductor _directFeedbackPlayer](self, "_directFeedbackPlayer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playFeedback:forValue:atLocation:", a3, a5, x, y);

  }
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (_UIFluidSliderFeedbackPlayer)_directFeedbackPlayer
{
  return self->__directFeedbackPlayer;
}

- (void)set_directFeedbackPlayer:(id)a3
{
  objc_storeStrong((id *)&self->__directFeedbackPlayer, a3);
}

- (_UIFluidSliderFeedbackPlayer)_indirectFeedbackPlayer
{
  return self->__indirectFeedbackPlayer;
}

- (void)set_indirectFeedbackPlayer:(id)a3
{
  objc_storeStrong((id *)&self->__indirectFeedbackPlayer, a3);
}

- (double)_lastValue
{
  return self->__lastValue;
}

- (void)set_lastValue:(double)a3
{
  self->__lastValue = a3;
}

- (double)_lastSnappingTarget
{
  return self->__lastSnappingTarget;
}

- (void)set_lastSnappingTarget:(double)a3
{
  self->__lastSnappingTarget = a3;
}

- (unint64_t)_detentCount
{
  return self->__detentCount;
}

- (void)set_detentCount:(unint64_t)a3
{
  self->__detentCount = a3;
}

- (int64_t)_currentRegion
{
  return self->__currentRegion;
}

- (void)set_currentRegion:(int64_t)a3
{
  self->__currentRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indirectFeedbackPlayer, 0);
  objc_storeStrong((id *)&self->__directFeedbackPlayer, 0);
}

@end
