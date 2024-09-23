@implementation TypistKeyboardFrench

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardFrench;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("fr"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardFrench;
  -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[TypistKeyboardFrench setPostfixedKeys:](self, "setPostfixedKeys:", &unk_251A993A8);
  return v5;
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
  v15.super_class = (Class)TypistKeyboardFrench;
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
    -[TypistKeyboardFrench setAccentKey:](self, "setAccentKey:", v9);

    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("´"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard keyPlanes](self, "keyPlanes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboard defaultPlaneName](self, "defaultPlaneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("ˋ"));

    goto LABEL_7;
  }
}

- (id)getPostfixKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  -[TypistKeyboardFrench accentKey](self, "accentKey");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  -[TypistKeyboardFrench postfixedKeys](self, "postfixedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_referenceBounds");
  if (CGRectGetHeight(v16) <= 1194.0)
  {

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_referenceBounds");
  if (CGRectGetHeight(v17) <= 1194.0)
  {

LABEL_10:
LABEL_11:
    v14 = v4;
    goto LABEL_12;
  }
  v12 = -[TypistKeyboard isFloating](self, "isFloating");

  if (!v12)
    goto LABEL_11;
LABEL_8:
  -[TypistKeyboardFrench postfixedKeys](self, "postfixedKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

- (id)addAccentKeyAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  CGRect v16;
  CGRect v17;

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TypistKeyboardFrench postfixedKeys](self, "postfixedKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_11;
  -[TypistKeyboardFrench accentKey](self, "accentKey");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    v13 = 0;
    return v13;
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_referenceBounds");
  if (CGRectGetHeight(v16) <= 1194.0)
  {

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_referenceBounds");
  if (CGRectGetHeight(v17) <= 1194.0)
  {

    goto LABEL_10;
  }
  v11 = -[TypistKeyboard isFloating](self, "isFloating");

  if (!v11)
    goto LABEL_12;
LABEL_8:
  -[TypistKeyboardFrench accentKey](self, "accentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (TypistKeyboardFrench)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardFrench *v5;
  uint64_t v6;
  NSDictionary *postfixedKeys;
  uint64_t v8;
  NSDictionary *accentKey;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TypistKeyboardFrench;
  v5 = -[TypistKeyboard initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postfixedKeys"));
    v6 = objc_claimAutoreleasedReturnValue();
    postfixedKeys = v5->_postfixedKeys;
    v5->_postfixedKeys = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accentKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    accentKey = v5->_accentKey;
    v5->_accentKey = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *postfixedKeys;
  NSDictionary *accentKey;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardFrench;
  -[TypistKeyboard encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  postfixedKeys = self->_postfixedKeys;
  if (postfixedKeys)
    objc_msgSend(v4, "encodeObject:forKey:", postfixedKeys, CFSTR("postfixedKeys"));
  accentKey = self->_accentKey;
  if (accentKey)
    objc_msgSend(v4, "encodeObject:forKey:", accentKey, CFSTR("accentKey"));

}

- (NSDictionary)postfixedKeys
{
  return self->_postfixedKeys;
}

- (void)setPostfixedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_postfixedKeys, a3);
}

- (NSDictionary)accentKey
{
  return self->_accentKey;
}

- (void)setAccentKey:(id)a3
{
  objc_storeStrong((id *)&self->_accentKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentKey, 0);
  objc_storeStrong((id *)&self->_postfixedKeys, 0);
}

@end
