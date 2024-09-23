@implementation TITextInputTraits

- (void)setTextContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRecentInputIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setKeyboardType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFF83F | ((a3 & 0x1F) << 6));
}

- (void)setReturnKeyType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFF83FFF | ((a3 & 0x1F) << 14));
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFF3 | (4 * (a3 & 3)));
}

- (void)setTextScriptType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFF87FFFF | ((a3 & 0xF) << 19));
}

- (void)setSpellCheckingType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFCF | (16 * (a3 & 3)));
}

- (void)setKeyboardAppearance:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFC7FF | ((a3 & 7) << 11));
}

- (void)setInlineCompletionType:(unint64_t)a3
{
  LOBYTE(self->_auxMask.integerValue) = self->_auxMask.integerValue & 0xFC | a3 & 3;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFFC | a3 & 3);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0x40000000;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(v3 & 0xC0000000 | self->_mask.integerValue & 0x3FFFFFFF);
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (void)setDisablePrediction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (BOOL)secureTextEntry
{
  return *((_BYTE *)&self->_mask.fields + 3) & 1;
}

- (unint64_t)autocapitalizationType
{
  return self->_mask.integerValue & 3;
}

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0x10000000;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xCFFFFFFF | v3);
}

- (void)setSmartInsertDeleteEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0x4000000;
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xF3FFFFFF | v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInputIdentifier, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)keyboardType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 6) & 0x1F;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TITextInputTraits *v4;
  TITextInputTraits *v5;
  uint64_t v6;
  NSString *recentInputIdentifier;
  uint64_t v8;
  NSString *textContentType;

  v4 = objc_alloc_init(TITextInputTraits);
  v5 = v4;
  if (v4)
  {
    v4->_version = self->_version;
    v4->_mask.integerValue = self->_mask.integerValue;
    v4->_auxMask.integerValue = self->_auxMask.integerValue;
    v6 = -[NSString copy](self->_recentInputIdentifier, "copy");
    recentInputIdentifier = v5->_recentInputIdentifier;
    v5->_recentInputIdentifier = (NSString *)v6;

    v8 = -[NSString copy](self->_textContentType, "copy");
    textContentType = v5->_textContentType;
    v5->_textContentType = (NSString *)v8;

    v5->_allowsTextAnimationsType = self->_allowsTextAnimationsType;
  }
  return v5;
}

- (TITextInputTraits)init
{
  TITextInputTraits *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TITextInputTraits;
  result = -[TITextInputTraits init](&v3, sel_init);
  if (result)
    result->_version = 2;
  return result;
}

- (TITextInputTraits)initWithCoder:(id)a3
{
  id v4;
  TITextInputTraits *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *recentInputIdentifier;
  void *v15;
  uint64_t v16;
  NSString *textContentType;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TITextInputTraits;
  v5 = -[TITextInputTraits init](&v19, sel_init);
  if (!v5)
    goto LABEL_19;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("version")))
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5->_version = 1;
      goto LABEL_9;
    }
    v6 = objc_msgSend(v4, "tiVersion");
  }
  v5->_version = v6;
  if (v6 == 1)
  {
LABEL_9:
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    v9 = v8 & 0xC000000;
    if ((v8 & 0x400000) != 0)
      v9 = 0x8000000;
    v10 = v8 & 0x30000000;
    if ((v8 & 0x800000) != 0)
      v10 = 0x20000000;
    v11 = v8 & 0xC0000000;
    if ((v8 & 0x1000000) != 0)
      v11 = 0x80000000;
    v7 = v8 & 0x20003FF | (((v8 >> 10) & 3) << 11) & 0xFFFFFFFFFE043FFFLL | ((unint64_t)((unsigned __int16)v8 >> 12) << 14) & 0xFFFFFFFFFE07FFFFLL | (((v8 >> 16) & 0x3F) << 19) | v9 | v10 | v11;
    goto LABEL_16;
  }
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
LABEL_16:
  v5->_mask.integerValue = v7;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("auxFlags")))
    v5->_auxMask.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("auxFlags"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recentInputIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  recentInputIdentifier = v5->_recentInputIdentifier;
  v5->_recentInputIdentifier = (NSString *)v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textContentType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  textContentType = v5->_textContentType;
  v5->_textContentType = (NSString *)v16;

  v5->_allowsTextAnimationsType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("allowsTextAnimationsType"));
LABEL_19:

  return v5;
}

- (NSString)recentInputIdentifier
{
  return self->_recentInputIdentifier;
}

- (unint64_t)returnKeyType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 14) & 0x1F;
}

- (unint64_t)autocorrectionType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 2) & 3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  int64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int64_t integerValue;
  NSString *recentInputIdentifier;
  NSString *textContentType;
  int64_t allowsTextAnimationsType;
  void *v18;
  id v19;

  v19 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    version = objc_msgSend(v19, "tiVersion");
    self->_version = version;
    if (!version)
      goto LABEL_19;
  }
  else
  {
    version = self->_version;
    if (!version)
    {
LABEL_19:
      integerValue = self->_mask.integerValue;
      goto LABEL_20;
    }
  }
  objc_msgSend(v19, "encodeInteger:forKey:", version, CFSTR("version"));
  if (self->_version != 1)
    goto LABEL_19;
  v5 = self->_mask.integerValue;
  v6 = v5 & 0x3F;
  v7 = (v5 >> 6) & 0x1F;
  v8 = v7 - 16;
  v9 = v7 == 15;
  v10 = v5 & 0x3FF;
  if (v9)
    v10 = v6 | 0x80;
  if (v8 >= 2)
    v6 = v10;
  v11 = (v5 >> 11) & 7;
  v12 = v6 | 0x400;
  if (v11 == 3)
    v13 = v6 | 0x400;
  else
    v13 = v6 & 0xFFFFF3FF | (((v5 >> 11) & 3) << 10);
  if (v11 != 4)
    v6 = v13;
  if (v11 == 5)
    v6 = v12;
  integerValue = v6 | (((v5 >> 3) & 0x3F0000 | v5 & 0xC2000000 | (((v5 & 0xC0000000) != 0x40000000) << 24) & 0xC3FFFFFF | (v5 >> 2) & 0xF000 | (((v5 >> 26) & 3) << 26) & 0xCFFFFFFF | (((v5 >> 28) & 3) << 28) | ((((v5 >> 26) & 3) != 1) << 22))
                     + ((((v5 >> 28) & 3) != 1) << 23));
LABEL_20:
  objc_msgSend(v19, "encodeInteger:forKey:", integerValue, CFSTR("flags"));
  objc_msgSend(v19, "encodeInteger:forKey:", self->_auxMask.integerValue, CFSTR("auxFlags"));
  recentInputIdentifier = self->_recentInputIdentifier;
  if (recentInputIdentifier)
    objc_msgSend(v19, "encodeObject:forKey:", recentInputIdentifier, CFSTR("recentInputIdentifier"));
  textContentType = self->_textContentType;
  if (textContentType)
    objc_msgSend(v19, "encodeObject:forKey:", textContentType, CFSTR("textContentType"));
  allowsTextAnimationsType = self->_allowsTextAnimationsType;
  v18 = v19;
  if (allowsTextAnimationsType)
  {
    objc_msgSend(v19, "encodeInteger:forKey:", allowsTextAnimationsType, CFSTR("allowsTextAnimationsType"));
    v18 = v19;
  }

}

- (unint64_t)spellCheckingType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 4) & 3;
}

- (unint64_t)keyboardAppearance
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 11) & 7;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (unint64_t)textScriptType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 19) & 0xF;
}

- (BOOL)smartInsertDeleteEnabled
{
  return (self->_mask.integerValue & 0xC000000) != 0x4000000;
}

- (BOOL)smartQuotesEnabled
{
  return (self->_mask.integerValue & 0x30000000) != 0x10000000;
}

- (BOOL)smartDashesEnabled
{
  return (unint64_t)self->_mask.integerValue >> 30 != 1;
}

- (unint64_t)smartInsertDeleteType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 26) & 3;
}

- (void)setSmartInsertDeleteType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xF3FFFFFF | ((a3 & 3) << 26));
}

- (unint64_t)smartQuotesType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 28) & 3;
}

- (void)setSmartQuotesType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xCFFFFFFF | ((a3 & 3) << 28));
}

- (unint64_t)smartDashesType
{
  return (unint64_t)LODWORD(self->_mask.integerValue) >> 30;
}

- (void)setSmartDashesType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0x3FFFFFFF | (a3 << 30));
}

- (BOOL)disablePrediction
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (unint64_t)inlineCompletionType
{
  return self->_auxMask.integerValue & 3;
}

- (int64_t)mathExpressionCompletionType
{
  return (uint64_t)(char)(16 * LOBYTE(self->_auxMask.integerValue)) >> 6;
}

- (void)setMathExpressionCompletionType:(int64_t)a3
{
  LOBYTE(self->_auxMask.integerValue) = self->_auxMask.integerValue & 0xF3 | (4 * (a3 & 3));
}

- (int64_t)allowsTextAnimationsType
{
  return self->_allowsTextAnimationsType;
}

- (void)setAllowsTextAnimationsType:(int64_t)a3
{
  self->_allowsTextAnimationsType = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  int64_t v27;
  int64_t v28;
  BOOL v29;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[TITextInputTraits version](self, "version");
    if (v6 != objc_msgSend(v5, "version"))
      goto LABEL_22;
    v7 = -[TITextInputTraits autocapitalizationType](self, "autocapitalizationType");
    if (v7 != objc_msgSend(v5, "autocapitalizationType"))
      goto LABEL_22;
    v8 = -[TITextInputTraits autocorrectionType](self, "autocorrectionType");
    if (v8 != objc_msgSend(v5, "autocorrectionType"))
      goto LABEL_22;
    v9 = -[TITextInputTraits spellCheckingType](self, "spellCheckingType");
    if (v9 != objc_msgSend(v5, "spellCheckingType"))
      goto LABEL_22;
    v10 = -[TITextInputTraits keyboardType](self, "keyboardType");
    if (v10 != objc_msgSend(v5, "keyboardType"))
      goto LABEL_22;
    v11 = -[TITextInputTraits keyboardAppearance](self, "keyboardAppearance");
    if (v11 != objc_msgSend(v5, "keyboardAppearance"))
      goto LABEL_22;
    v12 = -[TITextInputTraits returnKeyType](self, "returnKeyType");
    if (v12 != objc_msgSend(v5, "returnKeyType"))
      goto LABEL_22;
    v13 = -[TITextInputTraits enablesReturnKeyAutomatically](self, "enablesReturnKeyAutomatically");
    if (v13 != objc_msgSend(v5, "enablesReturnKeyAutomatically"))
      goto LABEL_22;
    v14 = -[TITextInputTraits secureTextEntry](self, "secureTextEntry");
    if (v14 != objc_msgSend(v5, "secureTextEntry"))
      goto LABEL_22;
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[TITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recentInputIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "_string:matchesString:", v16, v17);

    if (!(_DWORD)v15)
      goto LABEL_22;
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[TITextInputTraits textContentType](self, "textContentType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textContentType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v18, "_string:matchesString:", v19, v20);

    if (!(_DWORD)v18)
      goto LABEL_22;
    v21 = -[TITextInputTraits textScriptType](self, "textScriptType");
    if (v21 == objc_msgSend(v5, "textScriptType")
      && (v22 = -[TITextInputTraits smartInsertDeleteType](self, "smartInsertDeleteType"),
          v22 == objc_msgSend(v5, "smartInsertDeleteType"))
      && (v23 = -[TITextInputTraits smartQuotesType](self, "smartQuotesType"), v23 == objc_msgSend(v5, "smartQuotesType"))&& (v24 = -[TITextInputTraits smartDashesType](self, "smartDashesType"), v24 == objc_msgSend(v5, "smartDashesType"))&& (v25 = -[TITextInputTraits disablePrediction](self, "disablePrediction"), v25 == objc_msgSend(v5, "disablePrediction"))&& (v26 = -[TITextInputTraits inlineCompletionType](self, "inlineCompletionType"), v26 == objc_msgSend(v5, "inlineCompletionType"))&& (v27 = -[TITextInputTraits mathExpressionCompletionType](self, "mathExpressionCompletionType"), v27 == objc_msgSend(v5, "mathExpressionCompletionType")))
    {
      v28 = -[TITextInputTraits allowsTextAnimationsType](self, "allowsTextAnimationsType");
      v29 = v28 == objc_msgSend(v5, "allowsTextAnimationsType");
    }
    else
    {
LABEL_22:
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; version = %d"), self->_version);
  v4 = -[TITextInputTraits autocapitalizationType](self, "autocapitalizationType");
  if (v4 <= 3)
    objc_msgSend(v3, "appendString:", off_1E243B840[v4]);
  v5 = -[TITextInputTraits autocorrectionType](self, "autocorrectionType");
  if (v5 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B860[v5]);
  if (-[TITextInputTraits disablePrediction](self, "disablePrediction"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; disablePrediction = YES"));
  v6 = -[TITextInputTraits spellCheckingType](self, "spellCheckingType");
  if (v6 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B878[v6]);
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardType = %d"),
    -[TITextInputTraits keyboardType](self, "keyboardType"));
  v7 = -[TITextInputTraits keyboardAppearance](self, "keyboardAppearance");
  if (v7 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B890[v7]);
  objc_msgSend(v3, "appendFormat:", CFSTR("; returnKeyType = %d"),
    -[TITextInputTraits returnKeyType](self, "returnKeyType"));
  if (-[TITextInputTraits enablesReturnKeyAutomatically](self, "enablesReturnKeyAutomatically"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; enablesReturnKeyAutomatically = %s"), v8);
  if (-[TITextInputTraits secureTextEntry](self, "secureTextEntry"))
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; secureTextEntry = %s"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("; smartInsertDeleteType = %d"),
    -[TITextInputTraits smartInsertDeleteType](self, "smartInsertDeleteType"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; smartQuotesType = %d"),
    -[TITextInputTraits smartQuotesType](self, "smartQuotesType"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; smartDashesType = %d"),
    -[TITextInputTraits smartDashesType](self, "smartDashesType"));
  -[TITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TITextInputTraits recentInputIdentifier](self, "recentInputIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; recentInputIdentifier = %@"), v11);

  }
  -[TITextInputTraits textContentType](self, "textContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TITextInputTraits textContentType](self, "textContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textContentType = %@"), v13);

  }
  if (-[TITextInputTraits textScriptType](self, "textScriptType"))
  {
    v14 = -[TITextInputTraits textScriptType](self, "textScriptType") - 1;
    if (v14 <= 3)
      objc_msgSend(v3, "appendString:", off_1E243B8A8[v14]);
  }
  v15 = -[TITextInputTraits inlineCompletionType](self, "inlineCompletionType");
  if (v15 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B8C8[v15]);
  v16 = -[TITextInputTraits mathExpressionCompletionType](self, "mathExpressionCompletionType");
  if (v16 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B8E0[v16]);
  v17 = -[TITextInputTraits allowsTextAnimationsType](self, "allowsTextAnimationsType");
  if (v17 <= 2)
    objc_msgSend(v3, "appendString:", off_1E243B8F8[v17]);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

@end
