@implementation WFTextFieldConfiguration

- (WFTextFieldConfiguration)init
{
  WFTextFieldConfiguration *v2;
  WFTextFieldConfiguration *v3;
  WFTextFieldConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTextFieldConfiguration;
  v2 = -[WFTextFieldConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowsNegativeNumbers = 1;
    v2->_focusImmediatelyWhenPresented = 1;
    v2->_initialInsertionIndex = -1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFTextFieldConfiguration prefix](self, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefix:", v5);

  -[WFTextFieldConfiguration text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  -[WFTextFieldConfiguration placeholder](self, "placeholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v7);

  objc_msgSend(v4, "setSecureTextEntry:", -[WFTextFieldConfiguration isSecureTextEntry](self, "isSecureTextEntry"));
  objc_msgSend(v4, "setMultiline:", -[WFTextFieldConfiguration isMultiline](self, "isMultiline"));
  objc_msgSend(v4, "setAllowsNegativeNumbers:", -[WFTextFieldConfiguration allowsNegativeNumbers](self, "allowsNegativeNumbers"));
  objc_msgSend(v4, "setAutoPeriodsDisabled:", -[WFTextFieldConfiguration autoPeriodsDisabled](self, "autoPeriodsDisabled"));
  objc_msgSend(v4, "setSmartQuotesDisabled:", -[WFTextFieldConfiguration smartQuotesDisabled](self, "smartQuotesDisabled"));
  objc_msgSend(v4, "setSmartDashesDisabled:", -[WFTextFieldConfiguration smartDashesDisabled](self, "smartDashesDisabled"));
  objc_msgSend(v4, "setTextReplacementDisabled:", -[WFTextFieldConfiguration textReplacementDisabled](self, "textReplacementDisabled"));
  -[WFTextFieldConfiguration keyboardType](self, "keyboardType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardType:", v8);

  -[WFTextFieldConfiguration clearButtonMode](self, "clearButtonMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClearButtonMode:", v9);

  -[WFTextFieldConfiguration autocapitalizationType](self, "autocapitalizationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocapitalizationType:", v10);

  -[WFTextFieldConfiguration autocorrectionType](self, "autocorrectionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocorrectionType:", v11);

  -[WFTextFieldConfiguration returnKeyType](self, "returnKeyType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", v12);

  -[WFTextFieldConfiguration textContentType](self, "textContentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextContentType:", v13);

  -[WFTextFieldConfiguration textAlignment](self, "textAlignment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", v14);

  objc_msgSend(v4, "setFocusImmediatelyWhenPresented:", -[WFTextFieldConfiguration focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"));
  objc_msgSend(v4, "setInitialInsertionIndex:", -[WFTextFieldConfiguration initialInsertionIndex](self, "initialInsertionIndex"));
  objc_msgSend(v4, "setShowsDateFormattingHint:", -[WFTextFieldConfiguration showsDateFormattingHint](self, "showsDateFormattingHint"));
  objc_msgSend(v4, "setDateFormatStyle:", -[WFTextFieldConfiguration dateFormatStyle](self, "dateFormatStyle"));
  objc_msgSend(v4, "setTimeFormatStyle:", -[WFTextFieldConfiguration timeFormatStyle](self, "timeFormatStyle"));
  objc_msgSend(v4, "setDateHintPrefersDateOnly:", -[WFTextFieldConfiguration dateHintPrefersDateOnly](self, "dateHintPrefersDateOnly"));
  objc_msgSend(v4, "setDoesRelativeDateFormatting:", -[WFTextFieldConfiguration doesRelativeDateFormatting](self, "doesRelativeDateFormatting"));
  -[WFTextFieldConfiguration localizedIncompleteHintString](self, "localizedIncompleteHintString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedIncompleteHintString:", v15);

  return v4;
}

- (WFTextFieldConfiguration)initWithCoder:(id)a3
{
  id v4;
  WFTextFieldConfiguration *v5;
  uint64_t v6;
  NSString *prefix;
  uint64_t v8;
  NSString *text;
  uint64_t v10;
  NSString *placeholder;
  uint64_t v12;
  NSString *keyboardType;
  uint64_t v14;
  NSString *clearButtonMode;
  uint64_t v16;
  NSString *autocapitalizationType;
  uint64_t v18;
  NSString *autocorrectionType;
  uint64_t v20;
  NSString *returnKeyType;
  uint64_t v22;
  NSString *textContentType;
  uint64_t v24;
  NSString *textAlignment;
  uint64_t v26;
  NSString *localizedIncompleteHintString;
  WFTextFieldConfiguration *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFTextFieldConfiguration;
  v5 = -[WFTextFieldConfiguration init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prefix"));
    v6 = objc_claimAutoreleasedReturnValue();
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholder"));
    v10 = objc_claimAutoreleasedReturnValue();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v10;

    v5->_secureTextEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secureTextEntry"));
    v5->_multiline = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("multiline"));
    v5->_allowsNegativeNumbers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNegativeNumbers"));
    v5->_autoPeriodsDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoPeriodsDisabled"));
    v5->_smartQuotesDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("smartQuotesDisabled"));
    v5->_smartDashesDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("smartDashesDisabled"));
    v5->_textReplacementDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("textReplacementDisabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardType"));
    v12 = objc_claimAutoreleasedReturnValue();
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearButtonMode"));
    v14 = objc_claimAutoreleasedReturnValue();
    clearButtonMode = v5->_clearButtonMode;
    v5->_clearButtonMode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocapitalizationType"));
    v16 = objc_claimAutoreleasedReturnValue();
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocorrectionType"));
    v18 = objc_claimAutoreleasedReturnValue();
    autocorrectionType = v5->_autocorrectionType;
    v5->_autocorrectionType = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("returnKeyType"));
    v20 = objc_claimAutoreleasedReturnValue();
    returnKeyType = v5->_returnKeyType;
    v5->_returnKeyType = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textContentType"));
    v22 = objc_claimAutoreleasedReturnValue();
    textContentType = v5->_textContentType;
    v5->_textContentType = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textAlignment"));
    v24 = objc_claimAutoreleasedReturnValue();
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v24;

    v5->_focusImmediatelyWhenPresented = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("focusImmediatelyWhenPresented"));
    v5->_initialInsertionIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialInsertionIndex"));
    v5->_showsDateFormattingHint = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsDateFormattingHint"));
    v5->_dateFormatStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateFormatStyle"));
    v5->_timeFormatStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeFormatStyle"));
    v5->_dateHintPrefersDateOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dateHintPrefersDateOnly"));
    v5->_doesRelativeDateFormatting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("doesRelativeDateFormatting"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedIncompleteHintString"));
    v26 = objc_claimAutoreleasedReturnValue();
    localizedIncompleteHintString = v5->_localizedIncompleteHintString;
    v5->_localizedIncompleteHintString = (NSString *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[WFTextFieldConfiguration prefix](self, "prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("prefix"));

  -[WFTextFieldConfiguration text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("text"));

  -[WFTextFieldConfiguration placeholder](self, "placeholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("placeholder"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration isSecureTextEntry](self, "isSecureTextEntry"), CFSTR("secureTextEntry"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration isMultiline](self, "isMultiline"), CFSTR("multiline"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration allowsNegativeNumbers](self, "allowsNegativeNumbers"), CFSTR("allowsNegativeNumbers"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration smartQuotesDisabled](self, "smartQuotesDisabled"), CFSTR("smartQuotesDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration smartDashesDisabled](self, "smartDashesDisabled"), CFSTR("smartDashesDisabled"));
  -[WFTextFieldConfiguration keyboardType](self, "keyboardType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyboardType"));

  -[WFTextFieldConfiguration clearButtonMode](self, "clearButtonMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("clearButtonMode"));

  -[WFTextFieldConfiguration autocapitalizationType](self, "autocapitalizationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("autocapitalizationType"));

  -[WFTextFieldConfiguration autocorrectionType](self, "autocorrectionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("autocorrectionType"));

  -[WFTextFieldConfiguration returnKeyType](self, "returnKeyType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("returnKeyType"));

  -[WFTextFieldConfiguration textContentType](self, "textContentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("textContentType"));

  -[WFTextFieldConfiguration textAlignment](self, "textAlignment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("textAlignment"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"), CFSTR("focusImmediatelyWhenPresented"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration initialInsertionIndex](self, "initialInsertionIndex"), CFSTR("initialInsertionIndex"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration showsDateFormattingHint](self, "showsDateFormattingHint"), CFSTR("showsDateFormattingHint"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration dateFormatStyle](self, "dateFormatStyle"), CFSTR("dateFormatStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration timeFormatStyle](self, "timeFormatStyle"), CFSTR("timeFormatStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration dateHintPrefersDateOnly](self, "dateHintPrefersDateOnly"), CFSTR("dateHintPrefersDateOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration doesRelativeDateFormatting](self, "doesRelativeDateFormatting"), CFSTR("doesRelativeDateFormatting"));
  -[WFTextFieldConfiguration localizedIncompleteHintString](self, "localizedIncompleteHintString");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("localizedIncompleteHintString"));

}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (BOOL)allowsNegativeNumbers
{
  return self->_allowsNegativeNumbers;
}

- (void)setAllowsNegativeNumbers:(BOOL)a3
{
  self->_allowsNegativeNumbers = a3;
}

- (BOOL)autoPeriodsDisabled
{
  return self->_autoPeriodsDisabled;
}

- (void)setAutoPeriodsDisabled:(BOOL)a3
{
  self->_autoPeriodsDisabled = a3;
}

- (BOOL)smartQuotesDisabled
{
  return self->_smartQuotesDisabled;
}

- (void)setSmartQuotesDisabled:(BOOL)a3
{
  self->_smartQuotesDisabled = a3;
}

- (BOOL)smartDashesDisabled
{
  return self->_smartDashesDisabled;
}

- (void)setSmartDashesDisabled:(BOOL)a3
{
  self->_smartDashesDisabled = a3;
}

- (BOOL)textReplacementDisabled
{
  return self->_textReplacementDisabled;
}

- (void)setTextReplacementDisabled:(BOOL)a3
{
  self->_textReplacementDisabled = a3;
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)clearButtonMode
{
  return self->_clearButtonMode;
}

- (void)setClearButtonMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)focusImmediatelyWhenPresented
{
  return self->_focusImmediatelyWhenPresented;
}

- (void)setFocusImmediatelyWhenPresented:(BOOL)a3
{
  self->_focusImmediatelyWhenPresented = a3;
}

- (int64_t)initialInsertionIndex
{
  return self->_initialInsertionIndex;
}

- (void)setInitialInsertionIndex:(int64_t)a3
{
  self->_initialInsertionIndex = a3;
}

- (BOOL)showsDateFormattingHint
{
  return self->_showsDateFormattingHint;
}

- (void)setShowsDateFormattingHint:(BOOL)a3
{
  self->_showsDateFormattingHint = a3;
}

- (unint64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (void)setDateFormatStyle:(unint64_t)a3
{
  self->_dateFormatStyle = a3;
}

- (unint64_t)timeFormatStyle
{
  return self->_timeFormatStyle;
}

- (void)setTimeFormatStyle:(unint64_t)a3
{
  self->_timeFormatStyle = a3;
}

- (BOOL)dateHintPrefersDateOnly
{
  return self->_dateHintPrefersDateOnly;
}

- (void)setDateHintPrefersDateOnly:(BOOL)a3
{
  self->_dateHintPrefersDateOnly = a3;
}

- (BOOL)doesRelativeDateFormatting
{
  return self->_doesRelativeDateFormatting;
}

- (void)setDoesRelativeDateFormatting:(BOOL)a3
{
  self->_doesRelativeDateFormatting = a3;
}

- (NSString)localizedIncompleteHintString
{
  return self->_localizedIncompleteHintString;
}

- (void)setLocalizedIncompleteHintString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedIncompleteHintString, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_returnKeyType, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_clearButtonMode, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
