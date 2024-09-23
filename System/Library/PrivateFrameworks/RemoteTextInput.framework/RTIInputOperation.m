@implementation RTIInputOperation

- (void)setCustomInfoType:(id)a3
{
  objc_storeStrong((id *)&self->_customInfoType, a3);
}

- (void)setCustomInfo:(id)a3
{
  objc_storeStrong((id *)&self->_customInfo, a3);
}

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  +[RTIUtilities registerCustomInfoClasses:forType:forClass:](RTIUtilities, "registerCustomInfoClasses:forType:forClass:", v6, v5, objc_opt_class());

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_customInfoType, 0);
  objc_storeStrong((id *)&self->_keyboardInput, 0);
}

- (void)setActionSelector:(SEL)a3
{
  self->_actionSelector = a3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  -[RTIInputOperation keyboardInput](self, "keyboardInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTIInputOperation keyboardInput](self, "keyboardInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("keyboardInput"));

  }
  if (-[RTIInputOperation actionSelector](self, "actionSelector"))
  {
    NSStringFromSelector(-[RTIInputOperation actionSelector](self, "actionSelector"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("inputActionSelectorKey"));

  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[RTIInputOperation inputModality](self, "inputModality"), CFSTR("inputModalityKey"));
  -[RTIInputOperation customInfoType](self, "customInfoType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTIInputOperation customInfoType](self, "customInfoType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("customInfoTypeKey"));

  }
  -[RTIInputOperation customInfo](self, "customInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTIInputOperation customInfo](self, "customInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("customInfoKey"));

  }
}

- (NSSecureCoding)customInfo
{
  return self->_customInfo;
}

- (NSString)customInfoType
{
  return self->_customInfoType;
}

- (TIKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (int)inputModality
{
  return self->_inputModality;
}

- (RTIInputOperation)initWithCoder:(id)a3
{
  id v4;
  RTIInputOperation *v5;
  uint64_t v6;
  TIKeyboardInput *keyboardInput;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  NSString *customInfoType;
  NSString *v12;
  void *v13;
  uint64_t v14;
  NSSecureCoding *customInfo;
  objc_super v17;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v17.receiver = self;
  v17.super_class = (Class)RTIInputOperation;
  v5 = -[RTIInputOperation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardInput = v5->_keyboardInput;
    v5->_keyboardInput = (TIKeyboardInput *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputActionSelectorKey"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v5->_actionSelector = NSSelectorFromString(v8);
    v5->_inputModality = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputModalityKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customInfoTypeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    customInfoType = v5->_customInfoType;
    v5->_customInfoType = (NSString *)v10;

    v12 = v5->_customInfoType;
    if (v12)
    {
      +[RTIUtilities customInfoClassesForType:forClass:](RTIUtilities, "customInfoClassesForType:forClass:", v12, objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("customInfoKey"));
        v14 = objc_claimAutoreleasedReturnValue();
        customInfo = v5->_customInfo;
        v5->_customInfo = (NSSecureCoding *)v14;

      }
    }

  }
  return v5;
}

- (SEL)actionSelector
{
  return self->_actionSelector;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RTIInputOperation *v4;
  RTIInputOperation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;

  v4 = (RTIInputOperation *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTIInputOperation keyboardInput](self, "keyboardInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIInputOperation keyboardInput](v5, "keyboardInput");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTIInputOperation keyboardInput](self, "keyboardInput");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIInputOperation keyboardInput](v5, "keyboardInput");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[RTIInputOperation customInfoType](self, "customInfoType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIInputOperation customInfoType](v5, "customInfoType");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        -[RTIInputOperation customInfoType](self, "customInfoType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIInputOperation customInfoType](v5, "customInfoType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_15;
      }
      -[RTIInputOperation customInfo](self, "customInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIInputOperation customInfo](v5, "customInfo");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        -[RTIInputOperation customInfo](self, "customInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIInputOperation customInfo](v5, "customInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
        {
LABEL_15:
          v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v27 = -[RTIInputOperation inputModality](self, "inputModality");
      v14 = v27 == -[RTIInputOperation inputModality](v5, "inputModality");
      goto LABEL_18;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (void)unregisterCustomInfoType:(id)a3
{
  id v3;

  v3 = a3;
  +[RTIUtilities unregisterCustomInfoType:forClass:](RTIUtilities, "unregisterCustomInfoType:forClass:", v3, objc_opt_class());

}

- (void)setKeyboardInput:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardInput, a3);
}

- (void)setInputModality:(int)a3
{
  self->_inputModality = a3;
}

@end
