@implementation TypistKeyboardHawaiian

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardHawaiian;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("haw"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardHawaiian;
  -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[TypistKeyboardHawaiian setKahakoKeys:](self, "setKahakoKeys:", &unk_251A993F8);
  return v5;
}

- (void)setupSentenceBoundryStrings
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TypistKeyboardHawaiian;
  -[TypistKeyboard setupSentenceBoundryStrings](&v3, sel_setupSentenceBoundryStrings);
  -[TypistKeyboard setSentencePrefixingCharacters:](self, "setSentencePrefixingCharacters:", CFSTR("¡¿'\"‘“(ʻ"));
}

- (void)preprocessing
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)TypistKeyboardHawaiian;
  -[TypistKeyboard preprocessing](&v8, sel_preprocessing);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (CGRectGetHeight(v9) <= 1194.0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  if (CGRectGetHeight(v10) <= 1194.0)
  {
LABEL_7:

    return;
  }
  v5 = -[TypistKeyboard isFloating](self, "isFloating");

  if (v5)
  {
LABEL_6:
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("¯"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardHawaiian setKahakoDiacriticKey:](self, "setKahakoDiacriticKey:", v7);

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  double Height;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v14;
  CGRect v15;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  Height = CGRectGetHeight(v14);
  if (Height > 1194.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v15) <= 1194.0 || !-[TypistKeyboard isFloating](self, "isFloating"))
    {
      v12 = v5;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[TypistKeyboardHawaiian kahakoKeys](self, "kahakoKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[TypistKeyboardHawaiian kahakoKeys](self, "kahakoKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v5;
  }

  if (Height > 1194.0)
    goto LABEL_9;
LABEL_10:

  return v12;
}

- (id)addAccentKeyAction:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  double Height;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  CGRect v17;
  CGRect v18;

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  Height = CGRectGetHeight(v17);
  if (Height > 1194.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (CGRectGetHeight(v18) <= 1194.0 || !-[TypistKeyboard isFloating](self, "isFloating"))
    {
      v14 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  -[TypistKeyboardHawaiian kahakoKeys](self, "kahakoKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[TypistKeyboardHawaiian kahakoDiacriticKey](self, "kahakoDiacriticKey");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[TypistKeyboardHawaiian kahakoDiacriticKey](self, "kahakoDiacriticKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }

  }
  v14 = 0;
LABEL_10:
  if (Height > 1194.0)
    goto LABEL_11;
LABEL_12:

  return v14;
}

- (TypistKeyboardHawaiian)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardHawaiian *v5;
  uint64_t v6;
  NSDictionary *kahakoKeys;
  uint64_t v8;
  NSDictionary *kahakoDiacriticKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardHawaiian;
  v5 = -[TypistKeyboard initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kahakoKeys"));
    v6 = objc_claimAutoreleasedReturnValue();
    kahakoKeys = v5->_kahakoKeys;
    v5->_kahakoKeys = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kahakoDiacriticKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    kahakoDiacriticKey = v5->_kahakoDiacriticKey;
    v5->_kahakoDiacriticKey = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *kahakoKeys;
  NSDictionary *kahakoDiacriticKey;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardHawaiian;
  -[TypistKeyboard encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  kahakoKeys = self->_kahakoKeys;
  if (kahakoKeys)
    objc_msgSend(v4, "encodeObject:forKey:", kahakoKeys, CFSTR("kahakoKeys"));
  kahakoDiacriticKey = self->_kahakoDiacriticKey;
  if (kahakoDiacriticKey)
    objc_msgSend(v4, "encodeObject:forKey:", kahakoDiacriticKey, CFSTR("kahakoDiacriticKey"));

}

- (NSDictionary)kahakoKeys
{
  return self->_kahakoKeys;
}

- (void)setKahakoKeys:(id)a3
{
  objc_storeStrong((id *)&self->_kahakoKeys, a3);
}

- (NSDictionary)kahakoDiacriticKey
{
  return self->_kahakoDiacriticKey;
}

- (void)setKahakoDiacriticKey:(id)a3
{
  objc_storeStrong((id *)&self->_kahakoDiacriticKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kahakoDiacriticKey, 0);
  objc_storeStrong((id *)&self->_kahakoKeys, 0);
}

@end
