@implementation TPSNotification

- (TPSNotification)initWithDictionary:(id)a3
{
  id v4;
  TPSNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *text;
  TPSNotification *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSNotification;
  v5 = -[TPSSerializableObject initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("title"));
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("text"));
  v8 = objc_claimAutoreleasedReturnValue();
  text = v5->_text;
  v5->_text = (NSString *)v8;

  if (-[NSString length](v5->_title, "length") || -[NSString length](v5->_text, "length"))
LABEL_4:
    v10 = v5;
  else
    v10 = 0;

  return v10;
}

+ (id)notificationFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("notification"));
}

uint64_t __30__TPSNotification_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assets");
}

uint64_t __30__TPSNotification_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "text");
}

uint64_t __30__TPSNotification_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
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

id __30__TPSNotification_na_identity__block_invoke()
{
  if (TPSNotificationAssetsKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSNotificationAssetsKey_block_invoke_na_once_token_0, &__block_literal_global_21_0);
  return (id)TPSNotificationAssetsKey_block_invoke_na_once_object_0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSNotification;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[TPSNotification title](self, "title", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[TPSNotification text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("text"));

  -[TPSNotification assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assets"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSNotification;
  v4 = -[TPSSerializableObject copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[TPSNotification title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[TPSNotification text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  -[TPSNotification assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssets:", v7);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)text
{
  return self->_text;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (TPSNotification)initWithCoder:(id)a3
{
  id v4;
  TPSNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *text;
  uint64_t v10;
  TPSAssets *assets;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSNotification;
  v5 = -[TPSSerializableObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assets"));
    v10 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__TPSNotification_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __30__TPSNotification_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSNotificationAssetsKey_block_invoke_na_once_object_0;
  TPSNotificationAssetsKey_block_invoke_na_once_object_0 = v0;

}

id __30__TPSNotification_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_26_1);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_27);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_29);
  objc_msgSend(v0, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
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
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v14.receiver = self;
  v14.super_class = (Class)TPSNotification;
  -[TPSSerializableObject debugDescription](&v14, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSNotification title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSNotification title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("title"), v7);

  }
  -[TPSNotification text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TPSNotification text](self, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("text"), v9);

  }
  -[TPSNotification assets](self, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSNotification assets](self, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("assets"), v12);

  }
  return v5;
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
