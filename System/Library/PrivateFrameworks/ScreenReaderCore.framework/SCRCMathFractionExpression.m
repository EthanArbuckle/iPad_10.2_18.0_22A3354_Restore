@implementation SCRCMathFractionExpression

- (SCRCMathFractionExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathFractionExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  SCRCMathFractionExpression *v14;
  void *v15;
  void *v16;
  SCRCMathFractionExpression *v17;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCRCMathFractionExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v20, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMNumeratorObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(CFSTR("Term"), "stringByAppendingString:", CFSTR("1"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMDenominatorObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(CFSTR("Term"), "stringByAppendingString:", CFSTR("2"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v14 = v5;
      v5 = 0;
    }
    else
    {
      -[SCRCMathFractionExpression setNumerator:](v5, "setNumerator:", v10);
      -[SCRCMathFractionExpression setDenominator:](v5, "setDenominator:", v12);
      objc_msgSend(v4, "objectForKey:", CFSTR("AXMOperator"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathFractionExpression setOperator:](v5, "setOperator:", v16);

      objc_msgSend(v4, "objectForKey:", CFSTR("AXMLineThickness"));
      v17 = (SCRCMathFractionExpression *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      if (v17)
        -[SCRCMathFractionExpression doubleValue](v17, "doubleValue");
      else
        v18 = 1.0;
      -[SCRCMathFractionExpression setLineThickness:](v5, "setLineThickness:", v18);
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCRCMathFractionExpression;
  -[SCRCMathFractionExpression description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression numerator](self, "numerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression denominator](self, "denominator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression operator](self, "operator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression lineThickness](self, "lineThickness");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - numerator %@, denominator %@, operator %@, line thickness %f"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subExpressions
{
  void *v3;
  void *v4;
  void *v5;

  -[SCRCMathFractionExpression numerator](self, "numerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression denominator](self, "denominator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression arrayWithoutNilsFromFirstChild:secondChild:thirdChild:](self, "arrayWithoutNilsFromFirstChild:secondChild:thirdChild:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isUnlinedFraction
{
  double v2;

  -[SCRCMathFractionExpression lineThickness](self, "lineThickness");
  return v2 == 0.0;
}

- (unint64_t)fractionLevel
{
  return -[SCRCMathExpression maximumFractionLevelOfSubExpressions](self, "maximumFractionLevelOfSubExpressions") + 1;
}

- (BOOL)isSimpleNumericalFraction
{
  void *v3;
  void *v4;
  char v5;

  -[SCRCMathFractionExpression numerator](self, "numerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isNumber"))
  {
    -[SCRCMathFractionExpression denominator](self, "denominator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNumber");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4 asBinomialCoefficient:(BOOL)a5
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[SCRCMathFractionExpression numerator](self, "numerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathFractionExpression denominator](self, "denominator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v13 = CFSTR("binomial.coefficient.formatter");
  }
  else if (objc_msgSend(v10, "scrcContainsPause"))
  {
    v13 = CFSTR("math.fraction.with.long.numerator.formatter");
  }
  else
  {
    v13 = CFSTR("math.fraction.formatter");
  }
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithFormat:", v14, v10, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  return -[SCRCMathFractionExpression _speakableDescriptionWithSpeakingStyle:arePausesAllowed:asBinomialCoefficient:](self, "_speakableDescriptionWithSpeakingStyle:arePausesAllowed:asBinomialCoefficient:", a3, a4, -[SCRCMathFractionExpression isUnlinedFraction](self, "isUnlinedFraction"));
}

- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3
{
  return -[SCRCMathFractionExpression _speakableDescriptionWithSpeakingStyle:arePausesAllowed:asBinomialCoefficient:](self, "_speakableDescriptionWithSpeakingStyle:arePausesAllowed:asBinomialCoefficient:", a3, 0, 1);
}

- (id)_speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 asBinomialCoefficient:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  unint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  char v31;
  void *v32;
  int v33;
  __CFString *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v6 = a6;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (a4)
  {
    v11 = a4 - 1;
    if (a4 == 1)
    {
      v41.receiver = self;
      v41.super_class = (Class)SCRCMathFractionExpression;
      -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v41, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, 1, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("segment.");
      if (v6)
        v13 = CFSTR("segment.binomial.coefficient.");
      v14 = v13;
      -[SCRCMathFractionExpression numerator](self, "numerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathByAddingIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("numerator.prefix"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("numerator.suffix"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, a4 - 1, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[SCRCMathFractionExpression denominator](self, "denominator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v10;
      objc_msgSend(v10, "indexPathByAddingIndex:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("denominator.prefix"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v14;
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("denominator.suffix"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, v11, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", CFSTR("Fraction"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v38 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("numerator"));
            v32 = v19;
            if ((v31 & 1) == 0)
            {
              v33 = objc_msgSend(v30, "isEqualToString:", CFSTR("denominator"));
              v32 = v24;
              if (!v33)
                continue;
            }
            objc_msgSend(v12, "addObjectsFromArray:", v32);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v27);
      }

      v10 = v36;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return -[SCRCMathFractionExpression _speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:asBinomialCoefficient:](self, "_speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:asBinomialCoefficient:", a3, a4, a5, 0);
}

- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return -[SCRCMathFractionExpression _speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:asBinomialCoefficient:](self, "_speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:asBinomialCoefficient:", a3, a4, a5, 1);
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return -[SCRCMathFractionExpression _dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:](self, "_dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:", 0, 0, a3, a4);
}

- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3
{
  return -[SCRCMathFractionExpression _dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:](self, "_dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:", 0, 1, 0, a3);
}

- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4
{
  return -[SCRCMathFractionExpression _dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:](self, "_dollarCodeDescriptionAsBinomialCoefficient:orMixedNumberFraction:withNumberOfOuterRadicals:treePosition:", 1, 0, a4, a3);
}

- (id)_dollarCodeDescriptionAsBinomialCoefficient:(BOOL)a3 orMixedNumberFraction:(BOOL)a4 withNumberOfOuterRadicals:(unint64_t)a5 treePosition:(id)a6
{
  _BOOL4 v8;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v29;

  v8 = a3;
  v10 = a6;
  if (v8)
    v11 = CFSTR("nr");
  else
    v11 = CFSTR("fl");
  if (v8)
    v12 = 0;
  else
    v12 = CFSTR("fe0");
  if (v8)
    v13 = 0;
  else
    v13 = CFSTR("fs0");
  if (!v8 && !a4)
  {
    v14 = -[SCRCMathFractionExpression fractionLevel](self, "fractionLevel");
    v12 = CFSTR("fe2");
    v15 = CFSTR("fs");
    v16 = CFSTR("fe");
    v17 = CFSTR("fl");
    if (v14 == 2)
    {
      v17 = CFSTR("fl1");
      v16 = CFSTR("fe1");
      v15 = CFSTR("fs1");
    }
    if (v14 == 3)
      v11 = CFSTR("fl2");
    else
      v11 = v17;
    if (v14 == 3)
    {
      v13 = CFSTR("fs2");
    }
    else
    {
      v12 = v16;
      v13 = v15;
    }
  }
  v29 = v12;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v13, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendAttributedString:", v19);

  }
  -[SCRCMathFractionExpression numerator](self, "numerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathByAddingIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a5, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendAttributedString:", v22);

  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v11, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendAttributedString:", v23);

  -[SCRCMathFractionExpression denominator](self, "denominator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathByAddingIndex:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a5, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendAttributedString:", v26);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v29, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendAttributedString:", v27);

  }
  return v18;
}

- (id)mathMLString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCRCMathFractionExpression numerator](self, "numerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mathMLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathFractionExpression denominator](self, "denominator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mathMLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("linethickness");
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[SCRCMathFractionExpression lineThickness](self, "lineThickness");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%g"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWrappedInMathMLTag:withAttributes:", CFSTR("mfrac"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)latexMathModeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCRCMathExpression latexDescriptionInMathMode:](self->_numerator, "latexDescriptionInMathMode:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression latexDescriptionInMathMode:](self->_denominator, "latexDescriptionInMathMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\\frac{%@}{%@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SCRCMathExpression)numerator
{
  return self->_numerator;
}

- (void)setNumerator:(id)a3
{
  objc_storeStrong((id *)&self->_numerator, a3);
}

- (SCRCMathExpression)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(id)a3
{
  objc_storeStrong((id *)&self->_denominator, a3);
}

- (SCRCMathExpression)operator
{
  return self->_operator;
}

- (void)setOperator:(id)a3
{
  objc_storeStrong((id *)&self->_operator, a3);
}

- (double)lineThickness
{
  return self->_lineThickness;
}

- (void)setLineThickness:(double)a3
{
  self->_lineThickness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong((id *)&self->_denominator, 0);
  objc_storeStrong((id *)&self->_numerator, 0);
}

@end
