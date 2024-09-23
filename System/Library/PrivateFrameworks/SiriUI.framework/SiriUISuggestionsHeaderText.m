@implementation SiriUISuggestionsHeaderText

- (SiriUISuggestionsHeaderText)initWithRegularString:(id)a3 compactString:(id)a4
{
  id v6;
  id v7;
  SiriUISuggestionsHeaderText *v8;
  uint64_t v9;
  NSString *regularString;
  uint64_t v11;
  NSString *compactString;
  _BOOL4 IsRTL;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SiriUISuggestionsHeaderText;
  v8 = -[SiriUISuggestionsHeaderText init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    regularString = v8->_regularString;
    v8->_regularString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    compactString = v8->_compactString;
    v8->_compactString = (NSString *)v11;

    IsRTL = SiriLanguageIsRTL();
    v14 = 2;
    if (!IsRTL)
      v14 = 0;
    v8->_textAlignment = v14;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRegularString:", self->_regularString);
  objc_msgSend(v4, "setCompactString:", self->_compactString);
  return v4;
}

- (NSAttributedString)attributedStringForMainScreenTraitCollection
{
  NSString *regularString;

  if (!SiriUIIsCompactWidth() || (regularString = self->_compactString) == 0)
    regularString = self->_regularString;
  return (NSAttributedString *)-[SiriUISuggestionsHeaderText _attributedStringWithString:](self, "_attributedStringWithString:", regularString);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *regularString;
  void *v6;
  NSString *compactString;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    regularString = self->_regularString;
    objc_msgSend(v4, "regularString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](regularString, "isEqualToString:", v6))
    {
      compactString = self->_compactString;
      objc_msgSend(v4, "compactString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSString isEqualToString:](compactString, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_attributedStringWithString:(id)a3
{
  objc_class *v4;
  __CFString *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDF6748];
  v5 = (__CFString *)a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setLineSpacing:", 0.0);
  objc_msgSend(v6, "setAlignment:", self->_textAlignment);
  v7 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v5)
    v8 = v5;
  else
    v8 = &stru_24D7DA7D8;
  v12 = *MEMORY[0x24BDF6628];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v9);

  return v10;
}

- (NSString)regularString
{
  return self->_regularString;
}

- (void)setRegularString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)compactString
{
  return self->_compactString;
}

- (void)setCompactString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactString, 0);
  objc_storeStrong((id *)&self->_regularString, 0);
}

@end
