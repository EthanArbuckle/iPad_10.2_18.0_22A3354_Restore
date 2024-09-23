@implementation TUIDictationAccessory

- (TUIDictationAccessory)initWithLanguages:(id)a3 actionHandler:(id)a4
{
  id v7;
  TUIDictationAccessory *v8;
  TUIDictationAccessory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIDictationAccessory;
  v8 = -[TUICursorAccessory initWithIdentifier:actionHandler:](&v11, sel_initWithIdentifier_actionHandler_, 0, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_languages, a3);

  return v9;
}

- (TUIDictationAccessory)initWithCoder:(id)a3
{
  id v4;
  TUIDictationAccessory *v5;
  uint64_t v6;
  NSArray *languages;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIDictationAccessory;
  v5 = -[TUICursorAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("TUILanguagesCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIDictationAccessory;
  v4 = a3;
  -[TUICursorAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, CFSTR("TUILanguagesCodingKey"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  TUIDictationAccessory *v4;
  TUIDictationAccessory *v5;
  BOOL v6;

  v4 = (TUIDictationAccessory *)a3;
  v5 = v4;
  if (v4)
    v6 = self == v4 || -[NSArray isEqualToArray:](self->_languages, "isEqualToArray:", v4->_languages);
  else
    v6 = 0;

  return v6;
}

- (id)additionalComponents
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIDictationAccessory;
  -[TUICursorAccessory additionalComponents](&v6, sel_additionalComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_languages)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("languages = %@"), self->_languages);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  return v3;
}

- (unint64_t)hash
{
  return 257 * -[NSArray hash](self->_languages, "hash");
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_languages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
