@implementation SCRCMathFencedExpression

- (SCRCMathFencedExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathFencedExpression *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCMathFencedExpression;
  v5 = -[SCRCMathArrayExpression initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMOpenOperator"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v6, "length"))
    {

      v6 = CFSTR("(");
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMCloseOperator"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v7, "length"))
    {

      v7 = CFSTR(")");
    }
    -[SCRCMathFencedExpression setOpenString:](v5, "setOpenString:", v6);
    -[SCRCMathFencedExpression setCloseString:](v5, "setCloseString:", v7);
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMIsImplicit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      LOBYTE(v8) = objc_msgSend(v8, "BOOLValue");
    v5->_isClosingImplicit = (char)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCRCMathFencedExpression;
  -[SCRCMathArrayExpression description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFencedExpression openString](self, "openString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFencedExpression closeString](self, "closeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", open string %@, close string %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isBinomialCoefficient
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isUnlinedFraction"))
  {
    -[SCRCMathFencedExpression openString](self, "openString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("(")))
    {
      -[SCRCMathFencedExpression closeString](self, "closeString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(")"));

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

- (id)_binomialCoefficientContent
{
  void *v2;
  void *v3;

  -[SCRCMathArrayExpression children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_treePositionForBinomialCoefficientContentWithOuterTreePosition:(id)a3
{
  return (id)objc_msgSend(a3, "indexPathByAddingIndex:", 0);
}

- (unint64_t)fractionLevel
{
  void *v3;
  unint64_t v4;
  objc_super v6;

  if (-[SCRCMathFencedExpression _isBinomialCoefficient](self, "_isBinomialCoefficient"))
  {
    -[SCRCMathFencedExpression _binomialCoefficientContent](self, "_binomialCoefficientContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fractionLevel") - 1;

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SCRCMathFencedExpression;
    return -[SCRCMathRowExpression fractionLevel](&v6, sel_fractionLevel);
  }
  return v4;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_super v24;

  v4 = a4;
  if (-[SCRCMathFencedExpression _isBinomialCoefficient](self, "_isBinomialCoefficient"))
  {
    -[SCRCMathFencedExpression _binomialCoefficientContent](self, "_binomialCoefficientContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathFencedExpression openString](self, "openString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrcStringWithLiteralString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", v13);

    if (v4)
      objc_msgSend(MEMORY[0x24BDD1458], "scrcPauseString");
    else
      objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", v14);

    v24.receiver = self;
    v24.super_class = (Class)SCRCMathFencedExpression;
    -[SCRCMathRowExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v24, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v10, "appendAttributedString:", v15);
      if (v4)
        objc_msgSend(MEMORY[0x24BDD1458], "scrcPauseString");
      else
        objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendAttributedString:", v16);

    }
    v17 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathFencedExpression closeString](self, "closeString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrcStringWithLiteralString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SCRCMathFencedExpression isClosingImplicit](self, "isClosingImplicit"))
    {
      v20 = (void *)MEMORY[0x24BDD1458];
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("implicit.decoration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("implicit"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scrcStringWithFormat:", v21, v22, v19);
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v23;
    }
    objc_msgSend(v10, "appendAttributedString:", v19);

    return v10;
  }
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  objc_super v22;

  v8 = a5;
  if (a4 < 2)
  {
    v21.receiver = self;
    v21.super_class = (Class)SCRCMathFencedExpression;
    -[SCRCMathArrayExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v21, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, a4, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SCRCMathFencedExpression _isBinomialCoefficient](self, "_isBinomialCoefficient"))
    {
      -[SCRCMathFencedExpression _binomialCoefficientContent](self, "_binomialCoefficientContent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathFencedExpression _treePositionForBinomialCoefficientContentWithOuterTreePosition:](self, "_treePositionForBinomialCoefficientContentWithOuterTreePosition:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:upToDepth:treePosition:", a3, a4 - 1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathByAddingIndex:", -2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1458];
      -[SCRCMathFencedExpression openString](self, "openString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrcStringWithLiteralString:treePosition:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertObject:atIndex:", v14, 0);

      v22.receiver = self;
      v22.super_class = (Class)SCRCMathFencedExpression;
      -[SCRCMathArrayExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v22, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, a4, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v15);

      objc_msgSend(v8, "indexPathByAddingIndex:", -1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD1458];
      -[SCRCMathFencedExpression closeString](self, "closeString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scrcStringWithLiteralString:treePosition:", v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

    }
  }

  return v11;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1458];
  -[SCRCMathFencedExpression openString](self, "openString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathByAddingIndex:", -2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrcStringWithString:treePosition:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v11);

  if (-[SCRCMathFencedExpression _isBinomialCoefficient](self, "_isBinomialCoefficient"))
  {
    -[SCRCMathFencedExpression _binomialCoefficientContent](self, "_binomialCoefficientContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathFencedExpression _treePositionForBinomialCoefficientContentWithOuterTreePosition:](self, "_treePositionForBinomialCoefficientContentWithOuterTreePosition:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:numberOfOuterRadicals:", v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v14);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SCRCMathFencedExpression;
    -[SCRCMathRowExpression dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:](&v21, sel_dollarCodeDescriptionWithNumberOfOuterRadicals_treePosition_, a3, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v15);

  }
  v16 = (void *)MEMORY[0x24BDD1458];
  -[SCRCMathFencedExpression closeString](self, "closeString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathByAddingIndex:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scrcStringWithString:treePosition:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendAttributedString:", v19);

  return v7;
}

- (id)mathMLTag
{
  return CFSTR("mfenced");
}

- (id)mathMLAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("open");
  -[SCRCMathFencedExpression openString](self, "openString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  v7[2] = CFSTR("close");
  -[SCRCMathFencedExpression closeString](self, "closeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v4;
  v7[4] = CFSTR("separators");
  v7[5] = &stru_24CB26880;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression latexIdentifierForFenceOperator:isClosingOperator:](self, "latexIdentifierForFenceOperator:isClosingOperator:", self->_openString, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathFencedExpression;
  -[SCRCMathRowExpression latexDescriptionInMathMode:](&v10, sel_latexDescriptionInMathMode_, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(" "));
    objc_msgSend(v5, "appendString:", v7);
  }
  objc_msgSend(v5, "appendString:", CFSTR(" "));
  -[SCRCMathExpression latexIdentifierForFenceOperator:isClosingOperator:](self, "latexIdentifierForFenceOperator:isClosingOperator:", self->_closeString, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);
  if (!a3)
    objc_msgSend(v5, "addMathIndicators");

  return v5;
}

- (NSString)openString
{
  return self->_openString;
}

- (void)setOpenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)closeString
{
  return self->_closeString;
}

- (void)setCloseString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isClosingImplicit
{
  return self->_isClosingImplicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeString, 0);
  objc_storeStrong((id *)&self->_openString, 0);
}

@end
