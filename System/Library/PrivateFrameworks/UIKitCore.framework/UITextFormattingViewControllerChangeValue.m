@implementation UITextFormattingViewControllerChangeValue

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;
  NSString *formattingStyleKey;
  UIFont *font;
  UIColor *color;
  NSNumber *numberValue;
  NSString *textList;
  NSString *highlight;
  NSString *customComponentKey;
  NSString *emphasisStyleKey;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITextFormattingViewControllerChangeValue;
  v6 = -[UITextFormattingViewControllerChangeValue init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeType, a3);
    formattingStyleKey = v7->_formattingStyleKey;
    v7->_formattingStyleKey = 0;

    font = v7->_font;
    v7->_font = 0;

    color = v7->_color;
    v7->_color = 0;

    numberValue = v7->_numberValue;
    v7->_numberValue = 0;

    textList = v7->_textList;
    v7->_textList = 0;

    highlight = v7->_highlight;
    v7->_textAlignment = 0;
    v7->_highlight = 0;

    customComponentKey = v7->__customComponentKey;
    v7->__customComponentKey = 0;

    emphasisStyleKey = v7->__emphasisStyleKey;
    v7->__emphasisStyleKey = 0;

  }
  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 customComponentKey:(id)a4
{
  id v7;
  UITextFormattingViewControllerChangeValue *v8;
  UITextFormattingViewControllerChangeValue *v9;

  v7 = a4;
  v8 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->__customComponentKey, a4);

  return v9;
}

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 numberValue:(id)a4
{
  id v7;
  UITextFormattingViewControllerChangeValue *v8;
  UITextFormattingViewControllerChangeValue *v9;

  v7 = a4;
  v8 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_numberValue, a4);

  return v9;
}

- (UITextFormattingViewControllerChangeValue)initWithFormattingStyleKey:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerFormattingStyleChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_formattingStyleKey, a3);

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithEmphasisStyleKey:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerEmphasisStyleChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__emphasisStyleKey, a3);

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextColor:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerTextColorChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithFont:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerFontChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_font, a3);

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextList:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerTextListChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textList, a3);

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextAlignment:(int64_t)a3
{
  UITextFormattingViewControllerChangeValue *result;

  result = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerTextAlignmentChange"));
  if (result)
    result->_textAlignment = a3;
  return result;
}

- (UITextFormattingViewControllerChangeValue)initWithHighlight:(id)a3
{
  id v5;
  UITextFormattingViewControllerChangeValue *v6;
  UITextFormattingViewControllerChangeValue *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerChangeValue initWithChangeType:](self, "initWithChangeType:", CFSTR("UITextFormattingViewControllerHighlightChange"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_highlight, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UITextFormattingViewControllerChangeValue changeType](self, "changeType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  -[UITextFormattingViewControllerChangeValue formattingStyleKey](self, "formattingStyleKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v4[2];
  v4[2] = v8;

  -[UITextFormattingViewControllerChangeValue font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)v4[3];
  v4[3] = v11;

  -[UITextFormattingViewControllerChangeValue color](self, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = (void *)v4[4];
  v4[4] = v14;

  -[UITextFormattingViewControllerChangeValue numberValue](self, "numberValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  v18 = (void *)v4[5];
  v4[5] = v17;

  -[UITextFormattingViewControllerChangeValue textList](self, "textList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  v21 = (void *)v4[6];
  v4[6] = v20;

  v4[7] = -[UITextFormattingViewControllerChangeValue textAlignment](self, "textAlignment");
  -[UITextFormattingViewControllerChangeValue highlight](self, "highlight");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  v24 = (void *)v4[8];
  v4[8] = v23;

  -[UITextFormattingViewControllerChangeValue _emphasisStyleKey](self, "_emphasisStyleKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  v27 = (void *)v4[10];
  v4[10] = v26;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v12;

  v4 = a3;
  -[UITextFormattingViewControllerChangeValue changeType](self, "changeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_ChangeType"));

  -[UITextFormattingViewControllerChangeValue formattingStyleKey](self, "formattingStyleKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_FormattingStyleKey"));

  -[UITextFormattingViewControllerChangeValue font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_Font"));

  -[UITextFormattingViewControllerChangeValue color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_Color"));

  -[UITextFormattingViewControllerChangeValue numberValue](self, "numberValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_NumberValue"));

  -[UITextFormattingViewControllerChangeValue textList](self, "textList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_TextList"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UITextFormattingViewControllerChangeValue textAlignment](self, "textAlignment"), CFSTR("_TextAlignment"));
  -[UITextFormattingViewControllerChangeValue highlight](self, "highlight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_Highlight"));

  -[UITextFormattingViewControllerChangeValue _emphasisStyleKey](self, "_emphasisStyleKey");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_EmphasisStyleKey"));

}

- (UITextFormattingViewControllerChangeValue)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerChangeValue *v5;
  void *v6;
  uint64_t v7;
  NSString *changeType;
  void *v9;
  uint64_t v10;
  NSString *formattingStyleKey;
  void *v12;
  uint64_t v13;
  UIFont *font;
  void *v15;
  uint64_t v16;
  UIColor *color;
  void *v18;
  uint64_t v19;
  NSNumber *numberValue;
  void *v21;
  uint64_t v22;
  NSString *textList;
  void *v24;
  uint64_t v25;
  NSString *highlight;
  void *v27;
  uint64_t v28;
  NSString *emphasisStyleKey;

  v4 = a3;
  v5 = -[UITextFormattingViewControllerChangeValue init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerChangeValueClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_ChangeType"));
    v7 = objc_claimAutoreleasedReturnValue();
    changeType = v5->_changeType;
    v5->_changeType = (NSString *)v7;

    _UITextFormattingViewControllerChangeValueClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_FormattingStyleKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    formattingStyleKey = v5->_formattingStyleKey;
    v5->_formattingStyleKey = (NSString *)v10;

    _UITextFormattingViewControllerChangeValueClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_Font"));
    v13 = objc_claimAutoreleasedReturnValue();
    font = v5->_font;
    v5->_font = (UIFont *)v13;

    _UITextFormattingViewControllerChangeValueClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_Color"));
    v16 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v16;

    _UITextFormattingViewControllerChangeValueClasses();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_NumberValue"));
    v19 = objc_claimAutoreleasedReturnValue();
    numberValue = v5->_numberValue;
    v5->_numberValue = (NSNumber *)v19;

    _UITextFormattingViewControllerChangeValueClasses();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_TextList"));
    v22 = objc_claimAutoreleasedReturnValue();
    textList = v5->_textList;
    v5->_textList = (NSString *)v22;

    v5->_textAlignment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_TextAlignment"));
    _UITextFormattingViewControllerChangeValueClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_Highlight"));
    v25 = objc_claimAutoreleasedReturnValue();
    highlight = v5->_highlight;
    v5->_highlight = (NSString *)v25;

    _UITextFormattingViewControllerChangeValueClasses();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("_EmphasisStyleKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    emphasisStyleKey = v5->__emphasisStyleKey;
    v5->__emphasisStyleKey = (NSString *)v28;

  }
  return v5;
}

- (NSString)changeType
{
  return self->_changeType;
}

- (NSString)formattingStyleKey
{
  return self->_formattingStyleKey;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)color
{
  return self->_color;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)textList
{
  return self->_textList;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSString)highlight
{
  return self->_highlight;
}

- (NSString)_customComponentKey
{
  return self->__customComponentKey;
}

- (NSString)_emphasisStyleKey
{
  return self->__emphasisStyleKey;
}

- (NSString)_textAnimationName
{
  return self->__textAnimationName;
}

- (NSDictionary)_textAnimationAttributes
{
  return self->__textAnimationAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textAnimationAttributes, 0);
  objc_storeStrong((id *)&self->__textAnimationName, 0);
  objc_storeStrong((id *)&self->__emphasisStyleKey, 0);
  objc_storeStrong((id *)&self->__customComponentKey, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_textList, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_formattingStyleKey, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
}

@end
