@implementation SDLegalDoc

+ (id)legalDocWithID:(int64_t)a3 title:(id)a4 content:(id)a5
{
  id v7;
  id v8;
  SDLegalDoc *v9;

  v7 = a5;
  v8 = a4;
  v9 = -[SDLegalDoc initWithID:title:content:]([SDLegalDoc alloc], "initWithID:title:content:", a3, v8, v7);

  return v9;
}

- (SDLegalDoc)initWithID:(int64_t)a3 title:(id)a4 content:(id)a5
{
  id v8;
  id v9;
  SDLegalDoc *v10;
  SDLegalDoc *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDLegalDoc;
  v10 = -[SDLegalDoc init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SDLegalDoc setLegal_id:](v10, "setLegal_id:", a3);
    -[SDLegalDoc setTitle:](v11, "setTitle:", v8);
    -[SDLegalDoc setContent:](v11, "setContent:", v9);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SDLegalDoc legal_id](self, "legal_id"), CFSTR("legal_id"));
  -[SDLegalDoc title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[SDLegalDoc content](self, "content");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("content"));

}

- (SDLegalDoc)initWithCoder:(id)a3
{
  id v4;
  SDLegalDoc *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDLegalDoc;
  v5 = -[SDLegalDoc init](&v9, sel_init);
  if (v5)
  {
    -[SDLegalDoc setLegal_id:](v5, "setLegal_id:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("legal_id")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDLegalDoc setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDLegalDoc setContent:](v5, "setContent:", v7);

  }
  return v5;
}

- (int64_t)legal_id
{
  return self->_legal_id;
}

- (void)setLegal_id:(int64_t)a3
{
  self->_legal_id = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
