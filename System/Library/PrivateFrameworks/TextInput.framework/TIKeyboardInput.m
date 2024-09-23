@implementation TIKeyboardInput

- (BOOL)isAutoshifted
{
  return (LOWORD(self->_flags.integerValue) >> 1) & 1;
}

- (void)setAutoshifted:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFD | v3;
}

- (BOOL)isDoubleSpace
{
  return (LOWORD(self->_flags.integerValue) >> 7) & 1;
}

- (void)setDoubleSpace:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFF7F | v3;
}

- (BOOL)isExpandSegment
{
  return (LOWORD(self->_flags.integerValue) >> 10) & 1;
}

- (void)setExpandSegment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFBFF | v3;
}

- (BOOL)isFlick
{
  return (LOWORD(self->_flags.integerValue) >> 4) & 1;
}

- (void)setFlick:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFEF | v3;
}

- (BOOL)isGesture
{
  return (LOWORD(self->_flags.integerValue) >> 5) & 1;
}

- (void)setGesture:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFDF | v3;
}

- (BOOL)isMultitap
{
  return (LOWORD(self->_flags.integerValue) >> 3) & 1;
}

- (void)setMultitap:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFF7 | v3;
}

- (BOOL)isPopupVariant
{
  return (LOWORD(self->_flags.integerValue) >> 2) & 1;
}

- (void)setPopupVariant:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFB | v3;
}

- (BOOL)isRapidDelete
{
  return HIBYTE(LOWORD(self->_flags.integerValue)) & 1;
}

- (void)setRapidDelete:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFEFF | v3;
}

- (BOOL)isShiftDown
{
  return (LOWORD(self->_flags.integerValue) >> 9) & 1;
}

- (void)setShiftDown:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFDFF | v3;
}

- (BOOL)isShrinkSegment
{
  return (LOWORD(self->_flags.integerValue) >> 11) & 1;
}

- (void)setShrinkSegment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xF7FF | v3;
}

- (BOOL)isSynthesizedByAcceptingCandidate
{
  return (LOWORD(self->_flags.integerValue) >> 6) & 1;
}

- (void)setSynthesizedByAcceptingCandidate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFBF | v3;
}

- (BOOL)isUppercase
{
  return self->_flags.integerValue & 1;
}

- (void)setUppercase:(BOOL)a3
{
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFE | a3;
}

- (NSCopying)object
{
  return (NSCopying *)self->_handwritingStrokes;
}

- (void)setObject:(id)a3
{
  TIHandwritingStrokes *v4;
  TIHandwritingStrokes *handwritingStrokes;

  v4 = (TIHandwritingStrokes *)a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  handwritingStrokes = self->_handwritingStrokes;
  self->_handwritingStrokes = v4;

}

- (TIKeyboardInput)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInput *v5;
  uint64_t v6;
  NSString *string;
  uint64_t v8;
  TIKeyboardOutput *output;
  uint64_t v10;
  TIHandwritingStrokes *handwritingStrokes;
  uint64_t v12;
  TIKeyboardTouchEvent *touchEvent;
  uint64_t v14;
  TIKeyboardCandidate *acceptedCandidate;
  uint64_t v16;
  NSString *inputManagerHint;
  TIKeyboardInput *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInput;
  v5 = -[TIKeyboardInput init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v6 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("output"));
    v8 = objc_claimAutoreleasedReturnValue();
    output = v5->_output;
    v5->_output = (TIKeyboardOutput *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handwritingStrokes"));
    v10 = objc_claimAutoreleasedReturnValue();
    handwritingStrokes = v5->_handwritingStrokes;
    v5->_handwritingStrokes = (TIHandwritingStrokes *)v10;

    v5->_backspace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backspace"));
    v5->_flags.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("touchEvent"));
    v12 = objc_claimAutoreleasedReturnValue();
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptedCandidate"));
    v14 = objc_claimAutoreleasedReturnValue();
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputManagerHint"));
    v16 = objc_claimAutoreleasedReturnValue();
    inputManagerHint = v5->_inputManagerHint;
    v5->_inputManagerHint = (NSString *)v16;

    v5->_transliterationType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("transliterateType"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *string;
  TIKeyboardOutput *output;
  TIHandwritingStrokes *handwritingStrokes;
  int64_t integerValue;
  TIKeyboardTouchEvent *touchEvent;
  TIKeyboardCandidate *acceptedCandidate;
  NSString *inputManagerHint;
  int64_t transliterationType;
  id v13;

  v4 = a3;
  string = self->_string;
  v13 = v4;
  if (string)
  {
    objc_msgSend(v4, "encodeObject:forKey:", string, CFSTR("string"));
    v4 = v13;
  }
  output = self->_output;
  if (output)
  {
    objc_msgSend(v13, "encodeObject:forKey:", output, CFSTR("output"));
    v4 = v13;
  }
  handwritingStrokes = self->_handwritingStrokes;
  if (handwritingStrokes)
  {
    objc_msgSend(v13, "encodeObject:forKey:", handwritingStrokes, CFSTR("handwritingStrokes"));
    v4 = v13;
  }
  if (self->_backspace)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("backspace"));
    v4 = v13;
  }
  integerValue = self->_flags.integerValue;
  if (integerValue)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", integerValue, CFSTR("flags"));
    v4 = v13;
  }
  touchEvent = self->_touchEvent;
  if (touchEvent)
  {
    objc_msgSend(v13, "encodeObject:forKey:", touchEvent, CFSTR("touchEvent"));
    v4 = v13;
  }
  acceptedCandidate = self->_acceptedCandidate;
  if (acceptedCandidate)
  {
    objc_msgSend(v13, "encodeObject:forKey:", acceptedCandidate, CFSTR("acceptedCandidate"));
    v4 = v13;
  }
  inputManagerHint = self->_inputManagerHint;
  if (inputManagerHint)
  {
    objc_msgSend(v13, "encodeObject:forKey:", inputManagerHint, CFSTR("inputManagerHint"));
    v4 = v13;
  }
  transliterationType = self->_transliterationType;
  if (transliterationType)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", transliterationType, CFSTR("transliterateType"));
    v4 = v13;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIKeyboardInput string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; string = \"%@\"), v4);

  -[TIKeyboardInput output](self, "output");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; output = \"%@\"), v5);

  -[TIKeyboardInput object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; object = \"%@\"), v6);

  v7 = -[TIKeyboardInput isBackspace](self, "isBackspace");
  v8 = "NO";
  if (v7)
    v8 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR("; backspace = %s"), v8);
  objc_msgSend(v3, "appendString:", CFSTR("; flags =("));
  if (-[TIKeyboardInput isUppercase](self, "isUppercase"))
    objc_msgSend(v3, "appendString:", CFSTR("isUpperCase "));
  if (-[TIKeyboardInput isAutoshifted](self, "isAutoshifted"))
    objc_msgSend(v3, "appendString:", CFSTR("isAutoshifted "));
  if (-[TIKeyboardInput isPopupVariant](self, "isPopupVariant"))
    objc_msgSend(v3, "appendString:", CFSTR("isPopupVariant "));
  if (-[TIKeyboardInput isMultitap](self, "isMultitap"))
    objc_msgSend(v3, "appendString:", CFSTR("isMultitap "));
  if (-[TIKeyboardInput isFlick](self, "isFlick"))
    objc_msgSend(v3, "appendString:", CFSTR("isFlick"));
  if (-[TIKeyboardInput isGesture](self, "isGesture"))
    objc_msgSend(v3, "appendString:", CFSTR("isGesture"));
  if (-[TIKeyboardInput isSynthesizedByAcceptingCandidate](self, "isSynthesizedByAcceptingCandidate"))
    objc_msgSend(v3, "appendString:", CFSTR("isSynthesizedByAcceptingCandidate "));
  if (-[TIKeyboardInput isDoubleSpace](self, "isDoubleSpace"))
    objc_msgSend(v3, "appendString:", CFSTR("isDoubleSpace "));
  if (-[TIKeyboardInput isRapidDelete](self, "isRapidDelete"))
    objc_msgSend(v3, "appendString:", CFSTR("isRapidDelete "));
  if (-[TIKeyboardInput isShiftDown](self, "isShiftDown"))
    objc_msgSend(v3, "appendString:", CFSTR("isShiftDown "));
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  -[TIKeyboardInput touchEvent](self, "touchEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; touchEvent = %@"), v9);

  -[TIKeyboardInput acceptedCandidate](self, "acceptedCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; acceptedCandidate = %@"), v10);

  -[TIKeyboardInput inputManagerHint](self, "inputManagerHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputManagerHint = %@"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("; transliterateType = %ld"),
    -[TIKeyboardInput transliterationType](self, "transliterationType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setAcceptedCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedCandidate, a3);
}

- (BOOL)isBackspace
{
  return self->_backspace;
}

- (void)setBackspace:(BOOL)a3
{
  self->_backspace = a3;
}

- (NSString)inputManagerHint
{
  return self->_inputManagerHint;
}

- (void)setInputManagerHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TIHandwritingStrokes)handwritingStrokes
{
  return self->_handwritingStrokes;
}

- (void)setHandwritingStrokes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void)setTouchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_touchEvent, a3);
}

- (TIKeyboardOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_touchEvent, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_handwritingStrokes, 0);
  objc_storeStrong((id *)&self->_inputManagerHint, 0);
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
