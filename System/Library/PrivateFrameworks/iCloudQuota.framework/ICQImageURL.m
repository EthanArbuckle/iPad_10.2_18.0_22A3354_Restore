@implementation ICQImageURL

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQImageURL *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQImageURL;
  v5 = -[ICQImageURL init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("1x"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
      -[ICQImageURL setURL1x:](v5, "setURL1x:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("2x"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
      -[ICQImageURL setURL2x:](v5, "setURL2x:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("3x"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
      -[ICQImageURL setURL3x:](v5, "setURL3x:", v11);

    }
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URL1x: %@, URL2x: %@, URL3x: %@"), self->_URL1x, self->_URL2x, self->_URL3x);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQImageURL *v4;

  v4 = objc_alloc_init(ICQImageURL);
  -[ICQImageURL setURL1x:](v4, "setURL1x:", self->_URL1x);
  -[ICQImageURL setURL2x:](v4, "setURL2x:", self->_URL2x);
  -[ICQImageURL setURL3x:](v4, "setURL3x:", self->_URL3x);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *URL1x;
  id v5;

  URL1x = self->_URL1x;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URL1x, CFSTR("URL1x"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL2x, CFSTR("URL2x"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL3x, CFSTR("URL3x"));

}

- (ICQImageURL)initWithCoder:(id)a3
{
  id v4;
  ICQImageURL *v5;
  uint64_t v6;
  NSURL *URL1x;
  uint64_t v8;
  NSURL *URL2x;
  uint64_t v10;
  NSURL *URL3x;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQImageURL;
  v5 = -[ICQImageURL init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL1x"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL1x = v5->_URL1x;
    v5->_URL1x = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL2x"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL2x = v5->_URL2x;
    v5->_URL2x = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL3x"));
    v10 = objc_claimAutoreleasedReturnValue();
    URL3x = v5->_URL3x;
    v5->_URL3x = (NSURL *)v10;

  }
  return v5;
}

- (NSURL)URL1x
{
  return self->_URL1x;
}

- (void)setURL1x:(id)a3
{
  objc_storeStrong((id *)&self->_URL1x, a3);
}

- (NSURL)URL2x
{
  return self->_URL2x;
}

- (void)setURL2x:(id)a3
{
  objc_storeStrong((id *)&self->_URL2x, a3);
}

- (NSURL)URL3x
{
  return self->_URL3x;
}

- (void)setURL3x:(id)a3
{
  objc_storeStrong((id *)&self->_URL3x, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL3x, 0);
  objc_storeStrong((id *)&self->_URL2x, 0);
  objc_storeStrong((id *)&self->_URL1x, 0);
}

@end
