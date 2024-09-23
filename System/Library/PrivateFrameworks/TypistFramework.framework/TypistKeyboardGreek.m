@implementation TypistKeyboardGreek

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardGreek;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("el_GR"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardGreek;
  -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[TypistKeyboardGreek setAcuteKeys:](self, "setAcuteKeys:", &unk_251A993D0);
  return v5;
}

- (void)setupSentenceBoundryStrings
{
  -[TypistKeyboard setSentenceDelimitingCharacters:](self, "setSentenceDelimitingCharacters:", CFSTR("'\"’”;"));
  -[TypistKeyboard setSentenceTrailingCharacters:](self, "setSentenceTrailingCharacters:", CFSTR(".?!»"));
  -[TypistKeyboard setSentencePrefixingCharacters:](self, "setSentencePrefixingCharacters:", CFSTR("¡¿'\"‘“(«"));
}

- (void)preprocessing
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardGreek;
  -[TypistKeyboard preprocessing](&v15, sel_preprocessing);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (CGRectGetHeight(v16) <= 1194.0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  if (CGRectGetHeight(v17) <= 1194.0)
  {
LABEL_7:

    return;
  }
  v5 = -[TypistKeyboard isFloating](self, "isFloating");

  if (v5)
  {
LABEL_6:
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("´"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardGreek setAcuteDiacriticKey:](self, "setAcuteDiacriticKey:", v9);

    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("σ"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("ς"));

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  double Height;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v16;
  CGRect v17;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  Height = CGRectGetHeight(v16);
  if (Height > 1194.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v17) <= 1194.0 || !-[TypistKeyboard isFloating](self, "isFloating"))
    {
      v14 = v5;
LABEL_12:

      goto LABEL_13;
    }
  }
  -[TypistKeyboardGreek acuteKeys](self, "acuteKeys");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[TypistKeyboardGreek acuteKeys](self, "acuteKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[TypistKeyboardGreek acuteKeys](self, "acuteKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v5);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = v5;
    }

  }
  else
  {
    v14 = v5;
  }
  if (Height > 1194.0)
    goto LABEL_12;
LABEL_13:

  return v14;
}

- (id)addAccentKeyAction:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  double Height;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  CGRect v18;
  CGRect v19;

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  Height = CGRectGetHeight(v18);
  if (Height > 1194.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v19) <= 1194.0 || !-[TypistKeyboard isFloating](self, "isFloating"))
    {
      v15 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[TypistKeyboardGreek acuteKeys](self, "acuteKeys");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  -[TypistKeyboardGreek acuteDiacriticKey](self, "acuteDiacriticKey");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

LABEL_10:
    v15 = 0;
    goto LABEL_13;
  }
  v11 = (void *)v10;
  -[TypistKeyboardGreek acuteKeys](self, "acuteKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[TypistKeyboardGreek acuteDiacriticKey](self, "acuteDiacriticKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

LABEL_13:
  if (Height > 1194.0)
    goto LABEL_14;
LABEL_15:

  return v15;
}

- (TypistKeyboardGreek)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardGreek *v5;
  uint64_t v6;
  NSDictionary *acuteKeys;
  uint64_t v8;
  NSDictionary *acuteDiacriticKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardGreek;
  v5 = -[TypistKeyboard initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acuteKeys"));
    v6 = objc_claimAutoreleasedReturnValue();
    acuteKeys = v5->_acuteKeys;
    v5->_acuteKeys = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acuteDiacriticKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    acuteDiacriticKey = v5->_acuteDiacriticKey;
    v5->_acuteDiacriticKey = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *acuteKeys;
  NSDictionary *acuteDiacriticKey;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardGreek;
  -[TypistKeyboard encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  acuteKeys = self->_acuteKeys;
  if (acuteKeys)
    objc_msgSend(v4, "encodeObject:forKey:", acuteKeys, CFSTR("acuteKeys"));
  acuteDiacriticKey = self->_acuteDiacriticKey;
  if (acuteDiacriticKey)
    objc_msgSend(v4, "encodeObject:forKey:", acuteDiacriticKey, CFSTR("acuteDiacriticKey"));

}

- (NSDictionary)acuteKeys
{
  return self->_acuteKeys;
}

- (void)setAcuteKeys:(id)a3
{
  objc_storeStrong((id *)&self->_acuteKeys, a3);
}

- (NSDictionary)acuteDiacriticKey
{
  return self->_acuteDiacriticKey;
}

- (void)setAcuteDiacriticKey:(id)a3
{
  objc_storeStrong((id *)&self->_acuteDiacriticKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acuteDiacriticKey, 0);
  objc_storeStrong((id *)&self->_acuteKeys, 0);
}

@end
