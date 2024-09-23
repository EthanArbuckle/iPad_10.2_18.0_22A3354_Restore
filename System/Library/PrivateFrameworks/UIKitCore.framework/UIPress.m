@implementation UIPress

- (NSArray)gestureRecognizers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_gestureRecognizers, "copy");
}

- (void)setGestureRecognizers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *gestureRecognizers;

  if (self->_gestureRecognizers != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    gestureRecognizers = self->_gestureRecognizers;
    self->_gestureRecognizers = v4;

  }
}

- (void)_removeGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_gestureRecognizers, "containsObject:"))
    -[NSMutableArray removeObject:](self->_gestureRecognizers, "removeObject:", v4);

}

- (id)_mutableForwardingRecord
{
  NSMutableArray *forwardingRecord;
  NSMutableArray *v4;
  NSMutableArray *v5;

  forwardingRecord = self->_forwardingRecord;
  if (!forwardingRecord)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_forwardingRecord;
    self->_forwardingRecord = v4;

    forwardingRecord = self->_forwardingRecord;
  }
  return forwardingRecord;
}

- (BOOL)_isAbandoningForwardingRecord
{
  return self->_abandonForwardingRecord;
}

- (void)_abandonForwardingRecord
{
  NSMutableArray *forwardingRecord;

  self->_abandonForwardingRecord = 1;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;

}

- (id)_forwardingRecord
{
  return self->_forwardingRecord;
}

- (SEL)_responderSelectorForPhase:(int64_t)a3
{
  if (a3 == 4)
    return sel_pressesCancelled_withEvent_;
  if (a3 == 3)
    return sel_pressesEnded_withEvent_;
  if (a3)
    return 0;
  return sel_pressesBegan_withEvent_;
}

- (BOOL)_isDirectionalPress
{
  return self->_type < 4uLL;
}

- (BOOL)_isAnalogStickPress
{
  return (self->_gameControllerComponent & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  UIPressPhase v5;
  UIPressType v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[UIPress phase](self, "phase");
  v6 = -[UIPress type](self, "type");
  -[UIPress force](self, "force");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p phase=%ld type=%ld force=%f>"), v4, self, v5, v6, v7);
}

- (id)_phaseDescription
{
  unint64_t phase;

  phase = self->_phase;
  if (phase > 4)
    return CFSTR("Unknown");
  else
    return off_1E16DF1E0[phase];
}

- (BOOL)_isSynthetic
{
  unint64_t source;

  source = self->_source;
  return self->_type == 4 && source == 2 || source == 3;
}

- (unint64_t)_eventComponentType
{
  return 1;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  int64_t phase;
  void *v3;
  void *v4;

  phase = self->_phase;
  _eventComponentPhaseMapping_0();
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

  _eventComponentPhaseMapping_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _eventComponentPhaseForValue(a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_loadStateFromPress:(id)a3
{
  UIResponder *v5;
  UIResponder *responder;
  id v7;

  self->_timestamp = *((double *)a3 + 4);
  self->_phase = *((_QWORD *)a3 + 5);
  self->_type = *((_QWORD *)a3 + 6);
  self->_force = *((double *)a3 + 9);
  self->_source = *((_QWORD *)a3 + 12);
  self->_gameControllerComponent = *((_QWORD *)a3 + 13);
  self->_isDelayed = *((_BYTE *)a3 + 25);
  self->_sentPressesEnded = *((_BYTE *)a3 + 26);
  v5 = (UIResponder *)*((id *)a3 + 8);
  responder = self->_responder;
  self->_responder = v5;
  v7 = a3;

  objc_storeStrong((id *)&self->_window, *((id *)v7 + 7));
  self->_clickCount = *((_QWORD *)v7 + 14);
  self->_longClick = *((_BYTE *)v7 + 27);
  LODWORD(responder) = *((_DWORD *)v7 + 7);

  self->_contextID = responder;
}

- (void)_loadStateFromPressInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  UIKey *v7;
  UIKey *key;
  int64_t v9;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  self->_timestamp = v5;
  self->_phase = objc_msgSend(v4, "phase");
  self->_type = objc_msgSend(v4, "type");
  objc_msgSend(v4, "force");
  self->_force = v6;
  self->_source = objc_msgSend(v4, "source");
  self->_gameControllerComponent = objc_msgSend(v4, "gameControllerComponent");
  self->_clickCount = objc_msgSend(v4, "clickCount");
  self->_longClick = objc_msgSend(v4, "isLongClick");
  self->_contextID = objc_msgSend(v4, "contextID");
  objc_msgSend(v4, "key");
  v7 = (UIKey *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  self->_key = v7;

  v9 = objc_msgSend(v4, "modifierFlags");
  self->_modifierFlags = v9;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (UIPressPhase)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (UIPressType)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
  objc_storeStrong((id *)&self->_responder, a3);
}

- (CGFloat)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (UIKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (unint64_t)_source
{
  return self->_source;
}

- (void)_setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)_gameControllerComponent
{
  return self->_gameControllerComponent;
}

- (void)_setGameControllerComponent:(unint64_t)a3
{
  self->_gameControllerComponent = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_isDelayed = a3;
}

- (BOOL)sentPressesEnded
{
  return self->_sentPressesEnded;
}

- (void)setSentPressesEnded:(BOOL)a3
{
  self->_sentPressesEnded = a3;
}

- (unint64_t)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(unint64_t)a3
{
  self->_clickCount = a3;
}

- (BOOL)isLongClick
{
  return self->_longClick;
}

- (void)setLongClick:(BOOL)a3
{
  self->_longClick = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_forwardingRecord, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end
