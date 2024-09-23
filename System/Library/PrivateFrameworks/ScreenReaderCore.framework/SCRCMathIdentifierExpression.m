@implementation SCRCMathIdentifierExpression

- (SCRCMathIdentifierExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathIdentifierExpression *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathIdentifierExpression;
  v5 = -[SCRCMathSimpleExpression initWithDictionary:](&v9, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMFontStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("StyleItalic")))
    {
      v7 = 1;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("StyleBold")))
      {
        v5->_fontStyle = 0;
        goto LABEL_8;
      }
      v7 = 2;
    }
    v5->_fontStyle = v7;
LABEL_8:

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCRCMathIdentifierExpression;
  -[SCRCMathSimpleExpression description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fontStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", font style %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  return -[SCRCMathIdentifierExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:](self, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:", a3, a4, 0);
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 isPartOfWord:(BOOL)a5
{
  uint64_t v8;
  void *v9;
  NSString *content;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SCRCMathIdentifierExpression;
  -[SCRCMathSimpleExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v17, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!a3 && !v8)
  {
    content = self->super._content;
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSString rangeOfCharacterFromSet:](content, "rangeOfCharacterFromSet:", v11);

    v13 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathSimpleExpression content](self, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || a5)
    {
      objc_msgSend(v13, "scrcStringWithString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "scrcStringWithLiteralString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v15;

  }
  return v9;
}

- (id)mathMLString
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[SCRCMathIdentifierExpression isNumber](self, "isNumber");
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("mn");
  else
    v6 = CFSTR("mi");
  objc_msgSend(v4, "stringWrappedInMathMLTag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isNumber
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;

  if (-[SCRCMathExpression isNumberOverride](self, "isNumberOverride"))
    return 1;
  -[SCRCMathSimpleExpression content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 1;
  v5 = 0;
  v6 = 0;
  while (1)
  {
    -[SCRCMathSimpleExpression content](self, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterAtIndex:", 0);

    if (v5)
    {
      if ((_DWORD)v8 == 45)
        break;
    }
    if ((_DWORD)v8 == 46)
    {
      if ((v6 & 1) != 0)
        return 0;
      v6 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "characterIsMember:", v8);

      if (!v10)
        return 0;
    }
    if (v4 == ++v5)
      return 1;
  }
  return 0;
}

- (BOOL)_isPrime
{
  void *v2;
  BOOL v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    v3 = objc_msgSend(v2, "characterAtIndex:", 0) == 8242;
  else
    v3 = 0;

  return v3;
}

- (BOOL)canFormWordStartingWithExpression:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[SCRCMathIdentifierExpression fontStyle](self, "fontStyle");
    v7 = objc_msgSend(v5, "fontStyle");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

@end
