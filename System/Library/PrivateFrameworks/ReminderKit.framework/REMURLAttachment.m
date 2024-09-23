@implementation REMURLAttachment

+ (id)cdEntityName
{
  return CFSTR("REMCDURLAttachment");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMURLAttachment;
  v4 = a3;
  -[REMAttachment encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[REMURLAttachment url](self, "url", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

  -[REMURLAttachment metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadata"));

}

- (REMURLAttachment)initWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 url:(id)a6 metadata:(id)a7
{
  id v13;
  id v14;
  uint64_t v15;
  REMURLAttachment *v16;
  REMURLAttachment *v17;
  objc_super v19;

  v13 = a6;
  v14 = a7;
  v15 = *MEMORY[0x1E0CA5C90];
  v19.receiver = self;
  v19.super_class = (Class)REMURLAttachment;
  v16 = -[REMAttachment initWithObjectID:accountID:reminderID:UTI:](&v19, sel_initWithObjectID_accountID_reminderID_UTI_, a3, a4, a5, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_url, a6);
    objc_storeStrong((id *)&v17->_metadata, a7);
  }

  return v17;
}

- (REMURLAttachment)initWithCoder:(id)a3
{
  id v4;
  REMURLAttachment *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSData *metadata;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMURLAttachment;
  v5 = -[REMAttachment initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSData *)v8;

  }
  return v5;
}

- (id)_deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMURLAttachment;
  -[REMAttachment _deepCopy](&v7, sel__deepCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMURLAttachment url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUrl:", v4);

  -[REMURLAttachment metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetadata:", v5);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  REMURLAttachment *v4;
  REMURLAttachment *v5;
  REMURLAttachment *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (REMURLAttachment *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMURLAttachment url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMURLAttachment url](v6, "url");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMURLAttachment url](self, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMURLAttachment url](v6, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[REMURLAttachment metadata](self, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMURLAttachment metadata](v6, "metadata");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[REMURLAttachment metadata](self, "metadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMURLAttachment metadata](v6, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMAttachment objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMAttachment objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMURLAttachment url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, url: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
