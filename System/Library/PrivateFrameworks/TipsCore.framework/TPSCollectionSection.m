@implementation TPSCollectionSection

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCollectionSection;
  v4 = -[TPSSerializableObject copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[TPSCollectionSection identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[TPSCollectionSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  -[TPSCollectionSection collections](self, "collections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollections:", v7);

  return v4;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)removeCollection:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TPSCollectionSection collections](self, "collections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[TPSCollectionSection collections](self, "collections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v9);
    v8 = (void *)objc_msgSend(v7, "copy");
    -[TPSCollectionSection setCollections:](self, "setCollections:", v8);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSCollectionSection;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[TPSCollectionSection identifier](self, "identifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("collectionId"));

  -[TPSCollectionSection text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("collectionTitle"));

  -[TPSCollectionSection collections](self, "collections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("collections"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSString)text
{
  return self->_text;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSCollectionSection)initWithDictionary:(id)a3 collections:(id)a4
{
  id v6;
  id v7;
  TPSCollectionSection *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSString *text;
  TPSCollectionSection *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  v8 = -[TPSSerializableObject initWithDictionary:](&v16, sel_initWithDictionary_, v6);
  if (v8)
  {
    +[TPSCollectionSection identifierForDictionary:](TPSCollectionSection, "identifierForDictionary:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    if (!-[NSString length](v8->_identifier, "length"))
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("content"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "TPSSafeStringForKey:", CFSTR("collectionTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    text = v8->_text;
    v8->_text = (NSString *)v12;

    objc_storeStrong((id *)&v8->_collections, a4);
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (TPSCollectionSection)initWithCoder:(id)a3
{
  id v4;
  TPSCollectionSection *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *text;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *collections;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  v5 = -[TPSSerializableObject initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionId"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("collections"));
    v13 = objc_claimAutoreleasedReturnValue();
    collections = v5->_collections;
    v5->_collections = (NSArray *)v13;

  }
  return v5;
}

+ (id)identifierForDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("collectionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("collectionId"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (TPSCollectionSection)initWithIdentifier:(id)a3 text:(id)a4 collections:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  TPSCollectionSection *v12;
  TPSCollectionSection *v13;
  __CFString *v14;
  objc_super v16;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  v12 = -[TPSCollectionSection init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    if (v10)
      v14 = v10;
    else
      v14 = &stru_1E39608B8;
    objc_storeStrong((id *)&v13->_text, v14);
    objc_storeStrong((id *)&v13->_collections, a5);
  }

  return v13;
}

- (BOOL)isFeatured
{
  void *v2;
  char v3;

  -[TPSCollectionSection identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Featured"));

  return v3;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)TPSCollectionSection;
  -[TPSSerializableObject debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSCollectionSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("collectionId"), v6);

  -[TPSCollectionSection text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("collectionTitle"), v7);

  -[TPSCollectionSection collections](self, "collections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@"), CFSTR("collections"), v8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
