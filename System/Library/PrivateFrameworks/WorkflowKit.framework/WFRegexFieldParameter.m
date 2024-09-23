@implementation WFRegexFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFRegexFieldParameter)initWithDefinition:(id)a3
{
  WFRegexFieldParameter *v3;
  WFRegexFieldParameter *v4;
  WFRegexFieldParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRegexFieldParameter;
  v3 = -[WFTextInputParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)hintForState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "variableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingVariables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "variableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "variables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_3:
    v8 = 0;
    goto LABEL_8;
  }
  v9 = objc_msgSend(v5, "length");

  if (!v9)
    goto LABEL_3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v5, 0, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (!v10)
  {
    WFLocalizedString(CFSTR("Invalid pattern"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v8;
}

- (NSString)localizedIncompleteHintString
{
  return 0;
}

@end
