@implementation ICRadioLibraryAlbumContentReference

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICRadioLibraryAlbumContentReference storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryAlbumContentReference representativeCloudIdentifier](self, "representativeCloudIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryAlbumContentReference albumName](self, "albumName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioLibraryAlbumContentReference: %p adamID=%@ representativeItemCloudID=%@ albumName='%@'>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)albumName
{
  if (self->_albumName)
    return self->_albumName;
  else
    return (NSString *)&stru_1E4391778;
}

- (int64_t)contentType
{
  return 1;
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioLibraryAlbumContentReference rawContentDictionaryWithSubscriptionStatus:](self, "rawContentDictionaryWithSubscriptionStatus:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("library-album"));
  return v6;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSNumber *representativeCloudIdentifier;
  NSNumber *storeIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICRadioLibraryAlbumContentReference;
  -[ICRadioContentReference rawContentDictionaryWithSubscriptionStatus:](&v10, sel_rawContentDictionaryWithSubscriptionStatus_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (-[NSString length](self->_albumName, "length"))
    objc_msgSend(v6, "setObject:forKey:", self->_albumName, CFSTR("album-name"));
  representativeCloudIdentifier = self->_representativeCloudIdentifier;
  if (representativeCloudIdentifier)
    objc_msgSend(v6, "setObject:forKey:", representativeCloudIdentifier, CFSTR("rep-cloud-id"));
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier)
    objc_msgSend(v6, "setObject:forKey:", storeIdentifier, CFSTR("album-id"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryAlbumContentReference;
  v5 = -[ICRadioContentReference copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_albumName, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSNumber copyWithZone:](self->_representativeCloudIdentifier, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSNumber copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (ICRadioLibraryAlbumContentReference)initWithCoder:(id)a3
{
  id v4;
  ICRadioLibraryAlbumContentReference *v5;
  uint64_t v6;
  NSString *albumName;
  uint64_t v8;
  NSNumber *representativeCloudIdentifier;
  uint64_t v10;
  NSNumber *storeIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioLibraryAlbumContentReference;
  v5 = -[ICRadioContentReference initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("an"));
    v6 = objc_claimAutoreleasedReturnValue();
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cid"));
    v8 = objc_claimAutoreleasedReturnValue();
    representativeCloudIdentifier = v5->_representativeCloudIdentifier;
    v5->_representativeCloudIdentifier = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v10 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioLibraryAlbumContentReference;
  v4 = a3;
  -[ICRadioContentReference encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_albumName, CFSTR("an"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_representativeCloudIdentifier, CFSTR("cid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("id"));

}

- (void)setAlbumName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)representativeCloudIdentifier
{
  return self->_representativeCloudIdentifier;
}

- (void)setRepresentativeCloudIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
