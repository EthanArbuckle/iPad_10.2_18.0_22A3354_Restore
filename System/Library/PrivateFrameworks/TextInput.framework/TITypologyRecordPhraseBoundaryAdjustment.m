@implementation TITypologyRecordPhraseBoundaryAdjustment

- (TITypologyRecordPhraseBoundaryAdjustment)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordPhraseBoundaryAdjustment *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  uint64_t v8;
  TIKeyboardConfiguration *keyboardConfig;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordPhraseBoundaryAdjustment;
  v5 = -[TITypologyRecord initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_forwardAdjustment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forwardAdjustment"));
    v5->_granularity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("granularity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardConfig"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordPhraseBoundaryAdjustment;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_forwardAdjustment, CFSTR("forwardAdjustment"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_granularity, CFSTR("granularity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardConfig, CFSTR("keyboardConfig"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordPhraseBoundaryAdjustment keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordPhraseBoundaryAdjustment setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[TITypologyRecordPhraseBoundaryAdjustment forwardAdjustment](self, "forwardAdjustment"))
    v4 = "YES";
  else
    v4 = "NO";
  v5 = -[TITypologyRecordPhraseBoundaryAdjustment granularity](self, "granularity");
  -[TITypologyRecordPhraseBoundaryAdjustment keyboardConfig](self, "keyboardConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intermediateText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ADJUST PHRASE BOUNDARY forward = %s; granularity = %d; %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordPhraseBoundaryAdjustment keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (BOOL)forwardAdjustment
{
  return self->_forwardAdjustment;
}

- (void)setForwardAdjustment:(BOOL)a3
{
  self->_forwardAdjustment = a3;
}

- (int)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int)a3
{
  self->_granularity = a3;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setKeyboardConfig:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordPhraseBoundaryAdjustment:", self);
}

@end
