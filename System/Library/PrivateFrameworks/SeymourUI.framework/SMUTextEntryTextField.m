@implementation SMUTextEntryTextField

- (SMUTextEntryTextField)initWithFrame:(CGRect)a3
{
  SMUTextEntryTextField *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMUTextEntryTextField;
  result = -[SMUTextEntryTextField initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_allowsFocus = 0;
  return result;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (void)setMaxLength:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  if (self->_maxLength != a3)
  {
    self->_maxLength = a3;
    -[SMUTextEntryTextField text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SMUTextEntryTextField _filteredRangeForText:](self, "_filteredRangeForText:", v4);
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = self;
    v8.super_class = (Class)SMUTextEntryTextField;
    -[SMUTextEntryTextField setText:](&v8, sel_setText_, v7);

  }
}

- (id)text
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  if ((-[SMUTextEntryTextField isSecureTextEntry](self, "isSecureTextEntry") & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SMUTextEntryTextField;
    -[SMUTextEntryTextField text](&v8, sel_text);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!text_tabCharacterSet)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\t"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)text_tabCharacterSet;
      text_tabCharacterSet = v4;

    }
    v9.receiver = self;
    v9.super_class = (Class)SMUTextEntryTextField;
    -[SMUTextEntryTextField text](&v9, sel_text);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", text_tabCharacterSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (void)setText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = -[SMUTextEntryTextField _filteredRangeForText:](self, "_filteredRangeForText:", v4);
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)SMUTextEntryTextField;
  -[SMUTextEntryTextField setText:](&v8, sel_setText_, v7);

}

- (void)insertText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = -[SMUTextEntryTextField _filteredRangeForText:](self, "_filteredRangeForText:", v4);
  objc_msgSend(v4, "substringWithRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)SMUTextEntryTextField;
  -[SMUTextEntryTextField insertText:](&v8, sel_insertText_, v7);

}

- (_NSRange)_filteredRangeForText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  -[SMUTextEntryTextField text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SMUTextEntryTextField maxLength](self, "maxLength"))
  {
    v7 = objc_msgSend(v6, "length");
    v8 = objc_msgSend(v4, "length") + v7;
    if (v8 > -[SMUTextEntryTextField maxLength](self, "maxLength"))
    {
      v9 = -[SMUTextEntryTextField maxLength](self, "maxLength");
      v5 = v9 - objc_msgSend(v6, "length");
    }
  }

  v10 = 0;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

@end
