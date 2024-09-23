@implementation TVRCPlayItemInfo

+ (id)playItemWithMediaIdentifier:(id)a3 kind:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithMediaIdentifier:kind:url:", v6, v8, 0);

  return v9;
}

+ (id)playItemWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaIdentifier:kind:url:", 0, 0, v4);

  return v5;
}

+ (id)playItemWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("KindKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TVRCURLKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaIdentifier:kind:url:", v5, v6, v8);

  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  const __CFString **v7;
  uint64_t v8;
  void *v9;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (-[TVRCPlayItemInfo hasMediaIdentifierAndKind](self, "hasMediaIdentifierAndKind"))
  {
    v13[0] = CFSTR("IdentifierKey");
    -[TVRCPlayItemInfo mediaIdentifier](self, "mediaIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    v13[1] = CFSTR("KindKey");
    -[TVRCPlayItemInfo kind](self, "kind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = (void **)v14;
    v7 = (const __CFString **)v13;
    v8 = 2;
LABEL_5:
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  if (-[TVRCPlayItemInfo hasURL](self, "hasURL"))
  {
    v11 = CFSTR("TVRCURLKey");
    -[TVRCPlayItemInfo url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = &v12;
    v7 = &v11;
    v8 = 1;
    goto LABEL_5;
  }
  return MEMORY[0x24BDBD1B8];
}

- (BOOL)isValid
{
  return -[TVRCPlayItemInfo hasMediaIdentifierAndKind](self, "hasMediaIdentifierAndKind")
      || -[TVRCPlayItemInfo hasURL](self, "hasURL");
}

- (BOOL)hasMediaIdentifierAndKind
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TVRCPlayItemInfo mediaIdentifier](self, "mediaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TVRCPlayItemInfo kind](self, "kind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasURL
{
  void *v2;
  BOOL v3;

  -[TVRCPlayItemInfo url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCPlayItemInfo mediaIdentifier](self, "mediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCPlayItemInfo kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCPlayItemInfo url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: mediaIdentifier: %@ kind: %@ url: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TVRCPlayItemInfo mediaIdentifier](self, "mediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCPlayItemInfo kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCPlayItemInfo url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithMediaIdentifier:kind:url:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCPlayItemInfo)initWithCoder:(id)a3
{
  id v4;
  TVRCPlayItemInfo *v5;
  uint64_t v6;
  NSString *mediaIdentifier;
  uint64_t v8;
  NSNumber *kind;
  uint64_t v10;
  NSURL *url;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TVRCPlayItemInfo;
  v5 = -[TVRCPlayItemInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaIdentifier = v5->_mediaIdentifier;
    v5->_mediaIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v8 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mediaIdentifier;
  id v5;

  mediaIdentifier = self->_mediaIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaIdentifier, CFSTR("mediaIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));

}

- (TVRCPlayItemInfo)initWithMediaIdentifier:(id)a3 kind:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVRCPlayItemInfo *v12;
  TVRCPlayItemInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TVRCPlayItemInfo;
  v12 = -[TVRCPlayItemInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaIdentifier, a3);
    objc_storeStrong((id *)&v13->_kind, a4);
    objc_storeStrong((id *)&v13->_url, a5);
  }

  return v13;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (NSNumber)kind
{
  return self->_kind;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
}

@end
