@implementation TISupplementalPhraseItem

- (TISupplementalPhraseItem)initWithTitle:(id)a3
{
  id v4;
  TISupplementalPhraseItem *v5;
  uint64_t v6;
  NSString *title;
  TISupplementalPhraseItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TISupplementalPhraseItem;
  v5 = -[TISupplementalItem init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (TISupplementalPhraseItem)initWithTitle:(id)a3 phoneticTitle:(id)a4
{
  id v6;
  id v7;
  TISupplementalPhraseItem *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *phoneticTitle;
  TISupplementalPhraseItem *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISupplementalPhraseItem;
  v8 = -[TISupplementalItem init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    phoneticTitle = v8->_phoneticTitle;
    v8->_phoneticTitle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (TISupplementalPhraseItem)initWithCoder:(id)a3
{
  id v4;
  TISupplementalPhraseItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *phoneticTitle;
  TISupplementalPhraseItem *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TISupplementalPhraseItem;
  v5 = -[TISupplementalItem initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    phoneticTitle = v5->_phoneticTitle;
    v5->_phoneticTitle = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TISupplementalPhraseItem;
  v4 = a3;
  -[TISupplementalItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_phoneticTitle, CFSTR("phoneticTitle"));

}

- (id)description
{
  NSString *title;
  NSString *phoneticTitle;
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  title = self->_title;
  v18[0] = "title";
  v18[1] = title;
  phoneticTitle = self->_phoneticTitle;
  v18[2] = "phoneticTitle";
  v18[3] = phoneticTitle;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = &v18[2 * v6];
    v11 = *v9;
    v10 = (void *)v9[1];
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s=\"%@\"), v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p; %@, identifier=%llu>"),
    v14,
    self,
    v15,
    -[TISupplementalItem identifier](self, "identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneticTitle
{
  return self->_phoneticTitle;
}

- (void)setPhoneticTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
