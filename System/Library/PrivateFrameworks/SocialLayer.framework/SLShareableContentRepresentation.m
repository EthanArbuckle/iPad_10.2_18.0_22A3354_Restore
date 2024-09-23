@implementation SLShareableContentRepresentation

- (SLShareableContentRepresentation)initWithTypeIdentifier:(id)a3 preferredRepresentation:(int64_t)a4
{
  id v7;
  SLShareableContentRepresentation *v8;
  SLShareableContentRepresentation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLShareableContentRepresentation;
  v8 = -[SLShareableContentRepresentation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_typeIdentifier, a3);
    v9->_preferredRepresentation = a4;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLShareableContentRepresentation typeIdentifier](self, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SLShareableContentRepresentation preferredRepresentation](self, "preferredRepresentation");
  v6 = CFSTR("Data");
  if (v5 == 1)
    v6 = CFSTR("FileCopy");
  if (v5 == 2)
    v6 = CFSTR("OpenInPlace");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentation)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SLShareableContentRepresentation *v10;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_typeIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_preferredRepresentation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", v8);

  v10 = -[SLShareableContentRepresentation initWithTypeIdentifier:preferredRepresentation:](self, "initWithTypeIdentifier:preferredRepresentation:", v7, v9);
  return v10;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;

  v4 = a3;
  -[SLShareableContentRepresentation typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typeIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SLShareableContentRepresentation preferredRepresentation](self, "preferredRepresentation");
  NSStringFromSelector(sel_preferredRepresentation);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v7, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SLShareableContentRepresentation *v10;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_typeIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_preferredRepresentation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", v8);

  v10 = -[SLShareableContentRepresentation initWithTypeIdentifier:preferredRepresentation:](self, "initWithTypeIdentifier:preferredRepresentation:", v7, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;

  v4 = a3;
  -[SLShareableContentRepresentation typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typeIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SLShareableContentRepresentation preferredRepresentation](self, "preferredRepresentation");
  NSStringFromSelector(sel_preferredRepresentation);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (int64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

@end
