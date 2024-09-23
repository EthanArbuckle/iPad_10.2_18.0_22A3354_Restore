@implementation TPSContent

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSContent;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSContent labelStyle](self, "labelStyle", v10.receiver, v10.super_class), CFSTR("labelStyle"));
  -[TPSContent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[TPSContent titleContent](self, "titleContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("titleContent"));

  -[TPSContent bodyText](self, "bodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("text"));

  -[TPSContent bodyContent](self, "bodyContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("body"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TPSContent bodyContainsLink](self, "bodyContainsLink"), CFSTR("bodyContainsLink"));
  -[TPSContent assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("asset"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSContent;
  v4 = -[TPSSerializableObject copyWithZone:](&v11, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLabelStyle:", -[TPSContent labelStyle](self, "labelStyle"));
  -[TPSContent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[TPSContent titleContent](self, "titleContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleContent:", v6);

  -[TPSContent bodyText](self, "bodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v7);

  -[TPSContent bodyContent](self, "bodyContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyContent:", v8);

  objc_msgSend(v4, "setBodyContainsLink:", -[TPSContent bodyContainsLink](self, "bodyContainsLink"));
  -[TPSContent assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssets:", v9);

  return v4;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (NSArray)bodyContent
{
  return self->_bodyContent;
}

- (int64_t)labelStyle
{
  return self->_labelStyle;
}

- (BOOL)bodyContainsLink
{
  return self->_bodyContainsLink;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitleContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLabelStyle:(int64_t)a3
{
  self->_labelStyle = a3;
}

- (void)setBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setBodyContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setBodyContainsLink:(BOOL)a3
{
  self->_bodyContainsLink = a3;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)titleContent
{
  return self->_titleContent;
}

- (TPSContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  TPSContent *v8;
  void *v9;
  NSString *v10;
  NSString *title;
  uint64_t v12;
  NSArray *titleContent;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *bodyText;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *bodyContent;
  uint64_t v22;
  NSString *v23;
  NSArray *v24;
  TPSContent *v25;
  void *v26;
  void *v27;
  TPSAssets *v28;
  TPSAssets *assets;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TPSContent;
  v8 = -[TPSSerializableObject initWithDictionary:](&v31, sel_initWithDictionary_, v6);
  if (!v8)
    goto LABEL_18;
  objc_msgSend(v6, "TPSSafeObjectForKey:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    title = v8->_title;
    v8->_title = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    title = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSString TPSSafeArrayForKey:](title, "TPSSafeArrayForKey:", CFSTR("content"));
      v12 = objc_claimAutoreleasedReturnValue();
      titleContent = v8->_titleContent;
      v8->_titleContent = (NSArray *)v12;

      if (v8->_titleContent)
      {
        +[TPSConstellationContentUtilities textRepresentationForContent:](TPSConstellationContentUtilities, "textRepresentationForContent:");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v8->_title;
        v8->_title = (NSString *)v14;

      }
    }
  }

LABEL_9:
  objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("text"));
  v16 = objc_claimAutoreleasedReturnValue();
  bodyText = v8->_bodyText;
  v8->_bodyText = (NSString *)v16;

  if (v8->_bodyText)
  {
LABEL_17:
    objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("labelStyle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_labelStyle = objc_msgSend(v26, "isEqualToString:", CFSTR("white"));
    +[TPSAssets assetsFromDictionary:](TPSAssets, "assetsFromDictionary:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[TPSAssets initWithDictionary:metadata:]([TPSAssets alloc], "initWithDictionary:metadata:", v27, v7);
    assets = v8->_assets;
    v8->_assets = v28;

LABEL_18:
    v25 = v8;
    goto LABEL_19;
  }
  objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("body"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v18, "TPSSafeArrayForKey:", CFSTR("content"));
  v20 = objc_claimAutoreleasedReturnValue();
  bodyContent = v8->_bodyContent;
  v8->_bodyContent = (NSArray *)v20;

  if (v8->_bodyContent)
  {
    +[TPSConstellationContentUtilities textRepresentationForContent:](TPSConstellationContentUtilities, "textRepresentationForContent:");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v8->_bodyText;
    v8->_bodyText = (NSString *)v22;

    if (v8->_bodyText)
    {
      v24 = v8->_bodyContent;
      v8->_bodyContent = 0;

    }
    else
    {
      v8->_bodyContainsLink = +[TPSConstellationContentUtilities contentContainsLink:](TPSConstellationContentUtilities, "contentContainsLink:", v8->_bodyContent);
    }
    goto LABEL_16;
  }

  v25 = 0;
LABEL_19:

  return v25;
}

uint64_t __25__TPSContent_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bodyContent");
}

uint64_t __25__TPSContent_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bodyText");
}

uint64_t __25__TPSContent_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "titleContent");
}

uint64_t __25__TPSContent_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

uint64_t __25__TPSContent_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assets");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

id __25__TPSContent_na_identity__block_invoke()
{
  if (TPSContentLabelStyleWhiteValue_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSContentLabelStyleWhiteValue_block_invoke_na_once_token_0, &__block_literal_global_49);
  return (id)TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyContent, 0);
  objc_storeStrong((id *)&self->_titleContent, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __25__TPSContent_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "bodyContainsLink"));
}

uint64_t __25__TPSContent_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "labelStyle"));
}

- (TPSContent)initWithCoder:(id)a3
{
  id v4;
  TPSContent *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *titleContent;
  uint64_t v16;
  NSString *bodyText;
  uint64_t v18;
  NSArray *bodyContent;
  uint64_t v20;
  TPSAssets *assets;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContent;
  v5 = -[TPSSerializableObject initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_labelStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("labelStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("titleContent"));
    v14 = objc_claimAutoreleasedReturnValue();
    titleContent = v5->_titleContent;
    v5->_titleContent = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v16 = objc_claimAutoreleasedReturnValue();
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("body"));
    v18 = objc_claimAutoreleasedReturnValue();
    bodyContent = v5->_bodyContent;
    v5->_bodyContent = (NSArray *)v18;

    v5->_bodyContainsLink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bodyContainsLink"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset"));
    v20 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v20;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __25__TPSContent_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __25__TPSContent_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0;
  TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0 = v0;

}

id __25__TPSContent_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_54);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_56);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_58);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_59);
  v5 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_60);
  v6 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_61);
  v7 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_63);
  objc_msgSend(v0, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)TPSContent;
  -[TPSContent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSContent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSContent title](self, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("title");
LABEL_5:
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), v9, v7);

    return (NSString *)v5;
  }
  -[TPSContent titleContent](self, "titleContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSContent titleContent](self, "titleContent");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("titleContent");
    goto LABEL_5;
  }
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v18.receiver = self;
  v18.super_class = (Class)TPSContent;
  -[TPSSerializableObject debugDescription](&v18, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  -[TPSContent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSContent title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("title"), v7);

  }
  -[TPSContent titleContent](self, "titleContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TPSContent titleContent](self, "titleContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("titleContent"), v9);

  }
  if (-[TPSContent labelStyle](self, "labelStyle") >= 1)
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %ld\n"), CFSTR("labelStyle"), -[TPSContent labelStyle](self, "labelStyle"));
  -[TPSContent bodyText](self, "bodyText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSContent bodyText](self, "bodyText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("text"), v11);

  }
  -[TPSContent bodyContent](self, "bodyContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSContent bodyContent](self, "bodyContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("body"), v13);

  }
  -[TPSContent assets](self, "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TPSContent assets](self, "assets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("asset"), v16);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %d\n"), CFSTR("bodyContainsLink"), -[TPSContent bodyContainsLink](self, "bodyContainsLink"));
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

@end
