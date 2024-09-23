@implementation TypistKeyboardCzech

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardCzech;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("cs_CZ"));
}

- (id)convertRepresentedStringsIfNecessary:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("̌")) & 1) != 0)
    v4 = CFSTR("ˇ");
  else
    v4 = (__CFString *)v3;

  return v4;
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardCzech;
  -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TypistKeyboardCzech setAcuteKeys:](self, "setAcuteKeys:", &unk_251A992E0);
    -[TypistKeyboardCzech setCaronKeys:](self, "setCaronKeys:", &unk_251A99308);
  }
  return v5;
}

- (id)getPostfixKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (CGRectGetHeight(v16) <= 1194.0)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
    if (CGRectGetHeight(v17) <= 1194.0)
    {

      goto LABEL_12;
    }
    v7 = -[TypistKeyboard isFloating](self, "isFloating");

    if (!v7)
      goto LABEL_12;
  }
  -[TypistKeyboardCzech acuteKeys](self, "acuteKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[TypistKeyboardCzech caronKeys](self, "caronKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[TypistKeyboardCzech caronKeys](self, "caronKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v14 = v4;
    goto LABEL_13;
  }
  -[TypistKeyboardCzech acuteKeys](self, "acuteKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v13 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (void)preprocessing
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardCzech;
  -[TypistKeyboard preprocessing](&v7, sel_preprocessing);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (CGRectGetHeight(v8) <= 1194.0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  if (CGRectGetHeight(v9) <= 1194.0)
  {

    goto LABEL_8;
  }
  v5 = -[TypistKeyboard isFloating](self, "isFloating");

  if (v5)
  {
LABEL_6:
    -[TypistKeyboard findKeyOnAnyPlane:](self, "findKeyOnAnyPlane:", CFSTR("´"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardCzech setAcuteDiacriticKey:](self, "setAcuteDiacriticKey:", v6);

    -[TypistKeyboard findKeyOnAnyPlane:](self, "findKeyOnAnyPlane:", CFSTR("ˇ"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TypistKeyboardCzech setCaronDiacriticKey:](self, "setCaronDiacriticKey:", v3);
LABEL_8:

  }
}

- (id)addAccentKeyAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  CGRect v22;
  CGRect v23;

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  if (CGRectGetHeight(v22) <= 1194.0)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_referenceBounds");
    if (CGRectGetHeight(v23) <= 1194.0)
    {

      goto LABEL_15;
    }
    v7 = -[TypistKeyboard isFloating](self, "isFloating");

    if (!v7)
      goto LABEL_16;
  }
  -[TypistKeyboardCzech acuteKeys](self, "acuteKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

LABEL_11:
    -[TypistKeyboardCzech caronKeys](self, "caronKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[TypistKeyboardCzech caronDiacriticKey](self, "caronDiacriticKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[TypistKeyboardCzech caronDiacriticKey](self, "caronDiacriticKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v12;
        v13 = (void *)MEMORY[0x24BDBCE30];
        v14 = &v20;
        goto LABEL_14;
      }
LABEL_16:
      v18 = 0;
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }
  v10 = (void *)v9;
  -[TypistKeyboardCzech acuteDiacriticKey](self, "acuteDiacriticKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_11;
  -[TypistKeyboardCzech acuteDiacriticKey](self, "acuteDiacriticKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v13 = (void *)MEMORY[0x24BDBCE30];
  v14 = (void **)v21;
LABEL_14:
  objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v18;
}

- (TypistKeyboardCzech)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardCzech *v5;
  uint64_t v6;
  NSDictionary *acuteKeys;
  uint64_t v8;
  NSDictionary *caronKeys;
  uint64_t v10;
  NSDictionary *acuteDiacriticKey;
  uint64_t v12;
  NSDictionary *caronDiacriticKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TypistKeyboardCzech;
  v5 = -[TypistKeyboard initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acuteKeys"));
    v6 = objc_claimAutoreleasedReturnValue();
    acuteKeys = v5->_acuteKeys;
    v5->_acuteKeys = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caronKeys"));
    v8 = objc_claimAutoreleasedReturnValue();
    caronKeys = v5->_caronKeys;
    v5->_caronKeys = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acuteDiacriticKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    acuteDiacriticKey = v5->_acuteDiacriticKey;
    v5->_acuteDiacriticKey = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caronDiacriticKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    caronDiacriticKey = v5->_caronDiacriticKey;
    v5->_caronDiacriticKey = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *acuteKeys;
  NSDictionary *caronKeys;
  NSDictionary *acuteDiacriticKey;
  NSDictionary *caronDiacriticKey;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardCzech;
  -[TypistKeyboard encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  acuteKeys = self->_acuteKeys;
  if (acuteKeys)
    objc_msgSend(v4, "encodeObject:forKey:", acuteKeys, CFSTR("acuteKeys"));
  caronKeys = self->_caronKeys;
  if (caronKeys)
    objc_msgSend(v4, "encodeObject:forKey:", caronKeys, CFSTR("caronKeys"));
  acuteDiacriticKey = self->_acuteDiacriticKey;
  if (acuteDiacriticKey)
    objc_msgSend(v4, "encodeObject:forKey:", acuteDiacriticKey, CFSTR("acuteDiacriticKey"));
  caronDiacriticKey = self->_caronDiacriticKey;
  if (caronDiacriticKey)
    objc_msgSend(v4, "encodeObject:forKey:", caronDiacriticKey, CFSTR("caronDiacriticKey"));

}

- (NSDictionary)acuteKeys
{
  return self->_acuteKeys;
}

- (void)setAcuteKeys:(id)a3
{
  objc_storeStrong((id *)&self->_acuteKeys, a3);
}

- (NSDictionary)caronKeys
{
  return self->_caronKeys;
}

- (void)setCaronKeys:(id)a3
{
  objc_storeStrong((id *)&self->_caronKeys, a3);
}

- (NSDictionary)acuteDiacriticKey
{
  return self->_acuteDiacriticKey;
}

- (void)setAcuteDiacriticKey:(id)a3
{
  objc_storeStrong((id *)&self->_acuteDiacriticKey, a3);
}

- (NSDictionary)caronDiacriticKey
{
  return self->_caronDiacriticKey;
}

- (void)setCaronDiacriticKey:(id)a3
{
  objc_storeStrong((id *)&self->_caronDiacriticKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caronDiacriticKey, 0);
  objc_storeStrong((id *)&self->_acuteDiacriticKey, 0);
  objc_storeStrong((id *)&self->_caronKeys, 0);
  objc_storeStrong((id *)&self->_acuteKeys, 0);
}

@end
