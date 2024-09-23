@implementation TypistKeyboardSinhala

- (id)init:(id)a3 options:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardSinhala;
  return -[TypistKeyboard init:options:locale:](&v5, sel_init_options_locale_, a3, a4, CFSTR("si"));
}

- (id)setupKeyboardInfo:(id)a3 options:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardSinhala;
  -[TypistKeyboard setupKeyboardInfo:options:](&v7, sel_setupKeyboardInfo_options_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[TypistKeyboardSinhala setJoinedVowelForms:](self, "setJoinedVowelForms:", &unk_251A99560);
  return v5;
}

- (id)tryAlternateVariationsOfKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[TypistKeyboardSinhala joinedVowelForms](self, "joinedVowelForms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TypistKeyboardSinhala joinedVowelForms](self, "joinedVowelForms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)TypistKeyboardSinhala;
    -[TypistKeyboard generateKeystrokeStream:](&v11, sel_generateKeystrokeStream_, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (TypistKeyboardSinhala)initWithCoder:(id)a3
{
  id v4;
  TypistKeyboardSinhala *v5;
  uint64_t v6;
  NSDictionary *joinedVowelForms;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TypistKeyboardSinhala;
  v5 = -[TypistKeyboard initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("joinedVowelForms"));
    v6 = objc_claimAutoreleasedReturnValue();
    joinedVowelForms = v5->_joinedVowelForms;
    v5->_joinedVowelForms = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *joinedVowelForms;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TypistKeyboardSinhala;
  -[TypistKeyboard encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  joinedVowelForms = self->_joinedVowelForms;
  if (joinedVowelForms)
    objc_msgSend(v4, "encodeObject:forKey:", joinedVowelForms, CFSTR("joinedVowelForms"));

}

- (NSDictionary)joinedVowelForms
{
  return self->_joinedVowelForms;
}

- (void)setJoinedVowelForms:(id)a3
{
  objc_storeStrong((id *)&self->_joinedVowelForms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinedVowelForms, 0);
}

@end
