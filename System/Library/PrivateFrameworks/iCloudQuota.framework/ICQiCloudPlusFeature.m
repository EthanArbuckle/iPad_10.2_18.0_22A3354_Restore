@implementation ICQiCloudPlusFeature

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("label: %@, sublabel: %@, iconURL: %@"), self->_label, self->_sublabel, self->_iconURL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQiCloudPlusFeature *v4;

  v4 = objc_alloc_init(ICQiCloudPlusFeature);
  -[ICQiCloudPlusFeature setLabel:](v4, "setLabel:", self->_label);
  -[ICQiCloudPlusFeature setSublabel:](v4, "setSublabel:", self->_sublabel);
  -[ICQiCloudPlusFeature setIconURL:](v4, "setIconURL:", self->_iconURL);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sublabel, CFSTR("sublabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));

}

- (ICQiCloudPlusFeature)initWithCoder:(id)a3
{
  id v4;
  ICQiCloudPlusFeature *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *sublabel;
  uint64_t v10;
  ICQImageURL *iconURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQiCloudPlusFeature;
  v5 = -[ICQiCloudPlusFeature init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sublabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    sublabel = v5->_sublabel;
    v5->_sublabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v10;

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (void)setSublabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
