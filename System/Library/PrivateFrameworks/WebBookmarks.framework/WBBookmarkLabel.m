@implementation WBBookmarkLabel

- (WBBookmarkLabel)initWithTitle:(id)a3 address:(id)a4 pinned:(BOOL)a5
{
  id v8;
  id v9;
  WBBookmarkLabel *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *address;
  WBBookmarkLabel *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBBookmarkLabel;
  v10 = -[WBBookmarkLabel init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v13;

    v10->_pinned = a5;
    v15 = v10;
  }

  return v10;
}

- (WBBookmarkLabel)labelWithTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:address:pinned:", v4, self->_address, self->_pinned);

  return (WBBookmarkLabel *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (WBBookmarkLabel)init
{
  return -[WBBookmarkLabel initWithTitle:address:pinned:](self, "initWithTitle:address:pinned:", &stru_24CB35168, &stru_24CB35168, 0);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)isEqual:(id)a3
{
  WBBookmarkLabel *v4;
  WBBookmarkLabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;

  v4 = (WBBookmarkLabel *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBBookmarkLabel title](v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBBookmarkLabel title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        -[WBBookmarkLabel address](v5, "address");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBBookmarkLabel address](self, "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          v10 = -[WBBookmarkLabel isPinned](v5, "isPinned");
          v11 = v10 ^ -[WBBookmarkLabel isPinned](self, "isPinned") ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }

      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBBookmarkLabel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  WBBookmarkLabel *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Pinned"));

  v8 = -[WBBookmarkLabel initWithTitle:address:pinned:](self, "initWithTitle:address:pinned:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("Address"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pinned, CFSTR("Pinned"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_title, "hash");
  return -[NSString hash](self->_address, "hash") ^ v3 ^ self->_pinned;
}

- (WBBookmarkLabel)labelWithAddress:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:address:pinned:", self->_title, v4, self->_pinned);

  return (WBBookmarkLabel *)v5;
}

- (WBBookmarkLabel)labelWithPinned:(BOOL)a3
{
  return (WBBookmarkLabel *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitle:address:pinned:", self->_title, self->_address, a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_pinned)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title: %@, address: %@, pinned: %@>"),
               v4,
               self,
               self->_title,
               self->_address,
               v5);
}

- (NSString)privacyPreservingDescription
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[NSString hash](self->_title, "hash");
  v6 = -[NSString hash](self->_address, "hash");
  if (self->_pinned)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title hash: %zu, address hash: %zu, pinned: %@>"),
                       v4,
                       self,
                       v5,
                       v6,
                       v7);
}

- (BOOL)isPinned
{
  return self->_pinned;
}

@end
