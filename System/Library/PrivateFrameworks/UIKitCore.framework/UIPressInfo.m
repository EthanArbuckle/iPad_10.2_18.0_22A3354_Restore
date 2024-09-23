@implementation UIPressInfo

- (UIPressInfo)init
{
  UIPressInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPressInfo;
  result = -[UIPressInfo init](&v3, sel_init);
  if (result)
    result->_clickCount = 1;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[UIPressInfo phase](self, "phase");
  v6 = -[UIPressInfo type](self, "type");
  -[UIPressInfo force](self, "force");
  v8 = v7;
  -[UIPressInfo _sourceDescription](self, "_sourceDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p phase=%ld type=%ld force=%f, source=%@, contextID=%u>"), v4, self, v5, v6, v8, v9, -[UIPressInfo contextID](self, "contextID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_sourceDescription
{
  unint64_t v2;

  v2 = self->_source - 1;
  if (v2 > 2)
    return CFSTR("Unknown");
  else
    return off_1E16DF208[v2];
}

+ (id)_keyboardPressInfoForType:(int64_t)a3 isKeyDown:(BOOL)a4 timestamp:(double)a5 contextID:(unsigned int)a6 modifierFlags:(int64_t)a7
{
  uint64_t v8;
  _BOOL4 v10;
  id v12;
  double v13;
  uint64_t v14;

  v8 = *(_QWORD *)&a6;
  v10 = a4;
  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setType:", a3);
  v13 = 0.0;
  if (v10)
  {
    v13 = 1.0;
    v14 = 0;
  }
  else
  {
    v14 = 3;
  }
  objc_msgSend(v12, "setForce:", v13);
  objc_msgSend(v12, "setPhase:", v14);
  objc_msgSend(v12, "setTimestamp:", a5);
  objc_msgSend(v12, "setSource:", 1);
  objc_msgSend(v12, "setContextID:", v8);
  objc_msgSend(v12, "setModifierFlags:", a7);
  return v12;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)gameControllerComponent
{
  return self->_gameControllerComponent;
}

- (void)setGameControllerComponent:(unint64_t)a3
{
  self->_gameControllerComponent = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
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

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
