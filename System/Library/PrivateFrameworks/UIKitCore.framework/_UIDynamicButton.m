@implementation _UIDynamicButton

- (_UIDynamicButton)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDynamicButton.m"), 254, CFSTR("%s: init is not allowed on %@"), "-[_UIDynamicButton init]", objc_opt_class());

  return 0;
}

+ (id)_dynamicButtonFromHIDEvent:(uint64_t)a1
{
  _UIDynamicButton *v3;
  id v4;
  objc_super v6;

  objc_opt_self();
  v3 = [_UIDynamicButton alloc];
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)_UIDynamicButton;
    v4 = objc_msgSendSuper2(&v6, sel_init);
  }
  else
  {
    v4 = 0;
  }
  -[_UIDynamicButton _updateWithHIDEvent:]((uint64_t)v4, a2);
  return v4;
}

- (void)_updateWithHIDEvent:(uint64_t)a1
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  int Type;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t IntegerValue;
  int v21;
  _BOOL8 v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t *DataValue;
  unsigned int *v33;
  int64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  _BOOL8 v38;
  uint64_t v39;
  unint64_t TimeStamp;
  uint64_t v41;
  void *v42;
  id v43;

  if (a1)
  {
    if (!_UIEventHIDIsDynamicButtonEvent(a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateWithHIDEvent_, a1, CFSTR("_UIDynamicButton.m"), 273, CFSTR("Invalid hidEvent type for %@: %@"), objc_opt_class(), a2);
      goto LABEL_20;
    }
    v4 = _UIEventHIDIsDynamicButtonEvent(a2);
    BKSHIDEventGetBaseAttributes();
    v43 = (id)objc_claimAutoreleasedReturnValue();
    _UIEventHIDUIWindowForHIDEvent();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v5;

    Type = IOHIDEventGetType();
    if (Type == 1)
    {
      v30 = _UIEventHIDIsDynamicButtonEvent(a2);
      v31 = 5;
      if (!v30)
        v31 = 0;
      *(_QWORD *)(a1 + 24) = v31;
      *(_DWORD *)(a1 + 10) = 6749952;
      DataValue = (uint64_t *)IOHIDEventGetDataValue();
      _UIEventHIDGetChildVendorDefinedForceStageEvent(a2);
      v33 = (unsigned int *)IOHIDEventGetDataValue();
      if (v4)
        *(_BYTE *)(a1 + 8) = *v33 != 0;
      v34 = vdupq_n_s64(0x7FF8000000000000uLL);
      *(int64x2_t *)(a1 + 32) = v34;
      *(int64x2_t *)(a1 + 136) = v34;
      v35 = *DataValue;
      *(_QWORD *)(a1 + 48) = 0;
      v36 = *v33;
      v37 = v33[1];
      v38 = v37 == 1;
      v23 = v37 == 2;
      v39 = 2;
      if (!v23)
        v39 = v38;
      *(_QWORD *)(a1 + 152) = 0;
      *(_QWORD *)(a1 + 160) = v35;
      *(_QWORD *)(a1 + 56) = v36;
      *(_QWORD *)(a1 + 64) = v39;
      *(_QWORD *)(a1 + 80) = *((_QWORD *)v33 + 4);
      *(_QWORD *)(a1 + 88) = *((_QWORD *)v33 + 5);
      *(_QWORD *)(a1 + 96) = *((_QWORD *)v33 + 3);
      *(_QWORD *)(a1 + 104) = *((_QWORD *)v33 + 2);
      v29 = *((_QWORD *)v33 + 1);
    }
    else
    {
      if (Type != 42)
      {
LABEL_19:
        TimeStamp = IOHIDEventGetTimeStamp();
        *(double *)(a1 + 120) = _UIMediaTimeForMachTime(TimeStamp);
        v41 = objc_msgSend(v43, "copy");
        v42 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = v41;

LABEL_20:
        return;
      }
      if (v4)
        v8 = 5;
      else
        v8 = 0;
      *(_QWORD *)(a1 + 24) = v8;
      *(_WORD *)(a1 + 10) = IOHIDEventGetIntegerValue();
      *(_WORD *)(a1 + 12) = IOHIDEventGetIntegerValue();
      *(_BYTE *)(a1 + 8) = IOHIDEventGetIntegerValue() > 0;
      IOHIDEventGetDoubleValue();
      v10 = v9;
      IOHIDEventGetDoubleValue();
      v12 = v11;
      *(double *)(a1 + 32) = _UITouchSensitiveButtonRadiusInPointsFromMM(*(void **)(a1 + 16), v10);
      *(double *)(a1 + 40) = _UITouchSensitiveButtonRadiusInPointsFromMM(*(void **)(a1 + 16), v12);
      IOHIDEventGetDoubleValue();
      v14 = v13;
      IOHIDEventGetDoubleValue();
      v16 = v15;
      IOHIDEventGetDoubleValue();
      v18 = v17;
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(a1 + 136) = v14;
      *(_QWORD *)(a1 + 144) = v16;
      *(_QWORD *)(a1 + 152) = v18;
      *(_QWORD *)(a1 + 160) = v19;
      *(_QWORD *)(a1 + 48) = IOHIDEventGetIntegerValue() & 0x1F;
      _UIEventHIDGetChildForceStageEvent(a2);
      IntegerValue = IOHIDEventGetIntegerValue();
      v21 = IOHIDEventGetIntegerValue();
      v22 = v21 == 1;
      v23 = v21 == 2;
      v24 = 2;
      if (!v23)
        v24 = v22;
      *(_QWORD *)(a1 + 56) = IntegerValue & ~(IntegerValue >> 63);
      *(_QWORD *)(a1 + 64) = v24;
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(a1 + 80) = v25;
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(a1 + 88) = v26;
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(a1 + 96) = v27;
      IOHIDEventGetDoubleValue();
      *(_QWORD *)(a1 + 104) = v28;
      IOHIDEventGetDoubleValue();
    }
    *(_QWORD *)(a1 + 112) = v29;
    goto LABEL_19;
  }
}

- (unint64_t)_eventComponentType
{
  return 2;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  unint64_t phase;
  void *v3;
  void *v4;

  phase = self->_phase;
  _eventComponentPhaseMapping();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _eventComponentPhaseForUnderlyingValue(phase, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIEventComponentPhaseValue *)v4;
}

- (void)_setEventComponentPhase:(id)a3
{
  self->_phase = objc_msgSend(a3, "underlyingValue");
}

- (id)_eventComponentPhaseForValue:(int64_t)a3
{
  void *v4;
  void *v5;

  _eventComponentPhaseMapping();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _eventComponentPhaseForValue(a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (result)
  {
    v3 = result;
    _NSStringFromUIPhysicalButton(*(_QWORD *)(result + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "appendString:withName:", v4, CFSTR("physicalButton"));

    v5 = (id)objc_msgSend(a2, "appendUnsignedInteger:withName:", *(_QWORD *)(v3 + 56), CFSTR("stage"));
    v6 = *(_QWORD *)(v3 + 72);
    if (v6 > 4)
      v7 = &stru_1E16EDF20;
    else
      v7 = off_1E16B8270[v6];
    objc_msgSend(a2, "appendString:withName:", v7, CFSTR("phase"));
    v8 = (id)objc_msgSend(a2, "appendBool:withName:", *(unsigned __int8 *)(v3 + 8), CFSTR("isTouching"));
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke;
    v11[3] = &unk_1E16B8250;
    v11[4] = v3;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("position"), v11);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke_2;
    v10[3] = &unk_1E16B8250;
    v10[4] = v3;
    return objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("positionDelta"), v10);
  }
  return result;
}

- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  if (a1)
  {
    v4 = (id)objc_msgSend(a2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 8), CFSTR("isTouching"));
    v5 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("touchMajorRadius"), 1, *(double *)(a1 + 32));
    v6 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("touchMinorRadius"), 1, *(double *)(a1 + 40));
    v7 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke;
    v23[3] = &unk_1E16B8250;
    v23[4] = a1;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("position"), v23);
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke_2;
    v22[3] = &unk_1E16B8250;
    v22[4] = a1;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("positionDelta"), v22);
    _NSStringFromUITouchSenstiveButtonPositionHint(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(a2, "appendObject:withName:", v8, CFSTR("touchPositionHints"));

    v10 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForce"), 3, *(double *)(a1 + 80));
    v11 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 3, *(double *)(a1 + 88));
    v12 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("releaseStageForceThreshold"), 3, *(double *)(a1 + 96));
    v13 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("pressedStageForceThreshold"), 3, *(double *)(a1 + 104));
    v14 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("nextStageForceThreshold"), 3, *(double *)(a1 + 112));
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = v15;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v17);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = CFSTR("(nil)");
    }
    v21 = (id)objc_msgSend(a2, "appendObject:withName:", v20, CFSTR("window"));

  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49___UIDynamicButton_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E16B1B50;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIDynamicButton succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDynamicButton _appendProemDescriptionSansSelfToFormatter:]((uint64_t)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIDynamicButton descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIDynamicButton descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  unint64_t phase;
  const __CFString *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _UIDynamicButton *v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  _NSStringFromUIPhysicalButton(self->_physicalButton);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("physicalButton"));

  v7 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", self->_stage, CFSTR("stage"));
  phase = self->_phase;
  if (phase > 4)
    v9 = &stru_1E16EDF20;
  else
    v9 = off_1E16B8270[phase];
  objc_msgSend(v5, "appendString:withName:", v9, CFSTR("phase"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v10 = v5;
  v15 = v10;
  v16 = self;
  v11 = (id)objc_msgSend(v10, "modifyBody:", v14);
  v12 = v10;

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[_UIDynamicButton appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[6];

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self)
  {
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v9[4] = self;
    v9[5] = v3;
    objc_msgSend(v3, "appendProem:block:", self, v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke_2;
    v8[3] = &unk_1E16B1B50;
    v8[4] = self;
    v8[5] = v4;
    objc_msgSend(v4, "appendBodySectionWithName:block:", 0, v8);
  }
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (UIWindow)_window
{
  return self->_window;
}

- (unint64_t)_physicalButton
{
  return self->_physicalButton;
}

- (unsigned)_usagePage
{
  return self->_usagePage;
}

- (unsigned)_usage
{
  return self->_usage;
}

- (BOOL)_isTouching
{
  return self->_touching;
}

- (double)_touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (double)_touchMinorRadius
{
  return self->_touchMinorRadius;
}

- (CGPoint)_position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)_positionDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->_positionDelta.x;
  y = self->_positionDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)_touchPositionHints
{
  return self->_touchPositionHints;
}

- (unint64_t)_stage
{
  return self->_stage;
}

- (unint64_t)_phase
{
  return self->_phase;
}

- (double)_normalizedForce
{
  return self->_normalizedForce;
}

- (double)_normalizedForceVelocity
{
  return self->_normalizedForceVelocity;
}

- (double)_releaseStageNormalizedForceThreshold
{
  return self->_releaseStageNormalizedForceThreshold;
}

- (double)_pressedStageNormalizedForceThreshold
{
  return self->_pressedStageNormalizedForceThreshold;
}

- (double)_nextStageNormalizedForceThreshold
{
  return self->_nextStageNormalizedForceThreshold;
}

- (double)_timestamp
{
  return self->_timestamp;
}

- (BKSHIDEventBaseAttributes)_hidEventAttributes
{
  return self->_hidEventAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidEventAttributes, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
