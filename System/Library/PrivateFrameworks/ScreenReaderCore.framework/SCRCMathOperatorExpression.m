@implementation SCRCMathOperatorExpression

- (SCRCMathOperatorExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathOperatorExpression *v5;
  void *v6;
  uint64_t v7;
  NSString *content;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathOperatorExpression;
  v5 = -[SCRCMathSimpleExpression initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMUnichar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)&v5->super._isImplicit + 1) = objc_msgSend(v6, "unsignedShortValue");

    if (*((_WORD *)&v5->super._isImplicit + 1) == 45 && -[NSString length](v5->super._content, "length") == 1)
    {
      *((_WORD *)&v5->super._isImplicit + 1) = 8722;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v5->super._isImplicit + 2, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      content = v5->super._content;
      v5->super._content = (NSString *)v7;

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCRCMathOperatorExpression;
  -[SCRCMathSimpleExpression description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", operator character %C"), *((unsigned __int16 *)&self->super._isImplicit + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isIntegral
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) - 8747 < 4;
}

- (BOOL)_isUnionOrIntersection
{
  int v2;
  BOOL v3;
  unsigned int v4;

  v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  v3 = (v2 - 8898) >= 2;
  v4 = v2 - 8745;
  return !v3 || v4 <= 1;
}

- (BOOL)_isSummation
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8721;
}

- (BOOL)canBeUsedWithRange
{
  return -[SCRCMathOperatorExpression _isIntegral](self, "_isIntegral")
      || -[SCRCMathOperatorExpression _isUnionOrIntersection](self, "_isUnionOrIntersection")
      || -[SCRCMathOperatorExpression _isSummation](self, "_isSummation");
}

- (BOOL)_isRingOperator
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8728;
}

- (BOOL)_isInvisibleCharacter
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) - 8289 < 2;
}

- (BOOL)_isMinusSign
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 8722;
}

- (BOOL)_isFactorialSign
{
  return *((unsigned __int16 *)&self->super._isImplicit + 1) == 33;
}

- (BOOL)isEllipsis
{
  int v2;

  v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  return v2 == 8230 || v2 == 8943;
}

- (BOOL)isTermSeparator
{
  unsigned int v2;
  _BOOL8 v3;

  v2 = *((unsigned __int16 *)&self->super._isImplicit + 1);
  if ((v2 & 0xFF00) == 0x2200)
  {
    LOBYTE(v3) = 1;
  }
  else if (v2 > 0x3E)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x7000280000000000uLL >> v2) & 1;
  }
  return v3;
}

- (BOOL)isOperationSymbol
{
  void *v2;
  BOOL v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 1;

  return v3;
}

- (BOOL)isFenceDelimiter
{
  void *v3;
  void *v4;
  char v5;

  -[SCRCMathExpression fenceDelimiters](self, "fenceDelimiters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (id)latexFormatStringAsOver
{
  void *v3;
  void *v4;
  void *v5;

  if (latexFormatStringAsOver_onceToken != -1)
    dispatch_once(&latexFormatStringAsOver_onceToken, &__block_literal_global_3);
  v3 = (void *)latexFormatStringAsOver__OverLookupTable;
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __53__SCRCMathOperatorExpression_latexFormatStringAsOver__block_invoke()
{
  void *v0;

  v0 = (void *)latexFormatStringAsOver__OverLookupTable;
  latexFormatStringAsOver__OverLookupTable = (uint64_t)&unk_24CB305C0;

}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SCRCMathOperatorExpression;
  -[SCRCMathSimpleExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v22, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (-[SCRCMathOperatorExpression _isRingOperator](self, "_isRingOperator"))
    {
      -[SCRCMathExpression siblings](self, "siblings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", self);
      if (v7 == objc_msgSend(v6, "count") - 1)
      {
        -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("operator.degrees"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
LABEL_26:

      if (v5)
        goto LABEL_28;
      goto LABEL_27;
    }
    if (-[SCRCMathOperatorExpression _isInvisibleCharacter](self, "_isInvisibleCharacter"))
    {
      objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:", &stru_24CB26880);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (!-[SCRCMathOperatorExpression _isMinusSign](self, "_isMinusSign"))
    {
      if (!-[SCRCMathOperatorExpression _isFactorialSign](self, "_isFactorialSign"))
      {
LABEL_27:
        v15 = (void *)MEMORY[0x24BDD1458];
        -[SCRCMathSimpleExpression content](self, "content");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scrcStringWithLiteralString:", v16);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("operator.factorial"));
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v5 = (void *)v8;
      if (v8)
        goto LABEL_28;
      goto LABEL_27;
    }
    -[SCRCMathExpression siblings](self, "siblings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", self);
    v10 = v9;
    if (v9)
    {
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SCRCMathExpression parent](self, "parent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("AX: VoiceOver: Math: Error: Expression %@ could not be found among parent %@'s children"), self, v11);
        goto LABEL_22;
      }
      objc_msgSend(v6, "objectAtIndex:", v9 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      if (v12 && !objc_msgSend(v12, "isFenceDelimiter"))
        goto LABEL_22;
    }
    else
    {
      v11 = 0;
    }
    v13 = v10 + 1;
    if (v13 < objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isOperationSymbol") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("operator.negative"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_25;
    }
LABEL_22:
    v5 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_28:
  if (-[SCRCMathSimpleExpression isImplicit](self, "isImplicit"))
  {
    v17 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("implicit.decoration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("implicit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrcStringWithFormat:", v18, v19, v5);
    v20 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v20;
  }
  return v5;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  if (-[SCRCMathOperatorExpression _isInvisibleCharacter](self, "_isInvisibleCharacter"))
  {
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:treePosition:", &stru_24CB26880, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCRCMathOperatorExpression;
    -[SCRCMathSimpleExpression dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:](&v10, sel_dollarCodeDescriptionWithNumberOfOuterRadicals_treePosition_, a3, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)mathMLString
{
  void *v2;
  void *v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWrappedInMathMLTag:", CFSTR("mo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)operatorChar
{
  return *((_WORD *)&self->super._isImplicit + 1);
}

@end
