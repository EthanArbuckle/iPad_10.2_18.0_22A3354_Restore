@implementation ICQTipIconURL

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("imageURL: %@"), self->_imageURL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQTipIconURL *v4;

  v4 = objc_alloc_init(ICQTipIconURL);
  -[ICQTipIconURL setImageURL:](v4, "setImageURL:", self->_imageURL);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
}

- (ICQTipIconURL)initWithCoder:(id)a3
{
  id v4;
  ICQTipIconURL *v5;
  uint64_t v6;
  ICQImageURL *imageURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQTipIconURL;
  v5 = -[ICQTipIconURL init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v6;

  }
  return v5;
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end
