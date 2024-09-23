@implementation TIMathSymbolPunctuationController

- (TIMathSymbolPunctuationController)init
{
  TIMathSymbolPunctuationController *v2;
  void *v3;
  uint64_t v4;
  NSString *decimalSeparator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIMathSymbolPunctuationController;
  v2 = -[TIMathSymbolPunctuationController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decimalSeparator");
    v4 = objc_claimAutoreleasedReturnValue();
    decimalSeparator = v2->_decimalSeparator;
    v2->_decimalSeparator = (NSString *)v4;

    v2->_enabled = 1;
  }
  return v2;
}

- (void)reset
{
  self->_state = 0;
  self->_enabled = 1;
}

- (void)setInputString:(id)a3
{
  id v4;

  v4 = a3;
  -[TIMathSymbolPunctuationController reset](self, "reset");
  -[TIMathSymbolPunctuationController updateInputString:](self, "updateInputString:", v4);

}

- (BOOL)updateInputString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BOOL v8;
  int64_t v9;
  unsigned int v10;
  unsigned __int16 v11;
  unint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v7 = (char *)v14 - ((2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    objc_msgSend(v4, "getCharacters:", v7);
    v8 = 0;
    v9 = v6 - 1;
    v10 = *(unsigned __int16 *)&v7[2 * v9];
    v11 = 8722;
    v12 = 2;
    if (v10 <= 0xFF0B)
    {
      if (*(unsigned __int16 *)&v7[2 * v9] > 0x3001u)
      {
        if (v10 != 12290)
        {
          if (v10 != 12540)
            goto LABEL_30;
          goto LABEL_28;
        }
LABEL_21:
        if (v9 && -[NSString isEqualToString:](self->_decimalSeparator, "isEqualToString:", CFSTR(".")))
        {
          v11 = 46;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
      if (v10 == 58)
        goto LABEL_19;
      if (v10 == 12289)
        goto LABEL_12;
    }
    else
    {
      if (*(unsigned __int16 *)&v7[2 * v9] > 0xFF60u)
      {
        if (v10 == 65392)
          goto LABEL_28;
        if (v10 != 65380)
        {
          if (v10 != 65377)
            goto LABEL_30;
          goto LABEL_21;
        }
LABEL_12:
        if (!v9)
          goto LABEL_29;
        v11 = 44;
        v12 = 3;
LABEL_28:
        self->_state = v12;
        self->_location = v9;
        v8 = 1;
        self->_replacementCharacter = v11;
        goto LABEL_30;
      }
      if (v10 == 65292)
      {
        if (v9 && -[NSString isEqualToString:](self->_decimalSeparator, "isEqualToString:", CFSTR(",")))
        {
          v11 = 44;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
      if (v10 == 65306)
      {
LABEL_19:
        if (v9)
        {
          v11 = 58;
LABEL_27:
          v12 = 1;
          goto LABEL_28;
        }
LABEL_29:
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_30:

  return v8;
}

- (id)mathSymbolPunctuationedStringForInputString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int64_t location;
  uint64_t v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  int64_t v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v10 = v5;
    MEMORY[0x1E0C80A78](v5, v6, v7, v8, v9);
    v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    objc_msgSend(v4, "getCharacters:", v12);
    v13 = -[TIMathSymbolPunctuationController updateInputString:](self, "updateInputString:", v4);
    if (v13 == -[TIMathSymbolPunctuationController replaceAfterNumerals](self, "replaceAfterNumerals")
      && self->_state
      && self->_enabled)
    {
      if (!self->_replaceAfterNumerals)
      {
        v14 = *(unsigned __int16 *)&v12[2 * v10 - 2];
        objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "characterIsMember:", v14);

        if (!v16)
        {
          v17 = 0;
          goto LABEL_33;
        }
      }
      if (v10 >= 2 && self->_state == 2)
      {
        if (v10 == 2)
          v16 = 1;
        else
          v16 = IsNumeric(*(unsigned __int16 *)&v12[2 * v10 - 6]);
      }
      else
      {
        v16 = 0;
      }
      location = self->_location;
      if (v10 >= location + 1 && self->_state == 1)
      {
        v19 = *(unsigned __int16 *)&v12[2 * location - 2];
        objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v20, "characterIsMember:", v19);

        if ((_DWORD)v19)
        {
          if (self->_replaceAfterNumerals
            || IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 2]))
          {
            v16 = 1;
          }
        }
      }
      v21 = self->_location;
      if (v10 <= v21 + 3
        || self->_state != 3
        || (v22 = *(unsigned __int16 *)&v12[2 * v21 - 2],
            objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v22) = objc_msgSend(v23, "characterIsMember:", v22),
            v23,
            !(_DWORD)v22)
        || !IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 2])
        || !IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 4])
        || (IsNumeric(*(unsigned __int16 *)&v12[2 * self->_location + 6]) & 1) == 0)
      {
        if (!v16)
        {
LABEL_29:
          v17 = 0;
LABEL_30:
          self->_converted = v16;
          goto LABEL_31;
        }
      }
      v24 = self->_location;
      if (v24 < objc_msgSend(v4, "length"))
      {
        v25 = self->_location;
        LOBYTE(v16) = 1;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &self->_replacementCharacter, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v25, 1, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
        self->_state = 0;
        goto LABEL_30;
      }
    }
    LOBYTE(v16) = 0;
    goto LABEL_29;
  }
  v17 = 0;
LABEL_31:

  return v17;
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (void)setDecimalSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)replaceAfterNumerals
{
  return self->_replaceAfterNumerals;
}

- (void)setReplaceAfterNumerals:(BOOL)a3
{
  self->_replaceAfterNumerals = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)converted
{
  return self->_converted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
}

@end
