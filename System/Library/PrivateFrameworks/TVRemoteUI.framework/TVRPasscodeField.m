@implementation TVRPasscodeField

- (TVRPasscodeField)initWithFrame:(CGRect)a3
{
  TVRPasscodeField *v3;
  uint64_t v4;
  TVRCPINEntryAttributes *PINEntryattributes;
  NSMutableString *v6;
  NSMutableString *mutablePasscode;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVRPasscodeField;
  v3 = -[TVRPasscodeField initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEB40B0]), "initWithDigitCount:", 4);
    PINEntryattributes = v3->_PINEntryattributes;
    v3->_PINEntryattributes = (TVRCPINEntryAttributes *)v4;

    v6 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mutablePasscode = v3->_mutablePasscode;
    v3->_mutablePasscode = v6;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRPasscodeField setBackgroundColor:](v3, "setBackgroundColor:", v8);

    -[TVRPasscodeField setContentMode:](v3, "setContentMode:", 3);
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double Height;
  CGContext *CurrentContext;
  id v22;
  uint64_t v23;
  unint64_t v24;
  float v25;
  float v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  double Width;
  double v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[TVRPasscodeField bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TVRPasscodeField _contentSize](self, "_contentSize");
  v13 = v12;
  v15 = v14;
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  if (v13 <= CGRectGetWidth(v41) + -50.0)
  {
    v17 = 25.0;
    v19 = 22.0;
    v39 = 50.0;
  }
  else
  {
    v42.origin.x = v5;
    v42.origin.y = v7;
    v42.size.width = v9;
    v42.size.height = v11;
    v16 = (CGRectGetWidth(v42) + -50.0) / v13;
    v15 = v16 * 22.0;
    v17 = v16 * 25.0;
    v39 = v16 * 50.0;
    -[TVRPasscodeField _contentWidthWithDotSize:entrySpacing:groupSpacing:](self, "_contentWidthWithDotSize:entrySpacing:groupSpacing:", v16 * 22.0, v16 * 25.0);
    v13 = v18;
    v19 = v15;
  }
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  Width = CGRectGetWidth(v43);
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  Height = CGRectGetHeight(v44);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (-[TVRPasscodeField useSystemColors](self, "useSystemColors"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v22, "CGColor"));

  v40 = -[TVRCPINEntryAttributes numberOfDigitGroups](self->_PINEntryattributes, "numberOfDigitGroups");
  if (v40)
  {
    v23 = 0;
    v24 = 0;
    v25 = (Width - v13) * 0.5;
    v26 = (Height - v15) * 0.5;
    v27 = floorf(v25);
    v28 = floorf(v26);
    v29 = (v19 + -4.0) * 0.5;
    v30 = floorf(v29) + v28;
    v31 = v19 + v17;
    v32 = v39 - v17;
    do
    {
      v33 = -[TVRCPINEntryAttributes numberOfDigitsInGroup:](self->_PINEntryattributes, "numberOfDigitsInGroup:", v23, *(_QWORD *)&Width);
      if (v33)
      {
        v34 = v33;
        v35 = v33;
        v36 = v24;
        do
        {
          if (v36 >= -[NSMutableString length](self->_mutablePasscode, "length"))
          {
            objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v27, v30, v19, 4.0, 3.0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "fill");

          }
          else
          {
            v45.origin.x = v27;
            v45.origin.y = v28;
            v45.size.width = v19;
            v45.size.height = v19;
            CGContextFillEllipseInRect(CurrentContext, v45);
          }
          v27 = v31 + v27;
          ++v36;
          --v35;
        }
        while (v35);
        v24 += v34;
      }
      v27 = v32 + v27;
      ++v23;
    }
    while (v23 != v40);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSString)text
{
  return (NSString *)(id)-[NSMutableString copy](self->_mutablePasscode, "copy");
}

- (void)setText:(id)a3
{
  __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  __CFString *v8;
  id v9;

  v4 = &stru_24DE30718;
  if (a3)
    v4 = (__CFString *)a3;
  v8 = v4;
  if (-[TVRCPINEntryAttributes totalDigitCount](self->_PINEntryattributes, "totalDigitCount")
    && (v5 = -[__CFString length](v8, "length"),
        v5 > -[TVRCPINEntryAttributes totalDigitCount](self->_PINEntryattributes, "totalDigitCount")))
  {
    -[__CFString substringToIndex:](v8, "substringToIndex:", -[TVRCPINEntryAttributes totalDigitCount](self->_PINEntryattributes, "totalDigitCount") - 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v6;
  }
  else
  {
    v7 = v8;
  }
  v9 = v7;
  if ((-[NSMutableString isEqualToString:](self->_mutablePasscode, "isEqualToString:", v7) & 1) == 0)
  {
    -[NSMutableString setString:](self->_mutablePasscode, "setString:", v9);
    -[TVRPasscodeField setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)clear
{
  -[NSMutableString setString:](self->_mutablePasscode, "setString:", &stru_24DE30718);
  -[TVRPasscodeField setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setPINEntryattributes:(id)a3
{
  TVRCPINEntryAttributes *v4;
  TVRCPINEntryAttributes *v5;
  TVRCPINEntryAttributes *PINEntryattributes;
  TVRCPINEntryAttributes *v7;

  v4 = (TVRCPINEntryAttributes *)a3;
  if (self->_PINEntryattributes != v4)
  {
    v7 = v4;
    if (v4)
      v5 = v4;
    else
      v5 = (TVRCPINEntryAttributes *)objc_msgSend(objc_alloc(MEMORY[0x24BEB40B0]), "initWithDigitCount:", 4);
    PINEntryattributes = self->_PINEntryattributes;
    self->_PINEntryattributes = v5;

    -[TVRPasscodeField setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v7;
  }

}

- (CGSize)_contentSize
{
  double v2;
  double v3;
  CGSize result;

  -[TVRPasscodeField _contentWidthWithDotSize:entrySpacing:groupSpacing:](self, "_contentWidthWithDotSize:entrySpacing:groupSpacing:", 22.0, 25.0, 50.0);
  v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_contentWidthWithDotSize:(double)a3 entrySpacing:(double)a4 groupSpacing:(double)a5
{
  unint64_t v9;
  uint64_t v10;

  v9 = -[TVRCPINEntryAttributes totalDigitCount](self->_PINEntryattributes, "totalDigitCount");
  v10 = -[TVRCPINEntryAttributes numberOfDigitGroups](self->_PINEntryattributes, "numberOfDigitGroups");
  return (double)(v9 - v10) * a4 + (double)v9 * a3 + (double)(unint64_t)(v10 - 1) * a5;
}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_mutablePasscode, "length") != 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[NSMutableString length](self->_mutablePasscode, "length");
  v5 = objc_msgSend(v6, "length");
  if (-[TVRPasscodeField isEnabled](self, "isEnabled")
    && objc_msgSend(v6, "length")
    && v5 + v4 <= (unint64_t)-[TVRCPINEntryAttributes totalDigitCount](self->_PINEntryattributes, "totalDigitCount"))
  {
    -[NSMutableString appendString:](self->_mutablePasscode, "appendString:", v6);
    -[TVRPasscodeField setNeedsDisplay](self, "setNeedsDisplay");
    -[TVRPasscodeField sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  }

}

- (void)deleteBackward
{
  if (-[TVRPasscodeField isEnabled](self, "isEnabled"))
  {
    if (-[NSMutableString length](self->_mutablePasscode, "length"))
    {
      -[NSMutableString deleteCharactersInRange:](self->_mutablePasscode, "deleteCharactersInRange:", -[NSMutableString length](self->_mutablePasscode, "length") - 1, 1);
      -[TVRPasscodeField setNeedsDisplay](self, "setNeedsDisplay");
      -[TVRPasscodeField sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
    }
  }
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return 1;
}

- (int64_t)keyboardType
{
  return 11;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (int64_t)returnKeyType
{
  return 9;
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)acceptsSplitKeyboard
{
  return 0;
}

- (BOOL)acceptsFloatingKeyboard
{
  return 0;
}

- (TVRCPINEntryAttributes)PINEntryattributes
{
  return self->_PINEntryattributes;
}

- (BOOL)useSystemColors
{
  return self->_useSystemColors;
}

- (void)setUseSystemColors:(BOOL)a3
{
  self->_useSystemColors = a3;
}

- (NSMutableString)mutablePasscode
{
  return self->_mutablePasscode;
}

- (void)setMutablePasscode:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePasscode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePasscode, 0);
  objc_storeStrong((id *)&self->_PINEntryattributes, 0);
}

@end
