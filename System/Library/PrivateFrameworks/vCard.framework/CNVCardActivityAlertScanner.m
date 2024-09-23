@implementation CNVCardActivityAlertScanner

+ (id)scanAlertValueFromString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanAlertValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)scannerWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (CNVCardActivityAlertScanner)initWithString:(id)a3
{
  id v4;
  CNVCardActivityAlertScanner *v5;
  uint64_t v6;
  NSString *string;
  CNVCardActivityAlertScanner *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardActivityAlertScanner;
  v5 = -[CNVCardActivityAlertScanner init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_position = 0;
    v8 = v5;
  }

  return v5;
}

- (id)scanAlertValue
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    -[CNVCardActivityAlertScanner scanKeyValuePair](self, "scanKeyValuePair");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  }
  while (-[CNVCardActivityAlertScanner scanPastItemDelimiter](self, "scanPastItemDelimiter"));
  return v3;
}

- (id)scanKeyValuePair
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[CNVCardActivityAlertScanner scanStringValue](self, "scanStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardActivityAlertScanner scanPastKeyValueSeparator](self, "scanPastKeyValueSeparator");
  -[CNVCardActivityAlertScanner scanStringValue](self, "scanStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v3) & 1) != 0
    || ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8 = v3;
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)scanStringValue
{
  void *v3;

  if (-[CNVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    v3 = 0;
  }
  else
  {
    if (-[CNVCardActivityAlertScanner nextUnescapedCharacter](self, "nextUnescapedCharacter") == 34)
      -[CNVCardActivityAlertScanner scanQuotedStringValue](self, "scanQuotedStringValue");
    else
      -[CNVCardActivityAlertScanner scanUnquotedStringValue](self, "scanUnquotedStringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)scanUnquotedStringValue
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    do
    {
      if (!objc_msgSend((id)objc_opt_class(), "characterIsStringValueCharacter:", -[CNVCardActivityAlertScanner nextCharacter](self, "nextCharacter")))break;
      objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (!-[CNVCardActivityAlertScanner atEnd](self, "atEnd"));
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)scanQuotedStringValue
{
  void *v3;

  -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    do
    {
      if (-[CNVCardActivityAlertScanner nextUnescapedCharacter](self, "nextUnescapedCharacter") == 34)
        break;
      objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (!-[CNVCardActivityAlertScanner atEnd](self, "atEnd"));
  }
  -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  return v3;
}

+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "characterIsMember:", v3);

  if ((v5 & 1) != 0)
    return 0;
  return (_DWORD)v3 != 61 && (_DWORD)v3 != 44;
}

- (BOOL)scanPastKeyValueSeparator
{
  return -[CNVCardActivityAlertScanner scanPastCharacter:](self, "scanPastCharacter:", 61);
}

- (BOOL)scanPastItemDelimiter
{
  return -[CNVCardActivityAlertScanner scanPastCharacter:](self, "scanPastCharacter:", 44);
}

- (unsigned)scanCharacter
{
  return -[CNVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 1);
}

- (unsigned)scanCharacterWithEscaping:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSString *string;

  v3 = a3;
  if (-[CNVCardActivityAlertScanner atEnd](self, "atEnd"))
  {
    LOWORD(v5) = 0;
  }
  else
  {
    string = self->_string;
    ++self->_position;
    v5 = -[NSString characterAtIndex:](string, "characterAtIndex:");
    if (v5 == 92 && v3)
      LOWORD(v5) = -[CNVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 0);
  }
  return v5;
}

- (BOOL)scanPastCharacter:(unsigned __int16)a3
{
  int v3;
  unint64_t position;
  int v6;

  v3 = a3;
  -[CNVCardActivityAlertScanner scanPastWhitespace](self, "scanPastWhitespace");
  position = self->_position;
  v6 = -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  if (v6 == v3)
    -[CNVCardActivityAlertScanner scanPastWhitespace](self, "scanPastWhitespace");
  else
    self->_position = position;
  return v6 == v3;
}

- (void)scanPastWhitespace
{
  int v3;
  unsigned __int16 v4;
  void *v5;
  int v6;
  int v7;

  v3 = -[CNVCardActivityAlertScanner nextCharacter](self, "nextCharacter");
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "characterIsMember:", v4);

      if (!v6)
        break;
      -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
      v7 = -[CNVCardActivityAlertScanner nextCharacter](self, "nextCharacter");
      v4 = v7;
    }
    while (v7);
  }
}

- (unsigned)nextCharacter
{
  unint64_t position;
  unsigned __int16 result;

  position = self->_position;
  result = -[CNVCardActivityAlertScanner scanCharacter](self, "scanCharacter");
  self->_position = position;
  return result;
}

- (unsigned)nextUnescapedCharacter
{
  unint64_t position;
  unsigned __int16 result;

  position = self->_position;
  result = -[CNVCardActivityAlertScanner scanCharacterWithEscaping:](self, "scanCharacterWithEscaping:", 0);
  self->_position = position;
  return result;
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)atEnd
{
  unint64_t position;

  position = self->_position;
  return position >= -[NSString length](self->_string, "length");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
