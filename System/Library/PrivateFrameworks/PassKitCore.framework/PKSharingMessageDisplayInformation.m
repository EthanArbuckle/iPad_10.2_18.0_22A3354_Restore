@implementation PKSharingMessageDisplayInformation

- (PKSharingMessageDisplayInformation)init
{

  return 0;
}

- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5
{
  return (PKSharingMessageDisplayInformation *)-[PKSharingMessageDisplayInformation _initWithTitle:subtitle:imageURL:openGraphURL:]((id *)&self->super.isa, a3, a4, a5, 0);
}

- (id)_initWithTitle:(void *)a3 subtitle:(void *)a4 imageURL:(void *)a5 openGraphURL:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  objc_super v16;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)PKSharingMessageDisplayInformation;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (PKSharingMessageDisplayInformation)initWithTitle:(id)a3 subtitle:(id)a4 imageURL:(id)a5 openGraphURL:(id)a6
{
  return (PKSharingMessageDisplayInformation *)-[PKSharingMessageDisplayInformation _initWithTitle:subtitle:imageURL:openGraphURL:]((id *)&self->super.isa, a3, a4, a5, a6);
}

- (PKSharingMessageDisplayInformation)initWithCoder:(id)a3
{
  id v4;
  PKSharingMessageDisplayInformation *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSURL *imageURL;
  uint64_t v12;
  NSURL *openGraphURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKSharingMessageDisplayInformation;
  v5 = -[PKSharingMessageDisplayInformation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openGraphURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    openGraphURL = v5->_openGraphURL;
    v5->_openGraphURL = (NSURL *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openGraphURL, CFSTR("openGraphURL"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("imageURL: '%@'; "), self->_imageURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("openGraphURL: '%@'; "), self->_openGraphURL);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)openGraphURL
{
  return self->_openGraphURL;
}

- (void)setOpenGraphURL:(id)a3
{
  objc_storeStrong((id *)&self->_openGraphURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openGraphURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
