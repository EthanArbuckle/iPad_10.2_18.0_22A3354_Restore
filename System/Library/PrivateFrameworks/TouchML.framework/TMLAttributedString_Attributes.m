@implementation TMLAttributedString_Attributes

- (TMLAttributedString_Attributes)init
{
  return (TMLAttributedString_Attributes *)((uint64_t (*)(TMLAttributedString_Attributes *, char *))MEMORY[0x24BEDD108])(self, sel_initWithDictionary_);
}

- (TMLAttributedString_Attributes)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  TMLAttributedString_Attributes *v6;
  double v7;
  uint64_t v8;
  id v9;
  const char *v10;
  double v11;
  NSMutableDictionary *attributes;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TMLAttributedString_Attributes;
  v6 = -[TMLAttributedString_Attributes init](&v14, sel_init);
  if (v6)
  {
    if (v4)
    {
      v8 = objc_msgSend_mutableCopy(v4, v5, v7);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDBCED8]);
      v8 = objc_msgSend_initWithCapacity_(v9, v10, v11, 16);
    }
    attributes = v6->_attributes;
    v6->_attributes = (NSMutableDictionary *)v8;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  double v8;

  v4 = (void *)objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v4, v5, v6, a3);
  return (id)MEMORY[0x24BEDD108](v7, sel_initWithDictionary_, v8);
}

- (void)tmlObjectCompleted
{
  double v2;
  const char *v4;
  double v5;
  id v6;

  self->_created = 1;
  objc_msgSend_tmlParent(self, a2, v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAttributes_range_(v6, v4, v5, self->_attributes, self->_range.location, self->_range.length);

}

- (void)setAttribute:(id)a3 value:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, v7, v8, v6, v14);
  if (self->_created)
  {
    objc_msgSend_tmlParent(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAttribute_value_range_(v11, v12, v13, v14, v6, self->_range.location, self->_range.length);

  }
}

- (void)setAXAttribute:(id)a3 value:(id)a4
{
  double v4;

  objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, a2, v4, a4, a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  double v4;

  objc_msgSend_setAttribute_value_(self, a2, v4, a4, a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v3, a3);
}

- (UIFont)font
{
  double v2;

  return (UIFont *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB360]);
}

- (void)setFont:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB360], a3);
}

- (NSParagraphStyle)paragraphStyle
{
  double v2;

  return (NSParagraphStyle *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB3A8]);
}

- (void)setParagraphStyle:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB3A8], a3);
}

- (UIColor)foregroundColor
{
  double v2;

  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB368]);
}

- (void)setForegroundColor:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB368], a3);
}

- (UIColor)backgroundColor
{
  double v2;

  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB320]);
}

- (void)setBackgroundColor:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB320], a3);
}

- (int64_t)ligature
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  int64_t v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB380]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setLigature:(int64_t)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BEBB380];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

}

- (NSNumber)kern
{
  double v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB378]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setKern:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BEBB378];
  if (a3)
  {
    objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB378], a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

  }
}

- (int64_t)strikethroughStyle
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  int64_t v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB3D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setStrikethroughStyle:(int64_t)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BEBB3D8];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

}

- (int64_t)underlineStyle
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  int64_t v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setUnderlineStyle:(int64_t)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BEBB440];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

}

- (UIColor)strokeColor
{
  double v2;

  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB3E0]);
}

- (void)setStrokeColor:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB3E0], a3);
}

- (double)strokeWidth
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  float v6;
  double v7;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB3E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)setStrokeWidth:(double)a3
{
  uint64_t v4;
  const char *v5;
  double v6;
  id v7;

  v4 = *MEMORY[0x24BEBB3E8];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);

}

- (NSString)textEffect
{
  double v2;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB408]);
}

- (void)setTextEffect:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB408], a3);
}

- (NSTextAttachment)attachment
{
  double v2;

  return (NSTextAttachment *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB318]);
}

- (void)setAttachment:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB318], a3);
}

- (UIColor)underlineColor
{
  double v2;

  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB438]);
}

- (void)setUnderlineColor:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB438], a3);
}

- (double)obliqueness
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  float v6;
  double v7;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB390]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)setObliqueness:(double)a3
{
  uint64_t v4;
  const char *v5;
  double v6;
  id v7;

  v4 = *MEMORY[0x24BEBB390];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);

}

- (double)expansion
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  float v6;
  double v7;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB358]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)setExpansion:(double)a3
{
  uint64_t v4;
  const char *v5;
  double v6;
  id v7;

  v4 = *MEMORY[0x24BEBB358];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);

}

- (id)link
{
  double v2;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB388]);
}

- (void)setLink:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB388], a3);
}

- (NSShadow)shadow
{
  double v2;

  return (NSShadow *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB3C8]);
}

- (void)setShadow:(id)a3
{
  double v3;

  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x24BEBB3C8], a3);
}

- (double)baselineOffset
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  float v6;
  double v7;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB330]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)setBaselineOffset:(double)a3
{
  uint64_t v4;
  const char *v5;
  double v6;
  id v7;

  v4 = *MEMORY[0x24BEBB330];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);

}

- (int64_t)superscript
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  int64_t v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDC4F40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setSuperscript:(int64_t)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDC4F40];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

}

- (int64_t)verticalGlyphForm
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  int64_t v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BEBB448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setVerticalGlyphForm:(int64_t)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BEBB448];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);

}

- (NSNumber)accessibilitySpeechPitch
{
  double v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7360]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechPitch:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDF7360];
  if (a3)
  {
    objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x24BDF7360], a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);

  }
}

- (BOOL)accessibilitySpeechPunctuation
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  char v6;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7368]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  return v6;
}

- (void)setAccessibilitySpeechPunctuation:(BOOL)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDF7368];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);

}

- (NSString)accessibilitySpeechLanguage
{
  double v2;

  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7358]);
}

- (void)setAccessibilitySpeechLanguage:(id)a3
{
  double v3;

  objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x24BDF7358], a3);
}

- (NSNumber)accessibilitySpeechQueueAnnouncement
{
  double v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7370]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechQueueAnnouncement:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDF7370];
  if (a3)
  {
    objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x24BDF7370], a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);

  }
}

- (NSString)accessibilitySpeechIPANotation
{
  double v2;
  void *v3;
  void *v4;
  NSString *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechIPANotation:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDF7350];
  if (a3)
  {
    objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x24BDF7350], a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);

  }
}

- (NSNumber)accessibilityTextHeadingLevel
{
  double v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x24BDF7390]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setAccessibilityTextHeadingLevel:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  id v8;

  v5 = *MEMORY[0x24BDF7390];
  if (a3)
  {
    objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x24BDF7390], a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);

  }
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
