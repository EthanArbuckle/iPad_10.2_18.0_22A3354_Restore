@implementation UIKBAutoFillTestExpectedResult

- (UIKBAutoFillTestExpectedResult)init
{
  UIKBAutoFillTestExpectedResult *v2;
  uint64_t v3;
  NSMutableDictionary *textFieldTagToTextFieldType;
  UIKBAutoFillTestExpectedResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBAutoFillTestExpectedResult;
  v2 = -[UIKBAutoFillTestExpectedResult init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    textFieldTagToTextFieldType = v2->_textFieldTagToTextFieldType;
    v2->_textFieldTagToTextFieldType = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestExpectedResult)initWithCoder:(id)a3
{
  id v4;
  UIKBAutoFillTestExpectedResult *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *textFieldTagToTextFieldType;
  UIKBAutoFillTestExpectedResult *v9;

  v4 = a3;
  v5 = -[UIKBAutoFillTestExpectedResult init](self, "init");
  if (v5)
  {
    v5->_formType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("formType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("textFieldTagToTextFieldType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    textFieldTagToTextFieldType = v5->_textFieldTagToTextFieldType;
    v5->_textFieldTagToTextFieldType = (NSMutableDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t formType;
  id v5;

  formType = self->_formType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", formType, CFSTR("formType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textFieldTagToTextFieldType, CFSTR("textFieldTagToTextFieldType"));

}

- (int64_t)typeForTextFieldWithTag:(int64_t)a3
{
  NSMutableDictionary *textFieldTagToTextFieldType;
  void *v4;
  void *v5;
  int64_t v6;

  textFieldTagToTextFieldType = self->_textFieldTagToTextFieldType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](textFieldTagToTextFieldType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void)setType:(int64_t)a3 forTextFieldWithTag:(int64_t)a4
{
  NSMutableDictionary *textFieldTagToTextFieldType;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  textFieldTagToTextFieldType = self->_textFieldTagToTextFieldType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](textFieldTagToTextFieldType, "setObject:forKeyedSubscript:", v8, v7);

}

- (int64_t)formType
{
  return self->_formType;
}

- (void)setFormType:(int64_t)a3
{
  self->_formType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldTagToTextFieldType, 0);
}

@end
