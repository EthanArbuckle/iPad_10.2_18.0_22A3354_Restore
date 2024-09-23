@implementation TypistKeyboardTibetan

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardTibetan;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("bo"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TypistKeyboardTibetan;
  -[TypistKeyboard setupKeyboardInfo:options:](&v10, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[\\u0F90-\\u0FBC|\\u0F71]"), 1, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    -[TypistKeyboardTibetan setSubjoinedExpression:](self, "setSubjoinedExpression:", v6);

  }
  return v5;
}

- (id)tryAlternateVariationsOfKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;
  objc_super v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (objc_msgSend(v4, "characterAtIndex:", 0) == 3953)
  {
    v16.receiver = self;
    v16.super_class = (Class)TypistKeyboardTibetan;
    -[TypistKeyboard generateKeystrokeStream:](&v16, sel_generateKeystrokeStream_, CFSTR("྄འ"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[TypistKeyboardTibetan subjoinedExpression](self, "subjoinedExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  if (!v8)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "length");
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - v9;
  *(_WORD *)((char *)&v14 - v9) = 3972;
  if (objc_msgSend(v5, "length"))
  {
    v11 = 0;
    do
    {
      *(_WORD *)&v10[2 * v11 + 2] = objc_msgSend(v5, "characterAtIndex:", v11) - 80;
      ++v11;
    }
    while (v11 < objc_msgSend(v5, "length"));
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v10, objc_msgSend(v5, "length") + 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardTibetan;
  -[TypistKeyboard generateKeystrokeStream:](&v15, sel_generateKeystrokeStream_, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v6;
}

- (TypistKeyboardTibetan)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardTibetan *v5;
  uint64_t v6;
  NSRegularExpression *subjoinedExpression;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardTibetan;
  v5 = -[TypistKeyboard initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjoinedExpression"));
    v6 = objc_claimAutoreleasedReturnValue();
    subjoinedExpression = v5->_subjoinedExpression;
    v5->_subjoinedExpression = (NSRegularExpression *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSRegularExpression *subjoinedExpression;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardTibetan;
  -[TypistKeyboard encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  subjoinedExpression = self->_subjoinedExpression;
  if (subjoinedExpression)
    objc_msgSend(v4, "encodeObject:forKey:", subjoinedExpression, CFSTR("subjoinedExpression"));

}

- (NSRegularExpression)subjoinedExpression
{
  return self->_subjoinedExpression;
}

- (void)setSubjoinedExpression:(id)a3
{
  objc_storeStrong((id *)&self->_subjoinedExpression, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjoinedExpression, 0);
}

@end
