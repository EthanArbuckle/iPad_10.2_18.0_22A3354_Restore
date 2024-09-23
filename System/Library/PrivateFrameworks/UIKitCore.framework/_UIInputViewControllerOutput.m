@implementation _UIInputViewControllerOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_pushNewKeyboardOutput
{
  void *v3;
  void *v4;
  _UIInputViewKeyboardOutput *v5;
  id v6;

  -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInputViewControllerOutput setKeyboardOutputs:](self, "setKeyboardOutputs:", v4);

  }
  -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_UIInputViewKeyboardOutput);
  objc_msgSend(v6, "addObject:", v5);

}

- (id)_currentKeyboardOutput
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[_UIInputViewControllerOutput _pushNewKeyboardOutput](self, "_pushNewKeyboardOutput");
  -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIInputViewControllerOutput _currentKeyboardOutput](self, "_currentKeyboardOutput");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertText:", v4);

}

- (void)deleteBackward
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  -[_UIInputViewControllerOutput _currentKeyboardOutput](self, "_currentKeyboardOutput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[_UIInputViewControllerOutput _pushNewKeyboardOutput](self, "_pushNewKeyboardOutput");
    -[_UIInputViewControllerOutput _currentKeyboardOutput](self, "_currentKeyboardOutput");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(v6, "deleteBackward");

}

- (void)adjustTextPositionByCharacterOffset:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  -[_UIInputViewControllerOutput _currentKeyboardOutput](self, "_currentKeyboardOutput");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

  }
  else
  {
    v6 = objc_msgSend(v9, "deletionCount");

    if (!v6)
    {
      v8 = v9;
      goto LABEL_5;
    }
  }
  -[_UIInputViewControllerOutput _pushNewKeyboardOutput](self, "_pushNewKeyboardOutput");
  -[_UIInputViewControllerOutput _currentKeyboardOutput](self, "_currentKeyboardOutput");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v7;
LABEL_5:
  v10 = v8;
  objc_msgSend(v8, "setPositionOffset:", objc_msgSend(v8, "positionOffset") + a3);

}

- (void)setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6
{
  self->_inputModeListTouchPhase = a3;
  self->_inputModeListTouchBegan = a4;
  self->_inputModeListFromLocation = a5;
  self->_inputModeListUpdatePoint = a6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIInputViewControllerOutput *v4;
  uint64_t v5;
  NSArray *keyboardOutputs;
  uint64_t v7;
  NSString *primaryLanguage;
  uint64_t v9;
  NSString *markedText;

  v4 = objc_alloc_init(_UIInputViewControllerOutput);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", self->_keyboardOutputs, 1);
    keyboardOutputs = v4->_keyboardOutputs;
    v4->_keyboardOutputs = (NSArray *)v5;

    v4->_shouldDismiss = self->_shouldDismiss;
    v4->_proceedShouldReturn = self->_proceedShouldReturn;
    v4->_hasDictation = self->_hasDictation;
    v4->_shouldAdvanceInputMode = self->_shouldAdvanceInputMode;
    v4->_inputModeListTouchPhase = self->_inputModeListTouchPhase;
    v4->_inputModeListTouchBegan = self->_inputModeListTouchBegan;
    v4->_inputModeListFromLocation = self->_inputModeListFromLocation;
    v4->_inputModeListUpdatePoint = self->_inputModeListUpdatePoint;
    v7 = -[NSString copy](self->_primaryLanguage, "copy");
    primaryLanguage = v4->_primaryLanguage;
    v4->_primaryLanguage = (NSString *)v7;

    v4->_setMarkedText = self->_setMarkedText;
    v9 = -[NSString copy](self->_markedText, "copy");
    markedText = v4->_markedText;
    v4->_markedText = (NSString *)v9;

    v4->_selectedRange = self->_selectedRange;
    v4->_unmarkText = self->_unmarkText;
    v4->_source = self->_source;
  }
  return v4;
}

- (_UIInputViewControllerOutput)initWithCoder:(id)a3
{
  id v4;
  _UIInputViewControllerOutput *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *keyboardOutputs;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  NSString *primaryLanguage;
  uint64_t v18;
  NSString *markedText;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIInputViewControllerOutput;
  v5 = -[_UIInputViewControllerOutput init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keyboardOutputs"));
    v9 = objc_claimAutoreleasedReturnValue();
    keyboardOutputs = v5->_keyboardOutputs;
    v5->_keyboardOutputs = (NSArray *)v9;

    v5->_shouldDismiss = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDismiss"));
    v5->_proceedShouldReturn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proceedShouldReturn"));
    v5->_shouldAdvanceInputMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAdvanceInputMode"));
    v5->_hasDictation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDictation"));
    v5->_inputModeListTouchPhase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("setInputModeListTouchPhase"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("setInputModeListTouchBegan"));
    v5->_inputModeListTouchBegan = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("setInputModeListFromLocationX"));
    v5->_inputModeListFromLocation.x = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("setInputModeListFromLocationY"));
    v5->_inputModeListFromLocation.y = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("setInputModeUpdatePointX"));
    v5->_inputModeListUpdatePoint.x = v14;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("setInputModeUpdatePointY"));
    v5->_inputModeListUpdatePoint.y = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryLanguage"));
    v16 = objc_claimAutoreleasedReturnValue();
    primaryLanguage = v5->_primaryLanguage;
    v5->_primaryLanguage = (NSString *)v16;

    v5->_setMarkedText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("setMarkedText"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("markedText"));
    v18 = objc_claimAutoreleasedReturnValue();
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v18;

    v5->_selectedRange.location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedRangeLocation"));
    v5->_selectedRange.length = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedRangeLength"));
    v5->_unmarkText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unmarkText"));
    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *keyboardOutputs;
  double inputModeListTouchBegan;
  CGFloat x;
  CGFloat y;
  CGFloat v9;
  CGFloat v10;
  NSString *primaryLanguage;
  int64_t source;
  id v13;

  v4 = a3;
  keyboardOutputs = self->_keyboardOutputs;
  v13 = v4;
  if (keyboardOutputs)
  {
    objc_msgSend(v4, "encodeObject:forKey:", keyboardOutputs, CFSTR("keyboardOutputs"));
    v4 = v13;
  }
  if (self->_shouldDismiss)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("shouldDismiss"));
    v4 = v13;
  }
  if (self->_proceedShouldReturn)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("proceedShouldReturn"));
    v4 = v13;
  }
  if (self->_hasDictation)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("hasDictation"));
    v4 = v13;
  }
  if (self->_shouldAdvanceInputMode)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("shouldAdvanceInputMode"));
    v4 = v13;
  }
  if (self->_inputModeListTouchBegan != 0.0)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", self->_inputModeListTouchPhase, CFSTR("setInputModeListTouchPhase"));
    inputModeListTouchBegan = self->_inputModeListTouchBegan;
    *(float *)&inputModeListTouchBegan = inputModeListTouchBegan;
    objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("setInputModeListTouchBegan"), inputModeListTouchBegan);
    x = self->_inputModeListFromLocation.x;
    *(float *)&x = x;
    objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("setInputModeListFromLocationX"), x);
    y = self->_inputModeListFromLocation.y;
    *(float *)&y = y;
    objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("setInputModeListFromLocationY"), y);
    v9 = self->_inputModeListUpdatePoint.x;
    *(float *)&v9 = v9;
    objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("setInputModeUpdatePointX"), v9);
    v10 = self->_inputModeListUpdatePoint.y;
    *(float *)&v10 = v10;
    objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("setInputModeUpdatePointY"), v10);
    v4 = v13;
  }
  primaryLanguage = self->_primaryLanguage;
  if (primaryLanguage)
  {
    objc_msgSend(v13, "encodeObject:forKey:", primaryLanguage, CFSTR("primaryLanguage"));
    v4 = v13;
  }
  if (self->_setMarkedText)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("setMarkedText"));
    objc_msgSend(v13, "encodeObject:forKey:", self->_markedText, CFSTR("markedText"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_selectedRange.location, CFSTR("selectedRangeLocation"));
    objc_msgSend(v13, "encodeInteger:forKey:", self->_selectedRange.length, CFSTR("selectedRangeLength"));
    v4 = v13;
  }
  if (self->_unmarkText)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("unmarkText"));
    v4 = v13;
  }
  source = self->_source;
  if (source)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", source, CFSTR("source"));
    v4 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int64_t v50;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardOutputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_27;
    v9 = -[_UIInputViewControllerOutput shouldDismiss](self, "shouldDismiss");
    if (v9 != objc_msgSend(v5, "shouldDismiss"))
      goto LABEL_27;
    v10 = -[_UIInputViewControllerOutput proceedShouldReturn](self, "proceedShouldReturn");
    if (v10 != objc_msgSend(v5, "proceedShouldReturn"))
      goto LABEL_27;
    v11 = -[_UIInputViewControllerOutput hasDictation](self, "hasDictation");
    if (v11 != objc_msgSend(v5, "hasDictation"))
      goto LABEL_27;
    v12 = -[_UIInputViewControllerOutput shouldAdvanceInputMode](self, "shouldAdvanceInputMode");
    if (v12 != objc_msgSend(v5, "shouldAdvanceInputMode"))
      goto LABEL_27;
    -[_UIInputViewControllerOutput inputModeListTouchBegan](self, "inputModeListTouchBegan");
    v14 = v13;
    objc_msgSend(v5, "inputModeListTouchBegan");
    if (v14 != v15)
      goto LABEL_27;
    -[_UIInputViewControllerOutput inputModeListTouchBegan](self, "inputModeListTouchBegan");
    if (v16 != 0.0)
    {
      v17 = -[_UIInputViewControllerOutput inputModeListTouchPhase](self, "inputModeListTouchPhase");
      if (v17 != objc_msgSend(v5, "inputModeListTouchPhase"))
        goto LABEL_27;
      -[_UIInputViewControllerOutput inputModeListFromLocation](self, "inputModeListFromLocation");
      v19 = v18;
      v21 = v20;
      objc_msgSend(v5, "inputModeListFromLocation");
      v23 = 0;
      if (v19 != v24)
        goto LABEL_28;
      if (v21 != v22)
        goto LABEL_28;
      -[_UIInputViewControllerOutput inputModeListUpdatePoint](self, "inputModeListUpdatePoint");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v5, "inputModeListUpdatePoint");
      v23 = 0;
      if (v26 != v30 || v28 != v29)
        goto LABEL_28;
    }
    -[_UIInputViewControllerOutput primaryLanguage](self, "primaryLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryLanguage");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[_UIInputViewControllerOutput primaryLanguage](self, "primaryLanguage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "primaryLanguage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if (!v36)
        goto LABEL_27;
    }
    v37 = -[_UIInputViewControllerOutput setMarkedText](self, "setMarkedText");
    if (v37 == objc_msgSend(v5, "setMarkedText"))
    {
      -[_UIInputViewControllerOutput markedText](self, "markedText");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "markedText");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[_UIInputViewControllerOutput markedText](self, "markedText");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "markedText");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqualToString:", v42);

        if (!v43)
          goto LABEL_27;
      }
      v44 = -[_UIInputViewControllerOutput selectedRange](self, "selectedRange");
      v46 = v45;
      v23 = 0;
      if (v44 != objc_msgSend(v5, "selectedRange") || v46 != v47)
        goto LABEL_28;
      v48 = -[_UIInputViewControllerOutput unmarkText](self, "unmarkText");
      if (v48 == objc_msgSend(v5, "unmarkText"))
      {
        v50 = -[_UIInputViewControllerOutput source](self, "source");
        v23 = v50 == objc_msgSend(v5, "source");
        goto LABEL_28;
      }
    }
LABEL_27:
    v23 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v23 = 0;
LABEL_29:

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[_UIInputViewControllerOutput keyboardOutputs](self, "keyboardOutputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardOutputs = %@"), v4);

  if (-[_UIInputViewControllerOutput shouldDismiss](self, "shouldDismiss"))
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldDismiss = %s"), v5);
  if (-[_UIInputViewControllerOutput proceedShouldReturn](self, "proceedShouldReturn"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; proceedShouldReturn = %s"), v6);
  if (-[_UIInputViewControllerOutput hasDictation](self, "hasDictation"))
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; hasDictation = %s"), v7);
  if (-[_UIInputViewControllerOutput shouldAdvanceInputMode](self, "shouldAdvanceInputMode"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldAdvanceInputMode = %s"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputModeListTouchPhase = %ld"),
    -[_UIInputViewControllerOutput inputModeListTouchPhase](self, "inputModeListTouchPhase"));
  -[_UIInputViewControllerOutput inputModeListTouchBegan](self, "inputModeListTouchBegan");
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputModeListTouchBegan = %f"), v9);
  -[_UIInputViewControllerOutput inputModeListFromLocation](self, "inputModeListFromLocation");
  v11 = v10;
  -[_UIInputViewControllerOutput inputModeListFromLocation](self, "inputModeListFromLocation");
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputModeListFromLocation = %f:%f"), v11, v12);
  -[_UIInputViewControllerOutput inputModeListUpdatePoint](self, "inputModeListUpdatePoint");
  v14 = v13;
  -[_UIInputViewControllerOutput inputModeListUpdatePoint](self, "inputModeListUpdatePoint");
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputModeListUpdatePoint = %f:%f"), v14, v15);
  -[_UIInputViewControllerOutput primaryLanguage](self, "primaryLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; primaryLanguage = %@"), v16);

  if (-[_UIInputViewControllerOutput setMarkedText](self, "setMarkedText"))
    v17 = "YES";
  else
    v17 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; setMarkedText = %s"), v17);
  -[_UIInputViewControllerOutput markedText](self, "markedText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; markedText = %@"), v18);

  v19 = -[_UIInputViewControllerOutput selectedRange](self, "selectedRange");
  -[_UIInputViewControllerOutput selectedRange](self, "selectedRange");
  objc_msgSend(v3, "appendFormat:", CFSTR("; selectedRange location = %ld length = %ld"), v19, v20);
  if (-[_UIInputViewControllerOutput unmarkText](self, "unmarkText"))
    v21 = "YES";
  else
    v21 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; unmarkText = %s"), v21);
  objc_msgSend(v3, "appendFormat:", CFSTR("; source = %ld"), -[_UIInputViewControllerOutput source](self, "source"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)keyboardOutputs
{
  return self->_keyboardOutputs;
}

- (void)setKeyboardOutputs:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardOutputs, a3);
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (void)setShouldDismiss:(BOOL)a3
{
  self->_shouldDismiss = a3;
}

- (BOOL)proceedShouldReturn
{
  return self->_proceedShouldReturn;
}

- (void)setProceedShouldReturn:(BOOL)a3
{
  self->_proceedShouldReturn = a3;
}

- (BOOL)shouldAdvanceInputMode
{
  return self->_shouldAdvanceInputMode;
}

- (void)setShouldAdvanceInputMode:(BOOL)a3
{
  self->_shouldAdvanceInputMode = a3;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (void)setPrimaryLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasDictation
{
  return self->_hasDictation;
}

- (void)setHasDictation:(BOOL)a3
{
  self->_hasDictation = a3;
}

- (BOOL)setMarkedText
{
  return self->_setMarkedText;
}

- (void)setSetMarkedText:(BOOL)a3
{
  self->_setMarkedText = a3;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_NSRange)selectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRange.length;
  location = self->_selectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (BOOL)unmarkText
{
  return self->_unmarkText;
}

- (void)setUnmarkText:(BOOL)a3
{
  self->_unmarkText = a3;
}

- (int64_t)inputModeListTouchPhase
{
  return self->_inputModeListTouchPhase;
}

- (void)setInputModeListTouchPhase:(int64_t)a3
{
  self->_inputModeListTouchPhase = a3;
}

- (double)inputModeListTouchBegan
{
  return self->_inputModeListTouchBegan;
}

- (void)setInputModeListTouchBegan:(double)a3
{
  self->_inputModeListTouchBegan = a3;
}

- (CGPoint)inputModeListFromLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_inputModeListFromLocation.x;
  y = self->_inputModeListFromLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInputModeListFromLocation:(CGPoint)a3
{
  self->_inputModeListFromLocation = a3;
}

- (CGPoint)inputModeListUpdatePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_inputModeListUpdatePoint.x;
  y = self->_inputModeListUpdatePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInputModeListUpdatePoint:(CGPoint)a3
{
  self->_inputModeListUpdatePoint = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)requiresInputManagerSync
{
  return self->_requiresInputManagerSync;
}

- (void)setRequiresInputManagerSync:(BOOL)a3
{
  self->_requiresInputManagerSync = a3;
}

- (BOOL)shouldAdvanceResponder
{
  return self->_shouldAdvanceResponder;
}

- (void)setShouldAdvanceResponder:(BOOL)a3
{
  self->_shouldAdvanceResponder = a3;
}

- (BOOL)shouldPostReturnKeyNotification
{
  return self->_shouldPostReturnKeyNotification;
}

- (void)setShouldPostReturnKeyNotification:(BOOL)a3
{
  self->_shouldPostReturnKeyNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardOutputs, 0);
}

@end
