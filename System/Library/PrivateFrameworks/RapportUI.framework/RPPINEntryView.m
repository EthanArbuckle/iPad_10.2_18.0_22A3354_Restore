@implementation RPPINEntryView

- (void)awakeFromNib
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPPINEntryView;
  -[RPPINEntryView awakeFromNib](&v7, sel_awakeFromNib);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = v3;
  if (self->_label1)
    objc_msgSend(v3, "addObject:");
  if (self->_label2)
    objc_msgSend(v4, "addObject:");
  if (self->_label3)
    objc_msgSend(v4, "addObject:");
  if (self->_label4)
    objc_msgSend(v4, "addObject:");
  if (self->_label5)
    objc_msgSend(v4, "addObject:");
  if (self->_label6)
    objc_msgSend(v4, "addObject:");
  if (self->_label7)
    objc_msgSend(v4, "addObject:");
  if (self->_label8)
    objc_msgSend(v4, "addObject:");
  if (objc_msgSend(v4, "count"))
    objc_storeStrong((id *)&self->_labels, v4);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = v5;
  if (self->_well1)
    objc_msgSend(v5, "addObject:");
  if (self->_well2)
    objc_msgSend(v6, "addObject:");
  if (self->_well3)
    objc_msgSend(v6, "addObject:");
  if (self->_well4)
    objc_msgSend(v6, "addObject:");
  if (self->_well5)
    objc_msgSend(v6, "addObject:");
  if (self->_well6)
    objc_msgSend(v6, "addObject:");
  if (self->_well7)
    objc_msgSend(v6, "addObject:");
  if (self->_well8)
    objc_msgSend(v6, "addObject:");
  if (objc_msgSend(v6, "count"))
    objc_storeStrong((id *)&self->_wells, v6);
  -[RPPINEntryView setText:](self, "setText:", &stru_24FD32EC0);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[RPPINEntryView _updateFields](self, "_updateFields");
}

- (NSString)text
{
  NSMutableString *text;

  text = self->_text;
  if (text)
    return (NSString *)(id)-[NSMutableString copy](text, "copy");
  else
    return (NSString *)&stru_24FD32EC0;
}

- (void)setText:(id)a3
{
  void *v4;
  NSMutableString *v5;
  NSMutableString *text;

  objc_msgSend(a3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableString *)objc_msgSend(v4, "mutableCopy");
  text = self->_text;
  self->_text = v5;

  -[RPPINEntryView _updateFields](self, "_updateFields");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPPINEntryView;
  -[RPPINEntryView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (!self->_disabled)
    -[RPPINEntryView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)_updateFields
{
  NSUInteger v3;
  __CFString *v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  UIColor *wellFocusColor;
  UIColor *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  UIColor *v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSArray count](self->_wells, "count");
  v4 = &stru_24FD32EC0;
  if (!v3)
    v4 = CFSTR("-");
  v30 = v4;
  v5 = -[NSMutableString length](self->_text, "length");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = self->_labels;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (v9 + i >= v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "setText:", v30);
        }
        else
        {
          -[NSMutableString substringWithRange:](self->_text, "substringWithRange:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setText:", v13);

        }
        if (self->_disabled)
          objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
        else
          objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTextColor:", v14);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v9 += i;
    }
    while (v8);
  }

  wellFocusColor = self->_wellFocusColor;
  if (wellFocusColor)
  {
    v16 = wellFocusColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v16;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = self->_wells;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      v28 = v20;
      v23 = v5 - v20;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v17);
        v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v22);
        if (v23 == v22 && !self->_disabled)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "setBorderColor:", v29);
          v26 = 2.0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.800000012, 1.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBorderColor:", v25);

          v26 = 1.5;
        }
        objc_msgSend(v24, "setBorderWidth:", v26);
        ++v22;
      }
      while (v19 != v22);
      v20 = v28 + v19;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      v19 = v27;
    }
    while (v27);
  }

}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)deleteBackward
{
  NSMutableString *text;
  uint64_t v4;
  uint64_t v5;
  void (**textChangedHandler)(id, NSMutableString *);

  if (!self->_disabled && -[NSMutableString length](self->_text, "length"))
  {
    text = self->_text;
    v4 = -[NSMutableString rangeOfComposedCharacterSequenceAtIndex:](text, "rangeOfComposedCharacterSequenceAtIndex:", -[NSMutableString length](text, "length") - 1);
    -[NSMutableString deleteCharactersInRange:](text, "deleteCharactersInRange:", v4, v5);
    -[RPPINEntryView _updateFields](self, "_updateFields");
    textChangedHandler = (void (**)(id, NSMutableString *))self->_textChangedHandler;
    if (textChangedHandler)
      textChangedHandler[2](textChangedHandler, self->_text);
  }
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  NSUInteger v7;
  NSUInteger v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  unsigned __int8 *v12;
  NSMutableString *text;
  NSMutableString *v15;
  NSMutableString *v16;
  unsigned int v17;
  void (**textChangedHandler)(id, NSMutableString *);
  NSMutableString *v19;
  id v20;

  v4 = a3;
  v5 = v4;
  if (!self->_disabled)
  {
    v20 = v4;
    v6 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v7 = -[NSArray count](self->_labels, "count");
    v8 = v7 - -[NSMutableString length](self->_text, "length");
    v9 = *v6;
    if (*v6)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      v11 = MEMORY[0x24BDAC740];
      v12 = v6 + 1;
      do
      {
        if ((v9 & 0x80) != 0)
        {
          if (__maskrune(v9, 0x4000uLL))
            goto LABEL_24;
        }
        else if ((*(_DWORD *)(v11 + 4 * v9 + 60) & 0x4000) != 0)
        {
          goto LABEL_24;
        }
        if (self->_alphaNumeric)
        {
          if ((v9 & 0x80) != 0)
          {
            __maskrune(v9, 0x500uLL);
          }
          else if ((*(_DWORD *)(v11 + 4 * v9 + 60) & 0x500) != 0 && v9 - 48 < 0xA)
          {
LABEL_20:
            text = self->_text;
            if (!text)
            {
              v15 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
              v16 = self->_text;
              self->_text = v15;

              text = self->_text;
            }
            -[NSMutableString appendFormat:](text, "appendFormat:", CFSTR("%c"), __toupper(v9));
            --v8;
          }
        }
        else if (v9 - 48 <= 9)
        {
          goto LABEL_20;
        }
LABEL_24:
        v17 = *v12++;
        v9 = v17;
      }
      while (v17 && v8);
    }
    -[RPPINEntryView _updateFields](self, "_updateFields");
    textChangedHandler = (void (**)(id, NSMutableString *))self->_textChangedHandler;
    v5 = v20;
    if (textChangedHandler)
    {
      if (self->_text)
        v19 = self->_text;
      else
        v19 = (NSMutableString *)&stru_24FD32EC0;
      textChangedHandler[2](textChangedHandler, v19);
      v5 = v20;
    }
  }

}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_text, "length") != 0;
}

- (int64_t)keyboardAppearance
{
  return 0;
}

- (int64_t)keyboardType
{
  if (self->_alphaNumeric)
    return 6;
  else
    return 11;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)alphaNumeric
{
  return self->_alphaNumeric;
}

- (void)setAlphaNumeric:(BOOL)a3
{
  self->_alphaNumeric = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (UILabel)label1
{
  return self->_label1;
}

- (void)setLabel1:(id)a3
{
  objc_storeStrong((id *)&self->_label1, a3);
}

- (UILabel)label2
{
  return self->_label2;
}

- (void)setLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_label2, a3);
}

- (UILabel)label3
{
  return self->_label3;
}

- (void)setLabel3:(id)a3
{
  objc_storeStrong((id *)&self->_label3, a3);
}

- (UILabel)label4
{
  return self->_label4;
}

- (void)setLabel4:(id)a3
{
  objc_storeStrong((id *)&self->_label4, a3);
}

- (UILabel)label5
{
  return self->_label5;
}

- (void)setLabel5:(id)a3
{
  objc_storeStrong((id *)&self->_label5, a3);
}

- (UILabel)label6
{
  return self->_label6;
}

- (void)setLabel6:(id)a3
{
  objc_storeStrong((id *)&self->_label6, a3);
}

- (UILabel)label7
{
  return self->_label7;
}

- (void)setLabel7:(id)a3
{
  objc_storeStrong((id *)&self->_label7, a3);
}

- (UILabel)label8
{
  return self->_label8;
}

- (void)setLabel8:(id)a3
{
  objc_storeStrong((id *)&self->_label8, a3);
}

- (id)textChangedHandler
{
  return self->_textChangedHandler;
}

- (void)setTextChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)wells
{
  return self->_wells;
}

- (void)setWells:(id)a3
{
  objc_storeStrong((id *)&self->_wells, a3);
}

- (UIView)well1
{
  return self->_well1;
}

- (void)setWell1:(id)a3
{
  objc_storeStrong((id *)&self->_well1, a3);
}

- (UIView)well2
{
  return self->_well2;
}

- (void)setWell2:(id)a3
{
  objc_storeStrong((id *)&self->_well2, a3);
}

- (UIView)well3
{
  return self->_well3;
}

- (void)setWell3:(id)a3
{
  objc_storeStrong((id *)&self->_well3, a3);
}

- (UIView)well4
{
  return self->_well4;
}

- (void)setWell4:(id)a3
{
  objc_storeStrong((id *)&self->_well4, a3);
}

- (UIView)well5
{
  return self->_well5;
}

- (void)setWell5:(id)a3
{
  objc_storeStrong((id *)&self->_well5, a3);
}

- (UIView)well6
{
  return self->_well6;
}

- (void)setWell6:(id)a3
{
  objc_storeStrong((id *)&self->_well6, a3);
}

- (UIView)well7
{
  return self->_well7;
}

- (void)setWell7:(id)a3
{
  objc_storeStrong((id *)&self->_well7, a3);
}

- (UIView)well8
{
  return self->_well8;
}

- (void)setWell8:(id)a3
{
  objc_storeStrong((id *)&self->_well8, a3);
}

- (UIColor)wellFocusColor
{
  return self->_wellFocusColor;
}

- (void)setWellFocusColor:(id)a3
{
  objc_storeStrong((id *)&self->_wellFocusColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellFocusColor, 0);
  objc_storeStrong((id *)&self->_well8, 0);
  objc_storeStrong((id *)&self->_well7, 0);
  objc_storeStrong((id *)&self->_well6, 0);
  objc_storeStrong((id *)&self->_well5, 0);
  objc_storeStrong((id *)&self->_well4, 0);
  objc_storeStrong((id *)&self->_well3, 0);
  objc_storeStrong((id *)&self->_well2, 0);
  objc_storeStrong((id *)&self->_well1, 0);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong(&self->_textChangedHandler, 0);
  objc_storeStrong((id *)&self->_label8, 0);
  objc_storeStrong((id *)&self->_label7, 0);
  objc_storeStrong((id *)&self->_label6, 0);
  objc_storeStrong((id *)&self->_label5, 0);
  objc_storeStrong((id *)&self->_label4, 0);
  objc_storeStrong((id *)&self->_label3, 0);
  objc_storeStrong((id *)&self->_label2, 0);
  objc_storeStrong((id *)&self->_label1, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
