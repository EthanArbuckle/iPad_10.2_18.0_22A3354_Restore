@implementation _UIGameControllerEvent

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIGameControllerEvent;
  -[UIEvent _setHIDEvent:](&v8, sel__setHIDEvent_);
  if (!self->_responderDeliveryPolicy)
  {
    _UIEventHIDUIWindowForHIDEvent();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusBehaviorForScene(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "supportsGameControllers"))
      v7 = 1;
    else
      v7 = 2;
    self->_responderDeliveryPolicy = v7;

  }
}

- (int64_t)type
{
  return 8;
}

- (int64_t)subtype
{
  return 0;
}

- (void)_sendEventToResponder:(id)a3
{
  objc_msgSend(a3, "_handleGameControllerEvent:", self);
}

- (void)_reset
{
  *(_OWORD *)&self->_previousState.senderID = 0u;
  *(_OWORD *)&self->_previousState.controllerState[1] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[3] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[5] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[7] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[9] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[11] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[13] = 0u;
  *(_OWORD *)&self->_previousState.controllerState[15] = 0u;
  *(_OWORD *)&self->_previousState.normalizedLeftStickState[1] = 0u;
  *(_OWORD *)&self->_previousState.normalizedLeftStickState[3] = 0u;
  *(_OWORD *)&self->_previousState.normalizedRightStickState[1] = 0u;
  *(_OWORD *)&self->_previousState.normalizedRightStickState[3] = 0u;
  *(_OWORD *)&self->_previousState.normalizedShoulderButtonState[1] = 0u;
  self->_previousState.normalizedShoulderButtonState[3] = 0.0;
  self->_activeComponent = 0;
}

- (void)_maybeConvertAndSendAsPressesEvent
{
  __IOHIDEvent *v3;
  unint64_t TimeStamp;
  double v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int8x16_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int8x16_t v24;
  _OWORD v25[2];
  __int128 v26;
  float64x2_t v27;
  __int128 v28;
  float64x2_t v29;
  __int128 v30;
  float64x2_t v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[UIEvent _hidEvent](self, "_hidEvent");
  TimeStamp = IOHIDEventGetTimeStamp();
  v5 = _UIMediaTimeForMachTime(TimeStamp);
  v33 = xmmword_186682998;
  v34 = unk_1866829A8;
  v35 = xmmword_1866829B8;
  v36 = unk_1866829C8;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  memset(v25, 0, sizeof(v25));
  *(_QWORD *)&v26 = 0;
  IOHIDEventGetFloatMultiple();
  *(_QWORD *)&v19 = IOHIDEventGetSenderID();
  *((_QWORD *)&v26 + 1) = fmax(0.0, 0.0);
  v27 = vmaxnmq_f64(vnegq_f64((float64x2_t)vextq_s8(*(int8x16_t *)((char *)v25 + 8), *(int8x16_t *)((char *)v25 + 8), 8uLL)), (float64x2_t)0);
  *(_QWORD *)&v28 = *((_QWORD *)&v26 + 1);
  *((_QWORD *)&v28 + 1) = *((_QWORD *)&v26 + 1);
  v29 = vmaxnmq_f64(vnegq_f64((float64x2_t)vextq_s8((int8x16_t)0, (int8x16_t)0, 8uLL)), (float64x2_t)0);
  *(_QWORD *)&v30 = *((_QWORD *)&v26 + 1);
  *((_QWORD *)&v30 + 1) = *((_QWORD *)&v26 + 1);
  v31 = vmaxnmq_f64((float64x2_t)vextq_s8(v24, v24, 8uLL), (float64x2_t)0);
  v32 = *((double *)&v26 + 1);
  if ((_QWORD)v19 == self->_previousState.senderID || !self->_activeComponent)
  {
    if (self->_responderDeliveryPolicy == 1)
    {
      v6 = (void *)UIApp;
      _UIEventHIDUIWindowForHIDEvent();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "_pressesEventForWindow:", v7);

      objc_msgSend(v8, "_setHIDEvent:", v3);
      objc_msgSend(v8, "_setGSEvent:", -[UIEvent _gsEvent](self, "_gsEvent"));
      v9 = -[_UIGameControllerEvent _processStandardButtons:pressesEvent:timestamp:](self, "_processStandardButtons:pressesEvent:timestamp:", &v19, v8, v5);
      v10 = v9;
      switch(self->_activeComponent)
      {
        case 0uLL:
          v11 = -[_UIGameControllerEvent _determineInputTypeAndProcess:pressesEvent:timestamp:](self, "_determineInputTypeAndProcess:pressesEvent:timestamp:", &v19, v8, v5);
          goto LABEL_12;
        case 1uLL:
          v11 = -[_UIGameControllerEvent _processDPad:pressesEvent:timestamp:](self, "_processDPad:pressesEvent:timestamp:", &v19, v8, v5);
          goto LABEL_12;
        case 2uLL:
          v11 = -[_UIGameControllerEvent _processLeftStick:pressesEvent:timestamp:](self, "_processLeftStick:pressesEvent:timestamp:", &v19, v8, v5);
          goto LABEL_12;
        case 3uLL:
          v11 = -[_UIGameControllerEvent _processRightStick:pressesEvent:timestamp:](self, "_processRightStick:pressesEvent:timestamp:", &v19, v8, v5);
          goto LABEL_12;
        case 5uLL:
          v11 = -[_UIGameControllerEvent _processShoulder:pressesEvent:timestamp:](self, "_processShoulder:pressesEvent:timestamp:", &v19, v8, v5);
LABEL_12:
          if (v10 || v11)
            goto LABEL_13;
          break;
        default:
          if (!v9)
            break;
LABEL_13:
          objc_msgSend((id)UIApp, "sendEvent:", v8, (_QWORD)v19);
          objc_msgSend((id)UIApp, "_finishButtonEvent:", v8);
          break;
      }
    }
    v12 = v31;
    *(_OWORD *)&self->_previousState.normalizedRightStickState[3] = v30;
    *(float64x2_t *)&self->_previousState.normalizedShoulderButtonState[1] = v12;
    self->_previousState.normalizedShoulderButtonState[3] = v32;
    v13 = v27;
    *(_OWORD *)&self->_previousState.controllerState[15] = v26;
    *(float64x2_t *)&self->_previousState.normalizedLeftStickState[1] = v13;
    v14 = v29;
    *(_OWORD *)&self->_previousState.normalizedLeftStickState[3] = v28;
    *(float64x2_t *)&self->_previousState.normalizedRightStickState[1] = v14;
    v15 = v24;
    *(_OWORD *)&self->_previousState.controllerState[7] = v23;
    *(int8x16_t *)&self->_previousState.controllerState[9] = v15;
    v16 = v25[1];
    *(_OWORD *)&self->_previousState.controllerState[11] = v25[0];
    *(_OWORD *)&self->_previousState.controllerState[13] = v16;
    v17 = v20;
    *(_OWORD *)&self->_previousState.senderID = v19;
    *(_OWORD *)&self->_previousState.controllerState[1] = v17;
    v18 = v22;
    *(_OWORD *)&self->_previousState.controllerState[3] = v21;
    *(_OWORD *)&self->_previousState.controllerState[5] = v18;
  }
}

- (CGPoint)_leftStickPosition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = self->_previousState.controllerState[12];
  v3 = self->_previousState.controllerState[13];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_determineInputTypeAndProcess:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  id v8;
  BOOL v9;
  unint64_t v10;
  char v12;
  char v13;
  char v14;
  char v15;

  v8 = a4;
  v15 = 0;
  _UIAppGameControllerProcessDPad((double *)&self->_previousState.senderID, (double *)&a3->var0, v8, &v15, 0, a5);
  if (v15)
  {
    v9 = 1;
    self->_activeComponent = 1;
    goto LABEL_8;
  }
  v14 = 0;
  _UIAppGameControllerProcessGenericStick(2, self->_previousState.normalizedLeftStickState, a3->var2, v8, &v14, 0, a5);
  if (v14)
  {
    v10 = 2;
LABEL_7:
    self->_activeComponent = v10;
    v9 = 1;
    goto LABEL_8;
  }
  v13 = 0;
  _UIAppGameControllerProcessGenericStick(3, self->_previousState.normalizedRightStickState, a3->var3, v8, &v13, 0, a5);
  if (v13)
  {
    v10 = 3;
    goto LABEL_7;
  }
  v12 = 0;
  _UIAppGameControllerProcessShoulders((double *)&self->_previousState.senderID, (double *)&a3->var0, v8, &v12, 0, a5);
  v9 = v12 != 0;
  if (v12)
    self->_activeComponent = 5;
LABEL_8:

  return v9;
}

- (BOOL)_processStandardButtons:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  $F88649D8E0B3A22422F11C58801600B4 *p_previousState;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a4;
  objc_msgSend(v8, "_hidEvent");
  BKSHIDEventGetBaseAttributes();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "contextID");

  p_previousState = &self->_previousState;
  _UIAppGameControllerPressInfoForState(4, 4, v10, self->_previousState.controllerState[4], a3->var1[4], a5);
  v12 = objc_claimAutoreleasedReturnValue();
  _UIAppGameControllerPressInfoForState(5, 4, v10, p_previousState->controllerState[5], a3->var1[5], a5);
  v13 = objc_claimAutoreleasedReturnValue();
  _UIAppGameControllerPressInfoForState(6, 4, v10, p_previousState->controllerState[6], a3->var1[6], a5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v8, v12);
  if (v13)
    objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v8, v13);
  if (v14)
    objc_msgSend((id)UIApp, "_prepareButtonEvent:withPressInfo:", v8, v14);

  return (v12 | v13 | v14) != 0;
}

- (BOOL)_processDPad:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7;

  v7 = 0;
  _UIAppGameControllerProcessDPad((double *)&self->_previousState.senderID, (double *)&a3->var0, a4, (_BYTE *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7)
    self->_activeComponent = 0;
  return HIBYTE(v7);
}

- (BOOL)_processLeftStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7;

  v7 = 0;
  _UIAppGameControllerProcessGenericStick(2, self->_previousState.normalizedLeftStickState, a3->var2, a4, (_BYTE *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7)
    self->_activeComponent = 0;
  return HIBYTE(v7);
}

- (BOOL)_processRightStick:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7;

  v7 = 0;
  _UIAppGameControllerProcessGenericStick(3, self->_previousState.normalizedRightStickState, a3->var3, a4, (_BYTE *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7)
    self->_activeComponent = 0;
  return HIBYTE(v7);
}

- (BOOL)_processShoulder:(id *)a3 pressesEvent:(id)a4 timestamp:(double)a5
{
  __int16 v7;

  v7 = 0;
  _UIAppGameControllerProcessShoulders((double *)&self->_previousState.senderID, (double *)&a3->var0, a4, (_BYTE *)&v7 + 1, &v7, a5);
  if ((_BYTE)v7)
    self->_activeComponent = 0;
  return HIBYTE(v7);
}

@end
