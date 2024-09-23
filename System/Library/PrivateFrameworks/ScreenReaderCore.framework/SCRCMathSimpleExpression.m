@implementation SCRCMathSimpleExpression

- (SCRCMathSimpleExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathSimpleExpression *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  NSString *content;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathSimpleExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v13, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMContent"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (__CFString *)v6;
    else
      v7 = &stru_24CB26880;
    v8 = -[__CFString copy](v7, "copy");
    content = v5->_content;
    v5->_content = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMIsImplicit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      LOBYTE(v10) = objc_msgSend(v10, "BOOLValue");
    v5->_isImplicit = (char)v10;

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
  v7.super_class = (Class)SCRCMathSimpleExpression;
  -[SCRCMathSimpleExpression description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - content %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isInteger
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  -[SCRCMathSimpleExpression content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));

  if (!-[SCRCMathExpression isNumber](self, "isNumber"))
    return 0;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  -[SCRCMathSimpleExpression content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == objc_msgSend(v6, "length") - 1;

  return v5;
}

- (int64_t)integerValue
{
  void *v2;
  int64_t v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isWordOrAbbreviation
{
  BOOL v3;
  void *v4;

  if (-[SCRCMathExpression isNumber](self, "isNumber"))
    return 0;
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v4, "length") > 1;

  return v3;
}

- (id)_functionNames
{
  if (_functionNames_onceToken != -1)
    dispatch_once(&_functionNames_onceToken, &__block_literal_global_4);
  return (id)_functionNames_FunctionNames;
}

void __42__SCRCMathSimpleExpression__functionNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CB30580);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_functionNames_FunctionNames;
  _functionNames_FunctionNames = v0;

}

- (BOOL)isFunctionName
{
  void *v3;
  void *v4;
  char v5;

  -[SCRCMathSimpleExpression _functionNames](self, "_functionNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)canBeUsedWithBase
{
  void *v3;
  char v4;
  void *v5;

  -[SCRCMathSimpleExpression content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("log")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SCRCMathSimpleExpression content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("lg"));

  }
  return v4;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (-[SCRCMathSimpleExpression isFunctionName](self, "isFunctionName", a3, a4))
  {
    -[SCRCMathSimpleExpression content](self, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("function."), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1458];
  v6 = a4;
  -[SCRCMathSimpleExpression content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrcStringWithString:treePosition:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)latexMathModeDescription
{
  void *v3;
  void *v4;

  -[SCRCMathSimpleExpression content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression latexIdentifierForIdentifier:](self, "latexIdentifierForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isImplicit
{
  return self->_isImplicit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
