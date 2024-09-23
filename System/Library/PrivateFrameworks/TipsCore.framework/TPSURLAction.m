@implementation TPSURLAction

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSURLAction;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[TPSURLAction text](self, "text", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("text"));

  -[TPSURLAction URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("href"));

}

- (NSString)text
{
  return self->_text;
}

- (NSURL)URL
{
  return self->_URL;
}

- (TPSURLAction)initWithCoder:(id)a3
{
  id v4;
  TPSURLAction *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSURLAction;
  v5 = -[TPSSerializableObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLAction setText:](v5, "setText:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("href"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLAction setURL:](v5, "setURL:", v7);

  }
  return v5;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (TPSURLAction)initWithDictionary:(id)a3
{
  id v4;
  TPSURLAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  TPSURLAction *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSURLAction;
  v5 = -[TPSSerializableObject initWithDictionary:](&v15, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSURLAction setText:](v5, "setText:", v6);

  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("attrs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "TPSSafeStringForKey:", CFSTR("href"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLAction setURL:](v5, "setURL:", v9);

  }
  -[TPSURLAction text](v5, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_8;
  }
  v11 = (void *)v10;
  -[TPSURLAction URL](v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
LABEL_6:
  v13 = v5;
LABEL_9:

  return v13;
}

- (void)setURL:(id)a3
{
  NSURL **p_URL;
  NSURL *v6;
  void *v7;
  NSURL *v8;

  p_URL = &self->_URL;
  v6 = (NSURL *)a3;
  v8 = v6;
  if (*p_URL != v6)
  {
    objc_storeStrong((id *)&self->_URL, a3);
    v6 = *p_URL;
  }
  if (v6)
  {
    +[TPSURLActionComponents componentsWithURL:](TPSURLActionComponents, "componentsWithURL:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSURLAction setType:](self, "setType:", objc_msgSend(v7, "actionType"));

  }
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TPSURLAction;
  v4 = -[TPSSerializableObject copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[TPSURLAction text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[TPSURLAction URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v6);

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSURLAction;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@"), v4);

  -[TPSURLAction text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ = %@\n"), CFSTR("text"), v6);

  -[TPSURLAction URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("href"), v7);

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
