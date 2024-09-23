@implementation SCRCMathLongDivisionExpression

- (SCRCMathLongDivisionExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathLongDivisionExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRCMathLongDivisionExpression;
  v5 = -[SCRCMathArrayExpression initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(CFSTR("Term"), "stringByAppendingString:", CFSTR("1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathLongDivisionExpression setDivisor:](v5, "setDivisor:", v8);

  }
  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.long.division.formatter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathLongDivisionExpression divisor](self, "divisor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)SCRCMathLongDivisionExpression;
  -[SCRCMathArrayExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v13, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithFormat:", v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SCRCMathExpression)divisor
{
  return self->_divisor;
}

- (void)setDivisor:(id)a3
{
  objc_storeStrong((id *)&self->_divisor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divisor, 0);
}

@end
