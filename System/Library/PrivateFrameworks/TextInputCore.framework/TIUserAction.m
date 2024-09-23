@implementation TIUserAction

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setOccurenceTime:(double)a3
{
  self->_occurenceTime = a3;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (TIUserAction)initWithTIKeyboardState:(id)a3
{
  id v5;
  TIUserAction *v6;
  TIUserAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIUserAction;
  v6 = -[TIUserAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyboardState, a3);
    v7->_occurenceTime = -1.0;
  }

  return v7;
}

- (void)setActionType:(int)a3
{
  self->_actionType = a3;
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (TIUserAction)initWithCoder:(id)a3
{
  id v4;
  TIUserAction *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  TIDocumentState *documentState;
  uint64_t v11;
  TIKeyboardState *keyboardState;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIUserAction;
  v5 = -[TIUserAction init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_endTime = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("occurenceTime"));
    v5->_occurenceTime = v8;
    v5->_actionType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("actionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v9 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v11 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime;
  id v5;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("startTime"), startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("occurenceTime"), self->_occurenceTime);
  objc_msgSend(v5, "encodeInt:forKey:", self->_actionType, CFSTR("actionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentState, CFSTR("documentState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TIUserAction documentState](self, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@<>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)occurenceTime
{
  return self->_occurenceTime;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
